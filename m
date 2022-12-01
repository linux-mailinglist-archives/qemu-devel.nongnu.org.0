Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5654563F462
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:44:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhY-0005KE-Fv; Thu, 01 Dec 2022 10:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005Eo-DL; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhL-0004vv-4O; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E18D711EFD8;
 Thu,  1 Dec 2022 15:42:00 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 01 Dec 2022 15:42:00 +0000
Subject: [PATCH qemu.git v3 0/8] hw/timer/imx_epit: improve and fix EPIT
 compare timer
MIME-Version: 1.0
Message-ID: <166990932074.29941.8709118178538288040-0@git.sr.ht>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch set improves the i.MX EPIT emulation:
- fix #1263 for writes to CR
- ensure SR_OCIF is set properly even if CR_OCIEN is off
- hardware reset initialized CR to 0
- interrupt state update on CR writes (e.g. software reset)
- remove explicit fields cnt and freq (they are redundant)
- general code and documentation improvements

v3 addresses the comments from the previous iterations, but still keeps
the scope of this patchset limited to addressing the obvious bugs in the
behavior. It does not try to improve the timer accuracy, thus the
following remarks remain to be fixed in a future patch after this one is
merged:
- don't use PTIMER_POLICY_LEGACY. Fine tuning this requires more
  time and currently this is not a major concern, because the timer is
  working reasonably well.
- replace the modestly harmful sequence
        counter = ptimer_get_count(s->timer_reload);
        ...
        ptimer_set_count(s->timer_cmp, counter);
  by something better that does not lose or gain time. The current
  patchset does not introduce this sequence, it has been there
  before already. Again,  the current lack of accuracy here is not a
  major concern because the timer is working reasonably well.

Axel Heider (8):
  hw/timer/imx_epit: improve comments
  hw/timer/imx_epit: cleanup CR defines
  hw/timer/imx_epit: define SR_OCIF
  hw/timer/imx_epit: update interrupt state on CR write access
  hw/timer/imx_epit: hard reset initializes CR with 0
  hw/timer/imx_epit: factor out register write handlers
  hw/timer/imx_epit: remove explicit fields cnt and freq
  hw/timer/imx_epit: fix compare timer handling

 hw/timer/imx_epit.c         | 370 +++++++++++++++++++++---------------
 include/hw/timer/imx_epit.h |   8 +-
 2 files changed, 222 insertions(+), 156 deletions(-)

-- 
2.34.5

