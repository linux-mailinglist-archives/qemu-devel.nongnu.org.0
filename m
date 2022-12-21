Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9A652BD8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 04:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ptL-00047D-Fc; Tue, 20 Dec 2022 22:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7ptJ-000457-87; Tue, 20 Dec 2022 22:35:37 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7ptH-0006OF-Co; Tue, 20 Dec 2022 22:35:37 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NcJrx1Rf8zHqYy;
 Wed, 21 Dec 2022 11:31:45 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 21 Dec 2022 11:35:29 +0800
Subject: Re: [PATCH 1/2] hw/arm/virt: Consolidate GIC finalize logic
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
References: <20221220230414.47876-1-agraf@csgraf.de>
 <20221220230414.47876-2-agraf@csgraf.de>
Message-ID: <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
Date: Wed, 21 Dec 2022 11:35:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221220230414.47876-2-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=yuzenghui@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/12/21 7:04, Alexander Graf wrote:
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c7dd59d7f1..365d19f7a3 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -109,12 +109,12 @@ typedef enum VirtMSIControllerType {
>  } VirtMSIControllerType;
>  
>  typedef enum VirtGICType {
> -    VIRT_GIC_VERSION_MAX,
> -    VIRT_GIC_VERSION_HOST,
> -    VIRT_GIC_VERSION_2,
> -    VIRT_GIC_VERSION_3,
> -    VIRT_GIC_VERSION_4,
> -    VIRT_GIC_VERSION_NOSEL,
> +    VIRT_GIC_VERSION_MAX = 0,
> +    VIRT_GIC_VERSION_HOST = 1,
> +    VIRT_GIC_VERSION_NOSEL = 2,
> +    VIRT_GIC_VERSION_2 = (1 << 2),
> +    VIRT_GIC_VERSION_3 = (1 << 3),
> +    VIRT_GIC_VERSION_4 = (1 << 4),

This would break the ACPI case. When building the MADT, we currently
write the raw vms->gic_version value into "GIC version" field of the
GICD structure. This happens to work because VIRT_GIC_VERSION_x == x (by
luck, I think). We may need to fix build_madt() before this change.

|static void
|build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
|{
|    /* GIC version */
|    build_append_int_noprefix(table_data, vms->gic_version, 1);

