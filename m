Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5876A480C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhLP-0000o8-BC; Mon, 27 Feb 2023 12:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pWhLD-0000j4-CB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:31:13 -0500
Received: from mail-dm3nam02on2088.outbound.protection.outlook.com
 ([40.107.95.88] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pWhLB-0008Jl-4l
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:31:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVn/+A6U2SlZCgo/5DAYbGWXCckJD67izfkJ5AK/sYpd57PmlM9PRlILf2mCk4KZRYSTD2O1CwZe/iWTRjFkou17e4rIiMqxyCQuWuxbaDSAWPFIMRDp9UckIEp9vjVOsypvGsx2hljj/jaueVDERqiONnK1CR9xe1fkOCuxSus+zvR1lMjgFK2gDfCgABxENGglvOj3tfcGI3gB+1kQ5rArWXWUMHDc9m03Hh862cOglZh21ggqs2DAku+kkBwFwSmv1fTUkV4rYaqvixBEfns4pube3Kaj3QqsznNxEtLXREL4/3zQ8mIIAEffdwsBM3pOa4UyC6DwBaoHO36h5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UP6soj4/be4hFjHvxWaT5jnmX5pYR6G1Srnm5PT4Ps=;
 b=V+UbZTZQlUqdNULbIBKmy1VqZEoYtXU4Ophlp46p4haOa+UqsREWJB9UzFqo5+JPf/kBVxD3HnAhRjhKFRW150VhZo4GYoMIv6d51KQTe1TxUc7rIQL/rtvNfjGHVC2cpMfKTUeRxzBJM+hn/OApGT9F0i7ycDyvukE85TOxRq4xBkFcfa9D5isurM1keBX6kqGn9dIHmxh2f2zEaFK5Q49HGEh2vP3YwDi/AkNOP7MNHR6+W8I/Pq4KYxuIAjZi1INUfEpgJDivIyYqyarSdNJkHw6LIy8MEv2pYkAleLP/AW+LSXU3tvdlyDuTam0qH2QMYIDurZa9lO+midrUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UP6soj4/be4hFjHvxWaT5jnmX5pYR6G1Srnm5PT4Ps=;
 b=AK6dLD9CpbngN8qTTllsIBDBy4Y9EC9olRQGbK59WNLQrNPj63gBut0TTmVrHOjLdRNteMDtnD9UfLKM3RnaJqpRFRUuIxJibb4W+m88vVIK43izQgxh9dJDPDXhlVYMfwyCqgCDo4yKtDBtS37h/q2/3LEXXjrchMluW9ROmYmLTWYAZ18YYr90I1X+JyeTTj7SibynV16VXM2ZJJHeez7f+ao3xLr5C+QxEVWg1Mayz7k9emgyxYGINoaoJuma+E3D/GyIxVo8s2dS6SDq8znI7B/VXzGG3QhQYSGYdn4HR3nJ6Gu3bqNy9PkxWnlPzG2o7rJ2wXrLY/aovtyxbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:26:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 17:26:01 +0000
Date: Mon, 27 Feb 2023 13:26:00 -0400
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
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <Y/znqJvtxtUEmsHi@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227091444.6a6e93cd.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: bec815fa-8086-47e3-2cd1-08db18e7b285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gTxvIn+et//xez3cTg4CA3L9T1nDuKsVojH4yHky13JqjjRdaNJM13e4nxlyN9FjGzxT/Q9TlS0F4F6MTyUqpba+yV0ZLiDqRZg7KI3yMLezl1FvZ5N69xOc038rbRy7sw7b00whK0AHU27jMuwn6jKDcd+H2E6myUHevkKUgh+IWfyVPQCziZI0OU7ISOBnJSkirgtliP7RUtHeTo5esmlywSrIruNB5XCgvpDL9bFcOA3xGPa5u40JO7FftZKnmxq3SgLi9pQgcj7T9QTsNLYf0uV662mA5Nyi/a1D/0nROJeQU+7UaK7ZiUrN5PFPbLoHay55qrgE2FxXMTjEBOVIxmkRM5VJy8UjlJOa4QssWHTZIwz7JzQn7N3qiFaVAMb/tLAyr8tyLu4O0yCf0WMrwttbI3MIlFYRf3rqXRNIl3/+DCVDkpS/+9AtxQFikYwjfSwPo0l++vSr2gpz5WKlIN58gzHbs6EEqnSUN+YIZBPgZu57cuMrImXNcbYddas/tj0phbPt5uk/wHqkYOje23m4x1Re2PuDFy7wWTvNgs/mBfep79w3bbiWPz+WLyWlQjfJAlzGp+47AE3Qrszm3BMnbfhgPCifVVHIsNLuuaNy/ulqrVjlC2DMMPNXmy0tA2bzyWxjdtqN7+84Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199018)(7416002)(5660300002)(36756003)(478600001)(2616005)(6486002)(6512007)(6506007)(186003)(26005)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(86362001)(41300700001)(54906003)(38100700002)(316002)(8936002)(66899018)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qCUopFYJK8f3+1co1Ltr83Iq/gHdFnCTbNAAZaogxcCBrQlAmtqdHQqzizlm?=
 =?us-ascii?Q?QiMXbxniYQ2r29RzhxPQ8bj2N45XH/s4+wXFG83LssiI7EMot1ZZkUJRsEHl?=
 =?us-ascii?Q?BaLyV6F4esAow4/T74WhgjEmnOouU/T7zfq20v7Y0jNHiYS2SUR2NWuLSdim?=
 =?us-ascii?Q?OzalkyKudUGhsgYWJBIk2g+GeyiStpkPwGosAG9af0QpRq+3Uxd4yva+psEb?=
 =?us-ascii?Q?tKbooaGtO0E2xtYkMu9L0jIaQVX8BN8IFo22Ow+jKWbLLbp6chVX8iOz7EEN?=
 =?us-ascii?Q?2kcebAjzdzC4OvcbKGiK34UboopVTIUxAvbOcM/ekjGt/WYVwu0CP7ZRDmhb?=
 =?us-ascii?Q?LNOX2J+VncdjNBI9KBeLpuUZZjhrq/J6ohk/w5kzrC7Uh1RQO13QTQ+WKXj8?=
 =?us-ascii?Q?G5nW+jS5MxNFOW8syVJ2ve6wNpAIloSgjBMW+41DW1CbSMXn7SH/liU9Z/iD?=
 =?us-ascii?Q?sSycQIa0ORNROFgO4Q+EqZzcJGpkMO2BpqBm3h7qxHaH9abvxdtmbV6WmcfK?=
 =?us-ascii?Q?d5ChAAj/Wx8Tm+cB4GFuzFyNHKYEPI8JuEa3bHO9940oMcY5thSH3MSsQ2SL?=
 =?us-ascii?Q?zAfIJAUDsznjs3JK8YdSeaU0x8h00K4lX+fgN+X1kr9VF0vcd0dULVNHamqZ?=
 =?us-ascii?Q?jdbL6rKu514x2429LRDhmjgZpxm/yKVSV0guJqOG1RCvKrj2qUDw1vjaCl8Z?=
 =?us-ascii?Q?lk6IDmPC5+Ptghdv8iS34QBGSVhWs8IDQJ888M6F0+OI774aIN8BN8EdWGgR?=
 =?us-ascii?Q?ZxpFEiw6jqFjWxj7sjJFjKlf8BH+zF4vEhl5US5zkVaZjTjeYG6gYNqcgVoG?=
 =?us-ascii?Q?XNJnP4bHs+JTO3we1AgrrfkRXHwXmqLGIl9QROOAQDKm2w8Or8QV8Hp32nH0?=
 =?us-ascii?Q?LHS7lElCF/A/gItGdNWQugNVXQAjCelIbwHfrqah6BEgY45VZU4rNxT0ejK2?=
 =?us-ascii?Q?ZSQV7+hav8arDwYsW8DlDdfKs7MuvzPDYvLKrtJohjRD1ofP6uK07gby3MZB?=
 =?us-ascii?Q?ONEE0T2BQ8YfVdfB+APDCPG3+VV4l2CavPjr5kBKZjPZnd9L0Wr6uiYx9Cio?=
 =?us-ascii?Q?xjG7GBpJ9zr/BkpQrrwwvAgT5AU0UW4NrFu8MAH9e40u5iUPf2LA56GC/Z6x?=
 =?us-ascii?Q?7qfnzaqib++a+JxActT30zw7x0+iCXeYCbh8RFXuq8golVMtRCxu+QqvLgph?=
 =?us-ascii?Q?9a6T1reHaRyzdAS7X3PswECI2Uo8BNzZceHu9o6Ja9kB3DABNZ1+vBLNRq62?=
 =?us-ascii?Q?PWOg+RbHV6s7ZDtY5LcoaxwwH5fA/aFy6+GJCOUDVI/LNZEZW6kIuA7Pihbz?=
 =?us-ascii?Q?WCgjP/N1pvG+/5Og7U90gGwZgKoAV3O7rbisrfChtpPDXTBUYs4FeTwCtqY4?=
 =?us-ascii?Q?tZQN0grBr0x+Pdj6qRx8GuSxMRGDa1WqS0EN1BZMxkVT/tpzL/jAtaBNB7Yw?=
 =?us-ascii?Q?zn+f0u/BnuUV/bQjMH2DgCG/kMdOok4vlQ3ppvkJeeUtACHlcCe4HMDyzbM3?=
 =?us-ascii?Q?GRZRGpNM8yZqMAXnPFZDtOeJYBo/KAB6ZJeKlpVW8+yjJYGAZ5RrCCXVbj7C?=
 =?us-ascii?Q?TJ3Mk0Op9Dd11cZFdmNteqqaRDXkPrrmar32ElsN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec815fa-8086-47e3-2cd1-08db18e7b285
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 17:26:01.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/6VqyoRlK/j4fbtU1XxPQdnvNUsR1tg2Pdeahg3GijSuNwSmq3EE6YKv76Xr2al
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
Received-SPF: softfail client-ip=40.107.95.88; envelope-from=jgg@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

On Mon, Feb 27, 2023 at 09:14:44AM -0700, Alex Williamson wrote:

> But we have no requirement to send all init_bytes before stop-copy.
> This is a hack to achieve a theoretical benefit that a driver might be
> able to improve the latency on the target by completing another
> iteration.

I think this is another half-step at this point..

The goal is to not stop the VM until the target VFIO driver has
completed loading initial_bytes.

This signals that the time consuming pre-setup is completed in the
device and we don't have to use downtime to do that work.

We've measured this in our devices and the time-shift can be
significant, like seconds levels of time removed from the downtime
period.

Stopping the VM before this pre-setup is done is simply extending the
stopped VM downtime.

Really what we want is to have the far side acknowledge that
initial_bytes has completed loading.

To remind, what mlx5 is doing here with precopy is time-shifting work,
not data. We want to put expensive work (ie time) into the period when
the VM is still running and have less downtime.

This challenges the assumption built into qmeu that all data has equal
time and it can estimate downtime time simply by scaling the estimated
data. We have a data-size independent time component to deal with as
well.

Jason

