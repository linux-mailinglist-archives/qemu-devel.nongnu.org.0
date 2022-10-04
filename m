Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44245F40AD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:20:24 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1off2F-0002pJ-N1
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1off00-0008Q0-P1
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:18:04 -0400
Received: from mail-dm6nam10on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62f]:23873
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1ofezy-00017x-7D
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:18:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZwuc4xYV58roEVCf+7G1hMAZuAWkEFACKnp93ZPonARwbQj9YgU4tG+NuzQ3tKt2VIcIWdkPUve81Rqt/s2kD52RkQcdJn2dSNmG8PCp+m1mF/qhr8sBHofa9TzBoFV0j9v1kMRxgg7VcOa3TitUrbVe+1b2fzNmO4dnQDXmh5lRKCObIHQLhniKZ88oLa3PVsMsESVjTfNi2NZHe7u9d1v2qtBun3ZAAhpVvOix3mj789snhOkUwmaODxayvJu2oyw4oTVSXKPBSf/kTQ0pbhVlMdF6NQDz+a/xgffd/PZUG2UA9DdlJJBnug6fxAZ0KHPlIhf0EaT9zBkzH7uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbodqE0lucA8NI80A81VfQ6TTE7cLJ12GjlbWaqMl2s=;
 b=eK9SGYBMwbRmZOvyQgE/AFd94+SnW5wMYC/6Y2YRWZlUcpV5Ru5HeDG7ByqnHTvxtOGOFbn13ky0jlmxbsbWMRrDtFrazu10SvYkrIHxuxGN90YjG/EzNwuAQZfn90nGgyqt/PED2aWd/7uEIQpxBjQRHFEXgoWa51CRHBZ5HcHCO7nhzMQedvmU/tx2g9+S9m1k5MQ0EjPuV1ZOjaL7LlIoypnakJNHPRrqtlKh0AQZgQVfU3CuTl4Oq9KW4RTVmYovs7g0uh0RlTsl0JXs1HqlduKwhhxaT5kQsAuU7a9bhHp8B7TTnAJB6l8x0ePLo85L8+TZSgBRFyW6ruRjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbodqE0lucA8NI80A81VfQ6TTE7cLJ12GjlbWaqMl2s=;
 b=YODf786WgWguaFahnmiN6s3EhJJ9rVVSDumz1n2ZxK0tlcAdo1spitP7wFr0nTd2SyC+Ih2fSu6kpdHq8gUmx6zE0hc0KUzLcgkd3VrwuXHROfrMrhl9g2NNiXw0ierpUioekREVmJiAG60bA9ihLAzFz+Bz3rpyrcKDVLdRbWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by CY8PR12MB7292.namprd12.prod.outlook.com
 (2603:10b6:930:53::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 4 Oct
 2022 10:12:57 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::dd6a:ad02:bcf4:6758]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::dd6a:ad02:bcf4:6758%11]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:12:55 +0000
