Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA03C9F61
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:21:46 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41JB-0003ts-3i
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1m3ymc-0001Et-9E
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:39:58 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1m3yma-0002KE-Mg
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:39:57 -0400
Received: by mail-pg1-x532.google.com with SMTP id y4so5707242pgl.10
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1rsa/Sc8Rl//xbiORFj+KjXsMrXTtZFWkAbleB9LyOM=;
 b=QZ0t15fhgX2AIiPbVTzjb3ROJP5Gi7ZYX/HPjhooo4pekuVpJRFmB55O/yMPavcoDI
 PiabT2Gc91TQe4FUTJ1qj2i3jNidFD5dXCCQsNDJoq1lDGynx8oSQJd+eEVyOPBEzYXL
 aQuoSkRXOElDvCgkZA9QzdcGayFF6WyQiBDRdMv26bFsLmJy5mQenLGPQG0BlJX6VXhR
 /0r6wcIXcrAnmVkbBXulLuaZ2pSopu3so0kpJULJ2652KDofcfvEOLwTDkWuhfg8b5aI
 dsV8rLWMZosHRYKK74ku3PAGVIt5PZR+lLAi+zLQeM1+YIMj9lQIPnvLYB77im1VyHF+
 otlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1rsa/Sc8Rl//xbiORFj+KjXsMrXTtZFWkAbleB9LyOM=;
 b=bQXuq7zaLMGuG7UzwhWQxIqldAPCIVYPfwBezioHSdygp5oSIRqJ5snM/kIzpUpVnZ
 dWbxfCNJYK1VndOTH+Ljtt/MHRtGxbmdZeZVaWC8y+nb3M8Z0V/qqkv6ugvxMK6UVMps
 o02o7P9ngK8mG7MtAVT7NLrscBoJlQ06SMVg2JV8zV3tYxcDCk83ZYg48t+Z6VaTPkKt
 BdVu5W0O9Gn1aKvTcC5ipLnWAdqQUlA9qE3cxlU4e6QppbkMzwdElwIWU2XuSg4RhJHU
 P1GI8lhcA29CR2P2lV7Sh7+fVFRXMGZRqyq647r38uvBBxEKhX25OUOxrUQcbRw4H+7J
 4A0g==
X-Gm-Message-State: AOAM531r8bGK/7SBBDAv9kZgKLpCI2trkZQWV0V8mnMbjSEfMLnWUztV
 g5Kkv7vumFDOsvNzOqMlvMo=
X-Google-Smtp-Source: ABdhPJxd3BPPSR/9X91SMlDMlliFMLHhQgRPOjwX/K01MYcK7gsgS3Ca05UODxQyOIcHZSTKJxwe8A==
X-Received: by 2002:a63:ff4f:: with SMTP id s15mr3949949pgk.193.1626345594682; 
 Thu, 15 Jul 2021 03:39:54 -0700 (PDT)
Received: from localhost.localdomain ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id lt15sm8820982pjb.1.2021.07.15.03.39.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:39:54 -0700 (PDT)
From: Like Xu <like.xu.linux@gmail.com>
X-Google-Original-From: Like Xu <likexu@tencent.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] target/i386/cpu: Use the KVM reported value for the number of
 ASIDs
Date: Thu, 15 Jul 2021 18:39:45 +0800
Message-Id: <20210715103945.95004-1-likexu@tencent.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=like.xu.linux@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Jul 2021 09:18:44 -0400
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Like Xu <likexu@tencent.com>

If KVM is enabled, use the supported number of address space identifiers
(ASIDs) by the CPUID Fn8000_000A_EBX instead of hard-coding it to 0x10.

Signed-off-by: Like Xu <likexu@tencent.com>
---
 target/i386/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48b55ebd0a..959c4425a4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5523,7 +5523,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x8000000A:
         if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
             *eax = 0x00000001; /* SVM Revision */
-            *ebx = 0x00000010; /* nr of ASIDs */
+            /* nr of ASIDs */
+            if (kvm_enabled()) {
+                *ebx = kvm_arch_get_supported_cpuid(cs->kvm_state,
+                                                    0x8000000A, 0, R_EBX);
+            } else {
+                *ebx = 0x00000010;
+            }
             *ecx = 0;
             *edx = env->features[FEAT_SVM]; /* optional features */
         } else {
-- 
2.32.0


