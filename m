Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E92B6A1092
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 20:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVHIn-0006eU-2N; Thu, 23 Feb 2023 14:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVHIb-0006e2-Gj
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:30:37 -0500
Received: from mail-dm3nam02on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::61d]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pVHIY-0004tg-NP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:30:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuK9yQBw7G9EmiWLZ+J8AGORi98lvyyQr41RlHcihv5SB3HZGxtiXrNkHJm0ekGSPYLXmfL7+DJ/+eyGATUnL/8sPRXJ8YW9xZwsMgldjX7wfrb07NlLMzveNFk8Ua7c5DxB40RVtvCTikCpVZiFWqE2ZgvkJmJCUJDpCB6TvzTx5c+pyeIt0j47i5crVlon4idH6ESUN228abiCB5h5K/ZW7jENzE+xTYK2kwrl/l5+Ha6NLg5w7JMmGrnd3pt3vGNpquu9xYUKMv/+Qz1eKW2+deKOwj6AFZnZQRhEjqhMQ6ktNN2W+b12uAPLU7zHyxXoUFyDlK2RiVoN0urGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMMnqayXRto172RLuvpZf4snXKfZqSyUnsz1EJGuGTQ=;
 b=NmjWq+IrGkCqBJ8TmquCqpmCQUfl4OBvx5WTCktkTDMp5pBW72vOiawzrr/e/XbGTZdxZlq3TSOrRTfruQLmnzzUufgLf2V0/nOdLMPqAzjcgYNvTQ2TlytSU9zlVR9gVifPw4IWamCMdO4pUtuwk11xWGyqxK2djwzSqo9sP41uTg7xR9yRc/lESPhFo+whjGYmVz+SL7EAeTSrQzl+ooAhB2jmedYib90DgVOpc8PMugZ/D+N74tArIEwmVJ6zeGp5nFTEH8BzswYFn5tqmdr2RhPxLQA9u1mhqdMODBRT/krxgfqyj9d2Cq6Ndk7gQu/qNbi3M1Ak9BqiGYSvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMMnqayXRto172RLuvpZf4snXKfZqSyUnsz1EJGuGTQ=;
 b=GATcPzOV2IkiVDWgWyXCffXfBWdNAeyCnpe0oTZUL+81lFMebvCUFQBEtMA/KaUPABHImK2akHEXUP1OlQalrrP2uWUwNUpAtVtsMDsK86/3wX4KKfn4PI00hXQrkgsaAl24XIa6OLWar/Q2VnSAOjJNFG+CN9V6hFSRDXzv4WoLtdD7US2JIUWBi2D6ABnrNVw9nekbYUgJ6/zE5gESM+QG81NSdG8H33p/VaNUCrWIPN3nHEvHXsnx9I4tC5dTAYIHhyOfjeL6GkquQhsqdVGzlBlCmc5yV+izpjwI0h95Imu+KdvuyQsyRhMeTDe09i99bvkRjxT/O72EtLhv5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB8721.namprd12.prod.outlook.com (2603:10b6:806:38d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 19:30:29 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 19:30:29 +0000
Date: Thu, 23 Feb 2023 15:30:28 -0400
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
Message-ID: <Y/e+1GmGBtKKhWK/@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
 <Y/bJMIR8stBcJpW7@nvidia.com>
 <20230223122723.6a204e1b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223122723.6a204e1b.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 158295ab-ada2-40b1-64bc-08db15d46c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09/oWQnHLAjTsR8fiDkuL7+IWOFpjLoMZi82gJ+IAAqpresg9ZBJwBKRLgfbKBHFN4sh0u9bVoxq5pXUW9KPWCNs3cEeoYE0cics2n7NH9urjlxAYChoBdW7Q04J+pOajpIPEOzlrj5wqemnAg4GcrVqPxqs2M9ZZilvTViR01kMAyZ6XCythinsGJXLNwpZrJeZWpjyt2BW7AFE+g1rbrog/sciJkpiOKSvQ5IoOK0KphSxx2j5/p9yHOFniZbjzdLBMQhQKJFHt6cZnY/Z5wYQYObxGVGZvwe0JLBqDxn+gAD3XX5MtsRSzkQmT3HKUshzs9eLL2WKdLMWpcc2QsgfiRJu9+iovWjzUA0RHc7gFaniGEO2cwTV82Yq2GDBNudGKXY+Eh+6RWUszOqaw9a4Y80Fb8MSXZwh1zYRmPEn8JeKIYySHIqMBhGDAwaf1pPhilwlyAAWqi/fT5QIQyoGA72XP5XDJ/ND6WHu5OyemflM5pMpqs40fxjKt5Iqvnl3i/nYb/qAskl8PNoUNAaqlOQwjHbZxBkNZwl4NHL3Ovk0Ykrm6r/tdB9hpuLxf3bDyemyUFwt3JzjCOWGL/9v/FAZLU6s4qTyOkxV2nNkuz+SpFX7q7MyIrwlCdnoYjLZuTSWM/HTMChLo1BQLqs1EhiiNcwBjRM7LO8wZN0kvwi0sGXealEQ2djaDtnJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199018)(86362001)(36756003)(54906003)(316002)(478600001)(186003)(26005)(2616005)(6486002)(6512007)(6506007)(4744005)(8936002)(7416002)(5660300002)(66556008)(66946007)(38100700002)(6916009)(66476007)(8676002)(2906002)(4326008)(41300700001)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmQOF4te2zKNuBNFT2wPfr8cD9HLeIKFluHVQQfoSZ5Qwrw16WrOTaYYGgM4?=
 =?us-ascii?Q?etRAwhiuIp6n/DC2Ls3UmQYVrpuMryvLjB++N1+3xqgH6UrS2nGvbroL827R?=
 =?us-ascii?Q?CYTaUxe3wzZIcwR9M60CQD2Czkpk3PuzTFct6TLPwXmw6NuBAB4DaZt4u9dh?=
 =?us-ascii?Q?K656+ETM8eULB3ysAw7+mf0D1dKoh+SezDYnnlIW5vk2P9oraUBA7Zbz5GP2?=
 =?us-ascii?Q?p2WngoBKwbq/jZeWCM/gAxJxwQIApkXU86f4tRa/6qnqqC6kFoMuvS6Ijp1T?=
 =?us-ascii?Q?LEx5OdtYzxCwb7gpKkdeoiIUtlxZvpm2E1vB9ktrG5ey7W6UXlvPOxPh8Ztn?=
 =?us-ascii?Q?siHeUop1hJun0jv87mA2OByk+Xl7l9Z0kq7KUI9lXDPMbUQfDdCNQ4O+Cs8/?=
 =?us-ascii?Q?5U6eASUhM9tBaLAEpLH23kwQ3BylHY97RJ8VZBDZs2nx8/O9BuYHyUQMU5Tw?=
 =?us-ascii?Q?E0lTmp2cbArn6mkRBr0jBW7XdqYwEZ6pzwqumTTWZxz/LjBX5vbtnCBFTWFz?=
 =?us-ascii?Q?JCvg0xZBwYBmyjaRVMITMUViD/ZYoXSUiI+1i8rMWqoYZte1B8dlis0mXysZ?=
 =?us-ascii?Q?Uk3KzjPMdBkDPAbvdtyNmtY5bHN6Or4mfTCBWvwnuT8ZEN1lyWJOyEjaovwN?=
 =?us-ascii?Q?DAOoglV6xsq4s2suwktmzskm8o9Vo5rooQTTnh3BUz7cumqXB17QuwKCCBDl?=
 =?us-ascii?Q?AODzyS/GFMe52ZOgOJeQ7nm7wTYhS+Pc8i/+DRytA1DgaMX0TMwX/Tx2YCTV?=
 =?us-ascii?Q?3ZTKqO7Ll4A9IwiZGU3gyJCNBFLgmtlVpu6bCz26OMD2/ka0738FNV7Xn1rM?=
 =?us-ascii?Q?8Lbnz5+5f5v8MiQ1MeGbvNZ1AmDgMAW42R42vw+RxnknmUqgyl+rEtAxDigR?=
 =?us-ascii?Q?CvyQCBn/kzVXh6UvYrV4s8uCDWj3mSqv8GXKVK7PIRHKym6BKEDwVueLH+Gl?=
 =?us-ascii?Q?dgj4r7OdaOia3avlubPWT+wA48zzcjnJ2qXSOew8hlK0vZYyYCDpmLy+z0M6?=
 =?us-ascii?Q?0koykmCyszLnui5i1j+gSONT9TYiNP2+4ccfEqAThb0lqMF+f7OD1l27lAaq?=
 =?us-ascii?Q?QKeIOYETc5saYuP8g6hjPGCjziwwBmaXXEIGF8ywPqXuLb9QlyiwCeilxPw4?=
 =?us-ascii?Q?SnjeuGPXO1O00s4EqKjGXbOQM5iCaVmkYbjZqBRFO9M+EfEaFYh2oQPOYFvB?=
 =?us-ascii?Q?Mq0wP+nkf1DOXogjoR9AaaPUIiXa9lIfoWLHhjdBPpXxbgrUANs+8JxrSOgw?=
 =?us-ascii?Q?fLg9T8iahbXFtoan8wxcyYgce5MGMt8p1Xc31zcXKtMWpluGk1VHsmJ+SnTJ?=
 =?us-ascii?Q?eazBEbXv5G+BC002KukinD6+Hz6wJxiC1iOFEt8t9Y2kqa3b6p4mQLOYrjNc?=
 =?us-ascii?Q?8EXATFCwrOmW8ssSLPlHw2CdVHm9MoOaLnXAcHCu6zFYwrcB3+6tHnuCfeCC?=
 =?us-ascii?Q?hj6yCXsvpQpDub73hhvunVeswJ/zJfacKCA9gfU0QvQyk6KLW597bv2Ek5AY?=
 =?us-ascii?Q?sAO0EtUhjGJ6jvObvGqR48aETskLtU8EfYBnCC1nd2CW8nMkOJgOc+XBy92p?=
 =?us-ascii?Q?GYh5GslWJzL878ZLFhVLZJRdw8/I6ZICvcgGgSow?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158295ab-ada2-40b1-64bc-08db15d46c0b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 19:30:29.4555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYWK+/Z7epCSs6j8ReQn7eS5ECXcFv/OoAqv752d2wSf2JkJ53SpyWngZKltAMwr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8721
Received-SPF: softfail client-ip=2a01:111:f400:7e83::61d;
 envelope-from=jgg@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

On Thu, Feb 23, 2023 at 12:27:23PM -0700, Alex Williamson wrote:
> So again, I think I'm just looking for a better comment that doesn't
> add FUD to the reasoning behind switching to a single range, 

It isn't a single range, it is a single page of ranges, right?

The comment should say

"Keep the implementation simple and use at most a PAGE_SIZE of ranges
because the kernel is guaranteed to be able to parse that"

Jason

