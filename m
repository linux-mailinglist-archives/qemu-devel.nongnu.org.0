Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740DF6E08CF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 10:21:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmsB4-0006Or-AG; Thu, 13 Apr 2023 04:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmsB1-0006Oh-K4
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmsAz-0007fw-6N
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 04:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681373967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pr0/9mIL8r59IlF73J80Kf+stDikNr4HiFAZ1iMcqgw=;
 b=Zp2ALYcG8AwH+yO2zdmYqUBkcjsQpMCFLkd8osz0Qv8YvA551R+A0nEhUZpjt60YEAY+n6
 6/o+Y5Wp5KYYQoamN1Yerx0JoaHlEfSuULphxpdg1oTphTy0wGuDzbzwogNgPY5OIAgf9n
 33ChZZTXcu2F/S4Srn2AT3+TqADXQWU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-uzpNNjzWOUeWydOMANmSJQ-1; Thu, 13 Apr 2023 04:19:26 -0400
X-MC-Unique: uzpNNjzWOUeWydOMANmSJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d25-20020adf9b99000000b002ef2d0e2d1eso3034383wrc.11
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 01:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681373965; x=1683965965;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pr0/9mIL8r59IlF73J80Kf+stDikNr4HiFAZ1iMcqgw=;
 b=fKrU958KIta+Qr50l3tK8p+epCJuADd4hiWyVrwu+wImvSNrxVsI4S9MK0dlic8bY7
 FVtOshfoUfXuzub+AwnKiYeVNowclS1aSwjXG8ne8sHs0l3bn+t+JQztM+ISBvjXu1QJ
 1ad+pp5kCxkd+qkj1zhrZ8GaWaFrq0WbdFWpzRJux2ppbJ90Y4zG3TT2v89IoAWc0eyo
 1yqyIKjct6DL0I4dvddHr24U/EqBupnMIZo7PGWJ8vNuDLih6yp6kxm9I0C8DIC/GimN
 1FPaNrFRoLBO3BE8CIOPIHoRkFuzi2+siWrxYCTYb8AHqQytUZFAPVoIyBkbhqPWgE1W
 qPcQ==
X-Gm-Message-State: AAQBX9dNFjfji9GHUlpzntTFdCwQmOxD53TP1klOFECByVwiQzXMLQd/
 38HfLIaM4RRWWFZvwwccJdzXSH8ZE3oh8H5/w2zzsCEauW+0XdVRBnGB2tx3H84yGKTw0gJ6PHA
 0R19ikhj92m/pCSM=
X-Received: by 2002:a5d:69c6:0:b0:2ee:e42e:e8b7 with SMTP id
 s6-20020a5d69c6000000b002eee42ee8b7mr853222wrw.33.1681373964782; 
 Thu, 13 Apr 2023 01:19:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8ntYpyjspCfxuOoDnbmF79ubGmcUKlwYkHt2z8Oua7xmWbnaLcYFLSAiC0XaCXuFkB6E+cA==
X-Received: by 2002:a5d:69c6:0:b0:2ee:e42e:e8b7 with SMTP id
 s6-20020a5d69c6000000b002eee42ee8b7mr853202wrw.33.1681373964419; 
 Thu, 13 Apr 2023 01:19:24 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adff10c000000b002cfe685bfd6sm713107wro.108.2023.04.13.01.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 01:19:23 -0700 (PDT)
Message-ID: <0ca69a92-49ab-223e-b737-9d8655883f38@redhat.com>
Date: Thu, 13 Apr 2023 10:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 German Maglione <gmaglione@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com> <20230412205138.GA2813183@fedora>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230412205138.GA2813183@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 12.04.23 22:51, Stefan Hajnoczi wrote:
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
> The vhost-user spec doesn't say that VHOST_F_LOG_ALL needs to be toggled
> at runtime and I don't think VHOST_USER_SET_PROTOCOL_FEATURES is
> intended to be used like that. This issue shows why doing so is a bad
> idea.
>
> VHOST_F_LOG_ALL does not need to be toggled to control logging. Logging
> is controlled at runtime by the presence of the dirty log
> (VHOST_USER_SET_LOG_BASE) and the per-vring logging flag
> (VHOST_VRING_F_LOG).

Technically, the spec doesn’t say that SET_LOG_BASE is required.  It says:

“To start/stop logging of data/used ring writes, the front-end may send 
messages VHOST_USER_SET_FEATURES with VHOST_F_LOG_ALL and 
VHOST_USER_SET_VRING_ADDR with VHOST_VRING_F_LOG in ring’s flags set to 
1/0, respectively.”

(So the spec also very much does imply that toggling F_LOG_ALL at 
runtime is a valid way to enable/disable logging.  If we were to no 
longer do that, we should clarify it there.)

I mean, naturally, logging without a shared memory area to log in to 
isn’t much fun, so we could clarify that SET_LOG_BASE is also a 
requirement, but it looks to me as if we can’t use SET_LOG_BASE to 
disable logging, because it’s supposed to always pass a valid FD (at 
least libvhost-user expects this: 
https://gitlab.com/qemu-project/qemu/-/blob/master/subprojects/libvhost-user/libvhost-user.c#L1044). 
So after a cancelled migration, the dirty bitmap SHM will stay around 
indefinitely (which is already not great, but if we were to use the 
presence of that bitmap as an indicator as to whether we should log or 
not, it would be worse).

So the VRING_F_LOG flag remains.

> I suggest permanently enabling VHOST_F_LOG_ALL upon connection when the
> the backend supports it. No spec changes are required.
>
> libvhost-user looks like it will work. I didn't look at DPDK/SPDK, but
> checking that it works there is important too.

I can’t find VRING_F_LOG in libvhost-user, so what protocol do you mean 
exactly that would work in libvhost-user?  Because SET_LOG_BASE won’t 
work, as you can’t use it to disable logging.

(For DPDK, I’m not sure.  It looks like it sometimes takes VRING_F_LOG 
into account, but I think only when it comes to logging accesses to the 
vring specifically, i.e. not DMA to other areas of guest memory?  I 
think only places that use vq->log_guest_addr implicitly check it, 
others don’t.  So for example, 
vhost_log_write_iova()/vhost_log_cache_write_iova() don’t seem to check 
VRING_F_LOG, which seem to be the functions generally used for writes to 
memory outside of the vrings.  So here, even if VRING_F_LOG is disabled 
for all vrings, as long as a log SHM is set, all writes to memory 
outside of the immediate vrings seem to cause logging (as long as 
F_LOG_ALL is set).)

Hanna

> I have CCed people who may be interested in this issue. This is the
> first time I've looked at vhost-user logging, so this idea may not work.
>
> Stefan


