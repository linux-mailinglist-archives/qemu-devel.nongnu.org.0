Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FD52BED9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:53:19 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLzC-0004vJ-Qx
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrLwz-0002Nv-Kb
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:51:01 -0400
Received: from mail-bn8nam12on20604.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::604]:39424
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nrLww-00004r-SQ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:51:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB8F1vB796s9VhCLYdZqkAcRvL0cLdTsDUTyk2SqathyQzuyrrV9g9U9YQ2P8FdOPQ0phtCKdFFkR6XIFjzyxnqEUjtU6p0Ck9b6R+834h9MiJW86wzX7e43VuFAI5Q6FbuvzrhcBqdQy78STNaMeBMdJd3P/ftUDu/2y1s59O4bZGr3Dagi2wx4hOSw9xpnZz3SWDYoo9ze0fDdJIyNMdnQK+Egrar1J18iOsAanRKzUVcKASl4MCMAQ0zGPGSTprhoUBadtxymO+JaChN+uQLO2NgVx5KDPXzIT2fW5BXd7/fwbOxp/0+H2qdL68V8pb7Ctrf5fox6tmudbePIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLjT+6fpKotc8i2o/kFB9v31eiqwiYPeV7iANwjqqAU=;
 b=TyEkaFYvAzJW5ocMJ4KC2FY0DhgkgZn60XqpDbTXxUrpZW5v6nfEWSzMxXRoyEFNU0KFW1BkT/hqmYXsh/Ep0/YIh/W1pWvzhav7hnxiDkBd48hFDOufDxcfzbcLckwK0QIb9ZiFir8V/S2CKI98cDDEVMb/5IEQIQgOwYbqhbVcWGuA4vcGB9NAQDi9c0K+sMrL0ekxAaL/uD3dqaTYNqBw1MC/+eZ36+EJ6C1+0Gjqo34bg1tQ8TV94SLn1exyjOfSlm7I0iAv+oTiWB7mTrZgbthnkcdCP2iBzOC4DglLAi8Ble37+7XfcHgf6NL+nJNVmt6x2Q2rvNIk2AVmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLjT+6fpKotc8i2o/kFB9v31eiqwiYPeV7iANwjqqAU=;
 b=YJPO/NI2HJSxUbS2OcafRqbxXkWNz2e/Mc59C1kInAa0tSn3HpCWKMylU2Lz5soL/iJxdNfLS0zf1IHmMutgqcHKiiKMFICKrfwvdDFTIJR9E/JCcXDmlRMoTImUdIdAD02ViatjitQcsF89TicyXqv5uKS5Yk/9EVgq8WXGfKYEvzlVjSWBmkEXnoJUqXwzvlc9Ykd3Wa7fJD2tWDb0n19vVbrSV7BOYpyhmh4HoZRffBOxRTLV6MHGrDh57AkVzzM9N8L5IQb46hlBAo0KEE60XblEE7MQl2fPPn0viqCL/C+iWghhbz9cQm1KEKQ9RN+n6O0QlThmgP2NIZJhpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY5PR12MB6431.namprd12.prod.outlook.com (2603:10b6:930:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 15:50:40 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 15:50:40 +0000
Date: Wed, 18 May 2022 12:50:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Message-ID: <20220518155039.GL1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
 <87ilq3f4ss.fsf@secure.mitica>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilq3f4ss.fsf@secure.mitica>
X-ClientProxiedBy: MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c571ab06-13bb-4439-dd20-08da38e62886
X-MS-TrafficTypeDiagnostic: CY5PR12MB6431:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6431433D7476EC6AE7071BEAC2D19@CY5PR12MB6431.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwyAuo/Nqvx1ljvFQ5h9LnyjC1Nwm7ZXzMlYQdcvWo6VdbkGrO5wR6ejX3EZg3yAuFCCC9T5u2kACcBTtma2A3xMoTGiVwAwySztLcKTHNQDAXDIl4YXF9IPRhKrin33yv98f6pc9eReejT0myWhEPauKzHhGkNjq37rz2iXH4xm5vY0MM3DCmHUpUrDnQXkF6d4IiMyMr0lOawsMMCiD+yAyZYHH5x05vNuyYaidy0sb5pm4vSapBBN2I0kbV/zKi7IDkphp6esgFTtdHnCbQtXLwPeq35nH71r2N/hP8ih5iyBm5DuqbPzDfo9qAKSs2kSA+yANZ/WtaTLISvZOOn8nGi5DQdgTWY4Zxe5tm0th/IhQ9vUTr4CVuzUEeDQQ7K9ToZSHauwt+TbdnCP/2w5IdF/lKqK9SkELqpSTqPLnUG+3BEq8mTz0QjrmXtfiSjiA6ds1KSI8aB75pMhwaCLwhHOOy8DIbMuuDhb46SAzuTWaU99S13uN3rvWtHbCw7ZKlqTTUzdbf723KPnG33L8wf4Wxoc3CGb6RE0e7+XSm2tUTFZ/ugUbpUTknwMGZ8R8Zb4/H0PNWpFpoHuIra9uVdTiLIiTne0Tof7AH4cd52z5vt3jWbLAudmUV+yMkzE/K7Y+d068f+QKNt7rah1x6xPV2hI81SlpkyAD5wm+RTNhUG3pZALayaSkCvmxzz00z5z59MsSsS0ke+1xBVtWJjGXuS3mrbWBzelmSRuePWgpMXfeqQ/ZfEq2lQlj8MwxC1qHeCdgPnx12G40zF/THaIgT3HiMfysdsRBVNkPTgCcI7x0UF1I4Qu9fJi5qWslfeLoTjLf2Gf5riarg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(1076003)(186003)(107886003)(2616005)(6486002)(33656002)(2906002)(83380400001)(508600001)(6512007)(6506007)(26005)(966005)(66946007)(38100700002)(8676002)(4326008)(86362001)(66476007)(66556008)(54906003)(6916009)(5660300002)(316002)(8936002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMCDU0sbRB9E4i3peOWp5I+gZIh05/EoBbbUIpJr6VtJPD+noiymesPIvdTz?=
 =?us-ascii?Q?Hlh2irntIZ68DO/WNd6kdUSk5NA9NSW5RmL4dy80YidXFnqdpxHCut0GXBa+?=
 =?us-ascii?Q?oMkNg5K4XRe7dF71eXkGACDrh1d2hno4TUTKIh8ZGacAJZkDuybTUTjNSGsN?=
 =?us-ascii?Q?U23OVPl5Iv3BaX+cbBzcny2kFYbD1Ekz8sLgWq79Hd03w2Yp3kfb6RKnhx0A?=
 =?us-ascii?Q?G7jaumLinbkfRhvJIJ6HBoTJDeBEKZP2MBNJuK4IxnJswjJssiORevZD/qV6?=
 =?us-ascii?Q?VB5RwCiMzx16e6a6ZPYf9pi5ILMa9oMYBuIfrqqgfgJuqDQAbU8Q+2pq1Pc5?=
 =?us-ascii?Q?ybH7LJ1VfhPCe8P8JH0bc8XLEhKVRgDfq86jlVE8gMbAtT8aAbZSXPUg/6rk?=
 =?us-ascii?Q?ac7VsYRYxM2ShL6OJ0dICcMGTmCkF+M7m8ZM3dNhHNgPCpP1bmmUyM6lHSvv?=
 =?us-ascii?Q?9nZ6ptS4why7I9r3d8uCAKSKFaD9LAgqelZO4h9ofl09856G97MrXBCME3Xb?=
 =?us-ascii?Q?nu0+4/ZX9mfuxjgyALootSGaJcNajXuBM4FZGV/pRfQ4/nf+uAeWfR2eT3f0?=
 =?us-ascii?Q?Q6clGDO9QR195ETWBWxRHKJg68qQrMY0Q4A1fcvzBUGzydKsTu8b047OWUVs?=
 =?us-ascii?Q?eB3y0e28gpHW8R4ES/g5PgBJDNr8zJqY+CA7LkM+Xt9JSDVAa1QKcAZb9ZNZ?=
 =?us-ascii?Q?HIZXobCoZDnp4xB9ZAJz+J01fRCSwq1seX7JL5DQKkYu9P7AmYJyz0dGAWA9?=
 =?us-ascii?Q?G0Kxn5IeiO7zLhZNUKicQj/JroADZoqcgNDCrsQqMlSxQrm2Wz2LnI1/zy8u?=
 =?us-ascii?Q?ebrtVIShogmfy9v/ru4dln/YSBoaCbIg6ZdcG+zeTh9aDskHBaykEfrJYlne?=
 =?us-ascii?Q?10jaLjRpVZ/UKqyPa9u2wDP4TZvoUJi3sI04sB2Z39SFtpkw7pxnK44b8ks8?=
 =?us-ascii?Q?TvkKzlixGNhuJtr/6Rwj8qV9hMxw8jn9lMWA36vNW0ZQvWmUp8TqK0d3xS+4?=
 =?us-ascii?Q?C0R9B+4+zN56aQjPgebelyWNQGeObwyIh1tMZSPHOntJSfLQJwJ6smcX6RAg?=
 =?us-ascii?Q?XNJ0NOOUWOJC8AhQyMHUM+oEbka5sEbLn+WtmIjRRniCYLQsnSzG4yedOtbP?=
 =?us-ascii?Q?lBd94Z2VOUZO1IHD51Q3MKVgfO+34PdQ/VszYpi2JZOGRi/o7/ESUF3cYg/b?=
 =?us-ascii?Q?1O3M8FZtTh7WPJwE/IzLJdB7KdP5zJnWtj1OErYKXq9jXVGLMLxkLVm+1h+W?=
 =?us-ascii?Q?3e+Yslv37e7tZgKSeIIWJVcIobXcdhoxU4LF1GD7HSI4R+yvs8X6RnMjKmgs?=
 =?us-ascii?Q?KTTFSi3hIWAYx7NPTeaIhtEIwQQ8IoDJ4HpOatyV/2X1rGU0hhWqgN4QhdC2?=
 =?us-ascii?Q?3AucwYjBnky0Oxpw9NfE+i1nZK/lGs5jzBG9oqwZ7f6QoOu8aqF1Txxi8OOG?=
 =?us-ascii?Q?2ooVx8yb+PVeTuvjFhkvtP0su6w5fNyJFLdfdFlUjsWn2EWyIipplrnrshAb?=
 =?us-ascii?Q?0hemKhjaYN2WTxgH3FrLIMyzujPmYIek93QcYdZJU3YjffKw7UJ8rhbs+/km?=
 =?us-ascii?Q?BUt0v9VXUYZ/vlc+dXwqmh2meX5r+hHgSlXvTNGHA9yDT42SetqT6LkgDGvP?=
 =?us-ascii?Q?a0KCuiix5FQC/1oeS3hx8QtFsvtslMS9feT8/+3rBdkdTyeMLF1tDivOJaFO?=
 =?us-ascii?Q?4XbhXfhnFM7EB9FcPrjQ9CHVbqyoYfwsO/HoQI7fV7QSo7K/o7+r6Z0AQlya?=
 =?us-ascii?Q?sErKFUUxAA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c571ab06-13bb-4439-dd20-08da38e62886
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 15:50:40.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rMmGY+N/9iStevEBpF8ZKhfFXvzpa40wi+a0zBbVJfSRX/xs0/HqLFWNEI+//om
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6431
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::604;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Wed, May 18, 2022 at 01:39:31PM +0200, Juan Quintela wrote:

> > That does seem like a defect in this patch, any SLA constraints should
> > still all be checked under the assumption all ram is dirty.
> 
> And how are we going to:
> - detect the network link speed
> - to be sure that we are inside downtime limit
> 
> I think that it is not possible, so basically we are skiping the precopy
> stage and praying that the other bits are going to be ok.

Like I keep saying, this is not a real use case, we expect dirty
tracking to be available in any real configuration. This is just
trying to make qemu work in some reasonable way if dirty tracking is
not available but a VFIO migration device is plugged in.

Just pick something simple that makes sense. Like if any SLA is set
then just refuse to even start. If no SLA then go directly to
STOP_COPY.

> >> It seems like a better solution would be to expose to management
> >> tools that the VM contains a device that does not support the
> >> pre-copy phase so that downtime expectations can be adjusted.
> >
> > I don't expect this to be a real use case though..
> >
> > Remember, you asked for this patch when you wanted qemu to have good
> > behavior when kernel support for legacy dirty tracking is removed
> > before we merge v2 support.
> 
> I am an ignorant on the subject.  Can I ask how the dirty memory is
> tracked on this v2?

These two RFCs are the current proposal to enable it for the system
iommu:

https://lore.kernel.org/kvm/20220428210933.3583-1-joao.m.martins@oracle.com

And for device internal trackers:

https://lore.kernel.org/kvm/20220501123301.127279-1-yishaih@nvidia.com/ 

Regards,
Jason

