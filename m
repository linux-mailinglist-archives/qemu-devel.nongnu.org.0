Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E7309B8E
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:23:18 +0100 (CET)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ap3-00049i-Dg
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgF-0002uz-1v; Sun, 31 Jan 2021 06:14:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgD-0006cE-Ig; Sun, 31 Jan 2021 06:14:10 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so10727339wmq.1;
 Sun, 31 Jan 2021 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eh0nPPe+ccMxW9Cb/jr3NHaD25Nxmw47W22jriJyAa0=;
 b=qG77/DVNuWObaYdxvSPXp5aG31DRU/wwuuwJi7XpKzBbIN+GO30SCqSe+Ev8IPFx+J
 7AOHuOBnnOi2Mu1p26bxIbkAg7mNr8kTMVGj/d1RRoOyYaqlCOwSAECWsxACrs55ND4j
 XBxBOZ+46U6R2MmtCyyv/rI3TwxL8+lpwzo9N4P0iCRcWIv6FhslDGiBGYJzyyNRJOJM
 0Fya/lNgbOvAl16FrnWD4NIAPg8hdSNvc03xmCdsePxHZDJIexs3p+Kfa5NsO5eQ1ydy
 FFXy9x/slDkUf+t14rafYvKY3wcV5qpkcGGfm9UC6tWBQth6w+81RT82O9phB5VVKoFr
 h6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Eh0nPPe+ccMxW9Cb/jr3NHaD25Nxmw47W22jriJyAa0=;
 b=lwlOKu226O6K1Mlo0Pc4ZYAxJPHocrCzADWgba3R/JHDlhIgy0gYHuO9cr1rxsa37v
 rTvrhKsOwUuEemKkyfharDXXbRkCjLm8/zxfZULAUHHGIQNCXQ6XMVAKtGKBqkpwd/yK
 0dpvDfju0vKDEY18Er3iUwOgkv/Mu/81Fag8+i33B4ga9QriXbIMyMLNN3q/lHUQ1jX6
 ytNyRagOJK9QoXpn9O+EArpA+yNjkxpiX3elUBeuc9+vAMG3iPdPw/63y0OmNDnW/Y+L
 0e8c5Vw5VlqeHSlTVM6eIk/cU8wJaYC5gY+R4x13mpqd/yO0KV870h2Fe3Qyy0DEL0hX
 xAyQ==
X-Gm-Message-State: AOAM5303aIAQtfS5z1//CBDcJZWFPq4d8Jvm6T46jMqTFNF2LhjpjLLk
 7biATAL5KSbyH11DMz/udI+1G4YhaF4=
X-Google-Smtp-Source: ABdhPJz4doJnrW/LDttNtT/C/l19beETvSJdy/mFd/0h+4oo2oFT/uS3U7LQJZd1vVQMdWC5gHeIMw==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr10703980wma.33.1612091646092; 
 Sun, 31 Jan 2021 03:14:06 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id p15sm22584734wrt.15.2021.01.31.03.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:14:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/10] target/arm: Move V7M feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:13 +0100
Message-Id: <20210131111316.232778-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V7M is an architecture feature, move its declaration to target/arm/.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig     | 4 ----
 target/arm/Kconfig | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 09298881f2f..f3ecb73a3d8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -292,10 +292,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-    select PTIMER
-
 config ALLWINNER_A10
     bool
     select AHCI
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b2..1f05de47ca6 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,7 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+config ARM_V7M
+    bool
+    select PTIMER
-- 
2.26.2


