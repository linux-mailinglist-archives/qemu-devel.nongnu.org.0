Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73B69976E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:30:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfGk-0006XH-0g; Thu, 16 Feb 2023 09:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisco.iglesias@amd.com>)
 id 1pSaYV-00005L-0p; Thu, 16 Feb 2023 04:27:55 -0500
Received: from mail-co1nam11on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::614]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisco.iglesias@amd.com>)
 id 1pSaYS-0007iQ-Qf; Thu, 16 Feb 2023 04:27:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cam5RRPJ8iJXppJk4sn5257NsorAdKrmlJIEwo9/UsqMrKsvQIwmvqQAZyXJth6CDKYj120QOHQgG546/0HawHAdEKQgJMyAR5YPXJn2Hb3vENj6jCXL6y2umEiyn2sfwPn0Tv5I9Rx26aKz4Qpus7fIcQiWFX6wAN9focoOwcDkVS/E5bfUkaEqdw6O1K1R4WEYvq+MQ22USFUfQH8z/JKiLMgftMJin3cSozumbQkXqTTfMjKfF70OglY7uNtzWT4DF5TW9MIuKLMOJFf7Vb693vHWplfrxjGBQTuuSxwrm5EvTaP4DVvFnlfwq5Qk0CwAHDia5fUBXlimdty2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V4rGUcOKG3ErsOoVgyZ/Qyb+zzMNlF7eWUfjoZpYo0=;
 b=QpBfTtTdWh6cghfS2X2Ol9tExgZNErzO4NIvWMVptjdJlD9jv088zErrilSsk/4fXf6j4H60lU4srxR7fEn88kY0YlDtfYjDtVLrjt646qZ/CHqbKL8TlAJG9Njy04dbZD1dco9XUQE8WWmDJ2RnzrYFbnh7fgRwSCvvZILAZxBIGJd5AEAFCvJAb04jd73c6xJhNXNsE1deuyAte69YRDeDKMvUKMdds47D9BwmUUepYDEw5estmXE9sgV+ruehZ6B7Ucfcyv9Z9pqA/tMjQ9gM0hEgSNSdq1QfU0JmMV/P5S5Yv3PXNGKJe3XWxDLgWr2d8VZbNTwkyzkMg+1cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V4rGUcOKG3ErsOoVgyZ/Qyb+zzMNlF7eWUfjoZpYo0=;
 b=nfiddxqZ3TEK/ene0PB5JDBX6UfqmnVfWf8Yh0BUcMNys7pUNdSxeT4FNyOSvLucRR9a5O5OvOMs2kr2joTMKLmdAu0Jdmz4Oqc0PL+6PgG4ycvzFljAb4/MVEOgiUMM3Tl+jmpRNERjSULfK8w/QnUSMaA46Dxbh+Iv+e6Ky9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1130.namprd12.prod.outlook.com (2603:10b6:3:75::19) by
 DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 09:27:46 +0000
