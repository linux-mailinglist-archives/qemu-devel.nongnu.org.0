Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1050FF88
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:50:54 +0200 (CEST)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njLad-0003lO-Qn
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1njLWO-0000RI-CU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:46:29 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com
 ([40.107.243.63]:50359 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1njLWI-0000UI-F1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:46:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW+u9alxzbqZUi5LdGeZpnJk3+i2Q0xcNMGIyxvuTtvnjwty4xXrHSHhMZfdAkRU97VU+xDBJJVFberobVbs2iliM1OSYV8eKFJRyUCmAofJEMZN/2iRfWDbGzntUecTB/zYjo+hrWgYRsmPPGrXMmfQCvE5PsGkFC3iWEg3MO+9qiPDm/4ikr2sCbPI8sIJCTrnEHxFfilzwG/L4KdNVoFPA0bz3mAeRGf/meFcsIIHkS8Bmpzl7zb25w37NBJ8U1wYNzPFkL2KR5GZlojzZ03OVabvqdFGuCTIUspMLzcv2Vo+8HYvPHoYhCvFZSRolHJe2AJYoNNllyNwpjcbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0FjoFTE2qNrzsiUSmRkJnjCRyM12qLbeolMAN5wYl4=;
 b=PlMmP1+n4MNnnjWxIFyC6vSkm5+g94L8NJHKXCFc8LCLcdQcaouAZrD4wGxeHPoyahvAQLGfENJ6eoC2zA40lrOolczcEOcm8xUkNnIH7+LGRBwaVOIGeXp343D7qmv+ykINeji7E/E9IOvi/Ov0tJ5agTR431eI48gTOE0piOdCIcc8afI63WxVi685iDJbJoRih9B8PP8KRJGkxgF35EiBxVrWbI17BN9UN9n8wWNpS1saIxQD/gCwGVB9uD2+Iid5pcvhVxsBsPTIn1rLq6Agv80ZKFp+53OlSVdLNopJObYON6755mBGR6dyUbUnfVqMAdyLagfZwc1XXT6c9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0FjoFTE2qNrzsiUSmRkJnjCRyM12qLbeolMAN5wYl4=;
 b=VaoKYFr6/wyS5dEUoHEh5FNguTk8uwooRCPr57XDzGrhrySjBhY9OOPwVHGWgZ+RA6UDvHjldA/Rpk0pXtiwPHQdH3my3I+2DyCBuXIQriHUpqniGY1n3LrnmkLXPXJtXfuYGXMNP5I7+41JF02ONZE1JBeN9lpBtGpXbhm+zp+kLoZCuyuFzYWpjqEkStoEkQziNs6ITwaVpLj06Tol1sGxCCs9UPniZM0MjIAVjyAGng2i5zM5VEiu+cBHAdYf1j0Oc0tbh44V6f+mOU467/yOxyLxubFFKXDaeC+NcDsp1acfizXUgDf79pdAH6P3Cp8UQOx+780gYgBnVhjBWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3171.namprd12.prod.outlook.com (2603:10b6:408:99::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 13:41:15 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 13:41:15 +0000
Date: Tue, 26 Apr 2022 10:41:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "Sun, Yi Y" <yi.y.sun@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "Alex Williamson (alex.williamson@redhat.com)" <alex.williamson@redhat.com>
Subject: Re: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Message-ID: <20220426134114.GM2125828@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
 <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
 <BN9PR11MB5276AD0B0DAA59A44ED705618CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276AD0B0DAA59A44ED705618CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR01CA0036.prod.exchangelabs.com (2603:10b6:208:10c::49)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef60446-7e26-4f5b-bf66-08da278a6f44
X-MS-TrafficTypeDiagnostic: BN8PR12MB3171:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3171F22F6297F7AB2A2DFAFCC2FB9@BN8PR12MB3171.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xx39c1idnJeW/Ds0Mem0q0tBEjrSprAa0OebQ0ZiGzR/5YKiHXoZVkgFHMqo1jDrX3rTbW6MI0rcvrS+XAUGEwbzOHR6PpG0Ren4+36gzisHOqFT03GhVG0NZ2KvgoYWHTxTLxb3k83kQJBe0cLgTqqtMAJy4oJ6EDWtfDlITMaxEXFH+6hj+uKOT8HhA2cJZ1i94Yb61+bYXpAXYqMahovTCM4hQ5hyNsuof5gYCpbByufMV0LRgQR0dJ0LA85/PJW3kx+xKPW8jfCCQwNF3g9ejVR+zlTWop6yPsODu9Q4GlMyVWYneYFMB9JC9DWqvaxVX35NmcJQlAD2efSHUk+cddxLGX6H0lNWrLEcgbxvD+mxavR/NB+RiNEDCIbISSzCyaG3OGZhy3Jk6cz8LMSf+KvKe3/v4pFSD0esngCjWy+gOzTaLHkPvxXvBmICVgKaOLxk3Q6Gk4AXiUN9TyD/3qiq79w+UBw01qum2ouMeIkh7tVAnoP0R5P0zH1q6vMRByfiQRbsfMWnR3Skrfp4Sh9fCT0jIAlzSphZYAahAeRlN36yJf5vlb/RihZhYtOmIcnmBnp2ULpqGHUZmpJ6DrJaXR232YnyJU2xDyp9Ey+OClle+SGBe8vtvtayRIDh0on8VtuM8USmp61ITg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6486002)(7416002)(2616005)(316002)(6506007)(1076003)(26005)(8676002)(2906002)(508600001)(33656002)(54906003)(6916009)(6512007)(5660300002)(4326008)(66946007)(66476007)(86362001)(66556008)(38100700002)(8936002)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHsY2VndzFAqWo8vN3ewSrM/f2rZcmK2hePvgLx+rHwNEZODBUhTYtDAqkfB?=
 =?us-ascii?Q?2lgqp5XNPxxf82+E06QfK3/Bdc6RPOTTklEj1XNNHvcef8/gFmwxwtSBKDyO?=
 =?us-ascii?Q?1gAcDBl9btsJ6BhIcC+wIPJLG9fxMntoJBLerIUH3hEcv8dscD7fkJbbuFwE?=
 =?us-ascii?Q?Tt/wypJQNhMEfPqla3la+3sWIaka/RhVqLMoUoX8/I3/El/w7MhuER0m00Ii?=
 =?us-ascii?Q?oA067pa+DFkGKnCO2caiE5U3wRc4A23mGV0SqWEPh24VBSP2CIwF3dPEZZmm?=
 =?us-ascii?Q?YlasY0JVwnl4dTPkoFO0S0C3hF5sJH+Q621ar96eGXmm8A5+do0bCLk7gUbY?=
 =?us-ascii?Q?0VfrTsAn2LL3QGuJ0OI+mGybz12Nl87GmMKOoeOKChiGDesVBqb3z3zVvwOP?=
 =?us-ascii?Q?922f9r/NUYbY/k9mehkIa7+IRHzPdU1t6etaS3aKYSdSnztAZNdw/Il1oki5?=
 =?us-ascii?Q?aILA0IVWL3PdY+oK5s2HndSEngjz1Jr1ASOZHiP6UeIELu046Q4TZVgbWamB?=
 =?us-ascii?Q?4qfxuMM92jhe5NYexyK50ohI2ASpMccpQBDU6dRelVPnYxDBl8zy1qfKlg/l?=
 =?us-ascii?Q?BMW2+4sZH5vPrwnPR8mNi/8aPU1oJFV31Kl8psZDX4RtX+5Endc0DW6tPmn8?=
 =?us-ascii?Q?s31MZTomrnlJpxShOY8C3+8LkZxDoItNjw4pMcOOE66d15p9MXDBgEm9dkko?=
 =?us-ascii?Q?0QUe4HnI7kO65UtLMTJJZAGqdbaMtZVa3q9SaHGQnKVUq15P2kqHUfzTztop?=
 =?us-ascii?Q?jnhYgk8TzQiMA+ZBexD1iNy3AO2isuywD3ThN/dt5ikeH9JE1huDmTb8zA+U?=
 =?us-ascii?Q?efJoiq7krYuA/ebjEWDOI5rDUxCs901Ts5VzoTLefR7pejge8XdFbuBVNwyh?=
 =?us-ascii?Q?g1WYh4KZKQsB6GoDlFiIbnUuhVanURh4HllHADHLL0UH0fkMp/E6eDJLHqxi?=
 =?us-ascii?Q?hWQNTMJ7oMZNibrk8lI90Bg7xG3P7/UFWcUsSJXVVwf7dYuhyGUSIKNrK+WJ?=
 =?us-ascii?Q?mRfo65TVsiuSzbS0+G+RxFnQBhIbL3ZCkAK9vGnfX+hcjXsOHju9rHZL06GU?=
 =?us-ascii?Q?EIZfAOhlqqhe+lRczY0G+yMWgheStYDd69sAEfbv73mTQ/5zTXCZ0j7tLlbM?=
 =?us-ascii?Q?TMQ2c2jidCtRjsXM8yRGO/ajO8VR+p+wZ2hYlTzSadnk7YXJemX3E3G/Wp0F?=
 =?us-ascii?Q?WOPN76xcP6NKZ95dE+J0R2ZJhLU2HDaAs4gr0o0iyX13PQKFAjdNYS5Wv+R1?=
 =?us-ascii?Q?aurxtw/BGE3yymrtehCQGcE3NX5GMuf6iUmg4jPAzmsWfkdzoZd6OPWiu58U?=
 =?us-ascii?Q?r28UGuT1xjbcbfYbVQxkgnkitJ46CeKUG9zhgtJRLlePzUmhnK0CWQNpkoXt?=
 =?us-ascii?Q?/gddWg8iKkukEucNXAnZX2ss8ONEiDGzV+NSvwKNnf/8aNdKgGDwmpDBSA1x?=
 =?us-ascii?Q?3IyHNw0g4PYLMqvXrZprc7uFMiv6yrRzHSUCwuygmhWd5clFNHOgurK4i9Ov?=
 =?us-ascii?Q?HwVKvlXUVZplPD5uC3LwKuHl7gViVpw9nYlUsouiDoaWQ1JYqHxqEyrv113U?=
 =?us-ascii?Q?C2S55E0iIZ2P1LZCqwGyzeQjAVc83RRS1nPUXwiW2H8VbiO7xHXcCG/GOARS?=
 =?us-ascii?Q?e1LJJl2dYpzHxGz0cbQncBJnKfY5NxqWjtwb+gqtcLBb9zowdYAiZSSSS/Nd?=
 =?us-ascii?Q?85S2EW0GsS5Gh6n6DDb+53U28C5UvpIJ3/S+nmudo4Og/N89JEFklbkEnJWN?=
 =?us-ascii?Q?p88ltCMdSg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef60446-7e26-4f5b-bf66-08da278a6f44
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 13:41:15.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGnzueOEKp3ht1jzGQoXo7/xdpT59ECTU7hRHO1YfSL/LSbF8S4Ep8jHh0B6WA+k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3171
Received-SPF: softfail client-ip=40.107.243.63; envelope-from=jgg@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 26, 2022 at 10:41:01AM +0000, Tian, Kevin wrote:

> That's one case of incompatibility, but the IOMMU attach group callback
> can fail in a variety of ways.  One that we've seen that is not
> uncommon is that we might have an mdev container with various  mappings  
> to other devices.  None of those mappings are validated until the mdev
> driver tries to pin something, where it's generally unlikely that
> they'd pin those particular mappings.  Then QEMU hot-adds a regular
> IOMMU backed device, we allocate a domain for the device and replay the
> mappings from the container, but now they get validated and potentially
> fail.  The kernel returns a failure for the SET_IOMMU ioctl, QEMU
> creates a new container and fills it from the same AddressSpace, where
> now QEMU can determine which mappings can be safely skipped.  

I think it is strange that the allowed DMA a guest can do depends on
the order how devices are plugged into the guest, and varys from
device to device?

IMHO it would be nicer if qemu would be able to read the new reserved
regions and unmap the conflicts before hot plugging the new device. We
don't have a kernel API to do this, maybe we should have one?

> A: 
> QEMU sets up a MemoryListener for the device AddressSpace and attempts
> to map anything that triggers that listener, which includes not only VM
> RAM which is our primary mapping goal, but also miscellaneous devices,
> unaligned regions, and other device regions, ex. BARs.  Some of these
> we filter out in QEMU with broad generalizations that unaligned ranges
> aren't anything we can deal with, but other device regions covers
> anything that's mmap'd in QEMU, ie. it has an associated KVM memory
> slot.  IIRC, in the case I'm thinking of, the mapping that triggered
> the replay failure was the BAR for an mdev device.  No attempt was made
> to use gup or PFNMAP to resolve the mapping when only the mdev device
> was present and the mdev host driver didn't attempt to pin pages within
> its own BAR, but neither of these methods worked for the replay (I
> don't recall further specifics). 

This feels sort of like a bug in iommufd, or perhaps qemu..

With iommufd only normal GUP'able memory should be passed to
map. Special memory will have to go through some other API. This is
different from vfio containers.

We could possibly check the VMAs in iommufd during map to enforce
normal memory.. However I'm also a bit surprised that qemu can't ID
the underlying memory source and avoid this?

eg currently I see the log messages that it is passing P2P BAR memory
into iommufd map, this should be prevented inside qemu because it is
not reliable right now if iommufd will correctly reject it.

IMHO multi-container should be avoided because it does force creating
multiple iommu_domains which does have a memory/performance cost.

Though, it is not so important that it is urgent (and copy makes it
work better anyhow), qemu can stay as it is.

Jason

