Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58933BF54B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 07:47:31 +0200 (CEST)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Msl-0005OJ-0L
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 01:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1MrT-00043A-Qg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:46:12 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1MrR-0003Lz-Vs
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:46:11 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p17so1828029plf.12
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 22:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOlub9SOIktx2fjXjgb8/lY7jhj9HA+U5EvghIO/VSE=;
 b=mz7OtD7Q4uuFfUCji/RaOUJ3HZCmV5rBXIrperyit4ybrJzT+fps8hdWQGlCYUNXaf
 BjCSfpWKmZFjb1+77s7yZESlHbrqEww6wS6vXDt+AmhdaNQ+iIPqyC3MNbaNj7Cv21Wq
 ElCC+fIja1ulHxr3eaF7kVl+MqYA7CoQ+UjER8q1w/Vymy2a2/8b4N+eD3bkeWTYfwA5
 +igVRilHEH5dG6QlQL9xsajpMrYziwIqBBKAGOF/E9zvmGIaExJ2/WBoZ188XyVz+n7S
 Mqb2auqY4VShe4uMWogI1WbLEj/qAgka8SVhXZCINF5GJiYmQp64lxZ6Uy8cdAeMSnXP
 ViiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOlub9SOIktx2fjXjgb8/lY7jhj9HA+U5EvghIO/VSE=;
 b=lYVRTRIsWA8gi53LY8DTN8zhL70lwfCVtmM1MYt5+efV1S1fJP42bHXhz11qE7gYC6
 MCTsT2P5DhV49BMfJNIQTOLiTkRHBAxPwOWWZLv5/ogSqNGxdSpInyZZhbdGvFiV3qTL
 RVQK8RVZH2uDRWQHjogQ0nt8OJ83iai7DHOtoyQIrVXYaH8YVOGJ/D7b0KJZXB8bQ4IJ
 XZwNn3caJE/tu6mUp16tTTSaglGtj0C2e+dK6Efrz4Ah3a8sIEHV4bEm7aIw65aROwsR
 y0p/IOfLE+E06cocF4oUNy27o3XvzBssE6vkghCM4mHvyTQ7ASNx8K19dnF9ZsJoDPzp
 HP5g==
X-Gm-Message-State: AOAM531aUTCMawxOWEB0trS9r4szANEqaDHXOFJev2hlZdUXsocl0BbU
 Y7J/BiuFrH/kH4w1Wn+U92UZPFJLwF8WVw==
X-Google-Smtp-Source: ABdhPJzBFn6P6+xGcFMMLYpcEM6j6UEnhu2UpX9G5fE8ZcvlSDLRHJs9yWP9HLL5i6qhcOcOKpnXYA==
X-Received: by 2002:a17:90b:3b4d:: with SMTP id
 ot13mr3005662pjb.151.1625723168549; 
 Wed, 07 Jul 2021 22:46:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:dcfe:ded1:61a1:d785])
 by smtp.gmail.com with ESMTPSA id o91sm7929269pjo.15.2021.07.07.22.46.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jul 2021 22:46:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not perform unsafe cast of argv
Date: Thu,  8 Jul 2021 14:46:01 +0900
Message-Id: <20210708054601.9484-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..68a6302184a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1888,12 +1888,12 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     exit(status);
 }
 
-int main (int argc, const char * argv[]) {
+int main (int argc, char **argv) {
     QemuThread thread;
 
     COCOA_DEBUG("Entered main()\n");
     gArgc = argc;
-    gArgv = (char **)argv;
+    gArgv = argv;
 
     qemu_sem_init(&display_init_sem, 0);
     qemu_sem_init(&app_started_sem, 0);
-- 
2.30.1 (Apple Git-130)


