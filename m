Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17943C911
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:59:32 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhad-0008Eq-AW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKh-0001GB-7J; Wed, 27 Oct 2021 07:43:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKf-000716-0s; Wed, 27 Oct 2021 07:43:02 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBg8qs023575; 
 Wed, 27 Oct 2021 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=koI0WZDYkplk+NMatgvRcZdkfDq0997CllV/CC2BrQ0=;
 b=vtyU1Hr3W6e7YqHSOkUoBxDLgci0LWufjV6U4+91Ytd1AMqBa4qkrzunhc8nC4hER5KC
 EWCZzfBvF2fFJfZwNZgm03gC57tveR3AXqTs7tNnbG4kMUpUrZ779drakkyPxMgcc2ry
 n7NSg2ywjYsa5HI8aeOCxGTI/9daScL9BcN/mo9t/227ui1R+hqWZqzF7TjmAFj9kvxN
 NXss6qn0bfI4q5GGJlNLkKTq2wPDdLXC5m9geoaelGRhNA4FQEB4gdhQxMR2PB6uZGrA
 7ls0aENrKib7n9AJVTxrpR5UaA+RO9OuhzxLZRozRtgPXOdIFOQf6JRzm1SX0BENWuQ9 3g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fj2mtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfGlf159506;
 Wed, 27 Oct 2021 11:42:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by aserp3030.oracle.com with ESMTP id 3bx4g9sr0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CACCTsBbxIEfAhD1HdglGREaBIa1AUEZVCWsRkG1RigGSLdfg2gayvf1krvH9+GJ8IwNm3RfsUL1FkgpzVE05myFNLutbAPATbZcgPeiPhyAS+h1wPdcVrwXsOrEEoeM04e1JOYATQW/wVZEG80Q8XqU+YmQYOVS0JTU9HuB5+kHfdWcEzWyJwuNZKOlKLJdbSj058VtBjnT1qOh2NKvgmio2f6caTJLLX0N0Zv+mk9BH63zxj4A2mzW7ML/jaAUjqGMvBM37es61AkJW9Q0zRVJqAezI8glBAQPuh/cmTYZrFgdY4QM7TBC7GYqp1Rcido9Of/PiVPgOcmsyVLdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koI0WZDYkplk+NMatgvRcZdkfDq0997CllV/CC2BrQ0=;
 b=I//3FCnkP0cNMqrLKQaxcf/0gyUb6drMkhOzTwuxgm8Sk8W1R8vT/qIeg/EvcDyBNv385ECzO5MV8XYL7oWYrll1wGRtAIKawYqJboGvz1BD6bP6ndroVbJBkH2s92C81LJ3bk/zFPTs1sBkExRXtWpFer5C3a8pHWFirmarWAtR0MD+01hDfaann6jeFCX0ZqDzDx5Mys2W629fm16p5FPUS+bUIhDEmuxFvX4Hp68apwcwhMW2hON9BPZBRawqvQG7+2CXzuebCdAQdDFpz45JW6YxYQp2wEpDRLRH0xo7HK8s36uut9AYTbQjWw91rG1B5ZmMovYNIKwZX/WTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koI0WZDYkplk+NMatgvRcZdkfDq0997CllV/CC2BrQ0=;
 b=pR3+ftvFGl3BhZ9T6s0F9ULemsTMBeRuDk/DEA1maZQUmEBdh2MQ/8MTvU7CokpoTAzbOoTIXBteboSavFYNX7xIs58FopHgqqprTcl9oabe85mvMefLMDOpFajnYSv95DaV3HPPG39wPsMlNs5ZASdIDyPotYfAlB8SNwGALwE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:37 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:37 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/8] qmp: add QMP command x-debug-query-virtio
