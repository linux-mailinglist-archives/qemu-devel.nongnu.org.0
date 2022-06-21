Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2B552FF4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:41:26 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bK1-0000xK-KR
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1o3bI7-0000Cd-IE
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:39:27 -0400
Received: from mail-dm6nam04on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::62a]:30177
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.Gupta@amd.com>)
 id 1o3bI4-0007Pi-Mi
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:39:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqU4tARgm0tTdFyPkpMhk5dMm656uRk4H5adz8ZOtP7IXLgJUuoSRmQuzdtE/cjrKSbQJj5PBgA01yfbU/9pwut9oSBZNr7IKJzLPhzK5US/EmSgNajpVwAkUZRlIVGMKUxULWmEuaWfvA6uIe6F7GULIwzy66U5CK8PNCLPzHuCeRJfJBxvycIOyCt4ww7pST5Jlrm2TG8hfrkBy0lI6Ci5697pne+QlcOMfwjxsClsOZDSk3Pbz/7mitWMxubVjFdv7zXZDy/P4Qo945+KyUIf/XYMo+dMOSfIzQRri1d1i8ZrDDTDUAKUjeDXVmdU9bIxOV5qkQO6LIjwI1QhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fvXeET9g26NcmA0u7pmovdQWaQtJjMpM1o+BVEFOyI=;
 b=Rq823qxBAMxwyMCto6sBkPGUdfmNbQB1Yg3UT/SvgI7idCgPThiKJ8wV57jUfBYT1tbrMwo281lVdbyIyq+sgF1cyqWdgtVTAuWlef5pKbQ3Hre0JZbViAAUgpMo8jGOeg6YpwaxOvnDeiFNnM14rupJrb+a1GMushYpJ+pI75d/jpQ8FgPl0Fx+v+OpRNnytyRPycz4HPR7VLsxLIipiucFgwuELqFFlZo7ZzI43Sm6toTjJTV7jOf4amE2WrRIh76MRKH0FV4NzDEZEAFyuHz/y/VyQ6sPzvJDEmkHs+CrU+YLsTXk4T6FXCPc5a6fRJjXgQXqcUnYhrPiHJoL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fvXeET9g26NcmA0u7pmovdQWaQtJjMpM1o+BVEFOyI=;
 b=wFBPe+cjQNHcnrztW4drdhhEZ5ZKd/nYbvHHy8mNuJfwY9uBbMKZfkyOGz0+CcY6my+ChWSH6hFONZ0K02Qxjo4YPWuRR7B0NJk6mB3QxJKF1aelcqxTNBT4ijKbri9tQxeSFgnk7canzmcvFuMpxwa2hbymLM2QK/4swWdV0iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by BY5PR12MB5541.namprd12.prod.outlook.com
 (2603:10b6:a03:1c6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Tue, 21 Jun
 2022 10:34:18 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::1001:3c79:9504:8d6a%10]) with mapi id 15.20.5353.022; Tue, 21 Jun
 2022 10:34:16 +0000
