Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF041D2D5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:48:12 +0200 (CEST)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVovT-00049p-8G
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos1-0000tL-Q8; Thu, 30 Sep 2021 01:44:37 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVorz-0003LF-Pu; Thu, 30 Sep 2021 01:44:37 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyQ6ry5z4xbP; Thu, 30 Sep 2021 15:44:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980670;
 bh=Hbf5PQQ1MXRc3VxbMWK0lcX0RKfAFcYUPhqyVBTMK/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ESXm3H0LJw20q73ISEGdt3K4l0pGQYUImjnkmCSDdNCKjLxkV8xZSTCWh1loNgMeJ
 +XwPLz8B4ymq1Bvmsdy2pLzcrSv+qhFhzAAq2TmNw8O+B9CUS+2Vav4B90+nouAkzF
 3g56WJfIMkPZPScEGBq8Dna1MvAf/SelFax2KQ3Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 01/44] host-utils: Fix overflow detection in divu128()
Date: Thu, 30 Sep 2021 15:43:43 +1000
Message-Id: <20210930054426.357344-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

The previous code didn't detect overflows if the high 64-bit
of the dividend were equal to the 64-bit divisor. In that case,
64 bits wouldn't be enough to hold the quotient.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210910112624.72748-2-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 util/host-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/host-utils.c b/util/host-utils.c
index 7b9322071d..a789a11b46 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -102,7 +102,7 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
         *plow  = dlo / divisor;
         *phigh = dlo % divisor;
         return 0;
-    } else if (dhi > divisor) {
+    } else if (dhi >= divisor) {
         return 1;
     } else {
 
-- 
2.31.1


