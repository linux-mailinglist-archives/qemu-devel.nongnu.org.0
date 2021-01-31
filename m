Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45A309B87
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:16:49 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Aim-0005G5-AS
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgR-0003SF-Hv; Sun, 31 Jan 2021 06:14:23 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AgQ-0006nV-0d; Sun, 31 Jan 2021 06:14:23 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a1so13469233wrq.6;
 Sun, 31 Jan 2021 03:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+U3nLCLAwB5cFSUB8M9sBsCoJgPFLGLn3AiQdETqYc=;
 b=F7xvz2a4Av9sQ1J9xlj0W/SmUCWPaAf/0CAl9b76xFlgd3Ytn6xlEVysgmoLA//gwV
 Fz6eLoh2H2dcE3xuCpdg1Sr/HLsW6AwUAL2lf9WxOf4LqraNJIuuSS4XH5L/nwBaSaMy
 9YuQhbCAK/xKKMe6SUWazsFHadNxZSika87+p8A5uNbHdcvWxNIqlkja8JCP+LeZzAld
 Cm7PLKH7OfOOSGzDus7KJeYeCUz/xY4HV+VXd6tNnqqVWTJ0GfPLCuy8/yuxt9iA82Yi
 dCSD2p24tt4KAyc+WvQz9fFx4qOQ4dy8o6Vdj9NHFJ4/PCpZM+qYfH4MLJi0OBFAlw5Y
 7HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E+U3nLCLAwB5cFSUB8M9sBsCoJgPFLGLn3AiQdETqYc=;
 b=d28Y88VWh57Q1LBQmB4uE4YVbU+cdyt/W0FgQ484CRs/9obFjLpH8ltkO5dtNx75Jh
 Ndq2gwg9nRvRy5vIPtfn1IHtKTP3ZbgDBA4sXuOXsa7V83m279ZXDhiZMl4C5qNvY4BZ
 FS+Sn6zM7oJ/R15iSzXdzSFkzMIHlEAd2Y0Iz9V+jCL8RoZ3RKfJsIFsbI7pRODhndHr
 a8uTqUT3rMSMrNbjJXpLkWvjCwip8QBy75pjojqAKm2GSuKdyVISq9ymN6O0BhGhJ/gY
 hM49Dok/8bH1RIlEXZTHqMm9bN3CB+yMGb55Bh5E7hqVS05RJABgnBsKqEUNkpcK6tC+
 OB5w==
X-Gm-Message-State: AOAM530/C473gX9pmJh5R+jWouxtSKQxyShNlzNiT8jFfG3v1YFEe7t7
 ju8w/CkpwsZW1I7pkfb3YoKKRX6Tz0s=
X-Google-Smtp-Source: ABdhPJy30l58DKSg0ZGp97k54Lb3Vy3dgfEEA0Qiy7Cu/d9Ok8KuwBLumNkzx3d49+pKEvKyVuELcw==
X-Received: by 2002:adf:f606:: with SMTP id t6mr13317727wrp.360.1612091658986; 
 Sun, 31 Jan 2021 03:14:18 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i15sm11407947wmq.26.2021.01.31.03.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:14:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature to
 target Kconfig
Date: Sun, 31 Jan 2021 12:13:15 +0100
Message-Id: <20210131111316.232778-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
declaration to each target/ARCH/.

Note, we do not modify the linux-user targets, as user-mode builds
don't use Kconfig.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak     | 1 -
 default-configs/devices/riscv32-softmmu.mak | 1 -
 default-configs/devices/riscv64-softmmu.mak | 1 -
 target/arm/Kconfig                          | 1 +
 target/riscv/Kconfig                        | 2 ++
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 341d439de6f..0824e9be795 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,5 +41,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 5c9ad2590ef..94a236c9c25 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5b2e25b6df..76b61956489 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 1f05de47ca6..ae89d05c7e5 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,5 +1,6 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config AARCH64
     bool
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
index b9e5932f13f..c3b9d8a1cf1 100644
--- a/target/riscv/Kconfig
+++ b/target/riscv/Kconfig
@@ -1,5 +1,7 @@
 config RISCV32
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config RISCV64
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.26.2


