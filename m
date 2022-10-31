Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C661378A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZK-0002HN-1N; Mon, 31 Oct 2022 09:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYn-0007y0-Ct
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0001G6-M9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id z14so15887508wrn.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avCuxU0YK7dOwSpC6nhmi+sb9xnjSlD1u004mIyxDYo=;
 b=mBEBS39cp+0RzYvjQ7+DEHBhtnDAN3r0TnpZd9t9dso44Ph9jpq1MpGbbIOhBwBHU0
 qkawS3rPBU9CAVeMvDe4ESMGxEmPyBvlKatsLWQ6tHBN67u8TFvvOO34ZiD7hNJKFE3P
 IrR6U8O2R8a8W1Q8w2pCnl1iQQF/90jwvgOEj5Y6YDBaJOE6gSYHz1neq4iXTmK/pQHl
 RcvdA2ciss/uK02LAdBXCBHLwC7EfPbLgZi5gkH8/jAaASTMVmxME8yG9WwlEMpaTYdJ
 dNHhzcUQIZHqas/rxuhLWWtsauagO6NcFzAQmSNdmnKQ+BXcwlm1QyBKidfEd8TNNrCm
 dcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avCuxU0YK7dOwSpC6nhmi+sb9xnjSlD1u004mIyxDYo=;
 b=oyGYpbKpNSV4oKkMv0QxTxbTe27yFfDmDvWaI3pIIf6j8EKsd/wdVIO1tBbSEwIEnn
 eJfLfpyrgmnF62otBs/ObFfmSZ7Auzfte7ZGN4n896RJmu9wOQIrlX8TBwsMpiu9QQVX
 rMbpH8b4Fjk0tu6tf+NgxKwuhf0bGBH/wA+lTxBQwGFVQyLJpCYWHBt2po1xZniyvzhc
 OOG0O0MLtjdGfcMlq7Lh4ZzDXtFFzYFxFHlCT/GwBZ/MJsdCQOuEDQCFkYUym5fJ0KDw
 /bs2mjb2McayyzqkoE9FXQExoayOmeSkV8+uQCzVzKtZP7rjj/A5ZYVqwenMWVOeaaSA
 x1Jg==
X-Gm-Message-State: ACrzQf1Gt7bnvnceFon+NXIuYHfpPnRLEdCZAXwMmQaiDu2H/fFnvJmk
 CuUy+nliQl9bV5gI43CfNkiB2g==
X-Google-Smtp-Source: AMsMyM5Q1a7YAhNZQJSJ3bHat+LpfvzR/nWIfCU9B5oA8UffsfcR4SEZc52UIYDSQFAmw7cs0ZVykA==
X-Received: by 2002:a05:6000:1f1a:b0:236:ce27:230a with SMTP id
 bv26-20020a0560001f1a00b00236ce27230amr2486038wrb.469.1667221826254; 
 Mon, 31 Oct 2022 06:10:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm7222305wmb.42.2022.10.31.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 078A61FFB7;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/31] tests/tcg/nios2: Tweak 10m50-ghrd.ld
Date: Mon, 31 Oct 2022 13:09:50 +0000
Message-Id: <20221031131010.682984-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

More closely follow the default linker script for nios2.
This magically fixes a problem resolving .got relocs from
the toolchain's libgcc.a.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1258
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221024035341.2971123-1-richard.henderson@linaro.org>
Message-Id: <20221027183637.2772968-10-alex.bennee@linaro.org>

diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
index 7db0d59ad7..71cdda450c 100644
--- a/tests/tcg/nios2/10m50-ghrd.ld
+++ b/tests/tcg/nios2/10m50-ghrd.ld
@@ -44,11 +44,15 @@ SECTIONS
     .data : ALIGN(4) {
         *(.shdata)
         *(.data .data.* .gnu.linkonce.d.*)
-        . = ALIGN(4);
-        _gp = ABSOLUTE(. + 0x8000);
-        *(.got.plt) *(.got)
-        *(.lit8)
-        *(.lit4)
+    } >ram :RAM
+
+    HIDDEN (_gp = ALIGN(16) + 0x7ff0);
+    PROVIDE_HIDDEN (gp = _gp);
+    .got : ALIGN(4) {
+        *(.got.plt) *(.igot.plt) *(.got) *(.igot)
+    } >ram :RAM
+
+    .sdata : ALIGN(4) {
         *(.sdata .sdata.* .gnu.linkonce.s.*)
     } >ram :RAM
 
-- 
2.34.1


