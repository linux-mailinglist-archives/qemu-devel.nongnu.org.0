Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962E25BEFE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 12:23:01 +0200 (CEST)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDmOS-0001Xb-L2
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 06:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kDmNX-0000VV-Di; Thu, 03 Sep 2020 06:22:03 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:63999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kDmNU-0007SP-CO; Thu, 03 Sep 2020 06:22:03 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1342D449F3;
 Thu,  3 Sep 2020 12:13:29 +0200 (CEST)
Date: Thu, 03 Sep 2020 12:13:21 +0200
From: Fabian =?iso-8859-1?q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
Subject: Re: [RFC qemu 0/6] mirror: implement incremental and bitmap modes
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20200218100740.2228521-1-f.gruenbichler@proxmox.com>
 <d35a76de-78d5-af56-0b34-f7bd2bbd3733@redhat.com>
In-Reply-To: <d35a76de-78d5-af56-0b34-f7bd2bbd3733@redhat.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1599127031.9uxdp5h9o2.astroid@nora.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=f.gruenbichler@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 06:13:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On August 21, 2020 3:03 pm, Max Reitz wrote:
> On 18.02.20 11:07, Fabian Gr=C3=BCnbichler wrote:
>=20
> [Sorry :/]

same, I've been meaning to ping/pick this back up but other stuff got in=20
the way. so thanks for the reminder to get this upstream ;)

>=20
>> picking up on John's in-progress patch series from last summer, this is
>> a stab at rebasing and adding test cases for the low-hanging fruits:
>>=20
>> - bitmap mirror mode with always/on-success/never bitmap sync mode
>> - incremental mirror mode as sugar for bitmap + on-success
>>=20
>> Fabian Gr=C3=BCnbichler (4):
>>   mirror: add check for bitmap-mode without bitmap
>>   mirror: switch to bdrv_dirty_bitmap_merge_internal
>>   iotests: add test for bitmap mirror
>>   mirror: move some checks to QMP
>>=20
>> John Snow (2):
>>   drive-mirror: add support for sync=3Dbitmap mode=3Dnever
>>   drive-mirror: add support for conditional and always bitmap sync modes
>=20
> Looks reasonable to me.  I would indeed merge patches 2 through 4 into a
> single one, and perhaps switch patches 5 and 6.
>=20
> Also, we still need an S-o-b from John on patch 2.
>=20
> I have one question: When the mirror job completes successfully (or is
> cancelled =E2=80=9Csuccessfully=E2=80=9D), the bitmap is always fully cle=
ared when the
> job completes, right?  (Unless in =E2=80=9Cnever=E2=80=9D mode.)

I have to take a closer look as well, it's been a while ;) IIRC the idea=20
was that failed mirrors would allow re-using the bitmap for a next=20
attempt, unless the mode is always. we are not using that feature (yet)=20
though (see below).

> Not that I think we should change the current implementation of =E2=80=9C=
clear
> sync_bitmap; merge dirty_bitmap into sync_bitmap;=E2=80=9D.  Just a quest=
ion for
> understanding.
>=20
>=20
> Soo...  What=E2=80=99s the plan?

I'll rebase, squash as suggested and resend next week! I am not sure how=20
the S-O-B by John is supposed to enter the mix - should I just include=20
it in the squashed patch (which would be partly authored, but=20
not-yet-signed-off by him otherwise?)? do you pick it up once he's=20
replied with one?

FWIW, with been running with this for quite a while downstream with no=20
issues, but we are only using the following part:

- create bitmap(s)
- (incrementally) replicate storage volume(s) out of band (using ZFS)
- incrementally drive mirror as part of a live migration of VM
- drop bitmap(s)

so no fancy semi-permanent bitmap that gets re-used here. I've been=20
toying with implementing some sort of generic replication feature akin=20
to zfs send/recv though, but given that we only have built-in persistent=20
bitmaps with qcow2 and the chance of some other tool or the user messing=20
up other image formats is high, the safe usage scenarios are a bit=20
limited.

we do use such long-running bitmaps for our new backup driver though,=20
and it works quite well there!
=


