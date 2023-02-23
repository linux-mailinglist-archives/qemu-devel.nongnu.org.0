Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3856A1186
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIcD-0006yO-4e; Thu, 23 Feb 2023 15:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVIcA-0006y7-Vi
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:54:54 -0500
Received: from mail-mw2nam12on20610.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::610]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVIc8-0001nd-Pl
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:54:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5S3kH93B2Yg3BvkSzj2WJzzsHinIagbr/Kzx8pgWn3b2HkLwnlRJfRYQ6l61/UtPTJOD+jxQGzPi04quju9d8pZc78o5fPzSXqDJK65PyTmrKFyeKEGF8DIp3p6WAfsG7/R1V4xDdVTLWeM7dHyMweCq913oyzBmszec8JAbF+73sHgh+N1FdP8d4iGSFdGOTFw06GDGa54UDGraMx55vWh/6lXR5L22P4CKpW8H9u2P41IVzkh6tDz6kgrmH45afwBMk4kNlGcKw7jG+8hh7Vtjm2bi1A/Ef5AmFUH0S1xbWH1mRtyJmwkLY7yJj+jBBzUM6TzDrp/PLElfHTO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnrKERzaRSVycHvcVg0pLa+iGg0zswE7Utrq+gV0lFE=;
 b=E7Nni8CvfF0CF9hBkQ9gOcZRBsdRTo0iDqzbDPu1/Mlei+Q3vV1BmFHHrWWI3NCUsDHUzWeki8VsjNjZmcAeynuzKKZLmqDnGQxGI5WM2ZuhLHK8GjlzW7pesseR0FLoo474wk2joj7OZYZN4Tw8PreW1VxNSWUomU4LAAz6kx6CZG7LYUXipkBi2BqTlgmbgpBh+Piy4V+QNYEE0dCdOyYJiWNeJm7D6HGompebvsr5xc32+ce3AdSCRhJo0Kbmp0R7uL0r4UAXmbhWPeLWCv6QVznBaqOtz2cBaZTtrJwL4yLiU+YCNlUcUhEtfj7KTCIoHgGeQlT0tGFgZZY2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnrKERzaRSVycHvcVg0pLa+iGg0zswE7Utrq+gV0lFE=;
 b=WNHlEG2HRMEKrBKCVOWKU/2ZCgS9cFZTu4L62t9PEUGQvassgD0ezChpnRPmBq84sr7EGRiZ0WbWEy7II967FX+wF4gikQdv/5fA36gtsz8Jp8Khvt7pJfzv5gwAYPs48rjLExOzTOelg5GTUIjXVvS8tDSgPh3OKf0ITjKk8Ave8NtaRDkjaG3Kfv6d4SaweLcFl7PN9C07Z5r/wXtfYxeS5Jky2cKWSE+uQejfLxj2B1XkfUImZQpQaJrfMsRDmr/4isAelD67ZvCnQwLeYw2jzYYrm7TgXBIKiQ0SMIl5Gx6/oIn2iwKXaYjNl6iwUqFX9bGUkb6UeAmC/ln/XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 20:54:46 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 20:54:45 +0000
