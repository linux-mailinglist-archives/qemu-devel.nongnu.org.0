Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DEB25D02F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 06:04:29 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2xg-0006HR-V1
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 00:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hd-0002pW-Vg; Thu, 03 Sep 2020 23:47:55 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hc-0004xl-1a; Thu, 03 Sep 2020 23:47:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsr74sLz9sW4; Fri,  4 Sep 2020 13:47:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191249;
 bh=dJYbB/H9k9W6ajF6ItZ9vfEbGgJTvyYQif11q+Ws2WE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aKdIiO9aimy5LOmpjE8DueiJqrK4Ct2cZy2VsQrbd4PlYQTrSwf7luxK0Kiv+VxgM
 sLeB4s1y78XpH5U205Itbhy13DUrwYD/2PWgGX/fotwKplgMmicYbt7iiM7AbC7hVi
 6fmjuWQjLi8lnyU6PV+0QNn9U14y9r2NYCJX+ZRY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/30] sparc/sun4m: Don't set cs->halted = 0 in main_cpu_reset()
Date: Fri,  4 Sep 2020 13:47:09 +1000
Message-Id: <20200904034719.673626-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thiago Jung Bauermann <bauerman@linux.ibm.com>

We rely on cpu_common_reset() to set cs->halted to 0, it's redundant to do
it in main_cpu_reset().

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Message-Id: <20200826055535.951207-7-bauerman@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/sparc/sun4m.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index cf7dfa4af5..7484aa4438 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -224,7 +224,6 @@ static void main_cpu_reset(void *opaque)
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-    cs->halted = 0;
 }
 
 static void secondary_cpu_reset(void *opaque)
-- 
2.26.2


