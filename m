Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183923E3E13
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 05:02:42 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCvYm-00047d-KE
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 23:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvXp-0003H4-5F
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mCvXk-0003JD-0g
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 23:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628478094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gg0UzaAnE4SC8VOmZczP5W56CKpwVzihbGqm96MU+vo=;
 b=SFgjQC/p5PCY8wt+TNpQh7AXVNgIXIAGAc0w9IIxxH+U1EwVHsQpLBB7RaHa/7zzeEvEtc
 RvqnoBperaJPZwDLEaACfoxDD4i7/t+lakBZksTXEtpFfTXylYbJqijL1ZpacI4aTqKNJa
 41iHRqJs7BxLZ0kVMxnvZQLpKMatoic=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-zoVwOAPNPGOqvUbxRUmGRQ-1; Sun, 08 Aug 2021 23:01:32 -0400
X-MC-Unique: zoVwOAPNPGOqvUbxRUmGRQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 o13-20020a17090a9f8db0290176ab79fd33so12511208pjp.5
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 20:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gg0UzaAnE4SC8VOmZczP5W56CKpwVzihbGqm96MU+vo=;
 b=giEDLPwxGm13Az/urmeM9EspwngiiGTUnHRURtD4wQfJfXPhtH2J8q8UQzr4Y6WObK
 ud+y//lMiSaQmWqbKxqJQKdcv4c/BxoLFy8CWFKy3JsnivjOnnrEMmc3UZkWEzES6Q2i
 0dQvg568vP1kP9VwcoOrm/T9KRdLtNJD2jaSJGf49nQlPgXuM7F3ElTK7K/pYpqvftsj
 EtPm0g7+K563I0GVN8V2fl7WB/RdVqdzpPI9ZKTjd3haOooB+zFxZzJPsooiB9orR55q
 4QZRNiNNeLLxzyZ5bDZLPioe/jSaG2mj3vPcYSR9q7UutoqIdtd1aOdvPD+DwofigA/Q
 GSqg==
X-Gm-Message-State: AOAM530uAWoLk4DawkDbwk3dAXQmB5uczYldKXPgUH84MXWBAZbtLKk0
 F7of47lbNyxBV6eWL1QdgoqIFAPdQWvj21JCyNVUA6ITmrhnr+aEn2jR3m5CsS/7lDH0GoQ1O1g
 iQXrh8Zjs84hVJT8=
X-Received: by 2002:a17:90a:cb16:: with SMTP id
 z22mr10721370pjt.186.1628478091766; 
 Sun, 08 Aug 2021 20:01:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8VOsLzJ20TTjuSxJKu35zvVlr4WNFhwaGj4aGkfnO2jo/jBwjfcVUqDoaBE9H43k+YnNIaA==
X-Received: by 2002:a17:90a:cb16:: with SMTP id
 z22mr10721345pjt.186.1628478091508; 
 Sun, 08 Aug 2021 20:01:31 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g25sm18478111pfk.138.2021.08.08.20.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 20:01:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
 <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
 <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
 <c31d2975-7d90-84f9-74ea-838de69e78f5@redhat.com>
 <364daf53-31e4-e7eb-29e3-fd0e3f64e18f@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a298d8a8-b221-29e4-8f8f-a7db158b5e85@redhat.com>
Date: Mon, 9 Aug 2021 11:01:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <364daf53-31e4-e7eb-29e3-fd0e3f64e18f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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


在 2021/8/6 下午3:27, Laurent Vivier 写道:
> On 06/08/2021 08:25, Jason Wang wrote:
>> 在 2021/8/2 下午4:42, Laurent Vivier 写道:
>>> On 02/08/2021 06:50, Jason Wang wrote:
>>>> 在 2021/7/30 上午3:19, Laurent Vivier 写道:
>>>>> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
>>>>> by setting vring.num to 0 (or num_default).
>>>>> This is needed to be able to disable a guest driver from the host side
>>>> I suspect this won't work correclty for vhost.
>>> With my test it seems to work with vhost too.
>>
>> So setting 0 will lead -EINVAL to be returned during VHOST_SET_VRING_NUM. I think qemu
>> will warn the failure in this case.
> I didn't see any error when I tried. I will check the code.
>
>> What's more important, it's not guaranteed to work for the case of vhost-user or vhost-vDPA.
> Perhaps we can target only the vhost host case, as this is used for failover and usually
> the virtio-net device is backed by a bridge on same network as the VFIO device?


Probably not, it should be a general feature that can work for all types 
of virtio/vhost backends.


>
>>
>>>> And I believe we should only do this after the per queue enabling/disabling is supported
>>>> by the spec.
>>>>
>>>> (only MMIO support that AFAIK)
>>> I don't want to modify the spec.
>>>
>>> I need something that works without modifying existing (old) drivers.
>>>
>>> The idea is to be able to disable the virtio-net kernel driver from QEMU if the driver is
>>> too old (i.e. it doesn't support STANDBY feature).
>>>
>>> Setting vring.num to 0 forces the kernel driver to exit on error in the probe function.
>>> It's what I want: the device is present but disabled (the driver is not loaded).
>>>
>>> Any other suggestion?
>>
>> I think we should probably disable the device instead of doing it per virtqueue.
>>
> I tried to use virtio_set_disabled() but it doesn't work.
> Perhaps it's too late when I call the function (I need to do that in
> virtio_net_set_features()). What I want is to prevent the load of the driver in the guest
> kernel to hide the virtio-net device. Setting vring.num to 0 triggers an error in the
> driver probe function and prevents the load of the driver.


How about fail the validate_features() in this case?

Thanks


>
> Thanks,
> Laurent
>


