Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD416ACD91
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:07:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGAZ-0001sn-L0; Mon, 06 Mar 2023 14:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pZGAT-0001mu-Ho
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:06:44 -0500
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com
 ([40.107.94.78] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pZGAR-00069m-5p
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:06:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZamiYqmNbN1hcrLEUZuV5yh7Fxs58zbrOdp/5CnHxzMKqB4yQdTsRLCHHKcTYKgNYHTwHfHA1tNJMAq9DxWVMrqU29vi4cIjFJhGB8YtWgbAP9nqM6gywJGh3zgAhacdRkF+Qhp7SLmQW5VYa+mbhYlZrNa+1QqxZ9pacLHObOW8wL/2fepPWPrIoTd6LkSXTbcY3KyRbXu2Xp1b5p6TI74hT+btp/hmXUcfUg2nyV1/sZe1fPLs7EQTrridB2R5LW3lBLfmYA+Kr/eE1Bt6Y+KOY7DhPnvGV9a0bh5k1SuoOlhgmPHKCtS8wZkp2Y8EpwI66zACPaCkMOMOjluVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMGcBKSorooDYvpk8ikbPeS1bva+tPTsaDkRjpsZpWY=;
 b=ObH672/537hLvxHNGgAx/aSgiSdyntvBXRLxlvSNZ9izY5Libau/k77+8M5W+yS43gYClenUgWpi8l9z0m/8AeX0RcMoAnuOBeoRvy8ON/PV2YaCRxE1/PmqnavDVmyAEpVaxVF00SulGfxmjRmHsFU2nh1mptGFtvELmHYwKvRtHJ+6XKXaOXgzbw8Q/3sqUtC1she7RnX7v358fO9Hulqv9O5LG7s9i6OBb1jG6TBsZhxFsklXqoI2BdA5aX6yLSQJ3Bq6Uu+Y260MpvzRS52cmQ0RwRYEd8SAPy/T+wnQVxwL2pt08y+7Tb7vMLT8gpiIwiVsbEl9UsfJzuEARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMGcBKSorooDYvpk8ikbPeS1bva+tPTsaDkRjpsZpWY=;
 b=fAfQVHHXUigevGrYBi19m1zJ0mSnQRywC6F4cHDr6dUE6CWVbzM8P5eRYepVBTOE/bXCVM/RKPoJQRJpR1zO+KsCdIWCtUS/D+ykYCvltQgA0UY4yptArWK+KFeM4xrHXZo7u8QV+EOE5epmwt1QXpnNSx53HqjP+QD8aGRypnOaSeuO83n/pHHTvZistOtQJIhwQXiFsYIgn6YcqlwSyV28WXaL5xcjD14HZrZTBXmBTvERgbps0GMyWXi3AvbUXg88XcAK1hIbKzIH/Nm+8ODEsvn0W7QfPwyPux6rl2zdRUt4f03mVjCo0+LqFfwRP3yQ+jAOUgf1X39+OKZskg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:01:33 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:01:33 +0000
Date: Mon, 6 Mar 2023 15:01:30 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <ZAY4irAjkZTaAh2R@nvidia.com>
References: <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
 <20230227104308.14077d8a.alex.williamson@redhat.com>
 <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
 <20230301125559.613c85e9.alex.williamson@redhat.com>
 <Y/+/0z/MEkKuLNgk@nvidia.com>
 <20230301153917.243792b8.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301153917.243792b8.alex.williamson@redhat.com>
X-ClientProxiedBy: YT4P288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: b869db2d-4d7c-4ec8-8253-08db1e753347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TExHzfa6QNgraetkxNQj5KWN5j2xrllHeDdfDBA6GVblQsGv06sycawIWUAvmRWhcnAhmXVlEQz4hXicNrfzFSKIdKXOoTG1VRBCZnPEMhLQ0Ky5GVEXdpTpFrnBVCqBvPtSJdp3JAHBj6DBDQS7bdktJL02xtZtgESDMjgbX1KKQKLVtYYjELcOb0/Trqs+OJu6Y+6x9jqKGSNXrIGov2EhdYtdWTw1P+H/raOTGdVWN5rTSysMdd/1vAJ34VB+Kn0xt7cqOKS7+0xhcBTRouAKW5mYABcdiNrsMGMOKcYACG1nEIxKHAh8z89qpaO+1tc4rTqXNEYXuDBPJsDi6Z3SVoDW62Lndi7qdJlHrc+o7r7W66D86t1EeoNJEt9bS1GqiX6LZg6n3rmWtvp0SCxpL9ZShLQSllHdOSWGpiKl6+lazhHbM0TGWUp44UvEqgRTTJwqjdfXu5rjqlhI3ap/P62kOYTpfaQ1bHuDrAw2OKDY+MubaE1kMFJTIcKRW8a2LGDPSaJPdrvL4CCL4cAaXJOYYnMAn519627DyF2sqD6zxINZtRa7vG05RdGSy0pbtMG4YfAk1ScXm0bYXkmF6WsV+J/YxpFUDSxGK/E+J7TnJ4ELu6mqw8nJTqQkWxlmPoyNnLX1HJ+/ffeWoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199018)(38100700002)(86362001)(36756003)(5660300002)(2906002)(66946007)(66556008)(6916009)(4326008)(8936002)(8676002)(66476007)(41300700001)(7416002)(2616005)(6512007)(26005)(186003)(83380400001)(6506007)(54906003)(478600001)(316002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eX46bfeyFBY3fBoLKLmcbzEpmwk/dx/xkvATH1kLmwWzGXZDsRjz/Fu2Br9N?=
 =?us-ascii?Q?Drp6xf1+62UVIqHaPfes6+Z4hflfLBH1uT/ffs17t6joibLlDfCgs0Ji2wDS?=
 =?us-ascii?Q?kNqIE08ZbOtFRStPvtHmJBveq5wBMwQVQxZdFyfbuD4Aft+uWSmx73n9yt+7?=
 =?us-ascii?Q?2M3LLcPeuogOEiQ5p1p812il561w8rbjidHxubtVrvJJbBXUtgXbWThfJkKm?=
 =?us-ascii?Q?vuPzMJCudJ+x3yJlWXWO0SFrMgsGbFbuo6zIegah6dy/BMwdkivUnLwa6fk3?=
 =?us-ascii?Q?P2WwePFbWvS6b5A4pD67CEQ7YgIa671Qh16IJ4bMajKLGmnTm/kTQMGuzu4k?=
 =?us-ascii?Q?jwRTwYjviwP4BGvTqSdrC/KIOKsPKzdm1BOWDs5pDacTmRZvrVrdlaPD2n9V?=
 =?us-ascii?Q?gWrCoOmsO/ztHKcCVGGjsdO6WPnLkSpUTJfUcTdEHA1MvgK9a2BkgE+8Up96?=
 =?us-ascii?Q?NGsamn0YymrvLvTl7qy3RcmHrgF2H3nt0/ZAL1of+toonvNpQvm7lNpfQEBy?=
 =?us-ascii?Q?TLq2BV/CEnrvFp0rTlHkUwmxLXMacbM1Tv+jlMmZwg7NEVfDgPDqOYCTjpUZ?=
 =?us-ascii?Q?HN1GUS1xdlmJSsKxom6YFSuO73XLIGQ7KabnzwHoV8Qn9XQ7yJt4Lh7/BT2v?=
 =?us-ascii?Q?RsBNd3FrhPINplHVs6twqQc3Oo0gRLrR6qX3U3zzXfK1qix2tJ5KsGlw3kWr?=
 =?us-ascii?Q?mNp26VjY+XVJaz7U+oQhNMTprKXk/D1W23nwTqPzooQLA66rfAqRAcwySewX?=
 =?us-ascii?Q?iE4O8fXC+7RTrM15XEnelMFlrcbMMaFg2A5/EOuRmgopRhGgLK0cLmbLZ8In?=
 =?us-ascii?Q?QkePizzMGgc275dzCcDKOag9NDB4DdEND7wvTFixO2AfjcZnyACFlzZfYMoS?=
 =?us-ascii?Q?8/abd8FdE2ZxszvrYoAlMoEchL/HgVIhxMIOj3ZuNloAU9eIp/n2QGhJK9sZ?=
 =?us-ascii?Q?Dq98mvXV1ZO1KtF/j+L/jjdoX66pXIUM+B5AGEoJ5e+MzclEs4uHmEl5vIkD?=
 =?us-ascii?Q?hhUpS56eL/vSe35QB5XykjbZaJm2bCgyw/XtoV56h0EQwSxB0xcYMxvjP9v9?=
 =?us-ascii?Q?nto3GFaDoZhb9N2iI9dcJLIaTKgVx3/r4pC1Av12NwsoaUy/WWdThDMxKT5c?=
 =?us-ascii?Q?UeYYlYfLlHz83XKiEL7To9nzfKORkjWqHSXjObnE9LO76irYaTJLbLlkO2u9?=
 =?us-ascii?Q?ApfC/vugUJAg6K1ylmgI8eSp1jJ0HulFiMwQrGnjJsKjgflbdWBYHujTSMGY?=
 =?us-ascii?Q?hXJGf9cZmGY2opYU7dhIb39GbcwoG7m1hVNZ5513q6ZVwHM07RtPh/5sRxYP?=
 =?us-ascii?Q?+i86pcwJwusuOYqFKpZjCKau5STqPHEj0QYA9GU4gBePpectt3hvkN5kSOCH?=
 =?us-ascii?Q?7kTMeS9qZTQVOKbLFdJNtvJmI0Yhq5whgDusaw30YbRoPP/6iOAPJ9ZxWtDp?=
 =?us-ascii?Q?QIbFR0/4uAaotDJqzDdplicQiAgVQjDDeBxheAvADlrdO8fOiixWb04w+1wp?=
 =?us-ascii?Q?ySAIT/feJqaXOFUED8+0nMBWEjYiQSWOYmLcaPykMEpF4ybDBS3DJH87fIZb?=
 =?us-ascii?Q?m0Qj61YyvORoxN+WT/gY3AAYw3JX+eNQOrGrd3RX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b869db2d-4d7c-4ec8-8253-08db1e753347
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:01:33.0743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZkyIsF5HiMEU58zTpOldEvloknlFsZhWA574AtINsWCaLJ+K168vjZbP6OOP7hp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
Received-SPF: softfail client-ip=40.107.94.78; envelope-from=jgg@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 03:39:17PM -0700, Alex Williamson wrote:
> On Wed, 1 Mar 2023 17:12:51 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Mar 01, 2023 at 12:55:59PM -0700, Alex Williamson wrote:
> > 
> > > So it seems like what we need here is both a preface buffer size and a
> > > target device latency.  The QEMU pre-copy algorithm should factor both
> > > the remaining data size and the device latency into deciding when to
> > > transition to stop-copy, thereby allowing the device to feed actually
> > > relevant data into the algorithm rather than dictate its behavior.  
> > 
> > I don't know that we can realistically estimate startup latency,
> > especially have the sender estimate latency on the receiver..
> 
> Knowing that the target device is compatible with the source is a point
> towards making an educated guess.
> 
> > I feel like trying to overlap the device start up with the STOP phase
> > is an unnecessary optimization? How do you see it benifits?
> 
> If we can't guarantee that there's some time difference between sending
> initial bytes immediately at the end of pre-copy vs immediately at the
> beginning of stop-copy, does that mean any handling of initial bytes is
> an unnecessary optimization?

Sure if the device doesn't implement an initial_bytes startup phase
then it is all pointless, but probably those devices should return 0
for initial_bytes? If we see initial_bytes and assume it indicates a
startup phase, why not do it?

> I'm imagining that completing initial bytes triggers some
> initialization sequence in the target host driver which runs in
> parallel to the remaining data stream, so in practice, even if sent at
> the beginning of stop-copy, the target device gets a head start.

It isn't parallel in mlx5. The load operation of the initial bytes on
the receiver will execute the load command and that command will take
some amount of time sort of proportional to how much data is in the
device. IIRC the mlx5 VFIO driver will block read until this finishes.

It is convoluted but it ultimately is allocating (potentially alot)
pages in the hypervisor kernel so the time predictability is not very
good.

Other device types we are looking at might do network connections at
this step - eg a storage might open a network connection to its back
end. This could be unpredicatably long in degenerate cases.

> > I've been thinking of this from the perspective that we should always
> > ensure device startup is completed, it is time that has to be paid,
> > why pay it during STOP?
> 
> Creating a policy for QEMU to send initial bytes in a given phase
> doesn't ensure startup is complete.  There's no guaranteed time
> difference between sending that data and the beginning of stop-copy.

As I've said, to really do a good job here we want to have the sender
wait until the receiver completes startup, and not just treat it as a
unidirectional byte-stream. That isn't this patch..

> QEMU is trying to achieve a downtime goal, where it estimates network
> bandwidth to get a data size threshold, and then polls devices for
> remaining data.  That downtime goal might exceed the startup latency of
> the target device anyway, where it's then the operators choice to pay
> that time in stop-copy, or stalled on the target.

If you are saying there should be a policy flag ('optimize for total
migration time' vs 'optimize for minimum downtime') that seems
reasonable, though I wonder who would pick the first option.
 
> But if we actually want to ensure startup of the target is complete,
> then drivers should be able to return both data size and estimated time
> for the target device to initialize.  That time estimate should be
> updated by the driver based on if/when initial_bytes is drained.  The
> decision whether to continue iterating pre-copy would then be based on
> both the maximum remaining device startup time and the calculated time
> based on remaining data size.

That seems complicated. Why not just wait for the other side to
acknowledge it has started the device? Then we aren't trying to guess.

AFAIK this sort of happens implicitly in this patch because once
initial bytes is pushed the next data that follows it will block on
the pending load and the single socket will backpressure until the
load is done. Horrible, yes, but it is where qemu is at. multi-fd is
really important :)

Jason

