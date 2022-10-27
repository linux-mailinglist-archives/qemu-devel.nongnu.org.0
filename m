Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC16610172
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:20:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mw-0002R9-W7; Thu, 27 Oct 2022 14:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kJ-0001OS-T7
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0003Lm-3q
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1873912wmb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ExeW++xg0n7g3T+frnIZ1mHHUk27//XLmFUk4Hi+NQ=;
 b=FfrzCAr3ViZnkDkujoN1TrkPUlN4s03o5PjTNMtB2JZijbx7SWE0/JDlj5/7uSTj1g
 y7MGJr3+RjQvf4uPZLbQV/pDrRYeoFxek0FKt5pweqkl93X3YxFWaaUrEm2ZCL3fPIyL
 dWXwVCgq3VueSrfyD2Z1L0iT4BfC21ucuUjQndbdfVDk8MRIE15fVYCsRY9rKd4vbeC+
 eLQ1GaoQqpABxmYCMFmxZ/+JnCSOya9U7zYjOk3wTPJxFsm2PEuDtKjCIJDLIkfUuuxK
 lJfJr/sZLt7bacrHx1+PKF1XUFkWaH6m00fk7akbQ21N3TmsnyIgUAUCq4cjPdZn+1gJ
 bsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ExeW++xg0n7g3T+frnIZ1mHHUk27//XLmFUk4Hi+NQ=;
 b=A6Mklomux1t/o1s/vFUx6eKFyyEXgFnVzrN+j77xGuEO9rLbkXHKHcQm7nzcl6mvTp
 OpeXygQSxMJYjh5JTUR1xuFqy28GGnljQWTiWsrNQj2mdm/ZnK0wiG2MtyxSHa0gZlRl
 S8gzfmt7I/ArIb1ctwyVfBit6OwHZQ1HFUfYYaGOieAfCwPh+92J/DYJM8bgoLJgiwru
 cubaRPAR9fFz+7f8mJj/0Psom4Y/RULGyVxSmcxRk7i7DiMq4gttVvjdJkN2hLuwfnb4
 VCDUWyPUR1Z3t5BqtfD+V849/tux0HPLvtZCvylXBK/G+hUMUFlAZwp5h3RQmWrIgffP
 zYVA==
X-Gm-Message-State: ACrzQf38yrjQ3ue2gN+H0JiBYN4+hH8/uf43ADe7mPElWvlfRSUeHiK0
 NnjKOhBKgmGeXlUHvXpjeFwi7A==
X-Google-Smtp-Source: AMsMyM77oQsVPhD44H87SoL+2/lTNI314Bml7kIcwIioGmoRc7bh4NQ+/JuCmsTF4/yeFRIywqBVDw==
X-Received: by 2002:a1c:27c6:0:b0:3c2:e6df:c79b with SMTP id
 n189-20020a1c27c6000000b003c2e6dfc79bmr6715214wmn.14.1666895806672; 
 Thu, 27 Oct 2022 11:36:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1c4605000000b003cf57329221sm984174wma.14.2022.10.27.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6248C1FFC2;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v4 11/30] tcg: Avoid using hardcoded /tmp
Date: Thu, 27 Oct 2022 19:36:17 +0100
Message-Id: <20221027183637.2772968-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-3-bmeng.cn@gmail.com>
---
 tcg/tcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..84921b64f7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4729,7 +4729,8 @@ static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
     /* Enable this block to be able to debug the ELF image file creation.
        One can use readelf, objdump, or other inspection utilities.  */
     {
-        FILE *f = fopen("/tmp/qemu.jit", "w+b");
+        g_autofree char *jit = g_strdup_printf("%s/qemu.jit", g_get_tmp_dir());
+        FILE *f = fopen(jit, "w+b");
         if (f) {
             if (fwrite(img, img_size, 1, f) != img_size) {
                 /* Avoid stupid unused return value warning for fwrite.  */
-- 
2.34.1


