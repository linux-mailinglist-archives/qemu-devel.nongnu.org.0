Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1263192B9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:03:55 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHFp-0006rm-Rw
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAH3Q-0006st-PI
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:51:06 -0500
Received: from mail-eopbgr760097.outbound.protection.outlook.com
 ([40.107.76.97]:65153 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lAH3E-0001TD-BC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:51:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhDdvS2jLAkGrEdMChtnTbfCL6gxmawYQ5GRVtYveJz8y4EJ7vSQoMAZiosmqvkaCu2MMm/fhbd7zBDBnvxnoYzxNqr9w/3zPEJ9zI39RTx8KNKKv0kPRnxrWgGGlAklQnBLNIrr08XP2iaqfjKBGgpr48jz/wZJFNPGKRraNLNZil4sT3y7AzzsDHGV8Hhyz210JRjDudD2WKEWs/fWvlfyXpoSxZM+jknSBGKuRl/4N5YecHdhvCt0TXFvV70NuMu0OtaLJ6///WMLpdPAZ6EKtwTq7Vbe4HM9BiNP9uBAD+7mZ/DH3QHYIvSv5F7iHs0n8igJb3TQOeAmMxglkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8d6fG60a3z6oOGj2SY7vGZRkIae4p7sx7NvXK1AvDg=;
 b=V9ocJtNqXavHNUuA38eOth0LqMkxs/og+c35RH/5MmR7M6bM1YX+VXgRtDGC/PZh2DNh7B5g9PlyBHHHaR3PrwgYIJsxGH8DrF0wO2bdMVvk4cROmChRJ6s4NAwVhVHKN1NJx3FU7AWHgiT/26FJO98x6nhfAyqHEySboBIQj7CZev3hxBT65hiORJ4WHzGXiT3Ohs/gKNn7irMoP12Y4/tY4+qIQZCurh8lnxU/ijKH6Amxur8cANl6vII5iH+AoiIhLZbN6jJV29hdIelS6CiosxV+p/1QMoESbkX9Fz663Ppek9KkVjiycY37dYzqQ+DMAoR2gsHP/vxEs3hHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8d6fG60a3z6oOGj2SY7vGZRkIae4p7sx7NvXK1AvDg=;
 b=rD+0i/WklwNigH7oTI8EXlAeGNjxJu4ZI0LgIW0HfEMA73IWPQ5bULv9oESxP4YlDFG3LxYbQcvBVadaAtHkrWX/GVI8ZOmQoTo9AbRzIC+FysSRrjU28abX5QhaPwSOkPuAL683TzFwmuBff8yeUiKJq8f8Llc94Ibmmg4AKWA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3757.prod.exchangelabs.com (2603:10b6:805:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Thu, 11 Feb 2021 18:35:46 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.025; Thu, 11 Feb 2021
 18:35:46 +0000
Date: Thu, 11 Feb 2021 13:35:21 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YCV46X4NPHmBF6JX@strawberry.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain>
 <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain>
 <87v9b6o8bu.fsf@linaro.org>
 <YB1nf/M613d0B+Pm@strawberry.localdomain>
 <87k0resecj.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0resecj.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:208:15e::33) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR17CA0020.namprd17.prod.outlook.com (2603:10b6:208:15e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Thu, 11 Feb 2021 18:35:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ea6423-e2c7-486e-cc25-08d8cebbd83f
X-MS-TrafficTypeDiagnostic: SN6PR01MB3757:
X-Microsoft-Antispam-PRVS: <SN6PR01MB37579FE683E8A00B836757A38A8C9@SN6PR01MB3757.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCWgUcmeeSiNpIBMUDUbJ//CY9rrnmkU151ck90DVNLy4fIKQrQ5GGee5FW11avzDQThwyBA41QrHuMmrGURbEpn4PJNCyBztpRwMaAtzYjxckLOLwUBxK3vW0n4H8HlQF4vX+VlI6JWSFGDKUcoXp7kQ2lypS7Uf0Io7Tjt1xqmtLmWewHAhhnyXYPZImGpCc8vj6E150SdEnDR+L7caucGkK5B7P6DOafqIBA+mRbzXCrAT3Je6ir8AXbrZ7MggBwC/rCX03fDPuJLFtwh2jGmTsyE2hwByXtoGzJi3QCy7+OoRvyDfodHYnZ6qrIQoxArcMrOHKTv7zliowwjJKIVIVO9RzUZBTZq5BZIRC/KZAbeUzX2ICz2ASXIjajAam02O1Q9BG1DGMx6V6vmXV+GJflFxOoiDX7oQOfEzX4m2MuY9QEZz0sG5r09tuoVQAdWFsGlZC0x6+1Q5gFaFsanxMla04gnbpxccAOo0DhyX/WAyTLXiO37SMX4Anr9BAMLvp8VLVoVImYcO5X7gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39850400004)(136003)(9686003)(16526019)(186003)(5660300002)(6666004)(55016002)(8676002)(83380400001)(956004)(26005)(66574015)(8936002)(6506007)(2906002)(478600001)(316002)(52116002)(7696005)(86362001)(66556008)(66946007)(66476007)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?+mIaLf5gbYb0hZYunLeBSCb6++6KsmiAUwjBKFRY8znzKAiiDlrQ5/Oxfw?=
 =?iso-8859-1?Q?EFOe0IZwgCAQ4InQanOTtc/E+QiZVL5wFlkfzRQka74uIPBpDYukEHt1W+?=
 =?iso-8859-1?Q?gyCZTadGPEuzIyDMTGX3zPyhoAPZuxtCATXlfz2ksRXKjbpBH7fyHs9LDD?=
 =?iso-8859-1?Q?KiBk12ehmjkPUKp1OCXB46DSJXZVePl3CafJK8oMFkZqb5veHMvW1bG+9f?=
 =?iso-8859-1?Q?iQ6Vlbn7os4673lvou1YHDh+IrhnQJs+iuuodicnBR6xHuAy/I/iRlnZS+?=
 =?iso-8859-1?Q?xgtZVBUr7WBH/mq3IxX1TpRb+0eNcvS+DRdfeD4Clb3nDG6k2hLHooi3JD?=
 =?iso-8859-1?Q?NteGv7Ir7H2svcigeQ2eWL3pyYhDb7+sAwzgxcdZE9UWd7iTTJqRSDyPtY?=
 =?iso-8859-1?Q?ST1n6Rx/dwXRNHX/o+vrLw9k/8jog4rNkzPNHHfQRwXzCLbmVJdyHEqu6m?=
 =?iso-8859-1?Q?t2zYqPZeYaNSH0bJb1v7pb0Cq4FpV2ewtMZUAAnu6UG+lqLH+Bcm3nrHEL?=
 =?iso-8859-1?Q?et1uOdNLJkjYm/XyaoEyY724+2KQZxzOGTt+iA/puDscwvfoY77Pj1sQZR?=
 =?iso-8859-1?Q?3dMI5iI/gOt0PgKooNQT84XLKvI0XIeo4RyCjvLFRdGvWVvI+qzEAznQJ8?=
 =?iso-8859-1?Q?UaR/LxE52PlJV7u9nGXXVsmwH5ZUR+BZa36QP7sApJp1NUW85/of8rq/eM?=
 =?iso-8859-1?Q?Z7mVvuBeG2zZcbVLiTAyOtpJ3mo5b9WtYDBjpGd6th3ySyJJus8eotreYF?=
 =?iso-8859-1?Q?tP0Ub4C3QjlpGTFsbLYcW0hCAreM4wodQPkD1vi3kcuRBcy8DBWP98ME8r?=
 =?iso-8859-1?Q?IBcnOAldh7s0hAwp2GS/MfifjeH1RGkQASU3zJD9zs6dxkUMkk4gV+xehG?=
 =?iso-8859-1?Q?wGuyt8Mj7TeG4sWoCG9ZrafMPBgHTFi/y9FzktKYcvgRHY7e+pkWCQmvTs?=
 =?iso-8859-1?Q?91W7xL7oJg8O0GG9SClJjEZnrZJ+xAFWJklhMqFwxSQjlKRwuUXlftx8vM?=
 =?iso-8859-1?Q?QfNnUiQDWRMYF4f1ILm3Q+1d5SmLLhCqHEVikM4F7JA/LWqtwE1+EJTbn+?=
 =?iso-8859-1?Q?lO8QlwtYlT3Ug4kSkw1yB3vHjJU4P5fT5IchzbmXez/+jKq9rGI6TjUyo0?=
 =?iso-8859-1?Q?SdMKcJh2ghU65syne7CfQtw86vBX0prQlaMzdIjvRw1Eks7wtcalchcZ/2?=
 =?iso-8859-1?Q?x4+aV8dCjP3WpqEQNKFoSvIIVHfHhuc0mo7cod5fndcDIHO+qqP7G/7wOe?=
 =?iso-8859-1?Q?piOm0rekVLo+tqvZ4XNv8hYD1gJCAGYH8bRctbOrkhDGK82lTn7Yi+89DP?=
 =?iso-8859-1?Q?EFSGUPpDw0Ged8ArT+cfxqd1W2jKF3d+k5YW/FB164AxXlEyqvBHLAn7Tv?=
 =?iso-8859-1?Q?qyNJS0z99G?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ea6423-e2c7-486e-cc25-08d8cebbd83f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 18:35:45.9238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZkMqa5KGJ+37BO/MrEJzz43XxJRQFLiApcpKW/eFCNL4SR+WjorwUvHDccUu5cdhhuA4rKB96BiiGJfuNcNJg5rCL4EcwewUjYYvFZ4oBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3757
Received-SPF: pass client-ip=40.107.76.97;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FORGED_SPF_HELO=1, KHOP_HELO_FCRDNS=0.399,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Feb 11 17:27, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Feb 05 15:03, Alex Bennée wrote:
> >> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> >> > Assuming you're right that TCG is detecting "a io_readx/io_writex when
> >> > ->can_do_io is not true", could we detect this case when it occurs and
> >> > omit the instruction callbacks for the re-translation of the single
> >> > instruction (allow the initial callback to stand instead of trying to
> >> > turn back time, in a way, to prevent it)? Maybe there would have be some
> >> > bookkeeping in the plugin infrastructure side rather than entirely
> >> > omitting the callbacks when re-translating, in case that translation got
> >> > re-used in a case which didn't hit the same behavior and shouldn't be
> >> > skipped?
> >> 
> >> They are happening in two separate phases. The translation phase has no
> >> idea what the runtime condition will be. Once we get to runtime it's too
> >> late - and we trigger a new translation phase.
> >
> > I believe I understand why we can't catch the initial translation. To
> > make sure I'm communicating well, my current understanding is that the
> > timeline for this case goes something like:
> >
> > 1) translate large block of instructions, including ldr
> > 2) attempt to execute ldr, calling instruction callback
> > 3) notice that access is to IO, trigger re-translation of single
> >    ldr instruction
> > 4) execute block with single ldr instruction to completion, calling both
> >    instruction and memory callbacks
> >
> > I was wondering if it would be possible to inform the re-translation in
> > step 3 that it's for a re-translated IO access so that it could
> > ultimately cause the second of the duplicate instruction callbacks to be
> > omitted during execution in 4.
> 
> This is what I've done - re-executed blocks are compiled with CF_NOINSTR
> which skips any instrumentation. If you could test the series I posted and
> confirm the problem is solved that would be great:
> 
>   Subject: [PATCH  v2 00/21] plugins/next pre-PR (hwprofile, regression fixes, icount count fix)
>   Date: Wed, 10 Feb 2021 22:10:32 +0000
>   Message-Id: <20210210221053.18050-1-alex.bennee@linaro.org>

Yes, I absolutely will. I worked on getting some local changes rebased
on top of these already this morning and am hoping to finish that up
today and to be able to report back by tomorrow.

Thanks for the quick turnaround on a fix!

-Aaron

