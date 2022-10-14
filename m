Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C315FF43F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 21:53:08 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojQjz-0000v5-2l
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 15:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ojQgs-0007hq-BN; Fri, 14 Oct 2022 15:49:54 -0400
Received: from mail-mw2nam04on2085.outbound.protection.outlook.com
 ([40.107.101.85]:13889 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ojQgq-0001gb-0l; Fri, 14 Oct 2022 15:49:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJLr6LCMsQv9BHx+Nq1Vc2oYWHY+KynObKKPTjtmFPgf5iiyi7+azt8H7uc8BrOhJsUeLTH75R0xx9skJeRC1c124/bfEwS3qjOHZxCQ1ZEsYH+zlCQHtauk/rJbkLmnWtbrMIlevVg3r1w5ea3hop5nTHsNYIkDtWIZDfCRkodDnnrE4yH/b/+TrOTmsVu/oxO8f73Dewfvx67X44qhyIN8QjKR0L0cuHxbgZOJVaftvw30Wm23FmHe0TylDPt7Ws6tcpi+aX4Ejt6NVMNJQB/YK/QZObPtAQk88EK5g0XtMAsnJnXVwbB4xkZy4drz44vN/1DiLQLG4aPRDp1+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfDimT9z6aiYeGnA3IlLKae7Fs7OfQm4FH48Sj9drls=;
 b=Jq7+X8qAWUXvdwX/njqOn8xB36bFrdZcoLP9wyFmtkiQhMP5kwOzd2YTs6Pxqbve04aW280+/0u1JU4cWybWIMntEvp/r/9JBuoGyASNu02IYIpRIrMFbNW+jd3PunL/z0qPK386J376oakpDuX0uY4lyHaAR1IO5Mhu08MYMUuxW4AV/Woi8p1SFRYualVp+EkVlEt/wupXjoO/0ws4MTTWXObMn4B1MJuAcabKTQ5ncs1oBuzIt9RKDgdggUzNi6S030cL4PyOhVzIDS1Ytfj2KzX17B0P2z0oLUJOFS+YjGFK3LVpIOebvUNarjwxCR/nbGkcRSI4MdW718HlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfDimT9z6aiYeGnA3IlLKae7Fs7OfQm4FH48Sj9drls=;
 b=LRW1s0GfyRURtsIxDdHYY6Uxl4uzA84RhLskh9VHWoacGaO5tTjwYLducKPUt+LbJf4avM+VfBB9haWi7CsjNmqk17P0GoJWAvdXBso8yah9cHr/KZZ4PcSKUybZzOghuaw7RJ2u5eVITljUnG8cQk4A3LJWiCishYp90nqeovAR9Z4QGpAqz+wX7Z0vScv0dcy4Tg10huNql/n5LsdjG8RlcpBKdmBvXbq7EW/lXYK77ArO78PQyA08zseabCOzKt0U0G8LJlaEtZ/Elw0J5nlTaWJbv77sgRLgJ2hDiG2BfXKyG4/iDS1ILFLOglcck7eNGFXqvUPIEIQWTkQLJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 19:49:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%5]) with mapi id 15.20.5676.032; Fri, 14 Oct 2022
 19:49:43 +0000
