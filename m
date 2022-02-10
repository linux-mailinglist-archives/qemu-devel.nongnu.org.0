Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727C4B0AFF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:37:54 +0100 (CET)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6pl-0005JU-NN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bg-0000Xg-SW; Thu, 10 Feb 2022 05:23:20 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bc-0000tO-Hu; Thu, 10 Feb 2022 05:23:20 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7t6vi017462; 
 Thu, 10 Feb 2022 10:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=HmzocDTbbvP2DONzrhRN4V/MtpZknccs68w0YAcfoC4ldSJnjSf6TGFI1u1Vcy+9Nt5V
 nKEOqoSKdwExSpE5KcNfQM34CHPD5Xms2cd4wSSYVhm7Q+N1QLq2Jhi6ep+tCaNhaINn
 3mYD3KhQtbP4Qdg1QGeFoSbi4FSD89sQjDV5cG0WX0rsqv7o6UAKz9VebmWvqvoxhKQg
 YmubD9imbMHxTS2oPWzT4+HHNldS4Dpc0QgVtRFdX9hU++K3N0gw1KScK3YVHyHqw1pi
 MeeCjOPB86dwJAhQ9N9PiCPi+uNzsyF04TbbP9HrOWTa9UvUGFAMw5cWERNYMIdMuItM qA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28qj2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AAABlu142872;
 Thu, 10 Feb 2022 10:23:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by aserp3030.oracle.com with ESMTP id 3e1f9k0vmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U16b/SOFtoqPY3JXyGb4ZvzIO17TMFXCHXi9dHA4GdYn1d53HOzV+Im3chkiOo+TY2/lr4aXSvoLvdSr1Ll2fHOgSrqjmFYW4Xl8K85Pzs4MrPgenTtFy+/1v21OEk3vStjR8E4St45BhWeYdR73A+dl5zmmj9KGb9AqdjL6AteDr8iAln8PeInVmMITiozP+JOj/h5dnBOxn5vUAfe5eaIwqxXtlbtQiRi3qLNdSVB50WrwMlEoVVo7vsJ0FxUYgJJjZqqLOK738JmanbpfNM99p14UocWr6bQ3a3yWavIJV3gHu1CpT4Sy3P4cFSuoxsWrrx+p89CsoI6cWKNlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=A3J07IOY3k0/zwyt/aIPYnv+kjdsTPSdUhjYSY/9tKwvKmBKeG+Au1kcaIE+e7d+3NLUrWbX8QW+T8OVG8mHUh7eq2NF5LA7L6LQRduUZuzlMGcVbBXY1DrhNB8KT881Gw3Y4P5AlfUIsuY9xy+vXPbtdT4s8JAYYXidtEy8LptCV5ZXKvDLTd6VfrbweaDOQhhsuo53c/aSdZIddUGmPCMtwXLiIaSLW0KaR/4FQ0LjIO7jfQhzmxrjuXTe+fGsQhHVl/oMdxb6UtSVaBdmAtrbAjcZ/CRUfcFu0EFDt73exhrcHTiUQuHRJqmL/fvd6MUsKCL8lnHXgWtiXD97GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=c3UgMAIM9XMEZsJe8dc9IpJCepwRxCwZNFJ+edlssEI8WdB+rYsOp6q7IV57BQESs4BwpvBZmG2Ii9meAHoKTA3fdsl1+46dA6r+ZpwLCPFhQCMXWVaTVNmDUL4esE9CtO6AbSy9mWD+cEBBKfrHW6vAipWzGHeJ2NIih0SX/Iw=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB3513.namprd10.prod.outlook.com (2603:10b6:5:17b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:23:00 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:23:00 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 4/8] qmp: add QMP command x-query-virtio-status
