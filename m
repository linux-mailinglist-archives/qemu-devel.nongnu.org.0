Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B43E23F8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:28:19 +0200 (CEST)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuHC-0003qc-UR
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mBuGR-00038Y-L9
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mBuGP-0003Xm-QF
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628234848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkL5tj6a3yK14mS+1LG9k62Ohm9j4rDe43ai/gDIn48=;
 b=TKK5MacrrkUSmuYhjq4kWE/G+NF6+0ZxcP99ei3mAMHHeKAGZM1Mfnf0rhlD5CzYBtmjAC
 6ex8yIaW0g8/yksH7YoLopgaytKNsqv0/nCn5nT4XOEkCzUwEidJ5nYPrcGrP4qGghwBDw
 WjLGVw2WKIe5j13+cr4UWI3nLsV87tg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-8DLOJPKYPZSXZCytLSqe6A-1; Fri, 06 Aug 2021 03:27:25 -0400
X-MC-Unique: 8DLOJPKYPZSXZCytLSqe6A-1
Received: by mail-wr1-f70.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so1551042wra.1
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bkL5tj6a3yK14mS+1LG9k62Ohm9j4rDe43ai/gDIn48=;
 b=dRdTe0CQ2B9NgstqboOLzSMBL8iBpF29JC/Fx8r5BmtApJtvBkvkuIz0MkONKbxM9x
 pVw0sbzdrY/F7fFb/60abwwU5Tfjpf7qxfN8S3qYiI7sXQwdl02oPZrVcNLeEwYS2Kkz
 vsYr2hVcPn9MhK6SHJszslPc7x11QjArWVzNiQ4efrEJTlGxnv2zqt1vmWfCPWbV29FF
 Ik6YeA+KytCpm7Y9bLFxxWwNpnZjf9bCJuul1Sv4guxVjVXaMVf+jO7xZo5QsBuKQYAw
 mKIjLyDNYLJ2D5XRWAC8pLbQpHnVY5xNLW1alL18r782OnLAwd4bPWtLy+j4LPShAFAA
 7aOQ==
X-Gm-Message-State: AOAM530CbcYmtsS+sLt6bLKudjZZ/SeIs/+awcwN8SVCWEnqmuXXCvwD
 Xjy/Y2z5y7+GXeEazaxC6+1XSqXvhR1KTfFGOjfDaE74mmLht51jnTetNB1o44e/VuI1PMlEemZ
 ZJehs48DXLj1aeBM=
X-Received: by 2002:a5d:6107:: with SMTP id v7mr9082206wrt.107.1628234844230; 
 Fri, 06 Aug 2021 00:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4x8Z9zxETBBGO3vJRG/1CbbAzaeLLb3Wm/CcwWztBnoalikhtSyt9hw7ZuPvSvsu3rNt8DA==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr9082189wrt.107.1628234843997; 
 Fri, 06 Aug 2021 00:27:23 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.6.46])
 by smtp.gmail.com with ESMTPSA id m9sm8389929wrz.75.2021.08.06.00.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:27:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
 <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
 <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
 <c31d2975-7d90-84f9-74ea-838de69e78f5@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <364daf53-31e4-e7eb-29e3-fd0e3f64e18f@redhat.com>
Date: Fri, 6 Aug 2021 09:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c31d2975-7d90-84f9-74ea-838de69e78f5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/08/2021 08:25, Jason Wang wrote:
> 
> 在 2021/8/2 下午4:42, Laurent Vivier 写道:
>> On 02/08/2021 06:50, Jason Wang wrote:
>>> 在 2021/7/30 上午3:19, Laurent Vivier 写道:
>>>> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
>>>> by setting vring.num to 0 (or num_default).
>>>> This is needed to be able to disable a guest driver from the host side
>>>
>>> I suspect this won't work correclty for vhost.
>> With my test it seems to work with vhost too.
> 
> 
> So setting 0 will lead -EINVAL to be returned during VHOST_SET_VRING_NUM. I think qemu
> will warn the failure in this case.

I didn't see any error when I tried. I will check the code.

> What's more important, it's not guaranteed to work for the case of vhost-user or vhost-vDPA.

Perhaps we can target only the vhost host case, as this is used for failover and usually
the virtio-net device is backed by a bridge on same network as the VFIO device?

> 
> 
>>
>>> And I believe we should only do this after the per queue enabling/disabling is supported
>>> by the spec.
>>>
>>> (only MMIO support that AFAIK)
>> I don't want to modify the spec.
>>
>> I need something that works without modifying existing (old) drivers.
>>
>> The idea is to be able to disable the virtio-net kernel driver from QEMU if the driver is
>> too old (i.e. it doesn't support STANDBY feature).
>>
>> Setting vring.num to 0 forces the kernel driver to exit on error in the probe function.
>> It's what I want: the device is present but disabled (the driver is not loaded).
>>
>> Any other suggestion?
> 
> 
> I think we should probably disable the device instead of doing it per virtqueue.
> 

I tried to use virtio_set_disabled() but it doesn't work.
Perhaps it's too late when I call the function (I need to do that in
virtio_net_set_features()). What I want is to prevent the load of the driver in the guest
kernel to hide the virtio-net device. Setting vring.num to 0 triggers an error in the
driver probe function and prevents the load of the driver.

Thanks,
Laurent


