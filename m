Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05326981D2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLRe-0000WZ-7h; Wed, 15 Feb 2023 12:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pSLRS-0000WJ-UU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:19:39 -0500
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com
 ([40.107.92.65] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pSLRQ-0002PT-T9
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:19:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCSvLUS0tw6xpdESFi1KjhYVZpZlNIvZVSVYKmCaWZOtPXymnt6GbyY1VffTFqb73/xGCaiGwOMNYD7qaTxeg9jKYIO1ym3X6c0IPvL8NhcqXNgov+WrNttX3gw4fzh2s78wL/i1Nj/HQ/fA3BgaysVdeiIw08sFpjPuioochjwxGYByauPc4XA/mptMB4tF9Sojb9IiFNMfz5F7D8PAasfCmKSrZBx/2OL18oe83r0jwyS0Pwh6nVd9MoEfiKI80JhPI1BNzKx8+gyAVr76sM+BSiypQ2PeFGR8XmRn0Ldw7VDYj+1NoAqXDu+hfCC5BhL9NYTILJ/VaZdlR0AKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NogQqx3ICd3jwp6xpOt6UODiW9p/SjESeYjQdxWhYpg=;
 b=KZsQVEbSsZXIO05ka5AlXA397Pv0UVfN/QPMqa5y4gJ6jQ5BJNPrDg20ngXq5Wb9bfGT9aaQzlysRLw3WQnfBZ/ZCsQeh9KO91f8BgAREJVRZBg1uWW1WlFIcUtxf7IV2W6nXVeG6P+VIKGknEdABW1ohrYDRfIrtnS+Hi0SK8pwO7Ah6++7HvAReLr3p+sn2whRdihe+DqBNwfwBaRRAB/e0mIRBdaHq03wgK5hX5wdrNSAIum2Ovk4DSsfV3dJVjhlL94iz160/St1vRUVysNnjszWFz5jhoWSvMapZGsNmfs83e1cuoFz8UljYLbCgxuY6eafffm2ucu4qyoL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NogQqx3ICd3jwp6xpOt6UODiW9p/SjESeYjQdxWhYpg=;
 b=pX6L0rkPoo1JAkhOL3h3QrfhNsqsb9xJ/B8Zgmof/M7TkxCOZA7adKUymBhmnZOrP90tJVoQ3k4lXCh10pHqvJ0n0QI/lYWRztexNLehpRly7ckOder1auwO7nPoQA30zB3V3ndQb0jmI0hg0M66/oNnfmyLNsHCvL838ILMlyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by CH0PR17MB6915.namprd17.prod.outlook.com (2603:10b6:610:18a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Wed, 15 Feb
 2023 17:14:30 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%3]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:14:30 +0000
Date: Wed, 15 Feb 2023 04:10:20 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: zhiting zhu <zhitingz@cs.utexas.edu>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org,
 "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: Re: CXL 2.0 memory pooling emulation
Message-ID: <Y+yhfFaQ4Kky93mc@memverge.com>
References: <CA+3q14z5pa1RPQuMB=6foVGcwgCHE+GME+zMES_adpVoDYCsvw@mail.gmail.com>
 <20230215151854.00003e34@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215151854.00003e34@Huawei.com>
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|CH0PR17MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e41558-2531-437c-9d53-08db0f78192a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0P1DR2CKrWwUiEbqUF3yCIBYbYet9DtJ9YMmjrQgWK0KQLSOlhJ+vV+NOIKnIpQiI+Y3Iom02r+B0AoW6BzMxa7qfFXIbgZP8BTRIcUuSanpgjHwnpYRMXOWcFkepHCKVtCec1T5Ny14jYZMOHEPGMnGJo6ifdhHPEY26oPzSesy5xaQeK5U0yoJ7EAMM6PDqnqcwOeCXTRDqVqZ9laxjJeN+Ig06KRkjG8gM46t9H2WkI9piIHQEm0sF9f/tOTbyXmWVczW4PtLFSzxAhr957jX5Fyrstn36uLSnfdjvPNS3Fz8ZVQZ+saHKBM07Sl2Y7CqPrTe2CI2UneTeCM+xgcEyJx7L27JQ2MbZnegDrziltMWmfjFNgCJV7WWqel2NNPhmZPKsHaBsm2NSj5vMY7hSHOcsdolwMLpmLrZj2pjH6lLUSgS5fmp9t9nu2KtDLosnPxF9hDMaDiBUWuXdec2c79qlaVss/chaNFxq87TW8ShTLgz0oNJ36weGrzpH5kL88DCZh7O/eLp1cu4cgnbTIADep64NiEaQywzm7p4IwE3CAC8+sP9X6pEEjx9yDo2OXclazec+0uPtZj0YH4U77c3jJbYys85qpgo7BrGPWKuGfsPX//7/AT98KEN9UkgZbUfXALN2e9FbvlECTSJQVUl2iecNDhmNdPe7muGDaAy9a2EJ4eULBHA3nUF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39830400003)(366004)(346002)(451199018)(186003)(6666004)(6506007)(26005)(5660300002)(86362001)(478600001)(38100700002)(6486002)(966005)(2906002)(2616005)(8936002)(6512007)(36756003)(44832011)(83380400001)(66946007)(8676002)(4326008)(316002)(66476007)(6916009)(66556008)(41300700001)(54906003)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hdxzy+sKZTVQEg9rhCZKI+uat407ioa/XpgjFpL83L6bA5v3wOOyXTAKGjKO?=
 =?us-ascii?Q?J6PEDpMR/gdXKaEB2jcuWVQhnKkVynUsH9QVrGvyM/nJFZ55pD73DlCDootm?=
 =?us-ascii?Q?OgKFwQswnrd4O/MfZODTx070y2NLMroOKr9eBP1xgeC+IE0NIcovodKS5gsg?=
 =?us-ascii?Q?/5TqX4KLXhco2qyyPb7nBUbaG/snz0OJkXtOwDsbHTM6/nskPwfPKXq91Ebr?=
 =?us-ascii?Q?R1H1WWkmGndBHAWtKsZ/eXzzIU5RNdwATD8oh88bA4E+lrTYTb19khs8qubA?=
 =?us-ascii?Q?YcwLeG+wDDelFXlBcf9Czo6+MooxoT/BcxtCS5NAAZ5jTf8hStJ3Myo7GW0Y?=
 =?us-ascii?Q?b92EolnEVpzlzI0LJEDG/LhV42J4JuMhulGrk3vj1NAbibkfESu1ktt1bZ3T?=
 =?us-ascii?Q?Hm7p4KoYlPRSDxJKjocaX2PQEpeHhI+cLzuRcGk27JUzCetCn10pmrM2vcsy?=
 =?us-ascii?Q?w7FGt9zTtvjzAa+woFgu+AR6rUYBTst+LRK/AL98tdADCGOUjy9mm56sBgLc?=
 =?us-ascii?Q?X23mcxVmxwGbJR1YtJUJ/jave+uPGpJnF9BuVcRymf/TuCprtSvrtdjR0JA4?=
 =?us-ascii?Q?5BIxup7nMWrqHGgmo5wM+VRbNIzn8DuJ3tx3YQ0mVUDT0HI+ROIsW+jrXJFj?=
 =?us-ascii?Q?sTTM2hQmS0Odk0Vs6fBPSY46+vDt4vVtOdGKR1OK8DsuS1V6prR0H+GZTpSq?=
 =?us-ascii?Q?LVe01XnJZvUDkmlIiqyKF7DDxU4acRb8DmrR80ARZmsuAIkJzoh3nHSiTYbc?=
 =?us-ascii?Q?n1YlaDfkrxE4n2PKgXpKkG66OOp15EOtr5R9xfc2Mvucyw0j9eBa115ipF/l?=
 =?us-ascii?Q?YrTZhnzfrWiJo9xlICB3vPvCdoKWjMa6akZksdHMGqp5hI/u4JktFtY4CYpQ?=
 =?us-ascii?Q?WhPRRChxl+bPxPtVRLPypXgxMoZvSeqpdHMVBV0sgVs8wiHvEUhUm7Ci32tg?=
 =?us-ascii?Q?ICTouZFVC5j8DD7ep/IOQMmyqIbs990BWBK66ZG7dltacTuIM4h6Ori1E1+N?=
 =?us-ascii?Q?KtKbOS21Qh+75Rr5tvSd4yOAvNrYt4vS25uEaznMtZcjtcAEVk/uUUTky500?=
 =?us-ascii?Q?26Rnde71ie8CtFN4OVrHHjAWEyc8lJE5els39lgMOK5sg7dKNE5ljr097J8z?=
 =?us-ascii?Q?oPHWQz55ZxVjeTj7FRKnIs193d5vckCgyuNvviZD/CKCweskcpHgL9GqTgDK?=
 =?us-ascii?Q?OQUK5pngL03FtJhSaRlRPe0oWdd5gfJK+cUn3u4bnq8i6k1hHzl4NdfuWHWN?=
 =?us-ascii?Q?kFrIGEp/sRCfluWE+ZtI88A0RMpBsvLHG9eN0jk+zZviMYcmNeNDyFThbMVK?=
 =?us-ascii?Q?1bO6XbBDEqqBCAVJcwzKhAHO0SzFF4iUB/nAQFJUL6aj7YgmPZU80PXQkzcm?=
 =?us-ascii?Q?lkv6LOIB81JoULyxn/LOIhCdVO1pGZ2lsiP2HQfVby1iQ/vhT067yfhYt4Kf?=
 =?us-ascii?Q?ldaBCbydF4K/vS61m0OMTr4MQ6P9fYsNRJzwKYQas1ZcS8meZs0q8srSG7XE?=
 =?us-ascii?Q?teVAv4EERd7kroI29RaJuQUHDe5bGommM9rEGtCQ68/sCB+Ann4fT3Y3msib?=
 =?us-ascii?Q?TOEzn5/eflvcCFQKX3z8xx8VF14zmc8LjZcZUCA+HXomFVj6aX7feZFrj1UO?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e41558-2531-437c-9d53-08db0f78192a
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:14:29.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG1tZBcp1d3vVOI1cRd1G/7R+dttJx2NAUqiqQHkoLF/6NCc06dZp2U6Z9YnePYlzjBCUXHx1XToYVl3LgyXjX8zBj1NeyfXDedKAUiPh1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR17MB6915
Received-SPF: none client-ip=40.107.92.65;
 envelope-from=gregory.price@memverge.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Wed, Feb 15, 2023 at 03:18:54PM +0000, Jonathan Cameron via wrote:
> On Wed, 8 Feb 2023 16:28:44 -0600
> zhiting zhu <zhitingz@cs.utexas.edu> wrote:
> 
> > Hi,
> > 
> > I saw a PoC:
> > https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/T/ to
> > implement memory pooling and fabric manager on qemu. Is there any further
> > development on this? Can qemu emulate a memory pooling on a simple case
> > that two virtual machines connected to a CXL switch where some memory
> > devices are attached to?
> > 
> > Best,
> > Zhiting
> [... snip ...]
> 
> Note though that there is a long way to go before we can do what you
> want.  The steps I'd expect to see along the way:
> 
> 1) Emulate an Multi Headed Device.
>    Initially connect two heads to different host bridges on a single QEMU
>    machine.  That lets us test most of the code flows without needing
>    to handle tests that involve multiple machines.
>    Later, we could add a means to connect between two instances of QEMU.

I've been playing with this a bit.

Hackiest way to do this is to connect the same memory backend to two
type-3 devices, with the obvious caveat that the device state will not
be consistent between views.

But we could, for example, just put the relevant shared state into an
optional shared memory area instead of a normally allocated region.

i can imagine this looking something like

memory-backend-file,id=mem0,mem-path=/tmp/mem0,size=4G,share=true
cxl-type3,bus=rp0,volatile-memdev=mem0,id=cxl-mem0,shm_token=mytoken

then you can have multiple qemu instances hook their relevant devices up
to a a backend that points to the same file, and instantiate their
shared state in the region shmget(mytoken).

Additionally, these devices will require a set of what amounts to
vendor-specific mailbox commands - since the spec doesn't really define
what multi-headed devices "should do" to manage exclusivity.

Not sure if this would be upstream-worthy, or if we'd want to fork
mem/cxl-type3.c into like mem/cxl-type3-multihead.c or something.

The base type3 device is going to end up overloaded at some point i
think, and we'll want to look at trying to abstract it.

~Gregory