Date: Thu, 10 Feb 2022 05:21:56 -0500
Message-Id: <1644488520-21604-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c1eacb-7939-424c-6fb6-08d9ec7f5091
X-MS-TrafficTypeDiagnostic: DM6PR10MB3513:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3513EF482FCE0BE63D418F97E82F9@DM6PR10MB3513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbKRS3AAzpIcsJxq7pPgWhpOFeL3sakvNlZruH3IWjb4JQzXtnY+lnG6uCL3uKzeRNeq1t4N7j0gDEL+R8bwUBDSs1qhcJqKguWIEjF0wqQ8Y9wsG3e49/3R2QOsDkZdYXucmKecN78GDn5z8C0HE65XwzcihJXKOD3VlucnF9p4VD5f2XycGKkxK93wyuQnTJx2hfxD1PJoRPpaq49htnWOVyhE2TDC8/TTuMHfrKY8p/gMCweJBV17y6bcNI8LQbq2PqjSCvJyaGAijnBw2QTbift6bRHba1l0sVY+TTL+C0DLc4Xv8PukZw6AQwmzEG1mw5sA6+60n1O7yA7l+rIYnfeY9gkpJBb77E/wS2d1v3YeHGTDm5Gv6GlPZOiirqWI+4owZxqBJizsGWxTIBowRdVNbYvFhtAUPAR4XV0zZHmWGVU6xdAzInpor1vBfAv17IVpzMv/UZGe8chmO0BNREcxlR0t8yog/8/sRYFC1eG8RweFNEuY4zwoy0+rv0p/GJKhWkHxKIV86yRhLV4C7jukZFxibsjC4C2nXvFLBGY6XVhVA9aVaEAFawR8k1JtGc2b2TQnAHCPEpk9kHYtc7Hb4AzJrCby8+sGJQNyFdHq11PV0gsuxLNgSh+uphXD9DtKijBdaF7XQrvFF+lUxNC4NRjlc0twso5d9VzUT1+X5+fE6Vbsy4QBww3+1FDBs2kXwuZh4EjkCwviwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(6666004)(508600001)(30864003)(44832011)(86362001)(8936002)(8676002)(66476007)(66556008)(66946007)(6486002)(7416002)(83380400001)(5660300002)(316002)(6506007)(38350700002)(2616005)(36756003)(38100700002)(6512007)(52116002)(186003)(6916009)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MWA2TW61sD5nDUmKL5SrMC2iirw9ocJrAvjnxYMi5CogGoTynUp4wTab9NCH?=
 =?us-ascii?Q?rWs1GDCr1737/SIFJPTD/dql54FyWLaYbrutZsfYaTEKeKrBK7JdHFqFU9TL?=
 =?us-ascii?Q?tZZaC6pvDfwefh5mwE0r/zNyYPuWdOIHW1KadD7nZC1CGoEm5bKwceX+z+zj?=
 =?us-ascii?Q?wNd55ayd7hTZVHRdcaespBQ3L2RnpUFcJfzsSshxGccb0SZy0zXDV4bBGC0v?=
 =?us-ascii?Q?gYNyS7Z1U4JhUicF9iezFRVQcFI7RTgvLAWEKNu3gdGSUHKasiPuCXy3naVr?=
 =?us-ascii?Q?pS/8rJlpmlHWONvFoVjkMawX/LVkp7iZQ4MEADvxK6zpGJrKMQ00pTf0EqRf?=
 =?us-ascii?Q?Cs5aLEpCS+tuCmjiqa8/tHU7H9eLIRuhiyZKvuXGv1gvlJFWt8V14RS+loaM?=
 =?us-ascii?Q?VWxTVRNhI+rBSSc/184Npi8W7WBiZXHOtPaqE19daoMMXnkfF+Us4O5IJ+fE?=
 =?us-ascii?Q?qhzmR2H1RvpbPNlRa+eHaH8kp2yLmYURZYYSdCTttWoi+y7+mNXORZUoNXlX?=
 =?us-ascii?Q?6ALHou3SCRcRzu0D+wN9UwzMAuzYJsouXqVBKcGb3+JtRT3JIEKou683LZj+?=
 =?us-ascii?Q?TDtjZ8pRM9+km1IqXDAqexq6VqhPx+GLVaWjjkKdn0wNGv8M7RRs5+NSzHKR?=
 =?us-ascii?Q?9Tra0vwzR55UNUFZWxD9U4MOwVbFUAIeLXoT3jfp5gylk0SNtHmEPMP0Sp1J?=
 =?us-ascii?Q?V5AKWcxKnKYmqa1kiRid6pLow69vSvnXKyDVGmDt3ZV+nna4FRrkXoHbO+nT?=
 =?us-ascii?Q?ZsloWNRJojglNVIwot8VkfGZQGniN/yEjwSBqJzoWHmCBvwBzbKQ+5uOLdZ0?=
 =?us-ascii?Q?nk5stgPMkjVpic/I7yi6HOz8JPLGbxdVkHj/ybfh1sHxhVC2UcDNMXtEqYHf?=
 =?us-ascii?Q?5GAOPCEWMdhAJzVUt6Oa5hMLg244g7SSkzesWKQgnSSG474xKggvv7WqDkGU?=
 =?us-ascii?Q?s3lujm3w8odvWRW8G4sLrb3vLw6TkydSHfSwjjm5HKW4VI5deBB5TOPKfbHl?=
 =?us-ascii?Q?Gt3LRLw6qIICOyiNXYGtykoQAscqpNmVWD2WZXV+62NPrG3pktQeRPH8QNWl?=
 =?us-ascii?Q?fJKzxMuaroHZClkfLWAd7/IzdMNuEuPApUfWSbZ6jmfgXm8vpBPMim/qLIUk?=
 =?us-ascii?Q?49FcP+8sUioSGYEO3rKGVN7Cs6830Y5FATpZuf3V5SLqfNQwoosPQiBwh8tb?=
 =?us-ascii?Q?9cliGEMbln45wPBet5tcI4uSfp/rEs55GP0L3Iuesj/UcmTacf+6W5H8l3cQ?=
 =?us-ascii?Q?fHP67AfoE0cfLR1vjPSuJpnyw2jJ3IIMx682uuakJVcH4Yl8nms8zP90OkEF?=
 =?us-ascii?Q?mVwVpwfHlq0AE4HpEq+J6XC4GEDMY3NqQJTNqa4SIQC+E4nXC4E3b225WheF?=
 =?us-ascii?Q?1twYt1L4+VYniY9yXwd3cOAgwTNfD0Ei+z4Cavl66+A/e5+we/o5hPmtc/aT?=
 =?us-ascii?Q?1cq9yP4goLeFwzvn9aA6AKXbsgVTXaI/SckaZFkXngfqhmiT334w5PMhPzFk?=
 =?us-ascii?Q?PyRTYdTSn72n0kqDE/Z0Nia1/x690+1QStJEKeRmP2hS/yPSIwFAnhAxl9KB?=
 =?us-ascii?Q?kFt77ol98FUFQj/9V9mUzzEf6kmYYT63b23OGRaF51qINR6Ppt5fj4r7xKM+?=
 =?us-ascii?Q?GpStTa+B5m7BJ7OD3ZlI9RQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c1eacb-7939-424c-6fb6-08d9ec7f5091
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:23:00.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiaOpGa1jPGwuRUXOaosPd9Y76VQvSbsyJ3BuhNJ8ZW6TfpbhdB62+22i19cTOEPj3npvY0DTSDDzOVW0vdHag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: OWI59HMPzGRoCvHoilsCf7JWsprVLwIj
X-Proofpoint-GUID: OWI59HMPzGRoCvHoilsCf7JWsprVLwIj
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

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device's status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

