Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09930DED7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:56:46 +0100 (CET)
Received: from localhost ([::1]:56020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KWL-0005Nl-IS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KUm-0004K4-Ie; Wed, 03 Feb 2021 10:55:09 -0500
Received: from mail-bn7nam10on2127.outbound.protection.outlook.com
 ([40.107.92.127]:12236 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KUc-0000Sc-4E; Wed, 03 Feb 2021 10:55:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoUJ9wcttccNnpmXTDZTh3nv2eST4rYSkEG+jYnOYLGewTOn2g4mWYFznVLZS79HIzrW/oeW5x7/6WUIj8tibngkAeosJ1d7N0OOBJLVU+fF1vexMCUMkJyvCNo3dMjcEAVJk0Pw28pdSc1yLrpMrp9x3VHX0O+1KsT/P2Rf088hbZc7jrgptz0vd6G3q9smT429ikshnP1vSZPFVTGFFDK9M/FAiFN0Caqaj6tScA0g+TP7ifqGH6imITV6cw22RLrIMmpYjVqcEjIJ9WcXa8pobOyyt7WG/AbAQpO2b3jrO7kxHZHL734OQkfphOQ2oZlaZRGzH3M3oOX1AYxldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lULb13oaJnswP5DV7jnTadsNfIZ7MhK3Y9VG4MbkV80=;
 b=PyDe93z/GXxqQK8f/oQleOwIPmx8gR+HMzhNd3ruQjU5x5WTvEJqgftaEf7FQef0AFwIclpGYjASYbmkSx+aSqK7ojtA8sKQtAYqA7bySirsL25jKmXzeHRFq7HTcd1RQBo05va+3g5cQxv/zSwvRTHPq8HuKRZeGaklXMY6VzIKyfqnDPR+FB5fKVNRqU9K5whnlHUXTkIhIxa2YcYNiEHclkSL45vZ2QoNAE2GrEGIBbiEvWQ2Wx21WqCZK5YgcVRyA3dv39f8viN0Gb855TUvdHo+0NmTHtkhoh1SJVGQGNtBsL8Wd5LCthbIJ7JZWhFYqtAkZ0jj2S20RW2rGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lULb13oaJnswP5DV7jnTadsNfIZ7MhK3Y9VG4MbkV80=;
 b=JdJK9CI7+/fxACxdYtviFOWFOY2bkSSE2C7HSV4Auz3MZShKUh1jkBF+1ctsUFBUC9BhPNT2u1zAiwsKgodVkIW/PLowI2mNOYJqjr0eWBFxsN7Gvx5E+YN/zx9Uv2c76kgCClN/vWwqCpZK4T2HWLPR50C26twRPKUfv/OOAs8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3886.prod.exchangelabs.com (2603:10b6:805:1a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.20; Wed, 3 Feb 2021 15:54:50 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 15:54:50 +0000
Date: Wed, 3 Feb 2021 10:54:42 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <YBrHQvFHfy36D4No@strawberry.localdomain>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
 <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
 <20210203151053.GK2950@work-vm>
 <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:208:23e::21) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR14CA0016.namprd14.prod.outlook.com (2603:10b6:208:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Wed, 3 Feb 2021 15:54:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fabe246c-738c-4122-2b3c-08d8c85c09f2
X-MS-TrafficTypeDiagnostic: SN6PR01MB3886:
X-Microsoft-Antispam-PRVS: <SN6PR01MB3886319B3ADAEA7344687E328AB49@SN6PR01MB3886.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3iet5tGHWCyPNWVtqd+/y//IqcJ3bwW4R/yG4IW7F70f1XWq4S4OwcllZSM51cOvBkawD7nRP67ccwwVox6Ov46IlxqSdKAbAdcX1EYeUHV9UBokwJxZILx+QgY7qsnI0QLBVigdmdMSr7kWNPogaJ3ekF/ioSgIzIV4Z6w4JSPpI+EX6OT7BZbuyNkqvLZSp5DDm0EzUNlzBOxFArmhzTonqx7bmJwQIM+Gjmbo6u9HBfDnk4fOFwxZrEFqOdoH7RH8jY3VBZ6SkK2c2FWPGluTCihvdPG/v0Vb62ntEDysgWEb6A1mZV0f7DWqf0rijlyP5Aw0+c4UnUaQZQV1TJh56b6nCQ9ovkVSW+5RDrmGDkJpC/5+oeUbuh2sdp/Z5RHU2JajPnME6ohVSpjRnZDEWzew+OXAn8gu2H86WAPnPKn9Ukl2GDGQr5XeRlJOmettAYN3XHW73JVmyVDfGqXp/RYoTXDWNEGW6E7/qfs5vpACyrMoodOOnP7F6KeOggf0mIvD1n/X82lln33ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(26005)(956004)(8676002)(4744005)(5660300002)(6506007)(186003)(52116002)(86362001)(54906003)(83380400001)(55016002)(316002)(7696005)(16526019)(2906002)(4326008)(9686003)(6666004)(66556008)(8936002)(66476007)(66946007)(478600001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PbZoNnYfLRXxVef1odCW99Kq7KaMv1EFTVnqlfH77Bq1W5xmOlVYXOBPTKTg?=
 =?us-ascii?Q?4Tm6fEUc58rhkpGSabo3K5UOVNCZbstdHaQp8jkvcKCQepdJddpg4ZwRZQEj?=
 =?us-ascii?Q?Ec5Nnb5BSIFAwlpCq5ebm7RSuZDeshGLMBxZYg/G/UBORdZ67RzMHjyqWqLp?=
 =?us-ascii?Q?OioHb6QSUpW3SWYmxRXrSPQRe200hUqulaMp13ZII3VNgyJ4QWdqlFHkUTu/?=
 =?us-ascii?Q?EQmWYv4/6uAT/GLl7c9YwFe7RfLMPrsM8fClzs1c0iqDstptm8v3oP2yGj24?=
 =?us-ascii?Q?6+qIANIhvsJo5g1XOdBmpwwOm7XqLkjY+7QnQMpHp5iuciud76y/+CEwayZQ?=
 =?us-ascii?Q?KHC3u7eUmlyjq5V7IjN0C43s1OcMPpShkatGhhUTDnak+uk/AGZMVTL2t/7h?=
 =?us-ascii?Q?Q/mrhso1rK8o1gocvrZ84I91YRjpNBrBqqyDtAnw3idb5ORykAZ8bvoxAqYt?=
 =?us-ascii?Q?FdqxulA50ZzOmbcFczsfF9VlkyG7BUjbfCXNhxU7Fffir7cgbthYsFNU24FR?=
 =?us-ascii?Q?jo3LQoCgPSa/j4b/OEg40r5eV7u7fV38rScT4QwlHWbGEeEgWrTjEPrXOLgO?=
 =?us-ascii?Q?PWSyxuK1frbL+5360bvno330Ki54FSKyUd2RNXZIL4wDSuJqN36sNU+tI7RW?=
 =?us-ascii?Q?3Ttc8JScsIHKy9c58qHaPvK/SBfQvrkGeto8+2qZwhnH9lLy851Nmd62ybX9?=
 =?us-ascii?Q?HKAGBYdOuZlK2hy+eOL65J71khPz3Q1sn7ZhU9gvxB7BtvR4vQCA04rd0F4p?=
 =?us-ascii?Q?PR/0zF6MCTTUk3Mwd23JQbQgE7Ai9Ln+fXg1wSR3rvHeOlD1WL2ZfB1O/Cwk?=
 =?us-ascii?Q?0UVcDOZziKwJq6fMSNrogyzFuMFrXRtb2CSqnJdJilTeNy/Tm1MLgwSUD265?=
 =?us-ascii?Q?7dP8QbaorjpjYKxNWHWMSUCk8hw9waEQMpd8JKr2x3JHobN3r32qacXmAv4t?=
 =?us-ascii?Q?3E29xKs8lZ33SGADpSDZn1aS0nd8EQAmiAzEQHFttQQ8BZGO0v4FmKCpzJeo?=
 =?us-ascii?Q?mYU8JTiy0EOFLJA8CqNPA/j8cctTK4n8nKmW/TP+M6rq/KV0urhHkinywuuf?=
 =?us-ascii?Q?AnfSzsEr?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabe246c-738c-4122-2b3c-08d8c85c09f2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 15:54:50.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIB0wxueoqJvtv/uqnCYH+A0AQQJGPcmKXzZGodIJgvVsWEdOSqGeGIDuvN7mlde8LIUN2MBbbz2nqCu0bLD1r5srhDg2oe7yy4OmW3GBt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3886
Received-SPF: pass client-ip=40.107.92.127;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb 03 15:26, Peter Maydell wrote:
> On Wed, 3 Feb 2021 at 15:11, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > It's interesting that on x86 we've got a longterm request to *add* cpu
> > features to the stream to detect screwups caused by using mismatched
> > CPUs; so it's not necessarily a bad idea to include it once you realise
> > it's there.
> 
> I think we would want to do that by checking the ID registers,
> not the legacy ad-hoc feature-flags word. In fact I think for
> KVM at least we already perform the check on the ID registers,
> in that the kernel will return an error if we pass it a value
> for an ID register and it's not the value it should be.
> I forget whether we try to check this for TCG (the mechanism
> for handling sysreg migration there is different).

Ah, I sent my reply where I mentioned attempting to find a way to
selectively check env.features before I saw this. I'll just send the
patch for `VMSTATE_UNUSED(sizeof(uint64_t))`.

-Aaron

