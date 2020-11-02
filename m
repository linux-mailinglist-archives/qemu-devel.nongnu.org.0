Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A592A28C9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 12:11:39 +0100 (CET)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZXkQ-0008Qr-9d
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 06:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXgw-0004ms-UZ; Mon, 02 Nov 2020 06:08:02 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39658
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXgu-0001fE-P6; Mon, 02 Nov 2020 06:08:02 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A291E5FBC5;
 Mon,  2 Nov 2020 12:07:58 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [RFC][PATCH 00/14] ARM Secure EL2 extension
Date: Mon, 02 Nov 2020 13:07:57 +0200
Message-ID: <1762176.tdWV9SEqCh@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

	Hi,

This patchset attempts to add ARMv8 soft-MMU target support for the
ARMv8.4-SEL2 (Secure EL2) extension.

Patches 1-4 are just some initial clean-up / revectoring.
Patches 5-9 add support for running EL2 in secure state.
Patches 10-13 add the secure state stage 2 translation.
=46inally patch 14 enables SEL2 for the fake max CPU.

It is preferable, but not necessary, to apply the 3 bug fixes I sent
last week first.

Comments welcome.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (14):
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: declare new AA64PFR0 bit-fields
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: return the stage 2 index for stage 1
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: secure stage 2 translation regime
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: add ARMv8.4-SEL2 extension
      target/arm: enable Secure EL2 in max CPU

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.c           |   2 +-
 target/arm/cpu.h           |  75 ++++++++-
 target/arm/cpu64.c         |   1 +
 target/arm/helper-a64.c    |   8 +-
 target/arm/helper.c        | 408 ++++++++++++++++++++++++++++++-----------=
=2D---
 target/arm/internals.h     |  53 +++++-
 target/arm/op_helper.c     |   4 +-
 target/arm/tlb_helper.c    |   3 +
 target/arm/translate-a64.c |   4 +
 target/arm/translate.c     |   6 +-
 target/arm/translate.h     |   1 +
 12 files changed, 407 insertions(+), 160 deletions(-)

=2D-=20
R=C3=A9mi Denis-Courmont