Date: Wed, 27 Oct 2021 07:41:44 -0400
Message-Id: <1635334909-31614-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd27bb7-52fa-4442-1f9e-08d9993ee00d
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4744AA204F2F9DEB8F0EC0AFE8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:215;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWv+YSDciCM5TqrmZ2cJWamT12H4ZWYwpM4QSTz0gZUaDseaX1XgM3L0WJKT+4rjpvmeZD8+6T4+TePrnKZLycXkSEgCQbwYSg+tBppdiI8MDCz906TS1SHYatQsYzxHVfDe6qdtHBzfA6/g/yLL9AY7jGVW34FuulbpHiSBVHnfXd/MkB2u2eNTvgcorNEPXKj81TH14R1YFahw6NBk+SYndUBkCNNC3O++9ytsdPjgd2+E2GyZCaqpL/HEVyd4qmkcolLhqafYYVL1lrVdbPh2kDfyVUO5kDAJgEn8298sAY5i5Z2tak2it7g6YBV6jZyNS6AnKy1mZQVj7thC+iSaeMJANFm9Ck7OeCZcSYrRUudqJhEWfPgNcUytes4ekHvrgZdrsxJEyEgzTGS6yvxFMQ4bxLSbbW1n6UeC2+N7MW1vDto+VdV2Ucy93XLteTvqvRhQLJWzo/b3U3gwE0aIGH87z/hXSK0f7rREDD7OeQODgtLlNQVsVv3wtoIb67Eglci0YjHtCIfZcBrC6eAOfSyhHLtEO+uRiNlXobuyEKntvqp4OeIi6IC2w2UJN0qY6o091nsx23cDHiM4Ize7Pc5FD57Mzd2U1smuJdmrX/ot5tre+6vJcjhxYus064K3cS/VTFO7ZxkYTGAS7c04gX+nf63IGfQ0p33iRi6KkZwPqtQy5QJ053mawn2N9XEoXai6sGcNqvgONHwGHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(86362001)(83380400001)(7416002)(5660300002)(52116002)(508600001)(6666004)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hoCT9Eni5o75KaLQPn0b9ujPzF4sAovFz1icK6fb4IBiaqwOmA86EVmQRWqJ?=
 =?us-ascii?Q?V7UICA+uJRpTRl583qr6jR4n8k5PNQ3QZSSNZMopWBIPt+dRiAft2NKL7KbY?=
 =?us-ascii?Q?MCu1/kTPvY/UYEKfDQdEJZRX4ZqGpjtDYf9PAV2nqVzCQ0Bih+jnKk5rAbKZ?=
 =?us-ascii?Q?+lf/Xanw1Wq/APdaTIUqytDwmbBgJmEYVyamAijXCVZyAZ7dLkZN2fZ8tuFo?=
 =?us-ascii?Q?kxOTiUwXJ8bCk7TpDnyzHZiRLzLhHB66A6nges+I9+J5/LObV/O1y4rW/Sem?=
 =?us-ascii?Q?SaxmxF3ZKmb8zgk+AMftVADWfvocrdRnHmWPK9F820i9bOoxMdcaaKxaP1ot?=
 =?us-ascii?Q?QxfcjaZ/L6F6goaW0SD0o1trSQFdBoQ6BLwfbbxu5+inY2UrDij6StVIxpfa?=
 =?us-ascii?Q?IWJkIZuGdoHE067O9iztqZVjGTexVirGzdCd96CRY1YF5XK3cqbkJkLCeU9s?=
 =?us-ascii?Q?WmvDSeV0GayGlLxNeZD71OBSE9Za8Wjr2AnY3oeDcoZ3BWhdYg+EYRr9cqeF?=
 =?us-ascii?Q?3BX0AtQ46ywnJuhrAFBHulqkfqr/RU/mK8Ujy35xo8h59YOBqcwDqhFXOO8Y?=
 =?us-ascii?Q?S4Dwimn/Du5rontxEEu69zk31Ql8VLM9hXfc1Zvw3x3R9RK7OGsNlYrB1hsf?=
 =?us-ascii?Q?0ij2h+8uTSHDwW1ZauW+R1pkmNWG3y12+7lyjEuf7541alGo6Sip5t8ebXXr?=
 =?us-ascii?Q?GMHv5oLmprD3lTc8KBAQaRToSqJMcRK5wfE0AT2AOOYTJ1xAq4cALJ/GfjOq?=
 =?us-ascii?Q?ocFp3EzxHAsgUMHRODPjel2OgHj7g9SOEc7WfAUQqHMHrSR+kSA2uRYJFU/E?=
 =?us-ascii?Q?jTPveneeN1QD60pdxDkWUDGCk14/vsI1S5uZ8xgpqT/swbHK4wQI3JsSCa3X?=
 =?us-ascii?Q?Djv8NqFjS9wbYBqW+XCQuqyVWjZtVIQMKQNOIiBP5F/Ke4AHdZb4meWzMq6A?=
 =?us-ascii?Q?eDq4euzfmbR4cu71FoOeGmmXa3u4AlGyvqAjnyqerB8uerpPt7NHSFvgIG4J?=
 =?us-ascii?Q?RBP8yVtQcdg3xwepZzy7jFmbJwoIP8WdweXf5D6X6PxfQmIWmGTMRMBXX7rh?=
 =?us-ascii?Q?zjoTgmV/aDbgTrNNhxOh/+laLeLxPO8JTgtABFZPmrymbOFP+9FDGWrtXzKJ?=
 =?us-ascii?Q?0x6SWjFcDRF/iTkskKBhRgLUsS11BvqqYKievX4Q7V6HzSAb5VpJGDD4KMBj?=
 =?us-ascii?Q?pjcbzV2EtIRYyQrtSV67VI37gGXhkv6/tVzC2lTWf9XhMeVflmE4acXkhmyo?=
 =?us-ascii?Q?MFeVetwo9nD/UyUnTQFMk/G2/jt88/XdEoYvRu9d74sYPYltNliAFvFgEDNq?=
 =?us-ascii?Q?ipoP3Fgz3Trx0wpQXzlBlzVa+1+yyXjOENHX6NgsEVntbT+2oCTVYgJ6gCmb?=
 =?us-ascii?Q?/919Gel6NYyqH+AKOpAOWchnx8dE4PW1SdomRmVx7/9zOOZ1A3XxS7VDhWoS?=
 =?us-ascii?Q?Xq99IcqzTy6CkFsEFK9H6ZAMxLMOLSe4IO5kenGEosafso6BVKRlPelGn3lZ?=
 =?us-ascii?Q?BLOOf+AZKo7uxgI+xVvmjGbcMoI6vMjhkN1GkmenKKNjHNFquXVftU8YhQoL?=
 =?us-ascii?Q?UEf3dm9yCQhI+LYuhlZoLQu8UAyD2C5v7KNK9OkS0zCUB3k/DqCGojs2t6kf?=
 =?us-ascii?Q?zsJU27TEXZOGdA1735f678U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd27bb7-52fa-4442-1f9e-08d9993ee00d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:37.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcoCqkeKtvtdTl/nx1NFhVmnCMTVqlLopahYZVLFjiemdG/dJhFSzHJQvWZOtFFhjK8TID2OzYasBKJXz2AxOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110270071
