Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD3458A48
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:04:00 +0100 (CET)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4Ix-0007V8-Mo
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:03:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1mp4Gu-0006a3-KF
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:01:53 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com
 ([40.107.92.46]:12926 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1mp4Gj-0000Kk-Se
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:01:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMQbF+kDraDZgRmmA3W6cThS2BVjDNP4CZIbDcEcuiCKGRj7TBQTBGiSuKbIeUpql+x/TyqmyCmG0RkAPGFKXhhfwnZhfSSWHNTAONl4yuKe4wnk5EiBX1Y0qLON2IcIAIlZ7h9hw4neE/n66t2yXA2uoqhhkkDEoMGBc5lNZWvy0FqMjJntcOihCbxfkWPHTT8GZz6recR5Qcn8gs6SBRhfQbfMQdXf03zs2nzqIsgOvykzu2o7ushjfiuYcxS+NBXYwyHCAUF/+KRoAy+rHSUqm2FkypgUxvjdAx0ojGD8WmthPPhI7gwvFN8MTXL8WIbgfDOCDGMiQh6XTICKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNF1VmDZrPNUN3wCFjvpFJaYrKPWuzLvBhbt7nVNebs=;
 b=LeDGEhSaLLBIiHFTO4DOOPjh5OQct8UPUkIEQhEW0uhPvBcyTvWOfQTnSVx+4EyN/+ur5UJo1+FCVsp+aLNKxxCC3BhjYbEj+VpI5s2RIUfzVvoJiNpnxmtVBeCPOdJb0FldR6rbjE7CxGUkTF2nj7113Psc81e1fHl+I88L0C50fsvDi1N8TJtfi93dMftRXgbYdRNGg1ThrDBywxlJ3qBVhcudq57/Z6lD38IsW7lmi12YTpcro76sx6SqXOykwjIJ/Ehzui+bVVKC5O02QLUB1bDVx6qO5OyAWryhOZyDCfMgVBn+UUrFdsFS2XGYyI56BhY8Yb4eOiJWb9V8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNF1VmDZrPNUN3wCFjvpFJaYrKPWuzLvBhbt7nVNebs=;
 b=PAyIT1fgeZ4EE9oRUh35bWSXvAXUzpmSlMzwlHRmX8XJRJcmXVRqzCj9cd4Ar3ut7uZjS91VZQmGetDTHU73bSNFpvbrvdpBf2RBnzJnrrfRMTSqrizwN1WPsBYQfbb+fhb0FLTZutap+1BUJdbxT3nVz3EZhKzAvGXFF9Yn4EeBUD+4NvEx4Li6I2mEkf6aIkd1FVzZrxUQmWdBFsCQk1wYMliSOudWLPY+k56sWTEvqRB6bBHTp1LhxBJtqYyJSpH01lnotJ6Hy5AjLnxJ5MEXBWc6itRKEFeY90xEP4JTyAtZsN0jPJ7CjzHsO+Vru5fdQDjZOWyT8ZkPIBsYTw==
Received: from BN0PR04CA0208.namprd04.prod.outlook.com (2603:10b6:408:e9::33)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 07:41:08 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::14) by BN0PR04CA0208.outlook.office365.com
 (2603:10b6:408:e9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Mon, 22 Nov 2021 07:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Mon, 22 Nov 2021 07:41:06 +0000
Received: from [172.27.12.59] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 22 Nov
 2021 07:40:59 +0000
Message-ID: <9e1ac80f-da3c-ed68-89f4-c0008220c10d@nvidia.com>
Date: Mon, 22 Nov 2021 09:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] vfio/migration: Improve to read/write full migration
 region per chunk
Content-Language: en-US
To: <alex.williamson@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
CC: <jgg@nvidia.com>, <qemu-devel@nongnu.org>, <kwankhede@nvidia.com>,
 <cohuck@redhat.com>, <maorg@nvidia.com>, <cjia@nvidia.com>
