Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD4A343E07
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:35:14 +0100 (CET)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHtx-0007Op-RA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOHeB-0001Fy-Al
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:18:56 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:48307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOHe4-0000G8-3N
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:18:55 -0400
Received: from email.seznam.cz
 by email-smtpc1a.ng.seznam.cz (email-smtpc1a.ng.seznam.cz [10.23.10.15])
 id 719f2b0511900cb777ac6012; Mon, 22 Mar 2021 11:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616408323;
 bh=zxYIhbaxEVg5HIu+LzRl+RT5/iUQzTxNhEDVxWwUAP4=;
 h=Received:To:Cc:References:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=CrGs/f8qxfnwQDMFWc+598uJpG87gOpkHrFjnr6a1qEVI46ltdQnUeaYaMkQwv/so
 lug160OfaWrK6pEct6Jp+jIB9bEOui3Kh6S8RvN8ax3EesEPFPxIZ8klrUoRpFg5pp
 nhCZNfty+wccLz1264w4fIuRhteEDM/aNUqsBYk0=
Received: from [IPv6:2a01:510:d502:b200:c1b:ad27:bde0:341a]
 (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay4.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Mon, 22 Mar 2021 11:18:40 +0100 (CET)  
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
 <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
From: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
Message-ID: <4848c5a4-b301-a8d7-b21b-b59ebbeb12c7@patrikjanousek.cz>
Date: Mon, 22 Mar 2021 11:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: cs
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 9:41 AM, Vladimir Sementsov-Ogievskiy wrote:
> 20.03.2021 12:32, Patrik Janou=C5=A1ek wrote:
>> Current implementation of dirty bitmaps for raw format is very
>> limited, because those bitmaps cannot be persistent. Basically it
>> makes sense, because the raw format doesn't have space where could
>> be dirty bitmap stored when QEMU is offline. This patch solves it
>> by storing content of every dirty bitmap in separate file on the
>> host filesystem.
>>
>> However, this only solves one part of the problem. We also have to
>> store information about the existence of the dirty bitmap. This is
>> solved by adding custom options, that stores all required metadata
>> about dirty bitmap (filename where is the bitmap stored on the
>> host filesystem, granularity, persistence, etc.).
>>
>> Signed-off-by: Patrik Janou=C5=A1ek<pj@patrikjanousek.cz>
>
>
> Hmm. Did you considered other ways? Honestly, I don't see a reason for
> yet another storing format for bitmaps.
>
> The task could be simply solved with existing features:
>
> 1. We have extenal-data-file feature in qcow2 (read
> docs/interop/qcow2.txt). With this thing enabled, qcow2 file contains
> only metadata (persistent bitmaps for example) and data is stored in
> separate sequential raw file. I think you should start from it.

I didn't know about that feature. I'll look at it.

In case I use NBD to access the bitmap context and qcow2 as a solution
for persistent layer. Would the patch be acceptable? This is significant
change to my solution and I don't have enought time for it at the moment
(mainly due to other parts of my bachelor's thesis). I just want to know
if this kind of feature is interesting to you and its implementation is
worth my time.

>
> 2. If for some reason [1] doesn't work for you, you can anyway use an
> empty qcow2 file to store bitmaps instead of inventing and
> implementing new format of bitmaps storing. (Same as your approach,
> you'll have a simple raw node, and additional options will say "load
> bitmaps from this qcow2 file". But for such options we'll need good
> reasons why [1] isn't enough.
>


