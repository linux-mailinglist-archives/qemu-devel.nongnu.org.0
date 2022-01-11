Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB448AB81
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:35:39 +0100 (CET)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EV8-00036X-Di
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:35:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7ESx-0001QR-Jj
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:33:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7ESu-0005He-BP
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641897199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrdHHtTiQ5PfkuGg0+hsXAt0il0H+CDJFTah02FJTNU=;
 b=AdcO4V+r9yAP97N0WwZePbXUcZOc+t/YYxQ89LzlfmssTyr4XkEXnLkbFQK9j9aORxmgtU
 CfvkJtWpRXDSfFfhqdXJOz2UVqR6sISYMtwcGrwOMUj1dIS4/FKOKOjsV0XDYzTS6uu9uV
 rjhD5QOm9AyhlNLxE6lcHz1B504NNb0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-NwFRdKsMMOSlSSVCKP_Sqw-1; Tue, 11 Jan 2022 05:33:16 -0500
X-MC-Unique: NwFRdKsMMOSlSSVCKP_Sqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 i8-20020adfa508000000b001ad5418833cso156692wrb.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=yrdHHtTiQ5PfkuGg0+hsXAt0il0H+CDJFTah02FJTNU=;
 b=Hcdj0op1AXxELHeUP67BDKnjkXDOk6cI7e/nWiE3ZKtGizUyjK0AMzeLFU2UX//bIe
 +C6SAI+i6SXw6YCYGU8pu02mvEPXIeeIPZ2pE1iiWNUCORIM9/0d8e87UPv8SNGyiGIV
 CkY6RNztSxPva3RS0KZ2jv+U8wLtkYZ7DeDL0UAcK3zXgg+D2ooM8+sPNBUEjwHuTG98
 x8EQbN9waN6LRuNWRqhyv7mXzhoJ9c8I6Gcxwi1/Fzi0vMyFLzLvbWu5EZhNDrt752Ny
 8rZrmxKtB+Bm7JWWcS7fHGvXvjp03rzJxvznFnmZCj25fK7Ca/UUOTWQENVxHFnFQcAl
 H/bw==
X-Gm-Message-State: AOAM533Uqx1dxEqmzkJVvXVRvlrZOhUdtWasmKmuNdTCot74sgEGRnka
 EdSkunyr3JHx3MvX7oRAlN2cKWZ1ieeMnYzufFiOGqUovzdluzB7CowNfMddao/QkR/Z8eIiA2Q
 DqpJRgK9zW7BC8tY=
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr3268395wrq.154.1641897195087; 
 Tue, 11 Jan 2022 02:33:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWBpwuDMKnWTbGILpp/kLWMS3K269pe87WN//wUj8jQqp32XZTjZf02u8M3QVWOHfN5XD6Sg==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr3268382wrq.154.1641897194888; 
 Tue, 11 Jan 2022 02:33:14 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j3sm8691132wrt.14.2022.01.11.02.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 02:33:14 -0800 (PST)
Subject: Re: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com> <Yd1YRkJDv35bQ/PR@myrica>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <3106b980-ffc5-d732-3f7b-51c126aee0bf@redhat.com>
Date: Tue, 11 Jan 2022 11:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Yd1YRkJDv35bQ/PR@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 1/11/22 11:13 AM, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Tue, Jan 11, 2022 at 10:02:12AM +0100, Eric Auger wrote:
>> Hi Jean, Michael,
>>
>> On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
>>> Replace the VIRTIO_IOMMU_F_BYPASS feature with
>>> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
>>> global bypass on and off.
>>>
>>> Add a boot-bypass option, which defaults to 'on' to be in line with
>>> other vIOMMUs and to allow running firmware/bootloader that are unaware
>>> of the IOMMU.
>>>
>>> See the spec change for more rationale
>>> https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html
>> I guess the kernel bits should be merged in 5.17?
> Yes, they should. I can resend at 5.17-rc1 along with a commit updating
> the linux headers. Or is there a specific process for synchronizing the
> headers?  Looking at git log it looks like scripts/update-linux-headers.sh
> is run by whomever needs new UAPI features.
yes you need to generate the header update patch using

scripts/update-linux-headers.sh once the kernel pieces have landed

Thanks

Eric

>
> Thanks,
> Jean
>


