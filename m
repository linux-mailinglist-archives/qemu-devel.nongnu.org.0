Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA5495005
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:22:17 +0100 (CET)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYKN-0002tQ-Fl
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005c7-Q4; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVep-0006al-J1; Thu, 20 Jan 2022 06:31:17 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K8i7QL031213; 
 Thu, 20 Jan 2022 11:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=qCpexL/c9EGwBqx1FS0v04GwGxiJPH1gCsgMC5P31i6uJlAMxw47arEiHPSkRdWYGxEo
 4I/fjnOyqDs9pGmAl1PM0Bk8pe6DmG9+cbtTqjd4OeuWSoCcXDS8QzrfbEMNMvFTd4aM
 s+DNUSfGObyC2ol7dghP6bXpCStE3EEeepvQQW8FqFIOnvLdNJtfwTCTEdbkMTh3x5bd
 9uaZ/oyO1rJkjjwL4tsXpILIyipkazzgrXvjUKJ7cXC0jq7TBmhnY6PJ/Jzt5Ubb9HFj
 /FqWkdKkozjzyYhan46xrvQB7XKRJzDSFN6SYp882BE/7XEKbQiatHLMryt0A9UYAMLo mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vr29y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGfht031354;
 Thu, 20 Jan 2022 11:30:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 3dkkd24hjf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSuW4TxZRtVr+mWZjTRIHQDQM2vbXKhJF6MSJfr/TfjgbJ9cT1Ttu4shca+1VesViELJpmrciJ07Jhh42swPHWYxLefCFj1tt/K7xJM2qgPdruDq4+H6GPwBEHdDfySxNhGv8WWJ6omz4o/yq23OPOwiXONEmKCXxzUo7D2mVM+0Uy46f8yC2RA0nX+BI06pYiKd8E1ID2R93AjiLJrsUkR4PI3J1efwx6w8LOZhV6EtfxAEADAuOxFFx3u10a4YK9oqOqRoSq0V0nrM8IneQGH06uHvtN1zsZ9rMvNEBAXcp9F3XwF3lFzCB73u2EjBXImD93WhmAwauwLWb4lPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=dIQz4jqXYKEMfCtdIXGmw5sIS3Ngad6xdXHrH/jjouzCmhynrqQqQv/NYvrH0jmSGNg2ZJrwgg7IQosN5RzcknB2rz3eEkBbH0pjIVLLDBNmT5Vcmf7zygxAI5jKp0W2Vg+IkSyWvL5SU278welO7y7xkSOWuIXJ21G90fu3irdx7uX7BFgklDRvlMfkdb4b3bIgrK92cIf1cdjWEFs2kofbUfohKWx5kgIfdzWhRYcx4LH1XDGQJOCLJKq0MpSzRvP8pdsR8i4dZ99hMM4o4XNZWrzSJ9xzjit2/L4M/O1t+bi3ZdjwARaOPA9+FcghqDoMuV7jiDC9/bKsss/+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=x6tnDRL3+L/WDuWckAe3mmHKT3E0Fdc6oUyGB6hV7+gcXjiPqjcgv11tgEJjLHX6NgEbq5Rp2V8cU6pDJgCFzOmKgKhB19Qku8Py/otRKp+LHF56LJEp/kseUA7BSZ9Lu8Gt9mRtZGIPTs6RrYsjeIe/Y8yF3D2bNGNflmMoAmA=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (20.182.107.75) by
 CY4PR10MB1381.namprd10.prod.outlook.com (10.169.254.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 11:30:19 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:19 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Thu, 20 Jan 2022 06:29:26 -0500
Message-Id: <1642678168-20447-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87acd8fb-ddf6-4d85-1f62-08d9dc083d26
X-MS-TrafficTypeDiagnostic: CY4PR10MB1381:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB13813B520F67E1239F80D537E85A9@CY4PR10MB1381.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QpMkO/foZcXoObijbpFOZp9tqaQPJqWDVJ2TYtKcza2x2lTyyam2zZYetJD+Zm7jXt+fkHk85Wm1eZdOEuh4LI0oGQZUUeJCbfbEczjfRff4wP+mBQf42ZtLhFVcGfrCKCAHah9uBjSkGULdd0y4sWrYo7SI9uxYM7MBP6+CMMCV9DNvlPAtX7Bvqk02fI7mfC63XRMSnOKQEL3zoRr7F/aObBjugecV72b5/B1WVX7Rz+LkTM9eg+z2hodmsqWhtFNyReHJ6xn4v28L2i52+b33IbZn13RQ1DxboTNHJMYe2gGQNnYs84pOWDVOXf/NU54GwCyGD0m3QQJMjCFyDerrora16AtHX8F3C5RHaH2R4RhscZeYwqQ7lRdlnlucsUxih3ScTKFZBYvqtsbJ4GYXt1i9jY1iaKFtKdWFx26OWius4U5uDvYSa2oi+Z20Uk7ZVNVo6OyGsgR068bqfOJ3mVYn+HfVSs4ClpYkMrj0JlTzOIY8/+SqRj2L6tVusBE5ik0FiLXXrtOFh0F6TX0ENzNfNRtH2jZJ9hZxtQpRIINHvwpyQtvPbHQHAzNHy68sSLzFCDISM5olx/6UEi0OhG/Z1V/UOIKq74OPlRECHX3k5Is5F9HEFW21SMsYahZGq6JIarXIU358srWEgmPnjIIFO4n0Iy9YNwVAtyTD2j9lQjKX7WgC96tgiSyGpSR+wLjH/32DPygk8O/Mjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(38100700002)(38350700002)(6666004)(6486002)(30864003)(2906002)(6916009)(7416002)(8676002)(86362001)(8936002)(4326008)(508600001)(316002)(5660300002)(26005)(186003)(44832011)(6506007)(66946007)(52116002)(66476007)(66556008)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hal80/pP+Vidh3r3OoYw5PJ+VqfRlqFYn6o6KZpxFPPVSnsB5g9u9KFN/I50?=
 =?us-ascii?Q?KJMRbXL3P15hCqqxm7kiv+VhVje88g3YNEW5UpZp2SYcBlP9MMsvENnNeKXK?=
 =?us-ascii?Q?7v5Iuxh51ts6STJAFUKJVq90sbNfj9Egfmc2GM/Xh9TwNEAsgJBDGaC1z23x?=
 =?us-ascii?Q?mV/urXJdz32wjds9b47ZUP5JO9Hj4T9PyPvh68QfRfJiNj0ljfkD913h1Z3S?=
 =?us-ascii?Q?RMozh81Sc6ZmM5k5fbfb93rA9FtPF430viRPzZq67Nw12Xf0F0Lz5q9XBTjN?=
 =?us-ascii?Q?1GqmEqBn+26CipfpU37xu+In4ubXHcTdF609Bmj0CHHzsXHAIa5EnUUQNX/I?=
 =?us-ascii?Q?mVIIT0X3Kxo7W2hJOpyYp7LRbWM2vsnOB700qH1XYWN4k+DWczYX4G+05Bpa?=
 =?us-ascii?Q?zB9VrDK13bbOKQNf9hRP+imb7ZNTyRuYSnf6ObU1wsuLU4kf2hscC8vx7gkF?=
 =?us-ascii?Q?o8XvaLhYOewhSHQKq0tQGs9n2npFEmHvv+19sMGQvly1aNwXB6teenuHgbYM?=
 =?us-ascii?Q?dyB4m79d0OEEBIb0pRDHucZmjv940FX0WlLp8P2ud4RkWFOHdyNCXWCMuENd?=
 =?us-ascii?Q?qiFpO2GmjyOmoZ0I6Z5teSGF63C2PakK9fc57Hl91+H7/6WBCP2BctR7qp3T?=
 =?us-ascii?Q?rwimGa97/o2A+jVKtl2dc+bK3vGAC1WolOqaXmY9cqJy08r8gQs7eU4uipS3?=
 =?us-ascii?Q?H+H6FETVyKlTURRzKsTmaNM01CcD+er7QjyZMUcIV/haTSZERbBFN+L5fnVB?=
 =?us-ascii?Q?6XpCv6VUn4dATpgPe4/PXWsC/8r9bVdMgEvlIB09gfylJx/CRAl6QTp0hYeS?=
 =?us-ascii?Q?dZW+1NHxlj+wliFqWhK3opXyp4faevOvVxxvqglPWSuxRpwGIuPIJMQZPit9?=
 =?us-ascii?Q?VWnfG3x/IOIxsAjsXs9OmuFPMGx/3Z+H2lii2P/n3KLty/ZDVdKvjUBSG2jM?=
 =?us-ascii?Q?op/ecWPilP1Yas3jmAgyofy2fVwQhQ17LXQ+9IkXwLV/s3UbbY4z02Hw155/?=
 =?us-ascii?Q?9QBhqAEsdRf5GMfxZklgW8azv+GH+DSsg1quouLnlC2A15yBJv5uKiiNH6Ix?=
 =?us-ascii?Q?hKxR/hls9KJS7hIKpspuyIQd+R6y2sXgIXBTt9b+WJkT0ZqGfrgpN1j6K0mF?=
 =?us-ascii?Q?q/LbR3tPusqvAvws/rMKnAqefJbIpNyEF9pgOhniBtcU08cYqwGjzAbj6oMn?=
 =?us-ascii?Q?f+VDu59ZKi9QW205O98yQ0rcwSqMWaRXEXd8111Wc8eSq2Db5mF9D7YNc45W?=
 =?us-ascii?Q?iKB9vp02eF5B+TMIIrQ8a1kdxIvwocPHSB99wl0GrWF3eAGbvMRczFUNPtWz?=
 =?us-ascii?Q?w/+lFIiArz/AactK/IeRvYSPya8zU2A2rrEBiJnPNOADriHDdBU6HjNuEFXJ?=
 =?us-ascii?Q?XxObjD/h9WZ9hP9v57OHTsHtTbGTrWhI6th9Y4oVAAL3TwrzPuy67SCK6uCN?=
 =?us-ascii?Q?yr6GS/enSyVRxMOTG+5QHGu5VReVcZ0COtRSScIX3bjD3gmz8qr3ZH97E6Ka?=
 =?us-ascii?Q?9HcC8PyjHj4duwUUFn6Jq+IBKoRrU9C3+sHPT1MlSHp4xH6VYpBWrWLAd9g1?=
 =?us-ascii?Q?b5QothxenVQwR0u3k4ASV1XZb1ugwy+W0iXRVTHZYvkaC6iYnb0ey2jy7aNC?=
 =?us-ascii?Q?oIE8l4ar12J3cvvl2P7gxFk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87acd8fb-ddf6-4d85-1f62-08d9dc083d26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:19.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UP1uSXDLzzw6y80Vm8cQz7ruSftVxX2xsLt99C3nu8otRI6zBykroCXFdTcR99e1BjW9LFFbaZEhubXDz6OrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1381
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: WHk3o5UVKXPUgrFqz-Jt70jtaDcA9bZF
X-Proofpoint-ORIG-GUID: WHk3o5UVKXPUgrFqz-Jt70jtaDcA9bZF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++++++
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8..13e5f93 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 41823cd..c81210b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4313,6 +4313,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 474a8bd..44cc05c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -404,3 +404,255 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5217370112,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5217372160,
+#            "queue-index": 1,
+#            "last-avail-idx": 0,
+#            "vring-used": 5217372480,
+#            "used-idx": 0,
+#            "name": "vhost-vsock",
+#            "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5182074880,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5182076928,
+#            "queue-index": 20,
+#            "last-avail-idx": 0,
+#            "vring-used": 5182077248,
+#            "used-idx": 0,
+#            "name": "virtio-serial",
+#            "shadow-avail-idx": 0,
+#            "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5216124928,
+#            "used-phys": 5216127040,
+#            "avail-size": 2054,
+#            "desc-size": 16384,
+#            "used-size": 8198,
+#            "desc": 140141447430144,
+#            "num": 1024,
+#            "name": "virtio-crypto",
+#            "call": 0,
+#            "avail": 140141447446528,
+#            "desc-phys": 5216108544,
+#            "used": 140141447448640,
+#            "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5182261248,
+#            "used-phys": 5182261568,
+#            "avail-size": 262,
+#            "desc-size": 2048,
+#            "used-size": 1030,
+#            "desc": 140141413580800,
+#            "num": 128,
+#            "name": "vhost-vsock",
+#            "call": 0,
+#            "avail": 140141413582848,
+#            "desc-phys": 5182259200,
+#            "used": 140141413583168,
+#            "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1


