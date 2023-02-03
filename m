Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB168A122
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:04:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Pr-00037q-62; Fri, 03 Feb 2023 13:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0Pp-00037Q-4G
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pO0Pn-0007DR-GQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675447438;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KsgSK8Okdkgqu/pylo49YSVsl161ef+KFwE9qE+scc=;
 b=b/ZUYOUIXjK1Fy7wvsnkpVPR+v65i3yDiB6qZdNObV2zQMkormupLy4uhP9c1lIi/Qrmhw
 Xe5UHFM5UA9ne2nILWy6+6GPv/BZWGRT/avRsktxP2KkECCPrlVMdqOSubyGvwUdk+FUh8
 YSwjpISApC3qhLRNdq7h2JVSW9lgTcA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-g1BKVBL4OUGpuJGNFUbsQQ-1; Fri, 03 Feb 2023 13:03:57 -0500
X-MC-Unique: g1BKVBL4OUGpuJGNFUbsQQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so3766743qkl.10
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KsgSK8Okdkgqu/pylo49YSVsl161ef+KFwE9qE+scc=;
 b=qHq05SxiLBflmhAaWoKDMR7cQpp4V0+OjSDc6RKcsMB2JWZz/JEBYzy97QZTPu7DH6
 CYXaDWGrNsBevZGZ70w3t89vfeWqNgOmCIY5G5u3S0lpFwe0LI/MZq02HgDYefq0QhEc
 lHFdV53IoaK9M+oYmYF9GcA0mvjSglTiZVG1ziTL8aYoD3USF81GA/cEoCYOibpXcnud
 BtxLyciU2qX8usP2WD8T3qw3lJ+6kS9cMzLKTPFL9zWx8sTpJ5b8WXw3aSiXLtCPJYwO
 bNCFHvbzmUrkNvjZ5nymCwrAapxaS8Vbfj9+v2qX+vbgabopSfJwfYbZdI5p0XebwDDv
 ZNJQ==
X-Gm-Message-State: AO0yUKX+4+lDy6p4cFQMWC7RUx6qSdAzcqVAMWtAcVmnFUIDJBLgFOcf
 Ada3xqPnpZmJpsFFL4rIK56S0ZAK1NzMIyMVXY8gG25jNANzNd8mIfJBgzgasJ6DJdmS8zaw1kV
 AkS5e7Hr+mrOwx4k=
X-Received: by 2002:a05:622a:1047:b0:3b8:6ae9:b100 with SMTP id
 f7-20020a05622a104700b003b86ae9b100mr21011462qte.7.1675447436935; 
 Fri, 03 Feb 2023 10:03:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9Go1OnlalGty2/hqPRFSwNpTDV9MXDTM7zhF4ynViVl1Ds1n2q2n7vezvQk9M2j534qtGuTg==
X-Received: by 2002:a05:622a:1047:b0:3b8:6ae9:b100 with SMTP id
 f7-20020a05622a104700b003b86ae9b100mr21011421qte.7.1675447436604; 
 Fri, 03 Feb 2023 10:03:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h13-20020ac8714d000000b003b9dca4cdf4sm1939793qtp.83.2023.02.03.10.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 10:03:55 -0800 (PST)
Message-ID: <fc6271e1-ee1e-41d5-0710-007f780e653b@redhat.com>
Date: Fri, 3 Feb 2023 19:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC v3 00/18] vfio: Adopt iommufd
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
 <Y90EvdM0CZlr51ug@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y90EvdM0CZlr51ug@nvidia.com>
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



On 2/3/23 13:57, Jason Gunthorpe wrote:
> On Tue, Jan 31, 2023 at 09:52:47PM +0100, Eric Auger wrote:
>> Given some iommufd kernel limitations, the iommufd backend is
>> not yuet fully on par with the legacy backend w.r.t. features like:
>> - p2p mappings (you will see related error traces)
>> - coherency tracking
> You said this was a qemu side limitation?
yes that's correct. This comment will be removed.
>
>> - live migration
> The vfio kernel interfaces are deprecated,  Avihai's series here adds
> live migration support:
>
> https://lore.kernel.org/qemu-devel/20230126184948.10478-1-avihaih@nvidia.com/
>
> And there will be another series for iommufd system iommu based live
> migration

OK thanks for the pointer.
>
>> - vfio pci device hot reset
> What is needed here?

we need to revisit the vfio_pci_hot_reset() implementation in hw/vfio/pci.c
It uses VFIO_DEVICE_GET_PCI_HOT_RESET_INFO and VFIO_DEVICE_PCI_HOT_RESET
uapis
which retrieves/passes the list of iommu groups involved in the reset.
The notion of group had initially disappeared from the the iommufd BE
but I am afraid that's not that simple.

Thanks

Eric
>
> Jason
>


