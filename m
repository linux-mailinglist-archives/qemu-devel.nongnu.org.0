Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D1A81B8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 14:05:16 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5U2E-0007um-Ud
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 08:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1i5Typ-0006VO-KQ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1i5Tyn-0002lP-O8
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 08:01:43 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:28941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1i5Tyb-0002U2-Se; Wed, 04 Sep 2019 08:01:30 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id CBBA04683B;
 Wed,  4 Sep 2019 14:01:19 +0200 (CEST)
Date: Wed, 04 Sep 2019 14:01:15 +0200
From: Fabian =?iso-8859-1?q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
To: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <5777a218-1ba4-78e0-ef73-bdfeecf04b25@redhat.com>
 <436c161e-fe05-da2c-835c-562da489ba82@virtuozzo.com>
 <2cd9d887-0a14-771a-3cee-64f9a50056d1@redhat.com>
In-Reply-To: <2cd9d887-0a14-771a-3cee-64f9a50056d1@redhat.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567596886.bl8mxp5grx.astroid@nora.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.186.127.180
Subject: Re: [Qemu-devel] QEMU bitmap backup usability FAQ
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On August 21, 2019 11:19 pm, John Snow wrote:
>=20
>=20
> On 8/21/19 10:21 AM, Vladimir Sementsov-Ogievskiy wrote:
>> [CC Nikolay]
>>=20
>> 21.08.2019 1:25, John Snow wrote:
>>> Hi, downstream here at Red Hat I've been fielding some questions about
>>> the usability and feature readiness of Bitmaps (and related features) i=
n
>>> QEMU.
>>>
>>> Here are some questions I answered internally that I am copying to the
>>> list for two reasons:
>>>
>>> (1) To make sure my answers are actually correct, and
>>> (2) To share this pseudo-reference with the community at large.
>>>
>>> This is long, and mostly for reference. There's a summary at the bottom
>>> with some todo items and observations about the usability of the featur=
e
>>> as it exists in QEMU.
>>>
>>> Before too long, I intend to send a more summarized "roadmap" mail whic=
h
>>> details all of the current and remaining work to be done in and around
>>> the bitmaps feature in QEMU.
>>>
>>>
>>> Questions:
>>>
>>>> "What format(s) is/are required for this functionality?"
>>>
>>>  From the QEMU API, any format can be used to create and author
>>> incremental backups. The only known format limitations are:
>>>
>>> 1. Persistent bitmaps cannot be created on any format except qcow2,
>>> although there are hooks to add support to other formats at a later dat=
e
>>> if desired.
>>>
>>> DANGER CAVEAT #1: Adding bitmaps to QEMU by default creates transient
>>> bitmaps instead of persistent ones.
>>>
>>> Possible TODO: Allow users to 'upgrade' transient bitmaps to persistent
>>> ones in case they made a mistake.
>>=20
>> I doubt, as in my opinion real users of Qemu are not people but libvirt,=
 which
>> should never make such mistake.
>>=20
>=20
> Right, that's largely been the consensus here; but there is some concern
> that libvirt might not be the only user of QEMU, so I felt it was worth
> documenting some of the crucial moments where it was "easy" to get it wro=
ng.
>=20
> I think like it or not, the API that QEMU presents has to be considered
> on its own without libvirt because it's not a given that libvirt will
> forever and always be the only user of QEMU.
>=20
> I do think that any problems of this kind that can be solved in libvirt
> are not immediate, crucial action items. libvirt WILL be the major user
> of these features.

Chiming in with a bit of vacation-induced delay - libvirt is definitely=20
not the only user of QEMU's QMP interface - we at Proxmox use QEMU=20
directly in our Proxmox VE product (usually a rather recent version,=20
currently 4.0 with some cherry-picks and custom patches) and have been=20
doing so for quite a while (the earliest reference in git that I can=20
find is for QEMU 0.11.1, but there was SVN before that..).

IIRC, we currently only use the bitmap features for our own custom=20
backup jobs (shipped in our patched QEMU packages[1]), and are planning=20
to integrate differential mirroring on top of storage-level/ZFS=20
snapshots once that has stabilized upstream.

That being said, the same basic guidelines apply to us that apply to=20
libvirt - our users are (normally) also not talking QMP manually, our=20
stack does it for them. Misuse of QMP interfaces is thus a bug in our=20
software, and not a mistake made by its user. We do expose HMP over our=20
API, but that is more for convenience of power users than any real use=20
case that I am aware of.

1: patches #20-24 from https://git.proxmox.com/?p=3Dpve-qemu.git;a=3Dtree;f=
=3Ddebian/patches/pve;h=3D46bd31d60fe2c03571d9d29c7ee80f208206d37e;hb=3Dref=
s/heads/master
=


