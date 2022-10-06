Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969205F6B15
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:57:44 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTFn-0000tZ-NB
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf2-0003yo-VX
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf0-0005yg-FL
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n7so2028714plp.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs5GKe8FO5KCXA2mO1WuiuwajzHIA5xIM/tzyVScXS0=;
 b=dN7nKpeJIdM8NBYJnNQM+pRuLA5C81zn9FdLb7lSdBumFHWbSPUVDZE84IGQfve+CD
 JUY7G2KmBt4Byba3QbyJ1Ip+OxloH3R1z1X/CTFFD1GFo5Bz+25M2TXaInb1UwqAlErd
 yqGQi1h55t0cxhi98ZoD0cyYOsw8QLjFgXSY0GSUu3SbUmM4pPcVNN+0Vq0YyLL/hvIY
 iJnY3Ot8VwcFHTyiDHZUXWr/97ySMDi3yTJHGo61IcxOGKHJh3sAZ+OdLNASin71xENN
 6+dQSgamAh1n8A4MsAN/6RPHWcW8SB4GIpe94NEoJTqCNRwsLJ5DTL19+Oj+3HtPGmgl
 27tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs5GKe8FO5KCXA2mO1WuiuwajzHIA5xIM/tzyVScXS0=;
 b=wQDEkkdyDSmz4LHheXN7y9fSeemEd5XN532P/uF3bzGD3mOsI1drMJCKUSkCbLIAlH
 z3GZGAenKYClyhTKAKJ0XmiA03ZMrqf5aCjxKQ5kA9Vj6VxOe3qJeyl/Mp+1KxDfEcMt
 XTGy1ycoLWN266QI1BOUfKLR9+U6KpR7wFrq165fZPqJg9UsdkResCsQx8V+Tji+2Xc0
 Rr/17YInG5bJn0/hdvRM8jb+HB8zH/hhvpklaTQRiSdPcITqQK4QM1Nkw0SlWQAksbp2
 xjpL+AxcGNL17Rb+BY+sLhU0BTlgd63DhgBbc9aJw1jxUnCsO5/pX2zNypC0+szSXVm5
 NGqA==
X-Gm-Message-State: ACrzQf1iTsD2c58W60TCa6XCETdku7AY9T/K3bIpotStdqEVQwv3phDz
 5NSEUzAfZV4rxIjKzdwZBYjDYLUZnjc=
X-Google-Smtp-Source: AMsMyM7F1/efsc87zTIZmrbQ8YCKGUBE65czdNmKWVNVZCX6eXsT+kju9ZNiSgClXxIGqKBffeYOEQ==
X-Received: by 2002:a17:902:e742:b0:17f:6a44:ee4a with SMTP id
 p2-20020a170902e74200b0017f6a44ee4amr5229310plf.103.1665069580070; 
 Thu, 06 Oct 2022 08:19:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 02/18] tcg: Avoid using hardcoded /tmp
Date: Thu,  6 Oct 2022 23:19:11 +0800
Message-Id: <20221006151927.2079583-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
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


