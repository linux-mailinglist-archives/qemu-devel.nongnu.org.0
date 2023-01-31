Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD9683A90
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 00:35:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN09e-0002t3-3n; Tue, 31 Jan 2023 18:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pN09X-0002sh-91
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:35:03 -0500
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com
 ([40.107.93.68] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pN09S-0004ww-6T
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:35:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG5j7rUpQRkjQlIl9tsArLUq/IppkYQSblnXBdydj6lGEP5H6A8MpTekc3Uqqr6eLMfvyn1tCxwKpkDvd7uTxodOTjHRXjk39qGMr2bWdGp3X00QUnXUtroHFkfKC2I1/ak95gQri/7QiSycThj8PhGzXGQtP3emhQF2jModhNj2onG+sQd4200YQBo24QndPXJ4zmc7VgZ/mP8t6/uPNHxnUUU8tz6NY8qTyuGrkkj2/QNAClKqD8GRGvBu4k8zi4V3GWdw3EOATIM9/lthGstmX16wfiJUeeXfOKYez57c0nlFVI2o26V7aSF7Yjc3nGq4zYif20T2wJDcf84SgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBeEoI1u1TAPxx3wd0VP+yks5H7td2N3YLxM30dr8TE=;
 b=Q9+Q6yJpOXQvFBXJeHFu40lzMHZSh+k2kgMA0cIvoweC5dprr16NHtwFNeXwvRSKYBwXgX8sb12GD8EIB0vuMVK5E3SUht2PFUqLIq95fWoUK816d+Jz1hc/9x+tVRq0KEuQ2l0NEqhJafDkS0oywP+4rRRUjfEfAl2ZU4Ps8lYfCH9w6WdCfUCdIO0vBlDrA/xJemmjxCQVMKz5UiyhdRNgTQPmWIJjzqgJORMeVXS+7tE6uPJBVvES/fh/50gKAA9WcAS+pRrb+gjHW7Gh9qzqGGt6C5UPmtSwQ4gZUGHLvbjLSUR3RkoJ29eMmHSHPgBOhKw5I/Y+8lSfF1Vn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBeEoI1u1TAPxx3wd0VP+yks5H7td2N3YLxM30dr8TE=;
 b=t2RhfjRWIz0kpwjycRZ9EvesmxThzcLxckzhj1Wt6YLlAqnycYjdl9tqBJM0EvEjZR9nE7NoMqAqL297THGfrBHNcu3o4JljYNcrDPhV3eXEnACyD/SOmgJsxK6Ps5PhH3iPwJCxMLCq/q9ousOCdE12CX6bkJNx4aIsKDZwbjfGadZdgHe3VPTxqbrlVyiUHErjCuKW/OX18nl9DMBlBREDezrLclqNQ5cK3plXvx8jjCmEGjOYcyLAZYt77AhU6xOv2MrMDWq7nltFazy5voaIFn2rd+vavwtvzk9oiGv9krtWyccge1gh5hwTstglAeSyiEm3nJjThlb9XjCapA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 23:29:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 23:29:50 +0000
Date: Tue, 31 Jan 2023 19:29:48 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
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
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <Y9mkbLczUb2LFb1o@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
 <20230131154301.4aaa8448.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131154301.4aaa8448.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:208:d4::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: a392e44b-6101-4769-c15a-08db03e30c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xshLNarpoOE7NtNjqm8563vieBMqia7DWuCZTXiAsldtcUYohDVa3dRJATmKf5hzIlHLUaNAt80MZDkbhAAzVOvS6+XAsAjcuiO8MNwaTJAPIBbIxBZeb3KbpnO6KiabjfGXnVfSjyTxEtdL1l+3exa4XBtPlhjcSehvIhDDWdBJDDy6cb5V5jAXoELc6AV1j3Q/9tyPgVnmumpiFmjgP24iEqXchUFJpyRXs/a881I3CvS+Ilz7Pvks4cfqcIXSzwNqayxl0ijGUWJ22HIXCh/Dt3fChsljM+oXKuidFbPPX+Dll/mkENI7lJpeZKgdDerhTzH3msl8WFa97L0t2NWDNiemAJ+H+LaNadGhjqnuJ3YmDVcAJYJujL8IpxGuPm2F5AMhhQL9Ut9awB/pcEgBOLL1cQmXEWpzieoiQlfTcuWx28glRRqku+Wj35dLQk7sgPSCBmCbak0urrFQ7mDuSjLgs9K9nunOCuj1VQTY54YC//76gv1ze4i86XMdS81+z99DLHCAEJ6shgNRFgJE8yvaSnBned+zBmGjUQRoK9PMDAfa7wd1wbr5a6PqOaSFNWjhLPyInqM2aGp7GJVRvwepcTR+y1B9izt0a1Fg/2VKa0DaIeqARg6RVD9s/XRE5/mYv33Dw5+NwjT7NP5wlcjP5oj+7V+6jzlThRtBLRk0+2Bz8GgKYFYuvLs8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(2906002)(5660300002)(7416002)(8936002)(41300700001)(6916009)(2616005)(66556008)(478600001)(8676002)(4326008)(54906003)(6512007)(38100700002)(6486002)(316002)(66476007)(86362001)(26005)(186003)(36756003)(6506007)(83380400001)(66946007)(60764002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHVIQtYx+pW3FLdyWPFEcUGVy6p9s8IdvuCviefz9VzdVhputzgVKgdIHwB3?=
 =?us-ascii?Q?9aG1OqqqohX7xhdlyTxxDViCbYc0SibxhOgMjC9ubX2h72QWhM0zUoJbSy4J?=
 =?us-ascii?Q?TIg7NZJ+FbxFd+so6UGwKaWcIWkrk4hlA+M1yjo/UA1wUnXWzajXSUSYDeh4?=
 =?us-ascii?Q?wdGyrCSNMDC1eVV4EUw+Lotwv5zukY3Tgd3cA/HE5Jq1jqxRz+OqFrtO3h3/?=
 =?us-ascii?Q?Ad+naFKv3FniX1OPuiOgBaO2AIsp6RcxILSZFfLyNgBz65mKqfzymB2M18s+?=
 =?us-ascii?Q?uGGqV9ZzRYSflSBycu+HYRH+BquKV2ScgtoFMzE19v8Juf6kNAy66XrdBJvF?=
 =?us-ascii?Q?vws2OjluupcdwtMvLWjhi/cf3cxQOgVY3KgmKQ+OH0VBE3ZJg7ckG37gV2Xq?=
 =?us-ascii?Q?KV1Q35vVRzQwpnKps8PPtwXAowRVJM+sW7grV+ayMHg4+FZx4DyDSTDAOmd5?=
 =?us-ascii?Q?4xi6D0ou5lzku6BwUegUiU3+BiujZddgz2Jup4PwWp89UgJaB+pGdrvOj4BR?=
 =?us-ascii?Q?JkqrnyNlNWoX1/GXZLhu3xgp1gWUDR5tyJiHFQDgwNB21X9HmN+7TZslL5SE?=
 =?us-ascii?Q?Ot352y2UmQIMbCoThdHs9xjROOFDYEmKsgP83tMGvN/dt4x2T2jWEub566DA?=
 =?us-ascii?Q?zGFYxAcLw8llbDQjPcE/U7tmVaTqSCZ1atHqxT2FjhGES2VvO06c/W++DjIY?=
 =?us-ascii?Q?HL6lrtYgJpzcINzGgJuAkCl6lCeTafI9pi72in0krEJzXDc1QdxHZ9X74HZ5?=
 =?us-ascii?Q?mkiunC9Im5grd/XmFcz7Ix4X3qb8njXlL1xOyNaD4+SxNRermPAjakj4m+9F?=
 =?us-ascii?Q?UIATNITL/KoVLahrLR2RonCxXVBjFNcLTw4Jg2guCqf8HAgzLLEzaAUhGcS2?=
 =?us-ascii?Q?AgeJYu6w9AMv6cOZ2wnR3LZjsfpVRD5MmVKCiiOn+D8VFgFJNo+W4zAZJbtO?=
 =?us-ascii?Q?81VfetV+PLvmy3dOWrJ+grID8PQ5/ZYHVTKv7HQhrB/1tgP6Y586zvoXecg4?=
 =?us-ascii?Q?yjnTax8oChoDCT8pEctbFx1CQOyMlke0Lo0Hyaox/+A1j61FO+PMe4SaN2gA?=
 =?us-ascii?Q?OMDyphGoDpjIwAE4+XBNvPkj6EIMs0m6nYLdIdm1S2V4o+XBVQ9lYjt8/PkY?=
 =?us-ascii?Q?zBXw2CLvlQrN2jYkZE0ROIoQ0jdJo6ykiRCwPopYVN/QUSfoE3XBZpDw3Js+?=
 =?us-ascii?Q?FqBfk/UDYYMioC6cD0foiTY8IJti70c8x7n9jRfI1gZTxkMW2lOE6FgraGmR?=
 =?us-ascii?Q?OB97vBjeDiRLlKjV49Xlgya79l7miqZNcvkOqlIhUexseMbi/bPymO/+G0Sa?=
 =?us-ascii?Q?WC6ZLizJyeJtyE2PyTXIsJAM9vE2BD6ZnMguxiBoJdB/xy6bSzla1AtolL5r?=
 =?us-ascii?Q?rvR810XI4HHcK7Rowc/+9WskWmstZ+Im6dwhvfWTKcnpzjgJUxzVy6CmB2vR?=
 =?us-ascii?Q?wlDdSuSqQ5RMMqUd0LuSfIzFW/eHxsr1YQ4PaiIsayq4NTGL6YGP6P76JLg3?=
 =?us-ascii?Q?rp2xkOTirJ+47EJ43IkaB7lZV1cF22OK9eZ96qb4UJEJivECzoDK5XuxFg0h?=
 =?us-ascii?Q?gT0WK/vMUDyLVKtMSlmLbdGi8PZChVxnEHu/aKFV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a392e44b-6101-4769-c15a-08db03e30c0a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 23:29:49.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPN4kfZ1//6PJEubKiNboN8GZRs7CtyywaZLnzkyIeremRmm3aHOzY+rsTmI78m2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152
Received-SPF: softfail client-ip=40.107.93.68; envelope-from=jgg@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Tue, Jan 31, 2023 at 03:43:01PM -0700, Alex Williamson wrote:

> How does this affect our path towards supported migration?  I'm
> thinking about a user experience where QEMU supports migration if
> device A OR device B are attached, but not devices A and B attached to
> the same VM.  We might have a device C where QEMU supports migration
> with B AND C, but not A AND C, nor A AND B AND C.  This would be the
> case if device B and device C both supported P2P states, but device A
> did not. The user has no observability of this feature, so all of this
> looks effectively random to the user.

I think qemu should just log if it encounters a device without P2P
support.

> Even in the single device case, we need to make an assumption that a
> device that does not support P2P migration states (or when QEMU doesn't
> make use of P2P states) cannot be a DMA target, or otherwise have its
> MMIO space accessed while in a STOP state.  Can we guarantee that when
> other devices have not yet transitioned to STOP?

You mean the software devices created by qemu?

> We could disable the direct map MemoryRegions when we move to a STOP
> state, which would give QEMU visibility to those accesses, but besides
> pulling an abort should such an access occur, could we queue them in
> software, add them to the migration stream, and replay them after the
> device moves to the RUNNING state?  We'd need to account for the lack of
> RESUMING_P2P states as well, trapping and queue accesses from devices
> already RUNNING to those still in RESUMING (not _P2P).

I think any internal SW devices should just fail all accesses to the
P2P space, all the time.

qemu simply acts like a real system that doesn't support P2P.

IMHO this is generally the way forward to do multi-device as well,
remove the MMIO from all the address maps: VFIO, SW access, all of
them. Nothing can touch MMIO except for the vCPU.

> This all looks complicated.  Is it better to start with requiring P2P
> state support?  Thanks,

People have built HW without it, so I don't see this as so good..

Jason

