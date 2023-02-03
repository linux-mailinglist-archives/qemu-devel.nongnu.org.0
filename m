Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A353C689941
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvdS-0002DW-AH; Fri, 03 Feb 2023 07:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNvdP-0002Cn-NJ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:57:43 -0500
Received: from mail-mw2nam12on20618.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::618]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNvdN-0000qA-Or
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:57:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqsgfmJMTs9fRt/KOLKDNwDZXRQbjTCLwhJGlRxjqY3n+EVutAF0eG76m0oxFnE9YFTCPqyDLXHUeC2fTqaZL6bK5Pzce0oPFYa+RxL9mCu5gS6fuBZ1LGaTtcxX3X+N42sSrm6kCi7xxW719HeAlzj9Jv2OX+s5LyGKdU+H+KInddpyBopqu6i5w29G8/IhYZcH3yUnK1eTGDZ9MZ8bjZMglQ9VnYBuhe6LbsCHxtQwShJ5+A51EVYQosq1dI3oMhRuTJuIZIkE5Q2YH3NXWF/MqPyYvakfYrsjNIx4hCtd+2lzUE1Pg2x5If9q8rMrFYTgP1PYnd/MPV3Qgay/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSMmaPYocRVV0WubfPbTT5SBoSSLazHcJRT/qRPJ7U0=;
 b=Ku1uY+gR17OwEeG2ammAOlqTAz+zrsxmSoPCLslX4cu48TKKA/pCxeqm4fG8wIB0Maz1glUvGzPKfVt0NCWfKEiwXoEg/+QmkY066eXzYLtvQ/XDic1JNWYx7tC1/bYkYB5XUGPvRDXEVlhoIkyegAWubp2hp+OCBRtPx7NMuGYEAQzSkwtAlIveVXqhFVNQEMn9LSxlETl3SncqVR8GpZ4Letp7NE+CVR5y5J9AjU2FL8JKkHEzHlfTvMfLU6BEQ9++7y4C8MuHBeS4Rx0u1nAhmKfmziSpxcLWp5DJgte+Nbm+kGwpXUiHOrcj09XTpSmY5cqAZ+HUDNoBM5Y0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSMmaPYocRVV0WubfPbTT5SBoSSLazHcJRT/qRPJ7U0=;
 b=nmDwamqMWGk2EFRaR6Cr4aEbm8GesDlBd90R51X231qhipG9WBHoJg0G7ttTcJwNhXntxvuF1FbGXK9A+WcK40AkvCMVv5G2wGPYXc+ALnEK8xDz5ysAXtt9ninZEvkXlWH+IB1ipmvgGnelWFt0LhCGBT/IGnL+pxWxEG40Cn/ebG4sWgrVX9BkqIq4Cguvs61xOn1HwTn0Ra0PrZgm4fa7dYKeko7z7A38VH1fLuaP+XcDLuXESFDVGxcmSiOsPuqAqHBnqvX3erx83Q6nAQTzNfAXP5PGVqGFSJWwrDe6Y+zvwxH215aQ+q++aLJg3VwsZf0NgSa3EAaD/ov+4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 12:57:34 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 12:57:34 +0000
Date: Fri, 3 Feb 2023 08:57:33 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, yi.l.liu@intel.com, yi.y.sun@intel.com,
 alex.williamson@redhat.com, clg@redhat.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, thuth@redhat.com, farman@linux.ibm.com,
 mjrosato@linux.ibm.com, akrowiak@linux.ibm.com, pasic@linux.ibm.com,
 jjherne@linux.ibm.com, jasowang@redhat.com, kvm@vger.kernel.org,
 nicolinc@nvidia.com, kevin.tian@intel.com, chao.p.peng@intel.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, berrange@redhat.com, apopple@nvidia.com,
 suravee.suthikulpanit@amd.com
