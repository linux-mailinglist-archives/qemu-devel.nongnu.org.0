Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE93A5A96
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:20:45 +0200 (CEST)
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXXA-0003w6-Eh
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXTE-0005ru-0L
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:40 -0400
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180]:55288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXTA-0001U9-W1
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618996; bh=CgFw72sanBOxSD07n3HOr1OZZb8QvrliCMzV2AN+9Kc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=l3y37dnkcnWxRiH7QRGMMVf97ZA9A0kia+ncK3AOjqae84Cu6NvFWlVaG5Ey2hvDf
 NStIGMpeCjVnxBWFKTe5VFhB0vKBBtDKJgUrYUE6OE9TFIkyUk22a6N5Jg+cymvozY
 DqZEgctwm7cXbwWOb7yeN9izBqwy6rQfZQxUbSRDGtzucLl07asvGySqcolh4tx2ET
 ZvMVpLcc39Io4Nq3m5L4823YAOZrakjz7HUpOaReg1Gp58GJADv1MHUgsy33HX5kGg
 UB7oj8aZLcn9AOBUBf6zv2Noe0Q7acEIilrXqRh1A4k9aPMINfKl7IOcA0q+4MT/Eo
 kRIzQZQu5VWAg==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id 95BA33404D3;
 Sun, 13 Jun 2021 21:16:35 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH 4/4] alpha: Provide console information to the PALcode at
 start-up.
Date: Sun, 13 Jun 2021 14:15:49 -0700
Message-Id: <20210613211549.18094-5-thorpej@me.com>
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
 suspectscore=0 malwarescore=0 mlxlogscore=792 mlxscore=0 spamscore=0
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

Redefine the a2 register passed by Qemu at start-up to also include
some configuration flags, in addition to the CPU count, and define
a flag to mirror the "-nographics" option.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hw/alpha/dp264.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index ac97104464..d86dcb1d81 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -72,9 +72,20 @@ static void clipper_init(MachineState *machine)
         cpus[i] = ALPHA_CPU(cpu_create(machine->cpu_type));
     }
 
+    /* arg0 -> memory size
+       arg1 -> kernel entry point
+       arg2 -> config word
+
+       Config word: bits 0-5 -> ncpus
+                    bit  6   -> nographics option (for HWRPB CTB)
+
+       See init_hwrpb() in the PALcode.  */
+
     cpus[0]->env.trap_arg0 = ram_size;
     cpus[0]->env.trap_arg1 = 0;
     cpus[0]->env.trap_arg2 = smp_cpus;
+    if (!machine->enable_graphics)
+      cpus[0]->env.trap_arg2 |= (1 << 6);
 
     /* Init the chipset.  Because we're using CLIPPER IRQ mappings,
        the minimum PCI device IdSel is 1.  */
-- 
2.30.2


