Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2225FA120
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:29:55 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuj3-00042i-Or
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1ohuee-0005Ol-Q3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:25:20 -0400
Received: from mail-dm6nam12on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::61b]:13024
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1ohuec-0006D4-OO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:25:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJBVVn0OzgKLLCIO6jA70YD4dCEqWgEWv3Hl22ParwNnyhRZpfGn+KOO8jHmVHPU7jn8F/IyDTE2sqhtT7w5dgWpZRrACr4AZlZ8oIWHojJSIF2GtSc0Hk7uwQsBeJ8ZUUSywPnLx76BzP1/K1imBzXO5CpycxYWoZCqjbzyz0Fw3pbfPJupHwSor0k45oogV7Mkbx75vykw2BtgkLTfJV8UMtXvMLvfewDwKK1jvB3C12OnHaE8EW/DCp68NO/6fgEWjJak5SqmbTF8kLRrZIjmCZzn9eHayRuhmquVHXEZdGmRevZR23sCwHbejrwiZFPGlUqqr28PWOdv6V1c3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlf1FinGQXSydo43OvVR5d4r/kmG2pLF6e38srocVgg=;
 b=IbZQ+NcStYLXssn14AK4sMb6wLChA3dkyEzs2qot0xp/370UqFdoKm36G25Dt6QxyOZN5fgjWWUx7RIPnfSly4s9KlICSgp3DdL2VjyzSGg7FEegxjLFEdrauxaf+7W45fENTWDwHPMlLVhbX+LleQNbXg4Y/5KFgYshcMEYzOK+sw9G3+pypbKHF/LKMGE4lpRRyqv5/Jkgx4ibJrB/YJ5ImIhqbm2cAlRiI6pdA8wyRgUg2d0zioiGl5ThntReVFbq3369Pb0rjBk0ey+a8evCO18dZxzp80sLDpz3vguHH10an6q2QSbnLA49B076DUuFwNJxo4tAiZA9vJxd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlf1FinGQXSydo43OvVR5d4r/kmG2pLF6e38srocVgg=;
 b=s5jhZOPVwFeHMTF3Jl/SEPfaTlBge6G5xL0E8z4zhBg1P2nnndMaf/EggPb+z9a1VTxme7SKd9HHlZxpDHX6wnOB4+saoIgJPiirlVXlptOQ78ed4tckt5bO4zElAPhTiIyDzkXux390X9z3z76994y3Dj6eAZBu3zPLBoVVcpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by SA0PR17MB4268.namprd17.prod.outlook.com (2603:10b6:806:e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 15:20:09 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 15:20:08 +0000
Date: Mon, 10 Oct 2022 11:20:05 -0400
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <Y0Q4JWa6hddtHIcO@memverge.com>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <20221010154343.00007afd@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010154343.00007afd@huawei.com>
X-ClientProxiedBy: MN2PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:208:fc::34) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|SA0PR17MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a26a2d-c167-493e-1d8a-08daaad2eabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+rcO6NsTQjx8aHDvJXxdtUGLtKYTe1A9mODFG8cfha4h1qj5N3eezqHsnHW7b3If76IQr3bxpJSVxiD8I5lj87dWKsqaeajz/vGfm562CthJfbD9AkSPDiZyI7Cc6kR8m7Fgc9JYrQLyLBPTWJlwD1pfSGl8uhQnMGkucAeEthuxY8MTYbY7fHptb0pbgqbkU7+58yy8wJ+2qYBGRJCzRvlmJs9UbbC1b+t3KI1K53vYl8TGrzi2IYvsr6u3UZX36gAOD+Y6EECJ5kNpLPqni6xiWVsc6DSNUTuE85iP1VNVQ2y8rMiom9qNqvWrv/OtWDDYPkT7daDotF2IwkTWgBTxRJ3YbgsUQRDrL2Q2Linu8ZBuJgYNP704WEy0kpgdPOgyMoc8Mt8EKhe7X5ZizqKdB6iGN+bEor95YZBILjHzQyoi7f4HB3+wIwrzyfbhSvZQwWRO0ZuGTHNPawBwKCs6EcWlnTPZcH1GFtQ2zealAsX2CwZM5Bvb6veZ9BOCEAmHANeN6ZkkpZa+vRwZt1RFtKf9gUjVCSQ82AkoGk1zNTLUDyAG+4sCEcvKopvSh/rtWOFJrali48VeGOXgDvNwZ5ryyIIENlIR8viqwsW+qaft/MBsIbOgRCM/v6Eegr3bWCm2KNTTxgdgrSray6dTrehvhfTAHgnznmOSBuupn2eaZNGnGWmTYsJEWzD8Bh3L/xctJZKrGMCX3FsXsaePb4diDgVZThJrBqkuQIXbuALLc7q87zAuwsGHPNw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39840400004)(136003)(376002)(396003)(451199015)(316002)(6916009)(54906003)(2906002)(6486002)(186003)(2616005)(66476007)(41300700001)(6666004)(66556008)(66946007)(478600001)(8936002)(8676002)(4326008)(5660300002)(44832011)(6506007)(26005)(52116002)(38100700002)(36756003)(86362001)(38350700002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fna36Eo/bQbcn3xaCPgjsZd79tzDGQnZXFyzL7seK7y04cY5v5UJhlUSr/Io?=
 =?us-ascii?Q?8Z99Y3mJ/xbLBLVcrF6I6wVnSoDBgOJbTXlC9Z4tHit1hGikenRi5ZmJH1O+?=
 =?us-ascii?Q?HEEvkfZYJ4arriqYwXkiQj9M9pF5hUwaddUpQXgd/Tm9Tt0IvKNcOS8NA27Z?=
 =?us-ascii?Q?tTI8qYbg2IPnDt2i/DGrQWt5nSWip/Xkg5CyKRA6utrxJUqCNQZguuoi49Ox?=
 =?us-ascii?Q?iQgQ6IVMk6fs3k6G/or2rQ1rBZtV7/mjJRSuZr/HtFBWeK5lX4cVIesXTRiL?=
 =?us-ascii?Q?Xxul+dZlkIFQeMXiK59WzI/EDnCXCgvxgVAPLg0e81nKfR/bJH4ByAQ446ck?=
 =?us-ascii?Q?Xd3PfZugLPLpwakeYqHnbxhE/r+zPm3ZLPbgGEMvd1KxmV1Bn0MSFUZiA9tg?=
 =?us-ascii?Q?rvwbjsskyHlZnDTw0i0SOh3JrTB7jacDjKnkCAYMcM4aLor7eSmilb5nmbpJ?=
 =?us-ascii?Q?tmpMtpEOGbG+RbaSzT2jL2mF/UR2RXahzhFe3GDCJ1gTC4i1znZQURI3NYjE?=
 =?us-ascii?Q?N1kxrm1oqONIlswTXl9fm7eMJJrEnW8Ttzd7L6+/6qBBqHZT/nxIiR2qUC8N?=
 =?us-ascii?Q?esjPY4lq0q2E72PynbLjjhWIiLFyjeJNTG/Db+EQKXGfqLKDguo9LW2sqXm7?=
 =?us-ascii?Q?P14doVU7ApteSgEy+vlEOCzJ/8oPbhTHQEY+0o2V2QPOGzujDZbMS5Uui2sS?=
 =?us-ascii?Q?4XE22vuidlp77s3DKrx0f+MduxaDQSgpkO+uYW+rHjfrLdHl2pUtYO/HBshH?=
 =?us-ascii?Q?93GEwIPptrBVzUBmc3j2v5ItN9l9fLsZgPpASfrkh61qI15Vy+Fhy7gnmfF6?=
 =?us-ascii?Q?fkhwgobeWvPj2vwHwfncSawISsNKDGdyqbxQ76dU/QYG2ywZenRFRfznhlh+?=
 =?us-ascii?Q?gjMulrT8qSUr1ntqyO4RDozu8GaXO+KIIe1vcNubGv3vFgVuYN061x4BTeRF?=
 =?us-ascii?Q?DcWU4+gStwZDVhibyQB2Cphya5Uy7f9jLAj/FZawzrUCOo1CpZ8oeRkk25wU?=
 =?us-ascii?Q?oGvnxCXTDVJWXvX1XhO6EQVUGnxhuNCQhhZqH/kDb0eMwNL9/4lXtPJHwaIL?=
 =?us-ascii?Q?GSgk+HKQFiXnGnY1BfehvCaY6npBGo5hM4f2fo6ekY4N4yTDiujIbibZD4Hk?=
 =?us-ascii?Q?B/z4S3xgSMITB7+UyGDJBufGTUGt2eZkYfu+TrdP0WBJtVtUjsaGEisUFFSJ?=
 =?us-ascii?Q?oUsfvqiTw5VnmUUUEVgWARc/DAl4qF/OREgatR9IDb5V2P+sgwSMSjy3g4tc?=
 =?us-ascii?Q?VSOZ+uW8x5Hjxosg5FEJ9sF2ElPS57eP0T919nCgvtDgYv0/AbZ2+YmMDu7E?=
 =?us-ascii?Q?9AQ7ChRm0d/CWWGRecnwiSUv0rnDB63er9IZg4WMDl+HuLKyGJoVchJtXn4q?=
 =?us-ascii?Q?6vGIgg2uFxxFiS5yXb3xiZg3HLboYUDvMZgJnIMOQpFSPqbCWkEZtzX8TC5h?=
 =?us-ascii?Q?rJVkXHBmgXwm8YVhbAraTNDHtKb6tdfOST9TcmmGdurdrlwcW6rDokfoWJmY?=
 =?us-ascii?Q?tN6KhoABPs7y8BeCPwOmlTW048dv+IY6tvE/JgSQiwa8JcvtQTWrJ/0bZ++P?=
 =?us-ascii?Q?IEn6MrWRQQk/v+qFKphz4IO1ga9OMfXIXpDl8uRQmc9DnLmdV+PGYpaUwgcN?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a26a2d-c167-493e-1d8a-08daaad2eabc
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 15:20:08.5178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44mQWRmIdecuBmFdq9FPiGfYE+goxDDb4KwaTlZYTYQPTV998LWSxt8tlxMhF/v+85Bz3SIQvjaklZxXuqvNqqlCm34iEXiY70AtICfNKto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4268
Received-SPF: pass client-ip=2a01:111:f400:fe59::61b;
 envelope-from=gregory.price@memverge.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > 
> > Maybe we should consider 2 new options:
> > --persistent-memdevs=pm1 pm2 pm3
> > --volatile-memdevs=vm1 vm2 vm3
> > 
> > etc, and deprecate --memdev, and go with your array of memdevs idea.
> > 
> > I think I could probably whip that up in a day or two.  Thoughts?
> 
> I wonder if we care to emulate beyond 1 volatile and 1 persistent.
> Sure devices might exist, but if we can exercise all the code paths
> with a simpler configuration, perhaps we don't need to handle the
> more complex ones?
> 
> The sticky corner here is Set Partition Info 
> CXL r3.0 8.2.9.8.2.1
> 
> Separation between volatile and non volatile is configurable at runtime.
> 

Set Partition Info (Opcode 4101h)
... snip ... Paritionable capacity is equal to
(total capacity - (volatile-only) - (persistent-only))

By definition, volatile backed memory can only contain volatile regions.
That's simple.

For persistent-backed memory, capacity can be chopped up (iif Identify
Memory Device reports Paritition Alignment to be non-zero).

--persistent-memdev=pmem-backing
--volatile-memdev=vmem-backing

By default, maybe we should make the entire size of persistent regions
to be persistent-only for the initial prototype.  This would let us
merge without support for Set Partition Info.  Then add an additional
argument to enable additional argument to set the partition alignment.

--partitionable-pmem=
  : Defaults to 0. If non-zero, up to N XBytes of PMem may be
    used as vmem by the operating system at runtime.

On the CXL tool side we should then see the following output for these
settings:

--persistent-memdev=pmem0     1GB
--volatile-memdev=vmem0       1GB
--partitionable-pmem=512M

Capacities:
----------------
Total Capacity: 2GB
Volatile Capacity: 1GB
Persistent Capacity: 1GB
Partitionable Capacity: 512MB
Partitioned Memory: 0MB

Available Memory:
-----------------
Volatile Memory: 1GB
Persistent Memory: 1GB


Then Run something along the lines of:
`cxl partition-pmem 512MB`   (or whatever args are needed)


Capacities:
----------------
Total Capacity: 2GB
Volatile Capacity: 1GB
Persistent Capacity: 1GB
Partitionable Capacity: 512MB
Partitioned Memory: 512MB

Available Memory:
-----------------
Volatile Memory: 1.5GB
Persistent Memory: 512MB


Thoughts?

