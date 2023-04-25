Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B86EE279
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:09:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIOW-0004GO-K0; Tue, 25 Apr 2023 09:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prIOU-0004GD-K0
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:07:42 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prIOR-0005BP-OU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:07:42 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 35D5360DEF;
 Tue, 25 Apr 2023 16:07:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b440::1:14] (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id V7G4E00OgqM0-2RCEEeZO; Tue, 25 Apr 2023 16:07:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682428051; bh=rZOM++TvP+AWQgUb+N5iF3FJQZQLC7TKusjYfamn1wc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=J6r+10zedys9+T8zhXxIQaItymJpCcGWh56XTZA+7XJjvuly5XXLVliGiuzaZ/szt
 vUy35zUIZjo1CFvcj7Bv7XDMG6mzBu3p29SQ8e77WySoCadqED6Zbrz5tPB4E1jJAX
 jlJkXnEsRbQMXK8+p8aefRWKI3HMaL3DD7pCJhyU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <12e32fad-f4a2-73df-8345-2ce7ac56aa35@yandex-team.ru>
Date: Tue, 25 Apr 2023 16:07:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] pci: ROM preallocation for incoming migration
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
 <20230425105603.137823-4-vsementsov@yandex-team.ru>
 <20230425084121-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230425084121-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 25.04.23 15:43, Michael S. Tsirkin wrote:
> On Tue, Apr 25, 2023 at 01:56:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On incoming migration we have the following sequence to load option
>> ROM:
>>
>> 1. On device realize we do normal load ROM from the file
>>
>> 2. Than, on incoming migration we rewrite ROM from the incoming RAM
>>     block. If sizes mismatch we fail.
>>
>> This is not ideal when we migrate to updated distribution: we have to
>> keep old ROM files in new distribution and be careful around romfile
>> property to load correct ROM file. Which is loaded actually just to
>> allocate the ROM with correct length.
>>
>> Note, that romsize property doesn't really help: if we try to specify
>> it when default romfile is larger, it fails with something like:
>>
>> romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536
>>
>> This commit brings new behavior for romfile="",romsize=SIZE combination
>> of options. Current behavior is just ignore romsize and not load or
>> create any ROM.
>>
>> Let's instead preallocate ROM, not loading any file. This way we can
>> migrate old vm to new environment not thinking about ROM files on
>> destination host:
>>
>> 1. specify romfile="",romsize=SIZE on target, with correct SIZE
>>     (actually, size of romfile on source aligned up to power of two, or
>>      just original romsize option on source)
>>
>> 2. On device realize we just preallocate ROM, and not load any file
>>
>> 3. On incoming migration ROM is filled from the migration stream
>>
>> As a bonus we avoid extra reading from ROM file on target.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> why is this a bad idea:
> - on source presumably user overrides romfile
> - we have a general rule that source and destination flags must match
> 
> I propose instead to ignore romfile if qemu is incoming migration
> and romsize has been specified.
> 

Hmm, that would work even better, as no additional options needed, thanks. I'll resend

-- 
Best regards,
Vladimir