Message-ID: <c534fde9-2ffc-7409-40a9-281bd463e86e@amd.com>
Date: Tue, 4 Oct 2022 12:12:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, David Hildenbrand <david@redhat.com>, 
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-4-kraxel@redhat.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <20220930135810.1892149-4-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::12) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0181:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: e49ae035-3089-4b3b-a91f-08daa5f100f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfXZt0MRsVd1LUcqp7JT2wcrmFK2UBKsVEdihpqwJdILS524+fAMzB5n7T5lVqNXhaYtWV5vLDiO4rIkXRVsQ/Stcuk/yPLJ/HPO6j2cHUsy2wxetASPbC/jZkDQ/05v35TAPadNPMOMVHpybiJey2glxuuCBDB00bf91qbYRysVlYohhEVjPtw0YU9pZlPG0jeJ6xaSHg9uibHPrZkOTih3xXDOBecwctgJ4DEbDIBFNrMq2fAMQ/1FWHXfs1JNH/Z5YGaJjG4G5NzbxuQ5QX14p+quC5NYFB49OplUsTParYpdvjGgKjLN7QeJUOFZXky4RSwACOBeZlH7UQpapXVnzoX4Jzb5Ahv3a4KSFUOPjOmjnzG5uY2pRiZR9Mr8UAttW9MZ9HbywIMR00PIYUr4L0rSeC+Oub/jOIQH8PLqRyRtBolzxJpwvoXgWXT8Hy6EsbkJjXJln9YDbONXVYpoB12WhEMO24Aqhs1BBD3U129fxFHYEjMLe8y6P4aup4/nnNT8/j16GBxbnouJWdyoksTeneH4U8xd8bXSLz+tmKNcSuuECTLep1KuE+l9TwfJlyKV9OTQAPcfv1BBvlXZClYMMbib3TDrRj4S1GTTXhHTkJu9nzxL78z12o3TaOM9tTiAW7f8JtVI+YP+8WjmpL1zLcKBC/y7KgkRiql61+llBcCYdQMSlsMZe3gWz/VZQ8ylxkWZdHk/6BG/bZ5aE+CtOJFT1PThQ6VQ0e6ztkz/UkihgYw+zFcS3Tde09fBr3sN7afK8X/SrJF5QXQNMNS2TuMTb2btNihKnC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(316002)(31686004)(2906002)(5660300002)(36756003)(8936002)(66556008)(66946007)(8676002)(31696002)(66476007)(4326008)(86362001)(478600001)(41300700001)(6486002)(54906003)(53546011)(6666004)(83380400001)(2616005)(6506007)(6512007)(26005)(38100700002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE50OG82MTBvdjhuUGtvSVZpY2dGUm9Vc2hwNXRtQ293QysydUhidWZqUlhz?=
 =?utf-8?B?Z1NqUkJXRnlESkNPNmx3OEhjNVFiYkl5ZHdOYXg4UVhWZU40MkJFSmxsclRT?=
 =?utf-8?B?UDY0VmdObmFCeFZsZGJsRDQ3dldkSklsdWNwQnQxSUZCU2RCaFAxb3hMVGNF?=
 =?utf-8?B?YkRRenVBY2ZMNi95ZW9uVDZjWUtja1hYckVoakdXT2ZWaFlEK2NqWW5qZ3Bi?=
 =?utf-8?B?UlpZVGhZd010d2NhMFY5ckU5Ni9uOEhIUldMT1B3amxhUnBsNGRKUE5aei9H?=
 =?utf-8?B?T0U1MmFjZDNMcVRkcG81cUsxUi9qYTB0em5oelBDMVIyNkRQbkRDWnp2cGlO?=
 =?utf-8?B?bmVCZGtXU1AybTBhakZTUHhkWlJKTFlRK2JiLzJxRnF3dVhJMm83N2RDTVVO?=
 =?utf-8?B?OE1lSWVyb1dDa3hmenUzQXBZTkxkT2V2bDl2ZXBRdlFFS0VtSHF1TVFvQld6?=
 =?utf-8?B?YndUSlJvY2ZSUi9tLzdkQWFDT2ROTnFGOHp2NGlHN0xuUVVWKzd2MmpodXgv?=
 =?utf-8?B?M2hvSHBLOHNRR05lc2o2VEUrR3hJTUZGM0ZwZmtaNXlYWHdPcE9tczJwMi8z?=
 =?utf-8?B?N1NhdGJUZVA3TTV4cEswM1JWaWo2VnFXOHJxeHhOSGVSc2NsRjlxT0hIR0s4?=
 =?utf-8?B?YWpJakxhamdpSFNXL210c3Axb3VBZGVnV1hQYjRLM0VzSFdMSDlyc0Jlcnpq?=
 =?utf-8?B?Mlc4Nnc0clRIVTVzTk1jZkF0QTNndXZvS1VYa1MzelYyaHluaUVMVTZIeURj?=
 =?utf-8?B?a0JqVXd2K1pvSng0dTFXUTNWTXZRREl3Um5PdUtpVnluRWN3NTh4d2FVcDBt?=
 =?utf-8?B?dWFkTU02Tk9CdTVnWnBVZDNEYzhKb1VMRVp2RVhBSncrblljcnRaMEp5RHVB?=
 =?utf-8?B?eVI5Y01GTk9iTGlVZkpuREtrMjlGdEoxSTM5T0RTbkpLK1BUd0l5VkFNNTEw?=
 =?utf-8?B?eWREQ0RGVG1IK3FXTG9GbDdQSVZpcm9UVmExMFFrUTlEZkJ2REo3M3piZFlX?=
 =?utf-8?B?RVhSYUhXT0F3UmIyaHduMlU0clhjWXdFaUJZOExEZ2M4RjMxZE80OHdKakpv?=
 =?utf-8?B?dGVGNVlCVEw5TjJPMEl2MWFNeEN5MUpKajRnWTJwWkZtODRrUEhjWmtxNDk5?=
 =?utf-8?B?SDlDcmMrZWQ3ZURpaDluNkYzOG95dWxTWVZ4aVJCajBvb1RwU0FqRDNIUzdK?=
 =?utf-8?B?MHJuaWF0bUVLWFQ0UG1LalFtTTJmbGZTWnNvbGNRU01yYWsyWXNnQ0RhNXZ3?=
 =?utf-8?B?ZHZkbDYzbU1kWHlHek5Pc3B5WFlSOFBSZkVhQlZmZHFOc3dsazlSV0p0Yk5a?=
 =?utf-8?B?WDQ2S1JDVUFlRDBsVXE4S1QzNTBpYnJCUUtoTEk3WGlORi9hRzJrRjloZDZW?=
 =?utf-8?B?dEc1ZTJPQmNJYkdEZEx1RG1wUlBzVUFRSHc4aDVYYzBCTUdsZGlyd2VRZ3VY?=
 =?utf-8?B?Tytab3RDakFBSjVVRFJ0SkhFMG5ZSTI2T1h0bTc0eWNmVER0YUpuL0xiYWtL?=
 =?utf-8?B?YTJXWGlFY2dHMzZRQ1hDZ1lFU045MTdxMzFJMW9NejVxaUx6S01nMnlUZjVE?=
 =?utf-8?B?ZzF0WHNlemFUamp3a0orWFM5eGxnWkw4RUNIZDAwVXpaZSthKzd1YkM5ZHhT?=
 =?utf-8?B?TzYydXBVQldzTzJTTm5rYjZEYUNPN01XRGNtKzRsYVlLZzhUSXJCTmpDVThW?=
 =?utf-8?B?bVgwMlFZekNzWHdXdzJhbGM1YkJ3M2lFdnRVL1JYVzNzN2NaS1ZXbzhMRFRE?=
 =?utf-8?B?TVUyRnRMYytOM0NCYUFrSG1mbkhucEZaWmZTNEdseUNNKzQ0c20xdmxlSTVu?=
 =?utf-8?B?RCtzOE5YcXBEM1lKYnhSWUU5WjZ2QXYrcHMwYkR3Tm9zTlM3ZEhCS0xWR2NY?=
 =?utf-8?B?SWFIQmdEVHlXM0ZMRy9vbjVXc2hXRCtFRW5ZVllPTEJxdldWQmtUaU5WRTk4?=
 =?utf-8?B?bTNUR1BWcjREY21YeFJDZGZFR3UrL2Q0RW1iNjdoMEdsKzNQTUdjUEJGMjN4?=
 =?utf-8?B?RzJNaXJhVm84S2xIcmhSU1g5eUZLRnErNHN4NDhQOTJSQUhiOG1ZSGk3SitY?=
 =?utf-8?B?bmcrWnk3MWYxTnNadDdDK3RkUmt2aVZiMjNaNUI3eW50dzY5SzdUUEdmT2Jy?=
 =?utf-8?Q?4QRzSJomBHnB0KqnM9Socnual?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49ae035-3089-4b3b-a91f-08daa5f100f6
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:12:55.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsqbW2qiALMiMwdowv8z6R3uY38NeKyx4Z7QSzEPwD/1xmmUMV3HNCq0JEIjQYAIdgPCoFh7dD6cGlU03mZD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62f;
 envelope-from=Pankaj.Gupta@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.467,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/2022 3:58 PM, Gerd Hoffmann wrote:
> Not needed for a virtio 1.0 device.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   include/hw/pci/pci.h        | 1 -
>   hw/virtio/virtio-pmem-pci.c | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index b6aefb33fb17..42c83cb5ed00 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -84,7 +84,6 @@ extern bool pci_available;
>   #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
>   #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>   #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> -#define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
>   
>   #define PCI_VENDOR_ID_REDHAT             0x1b36
>   #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
> index 2b2a0b1eae10..7d9f4ec189b9 100644
> --- a/hw/virtio/virtio-pmem-pci.c
> +++ b/hw/virtio/virtio-pmem-pci.c
> @@ -90,8 +90,6 @@ static void virtio_pmem_pci_class_init(ObjectClass *klass, void *data)
>   
>       k->realize = virtio_pmem_pci_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> -    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> -    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_PMEM;
>       pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
>       pcidev_k->class_id = PCI_CLASS_OTHERS;
>   


