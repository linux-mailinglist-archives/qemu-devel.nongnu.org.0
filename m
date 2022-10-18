Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBD602C15
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:48:55 +0200 (CEST)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm1e-0002fE-AX
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1oklcd-0000nR-MR; Tue, 18 Oct 2022 08:23:04 -0400
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:53601 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1oklcS-00006V-DS; Tue, 18 Oct 2022 08:22:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrT1YUmcSdAZyjTY8PL6Za8lsulzbkZ/D9ZFL8cxSeFW5ZSGAOAfQmOyC0r/HBd4SyLE+2MxNtAlVXALHlDCQmXrt3E9EuB8gftn1C5yPwFzYtS5kdHsXL7I0GOFOR0c2ZhvBXagyyC3eIcB5PsrbLcG/pVRofA9WInQmjjm00bPyDVhj/UehkKoSkkLCfLXgkJjfKdsX/YPGyQdzDxEdEa3cHFY+b/Z431YtmYB61gjYWh0OkUgR4bWFz6rGEHibN+nH9LxTSGDE2afRBYfQ0knqfpNGvE8uRkqD9IhvLQ4YPyDWkC1EyH49OiFFv/3goKWVJjgiHAD58zIzNjajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TztKD5X6F7wQk1jH5LqaI6HexsNGoJi6PQBL4xH6xzA=;
 b=TQz5FgpTgbcO614CGcJvJB1t7H8Ii/8ClIWuPcf1Vnzh/kckAC8NAgmqbfnsQV2Eq9LKRqbfbHvDqZLoQEHJ5oA801ffPsIEbpBNPTkU+o3xa9znARjgCaY2tlJ8qaQU+K6rV17jv0y6194QQ8/zeIS0ypjTmw+lPx50MrkfmF2t5j66K8wX1o1j8ne6YwXFlBAAzHJ9cPhMi1dqxnVP35wjqszFOkHR/Z+niBVDaEWSFu9QPyUGidv9OL0+EkVt0pz7ArhrfdHVp7iL31KMtB2aCK9SX5C8Z20iFQuv65voUxS1IGFIQ7Gqlg2XegqWs0ptTP3/h6bmzpnRke4dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TztKD5X6F7wQk1jH5LqaI6HexsNGoJi6PQBL4xH6xzA=;
 b=fv/d1/KTzgIcEuoZ8Dqy69ndK7j4PifTEBM3RCmGbtJS7IQtj85R5RoA5UAmZgOK7RXsXtqwICvE51/lBccVhQUpGbF7i91O7ceNCFxXnyim7b3YfB7fqh2Ef/qzcN6vZXNrFTsrAYpvFWq3TpxPB5xorMvcWg6JmpsL2YgyVaU3VII9kW32A0iGq3vSNJvpUXDLy5Ln8Jzv108nyTm8ryHVPZfqj+u7/heF8TBFbYyAbpe2VEtetir+j33yxi4i5TiKAbnxfqtkFbkJ02nsl9ajDBPBUUn/m1iI1TJMqTgMMaMmfIrlmM7ca51COq9HSsRvIGw9LLarwgZayxMPhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 12:22:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:22:45 +0000
Date: Tue, 18 Oct 2022 09:22:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: quintela@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
Message-ID: <Y06ak0I3FacnkFKr@nvidia.com>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
 <87ilknemef.fsf@secure.mitica>
 <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com>
 <87h706wsns.fsf@secure.mitica>
 <a273f54e-d9d2-fae7-942b-641aa1a3ed3b@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a273f54e-d9d2-fae7-942b-641aa1a3ed3b@oracle.com>
