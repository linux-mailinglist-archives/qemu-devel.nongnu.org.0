Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8B5BE431
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:14:28 +0200 (CEST)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabCt-0003cJ-Nb
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYG-0000Uo-HF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:29 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYF-0004mq-0N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:28 -0400
Received: by mail-pl1-x630.google.com with SMTP id w10so1034641pll.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ziUPt4vlu90nlwtr3cIlBDD5brCudcYGA0pu4hMiODs=;
 b=koArTVPTy8wOD0AbhfeKTNUt0ekfuXQu1JxLmG8fILqfwdLgTYa7ELPJF5CbmjD8rk
 0hwALKUedNE7I6luYfmVURA89Qk1VzM9Taoy2TOuHeyRNpfL+peHB/PMCTgqMJp1uXXu
 OZCps/JeesMLCRmCE/KEF+m3/bUV8j2RxLOxwu7GmtXKkzcggdrZ2AD4ZgC41LXvE8cc
 AlNjft0+Lw4lRj/iRUXogSXHmCr+7s3jjLc4aW3QkElRj3tTo3xrgZ7xUZCLpOeR4ITb
 zvbxMH26NMOLe1z6yahgGndxxqtanjZNmouwJFX16Y1sn8dZUnUivXN+4p7zgEMely4e
 FqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ziUPt4vlu90nlwtr3cIlBDD5brCudcYGA0pu4hMiODs=;
 b=zHC1lyZ841QEZUf668MnFnxQC7yhSnEvoVBU5T1yxWd3kj8SXzmo3/SgEfpRR4tN35
 vcBAQEWHQxnsFpkLwO7A1tL5G+f5WRZgqAaNgWWNkH2WF6P8DeiuzcaSJTgnV3wN9BPD
 kUV2LGZyEwncQeLS34Rxe+Y/xqN9ghTGsizVNPdFTYkKTG1sXkLcRUf12Ppvsgukydx5
 wxgMnxP08rVzVu6NHKlEvOIG5J55Ct7OnIp0MqKMUfrAQzGby5vX+uP82fktTvNtWCaz
 lk6OZ1VFHn20k2P4NbGQ6raHkXRAPBm23dmu9/O1JxH/nmrguXjWyqZfLoUmmNhMkpzR
 dOHw==
X-Gm-Message-State: ACrzQf1kZL15hi7DLc45X+F9CeiwfcTIL75BHaqjCZfDMuxor3WYOm5j
 b/JDbGZG/phGg5rRoU5PCwGknU72mhk=
X-Google-Smtp-Source: AMsMyM6Cv+FFB4vjb5RWX05dqAlC/jfe8+XQAqXi6ucseF3Gb7BYI+bza5iZANPWBT7NOuGIOcy+tQ==
X-Received: by 2002:a17:902:f644:b0:172:b074:d1f5 with SMTP id
 m4-20020a170902f64400b00172b074d1f5mr4162942plg.29.1663669945255; 
 Tue, 20 Sep 2022 03:32:25 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/39] tcg: Avoid using hardcoded /tmp
Date: Tue, 20 Sep 2022 18:31:25 +0800
Message-Id: <20220920103159.1865256-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v2:
- Use g_autofree to declare the variable

 tcg/tcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f9cfe96f2..8847053176 100644
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


