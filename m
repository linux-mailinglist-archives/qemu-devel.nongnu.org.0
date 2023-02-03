Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B968A105
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0JI-0000t9-Gu; Fri, 03 Feb 2023 12:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0JG-0000sW-4j
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:57:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0JE-0005Je-Au
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675447030;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/L3xQge9a5Ec5fO+C6nReyrV0+o9EA7agOtUfXx62n8=;
 b=DWfp/yDnfV9c8Dd2DlgsoqWGxdgwqoawBb8IoazDJJAqYLvsBCiSDbyLIqMVBD9qk/ymX7
 +kthXXOsFwXYr5cvJI/EACMw2+96FtQ9OFktjqliObTazoYGbkrPrHyGCNrkZ+iAfoufu8
 grxLgSLnvlu534wqgTSnje4mMIMR06g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-UTSWkbfFN1uwr6yilR6GrA-1; Fri, 03 Feb 2023 12:57:09 -0500
X-MC-Unique: UTSWkbfFN1uwr6yilR6GrA-1
Received: by mail-qv1-f70.google.com with SMTP id
 jo26-20020a056214501a00b0053aa15f61d4so3138834qvb.7
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/L3xQge9a5Ec5fO+C6nReyrV0+o9EA7agOtUfXx62n8=;
 b=NGxtvlfsobulpJaOK3N1vQ80O7tHnix8BBwv39JAAhWjP45mR/hKZ7sEpV7qG5kPc5
 yTVWrvxRjN9j0yzT6O89pKuW/Bpl8XZC2WYX+mtjW6oCNyS/cmFo4gWBSS0eUWKPvDa7
 Bz8WbZbFzODeQ6RrUHRXEImo5ZS3loJg5dIN5ixtBf0ivu5Hc20Y/ZE6JrPq1aC8ELx6
 ZIHktqwVKfM0V14CfwTenqq0wRPztRKayFbGRKrHkYNdieg4oKHCEPJ0QqhxJlJvMdGs
 Purkm4M5U5/ZsX1WAFdehwGGStYhaqh9TjgGuvwcKnDPW1ZNKVmLVij6E8AvXEtD+FHO
 Ee9w==
X-Gm-Message-State: AO0yUKXsiMYXynm8K+/sqopOuF28pv2gxu9P31+J9et4owLXhOSqmJMn
 EhuC7VdE3+0bwFouJsCQ7KKku1hHr4/Nd9HMJUpu1uyWWOCeU8hMd5uhLZ2BNOyvTZGp3WEcclj
 qzkRLKbR653Q+fQs=
X-Received: by 2002:a05:622a:2d6:b0:3b8:6c5f:4ac0 with SMTP id
 a22-20020a05622a02d600b003b86c5f4ac0mr20731476qtx.46.1675447029158; 
 Fri, 03 Feb 2023 09:57:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8EbAbc95VhGloJFwOZ2JnsXI2vvSEEJYVu9nj0HJw+CT9jxjv+niBcOkgAGfnaC+brvV015A==
X-Received: by 2002:a05:622a:2d6:b0:3b8:6c5f:4ac0 with SMTP id
 a22-20020a05622a02d600b003b86c5f4ac0mr20731433qtx.46.1675447028891; 
 Fri, 03 Feb 2023 09:57:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p1-20020ac84081000000b003a530a32f67sm1917010qtl.65.2023.02.03.09.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:57:07 -0800 (PST)
Message-ID: <3ddad294-69f7-3067-1420-e1438cf017cb@redhat.com>
Date: Fri, 3 Feb 2023 18:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC v3 18/18] vfio/as: Allow the selection of a given iommu
 backend
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
 <20230131205305.2726330-19-eric.auger@redhat.com>
 <Y90DOL2pnYxHHNzL@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y90DOL2pnYxHHNzL@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
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

On 2/3/23 13:51, Jason Gunthorpe wrote:
> On Tue, Jan 31, 2023 at 09:53:05PM +0100, Eric Auger wrote:
>> Now we support two types of iommu backends, let's add the capability
>> to select one of them. This depends on whether an iommufd object has
>> been linked with the vfio-pci device:
>>
>> if the user wants to use the legacy backend, it shall not
>> link the vfio-pci device with any iommufd object:
>>
>> -device vfio-pci,host=0000:02:00.0
>>
>> This is called the legacy mode/backend.
>>
>> If the user wants to use the iommufd backend (/dev/iommu) it
>> shall pass an iommufd object id in the vfio-pci device options:
>>
>>  -object iommufd,id=iommufd0
>>  -device vfio-pci,host=0000:02:00.0,iommufd=iommufd0
>>
>> Note the /dev/iommu device may have been pre-opened by a
>> management tool such as libvirt. This mode is no more considered
>> for the legacy backend. So let's remove the "TODO" comment.
> The vfio cdev should also be pre-openable like iommufd?

where does the requirement come from?

Thanks

Eric
>
> Jason
>