X-ClientProxiedBy: BL0PR01CA0005.prod.exchangelabs.com (2603:10b6:208:71::18)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN2PR12MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea0f4e5-52d5-4f08-c78c-08dab103763c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hOruvoMkQOOt5U9X4O4wDk2mN8PzJSd0UTjWWz6Sn7qNWFM4WGKdMdIKoq8gUrruQcfISvs3kWe6r0YdP7W/oKOsXZQjgSeTXi0XU4gz5kmWgrnXxrlcE2NrMn0R0H8l5LJ8xlSziDS88e9MaYPbq4ISkzy+tL57lsEE6/9yX6PwgxLEf2uFvA9MxTkabyCP3KFKsKNWv/4Gw4MspRBbjw6L8Bkqoot1T2jqM3mQxQmcg6tJdRHRUz7368AdHWU0H+/vpFZIXsvcpP9OIivmKI0eJUo0XFv+c5y/tMee3O/gQMu/yiUTVrRE1qUN96r97eeaQpnIZnAPGQd7ZQ/4yn6J3UQt9oNYgnl3WAKk1aIH4eADXu+wvjxBwrp0mFZ3uowudQPjGeJwUogTltoVRHeWDEJqMtUz8J1goFDCV6QTRN51t1Hbtph3b1jug5rd0X22ksCchK+UCjQTL6D8360T8fbOy6zILbL2Law9jkO+t9UY8hzO/IyFaH1sTjNLAJZH+S+9Gp7Ysg8Tg776cV81p3bqPTEjCa+fRNPTM7bmN/7YUyfoTvNycvsontq96aOeMjJcME0TKeO8rz7/I4wdjdIt2RIrtlUmgt+O8Y29kPx4JD2rZmM4ahnu7gg5Kf/KIaxy/lK13AAppqjPCMKqBALPXmXwWjQ/flveSpuT/XGreoVp1oWh852j+fn8lvNUGew0Qn9Y/kvZWuyeiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(6916009)(6486002)(66899015)(36756003)(86362001)(5660300002)(7416002)(2906002)(38100700002)(2616005)(186003)(54906003)(316002)(6506007)(478600001)(26005)(6512007)(41300700001)(66556008)(66946007)(66476007)(53546011)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqJ4YvLWh1AKnyiEXBzhkPDqOvMiN46KtPnWabdOMIR00hszqtBRyAE0qm8W?=
 =?us-ascii?Q?IT0KzHqDMGpoD9diRcW3qJbMS2rXNJnR4EuEowkunkrMo0FVeIT0hpAFbdq0?=
 =?us-ascii?Q?VZni4ceTQeomAW5Ha9/UHHeoAcuopapN/zeMHdccAqPBTHzHU2ySdqeT+KCT?=
 =?us-ascii?Q?3OLsMoIunmNMwR61ICLaRlcXQDsrCmLsZT8zAPmWu01Qt9n0YqOKENVr67ro?=
 =?us-ascii?Q?uiAfWKZpcoen8HIjNXxoJsB//Z6Hvh8MX02QReAPEnyCzUCwtE0v7TbVGmCB?=
 =?us-ascii?Q?+9gQq0W+zT6fc0Et1iaUJCj/MaM2tFJK3qXPnfXLd6h9sAAFDy9zJgE1eDoF?=
 =?us-ascii?Q?qgSMFB7QHQzu9fZIUq8POCrxCUGa7hwjtTL+RZu+tfFf/saajeBx4Y2NPHS/?=
 =?us-ascii?Q?wk1UNrWSewCN7FzhtigfMEJaLmoaECXeEUss8nq+/FFWSWa65vID938v3sTF?=
 =?us-ascii?Q?Jr77PDz1VwFrbGYRLuXeM3//zU2SfnbH4gLYOh2xob6SnJ7RZ9zuOAESriwY?=
 =?us-ascii?Q?kz2IEU6AKoNzqUCBTjefBy0SPELv5aM9LYMIIl6VsR8Zf8yvcEGSIyNLBQ0/?=
 =?us-ascii?Q?Rej/l6k/86wSLGSwEmnjUo6XpfzIPrpzppY4VzjDFfDzRuIeTtgATLccu01h?=
 =?us-ascii?Q?Qlb+b3RiSQewjIhb8j1LgKdKHWBoT51c4yN/+DnqQ8rBcHxYFIAMaX84+vZs?=
 =?us-ascii?Q?uSz28OGVOUYVC2xU6bz9P1eZGqJKKz4LKikSOSNn9JGKhpdZKbps6/fNvTwt?=
 =?us-ascii?Q?jwYhLdjO+iRjUoHQ9g0vojpl4w7IhRa2+iCCrMzoIr3+SafB1X6X2XH0hcsX?=
 =?us-ascii?Q?7ExoArKh7eeD2X0r5Ckt850w3eF0054uUZEuO4azzXLoQMR2CLTVhzlHfi/p?=
 =?us-ascii?Q?02b9oo+hsV9MHelzM6nJRfhzVfYhYyb5ynNPEczXVxNLsxXKayjoA8IibjHs?=
 =?us-ascii?Q?pLQWaZbJBCSJUbMysZTnPakuI2mSR5WhR+SgMBRHtUQ4ECs/Plm7wneqNn3P?=
 =?us-ascii?Q?19MubJdEQplirOcTjyzQXkS7E9yfvcnRBdEx+Uo+7VcfVFrM1uJCk8jUs2lf?=
 =?us-ascii?Q?5yE13Ta8HRDo0jKO8MBSOkZAD4ThfNm6rHvh6QOlSd/ot3az0eCNe1ql7IeM?=
 =?us-ascii?Q?oBNQapYm+o+jjD2DluQBH+5GxVPwJ1lWLyPSbv70wqS4c/3M3ykKEVeTtEhh?=
 =?us-ascii?Q?vu9gXrBPqWsPNT+jSvDSGgWXhO5lwXvZmIyFRYZPS03Iw77KEhpGZHPgSgxE?=
 =?us-ascii?Q?LzQIU2tivhOY06DumIsP3vF01gZnXsYNya4QgN/+n22QEUr889dmyjJkMZ9v?=
 =?us-ascii?Q?VrLqraePVdyNkiywv/UNoU5TaOjN5IFdRzH84nQAAuc7xYKWYcNgYNwR/YPP?=
 =?us-ascii?Q?xnXl9p1EzRgIHAtgUDXtd7hLZHTW0oRm0JlyLoodjN5giBkTVYJOiLn8RvuQ?=
 =?us-ascii?Q?IdPOCGdcpVj7orJOOJcI15bo/GLOMkVaQVONdsVa6y8jjc24bSSszfCspZYU?=
 =?us-ascii?Q?7jqRmkAPTucJYYBSUsprixdrN7FpTD9CGX8z8gv4dtzMLEdh/lyVqvHpkUVu?=
 =?us-ascii?Q?ocdGScJ8UZYxNOCokaw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea0f4e5-52d5-4f08-c78c-08dab103763c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:22:45.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xx1OyGOYwRkdZNipJOvP63BloEmpO6gouT3xYbxUQDKhN9B8U3MuhJsWv40oLnc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
