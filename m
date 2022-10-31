Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF170612EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:19:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLA-00016T-FH; Sun, 30 Oct 2022 22:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00014V-2Y; Sun, 30 Oct 2022 22:15:49 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL5-00033t-FT; Sun, 30 Oct 2022 22:15:48 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 96B9A11F257;
 Mon, 31 Oct 2022 02:15:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 02:15:45 +0000
Subject: [PATCH qemu.git 00/11] improve hw/timer/imx_epit
MIME-Version: 1.0
Message-ID: <166718254546.5893.5075929684621857903-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a follow-up on my initial work to fix https://gitlab.com/qemu-
project/qemu/-/issues/1263.
- fix #1263 for CR writes
- fix compare timer update
- software reset clears the interrupt
- do not persist CR.SWR bit
- general code cleanup and comment improvements

Axel Heider (11):
  hw/timer/imx_epit: fix typo in comment
  hw/timer/imx_epit: improve comments
  hw/timer/imx_epit: factor out register write handlers
  hw/timer/imx_epit: remove explicit fields cnt and freq
  hw/timer/imx_epit: simplify interrupt logic
  hw/timer/imx_epit: software reset clears the interrupt
  hw/timer/imx_epit: do not persist CR.SWR bit
  hw/timer/imx_epit: simplify CR.ENMOD handling
  hw/timer/imx_epit: cleanup CR defines
  hw/timer/imx_epit: fix compare timer update
  hw/timer/imx_epit: rework CR write handling

 hw/timer/imx_epit.c         | 372 +++++++++++++++++++-----------------
 include/hw/timer/imx_epit.h |   6 +-
 2 files changed, 200 insertions(+), 178 deletions(-)

-- 
2.34.5

