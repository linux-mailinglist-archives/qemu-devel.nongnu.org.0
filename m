Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13E5827DE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:40:37 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhH9-000677-PZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5K-0003jI-S1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:22 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5J-00025m-4T
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:22 -0400
Received: by mail-pg1-x536.google.com with SMTP id f65so15907669pgc.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMS9OUaYa/QNvkZNXsceR+8orBdBvzp5WVQGR+Vg1S4=;
 b=C4yzPKsAOPDvDOD111R/Qo8VNVOO8DwQ5TQfjBcRTk+nc1j68LZMGPpFA1jkN4M1nZ
 BqfIFToDfcnakKNmASwxteTX682XNV6/yGaZFnavBjnA9Zc3DyxFNw7ySfni8NYTWIV6
 tRCkHm0j2XsTQ6T80VNz1YVjupjmSw9m7EvntoGienwu6kSmGaacvk80mfZRR4lBeClb
 hhUY719dZs/WSXdGOYoMMEmUTW7tu7zUCisx4mk79TRUZnQ5udVzVmd7rG0jZLkBDFWW
 689JXjkhE++iTKOKBo8nmDoDkbZWIJxqpJOihNjuAWVCwYlHyNruMeCrqn14LmtCUi9z
 6mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMS9OUaYa/QNvkZNXsceR+8orBdBvzp5WVQGR+Vg1S4=;
 b=sjgpVMOq7wAEjfNAmuSQap1cVJMQHC/QsWDO1xSBYx6alfxZlhOqJKV+WpcuzPv/M0
 tDtVY6I94ozDv27fZ3Sg3zNzD00RKXPpZ36kpK8BcsA+0KHQolcY7Yh+BVMfqyilh/Rs
 I3S1Ks9ZJKuL0EgjWnqdIZJA7qy9r/4Oiuhg9GE8WBG3Y2l8g/D/QDt5rdYSlMgbJDFG
 DLhMWBXeiBCFOhe8daW4TsPput8T6C502s4sN61Rtrv5luTxDpieBpyHQYlQyXYorJOQ
 rhgqIPNO/4gvdHTWsKyZM2eo6Dig4lJK7byaFBkWfDqRxhsBpt4cC8wTEpKuA6tRS4gW
 /LDQ==
X-Gm-Message-State: AJIora9YO+Ju/jArYtLN871vLb9OED1w/XiNtC0eHuczP92ENe5LZOYV
 hkOWHDAAh8IQFZDwsuD0xgQfrCaIYGE=
X-Google-Smtp-Source: AGRyM1v0SbqL6cdNcSmyLBaF9TibFcrJwbrnuQh+ESXPdlBe9pCqe3/afNUTqcBf1dzzJvbAXT7K4w==
X-Received: by 2002:a63:1658:0:b0:41a:4118:f4b9 with SMTP id
 24-20020a631658000000b0041a4118f4b9mr19090047pgw.153.1658928499493; 
 Wed, 27 Jul 2022 06:28:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 5/6] chardev/char-socket: Update AF_UNIX for Windows
Date: Wed, 27 Jul 2022 21:28:01 +0800
Message-Id: <20220727132802.812580-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Now that AF_UNIX has come to Windows, update the existing logic in
qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- drop #include <afunix.h> as it is now already included in osdep.h

 chardev/char-socket.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..14a56b7b13 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -557,7 +557,7 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
     const char *left = "", *right = "";
 
     switch (ss->ss_family) {
-#ifndef _WIN32
+#ifdef CONFIG_AF_UNIX
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
@@ -1372,10 +1372,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 
     qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
+#ifndef _WIN32
     /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
     if (addr->type == SOCKET_ADDRESS_TYPE_UNIX) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
+#endif
 
     /*
      * In the chardev-change special-case, we shouldn't register a new yank
-- 
2.34.1


