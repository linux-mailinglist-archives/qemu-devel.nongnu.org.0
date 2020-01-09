Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78468135E62
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 17:35:42 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipamb-0001rd-Ar
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 11:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ipal8-0000Hc-AY
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:34:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ipal6-0006cW-RK
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:34:10 -0500
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:49059)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ipal6-0006Md-JA
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 11:34:08 -0500
Received: from player715.ha.ovh.net (unknown [10.108.16.187])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id C855212BF68
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 17:34:04 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 9E339DDCBFC4;
 Thu,  9 Jan 2020 16:33:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/2] ppc: add support for Directed Privileged Doorbell
 (non-hypervisor)
Date: Thu,  9 Jan 2020 17:33:44 +0100
Message-Id: <20200109163346.23062-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6195827190315781094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiuddgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.43.93
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The Processor Control facility POWER8 processors and later provides a
mechanism for the hypervisor to send messages to other threads in the
system (msgsnd instruction) and cause hypervisor-level exceptions.

Privileged non-hypervisor programs can also send messages (msgsndp
instruction) but are restricted to the threads of the same
subprocessor and cause privileged-level exceptions. The Directed
Privileged Doorbell Exception State (DPDES) register reflects the
state of pending privileged-level doorbell exceptions for all threads
and can be used to modify that state.

If the MSGP facility is not in the HFSCR, a hypervisor facility
unavailable exception is generated when these instructions are used or
when the DPDES register is accessed by the supervisor.

Based on previous work from Suraj Jitindar Singh. I took ownership due
to the amount of changes.

Thanks,
=20
C.

C=C3=A9dric Le Goater (2):
  target/ppc: Add privileged message send facilities
  target/ppc: add support for Hypervisor Facility Unavailable Exception

 target/ppc/cpu.h                |  7 +++
 target/ppc/helper.h             |  4 ++
 target/ppc/excp_helper.c        | 81 ++++++++++++++++++++++++++++-----
 target/ppc/misc_helper.c        | 63 +++++++++++++++++++++++++
 target/ppc/translate.c          | 26 +++++++++++
 target/ppc/translate_init.inc.c | 20 ++++++--
 6 files changed, 186 insertions(+), 15 deletions(-)

--=20
2.21.1


