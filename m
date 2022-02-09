Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56F4AEF4F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:32:52 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkHL-00076I-LB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHjgH-0004Zg-A2
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHjgC-0007Xs-Ly
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644400467;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6p+AUTkIc0L1VIK2Iu4qO1+JEeA2dWg1xo9w3rZRyQ=;
 b=QAP6M42x6eMrHZLNJ5uewDyBzean3uEQGnvD2SP9xmP/eyoX8eB+YwLgAPmOp29he+fESM
 /dix2HgKN0pm0VwBFv1aZVochiezI0SfmI+LShr8pDaBIOOO2AhOxp4iQueAiTPCmEfOzy
 5gJJQ+pCbV61gEV3Fkn3qllfDro+Gqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-LePbu-UnP8Ki5BvwCFryOg-1; Wed, 09 Feb 2022 04:54:26 -0500
X-MC-Unique: LePbu-UnP8Ki5BvwCFryOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso288069wml.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=X6p+AUTkIc0L1VIK2Iu4qO1+JEeA2dWg1xo9w3rZRyQ=;
 b=UlFjPzBbI0fVgXADHz6U7MBZQUrOEez/j5R1IPI+IB/GsnEW8V2flOqLxBHJSmAcl5
 VLHpoPyf2X0kmphJpCAD+KsK2usE3W+XgYZgF2a+yyeczdC7abpdiKmtVVcZTTRYCEZe
 h19vSjy+WCXPVcd+XMlQZKQeqgrV58cjqRNtMs08WF2+6tZOx4KlofjTIhz036cmqyI8
 1SLaQk+wp53y+R0VWJgef4qP2AEl2js8IGelLo4c7tZfga8jnakcN3dAxgwU0YjdLWtV
 mDC7U2Dh7bHZeco38+MBHw45VxdsPZGu7qxr9ui9/LDc0YK+yqEN5cYWyRz9BMXf3+/V
 aFFQ==
X-Gm-Message-State: AOAM531JEZwRbLfIAawLmkcElao7OGaMd3hq0X24UY6ldVgOi8icJIFU
 0OUgRGqV72AGnezXRouRXPdw25qjcifbbG35Po9/7N9K3En8qqdpiPzvn5yirR3YGcAhHJlxgSb
 pCwFfpRxMI8bBciA=
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr1869071wmb.50.1644400464807;
 Wed, 09 Feb 2022 01:54:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq1YZb4aR2xA+VnpDLFgL+zHpEoaEu69OqD0v2AKnxoCl8ZuqIu5NK+ap91eQ1cLGj/YhKRQ==
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr1869056wmb.50.1644400464540;
 Wed, 09 Feb 2022 01:54:24 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id az21sm4301842wmb.11.2022.02.09.01.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:54:24 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
 <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
 <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
 <20220208093640.1b8a54f8.alex.williamson@redhat.com>
 <CAFEAcA-CkDJ+sdmWv6DRc+v_9XnD0TgeRco6iUWUYLSoChgRsg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <53276f45-c8ea-df7a-fb4e-01672323aa2e@redhat.com>
Date: Wed, 9 Feb 2022 10:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CkDJ+sdmWv6DRc+v_9XnD0TgeRco6iUWUYLSoChgRsg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, imammedo@redhat.com, stefanb@linux.vnet.ibm.com,
 david@gibson.dropbear.id.au, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/8/22 6:14 PM, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 16:36, Alex Williamson <alex.williamson@redhat.com> wrote:
>> On Tue, 8 Feb 2022 16:01:48 +0000
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Well, it can if it likes, but "this is a RAM-backed MemoryRegion"
>>> doesn't imply "this is really guest actual RAM RAM", so if it's
>>> using that as its discriminator it should probably use something else.
>>> What is it actually trying to do here ?
>> VFIO is device agnostic, we don't understand the device programming
>> model, we can't know how the device is programmed to perform DMA.  The
>> only way we can provide transparent assignment of arbitrary PCI devices
>> is to install DMA mappings for everything in the device AddressSpace
>> through the system IOMMU.  If we were to get a sub-page RAM mapping
>> through the MemoryListener and that mapping had the possibility of
>> being a DMA target, then we have a problem, because we cannot represent
>> that through the IOMMU.  If the device were to use that address for DMA,
>> we'd likely have data loss/corruption in the VM.
> This is true whether that small MR is RAM-backed or MMIO-backed
> or RAM-backed and marked as being a "ram device", though,
> isn't it ?
>
>> AFAIK, and I thought we had some general agreement on this, declaring
>> device memory as ram_device is the only means we have to differentiate
>> MemoryRegion segments generated by a device from actual system RAM.
> What do you mean by "generated by a device" here? Devices within
> QEMU create MemoryRegions of all kinds; some of them are RAM-backed,
> some of them are not.
>
> memory_region_init_ram_device_ptr() is (per the documentation)
> for when the backing device is a real host device that vfio is
> wrapping to turn into a QEMU device.
>
> tpm_crb is not a real host device, though -- it's an actually
> emulated-by-QEMU device.
CRB can work in passthrough mode though, although I don't know the
underlying implementation.

As mentionned in the other email

https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
says

"
Including the control structure, the three memory areas comprise the
entirety of the CRB. There are no constraints on how those three memory
areas are provided. They can all be in system RAM, or all be in device
memory, or any combination.



>
>> For device memory, we can lean on the fact that peer-to-peer DMA is
>> much more rare and likely involves some degree of validation by the
>> drivers since it can be blocked on physical hardware due to various
>> topology and chipset related issues.  Therefore we can consider
>> failures to map device memory at a lower risk than failures to map
>> ranges we think are actual system RAM.
> Well, if it's not page aligned and at least page sized it's
> a pretty reasonable guess that it's not system RAM...
Assuming that obviously makes things simpler and remove a bunch of
checks & error reports in vfio :) But wouldn' we silence some actual
dma-map failures we properly detect & report today?

Thanks

Eric
>
> thanks
> -- PMM
>


