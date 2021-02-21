Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AC320B00
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:41:16 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpv9-0003ow-6p
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpq5-0006sY-Go
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpq4-000311-1z
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p3so1047708wmc.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0/ujJTeBMNKa2bOzyTsl8jur83d23ulbZmLvhVWOXE=;
 b=duvzXNJ48QDW9hlzkMFxS+nwJtQYqaQY3K57JeT6iaIqQWIrxgxUkqvBefo6VPGYyh
 bGleEsPHvtDUMfhfeu8NXuT2HAtpeeTRMHSgeAJcx+s0KYwEfTnBNxyUa/o0Ssg0i1dW
 8lrVHTc1A+c0mxnckabgfhM8FySH9tTFS9IUzuTTjqpfoVdY29Ww5xBjRlWRI7gxEQJ3
 3/Qt4TTpTwQLMBEg1lhUHTGmw0X1dElbSSbxaxoG+NBp8qIg6KFWCijBwscNnM8pKOja
 EdSzk+RbFzzbxO/ExHplolq1s6kryzH9yXgs99YG4b/DnJ4DF1ls1hqPIGUPEQHAoVna
 OVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A0/ujJTeBMNKa2bOzyTsl8jur83d23ulbZmLvhVWOXE=;
 b=g0ymxBL8NFlthB31dmoyv8L8WyrKNuUoQ1kCp6A+MbpHQISiPuWxTqblNNqyM3iZg9
 4UCCqiBqgLxqI1cWqMjKx1sirEgZ4AUq5tLrehf/YZphxhTfj7HQRXnfWuj6ZrGGMQ+i
 5SCNjij1FboX7rxHLsbNkf48xdsYfmg6/JCMOyEKJipCxbnFs9uZaGJlBwgYeAH3PWT3
 nX2OfSwXJPJd/KQ/dWyB0mKjDUe0kU9hGajI/wjuDeAVe4PZPRlC+hE3T48wjH6qgK6A
 nfIyq98cPkfl6hE4RYmUnE/mCRmja75e4cb2QiFvbUxN0xJeccFhcRcfXyhDNkYoO5J2
 xbQw==
X-Gm-Message-State: AOAM532lo+0V26GjOSfH55mi/mBzctLukqM+Dox0S48FsIAbBUZB2nbS
 vo1XMKcoiosG7srDAXZbVsaOEdE0GNM=
X-Google-Smtp-Source: ABdhPJybQ2IL8sgBHY5alJHiietVAA3el1eZDu43P2Ybe7uQk7W/N+xpze9hwEL+4SFhE1Ejnmsu8A==
X-Received: by 2002:a1c:7f46:: with SMTP id a67mr16129407wmd.94.1613918158661; 
 Sun, 21 Feb 2021 06:35:58 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm24926189wrv.20.2021.02.21.06.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/43] target/mips: Let raise_mmu_exception() take
 MMUAccessType argument
Date: Sun, 21 Feb 2021 15:34:06 +0100
Message-Id: <20210221143432.2468220-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both mips_cpu_tlb_fill() and cpu_mips_translate_address() pass
MMUAccessType to raise_mmu_exception(). Let the prototype use it
as argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-11-f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 9bb635885dd..0ad2d51b11c 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -405,12 +405,12 @@ void cpu_mips_tlb_flush(CPUMIPSState *env)
 #endif /* !CONFIG_USER_ONLY */
 
 static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
-                                int rw, int tlb_error)
+                                MMUAccessType access_type, int tlb_error)
 {
     CPUState *cs = env_cpu(env);
     int exception = 0, error_code = 0;
 
-    if (rw == MMU_INST_FETCH) {
+    if (access_type == MMU_INST_FETCH) {
         error_code |= EXCP_INST_NOTAVAIL;
     }
 
@@ -419,7 +419,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     case TLBRET_BADADDR:
         /* Reference to kernel address from user mode or supervisor mode */
         /* Reference to supervisor address from user mode */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_AdES;
         } else {
             exception = EXCP_AdEL;
@@ -427,7 +427,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_NOMATCH:
         /* No TLB match for a mapped address */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
@@ -436,7 +436,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_INVALID:
         /* TLB match with no valid bit */
-        if (rw == MMU_DATA_STORE) {
+        if (access_type == MMU_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
-- 
2.26.2


