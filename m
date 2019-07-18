Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5A6CF3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 15:55:26 +0200 (CEST)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho6sX-0004Dz-GU
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 09:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41809)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wrfsh@yandex-team.ru>) id 1ho6qS-0001On-7O
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrfsh@yandex-team.ru>) id 1ho6qP-00079b-Hq
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:53:16 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:37858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrfsh@yandex-team.ru>)
 id 1ho6q9-0006wn-Am; Thu, 18 Jul 2019 09:52:59 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 1774A2E14F6;
 Thu, 18 Jul 2019 16:52:48 +0300 (MSK)
Received: from smtpcorp1o.mail.yandex.net (smtpcorp1o.mail.yandex.net
 [2a02:6b8:0:1a2d::30])
 by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 JNPBS9jU3l-ql4CC4F0; Thu, 18 Jul 2019 16:52:48 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563457968; bh=clbv3hqUgtWA7taEznd4pBUuMZx8g+WhNtLgelDTaL4=;
 h=Date:Message-ID:To:Subject:From:Cc;
 b=G4+nOqmUtUp6LsorjkbcsM0H4twEVuUomfKZT06+hYgjGf29ktVj/jfMzPH7KecsO
 jJOTEtxgVEg08WZpsOOsSvl2kivyOUzZD1fGlLh8oWjaYSZYwAnvEP2KACGhQ/jLt8
 0+LcWcWDJkGp086xylURq4eJlZWaPPyNaP+myRpk=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:f68c:50ff:fee9:44bd])
 by smtpcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 MjGOyz9VRt-qk9aNgJA; Thu, 18 Jul 2019 16:52:47 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0K/QutC+0LLQu9C10LI=?=
 <wrfsh@yandex-team.ru>
To: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Message-ID: <ad4c52a9-e848-e3fd-3c1b-046d2670c025@yandex-team.ru>
Date: Thu, 18 Jul 2019 16:52:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1472:2741:0:8b6:217
Subject: [Qemu-devel] BDRV request fragmentation and virtio-blk write
 submission guarantees (2nd try)
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
Cc: qemu-block@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone,

My previous message was misformatted, so here's another one. Sorry about 
that.

We're currently working on implementing a qemu BDRV format driver which 
we are using with virtio-blk devices.

I have a question concerning BDRV request fragmentation and virtio-blk 
write request submission which is not entirely clear to me by only 
reading virtio spec. Could you please consider the following case and 
give some additional guidance?

1. Our BDRV format driver has a notion of max supported transfer size. 
So we implement BlockDriver::bdrv_refresh_limits where we fill out 
BlockLimits::max_transfer and opt_transfer fields.

2. virtio-blk exposes max_transfer as a virtio_blk_config::opt_io_size 
field, which (according to spec 1.1) is a **suggested** maximum. We read 
"suggested" as "guest driver may still send requests that don't fit into 
opt_io_size and we should handle those"...

3. ... and judging by code in block/io.c qemu block layer handles such 
requests by fragmenting them into several BDRV requests if request size 
is > max_transfer

4. Guest will see request completion only after all fragments are 
handled. However each fragment submission path can call 
qemu_coroutine_yield and move on to submitting next request available in 
virtq before completely submitting the rest of the fragments. Which 
means the following situation is possible where BDRV sees 2 write 
requests in virtq, both of which are larger than max_transfer:

Blocks: -----------------------------

Write1: ------xxxxxxxx

Write2: ------yyyyyyyy

Write1Chunk1: xxxx

Write2Chunk1: yyyy

Write2Chunk2: ----yyyy

Write1Chunk1: ----xxxx

Blocks: ------yyyyxxxx-----------------


In above scenario guest virtio-blk driver decided to submit 2 
intersecting write requests, both of which are larger than 
||max_transfer, and then call hypervisor.

I understand that virtio-blk may handle requests out of order, so guest 
must not make any assumptions on relative order in which those requests 
will be handled.

However, can guest driver expect that whatever the submission order will 
be, the actual intersecting writes will be atomic?

In other words, will it be correct for conforming virtio-blk driver to 
expect only "xxxxxxxx" or "yyyyyyyy" but not anything else in between, 
after both requests are reported as completed?

Because i think that is something that may happen in qemu right now, if 
i understood correctly.



Thanks!



