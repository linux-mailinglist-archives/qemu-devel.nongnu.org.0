Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959716E0790
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 09:18:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmrDS-0000di-FL; Thu, 13 Apr 2023 03:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pmrDH-0000dQ-2J
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pmrDE-0007mx-P9
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 03:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681370262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3fxlYnLZG+HH++RdfgY9Ofj5y9sdQsGEkzklrhBFiw=;
 b=YIYOlP4aNzXuncnT9LCg4MWyipM2dpuPlyZAoXurd+31v8/Dff/k1cnRT3AcC25066wG7X
 uci7otyq/XjxgMiXzL2yGshaeR8fR7EmQAECIg/c72caemvmEzZOjwvryHRhTJloC8neOg
 s0s7+y11msCCQ05ngeaxjWTyRbjT68M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-jDIomZs9O3a5PXNDkcAkew-1; Thu, 13 Apr 2023 03:17:39 -0400
X-MC-Unique: jDIomZs9O3a5PXNDkcAkew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F9CC1C189A3;
 Thu, 13 Apr 2023 07:17:39 +0000 (UTC)
Received: from [10.39.208.7] (unknown [10.39.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A6AEC16028;
 Thu, 13 Apr 2023 07:17:18 +0000 (UTC)
Message-ID: <74a20bbf-860e-ed5b-03fa-6f25ce865652@redhat.com>
Date: Thu, 13 Apr 2023 09:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com> <20230412205138.GA2813183@fedora>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
In-Reply-To: <20230412205138.GA2813183@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 4/12/23 22:51, Stefan Hajnoczi wrote:
> On Tue, Apr 11, 2023 at 05:05:12PM +0200, Hanna Czenczek wrote:
>> If the back-end supports the VHOST_USER_F_PROTOCOL_FEATURES feature,
>> setting the vhost features will set this feature, too.  Doing so
>> disables all vrings, which may not be intended.
>>
>> For example, enabling or disabling logging during migration requires
>> setting those features (to set or unset VHOST_F_LOG_ALL), which will
>> automatically disable all vrings.  In either case, the VM is running
>> (disabling logging is done after a failed or cancelled migration, and
>> only once the VM is running again, see comment in
>> memory_global_dirty_log_stop()), so the vrings should really be enabled.
>> As a result, the back-end seems to hang.
>>
>> To fix this, we must remember whether the vrings are supposed to be
>> enabled, and, if so, re-enable them after a SET_FEATURES call that set
>> VHOST_USER_F_PROTOCOL_FEATURES.
>>
>> It seems less than ideal that there is a short period in which the VM is
>> running but the vrings will be stopped (between SET_FEATURES and
>> SET_VRING_ENABLE).  To fix this, we would need to change the protocol,
>> e.g. by introducing a new flag or vhost-user protocol feature to disable
>> disabling vrings whenever VHOST_USER_F_PROTOCOL_FEATURES is set, or add
>> new functions for setting/clearing singular feature bits (so that
>> F_LOG_ALL can be set/cleared without touching F_PROTOCOL_FEATURES).
>>
>> Even with such a potential addition to the protocol, we still need this
>> fix here, because we cannot expect that back-ends will implement this
>> addition.
>>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   include/hw/virtio/vhost.h | 10 ++++++++++
>>   hw/virtio/vhost.c         | 13 +++++++++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index a52f273347..2fe02ed5d4 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -90,6 +90,16 @@ struct vhost_dev {
>>       int vq_index_end;
>>       /* if non-zero, minimum required value for max_queues */
>>       int num_queues;
>> +
>> +    /*
>> +     * Whether the virtqueues are supposed to be enabled (via
>> +     * SET_VRING_ENABLE).  Setting the features (e.g. for
>> +     * enabling/disabling logging) will disable all virtqueues if
>> +     * VHOST_USER_F_PROTOCOL_FEATURES is set, so then we need to
>> +     * re-enable them if this field is set.
>> +     */
>> +    bool enable_vqs;
>> +
>>       /**
>>        * vhost feature handling requires matching the feature set
>>        * offered by a backend which may be a subset of the total
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index a266396576..cbff589efa 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -50,6 +50,8 @@ static unsigned int used_memslots;
>>   static QLIST_HEAD(, vhost_dev) vhost_devices =
>>       QLIST_HEAD_INITIALIZER(vhost_devices);
>>   
>> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable);
>> +
>>   bool vhost_has_free_slot(void)
>>   {
>>       unsigned int slots_limit = ~0U;
>> @@ -899,6 +901,15 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
>>           }
>>       }
>>   
>> +    if (dev->enable_vqs) {
>> +        /*
>> +         * Setting VHOST_USER_F_PROTOCOL_FEATURES would have disabled all
>> +         * virtqueues, even if that was not intended; re-enable them if
>> +         * necessary.
>> +         */
>> +        vhost_dev_set_vring_enable(dev, true);
>> +    }
>> +
>>   out:
>>       return r;
>>   }
>> @@ -1896,6 +1907,8 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>>   
>>   static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)
>>   {
>> +    hdev->enable_vqs = enable;
>> +
>>       if (!hdev->vhost_ops->vhost_set_vring_enable) {
>>           return 0;
>>       }
> 
> The vhost-user spec doesn't say that VHOST_F_LOG_ALL needs to be toggled
> at runtime and I don't think VHOST_USER_SET_PROTOCOL_FEATURES is
> intended to be used like that. This issue shows why doing so is a bad
> idea.
> 
> VHOST_F_LOG_ALL does not need to be toggled to control logging. Logging
> is controlled at runtime by the presence of the dirty log
> (VHOST_USER_SET_LOG_BASE) and the per-vring logging flag
> (VHOST_VRING_F_LOG).
> 
> I suggest permanently enabling VHOST_F_LOG_ALL upon connection when the
> the backend supports it. No spec changes are required.
> 
> libvhost-user looks like it will work. I didn't look at DPDK/SPDK, but
> checking that it works there is important too.
> 
> I have CCed people who may be interested in this issue. This is the
> first time I've looked at vhost-user logging, so this idea may not work.

In the case of DPDK, we rely on VHOST_F_LOG_ALL to be set to know
whether we should do dirty pages logging or not [0], so setting this
feature at init time will cause performance degradation. The check on
whether the log base address has been set is done afterwards.

Regards,
Maxime

> Stefan

[0]: https://git.dpdk.org/dpdk/tree/lib/vhost/vhost.h#n594


