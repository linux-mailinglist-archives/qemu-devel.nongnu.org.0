Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077025ABAC2
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 00:19:47 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUF0r-0001yv-AF
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 18:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUEwg-0000Do-BD; Fri, 02 Sep 2022 18:15:34 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:35912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUEwa-0003ux-FA; Fri, 02 Sep 2022 18:15:24 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7EF6C2E2CF5;
 Sat,  3 Sep 2022 01:15:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b51c::1:28] (unknown
 [2a02:6b8:b081:b51c::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 VxaJVNmDsx-FAOaRHQX; Sat, 03 Sep 2022 01:15:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662156910; bh=evqfl4obG8SONazBg06dXOnIX+UwGHDWBxzwoVbayuk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=WED+bqIBQ4subUkRwoIcU07C1a+rlCbkYlHZfwqNrT+pwDEr/Gt/USWMYuzUr8mIA
 CtLM4r3DigXqsUniE0ldWcNHDD2prBpLCWtLwWMmmX8bMqpEkzKABG4WL2NKj+D/2k
 7UINw75gbsZsTWiEjFHDY/BwPauZzanugkwy1GQs=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d51fcf5e-58f3-8ebc-dc8f-4c9d4c91c5c3@yandex-team.ru>
Date: Sat, 3 Sep 2022 01:15:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/8] virtio-blk: move config size params to
 virtio-blk-common
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-6-d-tatianin@yandex-team.ru>
 <20220902175728.GE5363@raphael-debian-dev>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20220902175728.GE5363@raphael-debian-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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



On 9/2/22 8:57 PM, Raphael Norwitz wrote:
> The vhost-user-blk bits in meson.build and Maintainers should probably
> be in patch 8?

You're totally right, thanks.

> Otherwise LGTM.
> 
> On Fri, Aug 26, 2022 at 05:32:45PM +0300, Daniil Tatianin wrote:
>> This way we can reuse it for other virtio-blk devices, e.g
>> vhost-user-blk, which currently does not control its config space size
>> dynamically.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>> ---
>>   MAINTAINERS                           |  4 +++
>>   hw/block/meson.build                  |  4 +--
>>   hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
>>   hw/block/virtio-blk.c                 | 24 ++---------------
>>   include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
>>   5 files changed, 67 insertions(+), 24 deletions(-)
>>   create mode 100644 hw/block/virtio-blk-common.c
>>   create mode 100644 include/hw/virtio/virtio-blk-common.h
>>
> 
> <snip>
> 
> i.e. move this.
> 
>> @@ -2271,11 +2273,13 @@ S: Maintained
>>   F: contrib/vhost-user-blk/
>>   F: contrib/vhost-user-scsi/
>>   F: hw/block/vhost-user-blk.c
>> +F: hw/block/virtio-blk-common.c
>>   F: hw/scsi/vhost-user-scsi.c
>>   F: hw/virtio/vhost-user-blk-pci.c
>>   F: hw/virtio/vhost-user-scsi-pci.c
>>   F: include/hw/virtio/vhost-user-blk.h
>>   F: include/hw/virtio/vhost-user-scsi.h
>> +F: include/hw/virtio/virtio-blk-common.h
>>   
>>   vhost-user-gpu
>>   M: Marc-André Lureau <marcandre.lureau@redhat.com>
>> diff --git a/hw/block/meson.build b/hw/block/meson.build
>> index 2389326112..1908abd45c 100644
>> --- a/hw/block/meson.build
>> +++ b/hw/block/meson.build
>> @@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
>>   softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>>   softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
>>   
>> -specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
>> -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
>> +specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
> 
> And this
> 
>> +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))

