Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13282F7E79
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:45:46 +0100 (CET)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QMD-0001oB-UD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QKY-0000zv-7j
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0QKV-0004tM-MN
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610721836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmos91cwm9jd/qzG7MYl0X7trstXwSMHmVXhRIepIWk=;
 b=dttpdKjkN7LxR0d459DKQA/PxgB0wk20iloOFcMQ7cqJsKtrRPR6a3G8OVm/SrwhxK9Yjc
 2qbQtXS0p6KUPVkpP015LFpuHmrn8gIsJxhZ4JL3oHDZm4sZf1BUbuO+76tRN9VaalLTUk
 v9PHfvI+w5rU/h6xKJE6P5Y7XIBQf0g=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-BBNbonLGMiWZMHUk-giVkA-1; Fri, 15 Jan 2021 09:43:54 -0500
X-MC-Unique: BBNbonLGMiWZMHUk-giVkA-1
Received: by mail-vs1-f71.google.com with SMTP id h5so1566391vsq.15
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jmos91cwm9jd/qzG7MYl0X7trstXwSMHmVXhRIepIWk=;
 b=D51SPQ57LWOgm7MR18+fJM6e2cLgsOXYXiLxJIQSR+xLXOCnKDpkOSuT0xuldh6P6J
 qsWTHBN8woffEfDLFSht9S6GJ95vfeoqTc6GwGzaJqYidO6clYMGCpkR9/pnA4UNIu6/
 mg3KJag3Fr4/N5j43QT7AGJhV78gwMi8IZoRlVzu/I5X3L7Kb3/zEz/s+33ouU//B4QS
 wwUtyFWTI6see8wF0eJm6BbgvWdR0Qw5PNPBZ1SnLPXF87t37mj5DVcDT6kQOLmSx2tg
 tPUtmgyZ6a4gpVi8A1DuSba+15p5OCX8KVRwVAn5JpHnmqM0TsdrEHvJNyxmbBCD7Y/o
 s3MA==
X-Gm-Message-State: AOAM531w5m++bfCab67qGrX6fhy+hc0f68TrFTy63Ku91n1N2/WPyC/K
 MrGwFrLhW+79OQJi5ljcI4QbU+YKgw47AgOixNwr8dh1GY4zu33tnrISw2LggHyu2JJ1Vlo804g
 jtghRcJCkW5jQKLVlm21UUoMMP7aFZsM=
X-Received: by 2002:ab0:1309:: with SMTP id g9mr895753uae.113.1610721834074;
 Fri, 15 Jan 2021 06:43:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0y4xfUrzR2NFqd/dbPUmk9qsQMiKOHLjLMPfSPCwymntmVWSnBcSydl8oUhyDcvuU3DlzImTDxDUnQElrg1c=
X-Received: by 2002:ab0:1309:: with SMTP id g9mr895728uae.113.1610721833826;
 Fri, 15 Jan 2021 06:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-10-mreitz@redhat.com>
 <CAKJDGDZ+NGeuXbH0WuH73JyHYYnWVrLyNQberqOqF3b5p89pRg@mail.gmail.com>
 <3bba8b87-da1a-b951-bb1f-835ee85b00b8@redhat.com>
In-Reply-To: <3bba8b87-da1a-b951-bb1f-835ee85b00b8@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 11:43:27 -0300
Message-ID: <CAKJDGDb4H-_-k-_8karHWieAFTW6wXCYzE-ni60+dxbunPr9nA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] iotests/129: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 6:30 AM Max Reitz <mreitz@redhat.com> wrote:
>
> On 14.01.21 21:02, Willian Rampazzo wrote:
> > On Thu, Jan 14, 2021 at 2:41 PM Max Reitz <mreitz@redhat.com> wrote:
> >>
> >> Signed-off-by: Max Reitz <mreitz@redhat.com>
> >> ---
> >>   tests/qemu-iotests/129 | 4 ++--
> >>   tests/qemu-iotests/297 | 2 +-
> >>   2 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> >> index 6d21470cd7..201d9e0a0b 100755
> >> --- a/tests/qemu-iotests/129
> >> +++ b/tests/qemu-iotests/129
> >> @@ -20,7 +20,6 @@
> >>
> >>   import os
> >>   import iotests
> >> -import time
> >>
> >>   class TestStopWithBlockJob(iotests.QMPTestCase):
> >>       test_img =3D os.path.join(iotests.test_dir, 'test.img')
> >> @@ -32,7 +31,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
> >>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_i=
mg, "1G")
> >>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_i=
mg,
> >>                            "-b", self.base_img, '-F', iotests.imgfmt)
> >> -        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M =
128M', self.test_img)
> >> +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M =
128M',
> >> +                        self.test_img)
> >>           self.vm =3D iotests.VM()
> >>           self.vm.add_object('throttle-group,id=3Dtg0,x-bps-total=3D10=
24')
> >>
> >> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> >> index bfa26d280b..1dce1d1b1c 100755
> >> --- a/tests/qemu-iotests/297
> >> +++ b/tests/qemu-iotests/297
> >> @@ -27,7 +27,7 @@ import iotests
> >>   # TODO: Empty this list!
> >>   SKIP_FILES =3D (
> >>       '030', '040', '041', '044', '045', '055', '056', '057', '065', '=
093',
> >> -    '096', '118', '124', '129', '132', '136', '139', '147', '148', '1=
49',
> >> +    '096', '118', '124', '132', '136', '139', '147', '148', '149',
> >
> > Is this also part of mypy/pylint cleanup? It seems you are doing more
> > than that here. It would be good to have this listed in the commit
> > message.
>
> Sure, why not.  Something like =E2=80=9CAnd consequentially drop it from =
297's
> skip list.=E2=80=9D?

+1 Thanks!

>
> Though I think making a test pass pylint+mypy complaints basically means
> exactly to remove it from 297's skip list and then making 297 pass, so
> I=E2=80=99m not entirely sure it=E2=80=99s necessary.  But it can=E2=80=
=99t hurt, so.
>
> > Despite that,
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
> Thanks!
>
> Max
>
> >>       '151', '152', '155', '163', '165', '169', '194', '196', '199', '=
202',
> >>       '203', '205', '206', '207', '208', '210', '211', '212', '213', '=
216',
> >>       '218', '219', '222', '224', '228', '234', '235', '236', '237', '=
238',
> >> --
> >> 2.29.2
> >>
> >>
> >
>


