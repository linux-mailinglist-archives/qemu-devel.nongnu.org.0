Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15385E92EB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:03:51 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQMQ-00089Q-RK
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0002jd-Ge
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrC-0006L8-Sz
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so4330639pjk.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qbVb74P1/xkJ4BQfOMUf3tDqORu0pugyYl7K9BClc2s=;
 b=DcDQELU+Y1ihIZYe+ek00BuygNqgMTcMfOR7srtmuA8wYmc9KyE7NJnTKBYg61+8f7
 7bw1aUDsjUihmoc1yh8MNq3vJ/nX/OW+MnceRaMh0ixHlOJhg9RBONAeP6tVegy2g5um
 045C2bxvpB0BDb7Yp+wbaK+9UvExTspGCr/irV7ZaVeVwxFVvLuBxCkJWbi+2gqDM92B
 A9TmC0Jb7MlzpuEiuPKm987V3rxHPYz8sKAXNnKr85gKxNp0pYIpnkzFHt86D0Qsg8nN
 nYqOSmlHwaPKpzofVAlUrt01wyiKaZmBdZIBr+zhPfdBiKvSPdP4o3L9mQriHDhm0VEy
 bYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qbVb74P1/xkJ4BQfOMUf3tDqORu0pugyYl7K9BClc2s=;
 b=W1f230STylcrfN5VUWzDuaHe5PrFvQ6FDVDC7L0yMst0P7RmbDCrzWJJ3uwMm3AoGb
 8O599YMRagh2j2wjFsb3YehfoErqCFXSnw5X1Ofk3IgM8ZOclkLIzoWN7bu7hvndhnFZ
 52DNkub9opF+La97OYIOjvO7+PaB+IMc3u8rCBQ9HHO6sD1gC2NhxLGEF/rxrR6bhCYC
 esZ1YYCn4T9bTF+uR4hf1UTt0y4XqpC1QcMXHAc2y/Argd0uFx+lRKkbRqogUPG8Kjs1
 QS0l5PFzBopcc0sviCVx47fPF0uS/epVTa7oC8GS736/7mCRQxcNesKac+8wXrrUiNXz
 zvMg==
X-Gm-Message-State: ACrzQf3hSAIk5vc8Wq32Sw0z5Njhuq9QdzfVXZpMM1VcWdWgGr8QAYTy
 P/OvdTypYMwHnF/mpkQJU3nmoU6hgMw=
X-Google-Smtp-Source: AMsMyM5wHeBmqBz7sLyXg1EXlAMqHL/aA9nzXrPMZeVgkPKi+8ZP6W5x+rAXDnNd/Ig+16OH0HTmfA==
X-Received: by 2002:a17:90b:314b:b0:203:41c:2dbb with SMTP id
 ip11-20020a17090b314b00b00203041c2dbbmr19245573pjb.18.1664105487289; 
 Sun, 25 Sep 2022 04:31:27 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 17/54] tests/qtest: vhost-user-blk-test: Avoid using
 hardcoded /tmp
Date: Sun, 25 Sep 2022 19:29:55 +0800
Message-Id: <20220925113032.1949844-18-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_get_tmp_dir() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch

 tests/qtest/vhost-user-blk-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index a81c2a2715..07a4c2d500 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
     char *path;
 
     /* No race because our pid makes the path unique */
-    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
+    path = g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
+                           g_get_tmp_dir(), getpid());
     tmp_fd = mkstemp(path);
     g_assert_cmpint(tmp_fd, >=, 0);
     close(tmp_fd);
-- 
2.34.1


