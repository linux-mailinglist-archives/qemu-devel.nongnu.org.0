Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720366A13C2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKz3-0000Hw-GB; Thu, 23 Feb 2023 18:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVKyn-0000H5-HG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:26:25 -0500
Received: from mail-mw2nam04on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::600]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVKyf-0003pz-Vj
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:26:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF44ltKigtawecf266/Ds0FF5mQDXM5HEjfVXOlDox+mhhR4y+baLGMinCVn+GGyU7du8c8A+X4A1BJPt8swq1azt+N+6BHdD9dEfvlHiRkoAxYGdMQHb1w3EP5Hzgv4T/NGC2DoWS+DAa1EW/IEYdwvVNIqqfuhMg3PV0XeoXWXAr5BNs0kvM0JohuTre/Pzfsa3GCKboIOs4PWcWpGSsSOxl4HEf1Sg0nrkBGXWwTXn7UHCROCYhGbXScGBySh8xVNHVg/QbR0SF0xjAZakeAhxQzeGODofWL50GhXEpLA/Slv0WyKxVw+Wqptfmv2aFY5EUHRfqaqvqY8BX88ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A7+7/dFNMFHMXA8Bwa3LXuXKe7nAxfPF78iGE7Ea7Q=;
 b=O3sHxqewKKMK9bdlkJTbbh+7tVUaqGTXIpehK+0CTx5cLSLeWg6h7zfDBIqZ1S1m9aVczSXAjd2SIhIlqCFxU63NF/WJtuLeQmf4O6hHyi8N+XSz4Bdzot/etxbw7oppAXQcPp9UacUxJOYpn0XH9mvsqnq1dKmyWE9WskGph+6Hj3mlM+0MlU0rjzQXc5RoTYpF56LKe6JjVgTPazOZF6zGH/DKYxj1xSv9r+nuf4LHlPSuxj2dp0w9CyYmrSc2NqPBGAMgf8j6AoYzZRZ5W7lYV+ERgKMGccMrNxNqOueHrscPb8vPAYtCfZ0qKg66GvrKFE4ApvOfqqoQJgCzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A7+7/dFNMFHMXA8Bwa3LXuXKe7nAxfPF78iGE7Ea7Q=;
 b=MMhyl19kVJ2q61mVo0jM4i/wLSAp/7ZFYyT+1N7qq8smsc+Jkq68m1yxydcTaZNO3DEBkOina5ihZR+aD42JnXOqNzp0R3vdXw+2btjK+xykaVfgNWh2RsDnUt5+4frkrmG9sQODIMf1eKpTaRt7mXMk+pA7ocOUVU3SOYxAGmMazmqc1EG31GWlVEYVF62JkyJVr1eWQMV+Fzx/1/B/PfO6tnApm6V69blxAdrpgAEj8n1WUDWiIMDbIAJ4BVfBxT3RpopwU15/CqVcZitgHvp4AU11xiFkoPaPf7W0vv9om7YXP3HnCXUhA0BqXQ9LMfON6yXTXgBa9tDIMv25AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 23:26:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 23:26:02 +0000
