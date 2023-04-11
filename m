Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2696DE289
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:32:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHpd-0002t1-3d; Tue, 11 Apr 2023 13:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pmHpT-0002p3-2z
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:30:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pmHpP-0002dY-Q2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:30:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4CB9A40107;
 Tue, 11 Apr 2023 20:30:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1158D86;
 Tue, 11 Apr 2023 20:30:39 +0300 (MSK)
Message-ID: <095a184b-a289-8807-efe8-882155b729c4@msgid.tls.msk.ru>
Date: Tue, 11 Apr 2023 20:30:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: xen bits broke x32 build
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, David Woodhouse <dwmw@amazon.co.uk>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <7739b40d-d8ba-ccde-cc6c-5d9f2c93a663@msgid.tls.msk.ru>
 <CAFEAcA8DyTixWoeRpt3R7MHmLEwnvX5Y6ciCDaVj1n7K6GnOeQ@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA8DyTixWoeRpt3R7MHmLEwnvX5Y6ciCDaVj1n7K6GnOeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -90
X-Spam_score: -9.1
X-Spam_bar: ---------
X-Spam_report: (-9.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

11.04.2023 15:09, Peter Maydell wrote:
..
> Frankly I would prefer to just say "we don't support x32".
> It's a weird non-standard configuration that as far as I'm
> aware is very little used. Its stats in the debian
> popularity-contest graphs peaked at 18 users in 2017, and
> have mostly been fluctuating between 1 and 3 for the last
> couple of years:
> https://popcon.debian.org/stat/sub-x32.png

x32 was a nice idea but it lacked some final steps for it
to fly. In my opinion anyway.  Its compactness and speed
are fantastic, - qemu build is about 10..15% faster with
x32 gcc than it is with x86_64 gcc.

At the time debian picked it up, it was not very usable
b/c too many things didn't work and needed care.  Today,
much more software actually works on x32. It is more,
today with debian multiarch setup, it is possible to install
some *parts* of the system to be x32 while the rest being
x86_64, either for parts which benefits from x32 the most,
or the other way around, main x32 and some parts x86_64.
But it *still* lacks some infrastructure in debian, so it
is possible to do with stable or testing distribution, -
right now it is possible with unstable only.  Maybe we
can change that for bookworm+.

The thing is that now, it is much more complete than it
was in 2017, and it'd be really sad if it goes away.

x32 reveals some interesting problems in the code such
as type misuse, it already helped to find and fix some
bugs in some software, - for example in samba, where
a pointer was misused to store a time_t (which would
break with past-2038 time_t).

qemu never said it supports x32, and no one demanded
such support from it. It's interesting to have it working
there still, I *think*, as long as it does not require
extra efforts.

I'm fine to maintain the change required to keep it at
least buildable on x32 in debian - again as long as it
does not require huge efforts.

> We're currently planning to deprecate-and-drop 32-bit x86
> hosts, which are much more widely used than this. I see
> no reason why we should care about this oddball failed
> experiment of an ABI...

Thanks,

/mjt