Message-ID: <5d6b2bdb-dc17-2985-c723-9449b40c26f2@amd.com>
Date: Tue, 21 Jun 2022 12:34:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/i386: Add unaccepted memory configuration
Content-Language: en-US
To: Dionna Glaze <dionnaglaze@google.com>, qemu-devel@nongnu.org
Cc: Xu@google.com, Min M <min.m.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Thomas Lendacky
 <Thomas.Lendacky@amd.com>, Gerd Hoffman <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220620223300.1555849-1-dionnaglaze@google.com>
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <20220620223300.1555849-1-dionnaglaze@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0071.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::48) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc7d19b-334c-44fc-eb2a-08da5371973b
X-MS-TrafficTypeDiagnostic: BY5PR12MB5541:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB55418A9904E722A0224836449BB39@BY5PR12MB5541.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6HyMFt7pfPXwwFhZYQ4DQXGZqX9H9raQ6T9ecvJmMrXQJsoGABgGKvTwVrzrE7EXVIIf9oABIG1hf/Xp19HRa9XUVOUPkA59XDtrXbd6GvHh4x1TUffLIKeMaYQHx9VCitQfYG4NFM6RLMShOatoKUiYUfNGQuCyYeBG0qXBprGVl5hUV4NYQXzfJhFC8CwkjZvF2EiCbfxI0/fr29G0BgPYzcejd8TtQcJQ7EGjhZba3KFch9boD92eI5HbVeyHz9+san0a+CkQ4PwusxgWLt2Ybwzltc7hX6vDVgHS9g8+jSxkHj99XE+K155ECO4x7Xvk7kJfo34FWMFsdh2t6gKMkmDloA+oUbsgRXd5s2zh+Ti9NVf1+kW9mRzbPCsKz6DZSxUDuKzGj/rECK193mRFh4WoKtShdWUFFiWssLUfaT8yo3fyyo6TusvN9uvlKArGoCyfqFb7DEEBefDLreAS7t1UWHg36ondnhGYjKFndOmzE+NrqMk8mwc9soQJZCqLOjVDV0GY5Yam6IlYXXe/CLMYoNUbh7k8QNGzdX8t5gPyMozyiCK2viMw4hkg9d/UvxOhsG2mGXt5WdNGDeHzzMMNJXiq7ewADvn+rxkf/hezlbuqw0MRrEs/RQ0wJKyWGhHuodajDjKafxBvReCFgO2VvqGLl2KKfVdJEO+80H28Hw8kSbhcJ0RXZQJ1j0tYnSnjgPgK0c/t5P56BPJIQyln0jSxwcvHchkGpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(31696002)(86362001)(478600001)(8936002)(5660300002)(38100700002)(6486002)(7416002)(2906002)(316002)(186003)(66556008)(36756003)(66476007)(54906003)(8676002)(66946007)(4326008)(41300700001)(83380400001)(6506007)(2616005)(6666004)(6512007)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGJGTk9HWWpQSGZDTHNOQnUxUHF4bXVPblZsVGJkQU1ZQWVlNVdUV3o4aks3?=
 =?utf-8?B?bzVob2NPckdDcStGaVgzTnAzRXFvNWhuTkZBSG9CKzBNMU0zNFJlMUZEaFIz?=
 =?utf-8?B?MlZlRkdrQlh3L0o5a2xRUm5UUkw2MmlFWVJRSGlvRy9mQTJ6Q3V3dldhMFQ4?=
 =?utf-8?B?MGdQeFZPam84elRKNlVLdnJWNFNpc3NsY1M1WnB4eGxNY0QzL0N1RkZVZ0ti?=
 =?utf-8?B?dEhzNUlPMW1TOXdFa2lYcU9CNU84MllFS2QzOElGZW1yR3VMV3hRdEZOVnFu?=
 =?utf-8?B?SXh2UmZYd055dEZLVW5VYVB0SFg5a2U1eGszaW1VSE1NUVp0RG1HMDlPOThs?=
 =?utf-8?B?S09kMjFxWDBUZ2VNQnJ4NEhEZjRDR1loOEpQSmR5WmlEd0xyMlpoSVVmVmxu?=
 =?utf-8?B?K1g2Sk5OQ01hUzArWjRmL3dqdTJSTHhTU2RYNGFsNHEyVmpBclFoZ0NtTFpG?=
 =?utf-8?B?Tml4Q1Z5TmdJdGlZNk9NS1FUeWx3RE1kNEpDZjNoZ25RVFVQUmNOOTFRZm01?=
 =?utf-8?B?RmFqWWc0aVVOMlpkOFFRcFF0blZWbml2bldUbXFVTjR6Q0dGMEtLWkRlV2pJ?=
 =?utf-8?B?TWtQcHF0empVRExCQkxhNFF6TjlJSnBlaXZjUmlESWRVeUJRVW1kRk80SlpL?=
 =?utf-8?B?TEhKdDhFU1NHditFMWZ6MnVxeTlWc2FtYXg1NjBybFZZamVOZjhMcE1WdVFo?=
 =?utf-8?B?QVpYYXBQWG5BV0tCSUp1aE5hZVlpcm11MVdtSFRFL3pyRW9zOHYwbmFLSExY?=
 =?utf-8?B?RU55WWM4YWo2K3FUbFZkZHNXMUFzY2xObTl5c0ZWRkRWbzNaMHJUQm53aHdG?=
 =?utf-8?B?MGJDSkdjUHhKVmFka1k3ZjFxMnZaT2JlQ211Tk1lVXBVRVpObjhuL2JVSjJp?=
 =?utf-8?B?ek9obHhFNnE0UWVSWEZMbTZwWm1FWGhnRXJyYUtrSUlJclBJWS82VnN3UUFR?=
 =?utf-8?B?aitvQlBpQk5SMjVkbU4rL0c0ZUpwRGtyOTNMbElSMVk1TXJYak1BRCtRcTYz?=
 =?utf-8?B?bHd2NDR5TGh6c05STUMvOHBnOE5MWit4VFc5YlhiYXJrR203cUZWL3M1V0p2?=
 =?utf-8?B?SklpajE4NEdqNFR4cEc1OEJTbUVhRjQ3SmlDV3lhREhGYkl1aUZDSU50Qk9P?=
 =?utf-8?B?ZlMrcEYxdTEzTUZSTnk3eEhuR2JjRzRYVkcwUy9ib0Z2cGpteTZFQ0F1ZUdR?=
 =?utf-8?B?Q0kyV1VuUVkvcDJsZEs1YyttNHRNdzVVY0hKZUdGZ3lNWDFHNnRJZUNLL2p4?=
 =?utf-8?B?TnhmeHQxMjNiZzZONUlySzYrWHhTQUhxekpUOG51bG50SHVycTl6bGJaalJM?=
 =?utf-8?B?dXAyNFk0eDRoNnhjdjJDNkc0dXdpR0dKUFpNQ3Vyd1Qxam9TbGJ0T2RFM1RJ?=
 =?utf-8?B?MlpiWDJCSUo1WjlxYVNwYVNKZlF2N25WZm9na1lXNllXUHpHbUc2S0lzb0Fn?=
 =?utf-8?B?VFNEWHBNaFRTVDZDNTJubnZQNzlMeWF2ZkRyQk9xdllXeFhRVFhITDRyeW5S?=
 =?utf-8?B?SlpDRGx0MFVhcnFDSWJjd01kYmFuTjNZUzk4NkozYkNMekdoU0NtZXZjZVNl?=
 =?utf-8?B?bDFUN0JmV01tU1lkMWpwRnZLQ2lHK09uRUJPYTdoc3Ivakg3VjhzZ1BVaEgy?=
 =?utf-8?B?dHorcjFveTJ1b3lFQnJIOUxyNFBMM3JCRHZYQ1pkNHdYeTBtQi9FSzVFK2xx?=
 =?utf-8?B?a2V5dWRxTWhFZWE3Sm9xRjRsK2ZTNEJRWjlPS1kydjYzY3dQb1FvR3JYbTE2?=
 =?utf-8?B?dG9aNFlHQ2lRM2dLUEx3Wnl3aFF4eXlwRStCeWJDSzZ4aVJTM0c4ZSs4Z1hK?=
 =?utf-8?B?cjdlOGV0TkFlN0UwV3owTU1YWW0wWWpkdjFyaTRuazNPZFUyT0w0d25kM0pD?=
 =?utf-8?B?Sk9vNVQ0V2oyTlBFTkJVQU5Ib2d5bjQ4TVMwdHJQNUJ0c1c2aHJHSG5FRHA5?=
 =?utf-8?B?SUsvRnp4Qk4reVBhREQ4NmNwbk9QUDRLMmdLaEhLM3hGR2JQSjZLckxadGUr?=
 =?utf-8?B?TzRHK2N1bDBybTRFMFhpc1IzZGM0RXVDMjB5SEFCZ2kwMmdlZE1KTGxqV1hN?=
 =?utf-8?B?Tmt3MDV3V21iajJPcDA4QlZWTUcweXdZRkVxR043RlRoaE1JSGlBVkFuNFJk?=
 =?utf-8?B?NzkyTmdySmxGTXdYVGRMRVZzbTlNN3FpTDdsUllWT0d4QmxzanAyQkZUMHYz?=
 =?utf-8?B?cEhnSWhtQVl2dHFDQVo3NHBDSDFxbjMvVVhHYWFBd1RMUHIvOWxucCtBcUpk?=
 =?utf-8?B?c1psR3EyNkRMYk45aU0xTGVaT1VFY3kzdzVMYW1LRnBFbks0bDU0RUN6Nkgr?=
 =?utf-8?B?Y1ZUNkZEbmNtRkpEVlh1d3BCOU9ndUZIb2NrN0MwSFlSQ0VjV3FmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc7d19b-334c-44fc-eb2a-08da5371973b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 10:34:16.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFRtU2DOnkAv6Mk3vmtuC0mgC+D1J3wXpqsNxtWBGRLGMj9rIAcoEp3GEZuvGzdXG8qeQPhVDKYBwDvHCbHCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5541
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::62a;
 envelope-from=Pankaj.Gupta@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


