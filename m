Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E3585AE2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 16:56:07 +0200 (CEST)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHnss-0003QT-UV
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 10:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnm-0004bU-Ui
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:51 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnl-0007Zp-IC
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:50 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f7so7229138pjp.0
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=To5bmQm11ZTI2o7stiEcQe4DIuFIjaF9pT8cpAzDEHI=;
 b=RfBhcWDgOOQAXLCmTeI4MaAZKcTz/X7B05fd9BzVUusTR7qN0onRDM/dJ9MDI2luE2
 PThnk5DXWOzKkcAq3XxQ1wT8nAumK7UpO0EWqwyePkDBfu0u7eKdjzVCgVEGjgr0YzNw
 STC/dlNCYgX6r+y2ipvNwKAFL12MHkSwdfe451tNe5Sa15QvwbQE7/vVVBBC4Z0BG/LY
 WTSlZ0P1RH5J0A+9jLmACfCoeitUxWEJIS1/hmPG8HA00tQlN09lavndn1hTRPL7c7vt
 bb/OhURuBs4vxnv5dddoF2YotMNZ+TdhO2eqip1o69aAEvN0oCFMVRRF1rBDJvryWDqB
 t2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=To5bmQm11ZTI2o7stiEcQe4DIuFIjaF9pT8cpAzDEHI=;
 b=oP85VObt4yZlpgSSRXI/zi+Bacu+ofFN/u+deiXMNkPp3duwlDFc0fRneLNVgzy/73
 wnD8LX+Sn5CKLXdlJFXSH4CbvIAgZHFHPXdDpKZd7HxdHc/gFogzOgitV99XXIBDUqOT
 /5nrSICGRx84Ut1fNjh+OFhzaKBdLC4FqknCHp2ZAUFAhOQBHcOrwvdJQ0/Ad8sPDx4v
 a/TrAXcl4/mSJxmeQYDLpnJMS2Qqdk61PvqjtuIxy8L1OqfpOgkO4n2O/tBLajazwfol
 +zu84yLQ8zqg9cs5do2VEotDCv9dsNywxPynmnHi9eS1M7ILWjwD8LU0jDKqdJVrIQUH
 NmwQ==
X-Gm-Message-State: ACgBeo1xzudTmzvRbU3pvzhZKjNv9j6AFVnIeVI0UuQkKdkEr+aU4jm1
 hz/05vwQONU8wka3BOpBRUbrORD9Uac=
X-Google-Smtp-Source: AA6agR7M1KHgcrZFMEul7EXQtulNah1MnjeBdy3PMOhJ0vNPuptoXil5Z/00uwycQaqqBvtfHNeo1w==
X-Received: by 2002:a17:902:ebc1:b0:168:fd13:8adc with SMTP id
 p1-20020a170902ebc100b00168fd138adcmr8665099plg.161.1659192648041; 
 Sat, 30 Jul 2022 07:50:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa78f0b000000b00525343b5047sm4882499pfr.76.2022.07.30.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 07:50:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/4] chardev/char-socket: Update AF_UNIX for Windows
Date: Sat, 30 Jul 2022 22:50:35 +0800
Message-Id: <20220730145036.865854-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730145036.865854-1-bmeng.cn@gmail.com>
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

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


