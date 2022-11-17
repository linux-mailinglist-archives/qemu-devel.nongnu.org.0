Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F390062E2F9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:26:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieC-0006KS-77; Thu, 17 Nov 2022 12:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ovidM-0006DU-1X; Thu, 17 Nov 2022 12:25:04 -0500
Received: from mail-bn8nam12on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::60b]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ovidC-0005uD-Ao; Thu, 17 Nov 2022 12:25:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebP82ghmc/fA5GQx3K2GpBGKQF3Hsl+6FgmedyTvPao+ob8WEVbCYiiNojzofYxs895v2yDL6BimquhSJhaccSe/ziGInIWW5+fHFK6YVIf0DsWkkBObwLF2hBkedfMTgjllX2oYPcJy11VpCRrInokxhEmhe/y82E8xhCWFcXlbTgQZZKZvotMXCjom3k4UoxekOdnkNpud8d7bk3L2i9aRTns4U4NJvStn6fbvIDcjtvfp+t3Gx7ohRX2QVKVtyrA6VOB3Ncb6DDVl2HNnb9alH4QAYs/AXQjIPl3oQB25m+OPTauTBwmyFvrIqFpcWrRUAY9ScRHpxon7pzEbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVFhsixmuZMamQJdCj7/bMNbGC+/cCFaxjLsaDzG49A=;
 b=nO7kHq6BlZ9XcSGpGgmP4QE7MxBmACmi4m+O82TIJfKg7DPF7xtqmh9hzsweoCgLVatssz7X2oMIQ9V1nK7JWAk5Dee7NDAn4HyaOCwoczMFJojZ3BMb5+cSVaMGassqQKmjFBunbseRlEKMHpeuTdOn4gHP7U91s1WqcAO2Wx4HyjsII52tTZxVL0NItdQi4FJuomMeT0pVdXTfMRMomOcMtaAU75Mo2/7Eo9VfR4B3xi+tg+rZyT6cg9R7HeF1Vcv18oOPa+EqvG3tfBMsntPP+5sYAiuw2FfiqZ6clO3ebl22P3V0RnkLCLZ8je9+PMzPmcY9os+erjoQKx9EXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVFhsixmuZMamQJdCj7/bMNbGC+/cCFaxjLsaDzG49A=;
 b=EIF+omcqLajiuEKcgoYyBKbRBDmsCC2Eq8ppmXgpB1z6OCWSAvGJY0r7U+sIQ6wWSf5uJExgeBPea+pYezxdxJalZNpPN2nQQy7IzcZEQ3y6QtDupL16cE5XLfMJG6i0uu/AbLP4LeVF+wMgWKtL90q58ZmAdToMHt6yz9LYuj5jh02L84Q5CDK/2VsrDHDzyWtMK36QkVcbKuWfeZDAF7sibXRsZWFAGUEWcAkiLtF8bw0xuVAwW/PT9OsdZTIczerPPZHUXaiV5kMSAyXxEXOIJ133TjYHV29EP3oil48Szu2104ZC1h9bcx0jAJd7+5yqewLCA4qTSfRoM3SFBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 17:24:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 17:24:49 +0000