Date: Fri, 14 Oct 2022 16:49:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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
Message-ID: <Y0m9Vgb777sqryFU@nvidia.com>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbfc09f-f97a-48c1-4736-08daae1d3d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lm7XR7Z9OFTxNDbd1xoYiHUtWfpczSQa9YfcEV+ZnYJ92fHck6+bc76+pe3dNnhY5KV0Cbn9rqiCBZX/yPHutMw2DpYmFArgnDz/MrkEAn7wUHOKb+DDI2QkaKHFHQWVt3h4Z8jS/VqzQHfVBzWyiurTROahaocGqOeSEAPDsHT+4JekZjZpWpAvKYfxaC1u+DRyjRWsG1ICsCSyYbfs+F6x3VgS/t3tht4WRKu9cWahWvsKzfYirlciLKAxP7gDWVy2p7jIkeBvE6lN7gS30DFPaok58WOtUivHW/n2tmCpcF1LXTKfUJuPNlJmLhYHytuRu1wqfGZnE+dZLbL/MfwDfj+DJbkUpJqoRZvcu7i7AqzDP8yDAQX2hUFsKxUfLvz4h/kKiundF+UCP1bAsUIKzZSEib4v2zLePCXsThB3RNNxfTWaRWtuBs78Xou2c3dy3THhIniJIsVY3Cz45CoLyEIe5JelRCDGY+o8u/2lFB28m0148nUQt0kVGY/H3k7hwqWnw8gevILfrDbmt3fiymBgKCmWRuDtj6HF4mdW3cN/2MEniO4Ew5+8PtsXRERNDDl5l5q7JQ+w8/vFjHrUckCDwXoRgMnZHqAjgIrXBbhqYe0LbSvhjaer6Bli4hk2njmtkjCHQvdgnLkWFpVwbDa4QAj0NOkuN358kHSZ7uFK8bq3uVEUfdxr+INYWr3U6ncTUkSqB6e+tYZLRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199015)(26005)(7416002)(38100700002)(86362001)(478600001)(4744005)(2906002)(6506007)(6486002)(6916009)(316002)(5660300002)(54906003)(41300700001)(2616005)(6512007)(186003)(66946007)(4326008)(36756003)(66476007)(66556008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2azp7Tw0yinHe+sGCxDCmQ82HtbZvtNNCDn+hL3ZX/Z6V5d51zDzeO5Apvcx?=
 =?us-ascii?Q?jIe6vQEClsj+jf3CoERB9kSgkOAlky3E75O9v+6C6bM+boeGBEfOXFeroOsN?=
 =?us-ascii?Q?jSYsI/diEPxd8nin5bZqd2XR+UvfH0LodB+nwSIjMcjaFhruhCOdNpfPR8aV?=
 =?us-ascii?Q?vjw1IqqF5UiVH7XX+KmoYlbju1R2EXrSLnC2B97BE36bAWxzYJMJjwrMfzvf?=
 =?us-ascii?Q?OCuT0EsePqU8+9w4NvSj9qx1jE6hOlLglN7ARsVNRBzu37f1442zszEsMoxu?=
 =?us-ascii?Q?wpihqcUHgszvMvGAenHwmZMQ7PtUlT+Tg+4Ykai74gbq0gCIT6DvJ8HgzG2k?=
 =?us-ascii?Q?iuwSbL8xix3/8hQYQXhtFkTIkXqoIufCKSL7AMt2V11sRTYUbKvX+y44uBWU?=
 =?us-ascii?Q?OfoYoKypdDzZd6fWFtwA4t/5yvxojZC2JCSqrF4aDbbbbppPSud41+p40bFT?=
 =?us-ascii?Q?jHENxBwNfOnAq7SjnYucSTARDiKGyDCL9kF2isgV6WYNnsBNCLmVBZHG/+eA?=
 =?us-ascii?Q?ldIHR3SccG18e5cfuaaEx5VIUzfE/N+f9upouKpUtmAB4S1qA+wcuBhmo1/a?=
 =?us-ascii?Q?y4uhiPvHK17gWmDPIRyDDq3pp8ND4VdljLH/YEb/FENasTHakhVTWFVVqfpS?=
 =?us-ascii?Q?b3zusEkexA34ggd1DQoW3SQOWHDZXHHUltZjQ5dEvj7Fh/D/FtRcHv+9gEwl?=
 =?us-ascii?Q?t3oEiGC0n/OazBbIsJjE3ou0Moh26WlKGqs3vLbXIFa8uoAde8s+olBvaIsc?=
 =?us-ascii?Q?TfYh8IaMa+lmLx237UXEiyEnCM4OZbJr903NvGn0nSdn2cSSbFNtsk4CDfHq?=
 =?us-ascii?Q?3wue5Z1BQPAtKDQI16K2Vxtzl+y5v2W96oxfJNgn+gQkfXF9qRUbnuMX9yW6?=
 =?us-ascii?Q?SsL2/jHm6EAvNvPNHZ6ZdY5q5etpWOA8TNtIVQAu4R549V2+Z6VNxmK0HIMX?=
 =?us-ascii?Q?xNgFPmo0ZYMqTj/w3vPJsm13yUimrHkwe3MUxdzoMgu9rKVcigBtdkxi2ytb?=
 =?us-ascii?Q?6TU2EimGqe3oeJWcTyQIzEz3mqNOpBOy+2Pdd/tI+E13S2TB+PPW14snmhIR?=
 =?us-ascii?Q?/ySMvPwiRlyM3ESJsqLS+PwhTvc/v6/vNG1JLXvV6YemIdQ18x7aVQHWzCrn?=
 =?us-ascii?Q?ieZNei0anQ+VQAfB90OvJBZqenHFXTmvMb4pCS8Um43ta9HeW0fJBe4meuss?=
 =?us-ascii?Q?sy0eMISZ54f9LWuiM5iJUeI1/hAFDiW2gyE7/wSHx7q+FJpNUvXrJgQVnb9i?=
 =?us-ascii?Q?2CcO7azIFGEjkZf+DdJCaLbBXDaLRMtjydqh/K6E4YMf+rwpNCe2w37plU6Q?=
 =?us-ascii?Q?OoqVHA1sevPdMzROsf2bMDSwIXbO7fbbtJC+z9Cr9It3CUyc99F/5lLv8cOd?=
 =?us-ascii?Q?Wv3GlVaVvWd+fYb7s2px5OgQ7tHPCsTKWSsfeGaSRJTnBehxDiKUVotoTyxz?=
 =?us-ascii?Q?+v5GhQDP05Q5phbaDKL3L7n036Avi+W+TTX6TxIc3eS4Q6+bEfDi/b0hqSqN?=
 =?us-ascii?Q?dGLFgzPecHpoe31pWCBS+zPw76dYdbLsyKId8cnIYzjRhFQDFHd60anSls3H?=
 =?us-ascii?Q?yrpwpdr7GDu0ugX1XWc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbfc09f-f97a-48c1-4736-08daae1d3d8c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 19:49:43.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5TQdm4+fvcBOfVrGHc3w3yzklbudq6N4JAawzjjZyuDkD96gZy9ipvs7sgOqgbV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935
Received-SPF: softfail client-ip=40.107.101.85; envelope-from=jgg@nvidia.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 01:25:10PM +0100, Joao Martins wrote:

> It would allow supporting both the (current UAPI) case where you need to
> transfer the state to get device state size (so checking against threshold_size
> pending_pre constantly would allow to not violate the SLA) as well as any other
> UAPI improvement to fseek()/data_size that lets you fail even earlier.

We should not get fixated on missing part of the current kernel
support, if we need a new query or something to make qemu happy then
we will add it. We don't need to worry about supporting the kernel-with-no-query
case in qemu.

Jason

