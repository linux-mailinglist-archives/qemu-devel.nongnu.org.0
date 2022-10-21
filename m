Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D71607F4F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:55:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxUS-00024j-Me; Fri, 21 Oct 2022 15:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1olvzG-0007L4-Hg; Fri, 21 Oct 2022 13:39:16 -0400
Received: from mail-bn8nam04on2107.outbound.protection.outlook.com
 ([40.107.100.107] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1olvzE-0003TT-IE; Fri, 21 Oct 2022 13:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzF7Xq9o7HkvbI9pyBw4rQWMj6MBPXUdyoGSCzm7hy6yZgvNj2pW9r0PkBU0toY9ukmO/AxOQ8HJN5vUdMhvHbnmNa9GeJky0DmfNr7J8NEdayHUjlyJw4O/Vwlfiz9n1pO3kgCKl3XSqyhhT2sFierbT0vCS9z/c1NOjsjmAJ1VV/2OOD9Br/klPhd/7ZLJFycXeTK6D/77wZMkuCZmM87AI59tGqPEJ3f5EOp0vrIKszC/BUSRBUJHlwhxOUqZahAGgZEbDaPmWio4u/IEZkL/RORJTwW8KtYaGKHex8BoC3gL4YWTfPBx2mgoIBJQIJ+l4RFrjw0KMiQlqmDVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv0MEg0RmtWFmu6yPxrrYHs1Xxz/Wv+5G1qzeyM5Tpk=;
 b=Eay4mg83BGWuR6WnpLQNmxWZIheuY7Zpz89O3nZ0cOmtbXL/a3Hqxd1ppy7/xbkunRZioTDVN0lFanOqti6eih+nRiONeNkKVOGbLT78kCDGZL6pN5qxWdUI0unKpcbeCiaPO2POTYtmFBGblRQnSWBlCwwSEuYlOCzCdtV22yr9alUEq5lSo/lovwWv9LIVt+5775viF4JVyLB3hkztj73IpNpKsaFDnCyjY1jqZnRG1oylfLeNrbHfEwJ1NwXvttaRwwcHnw85I2YThUK5wkO+671BCOgA/4CFyBGkzJiVu89JIRn/JFT7+meYDLgE6GVTf6ZDjqSissPaUCNWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv0MEg0RmtWFmu6yPxrrYHs1Xxz/Wv+5G1qzeyM5Tpk=;
 b=pP3MG4GbC/dpEeletIuSr33w8CABfnOegX29KXGz9tIDCdC2WgQS/PcLKPz4mPCzWhqi+LA9Gw796h5QNHTEY7JpLWLmv0H8hNSjJg7j//48ACKY3ZhU5XTQ1W434cxmHhtyZUg/4Sx7k2OBjf4o3Ps4mlCXRXvm2BRP2m72kz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH2PR01MB5926.prod.exchangelabs.com (2603:10b6:610:3f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Fri, 21 Oct 2022 17:39:06 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::aa43:6c60:26f0:d9c8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::aa43:6c60:26f0:d9c8%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 17:39:06 +0000
Date: Fri, 21 Oct 2022 13:38:53 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [BUG] AArch64 boot hang with -icount and -smp >1 (iothread
 locking issue?)
Message-ID: <Y1LZLeK+yGWoUT3Z@strawberry.localdomain>
References: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
 <CAFEAcA-H+OW+sMTTsb-sOKt_Gm0Fhg4iTbGHUYfVysNDqeYG=w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-H+OW+sMTTsb-sOKt_Gm0Fhg4iTbGHUYfVysNDqeYG=w@mail.gmail.com>
X-ClientProxiedBy: CH0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:610:b3::16) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|CH2PR01MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5c6e1f-20f8-4a68-b0a5-08dab38b26ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBuW4x9jvVu6fSLXPxU7FbqOLJqkycN1ialMJv/fqjMeSxkdfzA5ByZhvW93cCdk49B49GYikOtoV4/I/EObBBboDSabd+6TLwrQ/dW3SmbbZ5T7dZ01N9Yrbp1pAC8u17BscJTBXyd+ow/xm3kH8gelSMrrisVnYm6oEQPv0hbFM7wHkfBUDr0EIKV5P2m++ZA6YXqzgR4xqzJVG6uiy69okGMEXWFRX1wQ9f2mRSqLVJaGwMJicuC2brcKH+TB0JKOVA+zrGIhi1YZI0aPVGjRY/e4Jy9q61EaNffHznsDYG0q7dfya6iaRvUb1RGP8KmI+KPHlVju1IICAkClz/dHQUUKFBsVdCyGwJoagyY5tF8IVIY4x3O4xnpM0EA6IZmGFwyeV5Mu/Asxj5Yy5u8IebyehSszK57DCHzXJmnG0BxrcppHchoS413+w0/MUdHyM90vOXBF41PpeKo/vFVzLuhddWY5EN3fyWNjhsXzCetUALdcz8sH+QHWLHZtj+2ouFSK/svA24j23qTIFQi9zIvnII9LfGxBOdTW/5Z0Zan5LdPs12M2Z2Ip7Iwyw/hWmCnrTNVT53JyLgylKdYEaazceaJPj4GoY1shYu4hB9wC0TBtnCpxvL96NpZmhuZX1ifA4aH1M1bB9gntWbliqhp8/V3PzaAyMcGp88FsE4RNBG7De+eoxnvXb1wPVrIc46LcO4ZZm0xwVms6nuqTKbNEfnZkt9FgPL1VZw3/wFvupKDaEY9XiQIol3T0leV9QZkn1rKGyaKlh8COo64Rh4okcIsAYbq4KpXRb/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(451199015)(38100700002)(6512007)(6486002)(478600001)(8676002)(186003)(316002)(66476007)(66556008)(4326008)(6916009)(54906003)(6666004)(66946007)(5660300002)(8936002)(41300700001)(26005)(6506007)(9686003)(4744005)(86362001)(2906002)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4/EjAxbM9S2D2txEHSPJkqP/kam2aiS8YY9yoWb084+AF7wfwVkP+MpG7uEN?=
 =?us-ascii?Q?TZUuUi29wJtx4X5mymuMho0S0uN1yGK0WjCrAQ+eu9pT0YF1RDxcjTern/gF?=
 =?us-ascii?Q?E36H/Hb8gvwX1lOQ7MxFjq180sx1v3bJEBSEvj/sz/WngfPw1+mZj85ab5N8?=
 =?us-ascii?Q?cckL0uCQw00OserAtx6ATFbhQDzEahObFNMfePrMcF+SCMsm/FMsTUWUBopV?=
 =?us-ascii?Q?DpNGJjYcJxLGbczujb5YkUllnkB0aImY0FcRt5NhlbiXchnGv4MJ81RIkKY3?=
 =?us-ascii?Q?NKZFTUFHgncszH8zv1ndbds3uXVFi6LdEBSYIGYL6u7ipRSkdJppBneIVboI?=
 =?us-ascii?Q?ia2ZA69fJAG680taAdzn6GCPBufDdFHQYnkV3cMkfdawRWMkesmy+2YM3tIt?=
 =?us-ascii?Q?CKRPSZ6R41NZZiMKm6Urj1IGwvBuLVcshrp3oDCADsEJt1E7DJ42rv/LScbj?=
 =?us-ascii?Q?EcDYOmYlLTNfoEzdjMNf1XrOQoxPJcHKar3SFaOPiKP7Ke5+2SKVUXcY6fQK?=
 =?us-ascii?Q?ZSopZnO3XH0g4VmSFse+ST+HeA/93y5Bwa3ljZa3XY1q/n1pZ1YlAkphQ/cx?=
 =?us-ascii?Q?vJV593DhbSAjOhDMuQ29QJJ6gZ/DbWCyHlZ2kzMmItBUd0i2ULCpG5nl3unf?=
 =?us-ascii?Q?M7VSUjcheZ/KVBw3vv3BapunJqoGs8jXdwhReYzpK8KAN3MBsBfyOkf8EaQU?=
 =?us-ascii?Q?KATv0ldLaJiN5+8rleg8gNhk2Ow0XgPfSWMWBt/UNAO+1SnH/dXEgHskTzLp?=
 =?us-ascii?Q?2OyAuOgzL2F4ykhOep8wRYEMzWgXbM8GqQ5rFvq7fP1Pk5XGjCmxbf7aiXBy?=
 =?us-ascii?Q?eXtZpvTV4bC1WbwyXhFWBv90NeMezDXvnqkIT4z2c58ON9VMbLaZYfIayyyS?=
 =?us-ascii?Q?x3M3CAdrwaFYQ3n5hjHNfXrr5TAZMJjbZt9imPHczbqBsH8BlnlxQbBhBhKw?=
 =?us-ascii?Q?IP6cwUBQG4JO8wlhiSfQBtAFZdPhH1tQ2zQ6fLbgBU6LO2N/0LzQ25QWhdLy?=
 =?us-ascii?Q?7kpdg0/VcHppWQ9Um2Qb4f2IfUR/GpuWFmIcK3eXOdDPVJXOnv8GXjSkDUeA?=
 =?us-ascii?Q?Hh0wTM4plwkBVaaHkZpJQHWO12nNdbpE/iZhCUqb3LnMMbL3JkMW+IFmrUw/?=
 =?us-ascii?Q?JeiV86gWKzp2ADe/5s+NXcTx3iipSd0LJGnQ09gNQrrdFfKIpGIW+NuvpT/g?=
 =?us-ascii?Q?FOZvyFtaejyp0/Qfkfu+PIfKVeHt/OMgDYU/L9YwDgm3IxWyqXYgBIliyG2r?=
 =?us-ascii?Q?o/9FfXS3ovtDow3jASLQkVOy9GxCIKwYRGHjuasjDeGgSddy0ddTTFtLTdFa?=
 =?us-ascii?Q?k/6TxGDE9Za2v5MOsWDPoNQ2Pe4G+ZpSu8yRXZQYsRXqk1RgUAz8mudAH55f?=
 =?us-ascii?Q?64B6Mu6ko95Fu/Jym/YnlFmvAVJTOpIPrfTxOgEB08D4ARyEt9p/tXIXeQKv?=
 =?us-ascii?Q?/0Jf5eR5pSO2771CmmGXvNwvhjZgQFjpmLGxnS+ahSmULyIh9BZjqyz17gxz?=
 =?us-ascii?Q?xZWzlrQRWgegHg3cgv+hnQ+DpqKAEA5vcN1aW3IOjbGur9tTea4ekH9PGCTO?=
 =?us-ascii?Q?T97OVWWGJB7TiCiE5Xuy274yfTrmIVYl45WfFD4qGI2m+DQ4+mQX/bBmBn74?=
 =?us-ascii?Q?M5r0dXbIVJdiw/TdNEYTpJI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5c6e1f-20f8-4a68-b0a5-08dab38b26ee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 17:39:06.3537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFP4WO4JNuEwUqQDo46d2DaWyx/MUn7pSmpxgQqu6Wtxg6kNKv2E1YC4wwTVGJVAHz+9nwG7GVsuV1AcHS/Ey/WmDwdBc/Ufdc6yqXA7CqQDbkUxKH8c0+SA5c02K6Lr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB5926
Received-SPF: pass client-ip=40.107.100.107;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Oct 21 17:00, Peter Maydell wrote:
> On Fri, 21 Oct 2022 at 16:48, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> >
> > Hello,
> >
> > I am encountering one or more bugs when using -icount and -smp >1 that I am
> > attempting to sort out. My current theory is that it is an iothread locking
> > issue.
> 
> Weird coincidence, that is a bug that's been in the tree for months
> but was only reported to me earlier this week. Try reverting
> commit a82fd5a4ec24d923ff1e -- that should fix it.

I can confirm that reverting a82fd5a4ec24d923ff1e fixes it for me.
Thanks for the help and fast response!

-Aaron

