Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BA6EE526
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:59:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prL3y-0003Bp-KN; Tue, 25 Apr 2023 11:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prL3v-0003BK-Sk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:58:39 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prL3s-0000XO-NP
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:58:39 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E50195F476;
 Tue, 25 Apr 2023 18:58:28 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id RwI6wT1Oq4Y0-CqZyHWY3; Tue, 25 Apr 2023 18:58:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682438307; bh=YaqJAESmxXE0jXBT4tIAOr756Q6+zD398hYWImOronk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=n4NKcYO5D/8cvQ6cpAUf3BuznJ4qYsnEMM99uP6Tc6DLQ0L3cvgoi2qlWsxatzKL7
 sFLynmlf65sWJA4oSqSMUY+gkghNrtEf1kuagydirwQWKDc4C+WELDqv11N7GIAbXg
 1JTgejRZjSlVybCj1qV2G9sExV0dog4RWS92nLSk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f2c185ce-282b-a17f-15bd-33d9118cb6f8@yandex-team.ru>
Date: Tue, 25 Apr 2023 18:58:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
 <20230425105603.137823-4-vsementsov@yandex-team.ru>
 <20230425084121-mutt-send-email-mst@kernel.org>
 <12e32fad-f4a2-73df-8345-2ce7ac56aa35@yandex-team.ru>
 <56042897-8efc-d77d-68eb-9af94a8921a5@yandex-team.ru>
 <20230425093235-mutt-send-email-mst@kernel.org>
 <20230425165507.0eb52454@imammedo.users.ipa.redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230425165507.0eb52454@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 25.04.23 17:55, Igor Mammedov wrote:
> On Tue, 25 Apr 2023 09:32:54 -0400
> "Michael S. Tsirkin"<mst@redhat.com>  wrote:
> 
>> On Tue, Apr 25, 2023 at 04:19:12PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> On 25.04.23 16:07, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 25.04.23 15:43, Michael S. Tsirkin wrote:
>>>>> On Tue, Apr 25, 2023 at 01:56:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> On incoming migration we have the following sequence to load option
>>>>>> ROM:
>>>>>>
>>>>>> 1. On device realize we do normal load ROM from the file
>>>>>>
>>>>>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>>>>>      block. If sizes mismatch we fail.
>>>>>>
>>>>>> This is not ideal when we migrate to updated distribution: we have to
>>>>>> keep old ROM files in new distribution and be careful around romfile
>>>>>> property to load correct ROM file. Which is loaded actually just to
>>>>>> allocate the ROM with correct length.
>>>>>>
>>>>>> Note, that romsize property doesn't really help: if we try to specify
>>>>>> it when default romfile is larger, it fails with something like:
>>>>>>
>>>>>> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
>>>>>>
>>>>>> This commit brings new behavior for romfile="",romsize=SIZE combination
>>>>>> of options. Current behavior is just ignore romsize and not load or
>>>>>> create any ROM.
>>>>>>
>>>>>> Let's instead preallocate ROM, not loading any file. This way we can
>>>>>> migrate old vm to new environment not thinking about ROM files on
>>>>>> destination host:
>>>>>>
>>>>>> 1. specify romfile="",romsize=SIZE on target, with correct SIZE
>>>>>>      (actually, size of romfile on source aligned up to power of two, or
>>>>>>       just original romsize option on source)
>>>>>>
>>>>>> 2. On device realize we just preallocate ROM, and not load any file
>>>>>>
>>>>>> 3. On incoming migration ROM is filled from the migration stream
>>>>>>
>>>>>> As a bonus we avoid extra reading from ROM file on target.
>>>>>>
>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>   
>>>>> why is this a bad idea:
>>>>> - on source presumably user overrides romfile
>>>>> - we have a general rule that source and destination flags must match
>>>>>
>>>>> I propose instead to ignore romfile if qemu is incoming migration
>>>>> and romsize has been specified.
>>>>>    
>>>> Hmm, that would work even better, as no additional options needed, thanks. I'll resend
>>>>    
>>> romsize needed anyway, of course.
>> yes but it can match on source and dest.
> Aren't we pushin issue from QEMU(/how distro packages firmware/)
> to mgmt layer(s) going this way?
> 

I'm afraid, we can't simply solve the issue on QEMU part, as we need this romsize at realize time. If we want to change the size on load of incoming migration, we'd have to reinitialize the device and memory layout.. This seems too difficult.

On the other hand, it seems correct to force management to specify ROM size to create. Same as RAM size.

Imagine, we always had the following behavior:

  - romsize is necessary parameter when we have rom (absence means no rom, same as romfile="")
  - romfile is ignored on incoming migration

this way, we would never have any migration problems.

So, the proposal is to at least support such behavior:

  - ignore romfile on incoming migration when romsize is specified.

Additionally we can deprecate missing romsize, when we have rom.


-- 
Best regards,
Vladimir


