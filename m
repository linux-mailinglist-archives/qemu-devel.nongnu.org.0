Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE63B1C98
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:33:57 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3wy-0007ne-Ab
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lw3nV-0002BB-03
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:09 -0400
Received: from pv34p98im-ztdg02162201.me.com ([17.143.234.141]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lw3nR-0006cH-6Q
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1624458242; bh=2z4U0oDDrdJRnTAQT2npbXuI2C0LiXS8afEPKYcyDVM=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=CCOlIdDTdzkFY179kxLKXkLYbx78iBwo3Q4t3tK7yQTgQ+AuczQSt+38tN9DADbCQ
 +JbnkYzTC8WA4tVCGCiRAXzTQwv/NMmZR/rIKywr6WgZClVNQ/aRTn614mygrTHzbr
 xY0vONAN+Fvdd0RrR1aH9zmpU446onRJAzksfQaLTWgthlHWRyT/pTUbaEUQZ3xO8h
 6k4e8aIUQMY/TyhS81yQi4TMO5XcVUtg76KnNEG2y42mZg84ZL5hqlC6lPA/TDp0a/
 oipeUzIsBodPXreVEGDykFLuE6c4G9gr2nADWseG35vM8FvE5GkZ/aIsauudl2XW7Z
 bSQSBaRj0wdnA==
Received: from smtpclient.apple (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by pv34p98im-ztdg02162201.me.com (Postfix) with ESMTPSA id AD1C11C025C;
 Wed, 23 Jun 2021 14:24:01 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3679.0.2\))
Subject: Re: [PATCH v2] mc146818rtc: Make PF independent of PIE
From: Jason Thorpe <thorpej@me.com>
In-Reply-To: <b9e20dbc-fa5f-1e37-ad8a-5d433d77c4b0@redhat.com>
Date: Wed, 23 Jun 2021 07:24:00 -0700
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, f4bug@amsat.org,
 mst@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <00FB4F43-698C-4888-91E7-45FE80CCFC67@me.com>
References: <20210619193849.27889-1-thorpej@me.com>
 <b9e20dbc-fa5f-1e37-ad8a-5d433d77c4b0@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3679.0.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_09:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=963 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2106230083
Received-SPF: pass client-ip=17.143.234.141; envelope-from=thorpej@me.com;
 helo=pv34p98im-ztdg02162201.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 21, 2021, at 7:46 AM, Paolo Bonzini <pbonzini@redhat.com> =
wrote:

> I agree that there's obviously a bug in QEMU.  However, I'm worried of =
two things with this patch.
>=20
> First, the RTC device model has a complicated mechanism to deliver =
missed ticks of the periodic timer.  This is used with old versions of =
Windows which lose track of time if periodic timer interrupts are not =
delivered.  This mechanism (implemented by rtc_coalesced_timer) right =
now always triggers an interrupt.  You need to change =
periodic_timer_update to not activate this mechanism if PIE=3D0, by =
checking for PIE=3D1 at the
>=20
>    if (s->lost_tick_policy =3D=3D LOST_TICK_POLICY_SLEW)
>=20
> conditional.

Makes sense.

> Second, the firmware could set a nonzero period, and this would cause =
continuous interruptions of the guest after the firmware stops, due to =
s->periodic_timer firing.  This is "optimized" by the bug that you are =
fixing.  To keep the optimization you could:
>=20
> - do the timer_mod in periodic_timer_update only if !PF || (PIE && =
lost_tick_policy=3D=3DSLEW)
>=20
> - in cmos_ioport_read, if !timer_pending(s->periodic_timer) call
>=20
>    periodic_timer_update(s, qemu_clock_get_ns(rtc_clock),
>                          s->period, true);
>=20
> to update s->next_periodic_time for the next tick and ensure PF will =
be set.

I might be missing some subtlety here, but by my reading of =
periodic_timer_update(), either one of those changes would result in a =
delay of the next latching of PF by however many ns the CPU was late in =
reading PF since the last time it was latched  Please correct me if =
I=E2=80=99m wrong about this!

There exists software out there in the wild that depends on PF latching =
at regular intervals regardless if when the CPU reads, it, i.e.:

PF          PF          PF          PF          PF          PF
    C            C                  C      C                  C

-- thorpej


