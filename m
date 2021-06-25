Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA7A3B40F3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:55:07 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiYE-0004Ze-8J
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4f-0006Gw-Ks
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4e-00029A-25
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id b3so9815568wrm.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnVMC6KQbRUPT2iCc62lO26HFbbEhTwhTfNAPgbW2dw=;
 b=qgAELLmh8rIKRaExqIOpOuLzMt+0hK+PHh/WAUp/sjLHBS/auZ487mBbCsp91k9emT
 QWPJ2YXwfrXDQhg2LFP9KOKcMpLaqGUNqFeShyNFnCdJuFN1SYrGG7Ugl0X1zEDR9Z6/
 QBzYPpZtY8AhJ8g1kIlCOlT9J5R+I3SmjvHI7YJZiZiweiYfbg9URg4vujK3FouS+Lxl
 DCANJNpzM6XC6OCnIkUxkO8GAtvwBpTf5LcuakCE1Ow0424bUCDXa9SGT/BzXMlX2S23
 iva13/BORetnVJKs8Mwb1xzoDtfreB6unBzYGKNZYUKzdiv8LcXvHsKwrrvb7v1zU9WM
 CS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XnVMC6KQbRUPT2iCc62lO26HFbbEhTwhTfNAPgbW2dw=;
 b=OD12A/0Qyh1Plj/2EJBS5T6c9racVM0mdDYqQLaJuIyKGVKy2Qz+SrFY8Sil8QMiwE
 QVzykPRgxL6A7IIsojtyEJAXJ3i09bk/anWh2no5P7ifQ2anqRU3pBiOoLM8yrIkeE48
 araWc92K/BeYWVgIUotCdHBwBDrb6BMekPgT20UrZOrj6iMHsfmPyJXFYgQcgbtt1XWw
 mu7nY6ihJr3HJh6r64xPKI7kwn0NrxYKVXZrWGxg5CRpkhBhgF+Y7hdQQhju068IZQbk
 LHRHUNzdsDOUH8KnO0LJhm8OHPxXpH7KQwLkb7oYmiiF7YSstznWhjPKKaUWhPmAqEnl
 8wUg==
X-Gm-Message-State: AOAM532eUVXUlxlR6xk1QTtUnMs6K3YHvsCYVxPFJnK6TZPbW3y8WZ7J
 vOn7U9YarDgU+wRigRqDjoptnSzaKepKbA==
X-Google-Smtp-Source: ABdhPJysOrfmHQoZ8ydqj7nOsyXiN8qjPg+jEcHkFu+Yt/d+WLnYvlQ9jZ/Ef421XUmnj0Hm0svraA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr9930651wri.5.1624613070467;
 Fri, 25 Jun 2021 02:24:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s18sm5661045wrw.33.2021.06.25.02.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] target/mips: Constify host_to_mips_errno[]
Date: Fri, 25 Jun 2021 11:23:26 +0200
Message-Id: <20210625092329.1529100-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep host_to_mips_errno[] in .rodata by marking the array const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-9-f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 6de60fa6dd7..77108b0b1a9 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -75,7 +75,7 @@ enum UHIOpenFlags {
 };
 
 /* Errno values taken from asm-mips/errno.h */
-static uint16_t host_to_mips_errno[] = {
+static const uint16_t host_to_mips_errno[] = {
     [ENAMETOOLONG] = 78,
 #ifdef EOVERFLOW
     [EOVERFLOW]    = 79,
-- 
2.31.1