References: <20211111095040.183977-1-yishaih@nvidia.com>
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <20211111095040.183977-1-yishaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc69157-f092-44b0-7285-08d9ad8b7211
X-MS-TrafficTypeDiagnostic: BY5PR12MB4179:
X-Microsoft-Antispam-PRVS: <BY5PR12MB41790D116BCECBD31942B22BC39F9@BY5PR12MB4179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VDYQfXHjllubg7UD1cmJVVLP8Hp6d7fW0yyWfK8NEo86amATcAPzM5fEmYgY4gc9tjoZTy1SinRyMWtxTSCxLLSfECAQ4I1iJO1NkTCojpka89+lPnX604HTdVG4R6LChSGSggwJ3kYCobb1fLinxFgbp/Ix2Ty9UfnTiOa90Ltg8/c7kNMXlXZEwPy9vcIEJVDUwqvXxUTvB7TuVFpki6Q/Nt+fUprV2ChJR2d5rU1T0C7QtTgDxDdTj/PnFd0ehkAUNJ+kVYQpD31rnDfknsMO9I1EinQKfcBZh9mQx/MHKjgXXzeW6ij0a5LuKTI4FYjTBPV/oUHTUrAUcHVwptXnj5uEFeR4mWB49qfrmw2jWomJGf6GNwRxUDgI3fTfVwYzA4QdEXcw65aqi3e++647w/EJcHrsXavCBfFzAm+E0JnGOjWj8fw2X7EfGWDvdW3BRCWbmDlYg8sCbdbWH0nborT8TQbbGTcCavkfG6oN/sd8f1MKB5FmRm/6ZoQogzbg/IoauBWwYHG2fmg7k7a0Uys88OdJNyv+h1q6USjYUY0gqLVEFwWi0k5MnIY4vY5Qgqx4uvhhp9qI/OatKklKnGLwMOsJwV/EONjpETz/7REEQx9gshpeMGpUvEiHGAIpvNP6xtnbLKfTuApSHwR6gBWKfmPlQiySHopHTG/jrZOCbcjMRz2EDchaDL02+SlVZ84v+QtKq1XTzVcN/EHoDptvU65xF2qYjYCBtQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(316002)(110136005)(36860700001)(36756003)(16526019)(186003)(26005)(16576012)(83380400001)(4326008)(107886003)(336012)(8676002)(86362001)(2906002)(356005)(31686004)(7636003)(47076005)(70586007)(2616005)(31696002)(70206006)(6666004)(508600001)(53546011)(5660300002)(82310400003)(426003)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:41:06.1609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc69157-f092-44b0-7285-08d9ad8b7211
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
Received-SPF: softfail client-ip=40.107.92.46; envelope-from=yishaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gentle ping for review, CCing more people who may be involved.

Thanks,
Yishai

On 11/11/2021 11:50 AM, Yishai Hadas wrote:
> Upon reading/writing the migration data there is no real reason to limit
> the read/write system call from the file to be 8 bytes.
>
> In addition, there is no reason to depend on the file offset alignment.
> The offset is just some logical value which depends also on the region
> index and has nothing to do with the amount of data that can be
> accessed.
>
> Move to read/write the full region size per chunk, this reduces
> dramatically the number of the systems calls that are needed and improve
> performance.
>
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> ---
>   hw/vfio/migration.c | 36 ++----------------------------------
>   1 file changed, 2 insertions(+), 34 deletions(-)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index ff6b45de6b5..b5f310bb831 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -62,40 +62,8 @@ static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>       return 0;
>   }
>   
> -static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
> -                       off_t off, bool iswrite)
> -{
> -    int ret, done = 0;
> -    __u8 *tbuf = buf;
> -
> -    while (count) {
> -        int bytes = 0;
> -
> -        if (count >= 8 && !(off % 8)) {
> -            bytes = 8;
> -        } else if (count >= 4 && !(off % 4)) {
> -            bytes = 4;
> -        } else if (count >= 2 && !(off % 2)) {
> -            bytes = 2;
> -        } else {
> -            bytes = 1;
> -        }
> -
> -        ret = vfio_mig_access(vbasedev, tbuf, bytes, off, iswrite);
> -        if (ret) {
> -            return ret;
> -        }
> -
> -        count -= bytes;
> -        done += bytes;
> -        off += bytes;
> -        tbuf += bytes;
> -    }
> -    return done;
> -}
> -
> -#define vfio_mig_read(f, v, c, o)       vfio_mig_rw(f, (__u8 *)v, c, o, false)
> -#define vfio_mig_write(f, v, c, o)      vfio_mig_rw(f, (__u8 *)v, c, o, true)
> +#define vfio_mig_read(f, v, c, o)       vfio_mig_access(f, (__u8 *)v, c, o, false)
> +#define vfio_mig_write(f, v, c, o)      vfio_mig_access(f, (__u8 *)v, c, o, true)
>   
>   #define VFIO_MIG_STRUCT_OFFSET(f)       \
>                                    offsetof(struct vfio_device_migration_info, f)



