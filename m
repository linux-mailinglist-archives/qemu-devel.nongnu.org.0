Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99577413BC2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:51:49 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmk0-0003Qc-38
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mSmSB-0003It-8L
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:33:23 -0400
Received: from mail-bn8nam12on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::71b]:50817
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mSmS8-0001Gk-S2
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:33:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsF5o0VsXxa9kSITPGs/KR6NtcDQ6RYiWj5lGcDLoQdgiDCDmP9tPBCS39tMQGWW9p7UGVihJXh3ZgmAFt/LYpmaL9U3J+2XmD9HeYpRklKz5rvOfPTQDFZkog8XRYf9oG76egdNPPMdA9oucqwL0/EvjJR3w+16qTaNd8Fj12zlX/EPOmgwVm8p3Wk6zAurXFjJ/dqUYCpJFQIedhNkzFvd9+kwFhoFv6ChIqFTKqfJh+8h21dYzDFZMbpRJDMuHmuvrMGd5pH1UWWad726csDPePzNZ001tDmgN31FYyL6nqJNplDX/lkPSuBsg4fQrRF+IWrZXY6uaSa69c1gYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YYpNuKlQE6AfjEKU0Oasmy54tQPtmdAsdfaRsB4neCc=;
 b=Xx1M6Sl8uEnWi+uM+ceDBsp/EyjtaUdZ7ClgwXGKM8ky4gLy+LWclhtgm12rxp6ELUBInvXTC6zEvM+3Q9o3dxqe+Wt4dVOge2VsSlPsAL9jjlsbrPWiWVqD6y2pEP0TP68GQMmpD0SY5NQxb+kZnkS0hV3/YBM/DjViUW8v/1swXlCglmpiEV97RSNPekUUGw1D/Mi7z7heqEj4hbimniW3B0JMF0SE3oK0vhJZVgtrbfXXFH4lVKnqnWUcGHq5nbIf0kX3i1frUzh/pJyv89H9eRH7bp9WNHQ0MCwgROm/DlvGiGo/MoaTE1YN3lQIYSfhq9kjMhNA7xFIBXpU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYpNuKlQE6AfjEKU0Oasmy54tQPtmdAsdfaRsB4neCc=;
 b=RBN8wh2l52GdGn4XvtCONx8FzRGSHgFow9ZQ3OSitkLv3AdaZlaPqDo49p3tZzTDBDr/fNzQGKUIZZpj8v7HyOKE8NVg9x5oLs/s8f2bOHORdDG8A2OBsc6+nddXGt/iPQRCmK4GENa6on1yEmJB84PwCxh95rOVhBLrr19AD5c=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BL0PR01MB4291.prod.exchangelabs.com (2603:10b6:208:4b::28) by
 BL0PR01MB5172.prod.exchangelabs.com (2603:10b6:208:6f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Tue, 21 Sep 2021 20:28:16 +0000
Received: from BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::bc42:dc29:fd53:8a4c]) by BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::bc42:dc29:fd53:8a4c%3]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 20:28:16 +0000
Date: Tue, 21 Sep 2021 16:28:12 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YUpAXEYX0D27BnEA@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsu3tppe.fsf@linaro.org>
X-ClientProxiedBy: CY4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:903:33::27) To BL0PR01MB4291.prod.exchangelabs.com
 (2603:10b6:208:4b::28)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR03CA0017.namprd03.prod.outlook.com (2603:10b6:903:33::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 20:28:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a3d3df0-19ee-40ac-5969-08d97d3e5764
X-MS-TrafficTypeDiagnostic: BL0PR01MB5172:
X-Microsoft-Antispam-PRVS: <BL0PR01MB5172EE7A17F9BD3706ED52228AA19@BL0PR01MB5172.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDiVt+OInZhoS1zJf8nqUdT+uUbpe19x4TRW9FUZ9cxRFZqBH/gMcv3Sh1Jr5nd2bv+JGLMlx2t8S5OtSJImU0li61vVAu4cq8Phb8D52yHSHQod+NTByvzxeNPgibpQlpZ+vhksJmOEkyqi7G6CT5ChSCeT/FLrsaCV9vzIyvqTAnVfTghO+WbMavPpw5cWKvHPHJJ5lexybTiQEeSS8ePf3N6tHSyEJ5/QLqbqlBNlFsYkE4W/SX5cMUahRY0dnMl4gIzlXIVSgAgzPYNr531QSTdIWVhNMZim4bbpQWrWlOFc6qnSVE9MeKXM6A/XEMFvz6J9VrAbU8Ok+gPadbLxeZvngHCaWj869TEeX51aTQxTyyp3Xjp80PpXjNfPkJooK+IFfuECNwRSaywoWZLG7G9MGR8NToShMpb7lFb7iV8xIqkpeQlVEi0zleLyJsqYae59Sq5UaBDF40uJ5xDBGu183QT/Fe0c/VqCUThrt4ThAqJl1RlRxKIYseLuB6ioMbBkWiA2Rr9oJYcui+DgTiCQMBg5a1E04ra19uBVp8PguNHYbAqcfdVkP/a8Ram7J/UDwBATN22wwaXjCWovXeKD3fBhyII7OLcEpAPAFBrX7MFZ27OVE4J3B4ZYKSWb7HYt7ulIphFkrkXR4dlrhWubUI5H2X7dgjoRdpbtO9d6hQGsg9tPA1pJkFa5yu9lmpSgN76tbmF9Lwc+CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4291.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(8936002)(55016002)(8676002)(66946007)(66574015)(83380400001)(4326008)(26005)(9686003)(186003)(66556008)(5660300002)(2906002)(6916009)(508600001)(38350700002)(52116002)(7696005)(66476007)(6666004)(956004)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kaB5UlwY47c2WITPIWAd20xuGXghgpezk7HHV3V13zT95j3Q8B4LXNPGYC?=
 =?iso-8859-1?Q?ib76i9rzRt5lb2eZzNSPg0H6m3FLekw8YCfikYHRf9N+mQ30uyrPyT3fRP?=
 =?iso-8859-1?Q?24IHI4ktBZ7fHFGptrWPdMLjr5HhVpoqXgcRveXzVbxlMMKeClcXKyDzDw?=
 =?iso-8859-1?Q?m6DXrukGntTWtWJZ/eIgIUd3Yf0+MSwTz/795h9Fm44ANjR58+rBQ6Zw7h?=
 =?iso-8859-1?Q?f3gQKelmn4nezsGrmnbm8jbxbbJoLvnfjWOIcf8601DJjt9Iqhz48ofEKR?=
 =?iso-8859-1?Q?w4PM/0EoS7mMdPbrA7+cdxXVZjBr2CM428qpY7avF5jjMKmcw+DNHQoEUh?=
 =?iso-8859-1?Q?9IoVkYJvHAp9De/4k/CZ1TPnJlx2iVqxvLZgESKukbzU5ZJVprShXmyh2j?=
 =?iso-8859-1?Q?1qvSmqpzIZMQWQrtPOUcSN2mTmdcj0fG4FbXbyCTOIT6Oi3qTL+juRk15Y?=
 =?iso-8859-1?Q?sv6onFEMAmWchbRPjOuAZf4jDsVTvyYsMhnHzOXuqn8cwC3tj5FNLnoLJi?=
 =?iso-8859-1?Q?H2bNxAIH6FFY4bck9Ys8Ff79NLiR5OCQjUJXP4wlcoQXjrQ6s/wpNbnbMp?=
 =?iso-8859-1?Q?Sx7orji6nnw0togvDYnc0PMumyyen+qRal0fDWuuMIuPEzp2IQZS49l1oT?=
 =?iso-8859-1?Q?dbJo5csgKx0xWUWazRUeiawpFsarLC1IMPBo/hr6WZG9Tp7QI85E01Kv3L?=
 =?iso-8859-1?Q?oB7oHKlwPPrBJCpuS+egGPyq79mSdNAXfQwa/3YqAdF5hr0crsJY0P/c5I?=
 =?iso-8859-1?Q?ksPB+2qB6lz/XuauuSqxrqIZ47N2NTWEmDd9d2vmnc4UGIZtRxoF/xPLl2?=
 =?iso-8859-1?Q?IO0ztyYVy+RGfTISZAa56s3QmcUk4JHyT6F87OtkUBIoD52gSp+gXHV3y8?=
 =?iso-8859-1?Q?g+zGd23cQyRsdwAmauWcln4LKxozYeeZYXOxUF1kQbTeGkvWEeH91JQm0W?=
 =?iso-8859-1?Q?wDirD+4tKnBgdfhH4fw/EtpEGiLi8ATpU0pAKEF+8xSk/fM+9L6BWkO8cf?=
 =?iso-8859-1?Q?/YnCZyv1962sGcau7HveqmHefr0qK/woXdfLwy44UtCVc7ROoPoj1pX3uf?=
 =?iso-8859-1?Q?xCb0wvoMayLnluzVtF0xd6aj3mwS0fltOTSe/wdC/zNFNagPdSww+Q6ATM?=
 =?iso-8859-1?Q?f/r9ps/O/8FT4+96Xw0+mBIaFoAzuL1nFCAqTnt6rFdqJae0edKEhvpERb?=
 =?iso-8859-1?Q?YAAyS40aKyuToUs8+kwEBRvDqaymkGDRN5Ia68nW1zHHm4D/1Ihgm42BMx?=
 =?iso-8859-1?Q?alpPZVdxsoqkbiW0qig5dsVx/05U+tblq3jliawiyWo4eUTXryWbaDCkF8?=
 =?iso-8859-1?Q?GJqKFZ/cxum7unvrU3Sn6qlXqBO1BTOKbEtaKV63MdFY5y6NMtWuCnhBf2?=
 =?iso-8859-1?Q?GyL2j9xT5P?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3d3df0-19ee-40ac-5969-08d97d3e5764
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4291.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 20:28:15.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRR+VjoB1+BTI/TmMSfXCX1NftjAe9QOqbQqbU9Ye4sN08rblrLmDYfzj0Glt0UznHPL4Yr3zLg15TdIuJmWEl7eV8MgL7LskzFZXR4xSkWJlhv3+y9vNaCfvPu6Y4YF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5172
Received-SPF: pass client-ip=2a01:111:f400:fe5b::71b;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Sep 17 12:05, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > I recently noticed that the plugin interface does not appear to be
> > emitting callbacks to functions registered via
> > `qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. This
> > would include instructions like `stxp  w16, x2, x3, [x4]` (encoding:
> > 0xc8300c82). Seeing as how I'm only running with a single CPU, I don't
> > see how this could be due to losing exclusivity after the preceding
> > `ldxp`.
> 
> The exclusive handling is a bit special due to the need to emulate it's
> behaviour using cmpxchg primitives.
> 
> >
> > In looking at QEMU's source, I *think* this is because the
> > `gen_store_exclusive` function in translate-a64.c is not making the same
> > calls to `plugin_gen_mem_callbacks` & company that are being made by
> > "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
> > least in my case; I do see some code paths under `gen_store_exclusive`
> > call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
> > of them do?).
> 
> The key TCG operation is the cmpxchg which does the effective store. For
> -smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
> falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
> ends up at:
> 
>   atomic_trace_rmw_post
> 
> which should be where things are hooked.

When I open this up in gdb, I see that I'm getting the following call
graph for the `stxp` instruction in question (for -smp 1):

gen_store_exclusive -> gen_helper_paired_cmpxchg64_le

In other words, I'm taking the `s->be_data == MO_LE` else/if clause.

I do not see where the helper behind that (defined in helper-a64.c as
`uint64_t HELPER(paired_cmpxchg64_le)...`) is calling in to generate
plugin callbacks in this case. Am I missing something?

-Aaron

