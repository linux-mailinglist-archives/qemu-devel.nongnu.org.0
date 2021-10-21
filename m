Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD36436C56
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:48:07 +0200 (CEST)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeys-0004o3-Ot
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdewR-0002BR-QJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:45:36 -0400
Received: from mail-mw2nam10on20712.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::712]:11846
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdewO-0004XR-42
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:45:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFlF2etIUtxpgKXD8JfpKGP1nsBoCoUXjCmYoM+oGLrGiMqJHXEFQg9pG92SIChiMhEun20a4ZHF5esaCKBqbMhmR+zs/Pv9GXmxF3Ity1sG6fYDSgFMiVLMBvG4qvAhArpa2WBQjJiyI1tZ70ZAvucmfFnNADScZFIhdFrkjq4lB0VF2T37R/fQQo8j+gvAXX5JiIaX0Pcicei3+L5N1bWFexOVGFGZJOqvYtBbnHh2Ah7ydsYiDi4NQwUaq2XY2Ba/1p5dYBScGmzvFIW8DxhsBiyIbL1XD4ZRcAgIo73FiMZq4nYR3cRMJYpC4Pq5naQM7W3AUhFSkzSPjpA3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkQ1WTBVHIVoLVf7ERzJI7FqvctGBKQxiCNlsrjVEHc=;
 b=kZnXyPplyTHjk1hQ+HOvf8klQrnCU5h9mI0ZpTpBE1evkJ+/r+AFmi4djXBbRgrOc0fyNoXdQ2CRAxPNzNmkx48xN8PTluz+ZE4FEP2gU21oyeEMwkUzPhPY1tdfA9e5ScMLmV2HwNPHQIerdci6mLvPd/LTPrZ+MVm7nBh/FQ2mLnW9qcmaWvsDa9izHKH4GPDkQJQgni1L4WshDB753Sp5YEJtQI9W/6COvXP2maBLcOjAr9uNyqOHu/A6cTTxeiZuFqAKj9/1e6boJR14ODd8H8v2YFa/mLlvUpuIoW9nRqyKLv6k1UaPvemvVVGT1f8R3SRTL2C9+Gi8W9yV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkQ1WTBVHIVoLVf7ERzJI7FqvctGBKQxiCNlsrjVEHc=;
 b=czzCVRwNbJEO++glU4J5CT7ofF0wDIPT8iHWhBTvTXUnVMvBIUZz8LbaqQUNwZMtwvLsCXTdkcsT794gjMVi8bLBQIY1p4XxJ++qC8TTLFXx1Ty6reO7PLkzZEeQWwVYTblEF2M5rMrLKv53u/+qORnR2J0TbhonkAxDAfJYwTA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH0PR01MB6827.prod.exchangelabs.com (2603:10b6:610:110::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Thu, 21 Oct 2021 20:40:27 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6%5]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 20:40:27 +0000
Date: Thu, 21 Oct 2021 16:40:25 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, cota@braap.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YXHQORB9wMncI5uG@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
 <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
 <YXBN4UZvY5ESdz6v@strawberry.localdomain>
 <87cznzvavq.fsf@linaro.org>
 <YXCA62xdRDeueQR6@strawberry.localdomain>
 <87mtn2tv56.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtn2tv56.fsf@linaro.org>
