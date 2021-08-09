Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B913E4983
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:14:20 +0200 (CEST)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7ut-0000nl-TI
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD7tg-0007ws-Gl
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD7te-0005AO-Ve
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628525578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqK1vIuxGg5/ghZi1t/3V5Mzgh+124zlvmjbn4DoefE=;
 b=XbiNGVswOnr6cykFppfj8HMHUJxvwVpMMrFHLGFUCd611Dcd0uEcmqttpPzG9vnAuoE/DZ
 skRMDnSvYurthq1pauRJm8nMLRNEL5xHGJbNMT/lwKfrUJ0N7YTo0M0u/NaqWpqSpCQDHm
 oov/QWcxXq5iY32KZ1ptonUhBNbGCXo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-2BLaxra9OPKbeQXAufaBFg-1; Mon, 09 Aug 2021 12:12:57 -0400
X-MC-Unique: 2BLaxra9OPKbeQXAufaBFg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so5488546wri.17
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqK1vIuxGg5/ghZi1t/3V5Mzgh+124zlvmjbn4DoefE=;
 b=gqKeJVHy1ZkG/XaxgwMu0KYB6qx4JVG1kc8d63Yc4nS/rwV3RiHCZx39dNnU44KfPI
 c0CQXzJeD6ipU5T4nvRGeRdBwhutNHqBfR9yEBuz6Vzb0wTsQYYwfXr70W1eq8xqfBTp
 VEUvrcY5DdxhUonq061g+oyJ9DCkzLmIP1l4Gp/UFimVyO1ifr0tON/I8S+kWDnk+2bU
 74IJ1iSZO/uriiO4s+zPvQE+H1dCFyMm3CGix57e1lyylpX9Hq7Waqyrxv9uskL3rbGZ
 XMwdB4e2wXMd/L+faspg4vgnpqc+Y1L0x6wxQgK4A4ngIqvpb2EUtmtmwH1aMCD6M+oO
 eFtA==
X-Gm-Message-State: AOAM5321IL3QLMKZQdcmWtaQ4rjYBHKt+y2p12LWcTnSzsoR7LTP+aqf
 GdvOo4y1LJxP0UxjVCoCQeyakQTI5p90IT2N5lALhi4cFQR0YNYxSb1TOYYpOO8VJjY4wdToPuL
 govpkdw+q8TtAqCc=
X-Received: by 2002:a5d:6107:: with SMTP id v7mr4253319wrt.408.1628525576618; 
 Mon, 09 Aug 2021 09:12:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCr/jj8KFDKcfZt4kDHXfoPW+DCcPeZSw1LpLO1/GqVUZkkeECzLTYYqs8VyXVOobbuvqmCg==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr4253291wrt.408.1628525576379; 
 Mon, 09 Aug 2021 09:12:56 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.28.170])
 by smtp.gmail.com with ESMTPSA id d5sm20003185wre.77.2021.08.09.09.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 09:12:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
 <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
 <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
 <c31d2975-7d90-84f9-74ea-838de69e78f5@redhat.com>
 <364daf53-31e4-e7eb-29e3-fd0e3f64e18f@redhat.com>
 <a298d8a8-b221-29e4-8f8f-a7db158b5e85@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <763ebfaa-72bb-bb0f-03b3-83c93f9a43f1@redhat.com>
Date: Mon, 9 Aug 2021 18:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a298d8a8-b221-29e4-8f8f-a7db158b5e85@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/08/2021 05:01, Jason Wang wrote:
> 
> 在 2021/8/6 下午3:27, Laurent Vivier 写道:
>> On 06/08/2021 08:25, Jason Wang wrote:
>>> 在 2021/8/2 下午4:42, Laurent Vivier 写道:
>>>> On 02/08/2021 06:50, Jason Wang wrote:
>>>>> 在 2021/7/30 上午3:19, Laurent Vivier 写道:
>>>>>> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
>>>>>> by setting vring.num to 0 (or num_default).
>>>>>> This is needed to be able to disable a guest driver from the host side
>>>>> I suspect this won't work correclty for vhost.
>>>> With my test it seems to work with vhost too.
>>>
>>> So setting 0 will lead -EINVAL to be returned during VHOST_SET_VRING_NUM. I think qemu
>>> will warn the failure in this case.
>> I didn't see any error when I tried. I will check the code.
>>
>>> What's more important, it's not guaranteed to work for the case of vhost-user or
>>> vhost-vDPA.
>> Perhaps we can target only the vhost host case, as this is used for failover and usually
>> the virtio-net device is backed by a bridge on same network as the VFIO device?
> 
> 
> Probably not, it should be a general feature that can work for all types of virtio/vhost
> backends.
> 
> 
>>
>>>
>>>>> And I believe we should only do this after the per queue enabling/disabling is supported
>>>>> by the spec.
>>>>>
>>>>> (only MMIO support that AFAIK)
>>>> I don't want to modify the spec.
>>>>
>>>> I need something that works without modifying existing (old) drivers.
>>>>
>>>> The idea is to be able to disable the virtio-net kernel driver from QEMU if the driver is
>>>> too old (i.e. it doesn't support STANDBY feature).
>>>>
>>>> Setting vring.num to 0 forces the kernel driver to exit on error in the probe function.
>>>> It's what I want: the device is present but disabled (the driver is not loaded).
>>>>
>>>> Any other suggestion?
>>>
>>> I think we should probably disable the device instead of doing it per virtqueue.
>>>
>> I tried to use virtio_set_disabled() but it doesn't work.
>> Perhaps it's too late when I call the function (I need to do that in
>> virtio_net_set_features()). What I want is to prevent the load of the driver in the guest
>> kernel to hide the virtio-net device. Setting vring.num to 0 triggers an error in the
>> driver probe function and prevents the load of the driver.
> 
> 
> How about fail the validate_features() in this case?

It's a good suggestion and it seems to work.

I'm going to send an updated patch.

Thanks,
Laurent