X-Proofpoint-GUID: IGbAQnIgTjxNvMD4eux7iwQiefl8r6Q8
X-Proofpoint-ORIG-GUID: IGbAQnIgTjxNvMD4eux7iwQiefl8r6Q8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevice with
their QOM paths and virtio type/name.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++++
 hw/virtio/virtio.c         | 27 +++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 114 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 521f7d6..d893f5f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000..d4a88f5
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7050bd5..ad17be7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3709,6 +3714,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3723,6 +3729,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3896,6 +3903,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3906,6 +3915,24 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node->value = g_new(VirtioInfo, 1);
+        node->value->path = g_strdup(dev->canonical_path);
+        node->value->type = g_strdup(vdev->name);
+        QAPI_LIST_PREPEND(list, node->value);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 105b98c..eceaafc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a38..df5662e 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -45,6 +45,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..1512ada 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000..4490c2c
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,67 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice including the device
+# canonical QOM path as well as the name of the device.
+#
+# @path: VirtIO device canonical QOM path
+#
+# @type: VirtIO device name
+#
+# Since: 6.2
+#
+##
+{ 'struct': 'VirtioInfo',
+    'data': {
+        'path': 'str',
+        'type': 'str'
+    }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Returns a list of all initalized VirtIO devices
+#
+# Returns: list of gathered @VirtioInfo devices
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "x-debug-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "type": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "type": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "type": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "type": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "type": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 1af2f74..62c6cc4 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -95,6 +95,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
1.8.3.1


