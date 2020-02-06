Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8E154291
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:04:29 +0100 (CET)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izexQ-0002D2-EK
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1izeoV-0003IS-8j
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1izeoT-0007mA-W0
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:15 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1izeoT-0007f2-NR
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:13 -0500
Received: by mail-wr1-x444.google.com with SMTP id w12so6599317wrt.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 02:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3c3EvuPkQufAHbcgB8h+MIkSkNZlepIUjJhageqja4=;
 b=VbUmmmGHGfcTc+wf6q59mf9NmorXImCr4IsaTVXp9HG7IbzS0OuCRFivIB+Sz1zKR/
 j5Oikeq5K/+3IL11q+s16r5oMZcnFxu6Igz1ghYqe/DsRlGD3G5MIDtbn3cG+mx0OF4w
 QvH8HOhsVpGJc97bdck/BH9C/ijrREu2WAxS4g/LoCJDC5o7LaT7efyM4vPGiHxcejp9
 24sdo+uPBSjsGtZcxEEkp9nK6r1+uJ/mbOKu5GanCBtoU9p78tAq+uEmgAs4yBjXOzLm
 jUFq+gDFZN3UV31uMjP4CjzpsM5+frQU/H4jXQHUMxI9cVUB1F2JSX27u4+e7L0PvG7U
 Rmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3c3EvuPkQufAHbcgB8h+MIkSkNZlepIUjJhageqja4=;
 b=qjJjkx6xqi/Einbpl9rKmrGE9r5UjVo2Vf9M2i3SpFxlhQzQjpFesU5sske+xLxHOQ
 FTnzhMpJDPOroZgHJGuPqqB0SiECre+xLayjJAVVMhLTwe6ejiuzShIHuzpY4hW9WStQ
 ad0+5fyejSERIlekHYhYtxoq2jjqM+m4QEwiW/FmwN9kt2Acdz3oipGopAT3wzrwTQ/i
 fODfnwb/7hRjuqf0AwY3t6RD+PVkW37+46pWN9BH7hIPKyq4w7iQlndaWRB5ITjVzMRp
 +/d0bmEzv1Et64GMQNY0TCHL7sp0kCCF1236BQWaIzn8UQoStMvUN2rbxwG0lnmJ4dG8
 rrrw==
X-Gm-Message-State: APjAAAV/CIj9H4N9L13e8gUSTCvX18I/iVuHt5vyfM5VCWyiGiwpEXE0
 QSNYEEjiwrvC2cdl3Z+3AVpudHUgmwe7Cw==
X-Google-Smtp-Source: APXvYqz4MQCqJ5uCIbQ82Dk5k6tZBfh+k8xnY2daOQKuOD4sCk6v/7dHOvKtX+l/8n7yIH3TPPVYqA==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr2963595wrx.285.1580986512491; 
 Thu, 06 Feb 2020 02:55:12 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id m21sm3364995wmi.27.2020.02.06.02.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 02:55:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/41] target/arm: Update define_one_arm_cp_reg_with_opaque
 for VHE
Date: Thu,  6 Feb 2020 10:54:34 +0000
Message-Id: <20200206105448.4726-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206105448.4726-1-richard.henderson@linaro.org>
References: <20200206105448.4726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For ARMv8.1, op1 == 5 is reserved for EL2 aliases of
EL1 and EL0 registers.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 992ab2a15f..2aa04d0613 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7586,13 +7586,10 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
             mask = PL0_RW;
             break;
         case 4:
+        case 5:
             /* min_EL EL2 */
             mask = PL2_RW;
             break;
-        case 5:
-            /* unallocated encoding, so not possible */
-            assert(false);
-            break;
         case 6:
             /* min_EL EL3 */
             mask = PL3_RW;
-- 
2.20.1


