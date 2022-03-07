Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12A4D000B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:28:53 +0100 (CET)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDPw-0001mK-8t
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7i-0007Uo-VK; Mon, 07 Mar 2022 08:10:03 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7d-0000Tg-4p; Mon, 07 Mar 2022 08:10:00 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C3Ert009954; 
 Mon, 7 Mar 2022 13:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hTbMIhzgjziEEPk1Affun57zuvtGTjdTHq76al7jlqI=;
 b=y03W38dEpP8lmjTVg81sCd6DqD1Q8wgdM4NRd6mhb3HjAS8N3S0OxBb7kg7LfYufVcI0
 ezLJsbABjHmDvUyAz9wKg/1zjvabdlstTnU68KFmL17yINqtYU2hizy+PRtoS19mXJal
 q9lNF1i0gtK1rKsoPD/fMXZzr47+xgzM30ps9YZADiQrV16XeHzQvWnuDYQodi4Iaps9
 GsgmF3oyoPL5sOA5fyIOfujGaO9nxICc5uJ3fJTxIKREeYySnQVvz/jQYmNHRpXKBcmF
 yIW4EQQ5aCQEROQigvt9J6hIMgF4nxhbj9MTRZwQhUnrDPEOgGugQKYDO3Ux5BsgryBH jA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyraknmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D7FhC063397;
 Mon, 7 Mar 2022 13:09:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 3em1ahyv0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktAxbTzsAgkj/hJDZQW8KKrLrhhsxc1QrPHTDl3iruGpgJr/jqz19SnEpJy01yet0IlzL84lBFqfV2sLo789SNN6+oLYZYORrslef6mBq5Sm/kVQhdauAZFciwhBXWj+f9kwIHBkqZNwQqUtSsLMWUJQEmnVRZ6w8RpDaRG7k9uMfrotAkambKKqpmTsxlVSS0hE7iSQHjJA7xBn7NZq/TVECcGj/JI0W3sTrPmlxW6dJjT8rDv3ZqLK90REUaIHHAfgO2+Y4USprPsGMNrE9r0zIqgYb23CrVwNT/nXo9Z8Db2mxc+EwdRGR934lHxKCAQw4PrXjklBg3aLdC/zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTbMIhzgjziEEPk1Affun57zuvtGTjdTHq76al7jlqI=;
 b=bHrZsJ6gvQN9+9CjbSj39okKjYh2r21UeWmD0LcWaFNibNFIEJ9upX/8aJbwOM6prDCtXrO/9ArEpGdiBWkDdeXZDbe8JO5qHgfUih0JQ6hWVHv1pgUWo+J54LOHQmnRvfZxs9oFNWdBnhM8wj9vU57vvrWMfujFgfHL9WgvfGwcEqDmLAvtyjn5dcY/zWYj9OSrFebQS2x7YLXREFYTz977HIdadUcPXyqpV9niynjQstrzuENk4/Q4DjNq+pga4g1FNRJoJW1tvzenTQkEjd12GZhncZ2EhK0Qnu1NS3mAxExWDrRlGlRfTxrjAvx5EF64HqfUNXfnHkiu/p9O9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTbMIhzgjziEEPk1Affun57zuvtGTjdTHq76al7jlqI=;
 b=c4LMNcnNc35WFXw/9HxRsZkV1BFn/+OjG4nYQ8/TGQWuJOMSGynuz+4KNnfuQAFajIMaSknuwx6jB08NkYYIGvk1iuCZBJ2Z3FqbQsNpLD7wry7WsjnOtK9/K9+KoCkc5CS4Oq73RsatX0TkdooA8RpF+A3uLxqDtvhL4Q/wqfU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:34 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:34 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 7/8] qmp: add QMP command x-query-virtio-queue-element
