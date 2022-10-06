Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974265F6B4C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:14:54 +0200 (CEST)
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTWP-0006UK-Gn
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfD-00048s-Lf
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:55 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfC-0005zf-54
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:55 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u24so1968295plq.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=CDFL2lkUnYs/aL+B8gu+bu5dfc9zAqr3/kDm9J2dgWQ+ALkXQvwhrFHyzOR8Yy1J6w
 eETYVNNiNjBV3sdl46Ed6MHNdt1DqD3e17sgM92vGjpt+7BMu3n504EWEtU0xYdOuEtT
 VsLQOQ8RJT+FsKnlXwKhKNPz3ro/rCjuFagUPlLeTCeogUcg5Fv8m307/FZRiqfOqQbH
 efu3BuQO3tz8FkxRIaAGvy3dvloz/W5sgHlZ33mExqEnw7QtOWrU2Lhk8j8EdJQ+Jzwu
 re7DnQWceg+UiG1mPFIC5HgtD+3sYcK3KnpUNWOZ8iOZ6yMJ8MaWHUpcha+Hm/0c/WWa
 7Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=ZxvzDVzT/3cA3AApsRXQDjTcnwMQTsyFfLYJjMPq2ly2CYtEK5rwWIEBxQMerPXiq2
 mdzLdEcDdUDoXpb/M/eqEkjviggNRRIToN33PIWJseUc369vq4iHzpM2FEE2k+P8IVyi
 urJa9Q7kBNKu0xPWbSfqnp07fw8jGf58i3I7LG0YVWo3KLN/2yWM8qxUJIDwERZdx/bg
 oAbAfV3HJ1sBEb3uIsf4Lt4EJ56r515GGnV7BTJqpADCPPeNrIODvx2htYKzkE7vlQ6k
 gLVG8ZRkaLc+CR8ChgWNmQDAbFM3dMVh/Nf6MrTKfX2JY5uhskfxmwgutdhSIkggExe9
 lfFA==
X-Gm-Message-State: ACrzQf2rzEWbTF1V0mrRVp6KTmpl9ZkqKSNxjn1FYPW7Z0bOQ14MZJ2s
 Hk1mvBzaLKyf6gTEMCvgveWOQVFNPIE=
X-Google-Smtp-Source: AMsMyM4zFQIViAEIdpM6TMuv4ucLO8AnFYIdoIqpsSMRQi32ve/RWIXb4CvDBZ97f3jKAkC25HfMNA==
X-Received: by 2002:a17:90b:2812:b0:205:cdc9:2ccf with SMTP id
 qb18-20020a17090b281200b00205cdc92ccfmr205932pjb.97.1665069592682; 
 Thu, 06 Oct 2022 08:19:52 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 07/18] hw/usb: dev-mtp: Use g_mkdir()
Date: Thu,  6 Oct 2022 23:19:16 +0800
Message-Id: <20221006151927.2079583-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---

(no changes since v2)

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


