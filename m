Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811A5ABAB5
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 00:14:44 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUEvz-0008PT-1k
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 18:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUEts-0006p0-7h; Fri, 02 Sep 2022 18:12:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oUEtn-0003RU-Lh; Fri, 02 Sep 2022 18:12:30 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 953E42E2CF5;
 Sat,  3 Sep 2022 01:12:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b51c::1:28] (unknown
 [2a02:6b8:b081:b51c::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mfRw4t2O9M-CEOCXjxe; Sat, 03 Sep 2022 01:12:14 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662156734; bh=h5zKHqMy8Kgv1S2R46ytzVllnw+5vRUQB6Gy2eChvsc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=A7+Ol9ZTz7e2pN47g6XEg7cRTIAweam1tlkT0LJbt2G4JQqTa2pVu5Ijs2ToLNX3N
 8ttKjiy5rBxP9nk5nyzRz/NXmnhn9/QPXpTnRKCYNLx7CBHMLFPeHRvSqoP1fscpOm
 fslIYwBCn6w2lT1dB7Wy1ZJKyZzWa03eJ6rI8kKk=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <50487a10-30a1-ab52-d4ba-2cd9c49835a0@yandex-team.ru>
Date: Sat, 3 Sep 2022 01:12:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-2-d-tatianin@yandex-team.ru>
 <20220902175112.GA5363@raphael-debian-dev>
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <20220902175112.GA5363@raphael-debian-dev>
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



On 9/2/22 8:52 PM, Raphael Norwitz wrote:
> I feel like it would be easier to review if the first 4 patches were
> squashed together, but that’s not a big deal.

Yeah, I think that's fair although I initially thought that maybe that 
was a bit too big of a change to put in one single commit. I can squash 
the first four if that would be better.

> For this one:
> 
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> 
> On Fri, Aug 26, 2022 at 05:32:41PM +0300, Daniil Tatianin wrote:
>> This is the first step towards moving all device config size calculation
>> logic into the virtio core code. In particular, this adds a struct that
>> contains all the necessary information for common virtio code to be able
>> to calculate the final config size for a device. This is expected to be
>> used with the new virtio_get_config_size helper, which calculates the
>> final length based on the provided host features.
>>
>> This builds on top of already existing code like VirtIOFeature and
>> virtio_feature_get_config_size(), but adds additional fields, as well as
>> sanity checking so that device-specifc code doesn't have to duplicate it.
>>
>> An example usage would be:
>>
>>      static const VirtIOFeature dev_features[] = {
>>          {.flags = 1ULL << FEATURE_1_BIT,
>>           .end = endof(struct virtio_dev_config, feature_1)},
>>          {.flags = 1ULL << FEATURE_2_BIT,
>>           .end = endof(struct virtio_dev_config, feature_2)},
>>          {}
>>      };
>>
>>      static const VirtIOConfigSizeParams dev_cfg_size_params = {
>>          .min_size = DEV_BASE_CONFIG_SIZE,
>>          .max_size = sizeof(struct virtio_dev_config),
>>          .feature_sizes = dev_features
>>      };
>>
>>      // code inside my_dev_device_realize()
>>      size_t config_size = virtio_get_config_size(&dev_cfg_size_params,
>>                                                  host_features);
>>      virtio_init(vdev, VIRTIO_ID_MYDEV, config_size);
>>
>> Currently every device is expected to write its own boilerplate from the
>> example above in device_realize(), however, the next step of this
>> transition is moving VirtIOConfigSizeParams into VirtioDeviceClass,
>> so that it can be done automatically by the virtio initialization code.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
>> ---
>>   hw/virtio/virtio.c         | 17 +++++++++++++++++
>>   include/hw/virtio/virtio.h |  9 +++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 5d607aeaa0..8518382025 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -3014,6 +3014,23 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
>>       return config_size;
>>   }
>>   
>> +size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
>> +                              uint64_t host_features)
>> +{
>> +    size_t config_size = params->min_size;
>> +    const VirtIOFeature *feature_sizes = params->feature_sizes;
>> +    size_t i;
>> +
>> +    for (i = 0; feature_sizes[i].flags != 0; i++) {
>> +        if (host_features & feature_sizes[i].flags) {
>> +            config_size = MAX(feature_sizes[i].end, config_size);
>> +        }
>> +    }
>> +
>> +    assert(config_size <= params->max_size);
>> +    return config_size;
>> +}
>> +
>>   int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>>   {
>>       int i, ret;
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index db1c0ddf6b..1991c58d9b 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -44,6 +44,15 @@ typedef struct VirtIOFeature {
>>       size_t end;
>>   } VirtIOFeature;
>>   
>> +typedef struct VirtIOConfigSizeParams {
>> +    size_t min_size;
>> +    size_t max_size;
>> +    const VirtIOFeature *feature_sizes;
>> +} VirtIOConfigSizeParams;
>> +
>> +size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
>> +                              uint64_t host_features);
>> +
>>   size_t virtio_feature_get_config_size(const VirtIOFeature *features,
>>                                         uint64_t host_features);
>>   
>> -- 
>> 2.25.1

