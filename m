Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF272E4F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 13:58:56 +0200 (CEST)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqFv5-0006QH-2u
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqFue-0005TO-Gf
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqFud-0004b9-J5
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:58:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hqFud-0004au-Dy
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:58:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61DEC2ED2E4;
 Wed, 24 Jul 2019 11:58:26 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-166.ams2.redhat.com
 [10.36.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8831C600D1;
 Wed, 24 Jul 2019 11:58:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	pavel.dovgaluk@ispras.ru
Date: Wed, 24 Jul 2019 12:58:19 +0100
Message-Id: <20190724115823.4199-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 24 Jul 2019 11:58:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [for 4.2 PATCH v2 0/4] Remove time reset notifications
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
=20
The reset mechanism was only used by the mc146818 (i.e. PC) RTC
anyway; so lets remove it.

v2
  Remove the host_clock_last field in replay as per Pavel's review

Dr. David Alan Gilbert (4):
  mc146818rtc: Remove reset notifiers
  timer: Remove reset notifiers
  replay: Remove host_clock_last
  timer: last, remove last bits of last

 hw/timer/mc146818rtc.c   | 19 -------------------
 include/qemu/timer.h     | 35 ----------------------------------
 replay/replay-snapshot.c |  7 ++-----
 util/qemu-timer.c        | 41 +---------------------------------------
 4 files changed, 3 insertions(+), 99 deletions(-)

--=20
2.21.0


