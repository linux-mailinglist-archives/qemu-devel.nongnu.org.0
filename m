Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42D5F6A6D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:19:14 +0200 (CEST)
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSeX-0003OD-Mu
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXR-0002nX-3J
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXP-0004Z3-H2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:52 -0400
Received: by mail-pf1-x431.google.com with SMTP id i6so2336325pfb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs5GKe8FO5KCXA2mO1WuiuwajzHIA5xIM/tzyVScXS0=;
 b=DVmkL+zfyMu/eIRh34gX6yjpCDSISmfihDm/RlA+HpoT+YUDQh5u7cFTXsEitIS/aD
 hyFRR2KDpX9l3bAh8GQVwKa0Pqkxl4sRJnrJe9dI4tLJxA+EvwbgZxqi4sFSVnkS5fAZ
 3C/GZTNcYKlnFqltyn+2LJ7ezAmQNNq2+HeX3lT7v8kgKrnClh2YCq2NSYgT+zDZ8CzN
 ZYV0cxCPeFyZyfz0P+idKMjoQ2QoaNHlIQHyBEMCjNnd0zzK1uENsVXRldSPltZMEHKq
 G8bcaQX6VUybuZu2J9bb/u+hVQ1GqaPn+cZLkDcqLB0KLQrwcAz+ChiUvZlWBlDSCPn4
 BFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs5GKe8FO5KCXA2mO1WuiuwajzHIA5xIM/tzyVScXS0=;
 b=KvmR0BTs5MiPV7m/MWcJ5i2ZcktXDVAIaMpXQJMf11bHta2/P85EdnsMQBSViQS4nX
 aA3OFybrDxXW1rnPtP0b/SPiFaZE2VdJknlxz5rPWW2ub8xvz7t7jVMDNtzJyhMNAZh1
 KmXN0K/G/5p1cE10jCnONJItbGOUuZh/nVd0JbfIqZ6Qw7iqTFeqng8PcyAm5BxAA4mA
 eBjoViNatMUwkjMECP7LgWIfxF80anaNmG+eO72gSDJXbnra3tAh9m9DzPCvYYQA3/uQ
 d+dw6svc+DQ0aUmTbgIaOoXI7SDgQPwWJFja8xEc6jmgFzky0ZBrplf9Q5RrIBVkwEsJ
 o5cA==
X-Gm-Message-State: ACrzQf3O7tZ8eQ2VZ/7v5hUTPkBuYbgIRbOZaFdjt9CzrH48bSvymMmE
 DEu/7yQFb9d+eKgSU79+nhj0zCn06wA=
X-Google-Smtp-Source: AMsMyM7yKftyic7lbPoKHr8fIOzk3xvK7LV1SMgxer/c1vI3S5mXHcOzTcJQ5SEBRpOkkneOsvm0Ow==
X-Received: by 2002:a63:1b0e:0:b0:44b:97e8:1020 with SMTP id
 b14-20020a631b0e000000b0044b97e81020mr285141pgb.519.1665069108739; 
 Thu, 06 Oct 2022 08:11:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/18] tcg: Avoid using hardcoded /tmp
Date: Thu,  6 Oct 2022 23:11:19 +0800
Message-Id: <20221006151135.2078908-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v2)

Changes in v2:
- Use g_autofree to declare the variable

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