[Jonah: Similar to previous patch, added a check to @virtio_device_find
 to ensure synchronicity between @virtio_list and the devices in the QOM
 composition tree.]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 ++
 hw/virtio/virtio.c      | 104 +++++++++++++++++++++++
 qapi/virtio.json        | 222 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 05a81ed..0b432e8 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e59f0d7..30ccd7b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3928,6 +3928,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                g_string_free(is_realized, true);
+                qobject_unref(obj);
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+                return NULL;
+            }
+            g_string_free(is_realized, true);
+        } else {
+            /* virtio device doesn't exist in QOM tree */
+            QTAILQ_REMOVE(&virtio_list, vdev, next);
+            qobject_unref(obj);
+            return NULL;
+        }
+        /* device exists in QOM tree & is realized */
+        qobject_unref(obj);
+        return vdev;
+    }
+    return NULL;
+}
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = g_strdup("little");
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = g_strdup("big");
+        break;
+    default:
+        status->device_endian = g_strdup("unknown");
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+    status->has_vhost_dev = vdev->vhost_started;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev = g_new0(VhostStatus, 1);
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index aee0e40..ba61d83 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -66,3 +66,225 @@
 { 'command': 'x-query-virtio',
   'returns': [ 'VirtioInfo' ],
   'features': [ 'unstable' ] }
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs (number of virtqueues being used)
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64' } }
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (VirtioDeviceStatus)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: Corresponding vhost device info for a given VirtIODevice.
+#             Present if the given VirtIODevice has an active vhost
+#             device.
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'device-endian': 'str',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            '*vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disable-legacy-check": false,
+#            "name": "virtio-crypto",
+#            "started": true,
+#            "device-id": 20,
+#            "backend-features": 0,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 2,
+#            "guest-features": 5100273664,
+#            "host-features": 6325010432,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 1,
+#            "disabled": false,
+#            "vhost-started": false,
+#            "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disabled-legacy-check": false,
+#            "name": "virtio-net",
+#            "started": true,
+#            "device-id": 1,
+#            "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#            },
+#            "backend-features": 6337593319,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 3,
+#            "guest-features": 5111807911,
+#            "host-features": 6337593319,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 2,
+#            "disabled": false,
+#            "vhost-started": true,
+#            "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1


