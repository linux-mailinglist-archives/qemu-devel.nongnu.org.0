Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5CF584E51
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:43:47 +0200 (CEST)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMX3-0001m3-IJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA4-0002Vr-I6
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA2-0005sy-Tn
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i10-20020a1c3b0a000000b003a2fa488efdso1600164wma.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CI2B5ZVJoTazFK681pZ94MwKHGJqZMA5i4E0K05POYU=;
 b=ZQL0/8xif3s7kPiKkVlNFFqMfrdbHCXSAoTEkrztckLNH7aLSr5xqcQbpmsTp/URDJ
 j3BSES1pKnt7gu9RbbaHA+W+HEYRJAyI5O5sXaO/xCkcMnzlpm82EQrCc6Qou/JKuJDX
 5VHUty0AYW0hlFq7tKxxF/+Z0W1L8INwOLDXly5jxKR5akv6YNKjjyEU3JuAdmEOUDe1
 PtsncnqXRvIujqSsTruLwjqmHyd0ztzchA4LPfFQRNjklkCtfojhUmIvPyl/9lVO1m7n
 d1LWgQT6DmPHdvF5jDzcwg9SQIy4d2LZXnGaFcG/dvrbvz61XyFlL3L21jOz7uQ61IFd
 WAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CI2B5ZVJoTazFK681pZ94MwKHGJqZMA5i4E0K05POYU=;
 b=zlkX1Jm3eADp3jbno1eYglDhgACIc0md/CrM1N1AFy0czEHlK2QS217SirUo82MVP1
 /7ON1ECZ/Sh6bGaP0psEZESxJg3jz3W+kybs6IozWjgt6N4Pg6PZpt1iW7FIqsDqxIjm
 odthmTdY6muSly13YIj2tjOe5k/VC2WD1B5qgMkipvn95P5gyNPwNeD9HUCJtX5HHcsY
 nw2j7F+iPmbXNC++GuPdLCZRLZHjJgeYF6Hx+j1uIrxzfyBiEio5JwkOUZRnPLXU2q6f
 G2p29l6oWoG2HRt96EdhVID8qBB/WeW5UQGW0HwQikzHccOq8huC/HpQCmYcVz+l+z5F
 32Hw==
X-Gm-Message-State: AJIora/n0+kGGSzfSy40iE3dJ1DcWZP1Zyq4S2k02SC78bzAKjBJw8MS
 Dmlpwd9W2044hk8t0MJx4nJQNw==
X-Google-Smtp-Source: AGRyM1uGDj9UjMnUr/p/DTE2SweG2zO64jbT/zG9luVuqIeqY4NNvnIj0Jh29k67/5WgCOs6SByzkg==
X-Received: by 2002:a05:600c:4e88:b0:3a3:1bdc:cb72 with SMTP id
 f8-20020a05600c4e8800b003a31bdccb72mr2188940wmq.59.1659086395914; 
 Fri, 29 Jul 2022 02:19:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003a2d6f26babsm4043065wms.3.2022.07.29.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CB321FFBE;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/13] semihosting: Don't return negative values on
 qemu_semihosting_console_write() failure
Date: Fri, 29 Jul 2022 10:19:36 +0100
Message-Id: <20220729091943.2152410-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

The documentation comment for qemu_semihosting_console_write() says
 * Returns: number of bytes written -- this should only ever be short
 * on some sort of i/o error.

and the callsites rely on this.  However, the implementation code
path which sends console output to a chardev doesn't honour this,
and will return negative values on error.  Bring it into line with
the other implementation codepaths and the documentation, so that
it returns 0 on error.

Spotted by Coverity, because console_write() passes the return value
to unlock_user(), which doesn't accept a negative length.

Resolves: Coverity CID 1490288
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-2-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220725140520.515340-7-alex.bennee@linaro.org>

diff --git a/semihosting/console.c b/semihosting/console.c
index 5b1ec0a1c3..0f976fe8cb 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -111,7 +111,8 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 int qemu_semihosting_console_write(void *buf, int len)
 {
     if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        int r = qemu_chr_write_all(console.chr, (uint8_t *)buf, len);
+        return r < 0 ? 0 : r;
     } else {
         return fwrite(buf, 1, len, stderr);
     }
-- 
2.30.2


