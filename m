Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822D68993F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvcB-0001Fc-SS; Fri, 03 Feb 2023 07:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNvc7-0001FK-6X
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:56:24 -0500
Received: from mail-dm3nam02on2060.outbound.protection.outlook.com
 ([40.107.95.60] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNvc5-0000cW-7h
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:56:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvVllHT/+UAHkAD95NTkadmOKHuKgKBat5gBV7FefkG375gf4h4UoxCEXhtRgGWiQbBxQSUZReFKx3RUy2OGjNhNKzkjL2GwlTrcOQFo5ucy/gUUpmfPBk5Dfl6bCc5tyPS57MHcN0ir67aprbVoIL5eGi4v9Eq8iTVdaJBMZarRLVVH9P+B/YajEe0wToyUkzWGI8/LSvYM4HQPv6miqdtSsn2m4C3t759KLXe/nN+zUuejqMufyoxDkbOI87bgFpnxsixKY1I1kXg/JhpJaGWkcDZTLXTamXjcBEM3vK5vBrG8XqwdkxVni6bRpU1mIaqeaDeo4goWSb1ybQ0/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMrxZ6w1X2L/L5jh1v8pXYO1hP90AAAjCdEBTpmF/5Q=;
 b=mh8onuIMgWtlqNORUIXXdb3E6MU9VGkphfCmmArXrZAheuGIDipjT7JTHnhWFxrNWLjlbM0wbBI41RY1ak29qgN2jIhZDYtCbT8YVuZ0pTGn329uOmhg9TDOmjSurkYtGvxLwH9jqyghm7p3QarFE3tYDn/UOHjlPolz+2WaCor1rF6FcbYz9/BppJ/clIFRGzMNfZb2PPhx7Db1dMSnDDfW6spcxIwbjqSkZ1khjxR4AKeWWDdZnOCMrdz7hQMhxQqhQy8LvMr9ZG3V77TRAU0uG0Ak40fYhNRUr7emJpEkNwEGk3Ecej1+g1RN03fW7vBD6FNpSNdm7DSYb5x11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMrxZ6w1X2L/L5jh1v8pXYO1hP90AAAjCdEBTpmF/5Q=;
 b=Gm7SCFSn0knurqWDh5eWEDG1YxbYZFj+wUaFDGbdtvzKasAtmeYAMlay7tMwlJxb6QxMuq6UDC6JlWLI/uZvHyxJnzJcmd/MIp5C1c4QPqxlhPnkWx8YvEq2LNg5YEVEgmVKRbup5dNInL8D/B/2C6sC+gB1w5Tm32dKvxXwA5Us3HMeKDIVNbyq+EDQJGocohoS/5e7yNht2uFcHxpqFMLfzq2GLnRvrJHOrkDHLS56Hi3tnUZ/hPmqiJ2XcSK0WVcsaDiqrN/qtFrBIo33Ey9n0YGgwJJruSrc4MbvweOQTbKFmqnpxSv3pG5/v1fjDeZAubfkL7AeNr8StiIgKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7284.namprd12.prod.outlook.com (2603:10b6:510:20b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Fri, 3 Feb
 2023 12:51:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 12:51:05 +0000
Date: Fri, 3 Feb 2023 08:51:04 -0400
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
Subject: Re: [RFC v3 18/18] vfio/as: Allow the selection of a given iommu
 backend
Message-ID: <Y90DOL2pnYxHHNzL@nvidia.com>
References: <20230131205305.2726330-1-eric.auger@redhat.com>
 <20230131205305.2726330-19-eric.auger@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131205305.2726330-19-eric.auger@redhat.com>
X-ClientProxiedBy: MN2PR15CA0055.namprd15.prod.outlook.com
 (2603:10b6:208:237::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: bf64cf26-f08a-4682-d396-08db05e55021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4DBWuFhH7kQQe4ymQdmYoK86xmOFrEZjwbN1iO9+2NooqflobG6vZ1aU3H3PgtU0AnmNxI7TGQ+o/l1b7q+08s3W8+nnop8kg1iWfVaousKQFyUuXT07pgEqayiSLAbBEQM7hkWl70PID33hvStliGQi1vB6OZJPzRAQFsHG4VpLu6ZOavXJz5mUx767clAd4mHiTEZ1ZEOAh6eH5/rxVhxbp126N/ACLpC5uMFZCVRn2ZtBbrlNMzXVPyv95knQSLyO5uKEilESFqAFIRUV7jp77d3lgHSn0Zkb9cZcjIOHJrgIjg1e+xU0RluLm/KAtP4f+rHjeyif/0tfv2H72LYkhnZ4a6KCaEkkF4PCj1fSF8j18Edw5wI+DtqwI9yz4vjPu/jUt2CxFFQLjvK81UhD9FCGSN/cZpBypHuPASd0g2/a5sGK3xO34tWaZ+SMWm3SmyzGwlp4AnOd2oGRwwOJ4u0q3TEJ5NYOVz70H+xdpnzRewQ3Vnj+CcLx52uO5Z+RtnNq+Pn73KBfpWa6bDnwN8WF57/ZfnJrPz/XazSXrknMzK8XnGOgoA2aZ/60EiN6DAeqb8plgV7iHceZmt9YP3NoXlGfnQwDgsPXvwWmCSdRfQN11fy1aeksZzPZwVYVX36u5LiqcRpWT1a/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199018)(4326008)(66946007)(6916009)(66556008)(8676002)(4744005)(26005)(8936002)(41300700001)(6506007)(6512007)(5660300002)(7416002)(186003)(66476007)(2906002)(316002)(38100700002)(2616005)(6486002)(86362001)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7nmh0qzriQnpvcvA5ybO4EeAmqYn0Xg2WQLwS/rQSo/cO9HhX9uU7hHYcqeI?=
 =?us-ascii?Q?rLqaZv4mLuSHIrA/iZeZnB/vXogE4bgg2FAZvfJmcDvzdvnkvzkH77rwhBRY?=
 =?us-ascii?Q?UsYP6zf4GLxsTTeuviOJOcukpOkn679nwP6fuVOWdXYc/pdI5KPQxF5HyCsP?=
 =?us-ascii?Q?mx3OOMsnJGvOT3Fxz37oMh8Qu4eovjbxMLjvHR2mUW6PMW0Fi7acZCMMsUh8?=
 =?us-ascii?Q?BtAAm9LS8nd4wO5otsbzIQZx/jsfwsdNZU9vwfTjWbTH+TYpf7pFbkWZ7hB7?=
 =?us-ascii?Q?IGTtQtxLVYK6zNG9FHOTQPurZACty2UHJnnXYiRVAZabVHpweVN2A4FvdoNv?=
 =?us-ascii?Q?H0jStmyZpgqG3oT51vb+8MRE09YcQ48086KuAv+6qZMe4jDrpxnmV9eVnpFR?=
 =?us-ascii?Q?ORcNmrv5Fop7YpYMxNsYlJVGKhwUYBG0xkKTdg5ZJdgXPezOzi/PFteITXNA?=
 =?us-ascii?Q?Dj1wuFWLltZeeWs3YL+Z7SY74CxIsZxKKKPEk9/5npxBI1Tpa8bf0ak/Y1qP?=
 =?us-ascii?Q?msAElHK59tF7o0CsO1E5+VGbYFTG0mECuxQM05j0DwvccIs09b10+y6oZkNY?=
 =?us-ascii?Q?z0agnEFUxHExNBuFC764rLaoRtkI9lFOgWqEO5Y639kzw8TtpB70tR5y+m2s?=
 =?us-ascii?Q?FLNumSHMiPngDgZAdV+DxFByBwFG/n0QGeS82ZLsZ41+SYg5GiYi3q9WK7B1?=
 =?us-ascii?Q?M4U2IoHgGMxeaEV8mxTUP//Zxj2BBSljOXNgpgcRB+zqTACYhET7Bcte3K0G?=
 =?us-ascii?Q?we2VCPREr5Gq5IDaFksNzjJtcfjwXlox3YOjDGDknF99THgFr92pjtKCBBge?=
 =?us-ascii?Q?UkShxvALaYhHyRSmkm6m3aURyrgS3d3F9wH53ed/3nycNE/MrV4EDvQF/bIT?=
 =?us-ascii?Q?MIwZimtIoCZw/JWeGMlqJcNgkgp+qCwaRyCxdPeGxg0wztFHb12KLZ2NUckZ?=
 =?us-ascii?Q?YeM5n0gKlDMad+v8vPCjiAmD/eOufX/mBMFQxoKNwmgDt3+rpCcU3RCRB8bj?=
 =?us-ascii?Q?RRppnqufnkV5aqmmOtsCqhy9jW2SGFbpr53NMGOXjJZ/0o1eRpm08hQRR3K4?=
 =?us-ascii?Q?UzvEmjCrguKlx4hr80OguiHHGvDFcTxPTxwiw1sNTXQJBCNJZYYgCbX8liKT?=
 =?us-ascii?Q?DRL5QnT3Cj3GmKrFUbM8C+2OTt+FuRbFxHk5ylOlt/OPwsPisy8f+VzuGkNE?=
 =?us-ascii?Q?cs9Fg2n3j4Sw98i4oMfgBQhEAdR3kQC9r1A/Z073WFsKNpHFZQUN+8hdvHsy?=
 =?us-ascii?Q?ZmGPHQcJQFBBaphq+kLu9m49GOqRzWVyXqiUf2gufR+TJN4nwRpjFZY9e48D?=
 =?us-ascii?Q?jq+RborJ1BeyTGmWjCTg2L2XHKPar6Phy4Wue+zjAh9f/2otq0fcB7lZQUww?=
 =?us-ascii?Q?hg2luAbPF8QlpO0s72xiIOr+MCKPt5rot52BbedRgEDgG0qXsTwS+ahlY4CR?=
 =?us-ascii?Q?swLFT771r7Pzmdxdyvs0KnQBaueMCxdUk27iNQtBVFg1OyisDr8E2B5HQR4f?=
 =?us-ascii?Q?0luUcshaiud9LPnlYcFivEwyBRAP8XGm05qEeM4dNcd25s3D7DtLi/gPl4GL?=
 =?us-ascii?Q?nRbQH1ph1BpbaXGF6i6ukqyVZpAJA5wPdo28iA0Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf64cf26-f08a-4682-d396-08db05e55021
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 12:51:05.5288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lx7g/QBGC6bqXlyhykVbFlb6ZIyWwnlm0XiMF//3hSLi/qtztrFlc2BEWtyPmcJF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7284
Received-SPF: softfail client-ip=40.107.95.60; envelope-from=jgg@nvidia.com;
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

On Tue, Jan 31, 2023 at 09:53:05PM +0100, Eric Auger wrote:
> Now we support two types of iommu backends, let's add the capability
> to select one of them. This depends on whether an iommufd object has
> been linked with the vfio-pci device:
> 
> if the user wants to use the legacy backend, it shall not
> link the vfio-pci device with any iommufd object:
> 
> -device vfio-pci,host=0000:02:00.0
> 
> This is called the legacy mode/backend.
> 
> If the user wants to use the iommufd backend (/dev/iommu) it
> shall pass an iommufd object id in the vfio-pci device options:
> 
>  -object iommufd,id=iommufd0
>  -device vfio-pci,host=0000:02:00.0,iommufd=iommufd0
> 
> Note the /dev/iommu device may have been pre-opened by a
> management tool such as libvirt. This mode is no more considered
> for the legacy backend. So let's remove the "TODO" comment.

The vfio cdev should also be pre-openable like iommufd?

Jason

