Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7017031F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 17:07:53 +0200 (CEST)
Received: from localhost ([::1]:34413 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpZup-0005qh-Dd
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 11:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44795)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuN-00057i-D4
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hpZuM-0002dQ-Hf
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hpZuM-0002cv-CV
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:07:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E01130C7128;
 Mon, 22 Jul 2019 15:07:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-221.ams2.redhat.com
 [10.36.117.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39DC15D72E;
 Mon, 22 Jul 2019 15:07:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	pavel.dovgaluk@ispras.ru
Date: Mon, 22 Jul 2019 16:07:14 +0100
Message-Id: <20190722150717.10564-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 22 Jul 2019 15:07:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [for 4.2 PATCH 0/3] Remove time reset notifications
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Timers have a mechanism for detecting host clock jumps; this relied
on noticing if the time had gone backwards or if it had gone forward
more than 60s since we last read it.  This had assumed that we regularly
read the time, which isn't true any more - we might not read the host
timer until the guest explicitly reads the guest RTC (e.g. hwclock).
This falsely triggers the reset mechanism.

The reset mechanism was only used by the mc146818 (i.e. PC) RTC
anyway; so lets remove it.

Dr. David Alan Gilbert (3):
  mc146818rtc: Remove reset notifiers
  timer: Remove reset notifiers
  timer: last, remove last bits of last

 hw/timer/mc146818rtc.c   | 19 -------------------
 include/qemu/timer.h     | 35 ----------------------------------
 replay/replay-snapshot.c |  3 +--
 util/qemu-timer.c        | 41 +---------------------------------------
 4 files changed, 2 insertions(+), 96 deletions(-)

--=20
2.21.0


