Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D8249A09
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:15:17 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8L7k-00037c-6l
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2x-0001Qt-JT; Wed, 19 Aug 2020 06:10:19 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2t-0006Yu-N2; Wed, 19 Aug 2020 06:10:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id D2D6E5892848;
 Wed, 19 Aug 2020 12:10:06 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0040bfb8cb4-1cc2-44d3-8914-ad8784b5ddb9,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/21] ftgmac100: Fix interrupt status "Packet moved to RX
 FIFO"
Date: Wed, 19 Aug 2020 12:09:46 +0200
Message-ID: <20200819100956.2216690-12-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 51cc5977-7c5e-4ed7-b3be-ea338f5b725c
X-Ovh-Tracer-Id: 18049864357437082473
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we don't model the RX or TX FIFO, raise the "Packet moved to RX
FIFO" interrupt status bit as soon as we are handling a RX packet.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index aa3c05ef9882..5c0fe2d8cb75 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -950,6 +950,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         break;
     }
 
+    s->isr |= FTGMAC100_INT_RPKT_FIFO;
     addr = s->rx_descriptor;
     while (size > 0) {
         if (!ftgmac100_can_receive(nc)) {
@@ -1001,8 +1002,6 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
             /* Last buffer in frame.  */
             bd.des0 |= flags | FTGMAC100_RXDES0_LRS;
             s->isr |= FTGMAC100_INT_RPKT_BUF;
-        } else {
-            s->isr |= FTGMAC100_INT_RPKT_FIFO;
         }
         ftgmac100_write_bd(&bd, addr);
         if (bd.des0 & s->rxdes0_edorr) {
-- 
2.25.4


