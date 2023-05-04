Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6716F645A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRSG-0005us-IC; Thu, 04 May 2023 01:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1puRS6-0005uD-Il
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:24:27 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1puRS0-0008Tr-E3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:24:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMQsMuDrio35Cu7rRISbivUN3HAtdv3tbqU4IYFjEQl10CDqJFouVSzivWoCN9aC9xtaWn5vHK4jBK4iHkbSIKSbS+kbTL8wpWGwSQlL+UWNRTeiw8V+CSbzJhjwrz7HqOrzzS/ewRlwJ5Tjqo9cGy7w3yKLzkU83USsn3bt2L/lg1KJpbb8hlRaVfIeNQRgfC8BX0OuCR7Ooj5lZZM0d9khcRqkQJG9V6WFNcT80kpIb2ZQyK0xBot6oAN/F9oP0ujaY2p0HEhwiGZpPnoL2O3xKzP91/SOGS9/WVmp/z+NesFZQw1dyhlqD5B3fJTgQazehamp0jG831u6E5v8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDXSQ5oV29XHKOM8Bm2EB2LTOGbnwUyOLCnoYzDxRv4=;
 b=MWTMSMc8GaRsqRkHP53mrci/B5R1LuPjiMQonrLwC4QM425CEdedH4NmSrNGyoq3Yzxt0jKwcZu0WTzaPBrhJQoB+EzzO9jnHsMswm/J4khXyOxgHSax29buj459Rk+x+xMkB7p8WFSYd5Iai6CLI8mUJpRzAatwu62MxGBx/RzkPOW5pIWfRugg7whCzVW256X72S93SQ5gMFPkDZjnFC9BKV/opAo5zEu5SuN6SYEotvu8w/7Ku33Wv8/7gAYRzHJEzNtTXRXK5w0BG1gwt6SiJS9mOHvZAR+1jENAhqiUSvBIGN2buYJ/NQzQbHe5Kr2tpi+7/XoSbIt08miN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDXSQ5oV29XHKOM8Bm2EB2LTOGbnwUyOLCnoYzDxRv4=;
 b=ho10jx+iCbloEIX5bVr1NpyxvXrS/D7Ym2oc0U4o6TTkw/6eeDW+w3IC/DV5O529l8G1OSexsa3DainiS9xcBtblYKI5dn4AlVks6kvR4Sj/q/2LwC6VnB17THO3918TrUfUi2K8sHuu1TN/Ewu8pBYqrlKLupaWfieC7OmCaD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.29; Thu, 4 May
 2023 05:19:13 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f32a:31f7:2579:879b]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f32a:31f7:2579:879b%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:19:13 +0000
