Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C930D267
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 05:17:31 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l79be-000093-Cl
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 23:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l79ap-00088v-G1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:16:39 -0500
Received: from mail-mw2nam10on2091.outbound.protection.outlook.com
 ([40.107.94.91]:15456 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l79an-0004yO-3Z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:16:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXiFu0Q/31OX+ucUiR/6kHPODma5/uSmmsgw5cO8QggE3AuoJaQe5tLtnv+8QkRaVc1MrB0m+bqkflp5tN5hIQBcOiInecd2QNIp3l0jIKONanZQYy7Qjy/5IkZABw9ZCsBijCCgPaX98YvFU5WQRizkssBW9CX31Y/qnEWvpBZ6vczFUuDmkhya7Vl3oFloILhPVflgAz4ZWGEq4pp1Be9si0BMCAdv0NYyle2RTLbQNHIaOyI0X32rnTv4Qf3bI96svtgShPwK52oEyqSQv2EuDqoUujQIacG3S23ndpSBCy0TPe1AOPuMXmeddG5Q01R+k8iXqtfqP7s6IP5jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cazSfRoDOcOBMrIPzZXYF+Ih+L29cn4RjZl/P3IxdQY=;
 b=czuxagDrkWAoYoRdFUv/YXNJeJ7HiEphxnaVZDfyd6/3BDcmOSj5TKMmANMEyL/5ncBQrCZHeKTILMpfkK8ko83U5XuRuyZp07/c3SptUrYSd23peuDca5LGipX0SCE0vHLxin4BOSrIibvLul/3JKtJuoMKOr4r40+zYMeTttUZk+SHyt5NMJB9XpBhOmN4qKw7BP95jChirO1YiYWxNhVJ2MWRT8mQ+cW2cdaDFSzwz11Eu0x4RdNGWNllournbH3QLEJVLudlL3/6HpiKOPBdQ2V0j6chgel5lYP4rn2eMTz0AU/StpNLy67rzxFe2Iydb4A5APYFCfQARvQ/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cazSfRoDOcOBMrIPzZXYF+Ih+L29cn4RjZl/P3IxdQY=;
 b=ASuBl5Fzfp59MBJcsHjfqb/M2IxhShYnEdgtBNS/yzITV3iu6WOpyvA5PR0G8pTcXhWbJ8qhzTb3afsq7duK4G2gFySz6688RkyhFPUHH7SyOj3CTFiFmGNjYl1Pm/B3o7+09lMbbIJ60/XVwnVeXp22LEmvnPvzRB+YhUFmrU8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN2PR01MB2126.prod.exchangelabs.com (2603:10b6:804:a::25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.23; Wed, 3 Feb 2021 04:01:32 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 04:01:27 +0000
Date: Tue, 2 Feb 2021 23:01:16 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Subject: ARM Snapshots Not Backwards-Compatible
Message-ID: <YBogDGJRU5pcDKmi@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR17CA0014.namprd17.prod.outlook.com
 (2603:10b6:208:15e::27) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR17CA0014.namprd17.prod.outlook.com (2603:10b6:208:15e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Wed, 3 Feb 2021 04:01:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e646511c-83c8-4b4b-4e7b-08d8c7f8618c
X-MS-TrafficTypeDiagnostic: SN2PR01MB2126:
X-Microsoft-Antispam-PRVS: <SN2PR01MB2126B7AFCD3C5C996207712B8AB49@SN2PR01MB2126.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EutrJjxCp9j7rpkr8+bAYY60yw5kr3e0Lg76j5Qex1iumOG1C8JIrjippu/q3Z4lr2YeXznbhzbMsJ5/wL+tDCsGlqwDreMQxrEPSKf62jVB+WANIJi/HEHqedtZt3neE/S+2HIw/St95n18deyr++BhzNuCf2T1XxQP7qV0DQbnPFZOSY1+g8FC9xvIhZt5fcO1uPIyQyROkxxAf63n13KR5S5IqtDgLPcHNSiITDPdbkvjM3v2XYQcBNGoD6U1zw+1xL2fR7VTFSZCd9j3A+QxPlnUneeus86TQejb3seUZCdwfKyH3j681O2i4JuSy0bxJLsrfI4mS3T4c50J0UjlmHJBZcGwuiOHSVMhHpYpyiJtqK+To6ID5cTz67Bojz6RRGYBTayoDAJ1elWdTg2rmx7pDAFHIo4z66c9aGb3ZJAf/mFilXeNsvuLhyKI8HzD3GFElq2xCtvTmTZkPspIY3foWHLn7QYMHAl7Rq/Ew/29cVwyASfxY+AxiJKiyWpafBHhWpVHhyPxXe8lBOO2eZICPrDqSkWzjPJCDrWXX5JYgnN4cOL14nOeowlAu5bI+r5VLwxSBOpoVk4mvN9Ruljl8xpfWeAxRJ8uzUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(66556008)(956004)(5660300002)(86362001)(9686003)(6916009)(966005)(6666004)(55016002)(8676002)(66946007)(4326008)(83380400001)(478600001)(316002)(26005)(52116002)(7696005)(6506007)(16526019)(186003)(66476007)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w6Pb2s52zL6rsRvM91SutHnR24QFmjMzQZNWBwhK4eTPFdhnUpvLyqigINJC?=
 =?us-ascii?Q?seh8HHFVubXObxsLbUlfvYACq4IrNsDnmi7L8kQEfPOm/oHrkVJNBi5M8ReK?=
 =?us-ascii?Q?6ih1YCOB9vA0KDyGvTVZAK7/RKz3+FxWZWuY/EGIkmOPZh6MkLLwokTiInEL?=
 =?us-ascii?Q?Zy1g2k/vIeJFkrSnMvBW7EKQoqWOzDX/44lVG0oOaqO22RbPaTQlp4ds/4Uh?=
 =?us-ascii?Q?MDvBqYtKw4BrKWvha+8z2eHX+M/4qs7I81o2IUtDFs2UQ8GW16QgLvHLKJ0v?=
 =?us-ascii?Q?r5Xdt1qwJ5/6eYCQIZwoMLFzdsK1XYAlN4Vlgy3MiDiU8ojJZvcs/qX0QjFh?=
 =?us-ascii?Q?oQ3ea+ITlZtENb/j4b8WlpsaQfQzBs9ESVcuqoivfuqNGYw8C2c1VBHZnXBz?=
 =?us-ascii?Q?vZTXoIaPwA6HrGXo6gL3QJHi46BqeYL+1BJrW1IwWqgHn+RV/SvfalRvXMR3?=
 =?us-ascii?Q?pLV1x6GgecNiVFxT0GzZK3ArNqw2jDJm4Ugkl6s8oZ97mMdCZ8e99ZqoBDiq?=
 =?us-ascii?Q?rWYD6UlCVsnZ+gPOHgnvfSzaA3D3AWjX7Q/ZGJja+6Huw0K7C0G3o+A+zCYp?=
 =?us-ascii?Q?K4GWj8TiGMl5EDEJrw37ipmfw8f7j9lkUAa93RapuEuIH7hfdJ3KNfzlJsr0?=
 =?us-ascii?Q?75ifzCuvEkBFUrd8UFH9NOm7RiI8Pe76/iildy776OH5VEw0TXDCkcdo8ygY?=
 =?us-ascii?Q?Ng6i9TIrSrGQdA9hWu7FYq6JYFKWRyempr6ZO94sC3KNgOlCXklDn+5bDeYz?=
 =?us-ascii?Q?kwTX1awzZ3uUuH0rs/9WR7ir9vNr8RUoQAZAlsaoKSZOWO+enBY0YgLh8Xxy?=
 =?us-ascii?Q?CqFglyl/B7TNN+qZmmRyLtrlaj9Q/gbWNbC7L4+tTwiBxIL5ctvv9u+nLKJq?=
 =?us-ascii?Q?IdyslZX5vDGLFoL9349f2SweSwOtnbyXMRksmVAogAH+/leFxzBKfQQnU+ao?=
 =?us-ascii?Q?45uTPsnAaX3R4x7TyfDVoMb5ZrKmNLiRB2KkzoMQRQQbM/la50aLFmUSNREB?=
 =?us-ascii?Q?2LOJREGFt+FSenCJj0ifJRArdlP3CFu5/z9yH+Rd66FyfkoFeaYMZajeNCqG?=
 =?us-ascii?Q?bsgpPHqM?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e646511c-83c8-4b4b-4e7b-08d8c7f8618c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 04:01:27.7895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rocScj/Dn8oolmGAvvYQCoAgG1UOHg6Zgmwo+KeX7Q2//fZvlPoUWuDQZWtoo0V41zJQxgVDCZ5I25VS2OjffzuIDbNCApadVxE9oh6Sx78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR01MB2126
Received-SPF: pass client-ip=40.107.94.91;
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
QEMU 5.2.0, using system mode. My previous impression, possibly from
https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
this ought to work:

> Note that QEMU supports migrating forward between QEMU versions

Note that I'm using qemu-system-aarch64 with -loadvm.

However, I've run into several issues I thought I should report. The
first of them was that this commit changed the address of CBAR, which
resulted in a mismatch of the register IDs in `cpu_post_load` in
target/arm/machine.c:
https://patchwork.kernel.org/project/qemu-devel/patch/20190927144249.29999-2-peter.maydell@linaro.org/

The second was that several system registers have changed which bits are
allowed to be written in different circumstances, seemingly as a result
of a combination of bugfixes and implementation of additional behavior.
These hit errors detected in `write_list_to_cpustate` in
target/arm/helper.c.

The third is that meanings of the bits in env->features (as defined by
`enum arm_features` in target/arm/cpu.h) has shifted. For example,
ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
added since 4.1.0. Heck, even I have added a field there in the past.
Unfortunately, these additions/removals mean that when env->features is
saved on one version and restored on another the bits can mean different
things. Notably, the removal of the *VFP features means that a snapshot
of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
ARM_FEATURE_M on 5.2.0!

My guess, given the numerous issues and the additional complexity
required to properly implement backwards-compatible snapshotting, is
that this is not a primary goal. However, if it is a goal, what steps
can/should we take to support it more thoroughly?

Thanks!

-Aaron

p.s. Now for an admission: the snapshots I'm testing with were
originally taken with `-cpu max`. This was unintentional, and I
understand if the response is that I can't expect `-cpu max` checkpoints
to work across QEMU versions... but I also don't think that all of these
issues can be blamed on that (notably CBAR and env->features).