Date: Thu, 23 Feb 2023 19:26:00 -0400
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
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Message-ID: <Y/f2CJXGLLAtFezU@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
 <20230223153309.298af6e1.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223153309.298af6e1.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4261270d-6ab6-4bbd-8389-08db15f553b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTtTEhuvJFwtMVLgxMIV6Au0WDJ4OOpD3kY2nmn3NRr06T2KohlufxPazhuTGcoUe/jYcJUFg0Pv34jknHMJ/S7abLkSBZg4inOnf8RvbjpfPhiCUyl/JP1JQg0IoXn3efnQbrxCy8EzKwG50nr261VZQofz7zRgPk43CIohhzNZAnhH1WePMfXZk+DtWYkNTuGlHFkRUjYWTCXxhZ0x3DWZbCAIjXguhFhlJ/ab28rIRKaCVMIBtSHugmCMl+BQT3GI41bAOApD9oSpSGEJiBoAiMLVqTAGXd4zOSeraCQd6ITIj1RwRb+JORy6pPbYsNsIvXq4lJ6Gxl+PvgWsIfcHFQiVSJYDnWADkBEx13NZfLkZ7eFews5RvtOfCA65DWB9DPuyzSas3z8LAlI0pOx+QtNEgCOU1ObX/6qTLeKjEw1KIx1AIv5uQHEgT/gepyDLi7E49xuxjuTK3Q3I7CZRsfsnAC9adF7uLKQOS6G9WtUhEdG8bUA4TMLHlMy1W+x0n+cY3LyzFCjpTdcLUTwU8hw4bPfDH+StOA3Yo42Go7hUIZ4yH3wTCU93J7XAKM+02EXhnZ3+0OQ980gx73Z5jtw9xR1KJNF/Z0pkZYXbXgiPDW/8dQvZ8XSkWJv9mt1b4Ho/j+tuiakrhp2xa+gAxbH4v4PrDdIPZ/rrFHC5Yp0ksmtEYYY62C2QGTF7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199018)(83380400001)(316002)(54906003)(478600001)(38100700002)(36756003)(2906002)(86362001)(8676002)(6916009)(66556008)(66946007)(66476007)(4326008)(41300700001)(8936002)(7416002)(2616005)(6486002)(66899018)(186003)(26005)(6512007)(5660300002)(6506007)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LajJStroCfe8iIPPmrMLNNCg4MAjBTFYBC6BwaQvv/n7xzcBzwv4MMsxPkqd?=
 =?us-ascii?Q?dpsPQs6UjLFt50Ebg0i8aWgaBeCCBkElEIUTPA/+pK7aOgnhmNkcVm3wEMRb?=
 =?us-ascii?Q?MSIhzbLioDfJG5IN20NqC3bpacrLP/30+oWqzwzXPY6XcQgvd7RfNu0g/voJ?=
 =?us-ascii?Q?mtBc/aT003YsoWjwwFTIYrPGjPa06BCVanHGrFezgAO29IN3COLYrmjnGaEb?=
 =?us-ascii?Q?gm5gLFAsZHNQP8znRQXhit7/6nh2FjEn8QWvVWoNxt9CQuh8IdkoFPYRNfN7?=
 =?us-ascii?Q?n9Y08gsf7pRqqdv6V75UzOi6nWrvIJt3Yug1DJRb0ADpB3LUhtD+211HqYXi?=
 =?us-ascii?Q?sCoPiBf+z1gWXXcYOznILhpE5Inbq6WGzi9nd1szy71Thcj2Q5FriUrKwb3z?=
 =?us-ascii?Q?eU9makCxEI8NshGonS++yFG6kOVFWhy5rVF9wkKs4eflrx+YURx6Q4MsS5YY?=
 =?us-ascii?Q?3wHwVEoEIolF6egpvvlRrGDrZFeOYbIaKVn1triG99ZwLK17DEnb5w5uZYPT?=
 =?us-ascii?Q?eaJPPtH8PZCfQlyIwFH959j7WF7h+GITohWsMIJ6Gms76o3Nj7RgAHpAB5g5?=
 =?us-ascii?Q?s7y7ehFCdrQzop78uQYSp40oo1l4gX+n9ad/bevdC+DtsdjvydIyybupwf2r?=
 =?us-ascii?Q?8CXEDfxbkSUiLbhdks0sB+ciWwXA4ULLaVfTAS1EjpR2RnNttCcQgsA7t3ca?=
 =?us-ascii?Q?IjxMPShdVIfpINrDK3TAoMqPbDMZsfTMENKx7M4iem0u51rTi5uKGT3WAZKk?=
 =?us-ascii?Q?+B0m3t/SNEgPPkxrncv0uTTE0rvQA0UzEAajvsuvipFlGkToqBfeokB8cWlo?=
 =?us-ascii?Q?n2kUKXxUJqE2n1l2NpHZhH/abT0l0E3raqCBg1gOesY225+2z6RNWBL7ob9R?=
 =?us-ascii?Q?PeWygykAjAFGFdzpkm2hDXEnWT+Ja6ftH1tRYZ5KslT2laN1jhHCO5Xhk7xD?=
 =?us-ascii?Q?l2l7Zaq4npxfugUqoMHgOz5T79xD2Kvlr0bFFJu7QC1BR+w32CDogUCp7yde?=
 =?us-ascii?Q?2BhSxpKiX3UovuFzTzmKYVkmJ46n+ubyafZfqqn8RVHYMj/AEyJVEcmizlRy?=
 =?us-ascii?Q?5C6RQwg9NKDayydCqTWcf9Yk5dvmI8kcBvJglyz+S4LcZ7qhdOZjZ1N4P18e?=
 =?us-ascii?Q?i2OTi5AT7gHd6mNsokZKsSbBjJQvUJah8opf/aYxfvOQxNzVD+Sp2oKevcbx?=
 =?us-ascii?Q?qvoAwGCVPSpxQu1v1uSD++bbtgp55htj+AETdsRAKzFiykhV8eznNX+KILD2?=
 =?us-ascii?Q?rnAICFQZGHlRZcs1yaVqIWKBKxgGlvFywPE3vm0bMUWqMOC7xaN2OwxcWjSs?=
 =?us-ascii?Q?cDEyAPSa5NLQmwEBSyK8+EWgfCbxHYPIakLv00h0JCX7f/M4WeuuhUREyjKS?=
 =?us-ascii?Q?DaLuhXXfIsroKigktQBbEHQ3P9ADnG+J1+MNvfg2UcZYROIva2V+7absnz/4?=
 =?us-ascii?Q?gVRpt+/tuct5yrsS0d19/wt+l4rCbQU+jUBV5WZjud0zhJn7SIYNjYJUup6c?=
 =?us-ascii?Q?heJpRfBeiT0E8NSMGys6FH0cKrlitFXxA6WTXjKEUyk6KarzVBv2NsXfvO5s?=
 =?us-ascii?Q?oGcz8jMJNl1YbCVSlslQ7g4C8MPtyF091pkMBKgS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4261270d-6ab6-4bbd-8389-08db15f553b7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 23:26:02.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTJ9sMQxv7CLbDkb1xHDKbU3c80aQ829rnFbWjIFe2IrAJD8LEy1z0i6BGriAISr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::600;
 envelope-from=jgg@nvidia.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 23, 2023 at 03:33:09PM -0700, Alex Williamson wrote:
