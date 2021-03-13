Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22734339F6E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:17:25 +0100 (CET)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7tD-0000Gu-6p
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7o9-0005MY-7q; Sat, 13 Mar 2021 12:12:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7o5-00021T-OL; Sat, 13 Mar 2021 12:12:07 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u16so6482939wrt.1;
 Sat, 13 Mar 2021 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTjmvUCgdFImH7aw4aIzTGxRYZDde6/Y4SvB4OR8am0=;
 b=BL78WTeDobirZJ7acLUkg+admRKMb/OGyCNE6J6vwQT4Hb8TFg4CU30vOog3DCKB08
 ezMuo+RanQBHGD7W5KW05KfYzmWwoN2s53R33IHXXaQUSMpjjavwBqUneae5xTrFKWYT
 0Kii96BJ1UtMWfky/+VshdkXdEZn7gUnG1+Xr505MJUfKfb4k4Xc6LnVXSjX/X+pYtnD
 TYUDrBz26azs14ReGKhc/jIdSxr5ofUu2XmhiGxuUahPLYKdbAGSy8NKks41pdvjK/zA
 DjyUFJ2XPsFzRwQGmgTabU9mdi9NG2gjaTtFqepyGBgXq22CRQje1AlqN//koXcnJ5mc
 trcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fTjmvUCgdFImH7aw4aIzTGxRYZDde6/Y4SvB4OR8am0=;
 b=GXKY/RXEqg+u7ov9WOtxAFWiwOAxsol5HGVk9uBbIwktI/KnOr6ntPEYIlaNvTLudZ
 hOt4nIXslMw9ncO2FepCuWR11UQqSb4ma+1lp74BgL9WgpB+rrzawMpIXmiMX4C767Ek
 WI+pF98Yn+XMXMVT1TSDAFKYF0wkFnXc4VBFILHF0oS42/XZM8SeUpD/WOYWzJkzIm1n
 U0JhEhw607ID9C9wpPJFm3q3FNVbF9aw1K/O94eR3pnbDsvOMp9svCLpn4NbtjQl/cTh
 z7KEBqHSmHLh6sQH37lWB/IzEi9TQYtC8irIAkVpTfCfWDT+IlRMbdOMPRjrcwmT/78p
 uvfA==
X-Gm-Message-State: AOAM532c6QAWsRpOVvkqg9kp1d/lzQqU8ZhyP/hHTJLJ5701prDoVtr2
 BkKpjcZUqGS3KFEnxRUfjw4WsNMDzTp7LA==
X-Google-Smtp-Source: ABdhPJyyi1IJSI/vleDp8IdKbMFyMgZWBDVUXTcs43LYNafQvWf2JJ9Y/3F1qZZ92IM2VoLtBYdP4Q==
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr20579102wrw.70.1615655523493; 
 Sat, 13 Mar 2021 09:12:03 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y205sm8459141wmc.18.2021.03.13.09.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 09:12:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/display/qxl: Constify VMStateDescription
Date: Sat, 13 Mar 2021 18:11:49 +0100
Message-Id: <20210313171150.2122409-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313171150.2122409-1-f4bug@amsat.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/qxl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 93907e82a33..2ba75637ec3 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2384,7 +2384,7 @@ static bool qxl_monitors_config_needed(void *opaque)
 }
 
 
-static VMStateDescription qxl_memslot = {
+static const VMStateDescription qxl_memslot = {
     .name               = "qxl-memslot",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
@@ -2396,7 +2396,7 @@ static VMStateDescription qxl_memslot = {
     }
 };
 
-static VMStateDescription qxl_surface = {
+static const VMStateDescription qxl_surface = {
     .name               = "qxl-surface",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
@@ -2414,7 +2414,7 @@ static VMStateDescription qxl_surface = {
     }
 };
 
-static VMStateDescription qxl_vmstate_monitors_config = {
+static const VMStateDescription qxl_vmstate_monitors_config = {
     .name               = "qxl/monitors-config",
     .version_id         = 1,
     .minimum_version_id = 1,
@@ -2425,7 +2425,7 @@ static VMStateDescription qxl_vmstate_monitors_config = {
     },
 };
 
-static VMStateDescription qxl_vmstate = {
+static const VMStateDescription qxl_vmstate = {
     .name               = "qxl",
     .version_id         = QXL_SAVE_VERSION,
     .minimum_version_id = QXL_SAVE_VERSION,
-- 
2.26.2


