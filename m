Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697194CFFB9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:13:46 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDBJ-0002Mz-Gv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7g-0007Sj-Ql; Mon, 07 Mar 2022 08:10:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7Q-0000ST-EK; Mon, 07 Mar 2022 08:09:57 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Cibia009917; 
 Mon, 7 Mar 2022 13:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=zqpht8XHRF3sXe6XJisiTy28fNLvwb9YnPRqpwFN8qk=;
 b=oOGhIi9xOzl3h0PJmjEaHJ0MkQee0qGmgEzRbAnuEeMEKrCdQS+aR0jIRxqCNZ09sS/d
 rWfCVxmIDRz8i6f82FZDzrV01VH/z0aFskeNINhUkMbmktjO3KbOwHkARQSlVTuYni8e
 Ej/yV0Idb7MArlZjIPJkyfVrcbTYvFRu5bTNls1WtKvZev1pMxtxVgdYfcIxJnmpyMwq
 wCd9jd3VulLHrHEh1gpOdZP2R9zC5pzwpebGu7FxSqN7ZkXL9UAtNjAETqLZKF+z45Er
 eEJHkeixBmowfpxiSZwOSWxaAMIxmDwA3Bra6AImxit0meEbiLmLR7Y+r9qZPBzrn6X7 /A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyraknkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D72rX062997;
 Mon, 7 Mar 2022 13:09:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by userp3020.oracle.com with ESMTP id 3em1ahyuw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpZVSJqjegkPBD4Me7cCCZ4x5ms6ES64X//dNetVnDM2vU+tJlNyUwAAo83emhv/kGa9MsfvRg1Tyca9nDv+w19mU5O83FmvuwMhpfCpcQ/ge4xELKXMa7ZVPjT4YEWDZufT/ske+1EesWjJy2IfeXESF16zbmiXKa8P1rC3Hj/bxCJxp10ArozrWhRYORU8+ZWIAbbQ69eJBsUP9VpFEv8wYxBcw9n6F+SwkqrTKj2PqNQ7OL/9EHfA6lFQBH9IQ3iP0NYQITGCzrDW7FRdZBXgtkjUfXEj4/pvru6Y64XPJtApW9IAPzs/qKNb/1K5nbQ4YoqHYB+fmFUA+KZbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqpht8XHRF3sXe6XJisiTy28fNLvwb9YnPRqpwFN8qk=;
 b=Edv8ueo3j7OzRvjlHG2pFhJElBqvT71LIzRsi9ICEDULWTcGWNqHY2SKcxDW446WgrWHts3Z/6MKCge67U5glQ0KvmDWBCDUSFxjVIbJq8gPfk0eQqy3tOIE0fxuM0RIgi5t/xz896PUUq0rAUwwXo3MX3h9ys2n7CmojNpaeWb8sbe3edeaU8Hdp3MDCgYij9hNXdmf+atG8J9tiCr8fS2EA2vCU+z9DiizsdLe/LWr5LdtwnlxIwmUFI6EKmDnZeUV7d1FZTNc7OGQGTo4pLttjYxREhm7XViULneb44bcdM+ZV0hLzDlepy9iXbJ02pX7sXyyjBz0S7wk7jeJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqpht8XHRF3sXe6XJisiTy28fNLvwb9YnPRqpwFN8qk=;
 b=K4FyTMjriy4F5fqEIf5KsPQLjKxY78+EvpTv/J4e6WxlwfBgJia9tMa/+xAZJDy3Lt8O+76xoTTTZ0oI5JuhfRUVboOVnFwnnn6mzt7sKLxsn5C0WWr1CBAyMT5Z6LGh8BWD4K1lx0alx/4Xo3haCL9m+wQUXtRqxiWbWT7evEQ=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB2619.namprd10.prod.outlook.com (2603:10b6:5:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:17 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:17 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 1/8] virtio: drop name parameter for virtio_init()
