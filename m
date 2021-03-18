Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6765340A8E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:49:33 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvq0-0000Ud-NT
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXs-0003qN-EN; Thu, 18 Mar 2021 12:30:48 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008As-Qy; Thu, 18 Mar 2021 12:30:47 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGU2Uq167521;
 Thu, 18 Mar 2021 16:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=cG98HZq6jU19hwZJ9CZnbJWoTWBaYwXtkKZuoNKojxw=;
 b=AfnlO3m3NfD7skhzrELZ9GdBEyf3B6FJ3YTmYUO21lfLwFvG16ds3hO51lSUn9+l4/k3
 RbsQf7jOpTDbhg9Mx+liZ/psycavdlE1hA4oB2pxmDCv4R5ueLsmYt92FI+U55FEVcD1
 tn5vNupBj6L+UIsWy6s+qayqZEcT74WhfYfRKqhPcENoHhNsf1kPHd24L+dvhsdsziyW
 gqefwAng4GJcxaXGDOHKK9yeyfFPqBm0qzZNH/ZYwRjBnxyFWej7fiZahwg058a5BxAR
 mP2rWWCZovAqtfMMREsW6QzzYXn0/sV16gSSFjUtojAee3FZCzMJVhRRkAGv3vevgMIT +Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 378jwbr7e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGQm2H051906;
 Thu, 18 Mar 2021 16:30:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by aserp3030.oracle.com with ESMTP id 3796ywdjeq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imaCWKykL09k/bdhb4/BOPiO5mlALAREC5t/ssJy26LGkFnsf4HtijHpuHZmRpv4nTnX7ti3wQVkVN6ipJQxVVzPoeglkf5OyQr/SvGW8R0V7Fl59zJSNoTwIEurC/0pS2j5w7rGiD9ipJGTuF5J/qmODjgYwib6eK1jXnMk8EsmxgxjLoYzdiob2Gl8wXIoFPgo7qPuqzUgPjSCxoTrDgTXx0rJztnhr0C+5sHQPGKsNp9eFmA/4njnVZmQJzGJ0FG6+sHFT7sKM5MqcaKfso58xOk6b0aKi2A4lBtyA7C9LMC+H6kOjnm42FOhwajSdqgeww01Xl/GMmBPWA1xQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG98HZq6jU19hwZJ9CZnbJWoTWBaYwXtkKZuoNKojxw=;
 b=ltSxbxDcTKY5h/4mZNnlclG5v7JpDabW5DGK5UYiVFtxiUwxEgtLbnlidBr+pfXHR/VMyFvK02D1+fIvXmxey0GaJztwrKy2L1FGeZoBjvJ1+S7P6/ouMSAPzZ4tQoQUZy+flFkc4x3F3+F/XVRYb57VeO3tz9eZEBoYFcrLCZpSQTfy/TOU/A6t17efZytE6LLQvcjsaf+KLu6NXLqclJ8tGJrkVAFXsR7QVtIgK3VENaD30hWT8IRn6YsEXzH2WsvSX44L8vLmq0oubFrwwqAYfreaT0TFMLwcEn2u+39MeIIpQXBz07c5eV2LGDVjYTtyPcBkg4bTbKI0LDzMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG98HZq6jU19hwZJ9CZnbJWoTWBaYwXtkKZuoNKojxw=;
 b=MpFe6bl1KYO9ZtdnQqVZkc/4OZ9Kz8XsoOjZpqwSZWEGQCMs2dPN366F9MQQC5tT2H7j3L17qws+ae6tQW2RdOpJkEu0LdpofFDmdZedXL7sgF6Q2jrJZCCx96bzltkitW+Cl3O/KgJgxbi0l3Sn0vFdtfAAqXwdt4IX3z7TUec=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:19 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:19 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 5/6] qmp: add QMP command x-debug-virtio-queue-element
