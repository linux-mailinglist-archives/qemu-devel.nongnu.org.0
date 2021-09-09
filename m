Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECE40494A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:28:26 +0200 (CEST)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIEC-0000Bh-Oe
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mOICY-00074K-W8; Thu, 09 Sep 2021 07:26:43 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:32904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mOICT-0006QE-GV; Thu, 09 Sep 2021 07:26:40 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id E23C62E098F;
 Thu,  9 Sep 2021 14:26:31 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (myt6-76f0a6db1a7e.qloud-c.yandex.net [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 sg8swz58Aj-QUt4dThU; Thu, 09 Sep 2021 14:26:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1631186791; bh=3A5GfbX49ZHY/mqdR7icCwmmlHNt+aaazs7IDAbEtm0=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=jzrEuwHHuOjUvUsUFtCaPpYk0BW/v04K8z0UahqRqkCOrqlcpDsDCQHYFd5E4LQZj
 eInrrLQsgofylkpHW9T6TFhse+Lop+MftsWRAuu8I2hLfXKzGB0lTAKapSLYS0J0It
 7wkzGBc0OEUOuBr3ElCyxF3wo3IKiR9+FNqlRszQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8011::1:b])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 NrekqP21w2-QUxWT0H1; Thu, 09 Sep 2021 14:26:30 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v1 2/4] virtio: increase virtuqueue size for virtio-scsi
 and virtio-blk
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200129140702.5411-1-dplotnikov@virtuozzo.com>
 <20200129140702.5411-3-dplotnikov@virtuozzo.com>
 <20200130145840.GH180311@stefanha-x1.localdomain>
 <92f392e9-eb05-5c85-4d50-208110720a22@virtuozzo.com>
 <20200205111905.GE58062@stefanha-x1.localdomain>
 <683b80a8-0d40-7f14-e3f4-628d2b38037f@virtuozzo.com>
 <20210908131716.e6de722iibgn3y7y@steredhat>
 <20210908132203.vajs22vocelhlwwt@steredhat>
 <3b35a660-c577-42b6-d977-7b43c29452a6@yandex-team.ru>
 <20210909082805.et2rf7gwfczqj64q@steredhat>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <41757016-debe-e1cb-600e-4cf3bd574fd4@yandex-team.ru>
Date: Thu, 9 Sep 2021 14:26:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909082805.et2rf7gwfczqj64q@steredhat>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 09.09.2021 11:28, Stefano Garzarella wrote:
> On Wed, Sep 08, 2021 at 06:20:49PM +0300, Denis Plotnikov wrote:
>>
>> On 08.09.2021 16:22, Stefano Garzarella wrote:
>>> Message bounced, I use new Denis's email address.
>>>
>>> On Wed, Sep 08, 2021 at 03:17:16PM +0200, Stefano Garzarella wrote:
>>>> Hi Denis,
>>>> I just found this discussion since we still have the following line 
>>>> in hw/core/machine.c:
>>>>    { "vhost-blk-device", "seg_max_adjust", "off"}
>>>>
>>>> IIUC it was a typo, and I think we should fix it since in the 
>>>> future we can have `vhost-blk-device`.
>>>>
>>>> So, I think we have 2 options:
>>>> 1. remove that line since for now is useless
>>>> 2. replace with "vhost-scsi"
>>>>
>>>> I'm not sure which is the best, what do you suggest?
>>>>
>>>> Thanks,
>>>> Stefano
>>
>> Hi Stefano
>>
>> I prefer to just remove the line without replacing. This will keep 
>> things exactly like it is now.
>>
>> Replacing with "vhost-scsi" will affect seg_max (limit to 126) on 
>> newly created VMs with machine types using "hw_compat_4_2" and older.
>>
>> Now, because of the typo (error), their seg-max is queue-size 
>> dependent. I'm not sure, if replacing the line may cause any 
>> problems, for example on migration: source (queue-size 256, seg max 
>> 254) -> destination (queue-size 256, seg max 126). But it will 
>> definitely introduce two different behaviors for VMs with 
>> "hw_compat_4_2" and older. So, I'd choose the lesser of two evils and 
>> keep the things like it's now.
>>
>
> Yep, make sense. It was the same concern I had.
>
> Do you want to send a patch to remove it with this explanation?

Yes, sure.

I'll do it today.

Denis

>
> Thanks for the clarification,
> Stefano
>