Date: Mon,  7 Mar 2022 08:08:34 -0500
Message-Id: <1646658521-31652-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d462c2c-004e-4fa0-52f8-08da003baf24
X-MS-TrafficTypeDiagnostic: DM6PR10MB2619:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB26191F986174F03B195DBD9AE8089@DM6PR10MB2619.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmpxLJSQGtJ+wfgdEnVp15fs/aRUNTsjM9z/BKJjA3vN/314vTA5Aj+zCceiiHGJXLsts/ID8veSeDTHtxZmUkGRC/TxtuZhsDOXLEs5TZNsRcahv7SJ/g0Uz/cz1qlrZYM4I7aBuDB0r4SXNod4xvDJM/P7O84eGDG0iStAgKz5HzqnslpeY7ss4VdzhdDDVSqSop1XNgUuR55oNt83VqtTwNmtAid9tbsq28IWR1myIeXc4wSyfIdJor9W+ERd2+JAbyRkGGyZR+fY5+yj4noRnA/O+mrxW8Y6e+Q/iFRzEguLv9ucwW5msR0m+IiVPISasNiC9LoO1lqlDQuhGDqrx6xE5ioZ47ro/fmI4ykZS3J2p3a5Xdlc6X0TF4zTJ/PdL74xQpjHJE+e9Hr5dNK9KxmYHAl3K9oFLQUr17VWhsMCozkZQ/Pil/VOC3jVXiaWzy8B3ee3Db3iu5q3NLFaxEKG5/3mPiJ2u8z+QXxLGGqKrJIW96a/qXyktZ3/EYZd7H0ah1KCVYf/vLBfajzQngNKSapNX6hj1ZtWI1KbbjpVhb5V/CiIm3Dl29RWlN7Lb6dbxGJ2BdkXXkV2HxSDag2k2VnN+u3N0riP2nV9hsmkyWdUZ5OkYUzcHD3M1JVhhHr/jcxNxsTi4kVW9+x+1xsl3qugPSht3nZklr0o0giJquZf1VtrJeuFUyzl2DFHGEmWzPhY5NrlaQZwvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66946007)(508600001)(66556008)(66476007)(8676002)(6486002)(83380400001)(5660300002)(8936002)(6506007)(6666004)(36756003)(30864003)(52116002)(38100700002)(26005)(38350700002)(44832011)(7416002)(86362001)(316002)(186003)(2906002)(6512007)(2616005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YU5PE1eu4nLYlRbJK88NHFqxwD6Y5cDJxUoWZnzdvlz13spFGQVNIpyJGsh6?=
 =?us-ascii?Q?Tf1Gu8GZ2K9udTD/hZGmUmVgVNwXG9do56Kw5MUtencDDfpsRaZ1+Z4uvVhl?=
 =?us-ascii?Q?/lOrMbyyV2cQwCsOrhLLEShdCUJBSXEWbIOwjc4/7UJEWCzj0oeffAhml5uh?=
 =?us-ascii?Q?aVv2WqqIKMwnVhT8sOlQPVQbrSjS1jyEY9j6eXt4WbiQKGPX5kN1bjuc8F7r?=
 =?us-ascii?Q?a9GXM0B7H4NaeReXxIE31fn5BNUctWie/VE3HF05L4RCNw1EPCg2Bp7LDbwg?=
 =?us-ascii?Q?RLGj72Q0q95dGjqhwOLuq9ErUwesg3FDRbfWfpP/BL2svpVoU02cBYWnAeLD?=
 =?us-ascii?Q?T7vWsxTPuJ8j1+rUXUcDFMYP5NfwlDXHcIMlOW2F2X4sg7qS2SveeGWwLpnd?=
 =?us-ascii?Q?0J1rdVl98YmK+22kA5E3m94LcDvP4+RjF1FX+0mxp/wwt3B5euzqRbgougxb?=
 =?us-ascii?Q?23iMwzgnrRhPiBewvLOqp1I+11rn5PqJwguF86ccMXioWHinP7OjXo+rTo/q?=
 =?us-ascii?Q?UxiCE7A85FHqDTmnQR0ykzSZpVsRIHIDQakwZcQFNGo2hYbLsPmbn9fXs44a?=
 =?us-ascii?Q?Vht+OrxjyFc3VDSSLqh+G0pZMtISH7jQ5fVWvvC53YmcgiZpuQX66w+8qHqN?=
 =?us-ascii?Q?mIJB3io4EjSgstJeWRFThnF21yncdnoBCc3tDgubx9v2B0/dMqEjtl7ZyKsl?=
 =?us-ascii?Q?OWCLP0lPoBFSWNRBEgIvv32PKuEunHjjns8mJ+9t0zBvLyDNNSYRwmWge1c6?=
 =?us-ascii?Q?8tn7FEmvMwZfw/xeHvROWPtom+hs2jKbHRqCkcqgP0TLcgsUf8LkPQcHAQSy?=
 =?us-ascii?Q?YcmuZOS7cMZOGdqiRIi4IFkT6TLYfP0aOeiN4QFtrEDub9IVHLWuYRZbYI3b?=
 =?us-ascii?Q?+zU0O4M/n96r2VDYoPWl11ebA8bCH/WDJzD/jTIizOXJfVXxLmgFqf3TNiEl?=
 =?us-ascii?Q?MvwZQdsNsEc8eUpH2xbrQ0mcidK0qvwGWmRs1M7/B0FQhHsb025qtnjkIR9Q?=
 =?us-ascii?Q?hMG2ofJWjrOKsX4cgszpf0QkJTiP9vDUOlWAFxoqpghnWfCbLZ8l7wEG0I17?=
 =?us-ascii?Q?vDzUK7Sqamn1XjGRRcnYXIeVrUu1pFHv/P6pzwIz6cGUj/lgBQZtXWaonyZ3?=
 =?us-ascii?Q?xgBzSUzjdEV9Zs5lX7htPzrabBk/AOyTcPQjlcggOPkCxdCnQ2w+rNNwB4+j?=
 =?us-ascii?Q?Yy04xhpMD0GgQoI+fv/amjDudr4k+sBPwL4CsppgQG/NiurOJqg54Jnf6OJ5?=
 =?us-ascii?Q?YWeVbOmTWYG00dXtXsHgfegWLbAHD+fOkxpLXV8f83HTasvz9swR7h71EBxy?=
 =?us-ascii?Q?Y+1bvG0u3aNfrfPlS8UXW0bXDtQh6GKp1ajVcpMlUsF8/t9t/ETSgs6P4StA?=
 =?us-ascii?Q?Vzucx8MJ8ldDNkSONC1QAc14VjEP8qXfGbMIY6w294QuQAp+uExZmj7RNYwg?=
 =?us-ascii?Q?qqmV7G/1NmO3mLXejUh7m7/YsO+C1+70LduSKACINeCui6QZO4w/NYBkrouz?=
 =?us-ascii?Q?BwYqAiaLgRgjmCyHRoHUv8nMRhmosNHm6wkQemXKw+ht+XvXgETCsqPIhuTG?=
 =?us-ascii?Q?5AapN3M7H1SMpcRU06Nnsl8T3xhPNHk7iQk9UH14lNexATHv77A3PQIJ7aSI?=
 =?us-ascii?Q?5rTGnanyjD/pcvjB+3Uf2Ig=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d462c2c-004e-4fa0-52f8-08da003baf24
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:16.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N1XTLWmPpWfxwk3kOTuYk2Yi+TjPAUbFetmPlth+D20E5dTY1ZfKxjGio9SjpZEw9Jew2qc+vYMdz0jmpJRhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2619
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070076
X-Proofpoint-GUID: faTnPIl40Qp9JbqJ32aW3QyOOb7gCowB
X-Proofpoint-ORIG-GUID: faTnPIl40Qp9JbqJ32aW3QyOOb7gCowB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch lets us do this and removes the need for the name
parameter in the virtio_init function.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c             |  2 +-
 hw/block/vhost-user-blk.c              |  2 +-
 hw/block/virtio-blk.c                  |  2 +-
 hw/char/virtio-serial-bus.c            |  3 +-
 hw/display/virtio-gpu-base.c           |  2 +-
 hw/input/virtio-input.c                |  3 +-
 hw/net/virtio-net.c                    |  2 +-
 hw/scsi/virtio-scsi.c                  |  3 +-
 hw/virtio/vhost-user-fs.c              |  3 +-
 hw/virtio/vhost-user-i2c.c             |  7 +----
 hw/virtio/vhost-user-rng.c             |  2 +-
 hw/virtio/vhost-user-vsock.c           |  2 +-
 hw/virtio/vhost-vsock-common.c         |  5 ++--
 hw/virtio/vhost-vsock.c                |  2 +-
 hw/virtio/virtio-balloon.c             |  3 +-
 hw/virtio/virtio-crypto.c              |  2 +-
 hw/virtio/virtio-iommu.c               |  3 +-
 hw/virtio/virtio-mem.c                 |  3 +-
 hw/virtio/virtio-pmem.c                |  3 +-
 hw/virtio/virtio-rng.c                 |  2 +-
 hw/virtio/virtio.c                     | 55 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h |  2 +-
 include/hw/virtio/virtio-gpu.h         |  3 +-
 include/hw/virtio/virtio.h             |  4 +--
 24 files changed, 77 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b..5f522e6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9..e8cb170 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 540c38f..27c71ad 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1206,7 +1206,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f01ec21..9f19fd0 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4..8ba5da4 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -173,7 +173,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46..5b5398b 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f..25f494c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3388,7 +3388,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 34a968e..2a6141d 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957..b875640 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632..58fd729 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,11 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
-
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -220,7 +215,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5b..08bccba 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682..0f8ff99 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f37712..6146d25 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -220,12 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
-                sizeof(struct virtio_vsock_config));
+    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
     vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 433d42d..696635b 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e6c1b0a..c9cdadc 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -889,8 +889,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb..cca5237 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index aa9c16a..15b3fa0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -968,8 +968,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index f55dcf6..465a996 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -868,8 +868,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index 5419dca..ec74890 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f7..7e12fc0 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e8f51d..500f15e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -132,6 +132,56 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "virtio-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_RPMB] = "virtio-rpmb",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_VIDEO_ENCODER] = "virtio-vid-encoder",
+    [VIRTIO_ID_VIDEO_DECODER] = "virtio-vid-decoder",
+    [VIRTIO_ID_SCMI] = "virtio-scmi",
+    [VIRTIO_ID_NITRO_SEC_MOD] = "virtio-nitro-sec-mod",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_WATCHDOG] = "virtio-watchdog",
+    [VIRTIO_ID_CAN] = "virtio-can",
+    [VIRTIO_ID_DMABUF] = "virtio-dmabuf",
+    [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
+    [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
+    [VIRTIO_ID_BT] = "virtio-bluetooth",
+    [VIRTIO_ID_GPIO] = "virtio-gpio"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3208,8 +3258,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3238,7 +3287,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b..076b7ab 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b75..afff9e1 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f095637..2a0be70 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,8 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
+
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
-- 
1.8.3.1


