Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6F45418F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:02:54 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEy5-0000BB-Uu
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtb-0004wC-9G; Wed, 17 Nov 2021 01:58:15 -0500
Received: from [2607:f8b0:4864:20::435] (port=34652
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtX-0005bC-PD; Wed, 17 Nov 2021 01:58:15 -0500
Received: by mail-pf1-x435.google.com with SMTP id r130so1780497pfc.1;
 Tue, 16 Nov 2021 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnefBrylWy8QEKCC1c48fL6Ne7IkZGFtlVNbY45TI+w=;
 b=lnv/aa94No7ZzBhe6/kPVopKD9ueGhvP+5sHNuc6qIRU3/5U9MyZe+BXRPQroab5XI
 aqkeoZR3fvTfopcWdlw5TXC6VSPOCM7xi+s812Och+l1Hr1Ux9DTwZkDhXyQsWBPcxHR
 EZz0CMvVJputaYZfLBX3Lssg/7NMD/tYD+j2N1vj483OaTNakhi4TI3ig5OJOVrMaOnI
 Nt0UoMl6anAfFhBd64Uvr22RBYrnGWdJORWAoLnvQW1hbSlH6PGLyzDvkdFMqKMFfiSg
 gxWjN2+h//7Tz/DTTKxyY+3RM7+E+HXN3cznElYDsmYnvY49KTTAIxMJrBNhJNRGXVFb
 J5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SnefBrylWy8QEKCC1c48fL6Ne7IkZGFtlVNbY45TI+w=;
 b=hUvBFfXPBUFbM59EWlmeNAXxoRgwCoDiB6969N0IAXoyJve/52rdzgLGpA9i3/9kOZ
 TZJ5n0TwfGW7BCQyQis/2npAWUDpEj647Pg2kzqeoFCZwLXgva6vfIBbmLGTnKSozYSy
 CZNVfS0x4ThEziJbgPM7OFuOB7RWO4UdscLE+6YQiX54J1nN1PgyWQytAp+anU5CmrPo
 usSurQmxrRid24qGcqA8gJt+NcsCxduAB+rh3ceymyqFYyvYoQYu00kBSqkcHLeEWbdx
 BvGO1tj7rj40uUcnv8zYXapDdd+D+mjNvMpzCbeGTxAP9c1H7UWy/Y8Gp1UVjQzHifSF
 Uu7A==
X-Gm-Message-State: AOAM530WltRUcky7HCEJV0MK85qqO9gS5eKvCJ5M4+xH//zdzH+y37+p
 U7Q711uInrMDXYawAb5U9ZiIZZriryz+9RNx
X-Google-Smtp-Source: ABdhPJz+ZKc5okS5eFiDjXiqSMWPMwPIrqz9Sd4ixlO78FzV+jq4AU2wlfweMyBxNVCocFUF7le9Zw==
X-Received: by 2002:a62:7802:0:b0:49f:d21e:1dc9 with SMTP id
 t2-20020a627802000000b0049fd21e1dc9mr45816508pfc.18.1637132290107; 
 Tue, 16 Nov 2021 22:58:10 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:09 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/4] docs: aspeed: Give an example of booting a kernel
Date: Wed, 17 Nov 2021 14:57:51 +0800
Message-Id: <20211117065752.330632-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A common use case for the ASPEED machine is to boot a Linux kernel.
Provide a full example command line.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b87697fcf0b1..6aafd611e9a5 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -78,9 +78,9 @@ Missing devices
 Boot options
 ------------
 
-The Aspeed machines can be started using the ``-kernel`` option to
-load a Linux kernel or from a firmware. Images can be downloaded from
-the OpenBMC jenkins :
+The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
+to load a Linux kernel or from a firmware. Images can be downloaded from the
+OpenBMC jenkins :
 
    https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
@@ -88,6 +88,15 @@ or directly from the OpenBMC GitHub release repository :
 
    https://github.com/openbmc/openbmc/releases
 
+To boot a kernel directly from a Linux build tree:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M ast2600-evb -nographic \
+        -kernel arch/arm/boot/zImage \
+        -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
+        -initrd rootfs.cpio
+
 The image should be attached as an MTD drive. Run :
 
 .. code-block:: bash
-- 
2.33.0


