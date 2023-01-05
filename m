Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1265F21D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTL2-0006vc-5L; Thu, 05 Jan 2023 11:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL0-0006t9-2J
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKt-0006wP-I7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso2533789wmb.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVDgWVfU9UuFFIzuYyi6pmmim2xRdLyJJ3WToGnxjwc=;
 b=uthMc/2Q1iZ3HRZvJA8mMWbATqkfzlwfMLQQfthPEdUE45PO5xBYMSwducWMJ2TOvM
 5Koq+ATLBkOtcS1nCATIC38iFhnt0/JYtwHig2x2UAF8yufpbWFq/wogmfdrwR5/rIga
 Snt6An5Bj7KGDb7fP2LVZpJzMp7Utzc4MOYpmSJqbQRG44aDJDHTHAB0y/eOdenTsOpO
 29naaPUgVvXyCwexDN53LXCN5+ySljNqNidu3G0FZ7SfaaqMbtUwSeOJgTdxJb3f8cAL
 eCkgMQ3qLZ09wsemVk6LhFBAKaOJtLz3AJ8RvsUPlkfBI0QvtRcFgZzLI6A0LjC4B5ZV
 48JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVDgWVfU9UuFFIzuYyi6pmmim2xRdLyJJ3WToGnxjwc=;
 b=oJfpxG/nPLZIzLr6GPZQnfya/a3xwkh6nx98gdHPBje6V1sY9Vs0PmUOVeruS7zJSq
 9l/U1u9RvdP0MzbDtv/DRumnZo5zA3RgtiQB+Ox4WZBsrGB9K635h0QnzQrf+nMnQkuG
 2VGQrCHWwFQlyBF5bqpvEBLeZf6yabHUpSTBnrn0gHvWmFKjYYYO36nXiEE9bE3v1Ra6
 vVXFf/BcT+3odcK0jxtMBXmepaKe+xArICJAz+gMIDDkh04JIIjNv1cXY8ltBlKAmQJE
 FqRhYlDh5dZ6zmM27sJUsyUiTsgfl52UMDlYVnFAgiMTS76mz2FRyfwRUmWZ/LXlmKWI
 wgnA==
X-Gm-Message-State: AFqh2kodHTLt9VzB0XoKkuRIUQJIXBzpa1XOZqo28psbSwkJz7RAfUTM
 GJp+jQUg454stRvuaZio8DCQlw==
X-Google-Smtp-Source: AMrXdXsvLQatva7Ex5ZRDF8FTPU2gDkvGfc0OZUrNay7bV0Yd4XvFgjgnX+VPZ/7uwnEf6BCSyrsRA==
X-Received: by 2002:a7b:ca4f:0:b0:3d3:56ce:5673 with SMTP id
 m15-20020a7bca4f000000b003d356ce5673mr39139973wml.6.1672937001907; 
 Thu, 05 Jan 2023 08:43:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g41-20020a05600c4ca900b003cfd0bd8c0asm2675127wmp.30.2023.01.05.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C1F31FFBA;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 02/21] target/arm: fix handling of HLT semihosting in
 system mode
Date: Thu,  5 Jan 2023 16:43:01 +0000
Message-Id: <20230105164320.2164095-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The check semihosting_enabled() wants to know if the guest is
currently in user mode. Unlike the other cases the test was inverted
causing us to block semihosting calls in non-EL0 modes.

Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=on)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 74a903072f..1dcaefb8e7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1184,7 +1184,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled(s->current_el != 0) &&
+    if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
-- 
2.34.1