Date: Thu, 17 Nov 2022 13:24:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
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
Message-ID: <Y3ZuXSM9/dft+sDd@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
X-ClientProxiedBy: DS7PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:8:56::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5d51c3-7d55-4e6c-aabc-08dac8c0a011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpwHhJ3koatQH1daPIiivH/ufqu1Y3+oVIFf+4pgUhdEREsps2vfFxiTaKLdUCi4AOt6nWP8RYTdDwip2OoTn0FKyvikbrcxkdbM/ZIaAHv16pEe1W/kLWk5ZOd5QGUCW7GSQueQLEP7XeMp0IYqHAjn/nuIKIcoL0GXiVa3G36m2V7Rn6tQItnmPCqVe6aoC+HwsqsEgxYX2B/vzjUvZkVq/fn65iapv30UW+wxnPyfu50OoRxabnC9alW4cbK5v8Sb61RmyajyDRYyuY4kYP4H5dbputYZ/QAekGHA317YnlbYHsu5hsnkjHFGXxH4uyT1uDahGpWAghxQv+qskLeAQbVpnvvXr1qeY/sznmVcwwohv3PQeI9aXIlGHgDx8LfcKrofwwiyzY2/Ln22gemtuC0L9KvrCF5UqyW0TihcEZ4W1xUU3ShjJsqCdJUxyyc+XWUQuyR7Kyx7D28FGre97CIFMQNttdas/PqHKTBD4eAzVPXgqXaWcoGyepqsIIT0/0lhbmF9ukdPWO+3cFi5ibjF14HxvXsdqLByLucfIDLwA4VakEVd2p9sx91tvANNk5jVJ6+Dt3/++SRukGk4tcCRXDLjiIykv1NHdAx8J3xb8jLymXrCMthQV0AiOGxPU1Mbth7sxjFyYPSNwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(26005)(6512007)(4326008)(8676002)(7416002)(2616005)(5660300002)(36756003)(66476007)(186003)(8936002)(6862004)(41300700001)(316002)(66556008)(66946007)(38100700002)(86362001)(83380400001)(2906002)(478600001)(6666004)(6486002)(6636002)(6506007)(37006003)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPmWS+pS+HM/jCnjomAaPMwH3ZIdEScgl9fk3Gu5+4ckEkhwaS++doLbT0BP?=
 =?us-ascii?Q?/K8Qffcv+41Wb6Lk9Z+U+AEQxpBu69/CCaqkhMWR7sXgl5oeVmcACDiznhEV?=
 =?us-ascii?Q?eXW8bJON4P54fwjjrK4jn3tHnKJOhfA4uycq6iyBn6pfZgsJy9WYMW0I0m4b?=
 =?us-ascii?Q?Y2koCAyou5U1J1eYa66cN7DfzkJAZzK6fIm1/06ige27sw1PyfKDznmVBwDz?=
 =?us-ascii?Q?RIslgkSXwhXkiOqOZB72g0O+RnB4UF4/+J+M6F1QY/sF0OHkTBv3lM2Z0xnF?=
 =?us-ascii?Q?aFsD/2LRp8+tuW03Gj4CfBISag92qxlN6Fv/2W1bJfM/HvYPLfBZJYOQwUfY?=
 =?us-ascii?Q?qIGGPllb9DDfviR0lfmDqysTi39vUKEhvefDmLFHXw2ChFqBa3TGRzT/FzNP?=
 =?us-ascii?Q?sqslT8VWsIe6SHXse5BhenqbEpslbDHzMuOuG7FXLECpM0JVNFTNg2orHoPa?=
 =?us-ascii?Q?XxnZx7BOwnXelz7l/WeBe9PaI2gxX6c+chxM950ozrg0XBGhE45djJa0h7+O?=
 =?us-ascii?Q?hzl9V/xEhLbKsq4BdQvT0vyDZ24gVAWmg91UTYDn06qgMQSHAbWxMrXB6KQG?=
 =?us-ascii?Q?Wk97GUbGEV8qWwXdipX67+kkQLiEjnGeElLd0hloqaSGWJMZg+sH+v8iiTmG?=
 =?us-ascii?Q?irzFqRA6TowLb8hwkh4FBSm+3YxLOemCBYC3WXMpstB8JlpD3I91wfBVmfIo?=
 =?us-ascii?Q?r8enNQTW12lRChEbryrbWOYxlpKBf417xkYa102h00QEmdCrQlIBA+fYtVnX?=
 =?us-ascii?Q?I6qSnzDRRW+U4EuV2wsBtbn6JP5JbO4YuMvQGzreiRQ11xYZgExfO+b7EGWz?=
 =?us-ascii?Q?19WkcqftAesVqsMUNsyEx4d/uegjtpoPExIhDntafLnRCPtk8WPrHSYJiFsn?=
 =?us-ascii?Q?I2bqhzyfWP9Ds3Dht0Ntrmp349JHU8e4VJOU32JHt8XMl+OCZ6wBiKDpZbBd?=
 =?us-ascii?Q?k+4zeuZHaxZySxE7gJYzbbjLgGiPjdIIKMXnT8yx0rycM3+BazR5LUwuzZCQ?=
 =?us-ascii?Q?qO3aGrG8YBpRptaEO+K3bdlAiu2MfedyuCGxD19y2HTBrcftI4YiwSSr1ixJ?=
 =?us-ascii?Q?fs8OJ20mzPwsOVpMHEPhRSwXUwMsB5a+z0fQ8iH2KHxnOpJ/772nscvEEkn+?=
 =?us-ascii?Q?Ke19fgVoeg3Mi+awsEtbA4BDWgzetk9n0GQZyPbiXBnbadn/nHfdIxviI5LE?=
 =?us-ascii?Q?ov2+bDrLsKB3HqqwfC0XjG8BOT9aFzPd7Uv/7pOkPMgns1mVXH3iE0HPW5bq?=
 =?us-ascii?Q?1VcZ5VggZ/HbQSZK4UcPQp+ELiWSSqwHX3NeSwjMHYehtacfTJXXimsl++1x?=
 =?us-ascii?Q?3NFyGgwG/VoW1LCpCQ/mS6dLKnMRFlBpJqrk8GHt/o1mjwTuWKqKfYx0QeBz?=
 =?us-ascii?Q?MuUcf8JGpSdM1gob8Jk/9mB9zhHWgR7QC6ZOtzSlV0RXjTm1H7WWmDaAFjez?=
 =?us-ascii?Q?C+MSFyQxKToLvqG2LZhhaYLdTFunbgnpx59D9QKgTsXeo6IHCIq8nZ1IadGJ?=
 =?us-ascii?Q?s/FxCj9oS3zsnCk2yrlZxfKnahcBJvgihMxLXIUN4fx7xS0ExDu4eMKjgwUq?=
 =?us-ascii?Q?3bNgFSA6Z8VIZdtT9yE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5d51c3-7d55-4e6c-aabc-08dac8c0a011
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 17:24:48.9910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTiS7tTMW92g1qcNOwi4GlkSTTD2CxfDqOAn35AaMhp48S5pmir7/wSKYBk10XLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::60b;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Thu, Nov 17, 2022 at 07:07:10PM +0200, Avihai Horon wrote:
> > > +    }
> > > +
> > > +    if (mig_state->data_fd != -1) {
> > > +        if (migration->data_fd != -1) {
> > > +            /*
> > > +             * This can happen if the device is asynchronously reset and
> > > +             * terminates a data transfer.
> > > +             */
> > > +            error_report("%s: data_fd out of sync", vbasedev->name);
> > > +            close(mig_state->data_fd);
> > > +
> > > +            return -1;
> > Should we go to recover_state here?  Is migration->device_state
> > invalid?  -EBADF?
> 
> Yes, we should.
> Although VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl above succeeded, setting
> the device state didn't *really* succeed, as the data_fd went out of sync.
> So we should go to recover_state and return -EBADF.

The state did succeed and it is now "new_state". Getting an
unexpected data_fd means it did something like RUNNING->PRE_COPY_P2P
when the code was expecting PRE_COPY->PRE_COPY_P2P.

It is actually in PRE_COPY_P2P but the in-progress migration must be
stopped and the kernel would have made the migration->data_fd
permanently return some error when it went async to RUNNING.

The recovery is to resart the migration (of this device?) from the
start.

Jason

