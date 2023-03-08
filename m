Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E56B0526
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:58:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZrTh-0005s5-2V; Wed, 08 Mar 2023 05:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pZrTa-0005rk-Hs
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pZrTY-0001pJ-OT
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678273010;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPze2kAemoywR2y3iNTM9ywhLXz43ay/3GB+oFr89lY=;
 b=ZhKg8r1z19OJxml4wzNICgj2cvtv8MmKBWhJjPKYgpOK10jqUZ8Lygd336AWFAjV/xUv+Q
 4XWOEfy0i+yeoh8fwMgYYlJvOq/ly3uTENTZpQtv3uIEr4Hxn5EiDQzA46mCuqPcCy6pxA
 LfxUwKgw+cAFenv99lT9ol2JpCgEo7o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55--A3X7pYEM0SoaQKZgE8yKQ-1; Wed, 08 Mar 2023 05:56:46 -0500
X-MC-Unique: -A3X7pYEM0SoaQKZgE8yKQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ef20-20020a0562140a7400b004c72d0e92bcso8984822qvb.12
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 02:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678273001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPze2kAemoywR2y3iNTM9ywhLXz43ay/3GB+oFr89lY=;
 b=OZfjvpQlERFugIdNRbjaVt67mSB2jpI1PxqXDuhQQlaTA5qCQ4LOYju+jrwnJwNXHU
 mv1EhGs2qzF+4Dkg0cRBqRd+ZC67mFk2V+TMIlxix0csNR3qcOsDca9g9pA06tUZJirx
 pLBNzgy0N2Tda7u6LWEP8MeRMgaf8OnYqI/S/bc1DUvZSbOTN7lDsZg4coAiPhoOUVIx
 SWpR40YXHoRR8YPLB2pip12XK7Qfq+4fTIFpuVUY8pmlVwMgyB7OmEu201hB8yFhH97B
 h/0RvnNBgwS0/t9/45GoeBRwfG0pmet39wn3KAgUFRS9C6yFMZgN8rOEB39L3NqU8EXw
 uE6g==
X-Gm-Message-State: AO0yUKVkBs/NVPHennZusA45ulJSswvSvUHhxdWLrYjHdIkTEAtHahN1
 IqfSPtJbPrdwPuuCS2LvMXyAOHnbDTTnNJQSqgEgdJtfd5/HtpliY23Mbf739QZv2yCTEmOhb4o
 qhQBoCdp6Q1x2uRk=
X-Received: by 2002:ac8:7f01:0:b0:3b9:bc8c:c202 with SMTP id
 f1-20020ac87f01000000b003b9bc8cc202mr34324785qtk.13.1678273001121; 
 Wed, 08 Mar 2023 02:56:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/DaqhNjL61M9iP81YBgl1w9ZdD4pbsOr9AJ5SQDLlK8CXxEkh64LlbUsAkRhKRs2olY3Orfg==
X-Received: by 2002:ac8:7f01:0:b0:3b9:bc8c:c202 with SMTP id
 f1-20020ac87f01000000b003b9bc8cc202mr34324761qtk.13.1678273000836; 
 Wed, 08 Mar 2023 02:56:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac851c2000000b003bfd27755d7sm11325844qtn.19.2023.03.08.02.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:56:39 -0800 (PST)
Message-ID: <ee9afb15-5bfd-b2fd-e3d8-ae585afbe87f@redhat.com>
Date: Wed, 8 Mar 2023 11:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC v3 11/18] vfio/ccw: Use vfio_[attach/detach]_device
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, eric.auger.pro@gmail.com,
 yi.l.liu@intel.com, yi.y.sun@intel.com, alex.williamson@redhat.com,
 clg@redhat.com, qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 akrowiak@linux.ibm.com, pasic@linux.ibm.com, jjherne@linux.ibm.com,
 jasowang@redhat.com, kvm@vger.kernel.org, jgg@nvidia.com,
 nicolinc@nvidia.com, kevin.tian@intel.com, chao.p.peng@intel.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, berrange@redhat.com, apopple@nvidia.com,
 suravee.suthikulpanit@amd.com
References: <20230131205305.2726330-1-eric.auger@redhat.com>
 <20230131205305.2726330-12-eric.auger@redhat.com>
 <6e04ab8f-dc84-e9c2-deea-2b6b31678b53@linux.ibm.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6e04ab8f-dc84-e9c2-deea-2b6b31678b53@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Matthew,

