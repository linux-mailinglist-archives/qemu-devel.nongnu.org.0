Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7951119D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:49:27 +0200 (CEST)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbUM-0005uo-1U
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1njbNZ-0004Td-2V; Wed, 27 Apr 2022 02:42:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1njbNX-0007I1-1b; Wed, 27 Apr 2022 02:42:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d15so775041plh.2;
 Tue, 26 Apr 2022 23:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZB03v0Yv8zpfBi6QNE3GX8uIUR9pGnGVuq1qv7TKac=;
 b=IzB6YE96N21afmSpuW/x6g6m8uevmuhCdllHwtBEphH+iKq5Q91neTBCRkHL/rtMe7
 aTrvSw8gaZ0FEsE5nw8kHhsLfhdJ9K6GubahU4LZEvHwl03QKVxw41HLj+CxprJH/agt
 WOshCqpmfavfNuIImfZF3xatN722svBBojN2jdzK8oUmBkksKLoC7t4JQXLkikpLCJS4
 CUChjxKJtyA7PZTUMsZ+Dcnog6GJtJJZHPQCUVOTXHs2q5m+YTXgxqxdzPEnt1QBgiWa
 Q6dLzRyEWVXp/MVU0QLVnqvtWZ5XXMkdIBSxFZisxJEzoCg7rAj+i0zWAJjKiSCAjuF7
 ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hZB03v0Yv8zpfBi6QNE3GX8uIUR9pGnGVuq1qv7TKac=;
 b=ET9BmNmdpvV/X7Df+TTXKmIdvWDB6uBWcKUWMLllhTt3Fjby7zJkiLo8PtliVJyvgt
 P0vgHbxNtX/1eMLMdLhQcWA552UAgT2KNFw1PQ1mwq2FIx417Yg1MnZL0kNLJtqu37RJ
 BNp/3DqMOW6iRELulgmzN53jCuQcvCch0ZnEhwIfsWua6qv13xYA3RCdt119yJiJ9Qsq
 /zvVCh7G+OEhoegiknYyO8EzXLDumClgXJT0QPaysHcd5EZjsHfjFurYifocJlHvCqKh
 EZo0ktRa+PPj2xP3tcLvbWfQRPLaku+i8ekks9QrvuWQ68DGispytG7S02kbyJcOVpHg
 AXYA==
X-Gm-Message-State: AOAM5337xdoHPUfTPFMRm7r69+N/tfOlSg5tHpKBfLhXnfkJzUeRXkb5
 qz9iGUC37mpANpwgIxlmIGc=
X-Google-Smtp-Source: ABdhPJznE2z+jr3yaGWhSVKOQyyHCiQgC2EvgLXsqsfo8gvpNqnTFKC1Z3A3ytl69MrvoWWliZJJCQ==
X-Received: by 2002:a17:90b:164b:b0:1d1:b0b7:9033 with SMTP id
 il11-20020a17090b164b00b001d1b0b79033mr31293949pjb.164.1651041740971; 
 Tue, 26 Apr 2022 23:42:20 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15038100pgt.28.2022.04.26.23.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 23:42:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Laurent Vivier <laurent@vivier.eu>,
	lucas.araujo@eldorado.org.br
Subject: [PATCH] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Date: Wed, 27 Apr 2022 16:12:04 +0930
Message-Id: <20220427064204.373027-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are new hwcap bits added for power10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
MMA support for TCG is on the list so I think it makes sense for this to
land after those are merged.

I tested my patch with this program:

 https://github.com/shenki/p10_tests

$ qemu-ppc64le -cpu power10  -L ~/ppc64le/ ./test -c
HWCAP: 0x58000580 HWCAP2: 0x8ee60000
ISAv3.1: Yes
MMA: Yes

$ qemu-ppc64le -cpu power9  -L ~/ppc64le/ ./test -c
HWCAP: 0x58000580 HWCAP2: 0x8ee00000
ISAv3.1: No
MMA: No

 linux-user/elfload.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974e5..0908692e62b3 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -779,6 +779,8 @@ enum {
     QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
     QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
     QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
+    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
+    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
 };
 
 #define ELF_HWCAP get_elf_hwcap()
@@ -836,6 +838,8 @@ static uint32_t get_elf_hwcap2(void)
                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
                  QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
+    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
+                 QEMU_PPC_FEATURE2_MMA);
 
 #undef GET_FEATURE
 #undef GET_FEATURE2
-- 
2.35.1