> On Thu, 23 Feb 2023 16:55:54 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
> > > > #2 is the presumption that the guest is using an identity map.  
> > > 
> > > This is a dangerous assumption.
> > >   
> > > > > I'd think the only viable fallback if the vIOMMU doesn't report its max
> > > > > IOVA is the full 64-bit address space, otherwise it seems like we need
> > > > > to add a migration blocker.    
> > > > 
> > > > This is basically saying vIOMMU doesn't work with migration, and we've
> > > > heard that this isn't OK. There are cases where vIOMMU is on but the
> > > > guest always uses identity maps. eg for virtual interrupt remapping.  
> > > 
> > > Yes, the vIOMMU can be automatically added to a VM when we exceed 255
> > > vCPUs, but I don't see how we can therefore deduce anything about the
> > > usage mode of the vIOMMU.    
> > 
> > We just loose optimizations. Any mappings that are established outside
> > the dirty tracking range are permanently dirty. So at worst the guest
> > can block migration by establishing bad mappings. It is not exactly
> > production quality but it is still useful for a closed environment
> > with known guest configurations.
> 
> That doesn't seem to be what happens in this series, 

Seems like something is missed then

> nor does it really make sense to me that userspace would simply
> decide to truncate the dirty tracking ranges array.

Who else would do it?

> > No, 2**64 is too big a number to be reasonable.
> 
> So what are the actual restrictions were dealing with here?  I think it
> would help us collaborate on a solution if we didn't have these device
> specific restrictions sprinkled through the base implementation.

Hmm? It was always like this, the driver gets to decide if it accepts
the proprosed tracking ranges or not. Given how the implementation has
to work there is no device that could do 2**64...

At least for mlx5 it is in the multi-TB range. Enough for physical
memory on any real server.

> > Ideally we'd work it the other way and tell the vIOMMU that the vHW
> > only supports a limited number of address bits for the translation, eg
> > through the ACPI tables. Then the dirty tracking could safely cover
> > the larger of all system memory or the limited IOVA address space.
> 
> Why can't we do that?  Hotplug is an obvious issue, but maybe it's not
> vHW telling the vIOMMU a restriction, maybe it's a QEMU machine or
> vIOMMU option and if it's not set to something the device can support,
> migration is blocked.

I don't know, maybe we should if we can.

> > Or even better figure out how to get interrupt remapping without IOMMU
> > support :\
> 
> -machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
> -device intel-iommu,caching-mode=on,intremap=on

Joao?

If this works lets just block migration if the vIOMMU is turned on..

Jason

