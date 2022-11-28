Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB563B26F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 20:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozjzk-0008AM-SS; Mon, 28 Nov 2022 14:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ozjzi-000896-6k; Mon, 28 Nov 2022 14:40:46 -0500
Received: from mail-bn7nam10on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::604]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1ozjzb-0002qS-N2; Mon, 28 Nov 2022 14:40:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnkwMt2cVx7RUDCDvwSKouB6P/+MQsqmzxUIQkPNI7dozHvkiNEbhs9rLZwy3y5A29fKAddiqgS9PTHvhn0g87B3XZfH3/SgoaCQJ+kLQLlyEHs8eNm+6eBXIaxK9PXoeO9pdKcq9AY2vBAqZccg0tKZ6HNTeqgGroOI6eWLxL0YD7zatov7yrWDcd/yyMsNlqUq1sr4VRiDiMlE3/8Qx1RzAedvFl9Gvnp6CLXO+/xtGJ/ACPusttag1jBEXcR3sLSITxbUvoCDL6DCzmRf3WT6yzHT2uqktFuOqeHzlNyRDCijIS0KMJnD6pV4VowKEWmm/04tcHvNE3po/2/cTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iktcub+NTXNpiAUZYmApmyHFDj3mxoEcRQS8B7uxQoE=;
 b=A6Pxka7xBe3iolme5RFnoAbJMma3GDCh7f94hMhw5VRfTEZqLDP6RpYsGlPcMGKXhr73HyO6HpiiqtuDIHIdkq2f2yqZxrCAEm/QEYTH19hJhXPBflXTD+Weox/bMh6z+tyLJxsGz+GhtBLaKzq/ACgNK9d9UAS10S51O6WP5tCBvNiBu9O6dDVI99Yz/hbLZJXKmPiiyPXS6MReGF77Pt7eaFNfvcdiIqLM/sA5P1fnqjV7+4tn+BF0OaBWtT13qAngkPaqP8XxrAhIQUHJ+1jdsVq57WD5N2PdKBOF4erPizWtrTgiq5UzzKdEd4e0N4nYuk7/fl8oECvlF/O1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iktcub+NTXNpiAUZYmApmyHFDj3mxoEcRQS8B7uxQoE=;
 b=s1f6CqtjUyoxJHQ2bmX8HK4HaPkY29JR1sHcnx1E/Q6S4RJCvnvlLFT25+EOiENyPs/Ue2ywz7uTICnsp+0+WmU9UyHRm4P8mq3egV5Tm6OBXl7vEpMo68jzNrVCOFG7cYhW7pp+pKTxZoDchK5RouoymTcHpxp8JRaJ3GcKzQgnMI2J+AtrQ31qs79I5vs7tvvy3ee9Ko0I2epQe/Mj/842H/TVMmrulweEMvvMyb1U2RvqySQjrowr3yOstr4P6sqNOFiPdGxzG/e4NmsHuRZlHMrPhp48sqVpTygFU2CPbCod8aXW09yeZZj1l+U4U7y9QDJL+4LFamHM/Jqswg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 19:40:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.5857.021; Mon, 28 Nov 2022
 19:40:25 +0000