On 3/3/23 18:30, Matthew Rosato wrote:
> On 1/31/23 3:52 PM, Eric Auger wrote:
>> Let the vfio-ccw device use vfio_attach_device() and
>> vfio_detach_device(), hence hiding the details of the used
>> IOMMU backend.
>>
>> Also now all the devices have been migrated to use the new
>> vfio_attach_device/vfio_detach_device API, let's turn the
>> legacy functions into static functions, local to container.c.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> Hi Eric,
>
> While testing the cdev series on s390 I ran into a couple of issues with this patch, see below.
>
>> ---
>>  include/hw/vfio/vfio-common.h |   4 --
>>  hw/vfio/ccw.c                 | 118 ++++++++--------------------------
>>  hw/vfio/container.c           |   8 +--
>>  3 files changed, 32 insertions(+), 98 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 9465c4b021..1580f9617c 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -176,10 +176,6 @@ void vfio_region_unmap(VFIORegion *region);
>>  void vfio_region_exit(VFIORegion *region);
>>  void vfio_region_finalize(VFIORegion *region);
>>  void vfio_reset_handler(void *opaque);
>> -VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
>> -void vfio_put_group(VFIOGroup *group);
>> -int vfio_get_device(VFIOGroup *group, const char *name,
>> -                    VFIODevice *vbasedev, Error **errp);
>>  int vfio_attach_device(VFIODevice *vbasedev, AddressSpace *as, Error **errp);
>>  void vfio_detach_device(VFIODevice *vbasedev);
>>  
>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> index 0354737666..6fde7849cc 100644
>> --- a/hw/vfio/ccw.c
>> +++ b/hw/vfio/ccw.c
>> @@ -579,27 +579,32 @@ static void vfio_ccw_put_region(VFIOCCWDevice *vcdev)
>>      g_free(vcdev->io_region);
>>  }
>>  
>> -static void vfio_ccw_put_device(VFIOCCWDevice *vcdev)
>> -{
>> -    g_free(vcdev->vdev.name);
>> -    vfio_put_base_device(&vcdev->vdev);
>> -}
>> -
>> -static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
>> -                                Error **errp)
>> +static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>>  {
>> +    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
>> +    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
>> +    VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>> +    S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>> +    VFIODevice *vbasedev = &vcdev->vdev;
>> +    Error *err = NULL;
>>      char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
>>                                   vcdev->cdev.hostid.ssid,
>>                                   vcdev->cdev.hostid.devid);
>
> We can't get these cssid, ssid, devid values quite yet, they are currently 0s.  That has to happen after cdc->realize()
>
>
>> -    VFIODevice *vbasedev;
>> +    int ret;
>>  
>> -    QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> -        if (strcmp(vbasedev->name, name) == 0) {
>> -            error_setg(errp, "vfio: subchannel %s has already been attached",
>> -                       name);
>> -            goto out_err;
>> +    /* Call the class init function for subchannel. */
>> +    if (cdc->realize) {
>> +        cdc->realize(cdev, vcdev->vdev.sysfsdev, &err);
>> +        if (err) {
>> +            goto out_err_propagate;
>>          }
>>      }
>> +    vbasedev->sysfsdev = g_strdup_printf("/sys/bus/css/devices/%s/%s",
>> +                                         name, cdev->mdevid);
>> +    vbasedev->ops = &vfio_ccw_ops;
>> +    vbasedev->type = VFIO_DEVICE_TYPE_CCW;
>> +    vbasedev->name = name;
> vbasedev->name is being set to the wrong value here, it needs to be the uuid.
>
> See below for a suggested diff on top of this patch that solves the issue for me.
>
> Thanks,
> Matt
>
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 6fde7849cc..394b73358f 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -587,9 +587,6 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>      S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>      VFIODevice *vbasedev = &vcdev->vdev;
>      Error *err = NULL;
> -    char *name = g_strdup_printf("%x.%x.%04x", vcdev->cdev.hostid.cssid,
> -                                 vcdev->cdev.hostid.ssid,
> -                                 vcdev->cdev.hostid.devid);
>      int ret;
>  
>      /* Call the class init function for subchannel. */
> @@ -599,11 +596,14 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>              goto out_err_propagate;
>          }
>      }
> -    vbasedev->sysfsdev = g_strdup_printf("/sys/bus/css/devices/%s/%s",
> -                                         name, cdev->mdevid);
> +    vbasedev->sysfsdev = g_strdup_printf("/sys/bus/css/devices/%x.%x.%04x/%s",
> +                                         vcdev->cdev.hostid.cssid,
> +                                         vcdev->cdev.hostid.ssid,
> +                                         vcdev->cdev.hostid.devid,
> +                                         cdev->mdevid);
>      vbasedev->ops = &vfio_ccw_ops;
>      vbasedev->type = VFIO_DEVICE_TYPE_CCW;
> -    vbasedev->name = name;
> +    vbasedev->name = g_strdup(cdev->mdevid);
>      vbasedev->dev = &vcdev->cdev.parent_obj.parent_obj;
>  
>      /*
>
>
Thank you very much for your report.

This will be handled in the next version.

Eric


