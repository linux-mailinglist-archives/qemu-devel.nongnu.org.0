Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865C52160D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 14:54:55 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noPOA-0003a9-9k
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 08:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1noPKV-0002E7-Ed
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:51:07 -0400
Received: from mail-co1nam11on2052.outbound.protection.outlook.com
 ([40.107.220.52]:19168 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1noPKQ-0003rp-Hc
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:51:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENBixDI/JdRfVDMnG7IVIHAV5ngS4FiqC3lgPBfm6POcvG9m9BEfqho3U7Dp32qwS/hFhqhXl3K2+p5y9BbSBMcNfnw/pdvTU55UuiOYSoAmHGAgLWSUmjTv3uEIxYQJ9JAzcDld08aW+79JwIvuwMmPVNQEHN4gsuL9Z4Zqjd/dWEohWmN6cnTtaBsIU709kSKgZ8TtRsdTmDvOD+tZNFL/moEoD3r+mR9lEC1t67ehv0fqukV++dwnFd6Ug9lZWoCXTRCXzP6J+OmstgeQZd3P5XGOAQKUsj5m0pkAsyiaJuLsUFh6+LNjbfHOcoeUq3r9D01UuOJrw2x52P8fuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+lP4z1Hii8ueMEwyQnNxTWDBA3PE5uq9t3xtCm+hvs=;
 b=dstj7OJzXnuNNlDZ69UnPTWN5peIKeEHFvvVuxG8PyFytc1HD55SvD83Fc/xV3vrwkG5GBam1O9yQV1TA9sv1MRllLyTnTdCd+wWAEDOdxNVheBt1xK+6hMda7BqjE4XcLfNeMbaVkbyURL6/dc3VtlEaRnEHo21xlyFtrazmE/aqrTX/2ljGZuKWizYN5/uSxFg6TMa704CunD5d2Swvs2N7itBRUoMLHqlsBHQ8E38eqOHtExWttLrttOMIjdFMRWAbm/duNMS38zAljCzT6ge3QFLcHGUtgFPzYZcNSsKEbgZS4DKuuaIEmgdckeQ/GHVlUa4UZcyXSnItP//Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+lP4z1Hii8ueMEwyQnNxTWDBA3PE5uq9t3xtCm+hvs=;
 b=DxcpLwfne1GnWXOo1qbWtWG6U+CP9qwOIw8onqFjEdCOR296lj4ghAmX6c4OURyDYF4TR4T+I0DHVesIH18GNz5iSHuHjUzi+ijE43sXsAwrzRtSeY7qutDp22ZOxF76OANXw7AaXakYub8c8iIHT17yOiUVVHVwazPs91z9XS1sMCLpNg864RZibwprvX3hWL8XIhzqL7tR5d8K097DQshxaKCbkNdLHLzVThfivMJDaAYK9ChvXVswoXIH4phoSZxJrfXAnt8gYp/k/W9P8U0LYsIvLy65oBoCdjl2iVftMVLjmOKTcZlixUzdW0N8/9I372cgJ7L+zd2ylq4Z4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1734.namprd12.prod.outlook.com (2603:10b6:903:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 12:45:56 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 12:45:56 +0000
Date: Tue, 10 May 2022 09:45:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: eric.auger@redhat.com, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
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
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>,
 "yi.y.sun@intel.com" <yi.y.sun@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220510124554.GY49344@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
 <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
 <4ac4956cfe344326a805966535c1dc43@huawei.com>
 <20220426103507.5693a0ca.alex.williamson@redhat.com>
 <66f4af24-b76e-9f9a-a86d-565c0453053d@linaro.org>
 <0d9bd05e-d82b-e390-5763-52995bfb0b16@intel.com>
 <720d56c8-da84-5e4d-f1f8-0e1878473b93@redhat.com>
 <29475423-33ad-bdd2-2d6a-dcd484d257a7@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29475423-33ad-bdd2-2d6a-dcd484d257a7@linaro.org>
X-ClientProxiedBy: MN2PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:208:23c::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d36cc1-65e6-42c8-ae7c-08da3283068f
X-MS-TrafficTypeDiagnostic: CY4PR12MB1734:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1734E375A907CDD87D3ABB99C2C99@CY4PR12MB1734.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGK95Cxo1l7ppxeysPGjn68Q5FwbUxusvCxFbaOFrHfRLoPI4FBVNDYcZfH7yhfEDufY0Ts8OrwNNAiecvHxWA0raRpznHJQRAxFMHZb4neA9h/m32yJq5hgCigLhBZhWFJhhqh4/fFLJDCYyxSlEatACKpeVqi7/I983xItAwdnepP+Q4J4BmjA9HObZB1mzyfSOeYh0koGhHMsprSrX+yDj2MitEojMXIBMS/OtmbnmInq15NH4navBv4uZms9Jf2qoe8WKzIntXWY+GtPIrXq2nyMaSMxr0gzaIBooQsjknG3CiyIe/COqNNQ7WAwEmK0k66w6Jh+ygY7PpRESrw90B6FrExsKrbbeZ8ZuLca/FB69VBxQC7E+4ppVqiXWHdPYSqNJyc8B/skNWeZDUC+MJ5Zoeeey6ccoNzDOS001WrVVlA9F3hVhRKOx1sdeoWtwFLlVl3B28In0t3LEcPrxdDKVbb/PCIzZNqbb2amrnPePk139dt8rhJqL+YRfDvVwEoGgJJVA3N3fgxXy+jquuT9C58jmCwiNOZZEsxwkoylrySl4nlY2sefRza9IciPuOLnExBJKLvoPHZrT0gbmyBNHFr7F26k341JX56os6fxyirreOwcw1ckP5wmV1qdu8oJE9UeewCc+fwL3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(38100700002)(8936002)(7416002)(86362001)(508600001)(6486002)(316002)(6506007)(54906003)(66476007)(66556008)(6916009)(66946007)(8676002)(4326008)(33656002)(83380400001)(186003)(36756003)(26005)(2616005)(6512007)(2906002)(1076003)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGGuzSW6hLDeZowB0oXJ8Wv9hgv8wOhN7WdyBoZl98VMfSLUeNtiHZqkJ4VG?=
 =?us-ascii?Q?1V3sFDmNLenhCxyi74+fwgAtgThCgymHxgoye0eyQfS/SnTbf/J1ZnfVgnU2?=
 =?us-ascii?Q?LUKStxA06GDx558AUYL5XxU3NO/vSeavIDSJIbgaKOI4jrPOK+1NhUqYM4g7?=
 =?us-ascii?Q?9CspP230abyQXBzoNWj488+smbSTHrB/S6uVY/nkEgLOV3JNcxZ2qci8E2GU?=
 =?us-ascii?Q?bzRQRVu0d81XxF8fMAFJbFhSsZ8OfXTjin2c/0yYWskKTxm1mV4PLYITkGdR?=
 =?us-ascii?Q?K/R7U3oE8O+s/ZJw9BnIDtMB39tUxohLTfzXZkjaaWu8D3f8UoT3DESQxpxQ?=
 =?us-ascii?Q?5IqTSO9xHQgpg4ZcaifMz4O6FWOaPo/O02LnJQFY26hXxA3fB58RROfD1BJs?=
 =?us-ascii?Q?bPgegRvWF7W3DNOE6jhdenKaKGAV/+fm4c1l2OcpI0QFlgu7AaQRuGUEXNbi?=
 =?us-ascii?Q?JhbDIqCBvvoNMBknPfiL/+UfBKS4xpvMJuTD0WXnIL3r2+ID/sdTsE/dJjzz?=
 =?us-ascii?Q?6ZE5Q/JCI+0ENLN8vclKHyWUygPQwxKwCQAF/1FHuNMn18Zo0ahe/D229e/s?=
 =?us-ascii?Q?fPtGUYqMlgDkAJhth9Bf5UQT6RMQfaBXrpSZ9wcGhoms49uBAAcVSkZqMWqv?=
 =?us-ascii?Q?2AmOFH1YIpqUL+u6b9w9yt4jQuIIc7tRao11/SxPpC+0kYjwyIqF9kndVVuY?=
 =?us-ascii?Q?EnkhlKumbz1bJwcIaMjVUI69VmQoV3q04SE6TU5n0PhO9NmBfD8AgwwdnTOV?=
 =?us-ascii?Q?q9rQaKmkjfpws+rF5iSaxTtLrBM9Cfnr5vR73B5QYswRnIJX9+bLNkkMaXtr?=
 =?us-ascii?Q?2hUQXJJVa/+4r0n4KxPv/ThmdCTUMtH/4T5Pd7sUUghCVBA4wctap74jd/QP?=
 =?us-ascii?Q?bRnOKQ60W76ZBJJFR7wBJU480Xw3J4g0S/9r6lQeXUQY5rtoEqGK64c1cfCa?=
 =?us-ascii?Q?RdxmaHy5uAnoSRt04pO3X+zmOTZcomdoP2zFU4dxgdv7v0ua6tDa0e6xijb8?=
 =?us-ascii?Q?KVT0vGw7hIxgFI3ce6Mbrw5Z8fAkkRwV6O4KOtZ9iV4BR2LFBVsedhs4y5E7?=
 =?us-ascii?Q?PZic18lmNOSw3DC0RLvRuWSBlujAMKfkjcffhqHo7xT3ErDOWhenR2vqA2iu?=
 =?us-ascii?Q?BQZ09/KS4A3aLhsBnO8YE2kJYl2rTy0tzHVqN2XW8RG2RvIFsaJHkF/RKOvD?=
 =?us-ascii?Q?HjCf4noRqYEDUqBEIw7DfvgsQUKqolOBWHLY+2O8mkWXuPwLhfHOAvMboy28?=
 =?us-ascii?Q?e5TuxolomQhmhoZmxtRLSVWPkp5P4s4xK6ZBy6kXTS4MDLxR9cpwu0zax5dM?=
 =?us-ascii?Q?P/D6tTVDIpneKboGQapSZlU1XXmhQtJgJCCrC3sTLRhrEyVefKMXnHxzA+5E?=
 =?us-ascii?Q?WlAOBLqSwdGrvbCdIq19qUEJzJNSshXbipMJWpUPxGWGvSxRZ7liGzURbZNL?=
 =?us-ascii?Q?/+rfBFth4DLoy+RAzUV0psd/QvoubHrGRrxmM8ipXwH8qQZlEO0uHavrdv4p?=
 =?us-ascii?Q?DU6cPbbSeoaV3PZkqQ2vFAVTbZsC6jF1DpIWqWWpuEC6SNMrlPXEfBljJRL4?=
 =?us-ascii?Q?EpVkW6zj27Sg+yJysTcawoV5auUq5+6T90NLKQ9rmX1NEs3Fq4mXoC3gK1Kf?=
 =?us-ascii?Q?568wL5a35iYSUf8XAsbWciHlVpRj+pSyGzFPq4O9LLJEv3XTm3cohhbqb/x5?=
 =?us-ascii?Q?TLaZuT8dJd4KuPfBnC+uuepLABwqpugj/0lW4KFznFCK5g8Nhi3pbzLQ/q/M?=
 =?us-ascii?Q?nQKaBCApkg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d36cc1-65e6-42c8-ae7c-08da3283068f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 12:45:56.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/Bj4y6UQvBv3086eTZE0jBPp+gOa8ysz/81h+q86mkkT7628JmxnDeSvdHFxOSc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1734
Received-SPF: softfail client-ip=40.107.220.52; envelope-from=jgg@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Tue, May 10, 2022 at 08:35:00PM +0800, Zhangfei Gao wrote:
> Thanks Yi and Eric,
> Then will wait for the updated iommufd kernel for the PCI MMIO region.
> 
> Another question,
> How to get the iommu_domain in the ioctl.

The ID of the iommu_domain (called the hwpt) it should be returned by
the vfio attach ioctl.

Jason