Date: Mon, 28 Nov 2022 15:40:23 -0400
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
 qemu-block@nongnu.org, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Shay Drory <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <Y4UOp7Wi/fwsY6DY@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
 <20221128115003.602d4ef7.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128115003.602d4ef7.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR0102CA0015.prod.exchangelabs.com
 (2603:10b6:207:18::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3b4b47-df28-449f-ca0f-08dad17864e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jAHZ4h2r7DZ/2RycbzTzh4/aQ+fgYC5H91EpSq2v+xWJsn7PXl/tlnZRwW4yBGtrerJJG5Pn4arnqCx6oCAeNzCWbWxAdo+FG/AuxnJVHCKpHliz7bxUhhmacVwLyMoACp6Ppjpyn7xHbOK+WHhjwPGVzYZQtvSWqaLothOJFkiHwYOWLVE+svlMnoL8JruWpHcVkNX9jfN6dbh6lWtsBUU9dCMxOcLFoRGxDwpat8asSsiVWxcr77w45t9A8TNpYklhHARWbd3VK09tqcKHEuLiOLW+nignD+GeKyIvK/PAgqr2WODLEBkbNLWX2PMzLIFOSMD7hMxfLV9YtbQnSvTdaFcyHMQrWgXdJNRCYUrHLifLqehhfh1tpJXQpk+GshSWqIm77SNmP5ekv1kc/LDWm53sOyyzQ69zrLKv893fCtsIR4wmB6AX3LQqCAPfd85Xwl5U0IXQsbf6sh72gEcZC1JV8rPhDX0laSEU7J0vrzptyaoqoExQoXecEATHzVT0Za8HcpBAxEvIvtBX82p0Vn0sTxsbLkgh5GIjvFjRnd//T25mSRzvE8zLbTZ/2fitxtrjParNJsTPBwSc8uu705fv9UqV8+V8ea5N26q6UagPXTzNAHWL+MmnotkH6eDt3e4u10hjjT59X4bXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(86362001)(7416002)(478600001)(6486002)(6506007)(36756003)(2906002)(2616005)(38100700002)(6512007)(83380400001)(26005)(186003)(66556008)(66476007)(41300700001)(4744005)(316002)(54906003)(8676002)(8936002)(6916009)(5660300002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvPXLg/80vjW95PVrtTYnSleGxuJ4nr4KaZChk/Ac5qDXNGhl4F1GVCxfqdE?=
 =?us-ascii?Q?HKJM3Y2blRUS2YJlteyLHrC3ZlAdLBR9QjdIp9POUEzcfA6xf6YdnLyBqejO?=
 =?us-ascii?Q?2oGmF/+RvCZNljDgJyJUkyLIJ+00GYZSQYfEqaifNvteqXpvLAUK9mJXg35O?=
 =?us-ascii?Q?aOq0I0KYWFD0It7cKUrouhRqCkbqAp2CZkTBIg8I+7uMv+q1qZ2kaJMD3uFw?=
 =?us-ascii?Q?K8p95DBBi1x19b9AaE+LrTCkgfayYGKY0xhJKwX8ycqkw8zSn2mWldRD4bhq?=
 =?us-ascii?Q?QAib+xk3mpY4JKx77MeRAr3neYoPU9IiVekFc8CPF97oIfd/C5gbzwe+8k5J?=
 =?us-ascii?Q?JVZVXtPu64pXiIrWiJvNC20Yn1oq5Ox8wTDMvrn7/ug7XnsJdyFW7iPmd/Eo?=
 =?us-ascii?Q?LpZNupACpJ1sMij6F3qEoIWynhgyLRCe3tYwCKUqvly2CNi5C/H+7p3rj5tb?=
 =?us-ascii?Q?no5VreNMJgAeDJoVWgnU9DO2RqFR3H9RyhVYXHnkdqm61wjaeWTpDSfxWB34?=
 =?us-ascii?Q?yq7mFIoYB5+MAXherxx3V2JdjfFNeSSNDpptbK456BnsQBbgnrmfteKL62BA?=
 =?us-ascii?Q?nkFOKrQdlhdbjRbADVYFgSp53d91e3x3LhszxFpnaUQXbcHIgtueO4ebfFC9?=
 =?us-ascii?Q?CpTWFKG9CCwuu5eXK2GCSd9qEv3X+IQ7teK3X5ukWXkfzXuMJGJ5nEsZo209?=
 =?us-ascii?Q?BWEW8F8wvsKU0V+t/aiFvr/c2nWUC7Cvy+7bYtcRy/QHNqN18jxoAizxTsW8?=
 =?us-ascii?Q?nzE8cWsTeDQatHHVWDX5RLK0fDecW7H2WvziO9WwlLCVcntYmlDq/nEFwLeo?=
 =?us-ascii?Q?kVYzNU1K0VFZ/6qJRRxwNWg8sQw11RQpSI3JBEl21gTe67SBe7n52o9pHdu2?=
 =?us-ascii?Q?lKHfW7d1PVpt1qxCqddE7CnOUHp6hTQyJjfeQZQnxS6Mu/V6hEB77JRmSJbr?=
 =?us-ascii?Q?n5NMmvL24kg3PWF7iINBsxjIhEphs/K92BmYf0TJcN0IOnpAUHW0wzQyzg3E?=
 =?us-ascii?Q?f2NC3QHPxFjZsZK66FIJm+mi+Bp35i7q+yYVQ+BW4Cy4DLHq5jNDJq5gIIlu?=
 =?us-ascii?Q?hjaUQ1JMhX+jAYtccTW3ATiYp5hTjycRcxGjx/TTZVudTnqcB+Gr4F7oJsLs?=
 =?us-ascii?Q?QJ5UU4LBZVUoNjkwqLUDwgaoBeRJiSoWSwgHHL5Oz5vH6RrMyEw4QXNtqt6r?=
 =?us-ascii?Q?o0+8qYaP+t1RX4OXYbgExAl4t9S4lsRwEzrnUuQFLflTWAXoiX110v5py+2F?=
 =?us-ascii?Q?zc9kJpMVACAPKlWlBDC0UTMzRJDbJEzB1OunAUuFRFQxugVDSgOjuUBrZPjz?=
 =?us-ascii?Q?xVqzXw5jdxdbdUZE39ojONIJQwn5HClUNa5b1nF/r/vFbtLgs3mBmPbB/bg8?=
 =?us-ascii?Q?XPRZlFgOMqDD/XyaZNIN4kFnNQTBM//gQPw5wzwfYePvUg1q566sMsD+0tkn?=
 =?us-ascii?Q?QpD5inXy684JeghTlYITh6cll6vsNE3vzuZETcCQjRm3BNOPhjZghRwYH4xr?=
 =?us-ascii?Q?D2Be3B2xk9KNhSOJTcvleKqVa5+YzIHNat3/cTbmgnzR1IBFgPTVZX29y8CD?=
 =?us-ascii?Q?+K9BEg3t+Rxjko1LnJE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3b4b47-df28-449f-ca0f-08dad17864e9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 19:40:24.7232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiWhYQq+qA/aDdfsfR+6TdMr7RG9h/Wd2d2pOjyzyJvjNrbg9vRJGu5zEGmFhMKV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::604;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Mon, Nov 28, 2022 at 11:50:03AM -0700, Alex Williamson wrote:

> There's a claim here about added complexity that I'm not really seeing.
> It looks like we simply make an ioctl call here and scale our buffer
> based on the minimum of the returned device estimate or our upper
> bound.

I'm not keen on this, for something like mlx5 that has a small precopy
size and large post-copy size it risks running with an under allocated
buffer, which is harmful to performance.

It is a mmap space, if we don't touch the pages they don't get
allocated from the OS, I think this is micro-optimizing.

Jason

