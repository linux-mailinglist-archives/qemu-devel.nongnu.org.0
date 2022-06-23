Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E5557E71
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:08:11 +0200 (CEST)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ORG-0006Mv-GN
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1o4OLH-0004ub-7p
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:01:59 -0400
Received: from mail-mw2nam12on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::61a]:21185
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1o4OLE-0004da-HJ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:01:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U70dvViDNwgS4l6xY3pmFVxOiFgDHwgb1fvTmTY86yM4OK/Zd5gIN8Hpcv3hzA/NE+/Yo7DWw9XwAYQAApKseeuyT2TibxOb62+HBSxilzn4yToY33lPw8nNO0jwn/GXxtQn35X5KGOUwPgduUxAuDjhbrAF9ilzKBsFe5LqjRV2fTfQpoVMcZH1l3s1tRJIuoH/nKJ12OOlcEAIH+zI9N/169GPsX6TBqnV0cV/4tb+ouIhb2XA9Dc3mcvmKu1ht9rnwJF1JmDlei/V5DxfpOlaqbDzo97BXrC4g1El0w2bTt34CcZSYAauN5oVn6Jln8UD+H2UmyDaT/yfpraj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8CEXFCtb0OFdP7t51vf5GqvjPwm6U9+TyttN+dKSJk=;
 b=GXwYEsbADhW2tQiU/w0G6vn9d7SGBXeO6+XhG0u1TV1hIABzv9dBlbj0hR2DOwq5o+VJxwtWl8+hYeG1XRFtTL0AhTBhUs3SojtCr3OtNKdNy0GHCyqdL8vcf5+SUcQdQ7R6ExW9bQmKUJevqpJmvA37hOx84nfkueoxZftRSpy1slPNnuJIgSSBD1f1hMFBHnyG2n7a6T6/7lvjOdA8zgBlRu3EWcAX+BH6SLUb4ocwLETIGz3N5dff7u2AjhwDvqScjZdqzVl8b11dWle3AJ1REEIBZjSaFcYEfdtYWmgGfpAkIt5CZ6Y7Bfam6ptgP/q96UpvfRObfjmuP86+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8CEXFCtb0OFdP7t51vf5GqvjPwm6U9+TyttN+dKSJk=;
 b=Dua1DbgbzevqwZ+onExyaQOx81L9dmClLuoBKAAWg3/b4WupjIsV8HZ8rR/9xwGkLC6mkjAnQn2as9kKCgnJujVFK9xuPexxFPIUYsoHRiXI+intZClV2FVcp9+JQHco5D9bjXbpwdtVNV0myumQsgM+LoMC9I2cIj1xGKkHPNAprmOQj0QR2dzV4ZFkNMLJy8kz3u0d/JNrcIUt0BG4giri9ouuv2jCTn2RXIkkPu3UercNdUjAiWGpIBMXyxdxH1arKmkiCEAhVyb3JQYDJ6nQ7cf45bbAkOf9AU/c/sQpSP5uNk6jDPX+mTChXYNuG4CGOkxF55X0HrXEx6Fylg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM8PR12MB5416.namprd12.prod.outlook.com (2603:10b6:8:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 14:56:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 14:56:49 +0000
Date: Thu, 23 Jun 2022 11:56:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 00/11] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20220623145647.GA4147@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
 <20220607153239.386fbed4.alex.williamson@redhat.com>
 <4973fad7-5e71-aa4c-dfbe-24da254f3cfa@nvidia.com>
 <20220617155129.206749cb.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617155129.206749cb.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7232077b-c318-4d3e-ebc2-08da552899d1
