Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09253FD5BF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:38:31 +0200 (CEST)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLlO-0004Xh-4S
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLLdE-00022m-Mi; Wed, 01 Sep 2021 04:30:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLLd8-0006Fx-Oc; Wed, 01 Sep 2021 04:30:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 07AD24000A;
 Wed,  1 Sep 2021 11:29:55 +0300 (MSK)
Received: from [192.168.177.132] (mjt-x200la.wg.tls.msk.ru [192.168.177.132])
 by tsrv.corpit.ru (Postfix) with ESMTP id D03297D;
 Wed,  1 Sep 2021 11:29:54 +0300 (MSK)
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
Date: Wed, 1 Sep 2021 11:29:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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

On 31.08.2021 22:47, Peter Maydell wrote:
> On Tue, 31 Aug 2021 at 19:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
..
>> -    assert(salen >= sizeof(su->sun_family) + 1 &&
>> -           salen <= sizeof(struct sockaddr_un));
>> +    /* there's a corner case when trailing \0 does not fit into
>> +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
>> +     * not with sizeof(sockaddr_un), since this is what we actually
>> +     * provide, to ensure we had no truncation and a room for
>> +     * the trailing \0 which we add below.
>> +     * When salen == sizeof(sun_family) it is unnamed socket,
>> +     * and when first byte of sun_path is \0, it is abstract. */
>> +    assert(salen >= sizeof(su->sun_family) &&
>> +           salen <= sizeof(struct sockaddr_storage));
> 
> Again, why are we asserting an upper bound? We don't care here:
> the representation in the SocketAddress structure has no length
> limit on the path. (Conversely, we do care about the max length
> when we convert from a SocketAddress to a sockaddr_un: we do this
> in eg unix_connect_saddr().)

We have sizeof(sockaddr_storage) space there. If the kernel returned
salen greather than that, this means we received only partial address
and can't rely on it. It is like snprintf() returning more bytes than
available in the buffer - it says how much bytes NEEDED.

/mjt

