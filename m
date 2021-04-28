Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B00D36D905
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:59:38 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkj3-0004yy-5G
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lbkgH-0001vY-8N
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:45 -0400
Received: from mail-mw2nam10on2102.outbound.protection.outlook.com
 ([40.107.94.102]:4705 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lbkgE-0007de-VT
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:56:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6Hhg9qHYt6pwZdNvYENpGnDyLWzRin/g2C89Bklgyhl/p2BF5tLYiKnLRs8dioEKbnzR5LF6C7XEnG/h7pDuvqKZktznjwOSa5309INabJsGTgev5OZiP+eWfCXCcVqoX1y9wqW08ykT2lJXxOp2JVeJiBALO2fuLMqePXrY7IFbpLGOG+1L1g17W/qLA9vDuZPGbNaZqLniL3p4OSxE6/ialUIzWRh5sUxJeR7iiZUwKyj/ubDXGIHuVmxmZlBeS3u4UmtmtULHL80qC4RPlKLG/evXuluYeiTSUxGwSlcyFNykVpWOHb5E8LnweCfTZ0oWqCpTWlUOvdQs+DG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky3xeHnXQDL8eksVYCc8sxKMOxRX19+MzT3nV3lYMfQ=;
 b=ho3PCpWMv9zacz+SpWdpeqT0MLDwZ+Xb25m6DrO8J+1z3Rg2SGKKEamks2cN8Jn6b0OMA6npZIlu+irr+BdTp9IN+l39mCJXl9/zmJQ4MiP2Jabd9MfRmGUNeyClHDkeS2xhCbPQDvBl8cHTQJk2Yf5RLM8QUR8/sFriIjgvbIBKU1kDtiNFgpCeEUd5s2jhD9UyDO0Gbj+XZY6POvJA0XCXZieMVXBFKVNQfuKH0IUk8UJX+UwDADlpbMgexeAvqM4e3rL+xjf82nsSt0C3Eq3ePEFGkE2568dGXQfZYEhVREmIANOCbBvR+3vFwT6PxIj2aEe2Q1MAV4vEtvxGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ky3xeHnXQDL8eksVYCc8sxKMOxRX19+MzT3nV3lYMfQ=;
 b=jcuF9SBiQDb7midfbNpRa734eMLVznbFpNlia1zhMGaGceGRFvv+FwW7mGyPArpo5fldbjG1+2fvMSyHbct+tzLQ9VRZRgc3k8tePgVxh9AFAB2NHjPK0zWoC3UW2y0jwOHlE+O0ntV7Q6Mb+KMmDQtN1gHEMPc7I5D6nV6YtwI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6153.prod.exchangelabs.com (2603:10b6:806:ef::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Wed, 28 Apr 2021 13:41:39 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::fde1:7668:6752:1d6c]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::fde1:7668:6752:1d6c%3]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 13:41:38 +0000