Date: Thu, 18 Mar 2021 12:29:43 -0400
Message-Id: <1616084984-11263-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb58c109-c3d2-457a-f6bd-08d8ea2b1ebe
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4565BECCCE094C84D46AEA42E8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkHf6/abJE34wfw+l03PCgRt0KcM5+6j5jOXK4PqDcck1xwu+CAMkITOgGh3jEWtE4h9T7JLNKaAQjlVTDebg6jVvXG4pmPhG88xE9X+43ft2ADCtdJpD12yxPRbJknnzx1HGtfK8En8ydd2s0RoBE30m8KyWlt64QUhj4GwI8JBt2V6KtKK+JMZE8L5xRtlrRKS3IpGUoKG/rK5HGPpbmkqzzXWvHW9SUTzB2xRL+anaPPagR1fAWN+02zAPED5D0+SfyPEiq7NQYEzlUk6o5WKoJ1WdxX/5CfQfDBnFa8/8T9ec+6+e/XeNI+D+tTiT8zfgQ/Jq34nnvidchByqU7KcAQny9tqcBVB4xFS5tcR7PhEB/l6XRBybJlZQe7tlajiwTH2s2rvHV92OrK/Jf0v/IWMT8Y+If/bb+kYmUZbKs4IWSzrCHUlVDxqmp8W7DVmvFewjmLHSoCVr7rRm3fnZyiQ2kiVELlUivRszZJVKrUfY0KxRrWa+JLeS6qJzW4B/DWAXz9OmiKTPA8vrOfYl42Iphv5b0NspS9O8ijZOANR2WsLMPsIJ3Je3LFtggUk7R3tjxL0XXSvQ3KgjdKfb6AYKE6dTnWdaz1iMZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(5660300002)(2906002)(478600001)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(83380400001)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tKAyVbDCDaUXi1ldeiFvmyeLr8sPg5nntepXAMIdFoyQ+9Zw4ZRWz7gPvpfa?=
 =?us-ascii?Q?aumzT5XFF0brHQfhpXKaBWIOUnz9IYQdzhHR9ZJDW4upX7ICAKFBJYkAj/08?=
 =?us-ascii?Q?DrJEmVogvFQdvxEwmlwdsmjebhhFTnpNDAUQcXe1fjiKiXFVDNiVxvZgHkQ2?=
 =?us-ascii?Q?phG1+qqRBfi8x/HQmQ5RZvWPGPPv/hw+9T+l3hIUBp6BNYSdSXoy4ksy3alh?=
 =?us-ascii?Q?aHr30JnnMRsdjjGGDSvAIWKpZei4R2OElGM1oBsr8J5Qb59TKtai6VJf6Pgi?=
 =?us-ascii?Q?nypJXuTHytYL7pFjym/uNKo8PZyhrckuTm8L6I96ICO0EEqLrHtghn0fkAxu?=
 =?us-ascii?Q?X5uFMIIuD1VkhII+F60hXwFadcOzdHWrR3NNg3xxvf8bxmgbpjQGJt8x2ekV?=
 =?us-ascii?Q?mlco+1y8E0z+gAyUUoiipQEAWL4azTGmxJEI8U9CJrdvH9jzMPho4Kn664FG?=
 =?us-ascii?Q?WOTLOYUPshOn5t7RnO73LAI5w5jrvEuZGKz58q+uoICviANRQGsuD87hj36v?=
 =?us-ascii?Q?tXAyc7CTuU2X/qeNEj8NBtos+rJtWGlfHDmTETZYVM+CgVVpT7R1tgpHMuCi?=
 =?us-ascii?Q?Fiaj9JPzqeFBz7yAkEBsFsJg+hlMsAsl2DicDsLOhAklxUzY9eOd9AzXvr9f?=
 =?us-ascii?Q?fILsnJ7zAZgqm/C+pINdgIU14liSy/GpX7jS2TBoNzDxwwxJ2Yxg8RBIBENn?=
 =?us-ascii?Q?eb/CrDhgqaF8RqJvw0/Nv4tvCtPwID6bwLuREY47dWwFIT/+RyiIjvhK+grJ?=
 =?us-ascii?Q?27o3JwdyFh/07XwkCsdDDya1eRcMO/PduUq8f1Dd2Fdt4LmS9mHjCYy8e0mW?=
 =?us-ascii?Q?DGs5rQx1GXshZ86CHBC4H+aZeRMemxmH+d3wLAbaFnvKpLp2PTIGyBg5OpVv?=
 =?us-ascii?Q?VZh3Z+FDKRe8mxN/Tidpw3ZyKLF5gs2wwIgIc5i2PaNkdo1Sbhs0xqLdiA5K?=
 =?us-ascii?Q?YihuL1VUeunU9hiTBa7xJtUIYmre1oF90UdimMLzr5KPb9V98S+E8VufWFZW?=
 =?us-ascii?Q?7i3RT7NQBCdA9NwLMfCY874/GMuRuiuVAhPDENzb0XC35g0jfxVZCBVr6wTw?=
 =?us-ascii?Q?2JU2FNlOIi3oRbaU7UZHVwLhVlbGrY9tHpp7QZqfubH9JnNXqPCAlvgW0RKW?=
 =?us-ascii?Q?TFGaY5qiYi0cdPzsvltzPED+aJL9Hec2kIzmKqvWOOPckVmaP7pq6uSXtsfs?=
 =?us-ascii?Q?GbqyPLkEb9E1LyBff5odFkoNcn/5EoLBkGDab1joxgkqyN/mRVKBAbYue39D?=
 =?us-ascii?Q?868ov+E86XNS7/0wkcIJ7jN7fxvuoFo8BMtK6ElwXBVjaA9QkPHq50bhnkaf?=
 =?us-ascii?Q?VHegKHg4jZN3BU+oBhyVAABw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb58c109-c3d2-457a-f6bd-08d8ea2b1ebe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:19.4414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmH4M78LHiSebXq72st6vYFx83mptTk0VXnrCAXNqwyOPruGaIrv2McZ55kEUb9WoKJOVA1QKflyZPdEXIVooA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180115
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=jonah.palmer@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the information of a VirtQueue element.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 ++++
 hw/virtio/virtio.c      | 135 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        |  94 +++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 3c1bf17..8275e31 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -23,3 +23,12 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char* path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index d9b5734..735a6ae 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4090,6 +4090,141 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     return status;
 }
 