> For SEV-SNP, an OS is "SEV-SNP capable" without supporting this UEFI
> v2.9 memory type. In order for OVMF to be able to avoid pre-validating
> potentially hundreds of gibibytes of data before booting, it needs to
> know if the guest OS can support its use of the new type of memory in
> the memory map >
> Cc: Xu, Min M <min.m.xu@intel.com>
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> ---
>   hw/core/machine.c   | 33 +++++++++++++++++++++++++++++++++
>   hw/i386/fw_cfg.c    |  5 +++++
>   include/hw/boards.h |  1 +
>   3 files changed, 39 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c53548d0b1..d2b9513951 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -263,6 +263,15 @@ GlobalProperty hw_compat_2_1[] = {
>   };
>   const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
>   
> +static QEnumLookup memory_acceptance_lookup = {
> +    .array = (const char *const[]) {
> +        "default",
> +        "true",
> +        "false",
> +    },
> +    .size = 3,
> +};
> +
>   MachineState *current_machine;
>   
>   static char *machine_get_kernel(Object *obj, Error **errp)
> @@ -502,6 +511,20 @@ static void machine_check_confidential_guest_support(const Object *obj,
>        */
>   }
>   
> +static int machine_get_accept_all_memory(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->accept_all_memory;
> +}
> +
> +static void machine_set_accept_all_memory(Object *obj, int value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->accept_all_memory = value;
> +}
> +
>   static bool machine_get_nvdimm(Object *obj, Error **errp)
>   {
>       MachineState *ms = MACHINE(obj);
> @@ -1022,6 +1045,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
>       object_class_property_set_description(oc, "confidential-guest-support",
>                                             "Set confidential guest scheme to support");
>   
> +    object_class_property_add_enum(oc, "accept-all-memory",
> +                                   "MemoryAcceptance",
> +                                   &memory_acceptance_lookup,
> +        machine_get_accept_all_memory, machine_set_accept_all_memory);
> +    object_class_property_set_description(
> +        oc, "accept-all-memory",
> +        "false: Accept all memory, true: Accept up to 4G and leave the rest unaccepted (UEFI"
> +        " v2.9 memory type), default: default firmware behavior.");

AFAIU 'true' is the behavior you are proposing with your EFI changes?
Saying that what's the difference between 'false' & 'default' wrt EFI
firmware? Just wondering do we need default?

> +
>       /* For compatibility */
>       object_class_property_add_str(oc, "memory-encryption",
>           machine_get_memory_encryption, machine_set_memory_encryption);
> @@ -1072,6 +1104,7 @@ static void machine_initfn(Object *obj)
>       ms->kernel_cmdline = g_strdup("");
>       ms->ram_size = mc->default_ram_size;
>       ms->maxram_size = mc->default_ram_size;
> +    ms->accept_all_memory = 0;
>   
>       if (mc->nvdimm_supported) {
>           Object *obj = OBJECT(ms);
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index a283785a8d..96164994f8 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -131,6 +131,11 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
>                        &e820_reserve, sizeof(e820_reserve));
>       fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
>                       sizeof(struct e820_entry) * e820_get_num_entries());
> +    if (ms->accept_all_memory) { > +        bool accept_all = ms->accept_all_memory == 1> + 
fw_cfg_add_file(fw_cfg, "opt/ovmf/AcceptAllMemory",
> +                        &accept_all, sizeof(accept_all));
> +    }
>   
>       fw_cfg_add_bytes(fw_cfg, FW_CFG_HPET, &hpet_cfg, sizeof(hpet_cfg));
>       /* allocate memory for the NUMA channel: one (64bit) word for the number
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index fa57bac4fb..eaf73498c4 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -362,6 +362,7 @@ struct MachineState {
>       struct NVDIMMState *nvdimms_state;
>       struct CXLState *cxl_devices_state;
>       struct NumaState *numa_state;
> +    int accept_all_memory; >   };
>   
>   #define DEFINE_MACHINE(namestr, machine_initfn) \


