Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234E35B1E6
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 08:24:03 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVTVq-0003kP-40
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 02:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1lVTU1-0003Ib-9s
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 02:22:09 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1lVTTw-0004fr-N9
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 02:22:07 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id AD72E2E1472;
 Sun, 11 Apr 2021 09:21:56 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (myt6-76f0a6db1a7e.qloud-c.yandex.net [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 aaPM0xf98o-Lu0CPdbd; Sun, 11 Apr 2021 09:21:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1618122116; bh=GXEAeIfGDAFAAVqSMscghhalkmu8Yl/N+Qa7ske4RZE=;
 h=In-Reply-To:References:Date:Message-ID:To:Subject:From:Cc;
 b=tRMHLv7YiAGegdsixDT4rLKi8DvPoLhoQbgfQi+mQFrdeDqtPaGsM+vmq+Qi5fkL7
 Ht0S0UXW40Zev/ElLUk9Xzy2AHB1xtGJJvmGAlp+VXJhyhQ3BlBTT+mTgQCboJo7Gv
 JjuPRcx6aJZyEMqwSbCgF5PT06TspQQLVzropkNQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:6520::1:6])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Or4QwcQKBf-LtoaMIsL; Sun, 11 Apr 2021 09:21:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
To: Vivek Goyal <vgoyal@redhat.com>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <20210409155657.GE1111800@redhat.com>
Message-ID: <14f05a3d-7db6-2c01-7fe0-f83586ff1fd6@yandex-team.ru>
Date: Sun, 11 Apr 2021 09:21:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409155657.GE1111800@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 09/04/2021 18:56, Vivek Goyal wrote:
> On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
>> Make virtio-fs take into account server capabilities.
>>
>> Just returning requested features assumes they all of then are implemented
>> by server and results in setting unsupported configuration if some of them
>> are absent.
>>
>> Signed-off-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> [CC stefan and qemu-devel.]
>
> Can you give more details of what problem exactly you are facing. Or
> this fix is about avoiding a future problem where device can refuse
> to support a feature qemu is requesting for.

This fixes existing problem that qemu ignores features (un)supported by 
backend and this works fine only if backend features match features of 
qemu. Otherwise qemu incorrectly assumes that backend suports all of 
them and calls vhost_set_features() not taking into account result of 
previous vhost_get_features() call. This breaks protocol and can crash 
server or cause incorrect behavior.

This is why I hope it to be accepted in time for 6.0 release.

> IIUC, this patch is preparing a list of features vhost-user-fs device
> can support. Then it calls vhost_get_features() which makes sure that
> all these features are support by real vhost-user device (hdev->features).
> If not, then corresponding feature is reset and remaining features
> are returned to caller.
When this callback is executed in virtio_bus_device_plugged() list of 
features that vhost-backend supports has been already obtained earlier 
by vhost_user_get_features() in vuf_device_realize() and stored in 
hdev->features. vuf_get_features() should return bitmask of features 
that are common for vhost backend (hdev->features) and frontend 
(vdev->host_features). But instead it just returns host features.
> This feature negotion bit is called in so many places that I am kind of
> lost that who should be doing what. Will leave it to Stefan who
> understands it much better.
>
>
>> ---
>>   hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index ac4fc34b36..6cf983ba0e 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -24,6 +24,14 @@
>>   #include "monitor/monitor.h"
>>   #include "sysemu/sysemu.h"
>>   
>> +static const int user_feature_bits[] = {
>> +    VIRTIO_F_VERSION_1,
>> +    VIRTIO_RING_F_INDIRECT_DESC,
>> +    VIRTIO_RING_F_EVENT_IDX,
>> +    VIRTIO_F_NOTIFY_ON_EMPTY,
>> +    VHOST_INVALID_FEATURE_BIT
>> +};
>> +
>>   static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>>   {
>>       VHostUserFS *fs = VHOST_USER_FS(vdev);
>> @@ -129,11 +137,12 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>>   }
>>   
>>   static uint64_t vuf_get_features(VirtIODevice *vdev,
>> -                                      uint64_t requested_features,
>> -                                      Error **errp)
>> +                                 uint64_t features,
> Will it make sense to keep the name requested_features. This kind of
> makes it clear that caller is requesting these features.
>
> I feel there should be few lines of comments also to make it clear
> what this function is actually doing.

This fix was inspired by similar functions in 
hw/scsi/vhost-scsi-common.c, hw/virtio/vhost-user-vsock.c, 
hw/block/vhost-user-blk.c and hw/net/vhost_net.c and I borrowed naming 
from them just to be consistent.

IMO this looks like a good place for refactoring because we have more 
and more vhost-user devices that duplicate that code, but it can be done 
after the bug is fixed.

> Vivek
>
>> +                                 Error **errp)
>>   {
>> -    /* No feature bits used yet */
>> -    return requested_features;
>> +    VHostUserFS *fs = VHOST_USER_FS(vdev);
>> +
>> +    return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
>>   }
>>   
>>   static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>> -- 
>> 2.25.1
>>
>>
>> _______________________________________________
>> Virtio-fs mailing list
>> Virtio-fs@redhat.com
>> https://listman.redhat.com/mailman/listinfo/virtio-fs

