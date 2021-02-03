Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A030DE7B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:44:37 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KKa-0005g8-NX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KJ1-0004md-OV; Wed, 03 Feb 2021 10:43:03 -0500
Received: from mail-dm6nam10on2126.outbound.protection.outlook.com
 ([40.107.93.126]:46912 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KIz-0003JE-TR; Wed, 03 Feb 2021 10:42:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmXV3MGjX6GQErf/mvdAMKWRHkbJxp95bL5BZqFXK9tHfhTgPkE9jozkou3TGAlRRhF4DwCqBZYX2rda6VEIyVaH4gGOU25JAYXhurClZK4Y42fcE1QrxESK9YByeLPckqMnUTZjYxkdD8PZOHvSTRh+gKK6Y3AutIWiXJHdvCvANeAXV/l1vzrTngHn7AGAT2bggdfEtSxF1U/8obZqd76hRkydRYbRohTSWwrV5a1YryP3zn+cppcZA8V/ryneuHYHJWeciMQxbm87nOv7xcPIPNlPRNJRhfsX+NBPFH2HAgzCafUvmHex6cAOpphECtyMDGravY+SQzCvApCdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whnssnITFF7jzlHMQ01wkAkBbmpCSBI6eBCOkn1WRYs=;
 b=f8P3OOTT4AhyyAk01J1/+HAMIvVzz/Eu0F21L+kan0HzzJFmgyovHwbiD2D7PdoMl+phC0CaXYQYzVuKzU+07ZTFx4W+uSjQoYJsFhDpzpeQ4ceECqj2DmFiVATPOSGaAXys/wkk3hWiC0EWA1txbHyCryRJi46C4/FtIyPRlKtdKHCZRURo4/jiV8KiK3tvB9HRnwNqLGjIxPNQophu5qdZ2xlCwmmP1e/h/uifQjbx85ZvPKwKYZSBdTcMYPa251w22Eq6eLwO7/NANYncZnaQqEfjWuz1XzgM5xWkuxdx8GXegZceo6HQvQOkJ5/T/Or4eO50FvjMrfpDh+qaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whnssnITFF7jzlHMQ01wkAkBbmpCSBI6eBCOkn1WRYs=;
 b=oYwprf1/eUhjmGU3S3MHRLCDncEso4bLk9NdAI8FJbB+1scH9kWsTYWjpB6TVCXwRwvb0GGXeC4i8wZxfYVdm9YX1J25JkG7pa1p7pM06nptpguZa4NJfce4+wVyXQ1Zxfit3uEf0cZsvNQ/44XVhd3xF0uT3nrmqjBpIQ5IUs4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA1PR01MB6607.prod.exchangelabs.com (2603:10b6:806:1a4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.25; Wed, 3 Feb 2021 15:42:54 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 15:42:52 +0000
Date: Wed, 3 Feb 2021 10:42:44 -0500
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <YBrEdOnGqoOMGz4+@strawberry.localdomain>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
 <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
 <20210203151053.GK2950@work-vm>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210203151053.GK2950@work-vm>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0432.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::17) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0432.namprd13.prod.outlook.com (2603:10b6:208:2c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.16 via Frontend
 Transport; Wed, 3 Feb 2021 15:42:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7b3e9d2-6b10-4c01-4e58-08d8c85a5e20
X-MS-TrafficTypeDiagnostic: SA1PR01MB6607:
X-Microsoft-Antispam-PRVS: <SA1PR01MB6607F8D6D8F5E246002130AC8AB49@SA1PR01MB6607.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iq5Aj+FdsOJ5nb06SoGzzCe9pZeRpjhhmfNZmU1bP7xG7wdfus7rA7E4UQLOI1FZqpIkuwEJB4fBVE05k8Ty0rOD4VT7tQaEuEpmKuFjUtX+spUt/vKAafzIsWeRK7hhGZbFjCbDJxMWENZXaEAYN4C71Q6J7RN+3I/1SOd9cN4+VhSEd1roxtN6JVgrZ6yFNYPQbfxfgu1D+w2Z7GggIo1kZLyF6pbXX0ggaNrnS3h0wbkI1jRlx9IH0Q9x/L3ww92Uff5r3sjtDUsuw2R1haadfBemD8TwmDCJrl3/UpLpaTuk+dk51IZ37duUGPm26Ru15WnnyHaZ39DMvxvDo/1SNlxGzhOktv3oSnUg5Pogr/CfwhFaxIUCG0sxBgYzfLIDTRSgMiMud1m91LNfUz02fY+5bbP/nrXQMwue639zbknXad9v4OilorXMnnBkJwBzei+j7Iaq16VjFP9SBRxl0obg7K4625BurG8yb1RQaV6EzRazZXY6FT9/zh9Dmi5QkAiSE5RGKRenxNkRiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(83380400001)(956004)(6666004)(53546011)(8936002)(52116002)(6916009)(8676002)(5660300002)(2906002)(55016002)(86362001)(7696005)(186003)(4326008)(9686003)(26005)(478600001)(316002)(16526019)(66476007)(66556008)(6506007)(54906003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?tj+2lEkrvvBx8E/5xM3gn83DixwzmAUP+dxxndBNqyybTuUGDy01pWtJe4?=
 =?iso-8859-1?Q?Bz4ExxsbkUOkT5YrDlWUT57ENxyxSh5uKXe2LVF7sRHSNBHmMjR0a3qOLb?=
 =?iso-8859-1?Q?bimAi7I9S9an4aUSq21YOJgOMnPhDC8K4JF/9It1fIgWualDpSiZ5IGFsE?=
 =?iso-8859-1?Q?nXW/J9EWAGCcH34Ua4NvIXf5zzUvq9nUiVeoi/72G0EyAkusAkJE8co130?=
 =?iso-8859-1?Q?xWHgD7JWXB8RgqNk9pSkxxlHWrVUzp5CQCk/grMSauXUFxJIlTBZ0ZQFgR?=
 =?iso-8859-1?Q?oj27fo/G22Nrv8BDypURayyPS7MEglID8zKo2TpYxhdbr7c8WmgiLY9Zvz?=
 =?iso-8859-1?Q?ugLVnKg+jyflvYtK2A2MVUKkVycieqmmeg5BL3uD3xSjZR8A1Y+Voqj39K?=
 =?iso-8859-1?Q?R/zA+nAj823cm/dwbexh9ubbDplB2k0SrILDHuD/pBRMIZp+njTLcaul8Z?=
 =?iso-8859-1?Q?Er4y85raWehIuvpz6KxmsE0G5a+J6ontKzJ/tDsuXKwTZlNqW1apAyVE9N?=
 =?iso-8859-1?Q?ssoOu9ZyeOcHMkZCaKhi9u7FWZ7sanFZYnhOUUJqHvqfQQ2bGTS7ACdErf?=
 =?iso-8859-1?Q?z/cQm/kZS7aBF0JXUla1szb6/aKLIiSKKg6hXGpRbNMcxOe6GsSqw09g4X?=
 =?iso-8859-1?Q?U2YZreRQH0Ji2j+g72oo2aZuLQgiBQbX4S4UUTgpO47Xf7zmxO6sKCu+Da?=
 =?iso-8859-1?Q?B79bWkpbkm57poLUdhNAm/PTBgkps7bQwQXwgYrW9Zf9CJ0578jVQ0KVtP?=
 =?iso-8859-1?Q?fM1UXyfT0xrBnhPJMSFsqXs4nXTJkSxTFqyGOXKpurx/rwuvh/MYxwE2yu?=
 =?iso-8859-1?Q?rZ+pxAVS4NJ1CuXFx6yCFseeFwREyRAbqFsSZwHXK3kUt2yWr1h1/aPF9Q?=
 =?iso-8859-1?Q?oVi/4F7xnIVmO7AzuQb7/SdNI25JjFfPSM5cBxoTIz4f4ilxaYuXQMuuwh?=
 =?iso-8859-1?Q?WaNszInSSPWZt+BSE/n2ycApMrPt7FL2e1SoO0gwj+A7SXlTuusXGV+/h3?=
 =?iso-8859-1?Q?N2eWvwMzIMgDfhCCMPj1ny0BG8DoV8jWCGrimp+YhTgR4pCRwXwV5+HFlV?=
 =?iso-8859-1?Q?6YUE8HZY75Tm8grqK4SvefBx19E0D2+IYyROx0jhwrEI?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b3e9d2-6b10-4c01-4e58-08d8c85a5e20
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:42:52.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sipEbfoXJgkJ+++27Q+guyM2CP9SyodQMEyUrIaJMumt2p82boG9q8mhrf6tC+oNUQ2nZLXdENmkJYVEUNLSUkgpfKsJwj/MtcOBmz90ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6607
Received-SPF: pass client-ip=40.107.93.126;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From: aaron--- via <qemu-devel@nongnu.org>

On Feb 03 15:10, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> > On 2/3/21 3:58 PM, Aaron Lindsay wrote:
> > > On Feb 03 10:01, Peter Maydell wrote:
> > >>> The third is that meanings of the bits in env->features (as defined by
> > >>> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> > >>> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> > >>> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> > >>> added since 4.1.0. Heck, even I have added a field there in the past.
> > >>> Unfortunately, these additions/removals mean that when env->features is
> > >>> saved on one version and restored on another the bits can mean different
> > >>> things. Notably, the removal of the *VFP features means that a snapshot
> > >>> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> > >>> ARM_FEATURE_M on 5.2.0!
> > >>
> > >> Ow. I didn't realize the env->features was in the migration state :-(
> > >> There is no reason for it to be, because it's a constant property
> > >> of the CPU. The easy fix is to replace
> > >>        VMSTATE_UINT64(env.features, ARMCPU),
> > >> in target/arm/machine.c with whatever the syntax is for "ignore
> > >> 64 bits of data here". Then we'll ignore whatever is coming in
> > >> from the source, which we don't need, and we'll stop sending it
> > >> out if we're the destination.
> > > 
> > > I'll look into this.
> > 
> > I think this is:
> > 
> >   VMSTATE_UNUSED(sizeof(uint64_t))
> 
> It's interesting that on x86 we've got a longterm request to *add* cpu
> features to the stream to detect screwups caused by using mismatched
> CPUs; so it's not necessarily a bad idea to include it once you realise
> it's there.

Another approach would be to assign integer values to the members of
`enum arm_features` in target/arm/cpu.h instead of letting the compiler
assign them for us. Of course, this only fixes the problem moving
forward and doesn't allow future QEMU versions to gain the ability to
load snapshots taken with previous QEMU versions. But seeing as how
no one else has raised the issue, I'm not sure how many people this
impacts.

I've tested the `VMSTATE_UNUSED(sizeof(uint64_t))` change and it appears
to have the same effect as me manually fixing up env.features (which is
to say: it works).

Maybe we could change it to `VMSTATE_UINT64(env.incoming_features,
ARMCPU),` instead and add a check in `cpu_post_load` that the
incoming_features match the expected ones (along with something matching
in `cpu_pre_save` to populate it)? We could ignore the incoming_features
field entirely in cpu_post_load for old snapshot versions, but check
that they match moving forward (perhaps generating a mask from the
current value of the enum to ignore fields which have been removed)?

I can send a patch for whichever path we settle on.

-Aaron

