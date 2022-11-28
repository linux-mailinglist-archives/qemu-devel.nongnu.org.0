Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786F63B3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozlBK-0007iB-OJ; Mon, 28 Nov 2022 15:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ozlBI-0007hN-IL; Mon, 28 Nov 2022 15:56:48 -0500
Received: from mail-co1nam11on20629.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::629]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ozlBG-0007Z3-Jc; Mon, 28 Nov 2022 15:56:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjmkWNM/CFI7ZaGot9jHH/TvnZbh/LMlRHeV7bw9P13lQxyq8heBPOUhvZvzJgoTt9Lo2nidvmYxDkbNl03KUtFC0P0HjwwGyoOsfJ83/kKr+nx9TBwDJqN4dC/c6N1fVefvdPRzoOnD2AXhOGdrEubSf8/1WSwOUKP69cfmmx7dPsEoGM0b2j2Loz+jh2PQRhc+CKwG8XqiDv41tFb8tdSPfMOuojdmaQasCDA4ivMel5mHX7QGk2dYAsciz18qR3VYsgXEmK6SLWBDZXgQue4/uKsUqY2yUE6p8LuPuZi99SEFZP2ZXPAoaD7Kw4oRnWN39VqMUAIs/Umwt33I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOUcSC95hRPW1rTgVhOsUw0+Q/HEFqZZIioVgtsvF60=;
 b=Zg0fPRI1DVseWooUtdWVXvB+Pk7KvnfkD5H6tToIA8QWnJL4OJ1nQPIgiWR5m7H54aICpYRDSDh7FDlny5/3QPLjSNXF2NEOFczH/Jf+LnQhxfzcRnk17qlzWfOLmm8JhU4ColZvik8v6HhWZVLqSDkRXX56jLlo9RFH27yrnMwpx1uCtNDXw1odd++LLw6DHfas4EO0VMKzjHoO6shDjbqMPSBmj+gTqMJ20IMNWyGiOh2O87ba4lj2sY69GEVSN8lXhpAqK2q7PW18kFb9AZ+bIxwxTKh9WWfYaAtO8Y2OpOhDjIxdgumIX2PGQ+V2yfxM6gbJMFplTWZbuHthbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOUcSC95hRPW1rTgVhOsUw0+Q/HEFqZZIioVgtsvF60=;
 b=fEOfV1rog9yb+8UwrVstJLQ2J4T9Pe0F+3GwMzj8R3/l47xi0hkT3HyyZ9iKbMyYOuAyjJigECBXO7Qqhv6a8O7T2+DyNw+waXLy/NPK7GwoAoOr0528g8/3wSZs9DVruJ/IV6Bma6yymISSn/3kcxoHzeiL1Akh+C+cVLQRPTis6M81t8yX6Nqf00bEI60cEYLwSgwVraFcYmWnE0znAsAwwwiqc/rbmkHjB/oJtxCkHIabDIJ9zD5/LyRi1q9gRgWGkgvKiwBByvYefjD2tED3VBW5f//hpcH/er4kuez0kyNwfGYMLWp5a8h0oNrsitmEF9LJaTt5wgtA70TWBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 20:56:40 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.5857.021; Mon, 28 Nov 2022
 20:56:40 +0000
