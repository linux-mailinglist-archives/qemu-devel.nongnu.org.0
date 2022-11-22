Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD146343EE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:47:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxYHk-00078U-LN; Tue, 22 Nov 2022 13:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxYHe-00076W-LD; Tue, 22 Nov 2022 13:46:15 -0500
Received: from mail-dm3nam02olkn2082d.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::82d]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxYHb-0007CB-Hm; Tue, 22 Nov 2022 13:46:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKoEoFK6Gw/CZmSYhB6XPK5Zf6gRCGeBIeoI4hFOAJNX4szXMGoss3p2PgAE3D5qB0wikIUgxH1VlARchNSruKMIHf0uu8ik5B4FBO+KAOYWz21o5h3Yck3Mju3dUCCFAXbz9lhyCHsPi7OopiCxZSImZ1XtCnzFBeJYy/9HX6E8H87Ikf+cJ41iFeIdw3uC1KVmxVlNElyiKVEqkAfmikTCJnR7gCyPvUO28oELGldL1ew8/wlGEbTZhgp3lr7+3ql8pLPXOKgTRUR2EISSlK69zANy4YbG44rvS2YLEWfU30TKxfAX+dA+X0zvTFTCLemHjFKQ3+j8rf3XEokJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or5VcmIEaDFG2zyJaZ6oSEBn/5A3NFWI9l3XxU6UMgE=;
 b=TTEVLw0sLKCs9JUJvYpXx8XErfyd0iR6YQJmz3gV102lLF1/0SGRUpRpHYso2vgzXa0M2KiUn3WBTN/59YTBh41T4WRro8LFD9AAoHjCpz5tndEnn75SOmlpu0VobHN20WkS/2sUOIZVmPWJnHKG2eKT2iEH/dtXNrB79EZC64J8wrXyr2RFI79X3vcDUErCmLlox7Len8/gMPfYfhIfL/OEfWj0cxdiIfENwLr3HHtRlNd0u/+VMXp9DCvtCkCGFwML/uTkaoR0M3SlQdLhLbiVCHOj95T5zxvoTlBuluIj7kncA/VdeBp+Qjit5TBPfOqjV5saLLRjowrdkv8yoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or5VcmIEaDFG2zyJaZ6oSEBn/5A3NFWI9l3XxU6UMgE=;
 b=WuW1anwEb5E7Ag+sf0UQIE+usDIK42OsKingprFpA4vSl45LFS1XMWplm93LClTIu9ouOOGThtOy7Vu+6GSnPFP7+ghzhrCmxBzM+G/dxAvk/cFeG8wOIiCf1tkgbsjWFC7GuZ+p5hurujPrFTAp557qeFOmr/bePQ9U1sMTCTyk2ZgcRGvQIa9U7kHJtpNM5zP9p0HrANq0+MUZdH/6smYfgYQLhsJvFLxvQwYO8nRH4qtYjmKByQTVNd8/JgYq8c5Xl+CIP8HoVQDXhUy9RpRC28yDW0x/6r9Vx7OMmcsb9i/7RAXgYksg7fVaP7hguJCWSmXs+4yuvzjV/u0+0w==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 MW3PR12MB4538.namprd12.prod.outlook.com (2603:10b6:303:55::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 18:46:08 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:46:08 +0000
Date: Tue, 22 Nov 2022 10:46:05 -0800
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: align exposed ID registers with Linux
Message-ID: <DS7PR12MB6309F9F33122ABB528F8CB51AC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
References: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <CAFEAcA85sSz3bvAvz6XLqa4TxBSgYWRG-oXTCr7Q4tNYRk+GEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA85sSz3bvAvz6XLqa4TxBSgYWRG-oXTCr7Q4tNYRk+GEw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-TMN: [SQcNFfvoiueO/4k5V5iE0Xyf5cE/qLJp]
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <Y30Y7W6qTvFaymAb@manjaro-vmryzen>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|MW3PR12MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: c908d0b3-d336-4422-dccb-08daccb9d177
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eG9+mvOQIOTEZw5tPAdj/tIHjlx/ak9Sg7nnXDOOyb1jAj0yQSsrCZu8sp999/aSfGcpChvP08y8FEStCIaEiOUINn3ZWivKvbh5D/YkVMHJ7MWI817UUg5tAyIQPUHtA0yFxseRdKriJqRPIcB6cfEDgnT7lvOSSGZUsdQy5TTKKMeF0azxLtvfEdX2Ly9GlK/U1ZSJOZefESi72cKTEmdQdikGI/6A/PhcuwcqTYQhsw1u0klkfiWKkqzz825ZjW4AknLe87Cl21aPFPtw1yzOYORQ+xhO+jg3dfq+4e1bICj7N0CYrpfodVNHXqDx94u7SILoNREd8ntw078APQGwgcNOhfto75QK143dLVhjq7rIj8IV10bzT/JApqTU+lv9zFpUrZyIeHkfqO573NHkUtitR3IfagknLRdI6Cp8vNp2IpwNK2UfiC8crtE42IfAed3CZxTbzxCDCvkfFgsbpGOHH4VEC2N9eKyJkQcayhexcpaIHVyIxSYOW70z2KP7rFe7hjlGoE+MaAdC+aDjPlZxf4l1Doiq7H1R5TwTPtLyrCo61ugki7Vtk6tH6Sp5QZFkGIUC1Dx0MF32CyEn+dGVYuI104bfTcMVQtLTLadjYBJAi8nDcLn7pagh1TCjG89+KiYuktEhHN3IGR8anWoBf49qkp0dIJNWypEWhTO0v6GqgFE+VGwXml9D
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUF3UnduVVVHV0luOTBpSit0UFRNZS94OHhHcDVPZk9mTXNkczljWFlEY2Nv?=
 =?utf-8?B?TlRJQy94bXV3SU0ySGI5U1Nqb085WkNsMjlFWlBMdHRJcXRJR1lscElQTlFs?=
 =?utf-8?B?QWV2bmtENXJzM09Sc2h4R2M3UkZjOFlnZ0tWQS93V2JEKzBXaFFSd3gwYSsw?=
 =?utf-8?B?bHFoaWhGMlNZdTJ6cm44ZHJVLzB4eU9aOWNVR3VSM3JWTDhzOGZsQnZXV2Rv?=
 =?utf-8?B?Z1J1RTZ2eDF0T28xZWRKYWpZdkhhUm1JcXNyUUYwaVhjMDlNU0JUbC91NEZO?=
 =?utf-8?B?WVF5THRpd2crSzNiNG5GWU5jQTM3S1hhU0hXSU92VWhyUkdzcFVFWGNKT3la?=
 =?utf-8?B?Zko2WDF5NU4rSGJ4Q3U4MnV5QzhXRy9JZzYva2xWQloyUlU1UEkxQnRPUWlT?=
 =?utf-8?B?YjRyQ0Naa2R0S2pPTWNsQ0hjcDJWTmF5RGUza0FYS1FvSXd3R3YvYzBzR3NB?=
 =?utf-8?B?eXBBeU8zUlN5MGVDVjBnSWNacGt5WEVTbTN2SFI4YURFNWE3amZUUFprbDNp?=
 =?utf-8?B?NHYrWUh3QXNBYzFBYURLSFJPcE5QOGlhcFBRWU42bFBZMi9GbWNYczV6a2tK?=
 =?utf-8?B?bWlIWkNxemduUkpuY2RoMjE1WnhKWVRsT0FDUVpZQUF0cUprakNvc1dPNldv?=
 =?utf-8?B?cFVzeEkrUHZOVlByY0pLK296dzYrbGFPaWFSSWZCcitOWkw2ZWkrdEZkT0lq?=
 =?utf-8?B?RkZ5SVhlSlBLbW1CU1plMWk1cnJlSUE1akNoK3RjUmtZVlJqYXMxL0ZzeGdO?=
 =?utf-8?B?VWxTWUhNL2Zlc0Z1bEoyLzFORTNzYUJZQ21ZSW9Mc3NHVm4wVDBxZVNiU2RJ?=
 =?utf-8?B?SmZtLzA4N0pDZ1U0ZklPcFJrNGpBZW51anBtMlhjSTl6anovZVgrSWQycEl3?=
 =?utf-8?B?NlRyUGpRbFlQRnNzT2NNQ015SGx3MnRJV3A0aWRlYkRVVGYvOWVjLzNvMk5O?=
 =?utf-8?B?U01qWlNIUWtFbjhHTjhVWlJyVWpjYUp6WmVQZGFBSks5NENuOUZtSko3RWE5?=
 =?utf-8?B?emNiQWpnWFM4a2gxNThBaWx5VWdxZ1NaRm5ZR254dDlKQXloOFlMYmxyWVRo?=
 =?utf-8?B?ZVhHOUhzMGVLb3J6cW1YMTVjaWlGK2J1dkMyeWtHZ2hxSjduWnl4eHk5TU5Q?=
 =?utf-8?B?ME1sUkgvZjBreXJUN2dWNXlwOG5tdmI1ZVJVaFhqVUVCUjdjbU04ZXJndjBX?=
 =?utf-8?B?UWtDQUxLVTV6Y3hkT1Y4cGlxaFRMUCtJcjdIa3FhdiswUS8vR05nTGFRUzBP?=
 =?utf-8?B?cWlLNmFTcmI0amRQdFFZdmFNSk9tQjh1Wm9YUVhEWXN1RFUvcUl5V3lhbTBR?=
 =?utf-8?B?MHZyQ2hPZ3F2SHphb2RVZjZ0Y2Jwd1hhQzh2NmtQVFA2N3pqUzU4QVZ6U0U1?=
 =?utf-8?B?Qmt4bno3ZFRMK1lkeGduL0h4cG4xZ0lBZzZLTVB0T25ESDFPN1dmN1BWSmZ5?=
 =?utf-8?B?cnpNOHVOaHVJT3hscTd6QmZDY25XcCt4MU5Ka0U3U3Awb3g2dnlFV0g4QnNm?=
 =?utf-8?B?aFQ0a2lMcFF4eWZma2RFMXByNVRKbnhocHhPR0M5U2ozK2poSlBrMkxIVFl4?=
 =?utf-8?B?QXBOSFh3ZTMvNWdoVFJWdXZkS0I3V1QwVlM0OVhQYjIyYVkyNmNLaStxeGd3?=
 =?utf-8?B?czFkR1RuTGdXS0FjalBWdlpHTlYyT2pLc0ZReDNFRTlPLzNNTWxwcktPaE52?=
 =?utf-8?B?UWthTWNKZFpaQ0F3cVVpZ29QaFZ1Vm1wcnRtZmF3SXZBTHhaRVRycmcra1Zy?=
 =?utf-8?Q?p9MPp+sucfwOVCkVpY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c908d0b3-d336-4422-dccb-08daccb9d177
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:46:08.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4538
Received-SPF: pass client-ip=2a01:111:f400:7e83::82d;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/22/2022 06:26 PM +0000, Peter Maydell wrote:
> On Tue, 22 Nov 2022 at 03:05, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
> >
> > In CPUID registers exposed to userspace, some registers were missing
> > and some fields were not exposed.  This patch aligns exposed ID
> > registers and their fields with what Linux exposes currently.
> >
> > Specifically, the following new ID registers/fields are exposed to
> > userspace:
> 
> These changes don't quite seem to line up with what the kernel
> documents that it exposes:
> https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.rst

This kernel document seems not quite up-to-date.  The patch is based on
the upstream code:
https://github.com/torvalds/linux/blob/master/arch/arm64/kernel/cpufeature.c

> 
> > ID_AA64PFR1_EL1.BT:       bits 3-0
> > ID_AA64PFR1_EL1.MTE:      bits 11-8
> > ID_AA64PFR1_EL1.SME:      bits 27-24
> 
> .SME not listed as exposed.
> 
> > ID_AA64SMFR0_EL1.F32F32:  bit 32
> > ID_AA64SMFR0_EL1.B16F32:  bit 34
> > ID_AA64SMFR0_EL1.F16F32:  bit 35
> > ID_AA64SMFR0_EL1.I8I32:   bits 39-36
> > ID_AA64SMFR0_EL1.F64F64:  bit 48
> > ID_AA64SMFR0_EL1.I16I64:  bits 55-52
> > ID_AA64SMFR0_EL1.FA64:    bit 63
> 
> This register not listed as exposed.

This register and ID_AA64PFR1_EL1.SME are exposed since v5.19.

> 
> > ID_AA64ISAR2_EL1.WFxT:    bits 3-0
> > ID_AA64ISAR2_EL1.RPRES:   bits 7-4
> > ID_AA64ISAR2_EL1.GPA3:    bits 11-8
> > ID_AA64ISAR2_EL1.APA3:    bits 15-12
> 
> GPA3 and APA3 not listed as exposed.

These two are exposed since v5.18.

> 
> thanks
> -- PMM

