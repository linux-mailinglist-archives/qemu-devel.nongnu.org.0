Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CB6ED6CC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 23:35:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr3oy-0000YD-PH; Mon, 24 Apr 2023 17:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr3ow-0000XS-ON
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:34:02 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pr3ot-0006jh-V4
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:34:02 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:308d:0:640:82be:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2086D6017A;
 Tue, 25 Apr 2023 00:33:52 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6523::1:a] (unknown
 [2a02:6b8:b081:6523::1:a])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id pXNLlT0OjmI0-6PbjxoWL; Tue, 25 Apr 2023 00:33:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682372031; bh=8zaC3yHsD7RaFTS9EJ5p6I4Ac6Q0kdImYxbsy1m3tzM=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ppx0U5PapMjVbGtdpuB7E+io2778BjvlDdXfMNax/H/UAyLOwbuykIGx0YxKqfvTv
 S5gNBKbKgW5ElBm3tKL643lOJKy3qjVn56xAPDDQWEfrZiWxeNgdbQyNDrRWGOoX57
 JInmbazGwwRQPAFs1A7B/JGprKjGWhOGSgahbY5U=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fdca93bf-bb4a-120e-fc39-f1817c7915ac@yandex-team.ru>
Date: Tue, 25 Apr 2023 00:33:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] pci: make ROM memory resizable
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, david@redhat.com,
 peterx@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 den-plotnikov@yandex-team.ru
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230424164105-mutt-send-email-mst@kernel.org>
 <20230424164222-mutt-send-email-mst@kernel.org>
 <241d3c11-17bd-4db1-04de-6268031b57df@yandex-team.ru>
 <20230424170630-mutt-send-email-mst@kernel.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424170630-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 25.04.23 00:06, Michael S. Tsirkin wrote:
> On Tue, Apr 25, 2023 at 12:02:49AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> On 24.04.23 23:45, Michael S. Tsirkin wrote:
>>> On Mon, Apr 24, 2023 at 04:42:00PM -0400, Michael S. Tsirkin wrote:
>>>> On Mon, Apr 24, 2023 at 11:36:47PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>> On migration, on target we load local ROM file. But actual ROM content
>>>>> migrates through migration channel. Original ROM content from local
>>>>> file doesn't matter. But when size mismatch - we have an error like
>>>>>
>>>>>    Size mismatch: 0000:00:03.0/virtio-net-pci.rom: 0x40000 != 0x80000: Invalid argument
>>>>>
>>>>> Let's just allow resizing of ROM memory. This way migration is not
>>>>> relate on local ROM file on target node which is loaded by default but
>>>>> is not actually needed.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
>>> Also isn't ROM size reflected in config space etc?
>>> I don't remember code that would update that on migration.
>>>
>>>
>>
>> Thanks a lot for fast answers!
>>
>> Hmm. I'm a newbie in these things.
>>
>> But yes, I noted, that my patch helps, if, for example jump from 200K to 500K zero-filled ROM file. But if jump to 600K, migration fails with
>>
>> (qemu) qemu: get_pci_config_device: Bad config data: i=0x32 read: b8 device: 0 cmask: ff wmask: f0 w1cmask:0
>> qemu: Failed to load PCIDevice:config
>> qemu: Failed to load virtio-net:virtio
>> qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-net'
>> qemu: load of migration failed: Invalid argument
>>
>>
>> I thought, that, maybe, romfile for this device just mustn't be more than 512K where config starts. But now I think that it's exactly the problem you are saying about.
>>
>>
>> I know also, that there were another step around this problem: 08b1df8ff463e72b087 "pci: add romsize property".. But it doesn't help when you already have a running instance with small ROM and want to migrate it to the node where you have corresponding local ROM file updated to new package with bigger size.
>>
> 
> set romsize on destination?

This does not work if you try to set smaller size, it say:

romfile "b" (409600 bytes) is too large for ROM size 262144

so we need additional option like romalloc=on, that say: don't load any file but just allocate ROM by romsize option. Or just handle romfile="",romsize=SOME_SIZE in this way.

But I'm still interested in possibility to avoid any additional option on target.

> 
>> Hmm. So, simply reuse "resizable" memory blocks doesn't help. And I need more precise reinitialization of device on load of incoming migration..
>>
>> -- 
>> Best regards,
>> Vladimir
> 

-- 
Best regards,
Vladimir


