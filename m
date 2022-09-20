Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53275BE60E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:39:41 +0200 (CEST)
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacXM-0007WL-Cj
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYG-0000Uk-D1
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:29 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYE-0004mi-SK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:28 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w20so1889771ply.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FEdN+sSW27vQj2HqDIPCCe75/V+zg2lWkY7ET+RYfyE=;
 b=owR0XYtOYHlNcQd6+Ebw8IZhx9l2yCp4nbjMcK2nLeh49qo1ZcixFv981UfXwTQQyF
 2YTY/PDa/YYf2I8qEKOe7YjyFAO2TUNfrKSkrsTsMBp8xrLDTnoXoL05IsGlkLm702jB
 IBk4Il0FhfqcqNmEcMcjI3bhpB3lEd/3q232AEOCH55C1w4HmYulel1gMUUDHR0SOerR
 ftkp5/P6hvcKK8HFzNMwr6v5gQeQLGLcVLOaIFW8C9aWvNgUSv9+BEqCK53g1M5gg6Vi
 NahhOTgb/KQ0HzNHjApADlN4qbpfXdpdXlmhxXGKloVOf+cxwlZjc8odu52kEaBxQEuH
 /n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FEdN+sSW27vQj2HqDIPCCe75/V+zg2lWkY7ET+RYfyE=;
 b=nOHnD4FmDWCm4LNqg8ST7se4vH/pztxgnI9ZUcCbDQG4Nr/iw5+Ye4FnzTrlGQsIQp
 nGlAHiHpwOKNXoBPbQ55f0z5WfsYxacn3dWRC6KNcTPm9mL2mKhizgXwEPhpG66Xp7Ri
 RtyUl31yICOl9YBB1dUIn6jLmtgvc6Twc3G79Kfg7w2COFFk/aKk6CYsh4BVhr2lp9E+
 cDllGB1qzkHsNsUqNa9Tgu8xu0NAMyGANr4y/ptMkF/OrVIH4kKL7s6TWfwuofXVuna6
 heVquFg16ZTMLh0Z8pkUpMWjwxCg1nMfkBg6YVftJ0pPB459VTCNrDJY+avQoTrdH9sP
 QAWA==
X-Gm-Message-State: ACrzQf378qR18JgJJxuHulqs4gIDpR56OmzFM5mbAJ0t9yq/IsHhD9Yc
 iVNcdJa0vr5Pim0fwIA0g7qF03x7q6M=
X-Google-Smtp-Source: AMsMyM5W4zWXP8hNiTidebU3occ8zruOKwoALiDLWG+05L+lC+IAetxU7EA8D+PUjMMVtGnR1sWfIA==
X-Received: by 2002:a17:902:da81:b0:178:2663:dc8d with SMTP id
 j1-20020a170902da8100b001782663dc8dmr4239717plx.49.1663669943220; 
 Tue, 20 Sep 2022 03:32:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 04/39] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Tue, 20 Sep 2022 18:31:24 +0800
Message-Id: <20220920103159.1865256-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
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


