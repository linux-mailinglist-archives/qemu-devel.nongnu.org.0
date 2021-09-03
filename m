Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F25840063B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:56:02 +0200 (CEST)
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFI9-0008ET-GK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF44-0004Ay-S2; Fri, 03 Sep 2021 15:41:28 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF3z-0002Hn-Eb; Fri, 03 Sep 2021 15:41:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D38B3BC4DEF4;
 Fri,  3 Sep 2021 21:41:13 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005529ff3e3-5baf-4015-8e80-cd1cd6ced47f,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/14] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
Date: Fri, 3 Sep 2021 21:41:01 +0200
Message-ID: <20210903194108.131403-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 75a1462f-297b-451b-9824-4b63a407bee8
X-Ovh-Tracer-Id: 8816077749439793958
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

There was a bit of a thinko in the state calculation where every odd pin
in was reported in e.g. "pwm0" mode rather than "off". This was the
result of an incorrect bit shift for the 2-bit field representing each
LED state.

Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210723043624.348158-1-andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7fa..fff19e369a39 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -272,7 +272,7 @@ static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
      * reading the INPUTx reg
      */
     reg = PCA9552_LS0 + led / 4;
-    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
+    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
     visit_type_str(v, name, (char **)&led_state[state], errp);
 }
 
-- 
2.31.1


