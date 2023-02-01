Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D243C686A91
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFGU-0002GU-R1; Wed, 01 Feb 2023 10:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNFGP-0002FQ-QH
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNFGN-0001fV-MV
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675266186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysVJeSWsRwtQ8lRG5KxX8zf/r8R7/oCvM/YlMO+VpRk=;
 b=VaOtteE6zTSbZBCWh+kBNKFOsiWrZ2jfGh8C4or4+SKefbd3RVgsiR3h3Np/0dDRyRILkP
 QaioEw0EjdlW979h9uWRtrZNibOxIsetARC61rzKZ6KiMW87mX04Md+jUkERYqMqujQ26a
 5OA3nMQLggp90IzUjvM05iGiu1+kSPQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-Po7XU9XhMWCuOju1UtsGSg-1; Wed, 01 Feb 2023 10:43:04 -0500
X-MC-Unique: Po7XU9XhMWCuOju1UtsGSg-1
Received: by mail-qv1-f72.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so10445071qvb.20
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 07:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ysVJeSWsRwtQ8lRG5KxX8zf/r8R7/oCvM/YlMO+VpRk=;
 b=PMY6WQ8szNYPGbHMI9rwTMQ9Oa8IcRp+ESZbpSwSEOaYNawyPo5FHE5JQqvi+KLYUU
 oxVcK33TzOJvy2bB8A0Nz/VOz6p3rdIhc1mYx6aTxJOjqWgbXoJKBEJwoF0DPYdrWNks
 0M7m1eEd908aqM2ln43X4a3fxJUsqeT88QXoukPWBK0pKRYUFc72glkqYP0flOoDpoxm
 Di/9v44huRud777LWB/v44acOnnTB0gFJeD2R7TpaxeDSOS+aQgnrh3TgrSX0o+xlBoi
 tSFnbtaoHJf6GDzzGVwhO9Y1DckqVLr+fYHpuJxcKUcmIcmlnOPcfEsPh2RCholg/bYa
 AnZQ==
X-Gm-Message-State: AO0yUKW7VU3swg9nU3p+viMNs3+/k3guoS0672eqaw+yQjdAg5HXMpJY
 SmOmEvfyWesOu2Xx7oIapwY8sXUUsdYxfCaIWV4mxpkvtPALb7DfDJcFdPAspEGJV+sj36Ac7kk
 WfzWubW6ZPoMhJWA=
X-Received: by 2002:a05:622a:2c1:b0:3b9:bb27:e11a with SMTP id
 a1-20020a05622a02c100b003b9bb27e11amr2446695qtx.0.1675266184282; 
 Wed, 01 Feb 2023 07:43:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/BneK1ulF3AJc6fhGlcRYjyTST3V8LcwkXDMZuxLLm1lgCUoACJ+u4zOgQY53DLcVGSPgidA==
X-Received: by 2002:a05:622a:2c1:b0:3b9:bb27:e11a with SMTP id
 a1-20020a05622a02c100b003b9bb27e11amr2446659qtx.0.1675266183996; 
 Wed, 01 Feb 2023 07:43:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a17-20020ac86111000000b003b0766cd169sm12070166qtm.2.2023.02.01.07.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 07:43:02 -0800 (PST)
Message-ID: <a430b451-2eaa-2dc2-4223-20d5275c3ca3@redhat.com>
Date: Wed, 1 Feb 2023 16:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC v3 16/18] vfio/iommufd: Implement the iommufd backend
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: eric.auger.pro@gmail.com, yi.l.liu@intel.com, yi.y.sun@intel.com,
 alex.williamson@redhat.com, clg@redhat.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 nicolinc@nvidia.com, kevin.tian@intel.com, chao.p.peng@intel.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, berrange@redhat.com, apopple@nvidia.com,
 suravee.suthikulpanit@amd.com
References: <20230131205305.2726330-1-eric.auger@redhat.com>
 <20230131205305.2726330-17-eric.auger@redhat.com>
 <Y9mkriFLL43OGbHq@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y9mkriFLL43OGbHq@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Jason,

On 2/1/23 00:30, Jason Gunthorpe wrote:
> On Tue, Jan 31, 2023 at 09:53:03PM +0100, Eric Auger wrote:
>> From: Yi Liu <yi.l.liu@intel.com>
>>
>> Add the iommufd backend. The IOMMUFD container class is implemented
>> based on the new /dev/iommu user API. This backend obviously depends
>> on CONFIG_IOMMUFD.
>>
>> So far, the iommufd backend doesn't support live migration and
>> cache coherency yet due to missing support in the host kernel meaning
>> that only a subset of the container class callbacks is implemented.
> What is missing for cache coherency? I spent lots of time on that
> already, I thought I got everything..
I don't think there is anything missing anymore. This was about
KVM_DEV_VFIO_GROUP_ADD/DEL. With the advent of KVM_DEV_VFIO_FILE_ADD/DEL
we should be able to bridge the gap. However This RFCv3 does not support
that yet in the IOMMUFD backend. We will add this support in the next
version.

Thanks

Eric
>
> Jason
>


