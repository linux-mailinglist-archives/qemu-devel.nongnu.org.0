Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950826B0F8C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8F-0004VG-I1; Wed, 08 Mar 2023 11:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8D-0004Tv-4K; Wed, 08 Mar 2023 11:59:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8B-00044T-Hk; Wed, 08 Mar 2023 11:59:12 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 13B6740104;
 Wed,  8 Mar 2023 19:58:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id D2CBF13A;
 Wed,  8 Mar 2023 19:58:34 +0300 (MSK)
Received: (nullmailer pid 2098330 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 26/47] hw/smbios: fix field corruption in type 4 table
Date: Wed,  8 Mar 2023 19:57:29 +0300
Message-Id: <20230308165815.2098148-26-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Julia Suvorova <jusual@redhat.com>

Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
strings which follow immediately after the struct fields have been
overwritten by unconditional filling of later fields such as core_count2.
Make these fields dependent on the SMBIOS version.

Fixes: 05e27d74c7 ("hw/smbios: add core_count2 to smbios table type 4")
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2169904

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20230223125747.254914-1-jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 60d09b8dc7dd4256d664ad680795cb1327805b2b)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/smbios/smbios.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index b4243de735..66a020999b 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -749,14 +749,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
     t->core_enabled = t->core_count;
 
-    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
-
     t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
-    t->thread_count2 = cpu_to_le16(ms->smp.threads);
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
+    if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
+        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+        t->thread_count2 = cpu_to_le16(ms->smp.threads);
+    }
+
     SMBIOS_BUILD_TABLE_POST;
     smbios_type4_count++;
 }
-- 
2.30.2


