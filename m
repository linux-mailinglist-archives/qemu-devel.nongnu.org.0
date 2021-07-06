Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639D93BDF27
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:58:02 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0t4q-00057j-SC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m0t3i-0004N7-K9
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:56:50 -0400
Received: from mail-bn8nam08on2098.outbound.protection.outlook.com
 ([40.107.100.98]:28768 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m0t3h-0007Tk-2l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:56:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIKeN311I0A6ovkgfGt75QqOxV0cGUyOirsr+sIMdSpE1ZG9OLjjL5Hau4Q/YDtCeeF86uXICi76o2IooNVZL2Dx7eMZp2maavJLmoi9GsYJcJeYITCelWnXuam2u/xPXo0UcWY3G7jKIkMG1/Mt4hHq73V49lduXcf1yZShtW7pY8zrrYgsuTRgnz+NYK+cy6Z/8/51HiN37e6fnYVPuBQ/m10R3DRXPwiaAtuss46usub2YT+xv6pqQJJWZ0i6+46xD3yJiwE9oUyulmIHxBOG8AuHDmLyE+Q5dnhl+VH0cu7GXBNUWTjJhf1svMS7rX887ySN55YhDe3IiyssVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2vNMda24D1lBR3op6HNQA7Ez9reXeqN8BJgzpS9Y7g=;
 b=eBzVMIs61T/FJHSoOvvEKeW8wx3+xk5rkuLljrL9HhSyc7S/eRfWUT3aiOdwDMqoTqyaY9j3wYYkDKZbKMuJvmzxwDaxze4cfM0b69oQkIplg5iqiFYg9FLa7DJ7tP+sJarn4FDf/tOUW7JtZcEfA8aWKK/hcfKX0ByKrju16mbkAfHq237VFsW2zun1AVxdGsztbowIugLwg5n65Ca0gTmohN7W7WQ2T7kkso5n+0QnWLaMJDHteo4uh9Xm4256N3QrnTiHhqyIri80jhkT6pQVji+GZi6Kr5hMFkOagTutcdXO/Dw2eBJXhvPIs1PNk4RGpKCX4n+znYUdHRqqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2vNMda24D1lBR3op6HNQA7Ez9reXeqN8BJgzpS9Y7g=;
 b=Vlxdl9meZxb+5X9NVViUDidjJHpzCBKtMSqeYKUxr8xYX/Asdz2JAoFIvhRdkjihKZNofQ0OCfhN2Ts18al8+9ra3yaB6GUTehbZoKOm8N86tG09Snd8lq/LJD9qW6KZU89yl+Zg7VWKlzKcTzMA3KUFoZOn2E5toy20Cup4LXM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BL0PR01MB4291.prod.exchangelabs.com (2603:10b6:208:4b::28) by
 BL0PR0102MB3553.prod.exchangelabs.com (2603:10b6:207:1c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 6 Jul 2021 21:56:43 +0000
Received: from BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::ed26:7a52:86dc:f1a]) by BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::ed26:7a52:86dc:f1a%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 21:56:43 +0000
Date: Tue, 6 Jul 2021 17:56:40 -0400
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 cota@braap.org, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: Plugin virtual-to-physical translation incorrect for some IO
 accesses
Message-ID: <YOTRmAqH2dn+C87T@strawberry.localdomain>
References: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
 <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