Date: Wed, 28 Apr 2021 09:41:16 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Min-Yih Hsu <minyihh@uci.edu>, qemu-devel@nongnu.org
Subject: Re: [RFC] tcg plugin: Additional plugin interface
Message-ID: <YIll/FWzZbi4SelT@strawberry.localdomain>
References: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
 <87a6pp6lit.fsf@linaro.org>
 <2E8FB56E-AA11-46A1-8072-C43E8A5A854E@uci.edu>
 <87o8e1rl5w.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o8e1rl5w.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: CY4PR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:903:77::26) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR06CA0040.namprd06.prod.outlook.com (2603:10b6:903:77::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 13:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c518f0-cebf-48bc-a248-08d90a4b5943
X-MS-TrafficTypeDiagnostic: SA0PR01MB6153:
X-Microsoft-Antispam-PRVS: <SA0PR01MB61533E98519EFEB43278749C8A409@SA0PR01MB6153.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chUo01pyPS+FueEhCY2WtrWi9VKCgzIR2NRgi1upo6SI8CPR0i0sFHhnJ1nw5V5m3B8UkAInelWhjsSBi9yO32hSTPUAUG5+NJdQIPi/lSgtugL3m0UJhsOF8N4l+ZIWXmirP+ELgW9IIWbxL8WfyLcSmrnBpYKYBV0xdCXeNdaXzWb+OQc4Iq5tVlnzFk+3h9qoo0VyXw5kjkiVxjIfRdLESmKUM7mRw2xXSE0WLmbvP0ffprwTrFzWSPTAnDdqE4m/Z2zs8IOM6njUKSwqco5gb2Rtk+PjdYSYaBzgrGGe0z9aTPDEmWVzoUMchZYqoPhgXRhRDgYUUHQhVrHWm1cXL6/3ItJ39ERl1tU7oi2F87x5HiV3OtIJNt45ERYN6amG3adqOlccn0SRM0iR+KZa5gftJLA8uUGkmRgtxpmKb3KweBsRjIujH6O44c9tapq16fP0buKMvb3OdCzmPfYcL+HjCq7iuWK7GDRLW3ChlZQES9FCL/nsTBD1oWDYphZZbD9lJ4y9/oCLDkCfZgNv7KNG9QALJh4uNiTOpj+ZKsXqiEk0enJ/yGUY7JcjlaL0QjYVYzOtMv4G9wPf84cwTSBhJ47e0F2yAVwNA6ICiNq0DTUq0P1YCBT8F5XqTVVXwSY7pRbSi3rI1g1lWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(6666004)(38350700002)(4326008)(316002)(6916009)(55016002)(9686003)(38100700002)(2906002)(66556008)(53546011)(26005)(16526019)(186003)(66476007)(66946007)(6506007)(956004)(478600001)(86362001)(5660300002)(52116002)(8676002)(8936002)(7696005)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHF6NXp6MEJ5cWM5MERRZ3FxQlNBd1hXUXpsSFErZmx2NmRpNUR4WE5RU3gw?=
 =?utf-8?B?UWFvQUNQb1F6RzZnWXAwano4dUFDRXBSNUhuV1pDQi9KUTVWRi92dXBXRW5X?=
 =?utf-8?B?alMxTmVYandvNEZad0kxMGVjaFJaempEdEU2Skw0a043QkFYRStGNzFCOEpa?=
 =?utf-8?B?bXQvVVV6MUs3RlRXQUNBTUFDeC9uVit4eEIwNHN0S3A2UXVjRG5HcWkzWHY0?=
 =?utf-8?B?RDk3bzVCaUp5T3o1VEpNeSthNzQ3QnJ2elVkemY5VDJ4dVNyWU9kdS9VamIr?=
 =?utf-8?B?Z01WNVNoTkl2TlhUNngydXRQTTgwU0NXd1E3ckpMUG83RE5RalNkeEFlNjlT?=
 =?utf-8?B?SXA5SlFQQm5tdkhLbnV1TzZ1M0JRUlFZYzNJQ01ROHBrV1hwMTdoVlBNQklZ?=
 =?utf-8?B?M1NFTll1TnlBSWEzOUtieGZ6b245R3FlTWhuR2tGTDlwekVnaWRNWFE4cWpS?=
 =?utf-8?B?KzQ0YmFaMHpQQWh3MXNnSy91YjQzSEtQT0NKMCtyWUo0T05qOTNBMkVlZlJS?=
 =?utf-8?B?Vjd6bEhkMmdyUUFxemNKZER5M1VGYU1zRnRUU0FlbFBRTTFOSDlHOU1VMDA3?=
 =?utf-8?B?YlJMUjNib040bG9GTzVYdER6MEl3WlNEN25TdnU1cTQxRXZCOU9pTTRZTWI0?=
 =?utf-8?B?dG83aXQ2d0VnS0VlazZKMk9TaFNGV25ucUVscXFrQXI1UnB6TXA4UnBiaUVa?=
 =?utf-8?B?QktmRXZyWEt0K0xzeEdwVXpRTmtuQ2RXdEZObzNUck51Q0JqY1JOZ3g4YU8x?=
 =?utf-8?B?K3VRdzhRd2hyaW5iYkoxV1RKV2dKVnlrUDA1d1FkNkJVRExWdmZScFYySGNM?=
 =?utf-8?B?RVBtdE53WStUbVNNV1RHK2NTRXBOQnhjSk1QZzRja3NRMmk4OS9IWUljZFdv?=
 =?utf-8?B?ekN5eUV3VjRBWXhHbUt5S2JaZUY2bXFYRGMxbUUzQlRXeDhHUzlvSkQzOXJJ?=
 =?utf-8?B?VnowR0ZXMU9sUDZDcm1mWW8vdmNleGpieE4wZFc5eTlncVhYdVl3U3R5ZktV?=
 =?utf-8?B?eTdPNWxHUXZZVFMvVTV0czZVeXdzTXhsSzV3RndtaVk3WFI0WU80UlB6amVO?=
 =?utf-8?B?aUR4K3hhenZyNHpFNmN6bkduUE9CRkp0NmlzTVdkdHBaTTRncFd0bkVoMnhO?=
 =?utf-8?B?MXVEWkp6Z05UZGJ2Ulo5Q3R0TE9RWFlOOG0rd0pRUDRxS3VQRHduNGgxTFBI?=
 =?utf-8?B?REVHRFhXYjNVUyt1aWVkMTZiV3Blak1yWGQ3OWxhSGtMdko5dlFGR2JuYTVY?=
 =?utf-8?B?QTdXOUlMM3k3VlU5enU5MklUUzhxNVJuclNTZ2ZYakt2K3pDQjNaL0FGU2I1?=
 =?utf-8?B?U1R5a3NvNnJzZU5lZ3hoQXFMRWRmbHZpSzRwVlE1ZW9Lc2oxeGJrZmJTS2ht?=
 =?utf-8?B?VVNWR1hyS09TY01KeHJYTDk4Sll3eEp1NXFpSHdJQkRXK2lyVzU2NTB0eVlF?=
 =?utf-8?B?SXNMMU5SaUhQamUrT2ZpbjNIYVk5YzIwbDZHaGU3TFJUd2FVYUZIeWZJeXVD?=
 =?utf-8?B?OHFlQ3ErT3ZoUk5xWEd1T3c2VmF6Rlk1TG8zYzRyaXljVDVQQW4vdG9IeFNm?=
 =?utf-8?B?NExwZmY1YytHNEFBcXluakVMWUsxKzRkMnQyK1FLTnQyVzZVb3lILzNGcFUx?=
 =?utf-8?B?TzFLREFHYzI1QWJQVkYxaVBFNE1qMHRGbHpTd01tcnFpOWZPK0xPa2xDNlBJ?=
 =?utf-8?B?QUloK2w4UlY1MmwxOGhicDdCTmwxd1cyM2ZRVlJhRDhybG8rMUFZN0Nqejg0?=
 =?utf-8?Q?wOf78BriVxsqhm2kfn5A3ror8ae99mYOJVCwfvZ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c518f0-cebf-48bc-a248-08d90a4b5943
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 13:41:38.8374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgbS/Lq2N/zWdhM5soDK0CEy/egj4UOqaAuWNRw1oKki0w39XUjlYGV34IWG9qbCcKj0sse4k6ERLivEqsNW+6YbYMHYylXCoeD3P/QX5tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6153
Received-SPF: pass client-ip=40.107.94.102;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 26 18:42, Alex Bennée wrote:
> 
> Min-Yih Hsu <minyihh@uci.edu> writes:
> 
> > Hi Alex,
> >
> >> On Apr 23, 2021, at 8:44 AM, Alex Bennée <alex.bennee@linaro.org> wrote:
> >> 
> >> 
> >> Min-Yih Hsu <minyihh@uci.edu> writes:
> >> 
> >>> Hi Alex and QEMU developers,
> >>> 
> >>> Recently I was working with the TCG plugin. I found that `qemu_plugin_cb_flags` seems to reserve the functionality to
> >>> read / write CPU register state, I'm wondering if you can share some
> >>> roadmap or thoughts on this feature?
> >> 
> >> I think reading the CPU register state is certainly on the roadmap,
> >> writing registers presents a more philosophical question of if it opens
> >> the way to people attempting a GPL bypass via plugins. However reading
> >> registers would certainly be a worthwhile addition to the API.
> >
> > Interesting…I’ve never thought about this problem before.
> >
> >> 
> >>> Personally I see reading the CPU register state as (kind of) low-hanging fruit. The most straightforward way to implement
> >>> it will be adding another function that can be called by insn_exec callbacks to read (v)CPU register values. What do you
> >>> think about this?
> >> 
> >> It depends on your definition of low hanging fruit ;-)
> >> 
> >> Yes the implementation would be a simple helper which could be called
> >> from a callback - I don't think we need to limit it to just insn_exec. I
> >> think the challenge is proving a non-ugly API that works cleanly across
> >> all the architectures. I'm not keen on exposing arbitrary gdb register
> >> IDs to the plugins.
> >> 
> >> There has been some discussion previously on the list which is probably
> >> worth reviewing:
> >> 
> >>  Date: Mon, 7 Dec 2020 16:03:24 -0500
> >>  From: Aaron Lindsay <aaron@os.amperecomputing.com>
> >>  Subject: Plugin Register Accesses
> >>  Message-ID: <X86YnHhHMpQBr2/G@strawberry.localdomain>
> >> 
> >> But in short I think we need a new subsystem in QEMU where frontends can
> >> register registers (sic) and then provide a common API for various
> >> users. This common subsystem would then be the source of data for:
> >> 
> >>  - plugins
> >>  - gdbstub
> >>  - monitor (info registers)
> >>  - -d LOG_CPU logging
> >> 
> >> If you are interested in tackling such a project I'm certainly happy to
> >> provide pointers and review.
> >
> > Thank you! Yeah I’m definitely going to scratch a prototype for this
> > register reading plugin interface. I’ll take a look at related email
> > discussions.
> 
> Awesome - please CC me on any patches you come up with (as well as
> qemu-devel of course ;-).

I would love to be copied on any patches as well. I've wanted to look
into doing this properly for some time now, but have not made time.

-Aaron

