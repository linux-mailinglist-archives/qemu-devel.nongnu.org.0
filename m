Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC843230D8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:35:16 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcWh-0000Kw-V1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lEcSB-0006Ml-F7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:30:36 -0500
Received: from mail-bn7nam10on2077.outbound.protection.outlook.com
 ([40.107.92.77]:54432 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lEcS8-0001Aq-1A
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:30:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj90PnlGZVIPLSkPIzIMDoPqhOuAYRPwpwJBdoD4FIyXL3izi2CkBkprX8pRW48TGvn+vy+buoAZjBBg1rEDj0EC+hDGer9SgQl68tlfwBvBgMIOrv3HlRsw/9sFHGu3NLOgwpG0DheXZ6v7jYjZZLGjmYc39QDwYIT8fEoqEDUbJXGT+Y/RHtghY+zdwhxJ+XaDKQPijNLSuuM+UFM1Jw5JE3llg4OXXJ97fm2/TrtEmRA8DBzOnrWGJxbxFZ4JDeueLVTEUW3uiET6Dz11QrZzP5s69cLeYmnS3m9294nmyrX2Rkp1/mbkVM+WRBC/DnzHWLHOZiZ9fonsSPF/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yhf2bvE3d6W7ksTPZAsPN2B4iQMCm/UGuyLv5YNGiw=;
 b=KVHcIbzRtU+SzPruwjZr5+NQHnXgOZO3udPLifcsW9iZxFjYiOWxO1iAWebpXr6hzM4WioNXxXBeJoZ2obm0bM2Ym9C29e/aCD8KWymVlfzu993290UJYl6mqsb0TQRmSJjxwd1ATozTqJxmwctQ6rieoouMqIt+c/jqKrIpsBCAU780xg/MSAO2QOmu4r01PAARU4HvTN4PtWvvss8sY1NYjGjb5MKNJdm6WOQzPd9Q2SdReLbRWRsHevTmj1GQ66pQ62EgzIwSdEoaU24B0ZHYsCaIPRWuTYjTkVuyCNbsJy2VeyRQQelZw53bkUNCLO5c0PmjALbp5fOPixEeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yhf2bvE3d6W7ksTPZAsPN2B4iQMCm/UGuyLv5YNGiw=;
 b=lsZapt/f5jMj5FxcOB25MbGk7ME4t/JjFHz7zZW8DTnpuS1v0TxrgkvZ9L0CKyeee84XDCyitlYYXlCQG5cAOQ1jVCeA6VBZswo7NASyih7ur4wKX/CqBPP6K0N9zh+z0CPsJDPbw26/WfjkBPm3LZoQ8xhbeqMFbX212bPPp4k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 18:15:26 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Tue, 23 Feb 2021
 18:15:25 +0000
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
Date: Tue, 23 Feb 2021 12:15:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN6PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:805:66::33) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN6PR08CA0020.namprd08.prod.outlook.com (2603:10b6:805:66::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 18:15:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a086526-da1d-4dc5-d563-08d8d826fdf3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4496:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44962E6F20BB118BA1E540D895809@SA0PR12MB4496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9b0/ewNx57CTAESScnpJYweWV/Z/q/M3VNL49bVubKeSEBeVPxB95O7WcgKHJxoTsiGwM1YLsLYY45dsT7Y94pRduXiuj/ax0Og4a2/Rxv3db9eJnvCpxUhhFB51nCqQJGWiFYuu/HcRANe9uvdjK6bORpUOU78doXXhbP8pcLDAb1595ZVC1r4vFIbjovHB2Wr8tB63DdFpmhSJ2a/7OaiSA9p4GcoPvFJNWUDAhL6j4QkTRNcndMRy6kr5FrcNmxAiDcyPDGUA0BELBZA3bRMw2Ti+rS1jG6hyuhzHkYFMxlduXH5VXKxAgOSDSMu47BgumcYGnoUN7SZ9GX2uzpmW3zluXMRg+2ewZ390c8Uu4WtHCDDLk4IFQlFpS7j2FrVUcSodDiuX62C4qE+ZPPCAczYSEgUiBPWWR8sSuzRx3FQf36DNku1sARLUOaj4AoFlJwWFG8UOUotyntS7FOjeEFPkUlGcOSiLgVj8W8nF48Jg2cV9GN49bFfOP99K+8G+4GlQl5tZ7JHG3jyCwVtHQA6L19FA3dtT4QdazfVwXAleWjuh2f8uv4a4SZKI/n73Pqk1ZRcEoaHRieT2tWnYelQMWBicPSmB69w/mk5cJRIXdrPs0Dy6PgC0BDlfpInGF7BNjmWWpysEFez7V4GQd8V0En5XQmyH4/s37ZxHSVygWYXG/yzvZusPqJ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(186003)(31696002)(5660300002)(16526019)(966005)(16576012)(44832011)(478600001)(86362001)(6916009)(53546011)(316002)(66476007)(66556008)(36756003)(8936002)(31686004)(2616005)(66946007)(4326008)(83380400001)(45080400002)(54906003)(2906002)(956004)(8676002)(52116002)(26005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVFCS0xOYWUreDlQM2VrS0lKTU1OZmtOUGtOSTRZUUNqdzJsL1hqOXJCNDRS?=
 =?utf-8?B?N1ZDU1FOUkZKeWF0NUYxalZ3UFRSTUluNXpCUTZjSGFNL1c4RGx4L0d5RUlq?=
 =?utf-8?B?L3E3dVZ1ZmVwZWthaWJtdFZtNnhSaWtQd0hFRlFIb0RkWkZQRkhZZk05NHk5?=
 =?utf-8?B?WC9HT0JtSktxKzVWT3lqUEV6dHErN09iK091eTQ0cit4dHliTHhPNk9sdncz?=
 =?utf-8?B?ODQ2QnhPNFNwYitNeWg3SlZtWjRpK3RXMjJlQWF0ZFRwZ29Yb20rSzdQWlZH?=
 =?utf-8?B?YXJpMldkV2VrMEwrckxIckd2dCsvQ3pkZVlJYnRXY0s1UmE4aCtOdE0vK0Zm?=
 =?utf-8?B?WW5pVy9Yc3pwZW1VQmRBci9XZGNZcExOVkJxY3NleVAzTTVTekM0aEVpbVh4?=
 =?utf-8?B?czFSRnFqVk0zejBYYnc5RmpMa1JWOXUxVnFBaStHd3FoRWJ5K3BKMWc0OVhn?=
 =?utf-8?B?bFMzcjBkY3lEUDh6TXZHQm1LZ0RBaEYxeERzMlA1dzRHRThQYmhzTmEyMmc5?=
 =?utf-8?B?NkFzd1hMYVBFV0FwMGQ2OUVOekhaWFJCWW1VU1l5NVorbElzRTNIeEN0eXVh?=
 =?utf-8?B?eEYvSzNCWlNXcml0M1lGVkNLWm9VMjJ3TUNLM0trUExPcGdJZk5tUEoxZlU1?=
 =?utf-8?B?R1YzK0Y4RzFBR0lwTzJqaUtCQVA5K2ZZYWlMSi92U280UFZsWHk5Si9semUz?=
 =?utf-8?B?aDNNS3VhZEt0WXZzWitQTkx3N0kzZkhMNUdCd2JSRkR0NUk0U25nbm5jS1BM?=
 =?utf-8?B?QVYxazJjWldRbnhpT0tnOE1NT0JlUndpL29JUUMvN1JBU3kzbU80cU42Umk3?=
 =?utf-8?B?M3hmM1dUaTcwZkRPejluTGRZb2NIN0w1ZjZTTkRqanB0eVVVY0VXbkMrWGha?=
 =?utf-8?B?VjFyTTFteHpQTElpdC9TNmFOTUR3S1VoRkExMG9lQk5UUXhlY2F0WUxwblNv?=
 =?utf-8?B?a1hOUVM1d2YvRU9BS2hrR3M2bWxicEpMbGo0MTA2bUx1ajJ0TkQzWHBVcDFu?=
 =?utf-8?B?MkN4M25pM1JyczR6STVtUkJQUVNCdjhQc0ZLaFNCTkx6RVJJeUJWd2hkazdj?=
 =?utf-8?B?YVZsTEV3OFFjY0NLTWxlQW5nWXMzOHVma2J4ZkM1SytzMGZodExNdWFUK3RO?=
 =?utf-8?B?WFRNcUJZS3ZsSTg4SkFsK0diOU03Q1NPWS9wTERCbkFJanRyUFNxVzNpdmJo?=
 =?utf-8?B?bVNrbnhkK1BYRmxSMFR4V2VQRG5GSklDdmFKd0ZqOU1WV1k4ZGxWZDQxSXJs?=
 =?utf-8?B?TWNYeXVaUFlYN09YeFVFUTBJQ3RYVHpNaVZ6K1RxK3RyUWVjaklhOFE1QjZn?=
 =?utf-8?B?U2hMYTBXQTArblNRaDQyUTRsUGVRMnY1VGp4NmpvWHRNZ3FtMVFjK0ZGZ0JX?=
 =?utf-8?B?YnJ4SEVjbjN6bU83Y2pTdVlHb29rVWxuTTRxQmRUeDZ4NFBiYjJqa2lKVzFO?=
 =?utf-8?B?azZvRTdsbVdFTmFLclk5TVBUU3hvaG4xTGFSVGgvZTVwa3dwUkVXWjRzU2c4?=
 =?utf-8?B?aHQxTDVvbWkycERtb1krOEowQWVnRWhSMFVlTzRaVTZ5ekM3VWVVZno0NkxE?=
 =?utf-8?B?bzBPR1cwTG9takJPSyszL09vUjJkWTZPU2x0TGNFVWxJY3RUUjd6djduQVcr?=
 =?utf-8?B?Z0dCTC9qQ0RoempkeFRSTlYxblVYNVFRUDF0NXhadVRGWG1lVHQyY3VoeThS?=
 =?utf-8?B?Rlg4a3NRTVlUTlhoellMa0FlYUI5ZHJQWEFyeTVDUTQ0UEtLd1lTUzBWMm12?=
 =?utf-8?Q?UKktDBKJ9frE+Nn9qAssuxuIhyuG5CchPD+D7BT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a086526-da1d-4dc5-d563-08d8d826fdf3
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 18:15:25.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJHB8cjaNZAcx74lr3NalX5BPm2uIk76REOnuRzWyBCCpNHPRJuWVW3Q7l07YKVp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
Received-SPF: softfail client-ip=40.107.92.77; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pankaj,

On 2/23/21 10:32 AM, Pankaj Gupta wrote:
> Hello Babu,
> 
> Have below doubt about exposed CPU flags between EPYC-Rome & EPYC-Milan family.
> Please see below.
> 
>> Adds the support for AMD 3rd generation processors. The model
>> display for the new processor will be EPYC-Milan.
>>
>> Adds the following new feature bits on top of the feature bits from
>> the first and second generation EPYC models.
>>
>> pcid          : Process context identifiers support
>> ibrs          : Indirect Branch Restricted Speculation
>> ssbd          : Speculative Store Bypass Disable
>> erms          : Enhanced REP MOVSB/STOSB support
>> fsrm          : Fast Short REP MOVSB support
>> invpcid       : Invalidate processor context ID
>> pku           : Protection keys support
>> svme-addr-chk : SVM instructions address check for #GP handling
>>
>> Depends on the following kernel commits:
>> 14c2bf81fcd2 ("KVM: SVM: Fix #GP handling for doubly-nested virtualization")
>> 3b9c723ed7cf ("KVM: SVM: Add support for SVM instruction address check change")
>> 4aa2691dcbd3 ("8ce1c461188799d863398dd2865d KVM: x86: Factor out x86 instruction emulation with decoding")
>> 4407a797e941 ("KVM: SVM: Enable INVPCID feature on AMD")
>> 9715092f8d7e ("KVM: X86: Move handling of INVPCID types to x86")
>> 3f3393b3ce38 ("KVM: X86: Rename and move the function vmx_handle_memory_failure to x86.c")
>> 830bd71f2c06 ("KVM: SVM: Remove set_cr_intercept, clr_cr_intercept and is_cr_intercept")
>> 4c44e8d6c193 ("KVM: SVM: Add new intercept word in vmcb_control_area")
>> c62e2e94b9d4 ("KVM: SVM: Modify 64 bit intercept field to two 32 bit vectors")
>> 9780d51dc2af ("KVM: SVM: Modify intercept_exceptions to generic intercepts")
>> 30abaa88382c ("KVM: SVM: Change intercept_dr to generic intercepts")
>> 03bfeeb988a9 ("KVM: SVM: Change intercept_cr to generic intercepts")
>> c45ad7229d13 ("KVM: SVM: Introduce vmcb_(set_intercept/clr_intercept/_is_intercept)")
>> a90c1ed9f11d ("(pcid) KVM: nSVM: Remove unused field")
>> fa44b82eb831 ("KVM: x86: Move MPK feature detection to common code")
>> 38f3e775e9c2 ("x86/Kconfig: Update config and kernel doc for MPK feature on AMD")
>> 37486135d3a7 ("KVM: x86: Fix pkru save/restore when guest CR4.PKE=0, move it to x86.c")
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: Added svme-addr-chk. Also added all the dependent kernel commits in the log.
>>
>> v1: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F161133338780.27536.17735339269843944966.stgit%40bmoger-ubuntu%2F&amp;data=04%7C01%7Cbabu.moger%40amd.com%7C4cdb8e4513444faf227d08d8d818b23b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637496947884399665%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=DepdBnCEp%2By069GaEmWnhETZ8saVkV9E8cExtzIyVLk%3D&amp;reserved=0
>>
>>  target/i386/cpu.c |  107 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  target/i386/cpu.h |    4 ++
>>  2 files changed, 110 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 9c3d2d60b7..24db7ed892 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>>              "clzero", NULL, "xsaveerptr", NULL,
>>              NULL, NULL, NULL, NULL,
>>              NULL, "wbnoinvd", NULL, NULL,
>> -            "ibpb", NULL, NULL, "amd-stibp",
>> +            "ibpb", NULL, "ibrs", "amd-stibp",
>>              NULL, NULL, NULL, NULL,
>>              NULL, NULL, NULL, NULL,
>>              "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
>> @@ -1798,6 +1798,56 @@ static CPUCaches epyc_rome_cache_info = {
>>      },
>>  };
>>
>> +static CPUCaches epyc_milan_cache_info = {
>> +    .l1d_cache = &(CPUCacheInfo) {
>> +        .type = DATA_CACHE,
>> +        .level = 1,
>> +        .size = 32 * KiB,
>> +        .line_size = 64,
>> +        .associativity = 8,
>> +        .partitions = 1,
>> +        .sets = 64,
>> +        .lines_per_tag = 1,
>> +        .self_init = 1,
>> +        .no_invd_sharing = true,
>> +    },
>> +    .l1i_cache = &(CPUCacheInfo) {
>> +        .type = INSTRUCTION_CACHE,
>> +        .level = 1,
>> +        .size = 32 * KiB,
>> +        .line_size = 64,
>> +        .associativity = 8,
>> +        .partitions = 1,
>> +        .sets = 64,
>> +        .lines_per_tag = 1,
>> +        .self_init = 1,
>> +        .no_invd_sharing = true,
>> +    },
>> +    .l2_cache = &(CPUCacheInfo) {
>> +        .type = UNIFIED_CACHE,
>> +        .level = 2,
>> +        .size = 512 * KiB,
>> +        .line_size = 64,
>> +        .associativity = 8,
>> +        .partitions = 1,
>> +        .sets = 1024,
>> +        .lines_per_tag = 1,
>> +    },
>> +    .l3_cache = &(CPUCacheInfo) {
>> +        .type = UNIFIED_CACHE,
>> +        .level = 3,
>> +        .size = 32 * MiB,
>> +        .line_size = 64,
>> +        .associativity = 16,
>> +        .partitions = 1,
>> +        .sets = 32768,
>> +        .lines_per_tag = 1,
>> +        .self_init = true,
>> +        .inclusive = true,
>> +        .complex_indexing = true,
>> +    },
>> +};
>> +
>>  /* The following VMX features are not supported by KVM and are left out in the
>>   * CPU definitions:
>>   *
>> @@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>          .model_id = "AMD EPYC-Rome Processor",
>>          .cache_info = &epyc_rome_cache_info,
>>      },
>> +    {
>> +        .name = "EPYC-Milan",
>> +        .level = 0xd,
>> +        .vendor = CPUID_VENDOR_AMD,
>> +        .family = 25,
>> +        .model = 1,
>> +        .stepping = 1,
>> +        .features[FEAT_1_EDX] =
>> +            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX | CPUID_CLFLUSH |
>> +            CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA | CPUID_PGE |
>> +            CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 | CPUID_MCE |
>> +            CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE | CPUID_DE |
>> +            CPUID_VME | CPUID_FP87,
>> +        .features[FEAT_1_ECX] =
>> +            CPUID_EXT_RDRAND | CPUID_EXT_F16C | CPUID_EXT_AVX |
>> +            CPUID_EXT_XSAVE | CPUID_EXT_AES |  CPUID_EXT_POPCNT |
>> +            CPUID_EXT_MOVBE | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
>> +            CPUID_EXT_CX16 | CPUID_EXT_FMA | CPUID_EXT_SSSE3 |
>> +            CPUID_EXT_MONITOR | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
>> +            CPUID_EXT_PCID,
>> +        .features[FEAT_8000_0001_EDX] =
>> +            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_PDPE1GB |
>> +            CPUID_EXT2_FFXSR | CPUID_EXT2_MMXEXT | CPUID_EXT2_NX |
>> +            CPUID_EXT2_SYSCALL,
>> +        .features[FEAT_8000_0001_ECX] =
>> +            CPUID_EXT3_OSVW | CPUID_EXT3_3DNOWPREFETCH |
>> +            CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A | CPUID_EXT3_ABM |
>> +            CPUID_EXT3_CR8LEG | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM |
>> +            CPUID_EXT3_TOPOEXT | CPUID_EXT3_PERFCORE,
>> +        .features[FEAT_8000_0008_EBX] =
>> +            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
>> +            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
>> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
>> +            CPUID_8000_0008_EBX_AMD_SSBD,
> 
> Don't have SSBD flag exposed in default EPYC-Rome CPU configuration?
> Is there any reason for this?
> Or do we need to explicitly add it?

I think we missed it when we added EPYC-Rome model. I was going to add it
sometime soon. As you know users can still add it with "+ssbd" if required.
Thanks
Babu

> 
> Thanks,
> Pankaj
> 
>> +        .features[FEAT_7_0_EBX] =
>> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
>> +            CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
>> +            CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
>> +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
>> +            CPUID_7_0_EBX_INVPCID,
>> +        .features[FEAT_7_0_ECX] =
>> +            CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
>> +        .features[FEAT_7_0_EDX] =
>> +            CPUID_7_0_EDX_FSRM,
>> +        .features[FEAT_XSAVE] =
>> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
>> +            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
>> +        .features[FEAT_6_EAX] =
>> +            CPUID_6_EAX_ARAT,
>> +        .features[FEAT_SVM] =
>> +            CPUID_SVM_NPT | CPUID_SVM_NRIPSAVE | CPUID_SVM_SVME_ADDR_CHK,
>> +        .xlevel = 0x8000001E,
>> +        .model_id = "AMD EPYC-Milan Processor",
>> +        .cache_info = &epyc_milan_cache_info,
>> +    },
>>  };
>>
>>  /* KVM-specific features that are automatically added/removed
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 8d599bb5b8..888c3a59e2 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -816,8 +816,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>>  #define CPUID_8000_0008_EBX_WBNOINVD    (1U << 9)
>>  /* Indirect Branch Prediction Barrier */
>>  #define CPUID_8000_0008_EBX_IBPB        (1U << 12)
>> +/* Indirect Branch Restricted Speculation */
>> +#define CPUID_8000_0008_EBX_IBRS        (1U << 14)
>>  /* Single Thread Indirect Branch Predictors */
>>  #define CPUID_8000_0008_EBX_STIBP       (1U << 15)
>> +/* Speculative Store Bypass Disable */
>> +#define CPUID_8000_0008_EBX_AMD_SSBD    (1U << 24)
>>
>>  #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
>>  #define CPUID_XSAVE_XSAVEC     (1U << 1)
>>
>>

