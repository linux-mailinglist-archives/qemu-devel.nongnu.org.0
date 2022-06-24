Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38BF55983C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:54:12 +0200 (CEST)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4gx1-0003NA-O9
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o4gvm-0002Sh-C6
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:52:54 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:55198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1o4gvi-0006hm-2N
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:52:53 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 32B4F2E1E7F;
 Fri, 24 Jun 2022 13:52:42 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 RAriEweGtC-qfKSVGwe; Fri, 24 Jun 2022 13:52:42 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1656067962; bh=9RSWTuQngRPfpNd+T7xaS/NqlCxD8BSpVS8mmHkXdcU=;
 h=In-Reply-To:Cc:To:Subject:From:Message-ID:References:Date;
 b=yD7LzNDeHm/RklEP/dOVZalP6kULWAq18Z1mNXcsg7MuvT4MvjxAsXq2tg7d026GA
 sHND6FEWRN+m6ailKsA399MQDIVBhXtUMATSauYH2K0Dm14KLrdzRnqoVgZCeicdKD
 0dmqiMR5sW/0uFINgT3CJegJCbAfCx9zMXVrUV9k=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from [IPV6:2a02:6b8:0:107:3e85:844d:5b1d:60a] (unknown
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 peCCb3KHYK-qfM8pTuh; Fri, 24 Jun 2022 13:52:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <05c5bb1f-9a7f-1bad-8318-e85d4d2b3d9c@yandex-team.com>
Date: Fri, 24 Jun 2022 13:53:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 0/2] Make local migration with TAP network device possible
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <YqnaYfYxv0yPCmpP@stefanha-x1.localdomain>
Content-Language: en-US
In-Reply-To: <YqnaYfYxv0yPCmpP@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/15/22 16:10, Stefan Hajnoczi wrote:
> On Tue, Jun 14, 2022 at 02:18:41PM +0300, Andrey Ryabinin wrote:
>> Hi
>>
>> These couple patches aims to  make possible local migration (within one host)
>> on the same TAP device used by source and destination QEMU
>>
>> The scenario looks like this
>>  1. Create TAP devices and pass file descriptors to source QEMU
>>  2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
>>  3. Start migration
>>
>>
>> Regarding the first patch: It makes possible to receive file descriptor in non-blocking
>> state. But I probably didn't cover all FD users which might need to set blocking state after
>> the patch. So I'm hopping for the hints where else, besides fd_start_incoming_migration()
>> I need to put qemu_socket_set_block() calls.
> 
> Nice feature. I am worried that these patches are unsafe/incomplete
> though.
> 
> Tap local migration isn't explicitly visible in the code. How will other
> developers know the feature is there and how to avoid breaking it when
> modifying the code? Maybe a migration test case, comments that explain
> the rules about accessing the tap fd, and/or assertions?
> 

Yeah, I'm writing avocado test case, will add it in future next iterations.

> How does this interact with hw/net/vhost_net.c, which uses tap_get_fd()
> to borrow the fd? I guess the idea is that the source VM is paused and
> no tap activity is expected. Then migration handover happens and the
> destination VM starts running and is allowed to access the tap fd.
> However, the source VM still has vhost_net with the tap fd set up. I
> wonder if there is any issue with interference between the two vhost_net
> instances?
> 

I'll try to take a closer look at code, let's see if I can find any possible issues.
But I did some brief testing with vhost=on net device, and it find any problems.
The test was
1. launch pings from source VM to host
2. Migrate
3. Check at dest VM that there is no lost packets.


> These kinds of questions should be answered, mostly in the code but also
> in the cover letter. It should be clear why this approach is correct.
> 
> Thanks,
> Stefan
> 
>>
>>
>> Andrey Ryabinin (2):
>>   chardev: don't set O_NONBLOCK on SCM_RIGHTS file descriptors.
>>   tap: initialize TAPState->enabled according to the actual state of
>>     queue
>>
>>  chardev/char-socket.c |  3 ---
>>  io/channel-socket.c   |  3 ---
>>  migration/fd.c        |  2 ++
>>  net/tap-bsd.c         |  5 +++++
>>  net/tap-linux.c       | 12 ++++++++++++
>>  net/tap-solaris.c     |  5 +++++
>>  net/tap.c             |  2 +-
>>  net/tap_int.h         |  1 +
>>  8 files changed, 26 insertions(+), 7 deletions(-)
>>
>> -- 
>> 2.35.1
>>

