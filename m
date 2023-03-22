Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C206C57CA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf5Cq-0002pJ-7J; Wed, 22 Mar 2023 16:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf5Co-0002n9-17; Wed, 22 Mar 2023 16:37:10 -0400
Received: from mail-dm6nam10on20702.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::702]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf5Cm-0000ef-Em; Wed, 22 Mar 2023 16:37:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw6MQSmGM+c8P0LntYqb08ajW6CpQr9rFgDIx3IqXRZNtGHzr6w2JmwszvzIM9fC0wtweOUyymxlc84qCgz0oX9uh+QJcqoNQA2tvPRwtcHdLoyellHLxTidcfR8tjdXIlyg1GKDaZDfB91F5RR3p77ZXeKwLL+olpIB7Cx32FcY2r2A/gFA5dbO198GwQIeCdoN/0flGctrFnzn5l2rA+gsHxFFtyTZs6h7AUckN0XclSURUA/x1IG1UQE52gUVtb51UeDxXWd9A/xVXqoISqHjSiIRpeGPL3oHuXDGX1lGkuE82YcA5sQYqbF3+eI4HlOjl4zyXBWrREVavI/nyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq+pZPrr5hMqX910SeHWO1Tfoytuq+1WS1STRmCJFlA=;
 b=E99cSfO4bVDNS71tnDMGt34ShSzaoMHpWIayjox46B8CUtGVS8OgcYgJzgzNGflc/HKnzCN2S4OzzzmfX1a4v7K+acKoWn4ql8dpAE6aSrsO+sFWfFvP4BIEYzUvt/ZcX7M8wDrUkZU4xKzYEfuDYeKl36VzDsVCPlh81ki/jv7c++YApMPknulytzHeQdCs08jG8O5Y8NrEbARW3GFGMNIId03GxuQXGS6uCEPq6HbRj3OSYuwa8d2UtHHrmw7jsHFFpS6qTPZgVUQ6qTC+DUlK7/k4m9czy64m/whIzoVOnnXg3jX4LWOT59wxiQE8Lqm8TMrDB1DBp3g3rfSAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq+pZPrr5hMqX910SeHWO1Tfoytuq+1WS1STRmCJFlA=;
 b=uAdsc1dgwHzIxoUSW7t/XnI3NQlbe9koM4fqXTWhI+nIbf1aZLiLh6ddLKorjdV/iwvO5g7pKjp5R9WQ+foyLhNw0Sj2lZ7AAT+eWad/pJYyCiw0Zx2rFRkouwpVd51NoSKxaeoUHXrkptF+vJcN6dosHUMk+BKkgfUjK22hubo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA3PR01MB7919.prod.exchangelabs.com (2603:10b6:806:313::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 20:37:03 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:37:03 +0000
Date: Wed, 22 Mar 2023 16:36:39 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Message-ID: <ZBtm15EMqUZHRx3a@strawberry.localdomain>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
 <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
X-ClientProxiedBy: CH2PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:610:54::14) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA3PR01MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 356ab9ec-2cac-4e01-3a4b-08db2b1531d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4SeM8+1mUkCP/BFigV6lDE3v5ceDYRMVwBIzM3avCjhGXhZWGaN+DApNsHLdXkyi0fGBSmTC7uetKFz7ee0nAtr4Uo/adWy+fFlVU0lzs/y4oK+dsmR7/0Q0leC5PxIP5U34vQubSlSnvVKmgPvdWBw1Pk19h2zrqx9tQV02DitnC3jGfaFXfobIyal+D0jKFpNCJoZxW3GV3kkjFdGgbmExkdq97YIZHyvbR7ltddwcuZ3WjSsP+tNYAh1yn+/+xmW490tfc2tsLfvccYam9jqEPg3bzniDRnEx8Sf1gerSDo5PnRpZcl5zzH9kemre3uDjQ1Qiuf1GAJ7/XTYESEmkJmln2wVDmUGez9jzYBv5gL+K8ITt4Gkh7RrhMX1YSCG+qF/+/18OzIhi64Sy0oA8L3D8mOWC39g1hJXqACJUHt3lKhcV8JpAfScKQ63TVyxxfCF54hxaKgZEEOzxp4rjQn0MyzUPp2voQfjIAl81NcYIoS1bXJJrt5SDjBbOCdoQyLUMXw9HP8T1dt2NnL8MjOxe3lMg/05E6qt4UlfKuIN0/R8HL5mdTVNpBFAhlPzvNA1QB7p3ns5G0RHeCFDFdFkeXeinpwaxqZ+WW0B4ekffmT3g6/A4MqJH6QhEBVnKJr/Gd6oHgOwXP1kMBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(39850400004)(366004)(346002)(451199018)(9686003)(66556008)(316002)(86362001)(26005)(2906002)(6506007)(41300700001)(186003)(53546011)(8936002)(6512007)(66946007)(6916009)(4326008)(8676002)(66476007)(38100700002)(6666004)(6486002)(54906003)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2Zf5uMuf616PgyTqIptGo3VZfthm6h1Zx4Ym2UoCjJPI7Ma//hImvI3uCce?=
 =?us-ascii?Q?+O3Ti7bSApOorf40LaOzvp7nup04aZkGBlXAf6luPrK1UML0y5AI27XLsvX/?=
 =?us-ascii?Q?F5g9zf3c/iSDLkq2X6b5yw3y/tvf4FtxqT8TuewZcg87B69aNBc9JXmocrXC?=
 =?us-ascii?Q?kfOimHUtpPxkt4xMcGTQ7NRRuNnn+cqBGKpJuHgG5C4AlnHBW6FBjgoeV5Yp?=
 =?us-ascii?Q?XxggeSRlRRRO300oj5OXlZAXev2D4litkxpjApYpssJG+Q3/Dxj8MHs5Onzr?=
 =?us-ascii?Q?xEczsV0RnbHlwW4rktBVNStOluBsAUrQHKuMGHpVD1tCpHZTPdyYQ0i/FY/I?=
 =?us-ascii?Q?dEJ74n28/S6miymHt2ymzRbYCFEyVADWadNLKm3/BljHbEHgle+FKxoKqmg9?=
 =?us-ascii?Q?MlU7RsoHVPOurNeSXRUx7eDTZ3z8A+04YPwubbjlvCWBuZczSZ6mdqGp8li8?=
 =?us-ascii?Q?xkL4SrCFWDg4cuA+pKBbnpPnY7j0u0C3gGqETwoSFGzdTbxcIPHF389uh6Gh?=
 =?us-ascii?Q?OxEyOR1Lg9wBdekJii9jfYQv2xX382PgmwWbARu+o/Si+syoSopID4DzlpTe?=
 =?us-ascii?Q?QT+4H8ZpxBUIvA8HDxISrnX/yoRjIjyn55gMiVFemgpGReN9jUTLG5yialjj?=
 =?us-ascii?Q?mQ35nI2upTpJMOBw08nsV0h7kAkto1nLs2r1WQcxCNpHz50Xsb/VkFLqDpYd?=
 =?us-ascii?Q?oMehZKMvNcbBFhTOO3Ewl835xlO+bp8W1H++7eHCjvhH/mKG8dos4RKVFlif?=
 =?us-ascii?Q?abh1SJZ0TWPm6tSqlLuJbA57WDdxD8Vcm9EZ0niBfdt1dj7fL6n05Nzrlu46?=
 =?us-ascii?Q?01o0OY0ELhhgNCibwjZwPYfruj2FxxKx+Hh3OWas2WHW8Kg2VRqSR0BKvTae?=
 =?us-ascii?Q?4Q/PzQVbGjMInunPPVCBw+SX6uPWZqKlZptl/F2FyT6F4xJkCJ1bd1K2q47V?=
 =?us-ascii?Q?MJtHD5jmULhyZE9hzuKiF6tlT56RESu2MOAVeSsSXqz8cThJ2tDQ2apATvI9?=
 =?us-ascii?Q?VQaElYdf76B9qjwcOWK0bEmNj8QsehmL02MrH5wju3n1TVPEWJUz01CX9Mhr?=
 =?us-ascii?Q?5L1aqdKhsE+QoNOKSaIxuuSWbqFyQfwS0f1+0yMVtLLqeSH7gAnpFvjJ5Mym?=
 =?us-ascii?Q?JukhZogrQGM9Q65vpKxMkgvy3Aqjlmk5XaIQ3pXOFtkHtNDYWk8Hok3LcwRj?=
 =?us-ascii?Q?gMnLH0v66DQmaTCwwzEgUvpBlFQn+jK45coRSdxR/FzG14sLH720e+Q0Maff?=
 =?us-ascii?Q?AUEFq14bpISbbDYCKWuEjP2ORoylXhnsKiKG8azcYTjPO6wSlk06KszhBgv2?=
 =?us-ascii?Q?mR3dIN5OpS82R6d88DCgmrDEpO5S11fl4+KsFO4yD8fEcDK4F0bF9ekVPVKw?=
 =?us-ascii?Q?+2rOrxIJhOUTPE+V0AQCHSw8+CdwAU0CbTb7LGh62sRWoHVsKikDgoPtRpLe?=
 =?us-ascii?Q?G1cD3qB3M+u2Prg465CAhd1bDMuxp1EPTbltZT21HjVkEE14UTwqXa0l6MhV?=
 =?us-ascii?Q?9Z6tvELs5dFTxah6VhFrY0+Q4OQgMFdpsApQZCJKKdkDIzfx7cyJi5JOyQoE?=
 =?us-ascii?Q?0lWEqKGXcWIreenIo76FpzUjo3VxaT1bQ0YOZREAdPiqa5n2iA1vLLoEd5vH?=
 =?us-ascii?Q?Ond5U1QWgzViLbcBI0LCzPU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356ab9ec-2cac-4e01-3a4b-08db2b1531d4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:37:03.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTq+GLN9P1qjSzDJe7eS/iRAhd3mgoIXE2hFAwPuVJ7FTecfkbe06utKyh0Xy8ZD2HU6NNNJ+Evq+SG/CbQxBM7W8ZV+63rPtGaKl+sNZh0XXQR7gtCYMEllE3/z4YAJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7919