Message-ID: <1f6b3666-fc7e-083a-50fb-b2e91ac2c012@amd.com>
Date: Wed, 3 May 2023 22:18:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL v3 0/10] xenpvh3-tag
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
 <a01d5ddf-b6b3-7fc7-daef-44debf48ca77@linaro.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <a01d5ddf-b6b3-7fc7-daef-44debf48ca77@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf481ae-f9e6-41e6-8b73-08db4c5f1915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fFI2GZZYaA+pQUzXpi560HfJebh7uqH76mZKb1Yn7YMdHW5tGhnD6g46+X7HjRWJoYQL87BlMWdhn6LBT1hFJqXzoAUXLMkrq8QVQH0+VJvzt4qHmkrA9zbQiOqNFN3OHLYa7xCiHorT5nX4NYiJUymAArKBW1IVgMqw29Z/rZROKSS9Fy3CAHxc2GpOaA/sBDAbBDPk1SN9f+/WPeNXPuz+FQ2Gz/4tbTayB1LYyao5O05LTIsC8K2kiVQ7X4uCDZTSOK/Q0GUrYL5vN1pqbeBvHbEySE1kTP/X2M8C8NbqvSuFMqQNQiz4/kQgNYypX5cs+bv0BiACtDlqYBqRiUwIU+qdUCsmxveSgZJyYMzIjPGObLM6D9BxlzXO2zqcOECoQqjbgGB8yRoezzFQ6emQtufcIa1KWXhtnNsp2vdvQHXc+zrgmdumo/Uj25oErutZ96VGsI+zZ6tQujtpFPgE69QGj+QJj6BlQKg9JCLipCe3Qg/JRflRN7/UeW0CaQzW5LLb4xIza9WDryKWSVnKPll7MpCBHkprEYfuMUajGQcK/qVhV2mqt/6TWJXD1T2hbQAyoA7R6D0AWxTiN9BM5V1HIKfy0ifM0y1sUqjzCCS+HLH5hf25fMjsQekAiq0aoShW4mgE9scBloXaVYeQE5+ZyITByx+BtitxDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(66946007)(66476007)(38100700002)(36756003)(110136005)(66556008)(4326008)(316002)(966005)(6666004)(6486002)(8936002)(478600001)(8676002)(41300700001)(2906002)(44832011)(5660300002)(26005)(53546011)(86362001)(2616005)(186003)(6506007)(6512007)(83380400001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pRTFF1MFZMcUVOeFVlYzcwMWxucm1SaVo5RzR5bTFYZjRWRkQrRVo5RE43?=
 =?utf-8?B?cHlDd3R2a0c3TWVFZ1VaTUh2ZTM4bm54UDVEV1d1OHdCT0VLemFLS0NHRGdV?=
 =?utf-8?B?bEE4MXlZS3Z3NjJycXRLMTFjNlAwcUpZQTdxV3ZmUUk0VnVDbVNLeWU1VnpP?=
 =?utf-8?B?RllDNnFWZkExNkdVR2VLTjVONXJ6OWRZaUI1TllSUFZ5SnRDNFJ1KzQ1TlBL?=
 =?utf-8?B?NUd1VXI3TCtISWpnN0RPYndYbE5sY2QzQzFOM2ZjaFlhSXJoZDRtZHNqYjVk?=
 =?utf-8?B?dTBORFZNNCtFK0xlVDgwVC9GZmRMWG14bXpvcjRpMWhxNXhIdHI3dFJtRUdJ?=
 =?utf-8?B?dUQ3T3d0Y2xmUVhvVnZaMjdLd2tiVlZKd0l6MDZzLzVSWk5obG01eHdVNVZz?=
 =?utf-8?B?WkR5azl5Z2IxVGpSQyszVEp2UlJsQmJ2YXAwbjFsNktPZDNHNXlIV2ZkN0xm?=
 =?utf-8?B?RU1YTlFPZ1RFbjJicjRkZEYzT2FVbWRWbEZON0xkQVRXa2lEWFNqK00wYklF?=
 =?utf-8?B?ckR4UjJNRFNQa0NOQnQ4bUY3SVdxakJ3NzRtZ09ZMW1QWmM0QlJ5c01iQ2RP?=
 =?utf-8?B?SU9GU0V4YUhxUHB1ZFNHQ1o4dk5EUEVPWnViYWEvajdnREdVdC9yTmlMdlNK?=
 =?utf-8?B?QVFnbTd3dmpET0VMN0Nybno5MCtZY0F4T29XNTZPbUxNS1huMUR2K0t4Z2F6?=
 =?utf-8?B?ekd2eEE1c0tEbW1mZ2lDL2FtYi9uS1Z3dnBWRlgzWWtKaUlGNUZQVERhcWZI?=
 =?utf-8?B?OUZ4Wjg3ZDFxN0NJTUU3b3YvKzdFbGNmcldTTW1PRFlyWXRwUi9tM25JWW14?=
 =?utf-8?B?Q0ZibzNPQ2pjZGJuSEJTK3FSMjNmS0tzTmtUS0YwUm81Q05JeGxjckRKbFNB?=
 =?utf-8?B?WUxXb2dTRE0xNmZjQ1Y1TFR5c0FQbzhnRHR3VWc2TkpGSk5QU1VCVUFFTHRq?=
 =?utf-8?B?Ky9vK1d1dzBaMjNKalF6QVZmOTU4THc4eG9ZczZlMkIxKzM3ZW5TMnZPeFBv?=
 =?utf-8?B?MzJsVldrZWo3S0c3dEFxOUtPcU1BdDMwWlpNZXVENE1aZXhQS1BrTDBIbjQ4?=
 =?utf-8?B?RTRNSnNHcXRjSUhRUkY5b1Nmd3F4dmsxVUJHOW51b1N2M2hic2gxczJ1QTU5?=
 =?utf-8?B?N1REdDRnR1FFQW9CMGU3QXl1SjRsQng0Qm5yU0FoTS9VcUl0VUJzd1RiSTR4?=
 =?utf-8?B?cGpqMWtUc1BDZVo3c29HWmpJa2NReTZRTTlLdnZueTU0NWtiT05ueFlyT3Uw?=
 =?utf-8?B?aTVnYnVGSnRITmMvQXBKdkFseHhud3QzMmpzWm5PNmc1MEZWUXpIZ0NYWGQv?=
 =?utf-8?B?aEhaTFQ0WS9KRUtocXJSb0tLeGN1V2NhejJyaHRuOG5qNmNpUDlOUGNxWTNM?=
 =?utf-8?B?bFpjWXc0MnVCUlFRWFBiakhkQUdQZVdweUVqZUlxN1BlSFB5YTVsQStCTUxH?=
 =?utf-8?B?cjEwYk5tZzFCZVB3VzZjWVVrWXlkeWpvUnM3b1krck5mU3dNWnhuL1BiZGZV?=
 =?utf-8?B?VEExaHdjdFNGTnkyVWl3dlh1OWZuZ0hCVlVvWVh2dnFpQ2plNUEzaGMxQUtm?=
 =?utf-8?B?NytVaWVrUWlMajBzeVFHUU1zN0RoVWJWVmlZbCtCYkQwZjdDclkxQlBqZHZ3?=
 =?utf-8?B?TFk1RHp3UVoxYVNkYTFaenZnTm45Tm5mOVJ0MW93RWg1TXRPU2NIWGxramlY?=
 =?utf-8?B?TjV5LytqelQvNWlJSFhXb0MxWWFkbGkyR0o1d0tweVJXMTRyRjluNGlVckJM?=
 =?utf-8?B?VWNWN1NXQ0pOMTVlclkyQ1hIVndiYmNhZU1kT0UrMGgzY3o5NTRPQUp3RlBM?=
 =?utf-8?B?blBodmJpTzQ3Y2JqbUNDUDZFTUY4VllKc3dnSEJqQmJ6dzN3ZTJqQnZuaG4w?=
 =?utf-8?B?NTFOWFdlYjFDcldpU2VIZFZ1TTk1K3o3Rkh1UzZCbmZ3SEhiRE4yRm5jSnR2?=
 =?utf-8?B?YkhldktWVWNLVjRWUXFiSzJGWFZ5RnRLNGcrZlJLdDd6RDhNSlBvaExrYisy?=
 =?utf-8?B?dlJSMWR3Vmk0VzFrK3Vseml1c3lPbXBtdjhIK1oxd3h5MGVuSS9kZmtNU3hI?=
 =?utf-8?B?eEVSUEFUbVNwV1ZqQnhUMU1naHhvVUVJMXpCQjIxYklCYkQrdTBoNjVPVUV0?=
 =?utf-8?Q?zRoA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf481ae-f9e6-41e6-8b73-08db4c5f1915
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 05:19:13.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PviIEaCa3CoaWBjM3ZlG0X19dumprmv+0LwgLCs+sfLcxWFPVGbo+DIxSpcNPLrdUrZB8fJlKDsLM4iXDYWW1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Richard,

On 5/3/23 12:47 AM, Richard Henderson wrote:
> On 5/3/23 01:12, Stefano Stabellini wrote:
>> Hi Peter,
>>
>> Vikram fixed the gitlab test problem, so now all the tests should
>> succeed. There were no changes to the QEMU code. I am resending the pull
>> request (I rebased it on staging, no conflicts.)
>>
>> For reference this was the previous pull request:
>> https://marc.info/?l=qemu-devel&m=167641819725964
>>
>> Cheers,
>>
>> Stefano
>>
>>
>> The following changes since commit 
>> 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:
>>
>>    Merge tag 'pull-tcg-20230502-2' of https://gitlab.com/rth7680/qemu 
>> into staging (2023-05-02 21:18:45 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/sstabellini/qemu xenpvh3-tag
>>
>> for you to fetch changes up to bc618c54318cbc2fcb9decf9d4c193cc336a0dbc:
>>
>>    meson.build: enable xenpv machine build for ARM (2023-05-02 
>> 17:04:54 -0700)
>>
>> ----------------------------------------------------------------
>> Stefano Stabellini (5):
>>        hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
>>        xen-hvm: reorganize xen-hvm and move common function to 
>> xen-hvm-common
>>        include/hw/xen/xen_common: return error from 
>> xen_create_ioreq_server
>>        hw/xen/xen-hvm-common: skip ioreq creation on ioreq 
>> registration failure
>>        meson.build: do not set have_xen_pci_passthrough for aarch64 
>> targets
>>
>> Vikram Garhwal (5):
>>        hw/i386/xen/: move xen-mapcache.c to hw/xen/
>>        hw/i386/xen: rearrange xen_hvm_init_pc
>>        hw/xen/xen-hvm-common: Use g_new and error_report
>>        hw/arm: introduce xenpvh machine
>>        meson.build: enable xenpv machine build for ARM
>
> Errors in CI:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4216392008#L2381
>
> ../hw/i386/xen/xen-hvm.c:303:9: error: implicit declaration of 
> function 'error_report' is invalid in C99 
> [-Werror,-Wimplicit-function-declaration]
>         error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
Thanks for notifying this. I am not sure why this particular build is 
failing. error_report() is defined in "|qemu/error-report.h" and the 
header should be included as |||it builds fine for other configs.
|Also, the same tsan-build passed when we sent the PULL for v2.

||||I am not sure why it's failing for this config. W||ill try to fix 
this. Meanwhile, any hints on how to fix/debug this?

Regards,
Vikram
|
> ^
>
>
> r~


