Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BEF5F6ADB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:41:27 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogT01-0007mI-9A
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXf-0003VN-H2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXd-0004aW-OO
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:07 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n7so2010173plp.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=dOtjr+W9rvmyqtKz6l2crngvck7euHxBG5gUR2GqvnviZ6Elk08zP2lyJ3uHgXjZjP
 /SPY6MhBRHfZaPdDjI57Y6tcm6JHX+him/vmrhK7eqnMsfBuYBUs0kcX0DEoU3wBoEiy
 vEaaUJ1LZrva3wUIJNN9uy+r7DEOQ/R6EtQLNRGKyVc4G7uQKG571sm89DhrYHxWCM9K
 J7JjFjwmHiqM2AUs9zypA8OgBGbopEY2AgGWS2vMP7ukICkTTPzAoc68iQ4KKs+kFKi7
 Syth1ziVN7SD4GdJu2ihHiRzmLRl55UEC8Kmf0gWC1+fL9NspXgGthACed9L3Tl5FhLm
 lFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=Ptv0YwnxUpTDuFBQXKpOl/uhEpl4e3tNYmwBgtgU/8i7RhSuf9lTwTUsBnWw7GGfv+
 LkJQijB8q6luflI8aY2ZPSz87MeC9M06PiMhGveYkm9TN56xn1RxPpnIczpLWrzZ3u7k
 bsH/B3xSLOzBnshI7xruPS/uOkuKPQeZXnQGpbaOXNmZHmw8rY5c4Ute1mmbxeF4Hd4E
 8W7zAEnC7T5Kl3q9LKNZj9SYCtYplOxyX4hU263zEcilbP/debnANp+o1Wl23YBeZYF0
 cNL+pkaUoou6sCY2yglLS28mU/afsP6zrZJtzFckC21LyFt1vRbwPlGSzmnS320DPjr7
 wzXw==
X-Gm-Message-State: ACrzQf124oSfFDjIWMRaSfTvDqMtXDmy5hvTjPmgyFbOSGDsLnLl8ajI
 UVGMlXVIvfzr5wgiWa7LEiS0fb0P/sc=
X-Google-Smtp-Source: AMsMyM6lHX5vqRv2pv2goAod23xQoZVDzsSYwJDqbEDs0lvCZkyBw9mvp8Vqvnc2Cuos51mxzBP9vw==
X-Received: by 2002:a17:902:c40c:b0:17f:7f60:47ff with SMTP id
 k12-20020a170902c40c00b0017f7f6047ffmr360994plk.101.1665069122950; 
 Thu, 06 Oct 2022 08:12:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 07/18] hw/usb: dev-mtp: Use g_mkdir()
Date: Thu,  6 Oct 2022 23:11:24 +0800
Message-Id: <20221006151135.2078908-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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


