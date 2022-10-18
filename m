Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721A6034DC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:24:47 +0200 (CEST)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oku4s-0004XU-C1
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjV-00022C-W3; Tue, 18 Oct 2022 17:02:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjT-0003uy-5Q; Tue, 18 Oct 2022 17:02:41 -0400
Received: by mail-ej1-x62d.google.com with SMTP id q9so35422604ejd.0;
 Tue, 18 Oct 2022 14:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QpJqdrv+0zgCoJ0ppLwX+f2zQkP4a80fpwm1b1P8fI=;
 b=J5f7WZ8RvMKI8erSjugJdEJxII0Xblc/CBF64/crRruRvrmo9o96yOGahegmYkKx5g
 jlo6k/W5b9ZgjCauO7AzlzDGlwoWZNhGxIsboKWvVa1jCP74zrVfCx/rGhGx5Tf6Tcgp
 t4sGb+1I3w+t7nfjLc9aNa3pRY64a8a+dzKV4cddEsrBB7Woo0aRfHOE00q4PWYbrk+6
 hQQy8H6bb03+1Ujam6dQjhbNt/Fxe6PwV/1A8akezA7QMdEkFL2flpADSXCbAKWlhpz0
 N2gYFoP0rNQsyDrFKVbK205MenBwsN6qdgx/0gH6KQHo3UYX1iUAVzPgz/koY9cH2Cjt
 awYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QpJqdrv+0zgCoJ0ppLwX+f2zQkP4a80fpwm1b1P8fI=;
 b=vzPB95nQ7TV5igk02PT55Yp75yF/TpVyjETZu5c+0VRG779FGHv7CPGn8uj3diinJ2
 Tdv/C/fkfmbO8LdxIr7GVPS0sbU/AFmxhzQRLp0gfqj2ChvC5xqGEObrweiz+13OEFtU
 rxfC2hAbabeoJZMZq4/lrT04iRDUNUimz/YCam3p6dP/Oo0tQxxrNZecLmSUUivmUYwj
 zYVzxaS5T0XHBDwY//mb4SiG5JRKv7BAu267wB0+2sJWBb+MB8xU4pjA5c2GDzi4a4LB
 gucqaRX5tCKG7Jm+TetRttZPXTy3/yaHHi9lUq8SzMI33+in1GJ6zAnuMinj32lLKY4H
 3LzQ==
X-Gm-Message-State: ACrzQf0evrjJfgjRUDei3cTihndzYv/BWuziqA63v+CcMLCQrPDeSClY
 EZqnHHyGtQTVZr+Se3hsG3G+J0dMIJQ=
X-Google-Smtp-Source: AMsMyM4mbmgKxzkzwq3OXJmUD9IFOHbBAylFLNl9x3DcYYAy9s4Td2t+V1FQAOopYi1K35xV75DGTw==
X-Received: by 2002:a17:906:9bd8:b0:78d:85f9:36ae with SMTP id
 de24-20020a1709069bd800b0078d85f936aemr4068908ejc.342.1666126955662; 
 Tue, 18 Oct 2022 14:02:35 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:35 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 1/7] docs/system/ppc/ppce500: Use qemu-system-ppc64 across
 the board(s)
Date: Tue, 18 Oct 2022 23:01:40 +0200
Message-Id: <20221018210146.193159-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

The documentation suggests that there is a qemu-system-ppc32 binary
while the 32 bit version is actually just named qemu-system-ppc. Settle
on qemu-system-ppc64 which also works for 32 bit machines and causes
less clutter in the documentation.

Found-by: BALATON Zoltan <balaton@eik.bme.hu>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index ba6bcb7314..7b5eb3c4ee 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -113,7 +113,7 @@ To boot the 32-bit Linux kernel:
 
 .. code-block:: bash
 
-  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
       -display none -serial stdio \
       -kernel vmlinux \
       -initrd /path/to/rootfs.cpio \
@@ -154,10 +154,10 @@ interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
 
 .. code-block:: bash
 
-  $ qemu-system-ppc -M ppce500 -smp 4 -m 2G \
-                    -display none -serial stdio \
-                    -bios u-boot \
-                    -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
+  $ qemu-system-ppc64 -M ppce500 -smp 4 -m 2G \
+                      -display none -serial stdio \
+                      -bios u-boot \
+                      -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
 
 The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC device
 if “-device eTSEC” is given to QEMU:
-- 
2.38.0


