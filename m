Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7D2D9096
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:33:49 +0100 (CET)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY3w-00055o-Be
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrt-0002sp-O8
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrs-0005bH-8G
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id 190so1721494wmz.0
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Yr9a6Psm/oyHKmjhGMfMuU1IeIspGuWtps3QIVvufw=;
 b=Vn2q1Ow1BONmjF96cTF1iuZedFmZh8/Kfc3IyYU8GUDXnVkpse/tCYcuwZtedQiIuE
 bjkdIDpBrP1LcSAEuX82fBqYt73JXehS6eaUypgRP9CPPkUXiC6xA9aYBUlAA/FTup/z
 oZ1eiAZSZ/pl6LzxvDQZpSHatnOIAGUUQ9p11vZZ+KI7OHKfUYkGdMGqlPPUFdidgj9V
 UFFTaw659ZLAyICXt5Pzn1pl1QbZUmMDglxXYfzhBhP0u15wgDoZFJrmNTF4QEWaVWVE
 VV+VR3vZC4CKms5TJh60iwujuyC/XEIQH5zmEnlmhIMb2U/4M90u5G9fEPju4pAdEHax
 csyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7Yr9a6Psm/oyHKmjhGMfMuU1IeIspGuWtps3QIVvufw=;
 b=FcHDK6XTMsiLYUUBHeNagpSjPpagU/LGHNCW6MQjBehNwKtExpbMS4a2LBLYBjG6YN
 ZHkJgsnAARNdwaeVuYccweMvj0RlH2MP0PHpMPKkmWc32LdEfceaot9tOSvKK4DLzSDD
 VNyEhwHJ6T9rASt4puymhUDPxOWX0xKktjOBOfqkcbrUfsZ4oQLvGCw11pb4MjRlxuIf
 FTTnnaIeTvn4CEoKa+05sf9Zn8SjY5vCQuS52JU7Qfkk5R5WO9Jkfxf7VQDEWzz6UPG3
 qhIHtjSNB6rJLNeUsT6EsX4N7DGEY8cyHGhMe629d42stgmNtwOH5RrydxZlL69H9FaR
 kCwg==
X-Gm-Message-State: AOAM5301EdXoKbeAUBMX3N/k9Zi9s0dnHfxv0dsPYLdHq+31EVtXDCCC
 IykeR0B8LQKIa0R1SH6LFbhpv9t6OLY=
X-Google-Smtp-Source: ABdhPJzZI3n5VAnjAGiUXhbEjHscCsJk++wli2kENHVGP8fh2ufslHZhGmxtSJPM+1FKajpsttoGSw==
X-Received: by 2002:a1c:98cc:: with SMTP id
 a195mr24641019wme.150.1607890878540; 
 Sun, 13 Dec 2020 12:21:18 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y7sm28088689wmb.37.2020.12.13.12.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] target/mips: Do not initialize MT registers if MT ASE
 absent
Date: Sun, 13 Dec 2020 21:19:38 +0100
Message-Id: <20201213201946.236123-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not initialize MT-related config registers if the MT ASE
is not present. As some functions access the 'mvp' structure,
we still zero-allocate it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201204222622.2743175-4-f4bug@amsat.org>
---
 target/mips/translate_init.c.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 5a926bc6df3..f72fee3b40a 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -993,6 +993,10 @@ static void mvp_init(CPUMIPSState *env)
 {
     env->mvp = g_malloc0(sizeof(CPUMIPSMVPContext));
 
+    if (!ase_mt_available(env)) {
+        return;
+    }
+
     /* MVPConf1 implemented, TLB sharable, no gating storage support,
        programmable cache partitioning implemented, number of allocatable
        and shareable TLB entries, MVP has allocatable TCs, 2 VPEs
-- 
2.26.2