Received-SPF: pass client-ip=2a01:111:f400:7e88::702;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Feb 22 12:14, Richard Henderson wrote:
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > +static Property arm_cpu_pauth2_property =
> > +    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
> > +static Property arm_cpu_pauth_fpac_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
> > +static Property arm_cpu_pauth_fpac_combine_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);
> 
> For -cpu max, I would expect these to default on.
> Or perhaps not expose these or epac as properties at all.

I've removed these properties, and epac's as well. It now defaults to
the equivalent of prop_pauth_fpac_combine==true in my previous patch.

> I see that qarma3 does about half the work of qarma5, so it would be
> interesting to measure the relative speed of the 3 implementations on a boot
> of kernel + selftests.
> 
> You may want to look a the code generated and play with flatten and noinline
> attributes around pauth_computepac and subroutines.  E.g.
> 
> static uint64_t __attribute__((flatten, noinline))
> pauth_computepac_qarma5(uint64_t data, uint64_t modifier, ARMPACKey key)
> {
>     return pauth_computepac_architected(data, modifier, key, false);
> }
> 
> static uint64_t __attribute__((flatten, noinline))
> pauth_computepac_qarma3(uint64_t data, uint64_t modifier, ARMPACKey key)
> {
>     return pauth_computepac_architected(data, modifier, key, true);
> }
> 
> static uint64_t __attribute__((flatten, noinline))
> pauth_computepac_impdef(uint64_t data, uint64_t modifier, ARMPACKey key)
> {
>     return qemu_xxhash64_4(data, modifier, key.lo, key.hi);
> }
> 
> static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
>                                  uint64_t modifier, ARMPACKey key)
> {
>     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
>         return pauth_computepac_qarma5(data, modifier, key);
>     } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
>         return pauth_computepac_qarma3(data, modifier, key);
>     } else {
>         return pauth_computepac_impdef(data, modifier, key);
>     }
> }

I have not played around with this further. Do you feel this is
important to look into prior to merging this patchset (since QARMA3
isn't the default)?

-Aaron