+static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    VirtioRingDescFlagsList *list = NULL;
+    VirtioRingDescFlagsList *node;
+    int i;
+    struct {
+        uint16_t flag;
+        VirtioRingDescFlags value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, VIRTIO_RING_DESC_FLAGS_NEXT },
+        { VRING_DESC_F_WRITE, VIRTIO_RING_DESC_FLAGS_WRITE },
+        { VRING_DESC_F_INDIRECT, VIRTIO_RING_DESC_FLAGS_INDIRECT },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, VIRTIO_RING_DESC_FLAGS_AVAIL },
+        { 1 << VRING_PACKED_DESC_F_USED, VIRTIO_RING_DESC_FLAGS_USED },
+        { 0, -1 }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(VirtioRingDescFlagsList));
+        node->value = map[i].value;
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char* path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->index = head;
+        element->ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (element->ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            element->ndescs++;
+
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index ab94263..3d4ba1f 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -504,3 +504,97 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtQueueStatus'
 }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.0
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: descriptor flags
+#
+# Since: 6.0
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': {
+    'addr': 'uint64',
+    'len': 'uint32',
+    'flags': [ 'VirtioRingDescFlags' ]
+  }
+}
+
+##
+# @VirtioQueueElement:
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
+#
+# Since: 6.0
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': {
+    'index': 'uint32',
+    'ndescs': 'uint32',
+    'descs': ['VirtioRingDesc']
+  }
+}
+
+##
+# @x-debug-virtio-queue-element:
+#
+# Return the information about an element queue (by default head)
+#
+# @path: QOBject path of the VirtIODevice
+#
+# @queue: queue number to examine
+#
+# @index: the index in the queue, by default head
+#
+# Returns: the element information
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#          "queue": 0
+#      }
+#   }
+# -> { "return": {
+#         "index": 24,
+#         "ndescs": 1,
+#         "descs": [
+#             { "flags": ["write"], "len": 1536, "addr": 2027557376 }
+#         ]
+#      }
+#   }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement'
+}
-- 
1.8.3.1


