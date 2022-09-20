Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28395BE454
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:23:24 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabLX-0002Ya-8G
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYV-0000ZO-DX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYT-0004oR-TK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so1930208ply.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=coJ7ma6necvrJiwyWuFb/EnkyqY+NtHLhvYBYm9zpZc=;
 b=iMTzXSvWXPotcsxeH6akDVLd38UH/G2zf3h+ctIhMaAVWgkxjqRHDKVa3+dOfxiTcr
 BMzx4KZfiPH85Lyl19r3QNuHTuqzxfrlSSgSqGUHZGKTlk6hS/h0LAncmEZ7DCQkSea3
 9/XRoPzBRwnObZxtceRNBmYY2JlGD7zsGfddwd4ZeCOl55IeBoW3v8QjXzPH2tmxwKL4
 +GTbCH6Z8av9r85ouYPMlmZ5k+JadrXRTGe8nEI4qg/wecNZUjTHxYeTcAK5GdTc9Yg4
 QLw0832CpB9PoEKbgNGAuf4uBjE2cGVDfoYJ6H9AbcpqxJROgf86NIMicE9QcmP9csco
 XKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=coJ7ma6necvrJiwyWuFb/EnkyqY+NtHLhvYBYm9zpZc=;
 b=IDicGDNxwo/rVYgE6yEjnwPCPVoPaXH4foKjjvb8RN6UOP2H0BonGC6yjAGvDipU93
 QIhlEBwNZFSrce/KYCKCZf7Q8p3LSzoJV1OdrYJjYC1Uqz8Ri5iM7s/ostyEZpZzmTto
 4zTGRVpF+q0lMWTNh+Fuu5mAyDW8R/kJI9+RZTnINs3xXsfO1OZUmkphn5ozRBAtZSPZ
 rd4WNUcjLgTG58uU8sqz1Y+NMIGWeikttGr/acmNGhPCHUFnNBsfG0iNXMnd1mvoSra9
 LFxZMM97Luk/LN1sCVhwtp5o4+gW+9XHiynUFWfq0hQXHM1mCqGH9ogZD32KSyz5Ba7g
 h0QQ==
X-Gm-Message-State: ACrzQf3V4HrUrmcy5cOV60skIUwzU/qpZCTkXVXUeusu0yJD2ofDZXL3
 gJ2b0vg4qzGLNmFNH+lv07i/nH2yZGI=
X-Google-Smtp-Source: AMsMyM7gw0KpQMLFYqsUexlQ1HztbHk69BtGqfE5w8O8LWmOi7f9wAfofB/krW+MYrAdYEv8vkDPWQ==
X-Received: by 2002:a17:902:7ed6:b0:178:378a:ebbf with SMTP id
 p22-20020a1709027ed600b00178378aebbfmr4173638plb.117.1663669960126; 
 Tue, 20 Sep 2022 03:32:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 10/39] hw/usb: dev-mtp: Use g_mkdir()
Date: Tue, 20 Sep 2022 18:31:30 +0800
Message-Id: <20220920103159.1865256-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Change to use g_mkdir()

 hw/usb/dev-mtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 5831395cef..1cac1cd435 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -14,7 +14,7 @@
 #include "qemu/error-report.h"
 #include <wchar.h>
 #include <dirent.h>
-
+#include <glib/gstdio.h>
 #include <sys/statvfs.h>
 
 
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         if (s->dataset.filename) {
             path = g_strdup_printf("%s/%s", parent->path, s->dataset.filename);
             if (s->dataset.format == FMT_ASSOCIATION) {
-                ret = mkdir(path, mask);
+                ret = g_mkdir(path, mask);
                 if (!ret) {
                     usb_mtp_queue_result(s, RES_OK, d->trans, 3,
                                          QEMU_STORAGE_ID,
-- 
2.34.1