Date: Mon, 28 Nov 2022 16:56:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Shay Drory <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <Y4Ugh3TU5lq59pfM@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
 <20221128115003.602d4ef7.alex.williamson@redhat.com>
 <Y4UOp7Wi/fwsY6DY@nvidia.com>
 <20221128133630.07e1fa14.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128133630.07e1fa14.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f0f2f6-d25d-41bf-392c-08dad1830c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQdLdZBzPALDPs6P5zDtlPZ3ysR7AY/pGdp9QffNHkWrC4KG6tVzYBuwQFEgmmkGYn//kMuKtwiqGv6QqADvzlHgNRFbH7OwBAym8h7dVn4p5k6FLk738omWsoVjtTB17XF4Mz2N5ZG5kCoyyxrO7S51vNqyzzdTE5MVi89P52VSqzwoJbnW0dikFUQ/Me5TOm/6P6qnULiaD+XvPhSwa2CpXNNuNgpGL4TrdGWSwlG2FLR0NmuBliOquvQXBxrm4AYZEEQ+mBNV1FKWelc4cIfgtj0zM9tiJZRdnNeE3GK8iSBEML8vgnVtSlFR48pjit2Cbd253i+lcOEi2T6tCLR/gIp8p/9F6xVy/dDklk0itoPS1wuyzp9dOZyicr5T7girl9ApNxxnFUBMuC8BMpygbB+tTxA5tYtidwh/L8eZQSYe8wTgy5pE/JWvV1oamJcYIaZuHW8wo+Gt13hcqxL54qOYrZRaUZayYd0UfWV8Tzsc6Br/c5PGKp30hG8fTM6ftoPeJzXb8DBS+teoy9QHznWOSn8JIGHpNMqrZMu/W3WBz+s02ETYkLskm2i6IVMoCLHScSCM1hMKKW0HIuil7J0kFw9CYqCw4qEgGa4FpYWXUfeo93Tk3LQUmkFf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(66899015)(86362001)(478600001)(6486002)(7416002)(2906002)(36756003)(6512007)(186003)(83380400001)(2616005)(38100700002)(66946007)(41300700001)(6506007)(316002)(66556008)(26005)(4326008)(8676002)(54906003)(8936002)(6916009)(5660300002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOVbjt9aSbgxJJ/JZ4fBI8rdwOGyj6Th1uZHFP/y7JqcWPid48iiCzcqgLYG?=
 =?us-ascii?Q?OezjJiytc18vERng+Q285+tD5Wq8CXnUyp1L8eE7GghnNECu+y7jJBxrzZeV?=
 =?us-ascii?Q?dePBULPR0xnt4dBxLkm4H9W5P2vPhXZCXi2Gga+9F1YjS6uW1KhTAAoWo+4J?=
 =?us-ascii?Q?ZUrq2fuun6Cs3uB3aGVeRckVT6WaEtSXNPUQTxr4Nwri/WCS/ZnZXZ6rv3OE?=
 =?us-ascii?Q?mAZkjWdwSmhgk2iden/2WKgG21NjOUG309ALE0WKTdIw7O1KmI5qjHPNxcgD?=
 =?us-ascii?Q?73SQF4d2gh3EB9wyuxPnMvu1bfZvGiGKeJqJ/LZfhYrSjBr3+BW87e3D1x8W?=
 =?us-ascii?Q?cel5tjrcaeQ6SOpSoO1f7ks2yeWEcE0311kHiGKPCC8XYv8oWU/nBk0N+pVX?=
 =?us-ascii?Q?QINP2HFLODzumVA5erOQcs1k7dozPAo0QTLmnP6bV9kxMdw2TkBpO6PX4QO6?=
 =?us-ascii?Q?lL2wa2XDp4aiyrMEKJESFBkY0ZBRcnc7aLBWWHIgFpP979ZR24uzFMzp5xIY?=
 =?us-ascii?Q?vY+r8xKPbJONLcI0IOWDtHsIXVmYzOH89F39fdQGOHvRHC8xEzqeagAnXIRU?=
 =?us-ascii?Q?ZLfsed7uLaEVpBc0OVwt5JcE7z0F1yeQ8i5w/1qb0wm0vmv3MXRaUmzKSeLl?=
 =?us-ascii?Q?zhj/0sqgf9GiZ1fmrgjc2RO8tpaUZFdyVxiK04a0XPZjAIZ2G5NlyI95UOeO?=
 =?us-ascii?Q?L1pF2jqHAIKpVunoQMKPFWXTqeT8to6e4kNt0KUJlbtch68US946pAslR8r9?=
 =?us-ascii?Q?EVsFFevZqDIdcY32S5OQUJ7NJAmjqaw+MgT3phZqw+Y9MUh1MXX2NMOuG1QW?=
 =?us-ascii?Q?74RUyucBTM/yMN8ux7Ieft+x3hYiXmhMiDypD+1T1fwOxaApeEKDqzXM0piJ?=
 =?us-ascii?Q?WQzIfFar5zQ2iVmaoqtBRVC5gCKOe7t6vrdG1yMeqHHww0pyfpnc4/J4exis?=
 =?us-ascii?Q?YoGrjbKlALRqVG9uCK/IQ5alvqY/nM01QD98IK5FCtyP4kea3YP0uqGBBwK8?=
 =?us-ascii?Q?uDs7OlTVX0JkXSZr5m+Pu+DJBSvlUck6DYZEtYBeAXYcl1wexF6NWfUKOZHy?=
 =?us-ascii?Q?tVwF+XMCIJvxg7XDSc3IxJvmeodkokQaxT6gJzsBBUy2U901+1WayaQ427Zu?=
 =?us-ascii?Q?HUGsU/Xq2evQgbcTiSCbCca+X5aY3pEY60xWdqslZOh3JMQVi18QcZtrcoi0?=
 =?us-ascii?Q?tjmQop7ZilvddvG26EsTlFawEsWQl2DgJGQbtbpRpoUGe5xlfbtArziVVgne?=
 =?us-ascii?Q?zMBHZqXQjxjDohVoFEVbgNBDQ8ykalPFAK4X1SdCDDVmaWUdk8x2Bs3OPcYt?=
 =?us-ascii?Q?wHBxV8eAGC1Jp013NViXY30wQdJ5gEoPOUL+B12I6UAzFVE4EfkGz3H3wsSi?=
 =?us-ascii?Q?RxPqcMhP9tm0phaTaSVGi4nObYdCqRI1ShMDgU1bkBazAeDP66H8DGKNw5K4?=
 =?us-ascii?Q?SxYzQDybYWralAlNfkLtTaQNOwbWgt2duqiNas7QbY1Of83T1SxjCtiTS4uK?=
 =?us-ascii?Q?MGFRqKXZRbdLuQ+zD01YSakZ2FCegVai1IGnQ46l7teafeAHJq5d13YTGky8?=
 =?us-ascii?Q?eEnf76jO7zYt0bSBOCc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f0f2f6-d25d-41bf-392c-08dad1830c48
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 20:56:40.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkWdWQTe68ppKsYFtOWR6KELzH9P6sC0+pafX6YjDDRftoRfIX1CmLSQ6EBrGWNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507
Received-SPF: softfail client-ip=2a01:111:f400:7eab::629;
 envelope-from=jgg@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Mon, Nov 28, 2022 at 01:36:30PM -0700, Alex Williamson wrote:
> On Mon, 28 Nov 2022 15:40:23 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Mon, Nov 28, 2022 at 11:50:03AM -0700, Alex Williamson wrote:
> > 
> > > There's a claim here about added complexity that I'm not really seeing.
> > > It looks like we simply make an ioctl call here and scale our buffer
> > > based on the minimum of the returned device estimate or our upper
> > > bound.  
> > 
> > I'm not keen on this, for something like mlx5 that has a small precopy
> > size and large post-copy size it risks running with an under allocated
> > buffer, which is harmful to performance.
> 
> I'm trying to weed out whether there are device assumptions in the
> implementation, seems like maybe we found one.  

I don't think there are assumptions. Any correct kernel driver should
be able to do this transfer out of the FD byte-at-a-time.

This buffer size is just a random selection for now until we get
multi-fd and can sit down, benchmark and optimize this properly.

The ideal realization of this has no buffer at all.

> MIG_DATA_SIZE specifies that it's an estimated data size for
> stop-copy, so shouldn't that provide the buffer size you're looking
> for? 

Yes, it should, and it should be OK for mlx5

Jason

