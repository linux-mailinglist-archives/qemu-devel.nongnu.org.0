Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40855294CA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 01:14:49 +0200 (CEST)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqjvN-00046W-2S
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 19:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nqjuI-0003RX-2a
 for qemu-devel@nongnu.org; Mon, 16 May 2022 19:13:42 -0400
Received: from mail-dm3nam07on2064.outbound.protection.outlook.com
 ([40.107.95.64]:44769 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nqjuF-00058d-If
 for qemu-devel@nongnu.org; Mon, 16 May 2022 19:13:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fgz90HSTvxRQh0YOPOiu/Mq4N7ym4gh7VE49QsmAvPAnzcbRwVj1PKW6Tq/QadB5s5yqvjZe21lkxkVCWVchP2TWVN9K0aoQUDZvS0b2sCgjNqNP9di4+TVSCHKzmXyApFMB9zlJoOJlr2Izdi40mZCyPXVhAQa3/99nsMkPQzCg424pnJOvwt4ReTePwDk4mYig+KhcIqe0pF0r3paEJLQPlLMCmStX9RygpnAVaqUgiR/vdv+BGrLnth1ozVZBUvVX9GfqD/jz3P8mKvlZN0hLbyEJIi/NxtsGjLGsabyR3d8mflqD0ZRqdyYgF7xz8IPnJSdqOCYBaoYM6B2EsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucbrfPSRlUq5afVecY24a/JVcg5TUXn8C+M6sJjosUA=;
 b=RLm8QNF8f4YU3glUxSz+ZVPH7pJVn/4TMFg9C67wtWVEahaRQ7yAWP+zuHdtGR8FyaoxyOK+Ai3kO2EUy6DnI+KSq0sAjM4UqA5DaOpIyyOf7JDTvLvyV62vrS3Cn+ABybTsMU6P4qWvLe3XPUbYlT8XZY6I3raXXrv6ea4GgFSItcUgwyWwsUkINfcvr20W9GEU7v6FE1cshZDgqLjAyKLS9ir7g9/LXs3U1OE+l6rqI9pQ/iPqdFIT/3a+RrjEQA5Ajn8aUW5fNUAXlSp9FA+IwBPhc/KMkOy+Au/9UOljyPcQtPdUEhpzcUGfAMZTbs2MaH/5EWfS4rWfZQatLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucbrfPSRlUq5afVecY24a/JVcg5TUXn8C+M6sJjosUA=;
 b=LkAClqbMvhKfBgl0gufNxlC9ANf2r26Xoz+kv6Yk8OOyjSgJ/KJgK3G01vQwchY9qeRSD83xcvdySvfuhsw2ahqBZ4ss+D877GPHaSXSXsPmh8isAVe05YfHbhvGZ/TZVI8vIHly0od6utTlvbRu0PKyFIVXRMM5M4DcbvzDzTiITmQpY9BbdeXlUSsskoDAri2/uyIfnnNNq5N6UIBNOdRtsV+/nT2rheK2XZPqzw1zFS6kS2SJhX8gmTnnmOivI+YUvSgYW0drIN7gl9DVi1ju9rVFni4HHg39ZxnfE5qzedF2WmXUMXYYaiaQHOPhmfEFqghQBHb9IAIYgl+7Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 23:08:34 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 23:08:34 +0000
Date: Mon, 16 May 2022 20:08:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Message-ID: <20220516230832.GP1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516142200.57003872.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:32b::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aac5ed5-48a9-432a-823a-08da37910037
X-MS-TrafficTypeDiagnostic: BL1PR12MB5948:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB59482ED71AC5918D0C47B657C2CF9@BL1PR12MB5948.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NAO5jjWoKZJAtbsSvJAoGP2fS598R4d8dbvAHysN1TdQXFveOdKQVpYsxl1OxQi6V3beanbMvXMXIS6a5smHfql+3Ks7nrtq87v3kWxMp+baGJ2roZzeCZ7VJ0xQAU+MFybTEnkQKQGsWey7IEFVPs95KPES5SUeofUG/84jYMv+WhvZGYFaqfF3MYYeHEDTbt+ZU5QZR19mK2UAEZZK420HqOcu1C5vEisjG9F9qJb562DF1gHko2ZrgckUQ8tT8OgK/WT7ZXAZyNx0VXfjrUC3KG4nfnmfFWyStFqeVzGUPCEKb5/ZAdeLD3YYTZLUhnaK91h3a3N3N9iyWM0C8x3H77UuterRnpnw0gleQPywBsgRg5CK91nXGNPSHkdh/QtNdm9xWXr9nyGu0s/fA4lvBEomhvoC+kfXAmMkxXasOubMPQYrY0+aYUpiQyXutoVudd8jn+zegX5NpuEBMoXwfcyJTovCsOWYgkRlzHcRsHlbkWIHLpnaxQkKvbfVmi7mRjBj6hAswuk9OBKotvq8mWF4ctwrAqrF7FsE7LQ9zLAx0s9Z+CSo6JXxK1Xcq1tRWHnKm++Mmnpd8AOxtcFEU55L1/dCm1+8SHxikFa+aU3kIhz66ePPgSOVo0U88uEgD/bylEk5nERZDAo8rJ2HOl67LbLuJKjwNSOmEmJQgh94sZb/uhlDNn2xyO1CjroBfr6Ml92QCU9xXvXooQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66556008)(4326008)(54906003)(2906002)(186003)(36756003)(33656002)(2616005)(6916009)(6512007)(86362001)(26005)(6486002)(5660300002)(8936002)(1076003)(508600001)(83380400001)(316002)(107886003)(66476007)(38100700002)(8676002)(66946007)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?925yCSItCyR/bsO8cwFJ3gUP5Mim75qHXSHJwE9pbJkRc8hWUWVbK3VTnX/y?=
 =?us-ascii?Q?MetvQwmJrjIk7pUhcivU4TAFjrk1wLOC49fIEi5CTDdq0d0IDhwYbPHqtCvp?=
 =?us-ascii?Q?twJYbMmmCV1Ya51kuUv/vMS3L3dR7X4fJUfo99s8RDsCdPIBNMrylwGJLVhY?=
 =?us-ascii?Q?lT84gTf8X1xTfQVbTcrII9V/krDHMzY8GRiFxUsM97WDiuoGqmgYXzL/MhlA?=
 =?us-ascii?Q?DISNrg9Z+R7r2bNSQ2iZU+OKz78+XeG4G7/tfZdcc2LFOyVg/cGOdQwLKV6p?=
 =?us-ascii?Q?iwP94XvBP7FRm3ggKljqnoZafxC5brhT1UGd1vVXbO9gRLR+KTUYHfPdIzDC?=
 =?us-ascii?Q?zYDuO+XMJ+6m6WN0qWkln+wokFr17A/kjDJO36JQgnsSCzMofy9mp7fiFEZI?=
 =?us-ascii?Q?3UgBaG+x9QtyaE8OOnY8mePNkRinoiz14iTSwPPIu2jIQzsppO968db7pnCJ?=
 =?us-ascii?Q?CIPQJKTRZgXYU7dOKbOSj9wsaodRl1xEm3Uc68MmxgE9E+nJ+V8y1BKiH+IJ?=
 =?us-ascii?Q?2taHMWvkYRMdN+LauVAvKya2ATkdetwPcaVAjL8l+xIQWqPWrX7rUhXQ0A7C?=
 =?us-ascii?Q?M7QcdNmRW8fZU+L9XW5RIDhIZ4+yL3Wg2i0fGfXx2PWXgSjIerpBn73ypSt1?=
 =?us-ascii?Q?CXZhVsSQBHrKTKgwrfHGZlkujBw7x9NAuuN/zj/uCZgCJPQ0U8HiBTB1JpjW?=
 =?us-ascii?Q?p21LndPt0kHtzLAwk+Ll7QtNWDhRYacpyPdeBeivNIb+Aolc8bS3yuLdDYlA?=
 =?us-ascii?Q?WXhurFbxJvuJ+5QDZ+4wEALeSJGWHos/RHgNtCLqrjH4XquxT3+tiidYs1lJ?=
 =?us-ascii?Q?oQDZn17aSi6RmjLoYIWaGihbkqpF9WnyfvpgifWx4AbxE1mDtiTzsxPQdDrt?=
 =?us-ascii?Q?Y7HPjoUipWOYRD+il+XqHPQC5GBArdUZQvnbi6+5EE4FMK3DRb5xMZqVZVJH?=
 =?us-ascii?Q?LK1glFUhDQsYPYVHRf1g+o8iBPA8350hcnaItzBVlKxtYVfH3L9YaCXrpN/a?=
 =?us-ascii?Q?FFjINchc7A6/YAIyStDxrVGQKm8j1hEjvsefhDAA2yCWuqfMcYMpzFqc5XgY?=
 =?us-ascii?Q?QX9SCcsctBJypWLwAi4pQ4noO2ZVY7s6VsDCgYOK74gh94yvVIKl6Ie0MN/+?=
 =?us-ascii?Q?4EklTzjXHyLItuRyCbN8PgxW5LH3IAwBMvHBrVi5DRzn36uRtQWXhAUEhS3A?=
 =?us-ascii?Q?xO0WutT759veBHcE8R4pz+knI4Y2Rd3jQbwZBzDZ+6TdRoakGF1P6kJwY5Nm?=
 =?us-ascii?Q?6bGC5iOL0VzoR6EPfY8jvK6bvkne21neD9glYLJKe32A819PC7gLJXgAD122?=
 =?us-ascii?Q?XplQkV+SP4u3BT/gIy65a5BS/PEctuoYTXeBVjyY+3xmZncsAEY4a02RFrVI?=
 =?us-ascii?Q?VnwMnDep2uCaxZTjR6RXBALUGbPgpbBk+BqJ5RPh830PxrV9S8Ey50J7g8MY?=
 =?us-ascii?Q?JywY2oGXvdEWdQGcblH9jTfW7QuUkXNC+198F10ZPrwuxtDN5NBVtFT0U3av?=
 =?us-ascii?Q?R1APJbznG1Gjfo8yTOwb1p3fw6piI2OQcO1C9QiFrrzWTR+SvmEJxoeqSW9W?=
 =?us-ascii?Q?PKRGDRyZ0kqj8ShdgADD8c8DsXQB0/R0cPbzjj5p1rrCZ27ycmUSuXpT3LZe?=
 =?us-ascii?Q?uvgkQW/O9gIkMxqNKuPlf7MUVB1y+SaFkrV2boFyx6BaQmp1gzYrKwmFiI5K?=
 =?us-ascii?Q?ntFlItVEW9g8KgIan2KnEqSwU/wROZrovLYoFI1GP1nA8UlojxJiSZvWaAyR?=
 =?us-ascii?Q?ySwgsXyTgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aac5ed5-48a9-432a-823a-08da37910037
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:08:34.1019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO3S0Adfi5eWNTM7eCeH2xfb3CJJxkeHlkLtn6AvkfIstZoMDSeG3gr1I50SHUyo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948
Received-SPF: softfail client-ip=40.107.95.64; envelope-from=jgg@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 02:22:00PM -0600, Alex Williamson wrote:
> On Mon, 16 May 2022 13:22:14 +0200
> Juan Quintela <quintela@redhat.com> wrote:
> 
> > Avihai Horon <avihaih@nvidia.com> wrote:
> > > Currently, if IOMMU of a VFIO container doesn't support dirty page
> > > tracking, migration is blocked completely. This is because a DMA-able
> > > VFIO device can dirty RAM pages without updating QEMU about it, thus
> > > breaking the migration.
> > >
> > > However, this doesn't mean that migration can't be done at all. If
> > > migration pre-copy phase is skipped, the VFIO device doesn't have a
> > > chance to dirty RAM pages that have been migrated already, thus
> > > eliminating the problem previously mentioned.
> > >
> > > Hence, in such case allow migration but skip pre-copy phase.
> > >
> > > Signed-off-by: Avihai Horon <avihaih@nvidia.com>  
> > 
> > I don't know (TM).
> > Several issues:
> > - Patch is ugly as hell (ok, that depends on taste)
> > - It changes migration_iteration_run() instead of directly
> >   migration_thread.
> > - There is already another case where we skip the sending of RAM
> >   (localhost migration with shared memory)
> > 
> > In migration/ram.c:
> > 
> > static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> > {
> >     PageSearchStatus pss;
> >     int pages = 0;
> >     bool again, found;
> > 
> >     /* No dirty page as there is zero RAM */
> >     if (!ram_bytes_total()) {
> >         return pages;
> >     }
> > 
> > This is the other place where we _don't_ send any RAM at all.
> > 
> > I don't have a great idea about how to make things clear at a higher
> > level, I have to think about this.
> 
> It seems like if we have devices dictating what type of migrations can
> be performed then there probably needs to be a switch to restrict use of
> such devices just as we have the -only-migratable switch now to prevent
> attaching devices that don't support migration.  I'd guess that we need
> the switch to opt-in to allowing such devices to maintain
> compatibility.  There's probably a whole pile of qapi things missing to
> expose this to management tools as well.  Thanks,

This is really intended to be a NOP from where things are now, as if
you use mlx5 live migration without a patch like this then it causes a
botched pre-copy since everything just ends up permanently dirty.

If it makes more sense we could abort the pre-copy too - in the end
there will be dirty tracking so I don't know if I'd invest in a big
adventure to fully define non-dirty tracking migration.

Jason

