Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F3160639C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:55:05 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWwm-0006GC-4r
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:55:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWuF-000730-8Y
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU6G-0002fe-1Q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0000nG-U7
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id j7so33998763wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qw2G71vm/K5m60uyrOfgi4g/ctJMvoKCJ2gSL8OWBzc=;
 b=Ena/7V+HLLVWXUkroQjV/zSjo+jQHiPNSVUH58v5utZLzSse1e3i6lWMH4kF1A0yER
 5XxlWxQouPoALp4V/CDtIqyYQTvPI3rghOjPifarY73wE8vCFsdtLllXRi2iK17B8+hm
 Cs7Fta2L1D/FV6/lDvtymAJ/N9eRLgojWHjprjVvP4S9OQ5H4PA+NqtrWOy0t/lA9XB+
 NBCXTfAty6hL5Y5QKYHYDsjsH1kWMCpcP0x/D7korXvGdd4bDPM4rCBoc7ArRsL3ICAj
 Sb/W11kYHwFRrF4P/xEIRfvi/419imhRp15Itnh5YPMVhFM9/Zy/Qz/1IEf3bn8hKIcZ
 H2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qw2G71vm/K5m60uyrOfgi4g/ctJMvoKCJ2gSL8OWBzc=;
 b=mxL3r+pHFFTO4i9sZ5DiOv9QTqBWeTbiquNpY+IsPDm1sOv+qDgrWNYm9JFlCEl5T7
 o0BtGavqsftEQjR3wa4gjvoGVe98cdr0P9+IgQOLwPjZoG1r/6EqZuK1V4zp2wstT9RX
 JvqSv7sr1NpKCv2uwVqy0fLt7V3bX53eTSo8NKyOs0ubVkPL15gomQzlUBfd3WCBUDue
 jpudkLu7TOYPhWo7RZ/G2cDRUsbKDtT+FeVPyzJiqM8ApwzU5GY7fPQi38YX+zg2IMa+
 HWujNRB2yEh4I+IJKdSchNvbavoex8sdRAXntSHpLOpOkk1AU+OBE2NUuuW0qizMprK7
 oLGA==
X-Gm-Message-State: ACrzQf3Cm8/y5wyW3DZFUWLv0Mul4is7YI1hkzwWhtqdmTzh35qCht0S
 7q0UbXlFqh2KG0tmKvz3iTNJug==
X-Google-Smtp-Source: AMsMyM5mqjok5t1o9ZXuEUmYY/vll0SP4+QmfkwkrU73zsS2ccVaz6DnLg3Dqo5J9eZVvQQTWsS2xA==
X-Received: by 2002:a5d:6745:0:b0:22f:ed4:65d7 with SMTP id
 l5-20020a5d6745000000b0022f0ed465d7mr8619934wrw.259.1666266741101; 
 Thu, 20 Oct 2022 04:52:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d554a000000b002364c77bcacsm179102wrw.38.2022.10.20.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E9C61FFC3;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:vvfat)
Subject: [PATCH  v3 12/26] block/vvfat: Unify the mkdir() call
Date: Thu, 20 Oct 2022 12:51:55 +0100
Message-Id: <20221020115209.1761864-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There is a difference in the mkdir() call for win32 and non-win32
platforms, and currently is handled in the codes with #ifdefs.

glib provides a portable g_mkdir() API and we can use it to unify
the codes without #ifdefs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221006151927.2079583-6-bmeng.cn@gmail.com>
---
 block/vvfat.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..723beef025 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include <dirent.h>
+#include <glib/gstdio.h>
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -2726,13 +2727,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
             mapping_t* mapping;
             int j, parent_path_len;
 
-#ifdef __MINGW32__
-            if (mkdir(commit->path))
+            if (g_mkdir(commit->path, 0755)) {
                 return -5;
-#else
-            if (mkdir(commit->path, 0755))
-                return -5;
-#endif
+            }
 
             mapping = insert_mapping(s, commit->param.mkdir.cluster,
                     commit->param.mkdir.cluster + 1);
-- 
2.34.1


