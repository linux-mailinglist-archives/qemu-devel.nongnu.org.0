Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B76521DB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:58:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3M-00047T-Rr; Tue, 20 Dec 2022 08:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3K-00046s-Um; Tue, 20 Dec 2022 08:53:06 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3J-0000z0-Aa; Tue, 20 Dec 2022 08:53:06 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-144bd860fdbso15500673fac.0; 
 Tue, 20 Dec 2022 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MH3PTa2rQEeojjP7It6N6X2oxiaoDUa4E4nRhBKXZH8=;
 b=XrfX2XL8mhO4XIBlmT2AQHZ6to3QXSgTqafi8OoZHeKyYpq+Vh2Z0QkLkuPSoetBf4
 3BSG/AeVKAYb3QRvRtLocguHAeWpvO0V/u+pJ39evyDWK5ppCwuEYH78DcLPijb/0/iU
 U6qVMCL6jZHLGbWd3ybwj+s+ufXuHlos7XzxyHD0BGny4YSsTMdUMOiYjnjOJe4bNGkG
 b3mpXQCh5uvb/fD5oefD7MtGfvb7SRpTcrR1fCjC2TaJVK6+I0cvveSSy4STywjxxDWc
 LR9lRCEfTuliw4gYiY9/64owqBMjqkV95YOYuWfIA0bUL8TKCL4bxK0EuLhcO/hVAo0a
 GWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MH3PTa2rQEeojjP7It6N6X2oxiaoDUa4E4nRhBKXZH8=;
 b=3LCB/UtP3h19Ws+ep3ulqMvGTvYU6tcS67msEJ1Oh9haXKqXYsX0zqSE4/e7HYOEO3
 cMCaeX+jwZqWnaRWpkdwugVdWFC5y8tcGJu+Scr5MFmIPjinJogc+pDVO67Btrznncme
 GJpaRJ3hhIPcsekTjjcvi8ily/c64N2Lv/W4aN688m4VfbSQFxYFL/uVIZXoK901fbv2
 DvR8BaAfVK9Z++8J84J/i7K5U19xJKZkH2y9q4QfeFw3d9rlk1qEwnOoGrT3lLfbiDc/
 c7c8rJAXzm/eUVO8+7LXKa/aH7Ggnzn60ADXepDPNxFaUsE1CDh8bKh+bj5MsrFOLg7g
 Y6NQ==
X-Gm-Message-State: ANoB5pkJ5VlRAWPT2aiBQ5iKOSSQzKQOA7naVhlpMamUVnvK0lY4edmp
 sbudfmSzlpCjEYintRhIjuSQHuWN0/U=
X-Google-Smtp-Source: AA0mqf5Wp2uzKUjolFGVW3qTFLuVQtGVIUwgwWaKJsNQE+Ken6tK1f8gx9kWJnRGyot/LRP7mrA/5g==
X-Received: by 2002:a05:6870:e8a:b0:144:87fc:f4b2 with SMTP id
 mm10-20020a0568700e8a00b0014487fcf4b2mr23453732oab.24.1671544383662; 
 Tue, 20 Dec 2022 05:53:03 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:03 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PULL 01/15] MAINTAINERS: downgrade PPC KVM/TCG CPUs and pSeries to
 'Odd Fixes'
Date: Tue, 20 Dec 2022 10:52:37 -0300
Message-Id: <20221220135251.155176-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The maintainer is no longer being paid to maintain these components. All
maintainership work is being done in his personal time since the middle
of the 7.2 development cycle.

Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
time to dedicate to them. It'll also (hopefully) keep expectations under
check when/if these components are used in a customer product.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20221117153218.182835-1-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716d5a24ad..9a8c40a1c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -276,7 +276,7 @@ R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: target/ppc/
 F: hw/ppc/ppc.c
 F: hw/ppc/ppc_booke.c
@@ -402,7 +402,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
-S: Maintained
+S: Odd Fixes
 F: target/ppc/kvm.c
 
 S390 KVM CPUs
@@ -1382,7 +1382,7 @@ R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: hw/*/spapr*
 F: include/hw/*/spapr*
 F: hw/*/xics*
-- 
2.38.1


