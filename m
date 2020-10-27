Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5429BC2E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 17:39:54 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXS0n-0007xa-QF
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 12:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kXRs6-00075O-Ok; Tue, 27 Oct 2020 12:30:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kXRs0-0001eZ-UF; Tue, 27 Oct 2020 12:30:54 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MpDa5-1k2Ycv1Kxj-00qkOe; Tue, 27 Oct 2020 17:30:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] elf2dmp: Fix memory leak on main() error paths
Date: Tue, 27 Oct 2020 17:30:07 +0100
Message-Id: <20201027163014.247336-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027163014.247336-1-laurent@vivier.eu>
References: <20201027163014.247336-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zfkWlbegQGmVbPTWCU+Etfk7R5b9h3WZDbxPY5jduOtHiItPdX5
 4armuiMFALBPi9cM0Qp/jn9oQVY9mm7+g9rHcawF2iXhivPdrg46+siAkXskfjZiVoRfAm7
 pxuUCEOSJT3G0PEnniEkICuLd3WOM611pxVvFIsgPNtTWtWTpGPzaqK1hWLBT0Dk14ka6Lf
 N6EKQQWFtIKA7eTSSxwtg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lwvXl/dr7dQ=:76Zb1rLbH3dXgwX4NmduGZ
 tXBg1Ic2ahFea/Um4BoOCtJa3eX9vcFPjjB5RO/O5/LDz3SEhjrYFsmKi/mcRQiPzKg+6jaUY
 qIhZdzqplUf+3qeDRMh6ci7szCl3HytFjQi+PBAQJdSulc4cPB0YTF+RC7DDbouKtiZiypDdl
 qCQXU39HnDYpn7F9CvPJVawFqigJlkVwqEECIRkR1RTtRBzAV4IpTrztZW9SDpSBS6AbpMVMw
 d5l1z1k/H4NanuYuMzeFRYSHufxeVUFZoonsQtTjQYbojVUkDyKKjF59ygHmfRvKd/c/EiSr0
 56x94B5fxGkdAhJSDUTkDO7+rvQ7+XTyYsrfRwLqesSxCr92AtyZEvO26wXILd3Xsl/gu1h2H
 MglL0nL2UFjzlXzSXJiQQ2NpEh45vDw0hzs0Csid7e0lVLEtTYM4hnrlxf/MT
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 12:30:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Li Qiang <liq3ea@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, AlexChen <alex.chen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

The 'kdgb' is allocating memory in get_kdbg(), but it is not freed
in both fill_header() and fill_context() failed branches, fix it.

Signed-off-by: AlexChen <alex.chen@huawei.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <5F463659.8080101@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/elf2dmp/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 9a2dbc290214..ac746e49e097 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -568,12 +568,12 @@ int main(int argc, char *argv[])
     if (fill_header(&header, &ps, &vs, KdDebuggerDataBlock, kdbg,
             KdVersionBlock, qemu_elf.state_nr)) {
         err = 1;
-        goto out_pdb;
+        goto out_kdbg;
     }
 
     if (fill_context(kdbg, &vs, &qemu_elf)) {
         err = 1;
-        goto out_pdb;
+        goto out_kdbg;
     }
 
     if (write_dump(&ps, &header, argv[2])) {
-- 
2.26.2