Received-SPF: softfail client-ip=40.107.244.81; envelope-from=jgg@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 14, 2022 at 01:29:51PM +0100, Joao Martins wrote:
> On 14/10/2022 12:28, Juan Quintela wrote:
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >> On 13/10/2022 17:08, Juan Quintela wrote:
> >>> Oops.  My understanding was that once the guest is stopped you can say
> >>> how big is it. 
> > 
> > Hi
> > 
> >> It's worth keeping in mind that conceptually a VF won't stop (e.g. DMA) until
> >> really told through VFIO. So, stopping CPUs (guest) just means that guest code
> >> does not arm the VF for more I/O but still is a weak guarantee as VF still has
> >> outstanding I/O to deal with until VFIO tells it to quiesce DMA (for devices
> >> that support it).
> > 
> > How can we make sure about that?
> > 
> > i.e. I know I have a vfio device.  I need two things:
> > - in the iterative stage, I eed to check the size, but a estimate is ok.
> >   for example with RAM, we use whatever is the size of the dirty bitmap
> >   at that moment.
> >   If the estimated size is smaller than the theshold, we
> >    * stop the guest
> >    * sync dirty bitmap
> >    * now we test the (real) dirty bitmap size
> > 
> > How can we do something like that with a vfio device.
> > 
> You would have an extra intermediate step that stops the VF prior to asking
> the device state length. What I am not sure is whether stopping
> vCPUs can be skipped as an optimization.

It cannot, if you want to stop the VFIO device you must also stop the
vCPUs because the device is not required to respond properly to MMIO
operations when stopped.

> > My understanding from NVidia folks was that newer firmware have an ioctl
> > to return than information.
> 
> Maybe there's something new. I was thinking from this here:

Juan is talking about the ioctl we had in the pre-copy series.

I expect it to come into some different form to support this RFC.

Jason

