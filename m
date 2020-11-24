Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC502C1DC0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 06:53:43 +0100 (CET)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khRGo-0002kw-19
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 00:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khREh-0001cg-Ct; Tue, 24 Nov 2020 00:51:31 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51961 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1khREe-0005WQ-Gd; Tue, 24 Nov 2020 00:51:30 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CgCnK1DYqz9sSs; Tue, 24 Nov 2020 16:51:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606197077;
 bh=VmMcyZdEQjK2VNC0ULrv8tgwpzU7f8ZwHRJ9OCoOeAg=;
 h=From:To:Cc:Subject:Date:From;
 b=nDsXTO88z1XcfThz0gzHKXSOpDvV9xXu+adv2bZ0zbEveSHIWqXB09gny+WoX8Xeh
 HwwBuvOZkF5RH3IGkAkcmRJmUMzf3DGyh7W/DRZASIHYDzqZTfwy/JFD9Fs3I1QcnK
 MbYvZJYlo4WMHWIfsiyQ9CA/502GVt7J8y2uVqXw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/1] ppc-for-5.2 queue 20201124
Date: Tue, 24 Nov 2020 16:51:13 +1100
Message-Id: <20201124055114.1017066-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-5.2-20201124

for you to fetch changes up to afae37d98ae991c0792c867dbd9f32f988044318:

  ppc/translate: Implement lxvwsx opcode (2020-11-24 11:34:18 +1100)

----------------------------------------------------------------
ppc patch queue for 2020-11-24

One final update for qemu-5.2, implementing an instruction that we
already should have, given the ISA version we claim to support.  Sorry
for the lateness, I've been on holiday.

This isn't a regression, obviously, so if it misses qemu-5.2 it's not
a disaster, but it would be nice to have.  The risk is low that it
would break any existing instructions.

----------------------------------------------------------------
LemonBoy (1):
      ppc/translate: Implement lxvwsx opcode

 target/ppc/translate/vsx-impl.c.inc | 30 ++++++++++++++++++++++++++++++
 target/ppc/translate/vsx-ops.c.inc  |  1 +
 2 files changed, 31 insertions(+)

