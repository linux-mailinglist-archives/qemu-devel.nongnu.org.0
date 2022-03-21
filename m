Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F168D4E2AE9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:34:54 +0100 (CET)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJ7V-0002yc-K6
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:34:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWJ6Z-0002Jg-Pp
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:33:55 -0400
Received: from [2a00:1450:4864:20::529] (port=43949
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWJ6X-0007fD-QC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:33:55 -0400
Received: by mail-ed1-x529.google.com with SMTP id b24so18050453edu.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKI4o3Uyi6+0rR6FdNfTHfNiYxgnnwwsGGd+FolDfEs=;
 b=lji1z1YpejO2YEG0Kea4wALK2LaEYFKww7aVtRmbS6DmlUFsZZhew7eTw4MzpsMrjK
 B/Yg/vPShO2Jsw7tj9LEIVFQUeMu6+3jjQ9sdNsMZ7CE14SSiPIXypQpCkGjWMGAULad
 zvu1N8Hw2B4pxbvxPFq055GUuVAl24KXVS5mMRioMUyQ9kOMsz7xOpDXFo4fOmC56glF
 hN2cB+gudKNWbxEPDGyRq3bHsUMXvmz/M9V5PC5e3RUUYsp0A3Rs79f4RnPRBM1M8dlG
 UsLkkbQiSXiyiKF6O0CrYQwmVHeTCeEhHxv/suoCNNoOMQGB/Mv8080zIorFosmYk7yV
 u4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JKI4o3Uyi6+0rR6FdNfTHfNiYxgnnwwsGGd+FolDfEs=;
 b=FqkE5R89WrKllZyhpjhIYLIAwvIEaT0R6VnlzRjv1DRnDa8mNf923hSiia8MpnNxfj
 mE5NjtXbtaZDe5Loj8X7L7booDZIAnKihIE622f6UEKbrLiXq1H0vnq++gYGWtXKFy72
 D07wkS+AeZJtBjUPTAqPXRfrzWD7uIMqkkPIo+NTKynaZALJXS4QjlfTcaStR7eRRB9O
 G0fxhTsnAq2bnNO/N+bVDquWRfQsQaA15iXgFjnmPRqNOvr8RLdbJFT9PRZht+uQ8tVi
 EyRNJv8h8d0C48Auh17CQdXbqANg2dcBwyXA1VGUVRMBhX5oZxlnl2mIptHMjP5lr9YI
 d8gw==
X-Gm-Message-State: AOAM533raQtbnxMyXFPtwHxeFjyoZxaYOONxVA7AX+plUYRqUFtVxFDz
 o/7CtRaQTyNt5eTBeE3R3LQLZgD71iA=
X-Google-Smtp-Source: ABdhPJz0m65oJ6TlkzI0ABjSwd5Ocb7CLJjoA6RR/cDs6/b25vjTkBEjcLPoIlnKdzEsJFul6xV9nw==
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id
 q9-20020a50cc89000000b004008f8299e8mr23308027edi.7.1647873229545; 
 Mon, 21 Mar 2022 07:33:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05640250d100b004185745f856sm8034848edb.74.2022.03.21.07.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 07:33:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC
 12
Date: Mon, 21 Mar 2022 15:33:46 +0100
Message-Id: <20220321143346.156481-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Be more explicit that the loop must roll at least once.  Avoids the
following warning:

  FAILED: libqemu-x86_64-softmmu.fa.p/hw_i386_amd_iommu.c.o
  In function 'pte_get_page_mask',
      inlined from 'amdvi_page_walk' at hw/i386/amd_iommu.c:945:25,
      inlined from 'amdvi_do_translate' at hw/i386/amd_iommu.c:989:5,
      inlined from 'amdvi_translate' at hw/i386/amd_iommu.c:1038:5:
  hw/i386/amd_iommu.c:877:38: error: 'oldlevel' may be used uninitialized [-Werror=maybe-uninitialized]
    877 |     return ~((1UL << ((oldlevel * 9) + 3)) - 1);
        |                      ~~~~~~~~~~~~~~~~^~~~
  hw/i386/amd_iommu.c: In function 'amdvi_translate':
  hw/i386/amd_iommu.c:906:41: note: 'oldlevel' was declared here
    906 |     unsigned level, present, pte_perms, oldlevel;
        |                                         ^~~~~~~~
  cc1: all warnings being treated as errors

Having:

  $ gcc --version
  gcc (Debian 12-20220313-1) 12.0.1 20220314 (experimental)

Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/amd_iommu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 4d13d8e697..6986ad3b87 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -913,7 +913,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
         }
 
         /* we are at the leaf page table or page table encodes a huge page */
-        while (level > 0) {
+        do {
             pte_perms = amdvi_get_perms(pte);
             present = pte & 1;
             if (!present || perms != (perms & pte_perms)) {
@@ -932,10 +932,7 @@ static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
             }
             oldlevel = level;
             level = get_pte_translation_mode(pte);
-            if (level == 0x7) {
-                break;
-            }
-        }
+        } while (level > 0 && level < 7);
 
         if (level == 0x7) {
             page_mask = pte_override_page_mask(pte);
-- 
2.35.1


