Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D368C660A5E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwP4-0001Ik-Tn; Fri, 06 Jan 2023 18:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1pDwOp-0001EZ-2r; Fri, 06 Jan 2023 18:45:28 -0500
Received: from mail-dm6nam12on2060.outbound.protection.outlook.com
 ([40.107.243.60] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1pDwOn-0001iV-1G; Fri, 06 Jan 2023 18:45:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YliTwhWnN8hNG/IfpOchxm5SowT/EN1Ze6Z9h620UR3ragH1yOiCCosNrwlgxeIqttOqPsgMPqxPICwZnqbGrWdjjZ9rzVw/Um8uH5ptLKRlGPiwqLnkhPkoipEPKJ/K+wyls1154kWHWAOebR3hITkaUPr+w8jnLZZ50qL/6SyJr6b7HTZGUVghbBFnJeCH6RTjycqSIk49DWPSLSMOjQuU5DFaYaksGMfIOgKTaB35QISstPxrgHRIcVdrXZTpBymppo03ZhiK0/6HLFyxcuRp0Cs3TYFOHQ4/76syyAPGdkjPWR5o3WnUInm2Bsv02ckVcgP4xTBWWLLlgd7cgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdppdK24zWZ34AKo/q4K0zRZqQvcxlMGq/vUSSSO9bk=;
 b=DsdFY4jv1VGx90+GuORPKWi/fmDNAOBwyy0bexhofOFu+lVvCtktNA1UOaLgCcUL8oFxlVNGlBPGhCh/gRnL/goiHvbAtN5m/5yit7+GAVBnd5JWyfwquvCb2u2PADrDj0Y2pY1YXpDLs7xBnKg0HBHWflS7mbrSShQGHAMr8xGIA0R8t8KJOCEhXnAxjTJGnpRtrep9TaghQrBGn6YVvqpA34P5bp7kt1bbwkBXOnA40REt/L1M5fIoATNsUlWKlNxoRCx2KtLGhDB545WmVDDVqrt2zRdQnFJZjJhJe0K5H/PhVyREe+2H0ykE5NX/zlIPhOgaYGRziulgGhut2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdppdK24zWZ34AKo/q4K0zRZqQvcxlMGq/vUSSSO9bk=;
 b=QUDM2U4dFgi6POHehl6N/YOFYBZmUlRYIXWMl1Miex3+F90ulNjagR6Bc6tAY0Vaoq7JS9RZ7Pa9uKodHyB3Pej+r7bDS9xvNqk50kC5HTcuIGhaQ2TkK1iRxkuliX1gzfLipM0ruFEs8J98ru9PUu/upMgtV0o6SFfcm4NtqBPeKmdFJcWLicX4NQCAhvcI8SADgSqnbqJDv2+lf3Jw8VZrZ5kr2lI6ssOZJXWZA6sAbwOL2Z4Z/cksDmRapEfbGLqwWK6h5Q3j8avqRyW2HitL/AE3nDk+cvjdLYa/lK04lWmHFKR3dkv5UOOJlGEObi9Xg0xvVvRWWD/BFh0ujQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 23:45:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 23:45:15 +0000
Date: Fri, 6 Jan 2023 19:45:13 -0400
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
 qemu-block@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 00/14] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <Y7iyiVmQ8p5e7s/8@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20230106163609.430628cd.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106163609.430628cd.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: ceed9176-672f-4540-6859-08daf0400f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtRwKchmNwlNr00H3zEFpQnDP9c7ILDlxlCEvh6JSjeng107hG3ICyw29E2xiFpkIR8C0tHLnaPe3ijCrkQZt50NQucq5dlhmup9GyENn8I2CJ/8qXIBDNTZn1axlUeo+orYq7Bxr5L49B5zVnGwfzsmHxWYNk9EEt/MyfTsYM0+OEpNUdbtbnw67V6uFRFHiYOLYI63AsG/vX+LCKSVTWrsVtnZcQJ8fwLicdrabpajv36KHi6LyrhNN3Lm6o6UHJEhjTBD/DkTfbShD2lfLl6V2Gp6wc6jtbuNIEk0lmcDpzMTXNlJVRAZZxwCzomJYEAaANzKRNANK86BB6hJIwZvDQlmC1/I/cHxoB9WL8NFd8yAsAN1qw6DRfD3S0CNlJ5S75VE7W0eNEUfmIxkWqfTvLYOnTZ48KWhaH2a+i6gxJxrWdWpdG//5c4JrI/s2nDmLd4DZGITse4qMtDpl19Lv/cbRNYXYtB2TzpokVn/QQKLoeAuwDfjl3QZ4RX/JIIiBXWg5AlAFCp0VsqCEp9qxJJtBSwRUXYLymItkgj0S1zcNOo+rB+V+JobYyjG/9BqoiTv/OfgjCXOQe8ZFraIinrERJvpXiXq3u7mtRzEbR9e0bLgNLw3R7HzaNti9dLurSCfQoD8Dd12+ElP5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199015)(7416002)(54906003)(316002)(6486002)(186003)(26005)(6512007)(66476007)(6506007)(6916009)(478600001)(2616005)(8936002)(41300700001)(5660300002)(4326008)(66556008)(8676002)(66946007)(2906002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNyJi8891GRTui1JeJs5cGTP18T8FrjpHCOtUae7F8cZNlGEAJLW8o6cwRSu?=
 =?us-ascii?Q?p8WWitvWoJDEhsci3AJPsdzRWv9EhKZpFJfIaeOWympN/KjOJWUuybW9QuOx?=
 =?us-ascii?Q?G1c+nHkgzxNAzmHW90H8nC9KNMu90Er49vN0tjxXSnMt1tVf92hIdlY/9Ai+?=
 =?us-ascii?Q?qHvoO/vkYScoPxiv12o3DXUgrMlB/ajsOoRGgaJvYjM4155mRGgOwwbDW2Qf?=
 =?us-ascii?Q?P0DToFJCDAsGyJnrRHWUMDDF9k+5BbCR27pDrAmmrrMtKqUqgM96etQPZWZy?=
 =?us-ascii?Q?mHqqVZgRq2vmsHdmnGKIw1hL99cQ8snBIxQK1GxosVifpmyntt5WOBb1dEoo?=
 =?us-ascii?Q?bT1Pv1J8Byt0Q06B46Uc3sb8fEeMsegU9XYulK26xlVynsbpxqYX/QdbZmo6?=
 =?us-ascii?Q?ADLNST0tWCNfLpvuga+aItgyrwWXL/dFFJ/HJhxY1yd1BgplntJPth3liFh0?=
 =?us-ascii?Q?Kx1MBjEAthGcFJtg92TStmTTkpxLnznI7X5AOf2OElHvWkyRi2ngBycPxjBR?=
 =?us-ascii?Q?9gFFWKcnDbl1rPKR691RoYkhynfmLvdFxtrkL3qgYa1sdWcBLm10LtZRN6cx?=
 =?us-ascii?Q?UUQV1NfEiNQSTtjzWEDROUzu2eyd+OqMUnIUCr3PTUAg3jne2lzmi+71GjGz?=
 =?us-ascii?Q?Y4KrB6ut+2X6fCwKG3sHPB3f6BPaE9r0fXIrUiDS3QcZmi45yzM9aSvsPBFc?=
 =?us-ascii?Q?wNguCFlsqsGRbyyRo8HHMe2rRyxKfBztktOwCA16YrSLKAvSzdy825gFJQ+P?=
 =?us-ascii?Q?P5R7NYS4tZTdmWAS4OSP2qxtBJHj3+6X8O4sn6nBviXJZfszpRgqwzTPIJMD?=
 =?us-ascii?Q?GWrgQ8XGPM8jOE+obVzjOa8P2iFewqoWSA8jdBmLZVAGneYAtZ9Ht6IoQUl1?=
 =?us-ascii?Q?j7rqozaT7+ogKsNRgR7di/cQE7gxGhbKp3s9rgeRNjeh3NZvtYM7TvWBcRYZ?=
 =?us-ascii?Q?cFiMsbn1HcaPUdSE7FsVitGpa3E/aeo02vQLfl4HfM/1K2HIj4FOWKMoz/+x?=
 =?us-ascii?Q?ujGcH9u2Bna1YBLXE3UXFsbRx42FC6yzGzd56TAAdkFzxyf5JPb0dYFts5Pf?=
 =?us-ascii?Q?PHOpoLtv1ybnV/feE1kgE8RKPXaIPfc9je2VnydX/7puIjjG70m92rmfdJYe?=
 =?us-ascii?Q?zERU4IUOlCIJZnpnCZVKERQguIoZQrXA17mtNtSSG2iMYCKmfb0wyT7NQ9nN?=
 =?us-ascii?Q?OPM8BztGfGWqBP2tyVz0iGYAWmbyQGKmAw5nM9HfMw6iGQQtSsACnDDccFz7?=
 =?us-ascii?Q?D1T2ZWgwktbyToMh0/UsFqTDiAYELJ9RXngJ6FRNpTZBGB4GvaMInMmOGv9e?=
 =?us-ascii?Q?NAZxfG4l/MUS20SepN5xLn+IB/uU3R1ylfUM/UV/GMN1VOqaLUJ43lsf0Qr9?=
 =?us-ascii?Q?u9TlizuAnjC8B42/atUNcWQNDV10FPchZ/C5qmfSTdQDs9eu1snr6CGOBTxl?=
 =?us-ascii?Q?StdUIeNzfBeoAuRu6sFTCCU5XwSmWRghNfcKkB4qT8bUfycTFQ/oEO6IuWGT?=
 =?us-ascii?Q?nYMtRI2e4o2iFV7Zi/BtuUfbf4pWPJ3VONLevAYxG7aTxZKnsfpKB8Ng2bvz?=
 =?us-ascii?Q?iKxMdAD5rNXhc/atFnrIyis4hNpZHzzOFv0RLzlk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceed9176-672f-4540-6859-08daf0400f10
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 23:45:14.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gk+sJJVou6JUgu48EoUbL2S8SnnobrwEizI+xvQudez5D+vK7li80zu3GM+4RxX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517
Received-SPF: permerror client-ip=40.107.243.60; envelope-from=jgg@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On Fri, Jan 06, 2023 at 04:36:09PM -0700, Alex Williamson wrote:

> Missing from the series is the all important question of what happens
> to "x-enable-migration" now.  We have two in-kernel drivers supporting
> v2 migration, so while hardware and firmware may still be difficult to
> bring together, it does seem possible for the upstream community to
> test and maintain this.

My post-break memory is a bit hazy, but don't we still need a qemu
series for the new dirty tracking uAPI? I suggest that is the right
spot to declare victory on this, as it is actually production usable
and testable.

I'm also hopeful we can see the system iommu dirty tracking

> To declare this supported and not to impose any additional requirements
> on management tools, I think migration needs to be enabled by default
> for devices that support it.

At least for mlx5 there will be a switch that causes the VF to not
support migration, and that will be probably be the default.

> Is there any utility to keeping around
> some sort of device option to force it ON/OFF?  

I think not at the qemu, level. Even for testing purposes it is easy
to disable live migration by not loading the valiant vfio driver.

Jason

