Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7331363E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:15:38 +0200 (CEST)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQ0H-0006g6-Ng
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYPyJ-0005i2-EI; Mon, 19 Apr 2021 05:13:37 -0400
Received: from kerio.kamp.de ([195.62.97.192]:58536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYPyC-0002d8-7q; Mon, 19 Apr 2021 05:13:32 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.51] ([172.20.250.51])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Mon, 19 Apr 2021 11:13:18 +0200
From: Peter Lieven <pl@kamp.de>
Message-Id: <AD190B98-4F27-4170-94BE-D0E3DB2A3EB3@kamp.de>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F32F7893-6956-43CF-8A1A-2C0C5DA09F3C"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
Date: Mon, 19 Apr 2021 11:13:22 +0200
In-Reply-To: <07747AB5-5BCE-49EE-A3AB-03AA7B6211F8@kamp.de>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210415152214.279844-1-kwolf@redhat.com>
 <07747AB5-5BCE-49EE-A3AB-03AA7B6211F8@kamp.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_F32F7893-6956-43CF-8A1A-2C0C5DA09F3C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 19.04.2021 um 10:36 schrieb Peter Lieven <pl@kamp.de>:
>=20
>=20
>=20
>> Am 15.04.2021 um 17:22 schrieb Kevin Wolf <kwolf@redhat.com>:
>>=20
>> Peter, three years ago you changed 'qemu-img convert' to sacrifice =
some
>> sparsification in order to get aligned requests on the target image. =
At
>> the time, I thought the impact would be small, but it turns out that
>> this can end up wasting gigabytes of storagee (like converting a =
fully
>> zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).
>>=20
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1882917
>>=20
>> I'm not entirely sure how to attack this best since this is a =
tradeoff,
>> but maybe the approach in this series is still good enough for the =
case
>> that you wanted to fix back then?
>>=20
>> Of course, it would be possible to have a more complete fix like =
looking
>> forward a few blocks more before writing data, but that would =
probably
>> not be entirely trivial because you would have to merge blocks with =
ZERO
>> block status with DATA blocks that contain only zeros. I'm not sure =
if
>> it's worth this complication of the code.
>=20
> I will try to look into this asap.

Besides from the reproducer described in the ticket, I retried my old =
conversion test in our environment:

Before commit 8dcd3c9b91: reads 4608 writes 14959
After commit 8dcd3c9b91: reads 0 writes 14924
With Kevins patch: reads 110 writes 14924

I think this is a good result if it avoids other issues.

Peter


--Apple-Mail=_F32F7893-6956-43CF-8A1A-2C0C5DA09F3C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 19.04.2021 um 10:36 schrieb Peter Lieven &lt;<a =
href=3D"mailto:pl@kamp.de" class=3D"">pl@kamp.de</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D""><br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">Am =
15.04.2021 um 17:22 schrieb Kevin Wolf &lt;<a =
href=3D"mailto:kwolf@redhat.com" class=3D"">kwolf@redhat.com</a>&gt;:<br =
class=3D""><br class=3D"">Peter, three years ago you changed 'qemu-img =
convert' to sacrifice some<br class=3D"">sparsification in order to get =
aligned requests on the target image. At<br class=3D"">the time, I =
thought the impact would be small, but it turns out that<br =
class=3D"">this can end up wasting gigabytes of storagee (like =
converting a fully<br class=3D"">zeroed 10 GB image taking 2.8 GB =
instead of a few kilobytes).<br class=3D""><br class=3D""><a =
href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1882917" =
class=3D"">https://bugzilla.redhat.com/show_bug.cgi?id=3D1882917</a><br =
class=3D""><br class=3D"">I'm not entirely sure how to attack this best =
since this is a tradeoff,<br class=3D"">but maybe the approach in this =
series is still good enough for the case<br class=3D"">that you wanted =
to fix back then?<br class=3D""><br class=3D"">Of course, it would be =
possible to have a more complete fix like looking<br class=3D"">forward =
a few blocks more before writing data, but that would probably<br =
class=3D"">not be entirely trivial because you would have to merge =
blocks with ZERO<br class=3D"">block status with DATA blocks that =
contain only zeros. I'm not sure if<br class=3D"">it's worth this =
complication of the code.<br class=3D""></blockquote><br class=3D"">I =
will try to look into this asap.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Besides=
 from the reproducer described in the ticket, I retried my old =
conversion test in our environment:</div><div><br =
class=3D""></div><div>Before commit&nbsp;<span style=3D"color: rgb(0, 0, =
0); font-family: Menlo; font-size: 11px;" =
class=3D"">8dcd3c9b91:&nbsp;</span><span style=3D"color: rgb(0, 0, 0); =
font-family: Menlo; font-size: 11px;" class=3D"">reads 4608 writes =
14959</span></div><div><span style=3D"color: rgb(0, 0, 0); font-family: =
Menlo; font-size: 11px;" class=3D"">After commit&nbsp;</span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Menlo; font-size: 11px;" class=3D"">8dcd3c9b91:&nbsp;</span><span =
style=3D"color: rgb(0, 0, 0); font-family: Menlo; font-size: 11px;" =
class=3D"">reads 0 writes 14924</span></div><div><span style=3D"color: =
rgb(0, 0, 0); font-family: Menlo; font-size: 11px;" class=3D"">With =
Kevins patch:&nbsp;</span><span style=3D"color: rgb(0, 0, 0); =
font-family: Menlo; font-size: 11px;" class=3D"">reads 110 writes =
14924</span></div><div><span style=3D"color: rgb(0, 0, 0); font-family: =
Menlo; font-size: 11px;" class=3D""><br class=3D""></span></div><div><span=
 style=3D"color: rgb(0, 0, 0); font-family: Menlo; font-size: 11px;" =
class=3D"">I think this is a good result if it avoids other =
issues.</span></div><div><span style=3D"color: rgb(0, 0, 0); =
font-family: Menlo; font-size: 11px;" class=3D""><br =
class=3D""></span></div><div><span style=3D"color: rgb(0, 0, 0); =
font-family: Menlo; font-size: 11px;" =
class=3D"">Peter</span></div><div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_F32F7893-6956-43CF-8A1A-2C0C5DA09F3C--


