Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038675E92CF
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:48:52 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ7v-00023E-29
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqX-0002Z1-8u
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:54 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqV-0006IN-RT
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:53 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 129so2788464pgc.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x1b0DAXqWLfiXhIrelVULtyJQz5QogyXKHVADLX3USo=;
 b=iA6vrJKoZVzb5mhtTIoFaWpmlKmn9U+D8y7LSFOh9NQ6lgS9oRR10DQkxFr4K3mYxS
 ZCuPGux3bKDDgSp/75rFlnSwIzoQNIxbeX5wL0wqKssG8fbepzlT0h5YQ+/eHvvaJUm8
 4z1+M122Qnm4aQMnkjXJYidsQhc62xbdKvYCI4fnMvGD824X/aVBsQckB1kJ57GDIP+t
 LV2fAaBJsKV/ivN7NCucQLiR4U8EngEQSsayXnDTDUFIa/hkn4xpZo72gdfSji4U6k4Y
 oXcr0InPZQj23H685BE+W/+w3fmeTy9oysDR97JMl+4X6ruSn1fjfFP0GgoYp3fraQRf
 tWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x1b0DAXqWLfiXhIrelVULtyJQz5QogyXKHVADLX3USo=;
 b=qCX4uo0QxHxtix/eNr4Skd4FHvEr5bVrTlrn+Va0Bwqi+gH+YSSKTA3ylpMKJeCdSq
 1gAa2HHYavN7Z071p3cgBlO0iNiTHarTVnN1N5Z4kPxNoXlBKowFY5oLeQWA3NrcyRcA
 FkRT2vZFX86XORNw7fRa1qD+sgIWtjVGwFTs8nnnkyWRkJX71ShqpPXO+YjOVxUwJBNC
 tPixJtIrna2vUuw71AU9GYzSox1aDlznm9Xe6dObFrrtUogKxQfBKFemx2iD3kDhDMCf
 J4GcetIjiP+FRdHdQIR6GFjIpagdqOAn8OaMJpYUyx9E4j9Jc74V9U5aw9MCGSuO/JCb
 Eauw==
X-Gm-Message-State: ACrzQf3vcg7WOVCQhhXcDq+kx1YIyW/0ealXCuD3CmjRrOzLvS//TfvG
 zgSkgjzmpXyiQxOPYYphdQVV6H3BMPg=
X-Google-Smtp-Source: AMsMyM43PM8miWusED9cJMfV4AqxZyczvi+AcnGhfm3v0KlBNH/lfe1f/kM3aC+52GvWsdLv+Tf2rQ==
X-Received: by 2002:a63:5fd6:0:b0:434:96fe:f508 with SMTP id
 t205-20020a635fd6000000b0043496fef508mr15312985pgb.306.1664105450400; 
 Sun, 25 Sep 2022 04:30:50 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/54] tcg: Avoid using hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:41 +0800
Message-Id: <20220925113032.1949844-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
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


