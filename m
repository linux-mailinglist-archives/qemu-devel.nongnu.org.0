Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867FD2F6B1F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:36:57 +0100 (CET)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08QS-0000MJ-KP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08Mi-0006FA-T2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:33:04 -0500
Received: from kerio.kamp.de ([195.62.97.192]:47231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l08Mf-0006CK-SR
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:33:04 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 20:32:37 +0100
Received: (qmail 21974 invoked from network); 14 Jan 2021 19:32:42 -0000
Received: from ac14.vpn.kamp-intra.net (HELO ?172.20.250.14?)
 (pl@kamp.de@::ffff:172.20.250.14)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 14 Jan 2021 19:32:42 -0000
Subject: Re: [PATCH 3/7] block/rbd: use stored image_size in qemu_rbd_getlength
To: dillaman@redhat.com
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-4-pl@kamp.de>
 <CA+aFP1DnYJjbt99Je841E_ZZi-7nKY89FF1apHF=y4bZ7fuEUw@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <7c1a027f-d5c0-e158-32cc-c6c4463b74f8@kamp.de>
Date: Thu, 14 Jan 2021 20:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aFP1DnYJjbt99Je841E_ZZi-7nKY89FF1apHF=y4bZ7fuEUw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.237,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.01.21 um 20:18 schrieb Jason Dillaman:
> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index bc8cf8af9b..a2da70e37f 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -956,15 +956,7 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>>  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>>  {
>>      BDRVRBDState *s = bs->opaque;
>> -    rbd_image_info_t info;
>> -    int r;
>> -
>> -    r = rbd_stat(s->image, &info, sizeof(info));
>> -    if (r < 0) {
>> -        return r;
>> -    }
>> -
>> -    return info.size;
>> +    return s->image_size;
>>  }
>>
>>  static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
>> --
>> 2.17.1
> An RBD image can technically change size dynamically while in-use. The
> original code would provide the most up-to-date length but this
> version will always return the size of the image when it was opened.


Agreed, but Qemu won't propagate this info to the guest unless Qemu truncate is called with length 0.

Anyway, if we want support this we should adjust s->image_size if the size has changed.


Peter




