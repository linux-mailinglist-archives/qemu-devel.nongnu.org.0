Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED45F6980
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:22:19 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRlO-0007O6-VY
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogNzJ-0007rU-MF; Thu, 06 Oct 2022 06:20:22 -0400
Received: from guitar.tkos.co.il ([84.110.109.230]:47869 helo=mail.tkos.co.il)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogNzC-0004u9-62; Thu, 06 Oct 2022 06:20:21 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 577024403AE;
 Thu,  6 Oct 2022 13:18:14 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1665051494;
 bh=4H8rCxoz7VuT/+k8uFgTre/SvEacLxL28faqEWXnC6w=;
 h=From:To:Cc:Subject:Date:From;
 b=OLB3HCxbAB7YEKmx9nXCVFVrt2AWeCLUI1KqgeKvUjfHfE4M2Oh3rER2cgmdevbV4
 D4d0LThAYV1y0pxHKO9s+8mmAnl1WuyUQom1puNJZvZK8aRMhJYprsTY8LvSEoJylm
 AKjFOxJWwd1tWQ4bSdmhVOdlhvs+16eCV9gwFcUaU1d5rXWaldRoK1KGpYq4rTfkEM
 mnLgTSPUSajoT3RHBGK4qJT8wrgPCVuMJ1gyAdyNXBH42uu9+FjDRc8ldaMfwp2/SI
 0UIm+ZwD3YIajuNDhmC3yMJtCS3RiSdGOpTAsRT8wXuGAG5SnUwUr3tjg0XeqWZctC
 TviQKKeexVmUg==
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] hw/char/pl011: fix baud rate calculation
Date: Thu,  6 Oct 2022 13:19:48 +0300
Message-Id: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=84.110.109.230; envelope-from=baruch@tkos.co.il;
 helo=mail.tkos.co.il
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 10:17:08 -0400
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

The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
when this is the case". But the code looks at FBRD for the invalid case.
Fix this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 hw/char/pl011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6e2d7f75095c..c076813423fc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -176,7 +176,7 @@ static unsigned int pl011_get_baudrate(const PL011State *s)
 {
     uint64_t clk;
 
-    if (s->fbrd == 0) {
+    if (s->ibrd == 0) {
         return 0;
     }
 
-- 
2.35.1


