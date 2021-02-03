Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A930DD65
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:59:49 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JdE-0008CM-8m
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7Jc2-0007QM-4A; Wed, 03 Feb 2021 09:58:34 -0500
Received: from mail-mw2nam10on2109.outbound.protection.outlook.com
 ([40.107.94.109]:57312 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7Jbz-0007dR-5n; Wed, 03 Feb 2021 09:58:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpfQ59ntr4D1XEfq/CqjhZNeqlHcKgkB08lXHaKzy6IVfWGfWQ147JogElXOs6CntYz6N11OB8jRx08NdFa7ch6ic1tv0gLadomSn/TmR9vVxcupQXPS7Fv5a3Q5Z2wBqhVkIbtzqviMpeLeSVfNpfLLt5xlD1FA+sHr4opUOOpX1J02TlwN4A130Qwd/E9kcNtbtwSXYzeiPZdCSwaTiSdmMBQ1yjoTJ16b3mjS7oHEy5e1hQltg98f084i1I4LXnkC1eeugodc/xl8p/ne5fVL/Ol/SvJ+B21OBAu6SNAZalHoM2AZuYpD+e8cMWCD0pdBUkZViscqnBA0qAxXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sYR12daYVniuTzvVbiAgq16+VkHi2OFZXxLjH6YEmQ=;
 b=baFSaEA/dmlCApZy8cLdpyUUs/+dw4s467gdYoXE5VtVIFMldp0PsRIDW/dIKCYvOkqeDrY2FWkCLRoDNRAWpAF5Vpd4JqVXZd7J00R0pBOBRt1b7cIjKavWNgABf7V5B012RBVmra1wlbp6P03JUhM1szhUIzyy8aFNG0LhfPZIB4ozxuBuGXeFeoMg2FhIQZuDeuh+GreI9OSRtRfHy7h40F9wFmDRBZl1U5+ak8Bd2UPvKif0Op2HrRyX4H98Sj/PI1S8SQamMmBITGvpPPuarEMTituWK2nC6yDEYvKgTj5KDAbpYhM75a04BS+y+e6AULAqufuutbD0L2NmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sYR12daYVniuTzvVbiAgq16+VkHi2OFZXxLjH6YEmQ=;
 b=MUYHOvXZloSnZpd9dfgDwTGPSZsgMfuJiu8U9n+3PJgAyYVh0sMNT0n9CKEE5jTFO9xVkxvAGfKiRvyEavwDw6tiqjCFgJd2qrG6k4WcU5T18p8ZPN/AJTVakPvHLLw694TAfoPs572AVNzXxXanT9Q/aeK72FzP0E9sjzM7nVU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4814.prod.exchangelabs.com (2603:10b6:805:d3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.24; Wed, 3 Feb 2021 14:58:27 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 14:58:27 +0000
Date: Wed, 3 Feb 2021 09:58:18 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0264.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::29) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0264.namprd13.prod.outlook.com (2603:10b6:208:2ba::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.15 via Frontend
 Transport; Wed, 3 Feb 2021 14:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 481c4930-1a13-4db3-7854-08d8c8542936
X-MS-TrafficTypeDiagnostic: SN6PR01MB4814:
X-Microsoft-Antispam-PRVS: <SN6PR01MB48148FDDE5E5774442215CCF8AB49@SN6PR01MB4814.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3M/A35faFaTTaU2zGBvryiIMEfoz9soU+WOuFfkqMeOvp9ttsLJb+BRdnJtL35kyjCu+psJesD4hry35B5u1ib9+jpMacMlxyQyDq9u6dbPFOEa4cdhxzAR4Zf1eob48UbSrmal1VGzsov8b54GXf5QQBRhATTUOL1y6B6Mjg7hEElVfYQ+a0gczDJFxFg9SPN5c+UQkoig3+7e7RXdLV7+yRBMzR9BYjIDvmyLzhfb9WvIxBDIpl5hbDQylAa3JI/BB8neL24IwJlR/c8IFKj2AbZMjrrFUZRcIYEHOckiMRU2MxQePTviq3mjU+BIJ9/ZU/ZBm41Bz51q4TZJBfnuPF90suFcW7L/sVGmrbpg2tjChy6dZJst76l/0Qc+VkQ+I/0joWFXrpRiuRpr9CD7+cvTXst8fTlJZgPSzobNvTu5s3CM6PSUT1NkeWz16OXWGKcjjoGsTrKXMiFxLEhedoVB3EIqnVIERtPhdBw+z7tP9E3IMmpUas8CDBOLRluts6xYg6y0/TGIjVihEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(8936002)(55016002)(6666004)(16526019)(316002)(6506007)(9686003)(83380400001)(26005)(4326008)(6916009)(8676002)(478600001)(956004)(2906002)(186003)(66556008)(66946007)(52116002)(5660300002)(54906003)(66476007)(7696005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+0URDWoePVmkqiWBRub8pilhlqwIQxJsFZm8OxvE+q65NL5Fpc99M1B/wLWK?=
 =?us-ascii?Q?XUcmZVI1EdoApSda7b+2OrLmlSKsm3sBSs4qRImF8tdzq22696D3gZOV12zV?=
 =?us-ascii?Q?kmBfyjmlA/l4ZcG7+7x9SoaiRWKebHLyWvO4W4cOW8jER8DgxmJ8oevgwit0?=
 =?us-ascii?Q?wH0BdyLZ0NXjSSKDg/g2vfBFNinTf0xtaH/0F8a14o1D53LlmzzZ4Nzp7AyF?=
 =?us-ascii?Q?WNbG5KalPnnBOareSp+GX7lneJZZPC0vrYZxEaKmQc9v4/iiL0VsxoMg4RX5?=
 =?us-ascii?Q?gusc05AwEFBtpo5cQf5eC1ruMD41MNmFPk5WZk513INjnRk5pe1siO/5wK8U?=
 =?us-ascii?Q?VQ8GvZCXZEahkpNrq5+iXyKxRlGNc8x91bCn5MV8xb04ak8zrCgHtFg47TxT?=
 =?us-ascii?Q?gO7qmHusIndCRckL6mGQPRmIbCm7wg1nf69Q/YPuzlOA/+iU9IqKCaBNtpAg?=
 =?us-ascii?Q?Ng3J+YKRCLJeGXNtpcUwv4SF5WUQe2FsxvmGIwMNtvgkQrHQB9+KO+zrCSGK?=
 =?us-ascii?Q?ocgxM5AMYIrtuRIOna+lHa9Wzg84MozZDctE97Spof927+mq9pNYybyKScTy?=
 =?us-ascii?Q?7vWCjQ8K7YdnBwW8WJD+80+YImjiox3zfY4ccCmoA9dBs+uyvwtXn3IYA1vU?=
 =?us-ascii?Q?KWiHbASlHjSn6GJlKZ3hf06cIHh+g9azca4hVsMX3IxPQcjezt5SMFNOVls3?=
 =?us-ascii?Q?GfTp/LF4VzzchqHiYz4STe7Qn3L0kTMBikU53Y1/3xM4oJsyfjWZfymRs+Yz?=
 =?us-ascii?Q?oO+bN6r1DUSPyaXpPV7ubkecSl5+tc0XhugqKxNKycPISDe0S/d3Zc4ZtfIp?=
 =?us-ascii?Q?xYrTN42wQrCfIwcYtihOWVxBoqDWceajbwhK1EETgyY4X98cdMaTCrsWLzmu?=
 =?us-ascii?Q?PCw246YoAIR2ZXbUKIuPZt3uxzrMQDbQqcYr69ixYLET9hhIb//VbLYybHia?=
 =?us-ascii?Q?BIV21rwdCQzWC+XRsJsS/YqMrfmgqf7t1FkUEIrxlkdDy4/VBqcvxVTG9als?=
 =?us-ascii?Q?xZEszK/GVIBt4qiUWMXZStyCewXmAB3oC6+n4I26iF6sxJ+WWxBG1nG3yqpy?=
 =?us-ascii?Q?OQOI9jwh?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481c4930-1a13-4db3-7854-08d8c8542936
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:58:26.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaiAALzI15vQOavCtSvom1z9BBt0zIVXcHUpvdhPMOfzJpJhAjb06TEtg/RzwffSHXhucQD9SuJhR1kGFQdwWa18As/M/jXymrJIEjKYqHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4814
Received-SPF: pass client-ip=40.107.94.109;
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb 03 10:01, Peter Maydell wrote:
> On Wed, 3 Feb 2021 at 04:01, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> > Note that I'm using qemu-system-aarch64 with -loadvm.
> 
> You don't say what machine type and command line you're using. Strictly,
> Strictly speaking, the intended guarantee only covers versioned
> machines, eg "virt-4.1" on QEMU 4.1 to "virt-4.1" on QEMU 5.2.

Sorry for the omission, `-M virt` was used to capture the snapshots on
4.1.0 and I'm using `-M virt-4.1` to restore it on 5.2.0. You get a
fairly helpful error message about that one if you screw it up:

"qemu-system-aarch64: Machine type received is 'virt-4.1' and local is 'virt-5.2'"

I'm restoring using the following command-line on 5.2.0. Snapshots were taken
with the same, except `-M virt` and without `-loadvm` on 4.1.0:

$ qemu-system-aarch64 -smp 1 -M virt-4.1 -cpu max -m 8G -icount 0 -nographic -semihosting -kernel ./Image -append 'console=ttyAMA0 root=/dev/vda3 rw earlycon=smh' -drive if=none,id=image,file=rootfs.qcow2,format=qcow2 -device virtio-blk-pci,drive=image -loadvm "snapshot-name"

I suspect that some of the differences I raised in this section:

> > These hit errors detected in `write_list_to_cpustate` in
> > target/arm/helper.c.

may be from the fact that I'm running on -max, which understandably may cause
changes in the ID registers between QEMU versions. I'm less concerned about
issues related to my usage of -max than I am about the others.

> > The third is that meanings of the bits in env->features (as defined by
> > `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> > ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> > ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> > added since 4.1.0. Heck, even I have added a field there in the past.
> > Unfortunately, these additions/removals mean that when env->features is
> > saved on one version and restored on another the bits can mean different
> > things. Notably, the removal of the *VFP features means that a snapshot
> > of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> > ARM_FEATURE_M on 5.2.0!
> 
> Ow. I didn't realize the env->features was in the migration state :-(
> There is no reason for it to be, because it's a constant property
> of the CPU. The easy fix is to replace
>        VMSTATE_UINT64(env.features, ARMCPU),
> in target/arm/machine.c with whatever the syntax is for "ignore
> 64 bits of data here". Then we'll ignore whatever is coming in
> from the source, which we don't need, and we'll stop sending it
> out if we're the destination.

I'll look into this.

-Aaron

