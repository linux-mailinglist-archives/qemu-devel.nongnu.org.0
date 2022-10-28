Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF2611813
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:50:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSTB-0006hw-JD; Fri, 28 Oct 2022 12:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooST0-0004Re-4y; Fri, 28 Oct 2022 12:44:22 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSy-0000x4-DR; Fri, 28 Oct 2022 12:44:21 -0400
Received: by mail-oi1-x22e.google.com with SMTP id t10so6714493oib.5;
 Fri, 28 Oct 2022 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LRbBucj4Y7vI8Jav5c0MpNFLgAoYCOD3t1+Eh8zQLg=;
 b=hkAf+ixaBeD963VxxLVHruhdtVo2VUZ143uMbiBmYfoeznP2GQ1O7hJdYzxa5fga+c
 ZQJkHtmYhEmutsoISIRk7SNrtW076/jnJ4Mgl0lKQUXtftUhTfi+ym64zHRvCmVrz78z
 oe6xxA6+1svoXRzw9ReCLqHtiM22wiTcLeMWkhHodvnepZWly17WefTGHqHtuiRL+53/
 o9lUSizwTeWagQ9/6oKl+hWjiWqYTMls/bBM9qUAQ8dxyvpAOhcFFx2MLAo48ivwMMcC
 DFUxnopRoVZbrh8IHK96RJT7eDHd1foHADOP4Z/EkfXAXVSiqJrl09lxLokBbtDlTX6K
 ak1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LRbBucj4Y7vI8Jav5c0MpNFLgAoYCOD3t1+Eh8zQLg=;
 b=HAldXIM6Cw4NNHaDJNwNLvemN2jYhcOy//1tibaPmBaYnyB1mSeGWsayKOGvuy/Ltv
 6m+ONwOL/+nymSF3AWHeAxyJrtwO5Y2W0juWRPWlnSF63s7BudfXpuj+qG5oZwAjybAD
 Y0INtk3pqbn5UzxPQ+Ip55u4WKPM954iaksOLgyNu6RPiej7SydmA8Z1cMyMZOAmzNLV
 1AfwzNBAbC3xAhnKttzhtALEkh2ZBQjtIMCT2DO8zOzJZIAn8ZZc0ZbTMeDn05glyea1
 GyRWDk0s0hC/SpiB4fSUox7NYOFtj3nbQkrAq3R+72g5hzSBvb7M73cr56pWgVFE7Gf/
 F+MA==
X-Gm-Message-State: ACrzQf0obrKhCOKryTzGwBRddLSznxrSq3toiO8dkW+Os7NqfxIZ6e/e
 LCP0ma0z2kADkMqkl+YXw/woFFsjVsUu1A==
X-Google-Smtp-Source: AMsMyM7z1yP0XY/bvmRt0UamKTk7WeKvmlRkHKrfl8/Vz/T8fmTDkjGCYJt8rjzE4i7Q/atkApFeqw==
X-Received: by 2002:a05:6808:11c5:b0:34b:75dd:2ee9 with SMTP id
 p5-20020a05680811c500b0034b75dd2ee9mr159972oiv.285.1666975459057; 
 Fri, 28 Oct 2022 09:44:19 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 58/62] docs/system/ppc/ppce500: Use qemu-system-ppc64 across
 the board(s)
Date: Fri, 28 Oct 2022 13:39:47 -0300
Message-Id: <20221028163951.810456-59-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The documentation suggests that there is a qemu-system-ppc32 binary
while the 32 bit version is actually just named qemu-system-ppc. Settle
on qemu-system-ppc64 which also works for 32 bit machines and causes
less clutter in the documentation.

Found-by: BALATON Zoltan <balaton@eik.bme.hu>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221018210146.193159-2-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
2.37.3


