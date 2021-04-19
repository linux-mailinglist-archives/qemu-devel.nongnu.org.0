Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195533648E1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:14:22 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXTZ-0007Pi-6R
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYXRd-0004Yd-ST; Mon, 19 Apr 2021 13:12:21 -0400
Received: from kerio.kamp.de ([195.62.97.192]:34853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYXRb-0007by-K3; Mon, 19 Apr 2021 13:12:21 -0400
X-Footer: a2FtcC5kZQ==
Received: from [192.168.178.98] ([79.200.86.192])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 19 Apr 2021 19:12:09 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
Date: Mon, 19 Apr 2021 19:12:15 +0200
Message-Id: <A540D5C1-F0D5-4D82-B048-11BDB550D346@kamp.de>
References: <YH14BcdHL3swf9Q2@merkur.fritz.box>
In-Reply-To: <YH14BcdHL3swf9Q2@merkur.fritz.box>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: iPhone Mail (18D70)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Von meinem iPhone gesendet

> Am 19.04.2021 um 14:31 schrieb Kevin Wolf <kwolf@redhat.com>:
>=20
> =EF=BB=BFAm 19.04.2021 um 11:13 hat Peter Lieven geschrieben:
>>=20
>>=20
>>>> Am 19.04.2021 um 10:36 schrieb Peter Lieven <pl@kamp.de>:
>>>=20
>>>=20
>>>=20
>>>> Am 15.04.2021 um 17:22 schrieb Kevin Wolf <kwolf@redhat.com>:
>>>>=20
>>>> Peter, three years ago you changed 'qemu-img convert' to sacrifice some=

>>>> sparsification in order to get aligned requests on the target image. At=

>>>> the time, I thought the impact would be small, but it turns out that
>>>> this can end up wasting gigabytes of storagee (like converting a fully
>>>> zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).
>>>>=20
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1882917
>>>>=20
>>>> I'm not entirely sure how to attack this best since this is a tradeoff,=

>>>> but maybe the approach in this series is still good enough for the case=

>>>> that you wanted to fix back then?
>>>>=20
>>>> Of course, it would be possible to have a more complete fix like lookin=
g
>>>> forward a few blocks more before writing data, but that would probably
>>>> not be entirely trivial because you would have to merge blocks with ZER=
O
>>>> block status with DATA blocks that contain only zeros. I'm not sure if
>>>> it's worth this complication of the code.
>>>=20
>>> I will try to look into this asap.
>>=20
>> Besides from the reproducer described in the ticket, I retried my old
>> conversion test in our environment:
>>=20
>> Before commit 8dcd3c9b91: reads 4608 writes 14959
>> After commit 8dcd3c9b91: reads 0 writes 14924
>> With Kevins patch: reads 110 writes 14924
>>=20
>> I think this is a good result if it avoids other issues.
>=20
> Sounds like a promising way to make the tradeoff. Thanks for testing!

is this sth for 6.0-rc4?

Peter




