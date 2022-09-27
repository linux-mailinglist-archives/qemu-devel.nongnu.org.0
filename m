Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25045EC13E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:27:08 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8jz-0007wp-OK
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QR-0002LL-Rp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QO-0004n2-SX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:06:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so9748640pjk.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x1b0DAXqWLfiXhIrelVULtyJQz5QogyXKHVADLX3USo=;
 b=OEQWGlp8ddYVy7KDzCF87peGjiai92wCcSzyVkTBc9cmZCEWf7WrXCKCDovalt9Lvd
 UWUJYNe85u+1QbWKPfgYBygtFVUNML1w1Y+tVVUYp+P+Wfh6IBtndToijmRkoH67IQbh
 IQmyQEKQGUUiMJ8KM0Aah6+PjP7kCaamRH1tFumlRlkVCnM7cdOVGu2pzckNe25J1MSH
 +/dqOft0gsK0wqM7xdTDh+ysbcMoMWhepRhbKZwqqNgIgauBW9K5lYg3ZDyveS+AqMKw
 PCTgbFJNlrGT99i7ugu6mR46JGjXWluLQqyP3H47DvG4QXgt+n215YgSCr2yhfmqmyR0
 5g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x1b0DAXqWLfiXhIrelVULtyJQz5QogyXKHVADLX3USo=;
 b=lgBYuLR6KSNqeAo4whf77eHfzLuo+eCgk+tYkpicAWXxrPhTjV3rbDJfruwCPDpYL7
 PlW/Ru8DzgawhpAknq88a8OVuYEhitzvikEmmy3Imch4ZOpwoS59QeijKSi7AsgayLKW
 5PGT8Maj8bUgDeLfXjGkOoa3VBqRTjeYDnrKUpx3AaDXvgDLN5eied06gzUp7E3b8xNj
 E2PB2H3B3ChFAWuxrGbNwUuZsZVWRooqCf07LK+jX/mp89yJlJpmZOMyICEMq0mnp6aV
 M8FV2SLsGcpDYKWPx6zEnh3E2VVylwHXkGNhQdOgpPVJ12eE6YVRnrVLhd78EpnkqbW8
 ohgw==
X-Gm-Message-State: ACrzQf2LVrZij0wHlfK/wlvEEt16ikSSSNOHWyAriqlcVQeQ62BG6l1I
 LXTkd8IhriMbtAPqF4bs56lUv+JeNN4=
X-Google-Smtp-Source: AMsMyM6UaTGNIt9dmWu/ifbDD6PghbSeQ3rAJPsddSwIUAiTmbHKitWvFIOcFaO5kJSI0sWtC9bo2Q==
X-Received: by 2002:a17:903:32c2:b0:178:2ca7:fade with SMTP id
 i2-20020a17090332c200b001782ca7fademr26738551plr.71.1664276811143; 
 Tue, 27 Sep 2022 04:06:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 03/54] tcg: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:05:41 +0800
Message-Id: <20220927110632.1973965-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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


