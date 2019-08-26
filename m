Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F3C9CD66
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 12:40:14 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2CQ0-0001zi-ER
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 06:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1i2CO7-0000nn-UG
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1i2CO4-0002Cp-8n
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:13 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1i2CO3-0002Bf-H9
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:12 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id BDEDB2E0A7B;
 Mon, 26 Aug 2019 13:38:06 +0300 (MSK)
Received: from smtpcorp1j.mail.yandex.net (smtpcorp1j.mail.yandex.net
 [2a02:6b8:0:1619::137])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 dfExGbmTBM-c6ZeEwnF; Mon, 26 Aug 2019 13:38:06 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1566815886; bh=yN3IEesQ55CoH347dHf+CtEz8HzlupVOz6+KV1wBYCY=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=A8ZsgCFLa1Qr+rME7KXpHcTTqO/g9fqWWVjvohYkmtXO7o5gT9/UPazxmPA6fMegz
 DvSE+IBptWu2fa2bvHuNqdGuxrzTaBXTdEOKV/NQQRk9wRmKLYD21mYyY6QjfA7mib
 QriQ5o2ppBiMqfcORHAQL2qPLV+18N9IvhRp+CSw=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:408:dc67:69ff:2705:c046])
 by smtpcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 mDIbqN0Ee6-c60SpSll; Mon, 26 Aug 2019 13:38:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Mon, 26 Aug 2019 13:37:23 +0300
Message-Id: <20190826103726.25538-1-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 77.88.29.217
Subject: [Qemu-devel] [PATCH v5 0/3] High downtime with 95+ throttle pct
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:Overall" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

V5:
* Updated sleep loop in throttle_thread at the suggestion of Paolo Bonzin=
i
* Fixed hanging of test

V4:
* The test was simplified to prevent false fails.

V3:
* Rebase fixes (migrate_set_parameter -> migrate_set_parameter_int)

V2:
* Added a test
* Fixed qemu_cond_timedwait for qsp

I wrote a test for migration auto converge and found out a strange thing:
1. Enable auto converge
2. Set max-bandwidth 1Gb/s
3. Set downtime-limit 1ms
4. Run standard test (just writes a byte per page)
5. Wait for converge
6. It's converged with 99% throttle percentage
7. The result downtime was about 300-600ms   <<<<

It's much higher than expected 1ms. I figured out that cpu_throttle_threa=
d()
function sleeps for 100ms+ for high throttle percentage (>=3D95%) in VCPU=
 thread.
And it sleeps even after a cpu kick.

Fixed it by using timedwait for ms part of sleep.
E.g timedwait(halt_cond, 1ms) + usleep(500).

Regards,
Yury

Yury Kotov (3):
  qemu-thread: Add qemu_cond_timedwait
  cpus: Fix throttling during vm_stop
  tests/migration: Add a test for auto converge

 cpus.c                   |  25 +++++---
 include/qemu/thread.h    |  18 ++++++
 tests/migration-test.c   | 120 +++++++++++++++++++++++++++++++++++----
 util/qemu-thread-posix.c |  40 +++++++++----
 util/qemu-thread-win32.c |  16 ++++++
 util/qsp.c               |  18 ++++++
 6 files changed, 206 insertions(+), 31 deletions(-)

--=20
2.22.0


