Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4E665820
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXkl-0007e5-IP; Wed, 11 Jan 2023 04:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pFXkh-0007da-K0
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:50:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pFXkf-0000le-SO
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673430632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijrOqXWt9qxLRgL1w53QSjGSP2KJBGwwF4mdaqNtYng=;
 b=Ul6YNmGhQUeWhc9f//cYoPpQb5dJArfioXeDTqSZo+spCuAg5copiEwSKRTpvvwjN+E4A2
 rv8xVHEEJdpfzLU+HGlMvB/3v2CUydhbQfKjua+KCKK1twz3q5sGx94uP9/XsbbM5+KlZh
 s+tzuA+Fy0G3Y+GbWdp31O4VI8mjv2o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-LTkiT6JRNnyFP-RgScWzVw-1; Wed, 11 Jan 2023 04:50:31 -0500
X-MC-Unique: LTkiT6JRNnyFP-RgScWzVw-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay34-20020a05620a17a200b00704bd9922c4so10584366qkb.12
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ijrOqXWt9qxLRgL1w53QSjGSP2KJBGwwF4mdaqNtYng=;
 b=QA+8woveULChrWbRqUGQgzUH5L6gtPXZUtnCgqVVaNeM9kgIO/bkCSzWSZcBYWnXur
 kvsAU12qF14PXw9jpkK4kYPWTxOjgftgFUD20AVRrpD5FwpKqK/WJ5NnqSh8N7MFirnn
 bkrD1V9MRQXrmvUcg0U+sFwdTNbTyx671EnKxTuxHJ6cTaSMEipRrJO4cwSV4q9vNvML
 OC7fGl9rZSbiQId/UMbzT7W/XvgdoAM5ww4CphYw9jgeIixKk7t8rtJZCj/s6wJj3LRA
 g/ZtopFAPZOdfIwywE0XA9/yLmczCP8dTWJBCArrmMbyUzoztwdxmUftX4gQwKhYZzho
 sayQ==
X-Gm-Message-State: AFqh2kpqKFv4zK4j2+Gn66Bh3F1hXOm6B/Zuzu+apTJUf9lYe7ZF4lPZ
 TudKejacLKEwVwuUEbGW3GsbMEN/znOk2rA6t6uh7lvegwLhy6umP89V9tg9fAhoTZDLBiufdGI
 PGTpmgYufw/qheTM=
X-Received: by 2002:ac8:5392:0:b0:3a5:1dcb:d231 with SMTP id
 x18-20020ac85392000000b003a51dcbd231mr100430871qtp.59.1673430630997; 
 Wed, 11 Jan 2023 01:50:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMyweka373wjPY0aArWoYff+E1v5en182zQJj/lWua12kkgaYbLAg+tpUi7mzFAY+SBsDPew==
X-Received: by 2002:ac8:5392:0:b0:3a5:1dcb:d231 with SMTP id
 x18-20020ac85392000000b003a51dcbd231mr100430851qtp.59.1673430630725; 
 Wed, 11 Jan 2023 01:50:30 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a05620a255200b006eeb3165565sm8762568qko.80.2023.01.11.01.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:50:29 -0800 (PST)
Message-ID: <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
Date: Wed, 11 Jan 2023 10:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Content-Language: en-US
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
 <20230109054633-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20230109054633-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/9/23 11:55, Michael S. Tsirkin wrote:
> On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
>> Hi,
>>
>> it seems this patch breaks vhost-user with DPDK.
>>
>> See https://bugzilla.redhat.com/show_bug.cgi?id=2155173
>>
>> it seems QEMU doesn't receive the expected commands sequence:
>>
>> Received unexpected msg type. Expected 22 received 40
>> Fail to update device iotlb
>> Received unexpected msg type. Expected 40 received 22
>> Received unexpected msg type. Expected 22 received 11
>> Fail to update device iotlb
>> Received unexpected msg type. Expected 11 received 22
>> vhost VQ 1 ring restore failed: -71: Protocol error (71)
>> Received unexpected msg type. Expected 22 received 11
>> Fail to update device iotlb
>> Received unexpected msg type. Expected 11 received 22
>> vhost VQ 0 ring restore failed: -71: Protocol error (71)
>> unable to start vhost net: 71: falling back on userspace virtio
>>
>> It receives VHOST_USER_GET_STATUS (40) when it expects VHOST_USER_IOTLB_MSG (22)
>> and VHOST_USER_IOTLB_MSG when it expects VHOST_USER_GET_STATUS.
>> and VHOST_USER_GET_VRING_BASE (11) when it expect VHOST_USER_GET_STATUS and so on.
>>
>> Any idea?
>>
>> Thanks,
>> Laurent
> 
> 
> So I am guessing it's coming from:
> 
>      if (msg.hdr.request != request) {
>          error_report("Received unexpected msg type. Expected %d received %d",
>                       request, msg.hdr.request);
>          return -EPROTO;
>      }
> 
> in process_message_reply and/or in vhost_user_get_u64.
> 
> 
>> On 11/7/22 23:53, Michael S. Tsirkin wrote:
>>> From: Yajun Wu <yajunw@nvidia.com>
>>>
>>> The motivation of adding vhost-user vhost_dev_start support is to
>>> improve backend configuration speed and reduce live migration VM
>>> downtime.
>>>
>>> Today VQ configuration is issued one by one. For virtio net with
>>> multi-queue support, backend needs to update RSS (Receive side
>>> scaling) on every rx queue enable. Updating RSS is time-consuming
>>> (typical time like 7ms).
>>>
>>> Implement already defined vhost status and message in the vhost
>>> specification [1].
>>> (a) VHOST_USER_PROTOCOL_F_STATUS
>>> (b) VHOST_USER_SET_STATUS
>>> (c) VHOST_USER_GET_STATUS
>>>
>>> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
>>> device start and reset(0) for device stop.
>>>
>>> On reception of the DRIVER_OK message, backend can apply the needed setting
>>> only once (instead of incremental) and also utilize parallelism on enabling
>>> queues.
>>>
>>> This improves QEMU's live migration downtime with vhost user backend
>>> implementation by great margin, specially for the large number of VQs of 64
>>> from 800 msec to 250 msec.
>>>
>>> [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html
>>>
>>> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>>> Acked-by: Parav Pandit <parav@nvidia.com>
>>> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Probably easiest to debug from dpdk side.
> Does the problem go away if you disable the feature VHOST_USER_PROTOCOL_F_STATUS in dpdk?

Maxime could you help to debug this?

Thanks,
Laurent


