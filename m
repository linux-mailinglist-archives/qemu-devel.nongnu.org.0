Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788645B8A30
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:19:38 +0200 (CEST)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTEn-0004ee-AE
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMM-00084Z-In
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMK-0000ca-O9
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z14-20020a05600c0a0e00b003b486df42a3so6403803wmp.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+jD9lKzsh1CbGMDE7cH4Ty4evA7hw2r7Od0SGTHPpGM=;
 b=kO9EoxQEqaWyJ/rQBz15iFnqQrip6/s4MRX4f5w4Qj9Yh5L+H2j3lm9pt+Ys27iafQ
 IkKj6GYa99K37Pn72sY+Ds1X22E2evcHcfpQKsMk3QJsDMQ/VIi5Hmh9CqJYNk/tho7T
 x+rJPpqzPGN6iiQDgB+qJozzf7DL601XMPe8NOQJqRi3DaZ49im0qY2PAHx8IHXrtlKw
 hFTbDfEz4pcxahYga/C6yd9lnmgeqIqk+eVSHvZ1EVWOaRFOxAyS44Cj93WSEHQMH9lY
 qh3VYZcGZdcCpLyqTxC5QiJUI+EIyMHY4dPf9t8mZ6pguq59IrB+CshIVrIHXhozQSv4
 mTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+jD9lKzsh1CbGMDE7cH4Ty4evA7hw2r7Od0SGTHPpGM=;
 b=j3EL5i1MfaUwJK3tLPqjV77lGd+4FNTNAZyd+eoIDjPZuuh/cxadtxK41/oDkrffzt
 cpcjCMDvN5hHp9i8lqTD3qcu1+sx1lP7FU+a/hmSFwoTF/G+xc7mAMjRXBOqi+m9p8BD
 6hb7aOxB5G8uGdI1ZzPHWSBOO8cHlswqSlUMCwl1WEiODbUqbhA06zvGdtuV9CnueO0G
 AAJWZKsxuKzEz+DLHAkqxz8A5ztoHgsvsMFhTLtSqauHzq97B7neM3Df7yhysWh5lwRh
 Jtbv69XEW1FVYxO6sIBGJIbr4+jXALhZlcWw7S6P6STESEGHzptKhST6QGsIohoZicf1
 bRuQ==
X-Gm-Message-State: ACgBeo0BzNEzZvgJDACid3mFuprANQg2qyg9YnfVpmwGc3bEXPvkYybq
 7B8iuHlzat8lLOoXP+0CFHuWIgtazn80M09/
X-Google-Smtp-Source: AA6agR6Py3wcAU/o9RH9SB2EzKdpC8sjJ7qauKimnnDNfY20nYG/YKA1MCyNIejoadY7sdeY1Peg1g==
X-Received: by 2002:a05:600c:2d09:b0:3b4:7ff0:ae89 with SMTP id
 x9-20020a05600c2d0900b003b47ff0ae89mr3073236wmf.163.1663161798630; 
 Wed, 14 Sep 2022 06:23:18 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/11] target/nios2: Honour -semihosting-config userspace=on
Date: Wed, 14 Sep 2022 14:23:06 +0100
Message-Id: <20220914132308.118495-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

nios2 semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822141230.3658237-6-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index ff631a42f6..8dc0a32c6c 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -817,8 +817,9 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
 {
 #ifndef CONFIG_USER_ONLY
     /* The semihosting instruction is "break 1".  */
+    bool is_user = FIELD_EX32(dc->tb_flags, TBFLAGS, U);
     R_TYPE(instr, code);
-    if (semihosting_enabled(false) && instr.imm5 == 1) {
+    if (semihosting_enabled(is_user) && instr.imm5 == 1) {
         t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
         return;
     }
-- 
2.34.1