X-MS-TrafficTypeDiagnostic: DM8PR12MB5416:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5416854F932E25E2F4AEF047C2B59@DM8PR12MB5416.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTfQGWj6oZYNTPZL2jY9z8MHehz0eMDPb/RApOc9txB66xBTy349GUD4qLghZX6/P8Abo31f+y4Qjg/JcyTW4PXSUV/mPZ9ORehe58GdvM7sSgua7BFkW2PUZDcYmavmHlZ1MtA6sFboXZDjXxW8kBW0S1kDS7ORQHlF+Xc6/Tc7D7nTRjxJk9VqCH58YrJA5oKDO6w92DPGYslsbGOV7AfMlcIKOd0r+WirVk/YSwlpMUgiXJNoLyE7vXPSVvd1jI1OD6kFRuhAqmdlWa7pq0q9KkuyvpSgI3VDUgjSAzHnE020sk+3tVVmmr2ZyaYLLYGI1wXyq3Lep8xGoLBNrMmqu4zZs559VYrCcDTmPet39Z2plgJK/bDUK7KfTaUAIlolQRRKfbXvdQwvBAibM720XTEIu0Itz+Mv3jmUcENqKDYIpPdMNVQ/HACilr8g9RxI+tIg2r91W6+50HcEY9JNMkJ0qJWFQaBUSyTDCxBRInmd1ggC/KMm3612wO9QZwn+wtXsowXNAP0pPj7TukmExZU/R7xOiZ686b1Z+3V6O477BchVzz6A5T95pKoTNsiTLd59jlTt+4xtCFichoIhOlm2dOKFZTlzMXmqfgy4xGNERsxB7jcPQVN/I0ExATXM6lI2JfYSM+YwKcsFN03uil4lBZNy7AHrsPrYtXW2iOYDUyOs2KiBhb0CjcpDFZ2uuLQq+hXLF5G+H41YKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(2906002)(478600001)(6916009)(6512007)(316002)(6486002)(5660300002)(41300700001)(66556008)(33656002)(86362001)(8936002)(26005)(54906003)(8676002)(66946007)(36756003)(4326008)(66476007)(107886003)(186003)(1076003)(38100700002)(2616005)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fi2VwBP35RhWB6eNMQ+FK7fKZfFIMklrj+6a6BQLmgQ6yNEM6e47x9rlAJt3?=
 =?us-ascii?Q?3INpPrkEWt2DZKnkKX6cFRAIa8XZRfqBHvMrc7JKHEkw2l5Lk1FQhNh/51Zh?=
 =?us-ascii?Q?zNmwplMf9+YCTF4Dygt3iks2qTegWh1ixFpdnKq7RpejNa47jSR23dYHOjPz?=
 =?us-ascii?Q?i4TbOVooB8qTU2VkY/HyKFW5x72KrkevrvIDFY2XYY03n0IX4n9DBcqmaG3J?=
 =?us-ascii?Q?Huhv7eowTjmMzxpT6HBfMgcAcaWIVn9w+lO86S/JmstppSfCS2rMzcIuaFoC?=
 =?us-ascii?Q?nYCLIM2nsA8hlN0YowrphOe8o4XOTHnGar/YCmPzv//HAJvpviQ7SW0K2PXu?=
 =?us-ascii?Q?VtdPOQExyV4yVNkfU9NscDLAthHTWbwfue0dQfRZh1EG9zb2cywHWnMM36ZX?=
 =?us-ascii?Q?wR/iYLjWTPAVUZ7gTdhUbz8SWI5D6P1geA5/mBVuBTSsfqz2EdrD7z3gErCF?=
 =?us-ascii?Q?AERSKSnFdcA+v81UrA+1BJZi+VBT15UHqxHDQVLlcia8wzG6pQmCYhPzNQas?=
 =?us-ascii?Q?idkqexOQgWErBE5iJYboiFMZGH/jqf7bvs70kJkLS1llQlSdlqROdyF3DG/s?=
 =?us-ascii?Q?BHZ4rh72sTfINdsaktVFiHNRvYquALpIzkMw0ncQRUaYXwCmA96KOtVy9P0d?=
 =?us-ascii?Q?Kp6Q9I1jITXED8HbsMTHApv1KlpIg2kqDVF/qwL3mEdHZFN4bWdYyd3FnmEO?=
 =?us-ascii?Q?RIIja7e4pxnv+7296T/Lw5+Vj+uc8zb4LvBAPnq0l/K2+x4E08w7+24Eqp2T?=
 =?us-ascii?Q?mtFECge7gMO2zTmSR5O6AyzHl6fMM7LJTha1tuw/EUn8ZaoAN9+rQO9KuKkR?=
 =?us-ascii?Q?eWuBAdXoe1QDNLIqfay5uG+yW5NI7PmCXNmoU/XwmCaGWgbNDql0EXEqbKPK?=
 =?us-ascii?Q?gl7yazQOU6muvAIC1oAx3TZHEmbGbtg6XbU2RgYQy5iPg6zGhQpYL3w0O0MX?=
 =?us-ascii?Q?BM5bGa3jCyyp115BtfIg3rEPnHRCvuAHi6ICQFZ2ExiRHD1hxizv0ytFy4WX?=
 =?us-ascii?Q?q/kUfpyYskfHGhBr03jXEMbREiBgk0iTTktNZ+eKBuNPGoLQKqztVnPRjR0R?=
 =?us-ascii?Q?SG6g6QiqwYJPAUDMLtS9cFmV+NXZXnnTTFF033jTA4LpnYSOrD2vynND7yIT?=
 =?us-ascii?Q?cKUCpwOT7HV8oEPrQQvvFriR/SOYrDFrv5T9atYJXTofKJTs97V5pTGj79Cd?=
 =?us-ascii?Q?Z89Y9MUJzjDJWvy3L9U1lX/LfbDkWtFHbq2krHAhWAsxvU77TPwIOspZ2kv2?=
 =?us-ascii?Q?yKjHkrm2jqK/8i3BPdLkVCZ3rWWazpDvrN7kAYmJBk7a7WNZ08M8E91mTwUb?=
 =?us-ascii?Q?9ZRAlmgCMpISM1HoMUoPF2R+YEH76+rHTZAikar3ApjBscTIt+oxOoOiwPOv?=
 =?us-ascii?Q?h/QvynryRONoXb9TL/sKrhTmJLX6C0zxHTOSVYFTfnbLDDwYu2wZOR5gcPzP?=
 =?us-ascii?Q?crvOVyEFtYSRYzKrk7yN4l4Y1LTAwDWeE9hJkyjVMzOIfVq5ae9vTf81BpOm?=
 =?us-ascii?Q?C7TPboJuipjxCZH9NoQ0BIIM5a2dmCseXitI+Ho9w4qp8Hojd/HBcDnr0kXv?=
 =?us-ascii?Q?8wcU8/HYNuSZOMpYpGMOSEMeh6VB9szZVpdMM6Ik0bsm4c73/aeC2JkXQbBG?=
 =?us-ascii?Q?AOHKxa6e7mKzGHBl4ayz7jEzgSKXsY7OCBK7+tJTKBRl0yxPJh1ujpDKFAEX?=
 =?us-ascii?Q?uXVGktU7KAuhsrHg6jhIo7ZRm3lEG0Cj66OsgWK6ILqTFjfJbcPbGN908NDQ?=
 =?us-ascii?Q?JpQ/R2Rmag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7232077b-c318-4d3e-ebc2-08da552899d1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:56:49.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4vW9j9hBvn2aeMbgKi7Ru0mip9eSsSexZyXBV1TQSJUwFwrMPDKEN/qx/gLMMZT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5416
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::61a;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 17, 2022 at 03:51:29PM -0600, Alex Williamson wrote:

> It's ok by me if QEMU vfio is the one that marks all mapped pages dirty
> if the host interface provides no way to do so.  Would we toggle that
> based on whether the device has bus-master enabled?

I don't think so, that is a very niche optimization, it would only
happen if a device is plugged in but never used.

If a device truely doesn't have bus master capability at all then it's
VFIO migration driver should implement report dirties and report no
dirties.

> Regarding SPAPR, I'd tend to think that if we're dirtying in QEMU then
> nothing prevents us from implementing the same there, but also I'm not
> going to stand in the way of simply disabling migration for that IOMMU
> backend unless someone speaks up that they think it deserves parity.

If the VFIO device internal tracker is being used it should work with
SPAPR too.

The full algorithm should be to try to find a dirty tracker for each
VFIO migration device and if none is found then always dirty
everything at STOP_COPY.

iommufd will provide the only global dirty tracker, so if SPAPR or
legacy VFIO type1 is used without a device internal tracker then it
should do the all-dirties.

Jason

