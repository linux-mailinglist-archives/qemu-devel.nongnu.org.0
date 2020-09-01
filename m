Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A44258492
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 01:53:35 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCtcE-0000co-Hg
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 19:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kCtae-0007Qy-Qf; Mon, 31 Aug 2020 19:51:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59993 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kCtab-0001lv-Am; Mon, 31 Aug 2020 19:51:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BgRnJ2D64z9sVS; Tue,  1 Sep 2020 09:51:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1598917908;
 bh=nG4THSSBSRu6talgiEXeSHesPr+b2X3e8ILBf5k4wys=;
 h=From:To:Cc:Subject:Date:From;
 b=AmY+kaDcw2RkElOYMvKMWwvnTDbVKXUmKnD6O1N4Il5+Udg9/G/xuSdcbkXklHJZZ
 eWYZ5dKbQn8wjfVhb3ik0ly/8c/JIWlVL7prMbTYVT9YYscM/dd4N1f2/f7X9z1wwb
 W027LcVN32+v1bvLFo856AGBMHewsMG+LBz6SiBw=
From: David Gibson <david@gibson.dropbear.id.au>
To: ehabkost@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] ppc: Fixes for class and instance size problems
Date: Tue,  1 Sep 2020 09:51:43 +1000
Message-Id: <20200831235146.36045-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 19:51:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As requested, some fixes for the ppc things found by Eduardo's=0D
scripts.=0D
=0D
Changes since v1:=0D
 * Rewrote 3/3 to make a more sensible fix=0D
=0D
C=C3=A9dric Le Goater (1):=0D
  ppc/pnv: Fix TypeInfo of PnvLpcController abstract class=0D
=0D
David Gibson (2):=0D
  adb: Correct class size on TYPE_ADB_DEVICE=0D
  spapr: Remove unnecessary DRC type-checker macros=0D
=0D
 hw/input/adb.c             |  1 +=0D
 hw/ppc/pnv_lpc.c           |  3 +--=0D
 include/hw/ppc/spapr_drc.h | 43 +-------------------------------------=0D
 3 files changed, 3 insertions(+), 44 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

