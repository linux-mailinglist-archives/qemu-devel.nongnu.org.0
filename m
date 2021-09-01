Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300F3FD91A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:58:57 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOtM-0007Fy-78
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLOgv-0000dm-AB; Wed, 01 Sep 2021 07:46:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLOgr-0008V8-O3; Wed, 01 Sep 2021 07:46:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 910354000A;
 Wed,  1 Sep 2021 14:45:55 +0300 (MSK)
Received: from [192.168.177.132] (mjt-x200la.wg.tls.msk.ru [192.168.177.132])
 by tsrv.corpit.ru (Postfix) with ESMTP id 711B22B3;
 Wed,  1 Sep 2021 14:45:55 +0300 (MSK)
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
 <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
 <CAFEAcA_kdx5a6_UP+FYONrk_LQC75YhwaO82GVj-pC6581LGwA@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f4d09c95-42ae-b4bf-5c61-4b5384a94e21@msgid.tls.msk.ru>
Date: Wed, 1 Sep 2021 14:45:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kdx5a6_UP+FYONrk_LQC75YhwaO82GVj-pC6581LGwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -78
X-Spam_score: -7.9
X-Spam_bar: -------
X-Spam_report: (-7.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.2021 12:52, Peter Maydell wrote:
> On Wed, 1 Sept 2021 at 09:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
...
>> We have sizeof(sockaddr_storage) space there. If the kernel returned
>> salen greather than that, this means we received only partial address
>> and can't rely on it. It is like snprintf() returning more bytes than
>> available in the buffer - it says how much bytes NEEDED.
> 
> I think that if we need to check that we should be checking that
> at the point where we make the accept() or whatever other call
> filled in the sockaddr. That is the point at which the code
> either (a) knows that the buffer is guaranteed big enough and
> can assert that if it likes or (b) may have some reasonable way
> to deal with the failure, eg allocate a bigger buffer and retry,
> and (c) it is also the point where the code knows how big the actual
> buffer it passed to the kernel is and so can validly determine if
> it was truncated.

I don't care where it is done, as long as what is done does not
break in real-life scenario.

Originally I asked another question: WHY we ask for the socket name
in the first place, why do we need it, where do we use it?

Maybe we should answer to this one first and maybe remove whole
thing completely instead of fixing something which isn't used?

> We don't check that the address is not truncated in any of the
> other sockaddr-type-to-SocketAddress conversion functions...

Because other addresses have fixed length. If anything there does
not fit or is not equal to the expected length, the hell will break
loose for every application out there, qemu will note be the first
to look for..

/mjt