Date: Mon,  7 Mar 2022 08:08:40 -0500
Message-Id: <1646658521-31652-8-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dce7e8f-a24d-401e-5847-08da003bb9c5
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608DA2ABA20F01DEA2DB17DE8089@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xiqY5Rt1EoLulVQ79UYq8pGpbQt6cokkqTI5Ve8dNITZMhVjjSsj8ENsxPsfWLQadEqQ5gRWlUJQ8aBAf04b9JKiLsXjZ3VOIGZnOcRIKV/JiuOTWtV8xJpNflJGh2sxzSrGImNBk4ZXXT8NLj4NsVefm0TZd9UY8LjBuKM2aThHAY1iZ6LVIA5pFqJxKvz0OcZ+pRQCNtTtmRAxl6UlV7rj5KDpbWFC6XATwJyJYVoxkXzhy2XjAYQheT8xc3l/FoXdyAr1zP0R0c+p4Q9e/ZCzP6YB/KbBRTjOs97ils1vUkCkKiRz4JNovTFNV3g4xlkG5wWFE6EDoead/1bwKZxt/dUwXLEwzfEPBuCzRgyrJm1Y469HfY5ACenhPZY8R0YyMxUEnC0q3RqbwzHd8xpe/T1FODqyir0kpMeSaPOFrLgYG+nr/deTjPoDJmgi4rH4qo8yw6Ztp09YJN0QJqwvoVtiiJvdSs226A0jZ1UvGnVJX17aJZekSZmFbRugdBLc2fJ/dIOs24oemq/HqDgtMQ1rwJ8jfHlxhxWKs+nT7QVHWjhULNx3TjMQARekRCiH2lQ89KUa3fuw8z/PrD5zWlGruOXBrd8ykwvE12Dozm7Dfz5vr4OeS6hM8CglQZv6lbawi0jj3Hrea6ESkfH0LMLm76D6/IopRlGyeQ/VdRhL9oFIzL7M2H4rW07543i6DEav45wGzaPRkQySg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(44832011)(86362001)(26005)(186003)(38100700002)(6916009)(316002)(38350700002)(2906002)(8676002)(66946007)(4326008)(66476007)(66556008)(8936002)(5660300002)(7416002)(6666004)(6506007)(6512007)(52116002)(6486002)(36756003)(508600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hlo835RQ/1Zjs5gIXa6OIFOcNiz/Qvl50wFs4VrKimCyXo+AFiC/7gblPrBL?=
 =?us-ascii?Q?k5pknavArAGVY/qWl7Wp7xbkgZAojWJ0s4FWjE340yh6xIKKw3lcsUwUKnpO?=
 =?us-ascii?Q?3WUBh2N/LCKt+odJiquuDwNM2gBTAEKxrepWUMb4pd+CzkmNmpgim3FdskKX?=
 =?us-ascii?Q?MkplXT29OCbd8fdqrTasqFgJlZC4nMw0/BV4oRTBSj6GnI0I9LaRyUITfN8D?=
 =?us-ascii?Q?rtPxWvHmc8SypPFPrOOFFCtPDhnqCoHhigIeYOLEBA1FXAm5a54FeWgumlBl?=
 =?us-ascii?Q?LGQVehRVsUOz53TtG4J+cvgIKrUTzBBo1WkAr3iGPbtMqcTz8mkMjqOKjQQg?=
 =?us-ascii?Q?xsqAU49Fv+n1PhQyJA+faYeBuZ5JfkHxHnUMwT465j9wA0xBNVRQHPtp4YGE?=
 =?us-ascii?Q?XMKzmAMla27ubv0KXLWhYGQJSLFLaF6WzE+fb2YsEoFd7956Fbm6kC8uXduj?=
 =?us-ascii?Q?GkdLyxAr66h9lQHYvm8VRtaUfBTs+ycRctuUANk6fO+Qcd9r5iTAdnKr3fh7?=
 =?us-ascii?Q?uqG9SF+Sk0SChSb09ylMt2gsvLS7u6fBQc3MxemUAeWfEebRsDfhbu5NAn/c?=
 =?us-ascii?Q?N8l2LGGecJA3wVugnC2A1IhoMNr46ZeXobgvv1gWDaWpffYairwDqLnfVkWT?=
 =?us-ascii?Q?1NNY3fJm3rE+qPexQpadZJ71HRFWn21Bzg5QFTLo5UrGeegm9SzDSGBWOG//?=
 =?us-ascii?Q?hUQWhdX5DsDI8akzrIITZg0IoYazLHmS0uG0jcG+Q3eywreHN/ymQRjChklS?=
 =?us-ascii?Q?0636Dy3DuWdGxml/gvojwOHf8GBw/Rm/8f7vhENE3s0RrVqyg5JCBX2x/C6L?=
 =?us-ascii?Q?LJ28yOviE5+qHGOVCV/jcvIrtnWmfwp6vrB7L5JzE9njCv4ruJpN1J2cXTql?=
 =?us-ascii?Q?GyoOx/4taCRja59ogLk3pNvLXa4uf7Ub1uEi2T1J5vInLixVVcLksxwRTSJR?=
 =?us-ascii?Q?u1Kz1u/PLZYS/doeCkIqpKux1RtiUmkJfxOlfqpAzc+SxLWIGPa0+2t9ijLA?=
 =?us-ascii?Q?PUsg0T3soRicxFYCm6coyT3Wj6ql1F2orHzkslta/Z8Vp3BPrUwF9F5Tryvd?=
 =?us-ascii?Q?Mh4NLzBf995b2gxXTiUdGOOVZCS3CKX8PQUJDQpUa3fSgon3n1dOiRLZ4a3j?=
 =?us-ascii?Q?py0rQ02kHZXJ3KZFu32MjH3GLO8KLMkmp3KHuUhB87q1DfgpvOyGZ0ZkAirp?=
 =?us-ascii?Q?PwJslZV3zfU64EWZIf5PLjW9o1A+OnTT8u4DX3xQ59OnpdbeVjkjbD34xABH?=
 =?us-ascii?Q?H/eAT4vASdRaSAt+/JOVuJahAH6LyxPsgMqMxVcMoSurAix3FX/PTYqZPLfM?=
 =?us-ascii?Q?tUEFgcsCKdIoYeycw2/J90PPbnGVBD7msvS7woA3/p88cUlZ3ZaP6lNfskwz?=
 =?us-ascii?Q?ge4/WV28IJNinY62mRZqDpprHdQo8iBd28qIlhW3hHBOTelpVp7oqYj1BLeD?=
 =?us-ascii?Q?0Wsx/GtbHBl2hBk2dz6Oak60JQ2fvxnqirDusY46rHWzNNLHs2f6iZXKJt+g?=
 =?us-ascii?Q?GvfKu/pYecFs9NuWzwn8iV+UNdqX68Idenk//f7SB5MT6IVlt5Y9mhNLdYQa?=
 =?us-ascii?Q?/mkyVlzC7e6zwLos8oO7hbBlP9Mc7Na/apEfRdckPWvyRRQHiOymAVY20Jq6?=
 =?us-ascii?Q?I7y/809Sxn+kvfe2yBF41jE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dce7e8f-a24d-401e-5847-08da003bb9c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:34.7384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQqnAHmTU/eOpDG/F9miixUkKjbI3209GWtt3L5DsBOth39NcYCOS3vDPRFU1Zn4/j1ksmh2N1RUYFMXEg6tlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070076
X-Proofpoint-GUID: lTto94oDzdFdL7i8Rn6eSTUEWM1u6cYE
X-Proofpoint-ORIG-GUID: lTto94oDzdFdL7i8Rn6eSTUEWM1u6cYE
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

This new command shows the information of a VirtQueue element.

[Note: Up until v10 of this patch series, virtio.json had many (15+)
 enums defined (e.g. decoded device features, statuses, etc.). In v10
 most of these enums were removed and replaced with string literals.
 By doing this we get (1) simpler schema, (2) smaller generated code,
 and (3) less maintenance burden for when new things are added (e.g.
 devices, device features, etc.).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 +++
 hw/virtio/virtio.c      | 154 ++++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 183 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 13e5f93..7ddb22c 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 8723a53..d45b8dd 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -489,6 +489,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4415,6 +4428,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     return status;
 }
 
+static strList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    strList *list = NULL;
+    strList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        const char *value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, "next" },
+        { VRING_DESC_F_WRITE, "write" },
+        { VRING_DESC_F_INDIRECT, "indirect" },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, "avail" },
+        { 1 << VRING_PACKED_DESC_F_USED, "used" },
+        { 0, "" }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(strList));
+        node->value = g_strdup(map[i].value);
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
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
+        int rc; int ndescs;
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
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->name = g_strdup(vdev->name);
+        element->index = head;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+        ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (ndescs >= max) {
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
+            ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
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
index 44cc05c..99b9064 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -656,3 +656,186 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the vring descriptor area
+#
+# @addr: Guest physical address of the descriptor area
+#
+# @len: Length of the descriptor area
+#
+# @flags: List of descriptor flags
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'str' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail vring (a.k.a. driver area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used vring (a.k.a. device area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue's VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @index: Index of the element in the queue
+#
+# @descs: List of descriptors (VirtioRingDesc)
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'name': 'str',
+            'index': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue's VirtQueueElement
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#         (default: head of the queue)
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Introspect on virtio-net's VirtQueue 0 at index 5
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                     "queue": 0,
+#                     "index": 5 }
+#    }
+# <- { "return": {
+#            "index": 5,
+#            "name": "virtio-net",
+#            "descs": [
+#               { "flags": ["write"], "len": 1536, "addr": 5257305600 }
+#            ],
+#            "avail": {
+#               "idx": 256,
+#               "flags": 0,
+#               "ring": 5
+#            },
+#            "used": {
+#               "idx": 13,
+#               "flags": 0
+#            },
+#    }
+#
+# 2. Introspect on virtio-crypto's VirtQueue 1 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "index": 0,
+#            "name": "virtio-crypto",
+#            "descs": [
+#               { "flags": [], "len": 0, "addr": 8080268923184214134 }
+#            ],
+#            "avail": {
+#               "idx": 280,
+#               "flags": 0,
+#               "ring": 0
+#            },
+#            "used": {
+#               "idx": 280,
+#               "flags": 0
+#            }
+#    }
+#
+# 3. Introspect on virtio-scsi's VirtQueue 2 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                     "queue": 2 }
+#    }
+# <- { "return": {
+#            "index": 19,
+#            "name": "virtio-scsi",
+#            "descs": [
+#               { "flags": ["used", "indirect", "write"], "len": 4099327944,
+#                 "addr": 12055409292258155293 }
+#            ],
+#            "avail": {
+#               "idx": 1147,
+#               "flags": 0,
+#               "ring": 19
+#            },
+#            "used": {
+#               "idx": 280,
+#               "flags": 0
+#            }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1


