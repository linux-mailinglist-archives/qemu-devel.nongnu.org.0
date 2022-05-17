Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4752A4D8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:29:01 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyC4-00030r-FZ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dzejrou@localhost>) id 1nqwbx-0004Iz-91
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:47:38 -0400
Received: from [2a02:8308:500a:1200:d1bd:1fe9:3a92:4bbd] (port=32844
 helo=localhost) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dzejrou@localhost>) id 1nqwbv-0006Rf-1V
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:47:36 -0400
Received: by localhost (Postfix, from userid 1000)
 id BA785E72CD; Tue, 17 May 2022 14:39:32 +0200 (CEST)
From: dzejrou@gmail.com
To: qemu-devel@nongnu.org
Cc: Jaroslav Jindrak <dzejrou@gmail.com>, david@redhat.com, imammedo@redhat.com
Subject: [PATCH] hostmem: default the amount of prealloc-threads to smp-cpus
Date: Tue, 17 May 2022 14:38:58 +0200
Message-Id: <20220517123858.7933-1-dzejrou@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2a02:8308:500a:1200:d1bd:1fe9:3a92:4bbd (failed)
Received-SPF: none client-ip=2a02:8308:500a:1200:d1bd:1fe9:3a92:4bbd;
 envelope-from=dzejrou@localhost; helo=localhost
X-Spam_score_int: 74
X-Spam_score: 7.4
X-Spam_bar: +++++++
X-Spam_report: (7.4 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 FSL_HELO_NON_FQDN_1=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 HELO_LOCALHOST=3.828, NML_ADSP_CUSTOM_MED=0.9, RDNS_NONE=0.793, SPF_NONE=0.001,
 SPOOFED_FREEMAIL=1.522, SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.799,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: reject
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jaroslav Jindrak <dzejrou@gmail.com>

Prior to the introduction of the prealloc-threads property, the amount
of threads used to preallocate memory was derived from the value of
smp-cpus passed to qemu, the amount of physical cpus of the host
and a hardcoded maximum value. When the prealloc-threads property
was introduced, it included a default of 1 in backends/hostmem.c and
a default of smp-cpus using the sugar API for the property itself. The
latter default is not used when the property is not specified on qemu's
command line, so guests that were not adjusted for this change suddenly
started to use the default of 1 thread to preallocate memory, which
resulted in observable slowdowns in guest boots for guests with large
memory (e.g. when using libvirt <8.2.0 or managing guests manually).

This commit restores the original behavior for these cases while not
impacting guests started with the prealloc-threads property in any way.

Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
---
 backends/hostmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index a7bae3d713..624bb7ecd3 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
     backend->merge = machine_mem_merge(machine);
     backend->dump = machine_dump_guest_core(machine);
     backend->reserve = true;
-    backend->prealloc_threads = 1;
+    backend->prealloc_threads = machine->smp.cpus;
 }
 
 static void host_memory_backend_post_init(Object *obj)
-- 
2.30.2


