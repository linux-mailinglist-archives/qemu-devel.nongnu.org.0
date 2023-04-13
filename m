Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2E6E1394
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 19:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn0ob-0006nv-N4; Thu, 13 Apr 2023 13:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn0oY-0006kY-AN
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pn0oH-0004FB-37
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681407156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4g5B/i8UE7Szp7GJC0DRtqsf6F//xo/rt/N8oD/sss=;
 b=UdpVC6/WltNR/K0/5cV9F4peG9knRpxnQPry5DKpBAcluIDhsSFN1e62YawHs6LJSHuyEh
 /O5D019F95u7QpUSVE9AJWXhfLCIRaUpUPBaqQUikuWPUi6dL1OmMgxCWUepajHGRklodM
 iInQ9R+mylA2bWx6WnB/v9kHH9Uta00=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-9QwXdgZHPRiu7CqfyHuvmg-1; Thu, 13 Apr 2023 13:32:35 -0400
X-MC-Unique: 9QwXdgZHPRiu7CqfyHuvmg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l3-20020a05600c1d0300b003f0af5c7b4cso95014wms.7
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 10:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681407154; x=1683999154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4g5B/i8UE7Szp7GJC0DRtqsf6F//xo/rt/N8oD/sss=;
 b=JjhmabIYV/pZa2oFx5M6ougiUpMdFN9IY5NDQsWU/zPm+z6CKNDRgOovbq5FJZQpiO
 Hm0n6zMx6Tx7/rt4muC5piEUk9jbCqKNXQLPrGI0P66cL0ufiSczdQcQNR1c0+5MzyEA
 cytH2z0n89IpDXL3vH5u1wlIKjavLnvU0JaIqXJSbF5czXVesKS0Ue6BVj3G1M6UxOSZ
 LOR1qWmc6FYiK29XQzln5rrrz3JX2dV6hFJPwY0V43ix6g6PShNAh49k8ohRXLcD0qUL
 fbXmZGO3aUnXkus4aA6JwmauS2yiBn+Vm0hZ3CnGz/9J/6SHjEYEHTv0Q1tcgF6FOJ4M
 sPoA==
X-Gm-Message-State: AAQBX9fDAXIZg1RwVbVcCMR9UFa253DY/4DzTJl97CJ7IWK67CGJPVvQ
 +GmbkQPZcwUAjvGP5XSP/433+KNIHLA6HY4vMCkfwdJCKAChNe4fL/iueUaHVb/5H3xgcg2tpRE
 +dX+n/HKAm7g6sPA=
X-Received: by 2002:a7b:ce89:0:b0:3f0:68ce:5465 with SMTP id
 q9-20020a7bce89000000b003f068ce5465mr2550930wmj.7.1681407153920; 
 Thu, 13 Apr 2023 10:32:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMvPhYhMeLbYVoWAj0cj60TTGBKkybyviIZN+NSB+udIrsTnFXPZNBlrj7WZTw/mEyy2NDiA==
X-Received: by 2002:a7b:ce89:0:b0:3f0:68ce:5465 with SMTP id
 q9-20020a7bce89000000b003f068ce5465mr2550918wmj.7.1681407153638; 
 Thu, 13 Apr 2023 10:32:33 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a1c6a14000000b003eae73f0fc1sm2359853wmc.18.2023.04.13.10.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 10:32:33 -0700 (PDT)
Message-ID: <5a6d3445-3a0c-18c6-834e-c39de41f4ee2@redhat.com>
Date: Thu, 13 Apr 2023 19:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] vhost: Re-enable vrings after setting features
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-2-hreitz@redhat.com>
 <CAJSP0QVbNrvCYN+4aokEf=-L=D9YRTCKX-9-793NEBi91d6Fqw@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QVbNrvCYN+4aokEf=-L=D9YRTCKX-9-793NEBi91d6Fqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13.04.23 13:03, Stefan Hajnoczi wrote:
> On Tue, 11 Apr 2023 at 11:05, Hanna Czenczek <hreitz@redhat.com> wrote:
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
> Is there a reason to put this vhost-user-specific workaround in
> vhost.c instead of vhost-user.c?

My feeling was that this isn’t really vhost-user-specific.  It just so
happens that vhost-user is the only implementation that has a special
feature that disables all vrings, but I can’t see a reason why that
would be vhost-user-specific.

I mean, vhost_dev_set_vring_enable() looks like it can work for any
vhost implementation, but:
- .vhost_set_vring_enable() is indeed only implemented for vhost-user
- vhost_dev_set_vring_enable() won’t do anything if (for a vhost-user
   back-end) the F_PROTOCOL_FEATURES feature hasn’t been negotiated.

So this looked to me like if .vhost_set_vring_enable() were ever
implemented for anything but vhost-user, it’s quite likely that this too
would be gated behind some feature that auto-disables all vrings.

So this, plus the fact that vhost_dev_set_vring_enable() already has
vhost-user-specific code (while being a vhost.c function), I thought
it’d be best to put this into generic vhost.c code, simply because in
the worst case, it’ll be a no-op on other vhost implementations.

But as it is, functionally, of course I can just put it into
vhost_user_set_features().  (It would be a tiny bit more complicated,
because then I’d have to use vhost_user_set_vring_enable(), which
returns an error if F_PROTOCOL_FEATURES isn’t there, which we’d have to
ignore – vhost_dev_set_vring_enable() does that already for me.)

Hanna


