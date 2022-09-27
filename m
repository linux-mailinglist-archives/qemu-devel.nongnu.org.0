Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF955EC130
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:26:12 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8j5-00075K-83
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QP-0002IC-Bz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QM-0004mj-FE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:52 -0400
Received: by mail-pl1-x630.google.com with SMTP id d24so8764846pls.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NHZEwyZe4QvDxYFPPW8rgMjXXwZjWrApXq6jqgxMbHA=;
 b=XTsx8CxNq/kOZS8aJ0d3oeKrI1TXbCHvnBVEV6WfrAxuxYAaLM2DvQCkX2HpLTqWmH
 baNuzEMWRHlTXHj0rV9D385IXUL73G8DJlMQX4uKDfPIoAGBHjnVGn/kdYrOT2oadTsp
 Bkm4QTaGpgs3HUmKlQbJgbNG4mvfvMvknCarYjGMpGs1huGG6dIfrrSaC33VvJHTLaX0
 oJxaCEfrNzqQYJunMMEIbKxS4Onwj15Is+UjFrZ1QLm/8xw6VLklj8R7BstJyQj2wahN
 9Cn8wEmDDKkh5SxJ7gMB8fMUwSa3mH0tDgU3xIDOP/pQRomRECsHJTYhB8RtVpVPwBYi
 veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NHZEwyZe4QvDxYFPPW8rgMjXXwZjWrApXq6jqgxMbHA=;
 b=GDcEdi+T6DLPGBg2Ls34Cwd1uuHhCaC/pBXbLvKeYDgOiLfZA5Mt4VWBL0YV3EReM2
 zdi/L0o6Rk5R+osFMV61MuEv01D897w4zanFkSGM68gmbfjSOJcRXRp75xgEVwbI1nN2
 9Hagh4DgDVn995lfC1xwqHNzqyUFZ4r5hGidWQAierz6pBbfFwIHwmKrOt+P/Pat89u0
 E5ckkxwj+KYKcRt7iwEeqQ3UOrS3pNSdmv1uPY2gy9JS7J239GvC7qhKJGbka+QkFNiH
 NRnVqHpxvYZKb1Sd/9V/Fl/rDCo1+gMA92EGhR5S+3+po+qgMLCb/wYbUdP58JQT5nku
 HR5Q==
X-Gm-Message-State: ACrzQf1VJ0a3l2u/fPwT+hhp/LOvHpZfYPs4i2KyVaK0hlvy+aMn4WFH
 KtpvNDHb3x1dZTaQ2sAVpvrgywsvUmg=
X-Google-Smtp-Source: AMsMyM4Tq2inUqqUQwZ05wknyyfHiH4CXnC09PUMS8u5RHYmSYHF9SgPQce8yMLpbImsuzFLdmjSHw==
X-Received: by 2002:a17:903:228c:b0:178:3bc7:8a3f with SMTP id
 b12-20020a170903228c00b001783bc78a3fmr26393633plh.88.1664276808836; 
 Tue, 27 Sep 2022 04:06:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 02/54] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:40 +0800
Message-Id: <20220927110632.1973965-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..d5e66cc298 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


