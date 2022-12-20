Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BC652629
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gOy-0001L3-7S; Tue, 20 Dec 2022 12:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gOs-0001KK-NO; Tue, 20 Dec 2022 12:27:34 -0500
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gOq-00056G-9S; Tue, 20 Dec 2022 12:27:34 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 8D48A6000B;
 Tue, 20 Dec 2022 17:27:28 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] Fix i.MX GPT timers for i.MX6UL and i.MX7 processors
Date: Tue, 20 Dec 2022 18:27:17 +0100
Message-Id: <cover.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch series allow GPT timers to be used on Qemu emulated i.MX7.

In particular it allows GPT timer to raise interrupts in i.MX7 processor
and supports some of the fixed frequency clocks.

Note: CCM generated clock sources will be added with a later patch.

This also brings some fixes to the i.MX6UL GPT timer as its clock sources
differ slightly from the i.MX7 version.

Tested by running µCOS application on i.MX7D emulated processor. µCOS
is using the GPT timer as its tick source.

Jean-Christophe Dubois (3):
  i.MX7D: Connect GPT timers to IRQ
  i.MX7D: Compute clock frequency for the fixed frequency clocks.
  i.MX6UL: Add a specific GPT timer instance for the i.MX6UL

 hw/arm/fsl-imx6ul.c        |  2 +-
 hw/arm/fsl-imx7.c          | 10 ++++++++
 hw/misc/imx6ul_ccm.c       |  6 -----
 hw/misc/imx7_ccm.c         | 49 +++++++++++++++++++++++++++++++-------
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++
 include/hw/arm/fsl-imx7.h  |  5 ++++
 include/hw/timer/imx_gpt.h |  1 +
 7 files changed, 82 insertions(+), 16 deletions(-)

-- 
2.34.1