Subject: Re: [RFC v3 00/18] vfio: Adopt iommufd
Message-ID: <Y90EvdM0CZlr51ug@nvidia.com>
References: <20230131205305.2726330-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131205305.2726330-1-eric.auger@redhat.com>
X-ClientProxiedBy: BL1PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c53ada-354a-4a79-3ac4-08db05e63819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed8wIffAWxseYwhYBS/rbpjZUp3pge7GpH2RkytMG1pRxgdCR7MbPjidYZbUbE1u2T2hglpyB1Ulo0SWO7ltiEfPiXhNUvbV82vktEg6Pq2qUQbUXpg4dwikzgvAY+Kf2mETKWWnNr82r58ttqdF1Ws8PrzHN/azw0vsqS9voirMAbrswqM1eEbGxmjrN+xQ1uwCQ1Z98FzQ1hxgqZIaIO2HVP/F65QXAVcQt4c/2WoA/750wJNowpobdZoLkdDJGvINOyr9H9S3N8dIxuCp9/MO/f3OqPz4FDo/pvfV+ZyLMZ25xH4++pPANpLU4MHkU742cSQFqs8nF+eODPVsWMSStwcfcyVpj6ZsUBu/GJzAPIol7Qs6CB6OUZgqNWA7MwxP0XGgyWS9Gt0BDSEQYp8unc4qSsnejAlXHfP9Yg0i+NZH9vzp32c9AidgsPtSde9+7Co7Bb4NYa1KYO9wsIFmhxz97i7Qz0yGsl7xi5l0xPzOe9piF0U8ioJATOAJ88qFhR/pnqij/T3iiZAx7MhCiuaFnycquTt7oCVGf0431/+x2gOfCOAtZtpsCuEQZ4vKUZgFEz0ENlc3+x3LPv+sHWBxdVtUfeewbPOjzzRDCXXFrRJ9aKX5/IYaLh9U/3duJiKxvFQMvQqn/g4QKe/xCAU4KlKnx0TJFCUgMyT9oWNEF7oYo6T7kgr3d5mfrMwfUBReB16ftvZY7SmVMfMUM1KdftsiAzS8l1rbbF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(36756003)(26005)(186003)(6512007)(8936002)(4744005)(5660300002)(7416002)(6506007)(83380400001)(86362001)(2906002)(2616005)(316002)(38100700002)(41300700001)(8676002)(66476007)(6486002)(4326008)(6916009)(66556008)(966005)(478600001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dbwxoF9QsEEBPW2OI9YIcG5IzarZcp49pTw1CPZdAdLGzJFnjKGhz6PjpyIy?=
 =?us-ascii?Q?TJp+t8JLMrbb5TstYZ+V8ucpmJHSAQDa5VsW0GDi3nr/OjXGYTZNaEs4Yzov?=
 =?us-ascii?Q?aLqVwsUfSQLVgTUn67Phafd93FD/SDq8iNZSnTRLLhVQp1T3oJvSMMPZGL3u?=
 =?us-ascii?Q?L9i6vyfXBCj4NlbT50dAshwuX338ZRxO2K7hyfDFe0I1T++0INmWq9lDisCn?=
 =?us-ascii?Q?4hlr7VeirfUYQwwLNJPkThr1YYo1VwMun2AkhpUfKGrGD4yubKFI4ru7xEH3?=
 =?us-ascii?Q?KPdfnjEpoeGuBZjxA7WQGfDtmjzQISLDI2kk2/Cpk6inu5cUS3Ju8WErTibZ?=
 =?us-ascii?Q?yBkIl/5gGowARI4C9w0WX/SNdnCv8E8GEoWM+wOo0/D7Ovl1YkzNKV/tTGId?=
 =?us-ascii?Q?LzUlGnzNE7k669yg22NvYoGTdmL3yllQ2Rh8o7mZ2yt3Or5Z4hpWuLkPkIo4?=
 =?us-ascii?Q?VYOH3UPK/Pv2+Jxn09+I1da+oSWpYrj2rVGhjAc7oZ4OePZVHwZkAzmE/xC7?=
 =?us-ascii?Q?TFjUHoijvy/jUhWb/vPAAMSLFz45SvrSXqmO501QPLgoigpFOBtU4zTKjaqE?=
 =?us-ascii?Q?DUUlXwazCvCllX8hROwyI9TK0kgZqKjQ6XMoFbF4ruKpMV5tO+TtTssVBLJ6?=
 =?us-ascii?Q?7sGN5WIRRhECTYQvHtlZ5YLNyrifvoAgTQzjlpAF1jlUZbGRwA+ImmqHLbH2?=
 =?us-ascii?Q?JHD1xbyho2ef5kV1yQyj8cqp1WUp5KSukECzxLLt3OEOCSNMfomaP4D/4TRv?=
 =?us-ascii?Q?ms669vee9j5MU4C9uuzpigKZYy1pSxsbomj4jgBrNR/B5jHhZk9yxsepFK/v?=
 =?us-ascii?Q?IggJpK/ejYYzbWYEGc4CeS84S1RU9ypri/IOQzrAvcTTQ9o/RykAo+iO7eZC?=
 =?us-ascii?Q?OP9bqW+B1u673U7oq2ZYpKXE2Fm81zt/rf8aQ8+bIjHZ8lBfcNzQRCX4Joyq?=
 =?us-ascii?Q?8wWB6MzkIrj4gMSbVak7If8daVwuL6Hcqg/LjcCcyREhkyAUin8DXIBXYOLE?=
 =?us-ascii?Q?boIY1kWVyYTePxJ9bw34gItSvg8ZxfFSfqdv+6DF1TWcPpjtEe9C4W3oY98L?=
 =?us-ascii?Q?fV/U48e/IV0miJi+63oNsNcavm0iXCPK8bcoFHENzrbJ8UoCiCCudn+iwLEb?=
 =?us-ascii?Q?PukBNZOx9XudcQ82HPXIjAQ8m51ZnGRRMmPROcRFtrskOv19iIKjMgZCOTkY?=
 =?us-ascii?Q?ho+TW1GtjELhKlJ/+o5898MaOYP4mddLGr0jnfWYAY8bq/+hfSCqoaO6kLnx?=
 =?us-ascii?Q?QpCAjyukljB19GxrUQzuXEg48a4sVi1KOBv0rawrSEeALgBWKGO7O7vu5tcF?=
 =?us-ascii?Q?JAfTIuIt5Eee0ekhifxpSPpkFEgeKX+5J7XBRZ+iZvJo78jvcZC+QL1rrkzt?=
 =?us-ascii?Q?YxuWRtgyZCdCusrgH35xUJUb6b2pVBIwpNan9nLPmAnFWgLnjeMDShJSIXm6?=
 =?us-ascii?Q?DftaK94GYIRwjvSDLtElhhtn5joYLT6VQV+wfC70lCRZ6Sq+Z9LK98xSDyHP?=
 =?us-ascii?Q?Igf6LAkwdUs9wfNtNkMqS2kdLOvsuHlCgdZvsb8lfQ6pzGrbe1tpWDbzpN9R?=
 =?us-ascii?Q?MN3zWDBBaOZweyeJtqDWrxT1CZBR6LF8DH7eOgKS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c53ada-354a-4a79-3ac4-08db05e63819
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 12:57:34.7194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEhY8N+lrVDN3CmmB6Kxazxq0PwC7TS+kpf8h8WWYOfHcngqBrPuq9WT0IL07bzX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::618;
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

On Tue, Jan 31, 2023 at 09:52:47PM +0100, Eric Auger wrote:
> Given some iommufd kernel limitations, the iommufd backend is
> not yuet fully on par with the legacy backend w.r.t. features like:
> - p2p mappings (you will see related error traces)
> - coherency tracking

You said this was a qemu side limitation?

> - live migration

The vfio kernel interfaces are deprecated,  Avihai's series here adds
live migration support:

https://lore.kernel.org/qemu-devel/20230126184948.10478-1-avihaih@nvidia.com/

And there will be another series for iommufd system iommu based live
migration

> - vfio pci device hot reset

What is needed here?

Jason