Received: from DM5PR12MB1130.namprd12.prod.outlook.com
 ([fe80::234:3b1c:70ba:9a1d]) by DM5PR12MB1130.namprd12.prod.outlook.com
 ([fe80::234:3b1c:70ba:9a1d%4]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 09:27:39 +0000
Message-ID: <332905e0-3428-8e0b-7222-ed503a5b116a@amd.com>
Date: Thu, 16 Feb 2023 10:27:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230216092327.2203-1-philmd@linaro.org>
From: Francisco Iglesias <francisco.iglesias@amd.com>
In-Reply-To: <20230216092327.2203-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::13) To DM5PR12MB1130.namprd12.prod.outlook.com
 (2603:10b6:3:75::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1130:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e50b3eb-1a1c-4c1a-3076-08db10000be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Vl1kDxIObhqLOea4Stqz1LU7gJd8HDipFvc8N5STfvoSxqWBMSylCMyfH8ztg68OLSPxfuSnMexoQjiY4ee6aQL4X9B7b+Gv0WG3S3meLPHet74r/insMYrHZbm+/49jzfJcxCMglzkRi1YyyIzZfCfukJnA90CZERw+X2D3tutA2EkSOd0UluHIHlra0h7k6IeCWQgYM/lqUCxjUYuAN7yL7Sm92W/8D2J8JK3F6MzHhM7boOI38mSLuwKMyeDOl+WZ8fox5er8qFwShJMr7bT8W7y5Y0mY2c5bD7nighcGEilCpZpJNrOaTF1PJFPVSBijT9Ka2TcBKNPje8xC3vgxVIvZBXuPEOMClDVpCqKiG4A1rhP2yfvULZigBoLBJMD3kPtbDLZhC23J0T6gPTY1vj/RYEcxZYAXdaTRPrA1WCyVgcA2+sJUM2He4VNoEFr4ZAbWZsdKbXjMIgIR4gdDR+xafwwZC9Vmyi/32QDzJD2ycKnLLeI8JLiZjq0zv4Y98XgWizxCJGAhyhQ0KAeLGgEbq/9uZ6wvXEYEIDM5gW5vx8uZjHZDzg/j5N6roGA4tK4REII80jl1JtEobjCw4C6vjhggKA32dETD3bKQf5zCOhoLURKhkOR/n6GztdfBX/aba4G9n2Fyd8oJ5mU0GDm6+VDb4SP63wlb1jdCrs/Wq+d9Tq0ksIppJJlcBgO+iv26eIFidMB8e/5g6SzPe+g/IB603c3yxvJ0y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199018)(31686004)(2616005)(2906002)(86362001)(31696002)(36756003)(66476007)(41300700001)(44832011)(5660300002)(66946007)(66556008)(38100700002)(8676002)(6486002)(478600001)(6512007)(54906003)(4326008)(186003)(4744005)(8936002)(53546011)(6506007)(26005)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpNcWVydHd4TWNIWHVXQUlLeEJaT1dVSFcva1QrUWJSU2xZV0sxWW5Bbm4z?=
 =?utf-8?B?K0tEK3dzMnpOaUQzaWx4MGdXMWpnbjV0ZGxPcXJ6dHFsMEx3d2J0ZWpJV0gy?=
 =?utf-8?B?NTZmK2c4UjRBaGllZGVIL0FGWTd3VlJta25rb05vOXVycWkzVVduRjJwVEtS?=
 =?utf-8?B?c3JVdng5SXI3dkxIelE5ZlVKdTBMYXRKaVlLR044UklOK2xPOXIyOXl2V3py?=
 =?utf-8?B?UWhnT0ZZaUl6VjFnSWJoTmZMTVJwQkdGUzl2djN3bU82bkY5L2lNRFRWVisy?=
 =?utf-8?B?bC9TUXZqUHMvbnlkdERjVmUwSHFHWnRhQUdqNnlrVTNLWkJpTEprNzBQMmEw?=
 =?utf-8?B?YzNSYkxzQVYzTWJYVTgwQWR6N0x0QXBQUjRxVE9xNWtuV3RrQjQ2TlpVNk4x?=
 =?utf-8?B?a2lrRnpleWJZUVAwR1hodnhDUUxLdVNwWFlxdU52TDJMN1pVOHVWalJ4UjB4?=
 =?utf-8?B?VjJPUTVGUm1ISXZyU2pNZ09KZ0hoajQ5c0ZjYVhKUlo4eUhrWk83WnBmUE8v?=
 =?utf-8?B?Y25Cb0o2VEtwaHp3L0QzZTlaRzg5S2RjK1BiUkZjZzNWYkMvd2ExcXFsdTFH?=
 =?utf-8?B?cGw0Ny9vMzllMGhJa2xMbmlHcDlDK3BLbTdhdUdIMkRwcis1YnhDd1YxNWRr?=
 =?utf-8?B?L1BGQ2RuK1IvaFJSUHZRTDFDQXQzQTVYUjRyVTVGR1dsN2NtSEhiYS85QzI4?=
 =?utf-8?B?VDdMWVJTYWpWQk05eWtScC9aRUQyM3FOclJQaTZzRWYxb0RsQmxKdlFMYzcz?=
 =?utf-8?B?SVNib2h5UXVKQzFXT1RmQWwvZ0NkNjU2U2h0bm1ENElDeEM5cTRVL3l3d3Rr?=
 =?utf-8?B?ajJqUkJ6dTRseW94QnVWTUtKMnBaRlF2MUE5Z1pwTWtWSWplT3hWQVVCaXd3?=
 =?utf-8?B?M2xXbFNwOXFER1pxYVpEakVsYUpGV2d3d2k5SGVlNDk1SEFyOW12K3RyZ1Rn?=
 =?utf-8?B?Z1BXbkEyVTRTU3JZRkVGam5qQ0lQWnorNmczNVdOeVpUYXcyYUNSS3NUcXlo?=
 =?utf-8?B?dDdlSDd3UEZLUUlyRFM3R2NUOHYvenAwYlNYbi9EMWV5c0dvM2pkdi9DSldI?=
 =?utf-8?B?OXBwRUx2R2JIeDh0a1luRUFoRjVqVjJyZ3RtM2UxTGFVR0tDaEsvTXlRYTRu?=
 =?utf-8?B?Q2FtMnV4WDE2UmpYb09LZmQ5QkRKRHYrdUJGSU5xNElsRXhvTGpqb1MxVVFH?=
 =?utf-8?B?UVpBeXdSOEFNamdLcnYwbGd0c0ptNyt0OVQyUzZ5UlhUaE9NMEY3RGJ1N0VO?=
 =?utf-8?B?TXUvbThDc2RlKytKL3FLU2ZSQ0NqSndQbjBpTUJNMVR4MXpCbVk5SHRmMVEz?=
 =?utf-8?B?alV0Q1Y5dE1DZUIxeXFzS3gzM1hET3FoM0R3bHNzUWxkV2pwYmE3ektZV0hY?=
 =?utf-8?B?WnJXNmJuVlZXMUlpUitLYUtlVW9iOFZuVGN4bGY4WW1BNmdJR1ZUR05teGZJ?=
 =?utf-8?B?TmppN1VNSmlpcysrd2dvK0xEUnJCR2VCTGdDSUNNaW1oOGdlYXA2akh6UGNN?=
 =?utf-8?B?ODRhRmplSDFJWm52V01vVUR6KysrcWNrczBibG45ekxqR2JNaVVBd05RTkJC?=
 =?utf-8?B?ZEJCMjVxYXdGTWNRTGZZdmFMcklDMEpuSHJZbkpQV3ZuUTI4UFU1ajQ4M2NY?=
 =?utf-8?B?UVhqNjJ0WnNtZ2M0bk5LMmRIMldqak1pYldwQ3d5cFllSWdnS25tdEJtYUU3?=
 =?utf-8?B?bHdIWTRRZG5NR1lVOGpxekRuTWxQQ1BObkxkNDlTWXJJckw0YmM2ZTBiUmhS?=
 =?utf-8?B?VkZudVhzNG41L1FDVXpJTlNnVXRNb2l5b1J2dnNyblBub0FWUSsxSm1VSm15?=
 =?utf-8?B?Vi9adzlmclZoV3cxbkNvNjdLbVE3MjZlaEJtRkpqZGFxL21lMmNvaDVMSW9Y?=
 =?utf-8?B?SGlRQmhla3pOMnpZTEJ5cEtYd2IvaDVsMW9sb3lBLzRMRHUyT0Vya0lRRm04?=
 =?utf-8?B?djJ3alNmSzQvcEFIUzQvMGhLS21NRHVBYWx4azZ6RW95a0hUM0JRTFBGRFVR?=
 =?utf-8?B?cEo5QXRROWpYb09QRERaVlRsd2p6cDEyc2JwRWhqb056Z25uMUVjZlJadVRj?=
 =?utf-8?B?WFdZNk5nRmEyYWZWZWpMZVc4NVFvdnpvMklNa3M0S3lLZmtDaU1LQlgzWCtu?=
 =?utf-8?Q?HK70zeaLRQNZCbZIsRkn+wXBR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e50b3eb-1a1c-4c1a-3076-08db10000be4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 09:27:39.1417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBOw452thXWLlF98NbBGe7mj3UMlAQc1XZFEP7q1aCitWKDjKb1OSQfrRZkuxm6lmCNCkt4b/kr0orv6G1KC8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
Received-SPF: softfail client-ip=2a01:111:f400:7eab::614;
 envelope-from=francisco.iglesias@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 09:29:51 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2023-02-16 10:23, Philippe Mathieu-Daudé wrote:
> Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
> a QEMU configured using --without-default-devices, we get:
> 
>    $ qemu-system-aarch64 -M xlnx-zcu102
>    qemu-system-aarch64: missing object type 'usb_dwc3'
>    Abort trap: 6
> 
> Fix by adding the missing Kconfig dependency.
> 
> Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..b5aed4aff5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
>       select XLNX_CSU_DMA
>       select XLNX_ZYNQMP
>       select XLNX_ZDMA
> +    select USB_DWC3
>   
>   config XLNX_VERSAL
>       bool

