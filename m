Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB453A5A93
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:17:39 +0200 (CEST)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXUA-0006tZ-6A
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXT2-0005Kj-HA
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:28 -0400
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180]:54940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXT1-0001KP-1a
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618986; bh=gkzEzR9JMEx0r3GztDkbytTr1BhXloZjlUExOBrQRNg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=VDLP3reFWo+7l+Ghhj54kZsnUx2S2TIn9nv2q5ZWZYNapJWj1FMMWthNWHM6vZuqy
 QQIaLmjexjSiveISXUqjG5JLghFilNebLIIZ5hNxhQJrclnEY13KlX2HbIdTtxolmy
 WxJhpeqwuTrjDvlA5JtaxgH4Rmvj/W/D8o+WRlXiAu93XPxK7/F+M844LNd4f3uOis
 3K9qOcWRC0Vgq4GTPUVSOocq2ilDOei3QjEoKsTqMQPPjnKU7Ltc49lSlkm8efbSRQ
 xthQlupadGJEcksvdlgtoYr+hicdL5Jqgsbp7SA/CoC6uyH2QxdGVDvhQfpigPZyeE
 y9DjmCQmGAIRQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id 8CAB5340267;
 Sun, 13 Jun 2021 21:16:25 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH 1/4] mc146818rtc: Make PF independent of PIE
Date: Sun, 13 Jun 2021 14:15:46 -0700
Message-Id: <20210613211549.18094-2-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210613211549.18094-1-thorpej@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-13=5F09:2021-06-11=5F06,2021-06-13=5F09,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=625 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106130151
Received-SPF: pass client-ip=17.58.23.180; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06021101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/rtc/mc146818rtc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 4fbafddb22..366b8f13de 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -155,10 +155,6 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
 {
     int period_code;
 
-    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
-        return 0;
-     }
-
     period_code = s->cmos_data[RTC_REG_A] & 0x0f;
 
     return periodic_period_to_clock(period_code);
-- 
2.30.2


