Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8293ADB89
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 21:40:25 +0200 (CEST)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lugpM-0005cl-7d
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 15:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lugoE-0004wB-NQ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 15:39:14 -0400
Received: from mr85p00im-zteg06021501.me.com ([17.58.23.183]:52490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lugoD-0005Xl-4V
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 15:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624131552; bh=rmTsxP2tTeo80vgvhm2iltU3l0P3as5PF60ee64mBr8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=aqEcAuBZ/h5mCoTbr61iE234PT0qo9sY5hzegGMN32V+PJV6kzVf+8F8hPt6OQ3eM
 l69naxa4I/FaYjGMoVLxnZVqRJc9VKYlS0TXjh5aJRKJflFJW6ATJErgnZKQUddpFN
 oRlA7/igq5nOk8AYOwmR/XRIRSsd8U+bXniSBKzka/VhSDzJ/aS8lFNhUG5POuRHQj
 G1HiBOXZ5/IvlFAOd1FA07pvODPvRr3dCxZbPnlGjqkpCqTVpHgX8MGPIn+ti4jnTA
 0POtaDYhAGpw0EqSyAcB6xuT7b2FPRfY1YYuUu6sRv9xtdIaCb8amchAzsJnUGdcgK
 bcF88PcvTpTUw==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-zteg06021501.me.com (Postfix) with ESMTPSA id 0AE0538044B;
 Sat, 19 Jun 2021 19:39:10 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>, richard.henderson@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, f4bug@amsat.org
Subject: [PATCH v2] mc146818rtc: Make PF independent of PIE
Date: Sat, 19 Jun 2021 12:38:49 -0700
Message-Id: <20210619193849.27889-1-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-19=5F15:2021-06-18=5F01,2021-06-19=5F15,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=370 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106190131
Received-SPF: pass client-ip=17.58.23.183; envelope-from=thorpej@me.com;
 helo=mr85p00im-zteg06021501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the PF flag behave like real hardware by always running the
periodic timer without regard to the setting of the PIE bit, so
that the PF will be set when the period expires even if an interrupt
will not be raised.  This behavior is documented on page 16 of the
MC146818A advance information datasheet.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hw/rtc/mc146818rtc.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 4fbafddb22..85abdfd9d1 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -155,9 +155,24 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
 {
     int period_code;
 
-    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
-        return 0;
-     }
+    /*
+     * Quoting the data sheet "MC146818A Advance Information", 1984,
+     * page 16:
+     *
+     * <quote>
+     * PF - The periodic interrupt flag (PF) is a read-only bit which is
+     * set to a "1" when a particular edge is detected on the selected tap
+     * of the divider chain.  The RS3 to RS0 bits establish the periodic
+     * rate.  PF is set to "1" independent of the state of the PIE bit.
+     * PF initiates an ~IRQ signal and sets the IRQF bit when PIE is also
+     * a "1".  The PF bit is cleared by a ~RESET or a software read of
+     * Register C.
+     * </quote>
+     *
+     * As such, we always run the timer irrespective if the state of
+     * either bit so as to always set PF at regular intervals regardless
+     * of when software reads it.
+     */
 
     period_code = s->cmos_data[RTC_REG_A] & 0x0f;
 
-- 
2.30.2