Date: Thu, 23 Feb 2023 16:54:44 -0400
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
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <Y/fSlIUcsODBp8Ck@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
 <Y/bJMIR8stBcJpW7@nvidia.com>
 <20230223122723.6a204e1b.alex.williamson@redhat.com>
 <Y/e+1GmGBtKKhWK/@nvidia.com>
 <20230223131640.515451b2.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223131640.515451b2.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c4f415-1b70-4ccc-9151-08db15e031db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtKvpQFj0MXoN66CJvgrq1pYUS7WzVLoOlNrq7F9+3DNlFT/M/btinmSyI0NNXPlqF7xIdRlN3FzclTSegMoBHuO2kaFyzSPkMjOVFArehkcEN2kVgOCpUxIM9Ie0jbXioQdU1t3avv/xamQjp9qyyC4MvUF51VbCYh935mG2Qabdx2jgKvMmu9yRrUxqGtMgLiQ6lipDr6H0wRXtEYc6euVIvwULKQSP4IV//1JpnByxCMaGZH/HcAfvXYoooDNmbMz7oocD8Nt8ol+BcWfBDnb3ZBLXxvoUJlf+kesdhfr4N/qKol7yt5+r0Pots/ViKAsiQowm2SaAHxUXRzLxLr04a968PUfugd0hBug2L0+cCVaM1MH09NR6YemvWC27nW/cV/7cipHPZKjJLXFJW0wVKvGq4klR5MNzhrhl925IaowfbqNYCzpMR1HkkC8AwfDiR2bm0rAM5YMTHoAk1MlodVm1RGrBKgcnn8b1ApV8IX9Tml5vpMatefa3wyXQ1ieEhVrIarnbSAYX1t24tBiQGB4tkRbZ9izEeyXIxewIXItxRotzCLpx3nSwFAc+WlFWNaBkXiEF3qTvsfPRKl+nH+vFaNlFSiWPiTWZnP6VoSpkgs+2s+BO0W9jBTeFAwLH9KIChAzLv0lpNTWP/5pKL6d1uxREHRB4XYwl1p2bsPKGckzIpPuMQ8o1xwI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199018)(6486002)(41300700001)(4326008)(6916009)(66476007)(66556008)(8676002)(86362001)(66946007)(5660300002)(7416002)(4744005)(83380400001)(8936002)(26005)(186003)(2906002)(38100700002)(2616005)(478600001)(36756003)(54906003)(316002)(6512007)(6506007)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbWXvH6R6W+w/Oup/TzK/7rUZ40/ZhZkeCy0s+ppv7RNWRAfrxmMmB7faLFx?=
 =?us-ascii?Q?ZkqXKB4LKBefFESg2mRGWRXRws7GEVzz4uTDvnE792lgicJ/xH6c4f4NvW2p?=
 =?us-ascii?Q?5cZO08QZ1app2I0cPNt4nICFnA0hKtLBW2bOz6svYKIbpxR/E2HsIxgA/iWX?=
 =?us-ascii?Q?IS1lxtHIhw84uIK51jsaQt5GomuYqOI564FpxhtkeHphxsEP7lhY9Hfh0dJw?=
 =?us-ascii?Q?7Q6h77lDn2CG0xpRuINGzvwW/9BCKZtkC77YoooBSj0sqjfeAd4kzA4ufCB8?=
 =?us-ascii?Q?9FfjcImAo1kF5xLJlfjZC8PZ4CzIEd+yOCU3R6ZlL0R1vnIBqiwUpQWwYrLl?=
 =?us-ascii?Q?fR4c1CBRdfLxF8hONPhfwCukSF2lmSTxgRnbc86r6xOOaYSoCxakECCIFiqa?=
 =?us-ascii?Q?IZt+G+RMzWAOJKLCWWZxXqxn+AdB/g6rXFNWom5qXeA2r1a0BB2MuDCHV11p?=
 =?us-ascii?Q?dm27+INjgchwjjzAQaCsrGPTgYTGf1uUP/TyrOZaZv496Jya4X/KoymNlrF0?=
 =?us-ascii?Q?zJokeiOxsK5KPIEg/DlrIl9HYSxR5Isc/5F5JN2/T7fjRme9+6Ufg9gxD/Ty?=
 =?us-ascii?Q?qnccSsYUdkRzxceA0geBj+gJH0xFLkVCpfzT4vZCFv+DfN54PMh8lzLQNFzY?=
 =?us-ascii?Q?bi0ZBPWxIbjuWwYMox5F3FBE+2fs4xVhewKJJXYMWLIp5Ag3yTYlZCmmOmWa?=
 =?us-ascii?Q?9/BMgvhTul+8n1JD1qzFSk1aeR8L8vYm06Xtxc1TERKgo6vKlwK0Ie2c587g?=
 =?us-ascii?Q?f26c0uMoE31B3RNOAiWtmDBYGx6ZqHTU4J6tu9ZEj+ZuwDUXVqPNjuuwrsji?=
 =?us-ascii?Q?ScU4VuldAY0Ya0HI8Ex//z/Z9lZd18CJBe2TMUsoNfoF0jnD3QVbSDOu8545?=
 =?us-ascii?Q?/4rsR24G2f/9qUPss5OpZiVZ/rXZy+l59TcWJvQfHGFT2YqtkYx+J4NGdHFX?=
 =?us-ascii?Q?fXWQujYACBKWzLhYXM3y41l+jOFGhfGlGnOXgkYP9V67yz/fo46v1GaGnsiy?=
 =?us-ascii?Q?umRbYdECef63KPgmIrDzzvJeqRZKTdX27WxqXD8U/8N31pYF2H7r7igLXhci?=
 =?us-ascii?Q?1d6jBaqMoV6AoLRv2UFM1UZx+rOttYvXm4G7FlIgaR6OV1QvhmFFb26xHWL4?=
 =?us-ascii?Q?NLtQX2daT3r3dbmI/1l1O3FEAsX2Q4kGxLHub2Q4hUTGuiQEbnp7PVQDD20e?=
 =?us-ascii?Q?RMOGJTjTQInsHE1U3DSzjvnbIEa5H8zOUp2IqBPgNsJb8oXW/TKi0ukYYypj?=
 =?us-ascii?Q?P4VGueiglboT+wn7mKcQGjdFx7VeLHVVjn5NZ1Onqf0pASeAbEk0RBHf/Q8T?=
 =?us-ascii?Q?VxlG2yI5JdyxOHwL/B95+GK2/GtOMDbVa5QNp9Sj7KZ/jPJDV1RVCgqsxkFE?=
 =?us-ascii?Q?buFzq0mlDtgNNAStWOiNDE2Vgz2vu3T9RDmGplv65iXBheV42SmU3KKbdYgc?=
 =?us-ascii?Q?lCNJQVOFSqYX+jcEbpZudX+8Zgmc2lNR+erIS68Gyo5rYSY1d+35mEmcGxc7?=
 =?us-ascii?Q?f3xLlGkFY2us4muSt9YAPOaJ5WWgwPKaUeGj/EdELmMQobBLZXb+8gWRufSb?=
 =?us-ascii?Q?4hfIPn1gQj62btnFyIDHwdO4sIgXCw/luQk+RFFr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c4f415-1b70-4ccc-9151-08db15e031db
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:54:45.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcu5ttRvUhfB/qzHpIXq5WAR0cdVdWT1LVfFcCIe7EgSyuSL0R458Deg9lXRst3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::610;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

On Thu, Feb 23, 2023 at 01:16:40PM -0700, Alex Williamson wrote:
> On Thu, 23 Feb 2023 15:30:28 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Thu, Feb 23, 2023 at 12:27:23PM -0700, Alex Williamson wrote:
> > > So again, I think I'm just looking for a better comment that doesn't
> > > add FUD to the reasoning behind switching to a single range,   
> > 
> > It isn't a single range, it is a single page of ranges, right?
> 
> Exceeding a single page of ranges is the inflection point at which we
> switch to a single range.

Oh, that isn't what it should do - it should cut it back to fit in a
page..

Jason

