Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FC47D662
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:18:28 +0100 (CET)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06C3-0005e6-Hs
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:18:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04or-0005v6-LB
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:28 -0500
Received: from pnkfpfxf.outbound-mail.sendgrid.net ([50.31.63.175]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04oo-00026P-Ff
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svin.in;
 h=from:subject:mime-version:content-transfer-encoding:to:cc:
 content-type;
 s=s1; bh=H5uxjPWv+NcWUFcXRA1SJZDBG4E4nnUAd8l8y5GeUNk=;
 b=vC90o5Jyl2bIGGzmxr7h/SSbFUi6tYg7Yo/V/qPTpawuIaiBjHan1lWrKiM0T12kV03U
 qLJHaCoq8Bt6eP/+MwyfJhR4ukYUI/Dq+TOBZUw9OPgkUFRdNmRAufjP2uN/gzZHUVV4Ku
 zXFKPAIpWeAYQFLzrJhsCzXijxPssWtoesvVV+jFcddQfyutgD/Mi0XIFIsyGex00gvhNu
 bITQLw+urNpvfa6CtlaIN9tc6xjVK5TXBKgnUm94P0IqycHWU8JH6GeHkcYEdnAlHQgdm/
 cVP2ChOuAhCxukVVyVv7iHfmF0MMF/LlNJrB2BPPC+5rO7UNvsgBnedGxCZUv8nQ==
Received: by filterdrecv-75ff7b5ffb-z69hd with SMTP id
 filterdrecv-75ff7b5ffb-z69hd-1-61C3573A-30
 2021-12-22 16:50:02.549174961 +0000 UTC m=+9657011.753718408
Received: from ne2.svin.in (unknown) by geopod-ismtpd-1-1 (SG) with ESMTP
 id yJIFbkzbQ2yx08Kzrn5pNA Wed, 22 Dec 2021 16:50:01.948 +0000 (UTC)
Received: from authenticated-user (ne2.svin.in [152.70.50.15])
 by ne2.svin.in (Postfix) with ESMTPA id F0FD017C09C;
 Wed, 22 Dec 2021 16:49:59 +0000 (UTC)
From: Oleg Vasilev <me@svin.in>
Subject: [RFC PATCH 0/2] accel/tcg: replace phys_pc with asid in TB htable key
Date: Wed, 22 Dec 2021 16:50:02 +0000 (UTC)
Message-Id: <20211222164947.634759-1-me@svin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: ne2.svin.in;
 auth=pass smtp.auth=admin@svin.in smtp.mailfrom=me@svin.in
X-Spamd-Bar: ++++
X-SG-EID: =?us-ascii?Q?vuv4bBSMv+s+sLXfbA0TX5eOZYkSPfNDFag09+IwHa3cTVRX1snJTadgqJKv5P?=
 =?us-ascii?Q?2zJivbOwWTKYxAgsB0RG=2FPfEgSI+MnhOzqFaoHf?=
 =?us-ascii?Q?I1WV7mzGRJMUQBgfT1cpaq3dicxFZiXV7f5ns+z?=
 =?us-ascii?Q?hiHWH8VcjukrHHDSHSWx4qIVUg1+wfOYrIg6W8H?=
 =?us-ascii?Q?v+HZb6hOHHIwbiStYX6w1+fzthuDMpSrOw=2FiRAd?=
 =?us-ascii?Q?NgXWe1LhUZ8SmujwqXQBmRZKxhSD4YQ1QOVSnX?=
To: qemu-devel@nongnu.org
Cc: Oleg Vasilev <me@svin.in>, Alex =?iso-8859-1?q?Benn=E9e?=
 <alex.bennee@linaro.org>
X-Entity-ID: R60PFX0ZT2z0LR3J/oF4GQ==
Content-Type: text/plain; charset=us-ascii
Received-SPF: pass client-ip=50.31.63.175;
 envelope-from=bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in;
 helo=pnkfpfxf.outbound-mail.sendgrid.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Dec 2021 13:16:15 -0500
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See last patch in series.

Oleg Vasilev (2):
  target/arm: move regime_ttbr helper
  accel/tcg: replace phys_pc with asid in TB htable key

 accel/tcg/cpu-exec.c             | 38 ++++++++------------------------
 accel/tcg/tb-hash.h              |  4 ++--
 accel/tcg/translate-all.c        |  7 +++---
 hw/core/cpu-sysemu.c             |  6 +++++
 include/exec/exec-all.h          |  1 +
 include/hw/core/cpu.h            |  8 +++++++
 include/hw/core/sysemu-cpu-ops.h |  6 +++++
 target/arm/cpu.c                 | 13 +++++++++++
 target/arm/helper.c              | 17 --------------
 target/arm/internals.h           | 17 ++++++++++++++
 10 files changed, 65 insertions(+), 52 deletions(-)

-- 
2.33.1