X-ClientProxiedBy: CY4PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:910:60::34) To BL0PR01MB4291.prod.exchangelabs.com
 (2603:10b6:208:4b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR16CA0047.namprd16.prod.outlook.com (2603:10b6:910:60::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 21:56:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fb39a63-23d8-4411-29f9-08d940c8f14f
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3553:
X-Microsoft-Antispam-PRVS: <BL0PR0102MB355345CF1575EC20A38D48B98A1B9@BL0PR0102MB3553.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ue6SL2dUxLamZzANOGPRXWpICGyiPyXAf/j+t0YOMM2Oj1XnhEL0zIjN6paA6EiT3ONHxnQionkJ/2KPxJcYA30828lyGuUmipgDBMcn54DvdZD6yrT5cb84+PrCLka6MLq9c6fdAbAKTEy5u6lQM95T7LX2Rt3fjkqGQS8EqFI5VcTebv/03MbJNh/25adsluE8NfqMEEBhwblgg+K1GyIc8kq/tNadRe4NyJDxv9emcJNo4sC+hqryDSxCwqCyQ8h+2DvPFIQOj9uyaIoKE/l1iQj92SdW7sfY+EcDgEAhh17n67QBWuhimY+LWZr3O1gIugj1N6xTZNpxJqej8ClVukIsAhASGlMofWuR/dCKzW+uwooKyJTcjMyuUJpTUy+9RnPTorPlepiKzdjC45EvkmmmhiQTYg0PgLH534YvZ+J4HwAx0rRE5ehzLw3jgek1zv7wOHvDFllEqEEGJ5TJg9NkGhljdGt+vxIuQ6gQedg9ZluqaWSbmOyKJ4EYh4Fn+mxhX1mfIai9/jZ3/JDWrg5vHr898PIzxtLBgtJy9T8JJzViX02i9Q+HgltEz1Hf7maO+35iYYjLvLHVjaVO/3txwMVmu0EPN05xsOAzJFIfjjOH9ZQYsrUdv2fs9zENsPj6rVtnVee2ikhQ2Shi+tudwMaF/V0EVNZhgYjME2C907NKt2vLD0o1jZersU7zTa/4tPWxtcM4JrrNAwfP31xx+1V+sOnbgkvrS6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4291.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(346002)(366004)(376002)(6916009)(38100700002)(4326008)(5660300002)(66946007)(66556008)(66476007)(55016002)(2906002)(9686003)(86362001)(38350700002)(7696005)(956004)(8936002)(8676002)(186003)(52116002)(6506007)(53546011)(478600001)(316002)(26005)(54906003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G9Vy77Y9L5V1Ms6jfsOqpWqW4Bg9bac6vT7vzrjKEDjM+BNwtcCor136Lk?=
 =?iso-8859-1?Q?mc8aN1ITjyHz0C7cyfudP8YQLhGNrQQVb/qFDWKkpM4QCGPd0T+S+PW3Pz?=
 =?iso-8859-1?Q?F7YRlNMlrRfakF9tBw7hxfrGYoTH1Ka6z/XhOoedReyIUybBDw7j3AGhH6?=
 =?iso-8859-1?Q?qSROKpKv79eB9XxPmHEr+q4AKzb4T36Lw/pCI268qlYW3XH82bdC4JWKEO?=
 =?iso-8859-1?Q?jZMwbMcTn5VN4vNa2nZpZMdkSLxPtpyun3vgHIY2ENL4qhcqkEfauYEz5T?=
 =?iso-8859-1?Q?rWLhf43vCP7EiETEREAXdg8vD4Txa1soubebMJ/hjKjl+19c55SgQGFn4m?=
 =?iso-8859-1?Q?2JcCSqdaDdBYKRdytMk9qFVgsZfVWYsKKkRbUZnfzljWrCgMp7QC1Dgh2K?=
 =?iso-8859-1?Q?agPNtqjZoA/vungf9+SfyXSO5AYQod7RPEqVC65KSzSOxy5ay4Kp29Zwio?=
 =?iso-8859-1?Q?VibSIQDjn1ROYVMNqwDNyc0RU9DU5pxTaVa9v0wJUubQvqhVWBK2Pbg8rg?=
 =?iso-8859-1?Q?zMMPvtKphIEzjp5twsefCcCLKR4r3KK8tZJx+SJar8MhcLNbiLJ3CkpEKR?=
 =?iso-8859-1?Q?e0qL/+dP6LoXTAZshztRe6UqG76eG19LJpuIIydirDEpKXeyTgeC2vuDDx?=
 =?iso-8859-1?Q?cchL54EeimHzcnkggalFCvmZJ+stjfnCFpqUQd7RQ4MeODOSDaZ04Qwbfs?=
 =?iso-8859-1?Q?JFO/zfdzYkU9hCHNmSSG0vZKciSjmY15ckNALD7ffB4h1ojvWews8jskCR?=
 =?iso-8859-1?Q?VtP7uJZWda0F884jBBGkhpb7jTTJ5xDRXCLXeWvxhEW7/Y9bQoKmDt7/LP?=
 =?iso-8859-1?Q?fbiIY0I69x/8UDeiTZr4uFSr1jzqBvkQ7R+8oEK5AZlkkOLtXYAIN2bL6r?=
 =?iso-8859-1?Q?Wzm1BCaVgmc0Wceg0eH2PFZucdlqSx640v8yRFF2O9BQlSLWMnsZ/qs1pE?=
 =?iso-8859-1?Q?W8dEVEHZNRAe6Cq6Nz320NFLJKtgSsotc0AR20ONFxgVPIn3/cRoAcrE/o?=
 =?iso-8859-1?Q?uZaylf82M79qP7FunbshqtgkE7UReSa/DsmU9hd7ln6tf/TcKJhwTKbKYF?=
 =?iso-8859-1?Q?AkNVIlG0dEXfHd2AS90rSxhRTKu/oqPGXyg8L5y26p2/bVITSvJxjItL5T?=
 =?iso-8859-1?Q?tF6olQiBizHEAqXynxZREnWqARrZyH0dC2KmzeKas4HRu7gr0GhMMPZ7qQ?=
 =?iso-8859-1?Q?CuhAk1rUUqW7jzGyXo9hiXzdcPQbwz44rmNDKpI831Ymz3cbvYCZhi2Pjr?=
 =?iso-8859-1?Q?NDzq/nkQYr/9XDx/Q562jkztEV6kLUgwnW+SH6SC1fXeZhaaXUyQ49ci83?=
 =?iso-8859-1?Q?OQjSyuzzsC1Zkj+H/SQDz1ziRsAumxQ+cCUuQp5/hqZ2gPPYVdfMqiQMRb?=
 =?iso-8859-1?Q?UcuGOdcG6P?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb39a63-23d8-4411-29f9-08d940c8f14f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4291.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 21:56:43.7219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8hPTdHsM3NXogSXx5mA2/2vSYS8ibI4Z7om/sDp3QraDy9lk6An7QuTJv5LR3vPkH9d4XEwdRI5gfyRz7bRgiaV94Um5ML/VE+efJG5vAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3553
Received-SPF: pass client-ip=40.107.100.98;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Jul 06 23:10, Philippe Mathieu-Daudé wrote:
> +Peter/Paolo
> 
> On 7/6/21 10:47 PM, Aaron Lindsay wrote:
> > Hello,
> > 
> > I previously supplied a patch which modified the plugin interface such
> > that it will return physical addresses for IO regions [0]. However, I
> > have now found a case where the interface does not appear to correctly
> > return the full physical addresses.
> > 
> > In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
> > store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
> > is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
> > "physical address". However, I also find that
> > mrs->offset_within_address_space is 0x8000007000 (and also that
> > 0x8000007000 matches up with what an actual translation would be from
> > inspecting the page tables).
> > 
> > Would it be 'safe' to *always* begin using
> > mrs->offset_within_address_space as the returned physical address here
> > instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
> > should not do that?

I realized this was perhaps not clear, so for clarification, I am
imagining the formula for calculating the address would be:
`mrs->offset_within_address_space + mrs->mr->addr`. Perhaps this was a
confusing example since the offset into the region is 0x0...

> 'safety' is not my area, but using mrs->offset_within_address_space
> sounds correct to me.

I'm not sure I was as clear as I could be here, either. My primary
concern was/is correctness of the address calculation, so perhaps 'safe'
was not the right way to put this.

-Aaron

