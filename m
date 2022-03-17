Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500F4DCA0E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:34:17 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs8m-00012W-3M
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:34:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUs4k-0004t5-Vt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:30:07 -0400
Received: from [2607:f8b0:4864:20::1032] (port=35386
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUs4e-00036j-SK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:30:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso7919808pjb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I0RR/k/9KtF/RXz/WXv2RD7jt062xchc26ttln2w1lY=;
 b=qDW/6KV3T/nmeTd110ftjrzAjDJqZTJbYQSy+bvF/ynzyZCvVqzmOwH3vthOZ82a5v
 5k1b/QHMqS+pj9+LLKnCbjlZhL7MJHzjoJlGUWmVF/4ZQjEm/z9aWyUekxybsDZMc4ss
 4tI5IRowH9soXLS94FLEOC3CMg2hchoFOc9wWcvCQHl4P8KwjFII9zWLoIF5b2ioGWHW
 wj4GAucVllP8WBUvPNoKxSXPliMB6pPc3LsSJZxgp7R5Bq3tY/p1p/ducI+lFoMR4BC2
 1DR/yRJ2rxyWGlIKzSMxuF/oJf4rnkjr6QbLanwbppANBYxS0vpMhgiKpVUHqyuan69W
 ygEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I0RR/k/9KtF/RXz/WXv2RD7jt062xchc26ttln2w1lY=;
 b=Qr3jiXFFEy+Cf0Er0k4+PrV4KXfpJLdjqDD1fKCwmEMECSeFsKewlm4cQ1aaX0bY4+
 avt8eFtvodHfS0zi1RUjPUimtDSBS69quNazm8XgPq2hb/cg5Mb7EYtplKgOCjEWcvYI
 5pgO4zoXlVctEKaB9A+hNrW2zGPm55WMspSrh3lcWjQ32mwM1WiX9atXYWFilmAUE2yB
 c+QNgqrTOlungG7SmEzC+gG8eGHWQTELQuH2m/06vzi2/mrDy4BxyKFbaVzEPGOKDx8A
 JnfjO78uVmPQOyB9pnomdOUzaQ6VhRCd3GCwErBCam/4CwANbN5tQZRGyQJOzsNR5rHX
 nNwQ==
X-Gm-Message-State: AOAM530ZUFLSP7DlRypZzUyClEWM5tDLQPrQ3reweIBkBty45EXjbwhI
 8akMFhLZun0CoA+i4o3q/28NMus6iFE=
X-Google-Smtp-Source: ABdhPJwg+KYjsIqpcOjba0lb/cV04hdeGEUQt2kanhTiJ4JZUqpM238qRBBbUSBmA31cLYUCgYBl2w==
X-Received: by 2002:a17:90a:7085:b0:1bd:3db8:6597 with SMTP id
 g5-20020a17090a708500b001bd3db86597mr16523555pjk.86.1647530999091; 
 Thu, 17 Mar 2022 08:29:59 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4096:b81:d64e:d5df])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a63cd4b000000b00378b9167493sm5638328pgj.52.2022.03.17.08.29.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 08:29:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Respect left-command-key option
Date: Fri, 18 Mar 2022 00:29:49 +0900
Message-Id: <20220317152949.68666-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index cb6e7c41dc6..c4e5468f9e6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -923,7 +923,8 @@ - (bool) handleEventLocked:(NSEvent *)event
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        !!(modifiers & NSEventModifierFlagCommand) &&
+                        left_command_key_enabled) {
                         if (swap_opt_cmd) {
                             [self toggleKey:Q_KEY_CODE_ALT];
                         } else {
-- 
2.32.0 (Apple Git-132)


