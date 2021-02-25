Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357AB325164
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:16:17 +0100 (CET)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHR9-0003zt-Qm
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lFHPt-0003YU-9c
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:14:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lFHPn-00057E-IF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:14:55 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmZVj5cKzzMbNS;
 Thu, 25 Feb 2021 22:12:29 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 22:14:23 +0800
Subject: Re: [RFC v10 00/25] intel_iommu: expose Shared Virtual Addressing to
 VMs
To: Liu Yi L <yi.l.liu@intel.com>, <qemu-devel@nongnu.org>,
 <alex.williamson@redhat.com>, <peterx@redhat.com>, <jasowang@redhat.com>
References: <1599735398-6829-1-git-send-email-yi.l.liu@intel.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <c7179970-731c-c40e-45e6-ad3a9f921af3@huawei.com>
Date: Thu, 25 Feb 2021 22:14:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1599735398-6829-1-git-send-email-yi.l.liu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, kvm@vger.kernel.org,
 mst@redhat.com, jun.j.tian@intel.com, eric.auger@redhat.com,
 yi.y.sun@intel.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, hao.wu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yi,

On 2020/9/10 18:56, Liu Yi L wrote:
> The high-level architecture for SVA virtualization is as below, the key
> design of vSVA support is to utilize the dual-stage IOMMU translation (
> also known as IOMMU nesting translation) capability in host IOMMU.
> 
>      .-------------.  .---------------------------.
>      |   vIOMMU    |  | Guest process CR3, FL only|
>      |             |  '---------------------------'
>      .----------------/
>      | PASID Entry |--- PASID cache flush -
>      '-------------'                       |
>      |             |                       V
>      |             |                CR3 in GPA
>      '-------------'
> Guest
> ------| Shadow |--------------------------|--------
>        v        v                          v
> Host
>      .-------------.  .----------------------.
>      |   pIOMMU    |  | Bind FL for GVA-GPA  |
>      |             |  '----------------------'
>      .----------------/  |
>      | PASID Entry |     V (Nested xlate)
>      '----------------\.------------------------------.
>      |             ||SL for GPA-HPA, default domain|
>      |             |   '------------------------------'
>      '-------------'

A silly question: With nested mode, do we need to setup the second level
mappings (GPA->HPA) for devices before vm startup? If so, can you please
point me to the piece of code that achieves it?

On Arm, we setup the stage-2 mapping via the new prereg_listener [1].

[1] 
https://patchwork.kernel.org/project/qemu-devel/patch/20210225105233.650545-15-eric.auger@redhat.com/


Thanks,
Zenghui