X-ClientProxiedBy: CH2PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:610:54::35) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH2PR11CA0025.namprd11.prod.outlook.com (2603:10b6:610:54::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Thu, 21 Oct 2021 20:40:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e56bbd-c3dc-416b-7a3b-08d994d303a4
X-MS-TrafficTypeDiagnostic: CH0PR01MB6827:
X-Microsoft-Antispam-PRVS: <CH0PR01MB682735AEADA3E22637DA02E78ABF9@CH0PR01MB6827.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+wYosbpr6QvWGFRllnTxt/wsSc4vKZfQi2Q1BeSArJTQN0IpUGS4Nin8EBQNSoKOvXPjUx4EFfygv9IDfWDSANTLV7gq51AgqhbJwiB6wAEMUF3vst0t3Xq6EEQ6wzTzKPuhc6Irxe5sWufP6dIy6SJeEFyqF3Nq8sAjQEQ9dSh3x3+9YG3rWcHuRrJiHPyuU95LHpFYA3IIf6B2wp1dKgglpRSCXDnEKgMx2tLoAjHawMbnuNPS/9NDReaQY8QBHVUyS7cX64wGrVqEfe7N+EpaFMwX2e+tBKkKeeuDNLhu5FXQFOXErjVuKQ7HqZ9njqjjxjM1bphPmC9p5yJYX9KtBVsvFzOVsvcABMeMshvhZBZtzng5owwiyKjCRbj9gwnAE0rRHGsN6XdR+RELwkZdERQJvJCK4eUcsEmq+UF8wko5ppesQOs1IW3zpYlU4dcaoRjGYQ9/8++zAJSjn2mvSnqs+w+peCEXrEV1EalKFCqBZPOO6B0keAGVOPXHQovAU/sE5Y/qxaVWWIWvhGJpmFpNgnfNpFoFXZOUHqNK92NCkuclQvWMsqONyPRCP7l6SlNDPc7TbKalnIEPFxRCuRzWQkOeAvwajpoUGe8WXT29SfTteCuZsfhQnt4SyaQztTfSukn7B7/vvdoUQZwQjk36zgt3R4NY4ge3xUfDejDe8tivEEukSTHm8QCbAOOm4S6UbDnceYHwDVUIo2xTlYt8hNU90p9DhuKHRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(26005)(2906002)(55016002)(956004)(7696005)(66476007)(52116002)(9686003)(8676002)(186003)(6916009)(38350700002)(66556008)(8936002)(316002)(6506007)(508600001)(4326008)(83380400001)(38100700002)(66946007)(86362001)(5660300002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kd9xgi8IFxPqti1IjE957xGvfNKvUsB2uSrflp2broXPLB5EILHuEOY2tq?=
 =?iso-8859-1?Q?L7Ow/+VdDgttVCSVKKNOttQSBxFrcL2mxYJBwOfY9bT1oBVLvkyjTd8nFI?=
 =?iso-8859-1?Q?YBlkRX4bdid4JOwbtQRAKOFZABeY2uCIGnivNZW+etdYi7PKMzVzQJgToV?=
 =?iso-8859-1?Q?EHzO0pcU37Bb8Cf/qyxpnAGBDCLg0P+el2JHjl62xU8fgYtgOV4tEBx6GU?=
 =?iso-8859-1?Q?YKuZ5lNMJ7fegHznhaJ8qr1wjGQuhp6Afcn1wk9MpzKR8WgVF5c7uupnyN?=
 =?iso-8859-1?Q?L6eEiXSt7Dpsk98sPCjxJqN114g3U/74EhEATJaMmclwCihamggibmzvIu?=
 =?iso-8859-1?Q?8stx9UcnToH8IYB+H0YLw7AnIZ/654nkHRunihVbhiEXtY+x0bADmndMVs?=
 =?iso-8859-1?Q?VipiVQI5MEs8u69cJhhqAE5Ci3KeyINau2U46gMqWh6tbDNLcRv3BfF17W?=
 =?iso-8859-1?Q?5/ckGC4VHM+blB1IPsrKg0ozCNcHQzwab69mp8BQMngA9nPgjGBpDiJ4ax?=
 =?iso-8859-1?Q?nlD0MC5v+flCvYJDSRItDiBxWLRsNv35vxgQaEMZ5PnhbNWec8J0X6CECP?=
 =?iso-8859-1?Q?s84BlTxCt0mQxmhMRuVnMPkL6fwDa2cwtR0XhdOlUR8V33XConMZpztlgV?=
 =?iso-8859-1?Q?H5kdmAJMi/CN0/AsNdqHO63RgB3ROLu2cTRu80BIsjIYFQ+E0RILpYV79o?=
 =?iso-8859-1?Q?oynpr2xCmxcLYRqW+NIZWUI+vz+xionE3ojuTNuyg7qKzhbVoDqvove3Tf?=
 =?iso-8859-1?Q?kJF02h3qN5S3lxccxEVbNXzg+9GiGMfF327OrXt10wVTor6iCC+onRwHa5?=
 =?iso-8859-1?Q?jNstcj9E/wsh8eiHvuZxYbAxTvVfJy9qwask1IdYc+U0Sd2l/+6k5fS5ld?=
 =?iso-8859-1?Q?O/agicQ8bynUmCtYl+ls00+J9Fw5jmgYDxR839mS9EUISuXkjJhEvSjj4J?=
 =?iso-8859-1?Q?1vz3/R7dDu5l71K+FQyie5v1x6mPkYf/zOXExNyAEEJ+L6h+jOSeru1eDs?=
 =?iso-8859-1?Q?oaGPB1KtQ/4kpYpvN5Kw4dnXHllT4M1mJiOurejGbZANrsJumctjWoCW9Z?=
 =?iso-8859-1?Q?tT03lFqGdR541gFvVHTNNbljir23P9V5s68aXDmbV1PmLiSGlOIUVcn6eS?=
 =?iso-8859-1?Q?VbcBZhAE1VundB9baHph6orQ+1xlbxGrWLGr1XijhMqkLPE99Op59j4WvW?=
 =?iso-8859-1?Q?ZJsis4IzIpPasWpPLhlXdAWpGcyYphs2aKrUupeltgMqE4bP5fr3E0e32J?=
 =?iso-8859-1?Q?rKN5CbUMm/G/fxf1h5H+MQnJBHaynjZLOGWkzzWKlalq7GJIboHGvg5Y2O?=
 =?iso-8859-1?Q?WA8Rlo6p/gFZDO4yx7anVww+PhIAtVNfVR6LmB0PrNBKhzTHVFziW5gq9a?=
 =?iso-8859-1?Q?nldYw2d+cl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e56bbd-c3dc-416b-7a3b-08d994d303a4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 20:40:27.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aaron@amperemail.onmicrosoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB6827
Received-SPF: pass client-ip=2a01:111:f400:7e89::712;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

On Oct 21 13:28, Alex Bennée wrote:
> It's a bit clearer if you use the contrib/execlog plugin:
> 
>   ./qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin  ./tests/tcg/aarch64-linux-user/stxp
> 
>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load, 0x55007fffd8 
>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8 
>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>   0, 0x400924, 0x17fffffb, "b #0x400910"
>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load, 0x55007fffd8 
>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8 
>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>   0, 0x400924, 0x17fffffb, "b #0x400910"
>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load, 0x55007fffd8 
>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8 
>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>   0, 0x400924, 0x17fffffb, "b #0x400910"
>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load, 0x55007fffd8 
>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8 
>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>   0, 0x400924, 0x17fffffb, "b #0x400910"
>   0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
>   0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load, 0x55007fffd8 
>   0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, load, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8 
>   0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
>   0, 0x400920, 0x54000040, "b.eq #0x400928"
>   0, 0x400924, 0x17fffffb, "b #0x400910"
> 
> Although you can see stxp looks a bit weird on account of the loads it
> does during the cmpxchng. So consider me stumped. The only thing I can
> thing of next is to see how closely I can replicate your build
> environment.

I apologize, I had apparently gotten farther behind upstream than I
realized since originally encountering this. I tried the latest upstream
code and am now able to observe the same thing as you. Somewhere between
v6.1.0 and now, the original issue I reported has been resolved.

However, I am not sure reporting loads for a store exclusive makes sense
to me here, either. My understanding is that the stxp needs to check if
it still has exclusive access and QEMU's implementation results in the
extra loads, but I would expect that the plugin interface would only
report architectural loads.

Is there any obvious way to omit the loads from the plugin interface
here?

-Aaron

