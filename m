Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40114CFFE2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:22:52 +0100 (CET)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDK5-0002b6-QJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7g-0007Sg-QA; Mon, 07 Mar 2022 08:10:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7Q-0000Sb-DF; Mon, 07 Mar 2022 08:09:57 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227Bgfkn008819; 
 Mon, 7 Mar 2022 13:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Oeizfcx6ghfbN+v8NBJUtaUldcms17wOoJG43XBOgnc=;
 b=ysmPFK9kOfo52/bldXfShhW1DOCuT9QcsHQkAPJZ3yXtl546PHXUiVFwFcwnN/V+mZ1v
 eKJrgyr1LjhjnAzO8iC8joRUJGMQZWAIgaUoJJW445lRd3ePehtJQ5ZNX36ubrMJgBij
 U4Ge10aBVBjOO8/kO5sr0LYi0za8v/NXMQfXgpe3mo9/M2Ll9gjsbQeW8YLo2pW27nz+
 /PagC0eI2YhqSWWFcqwXg8dxSg6BnWdMTgHcWzbSU+2mLtfmMC+xCuNtOb3fyTLg6Krh
 XATjGEpl/W+/EsLYlGx35FENfMIvEKu0PF/RFbrgYsPQ33tsTMf3kQAUPYrODM1GQQ1e jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0ktex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D5CY2070324;
 Mon, 7 Mar 2022 13:09:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 3ekyp15pc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9JdAgsVGAhJDhZPIgE3GdrE10hMq1Ws4j6ex1snzMfwdPkQW9JORgQCKFXHbl2EhFzuX7QGt5x0/LsPGKOdOmOnjV+TiUCgMp6hDrBady1OLfEzDmTVWTg398Ay/FR30eXvN83S680ZxD6jH+WG178nZY90m1m7oLEZvndlNdvnmcYTI+BD3avsR7tsmgZa11zMDFdEIQlIcktcQ57IO6eWC+TYAR1uy+L94hB5IcebuZoBpEX4lSgFY+lPt1Odu/xBSFwK8rz6phVhfS823P8E48vcpzPIQ2Uk1SKCB4RVVfJHRPZ9rv/w4Pnfi+zttLN3I9Psk15th78q2jxwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oeizfcx6ghfbN+v8NBJUtaUldcms17wOoJG43XBOgnc=;
 b=aGHwyNCOXzp1PGKFrWfJl5F0hbSqWQ6Bex1qmANgOVa9QFcvasaIWTMlbEggJ78qY4Bp5a78GNSlq1oQeaRaUgZdqXKiH2vj0/jXTKA8bE2zDZ1PhsxX9f3m1OfHa2SKAiswwvRoobGWVbplJh82/yjOCzlK0n9cAFceY9aM9ElCxSLUX+kyVb6KnLAqZe180Cq1B/p+NT0S84oqST+IutyKW/aVO6T6j3UGkQZjHJ/teEa56Xj1zZag2s9q1FvDrEXVuaWxeHeToF4zIxEc+7RZ1/LxBtQAb7cYeU3kDzwr1EUsFkyQwCLeQIXWA3e5SzaHwYyBV0typQvvj6K1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oeizfcx6ghfbN+v8NBJUtaUldcms17wOoJG43XBOgnc=;
 b=sSWS+u0ldIu4h/hwpiVqC8NQnBJHFMqzbEl9SHdZxfntxVGTS12bOXGzMHHNhH8cdTfUrTlwG6ErKKQKoshnw7jQB4H6NVt23QJa4gMv++/vI1xCquva2Fq4hopbuhQYT0/JvtP8fWc+qgID2roooW7QCEo02sOVHyJLAELSyCM=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:25 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:25 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 4/8] qmp: add QMP command x-query-virtio-status
Date: Mon,  7 Mar 2022 08:08:37 -0500
Message-Id: <1646658521-31652-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b1ab8f-176e-43f4-1179-08da003bb452
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB56081141075E8B0D464D8B25E8089@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkmjPfk8ld7Kt5Khiu4GEnFm+1/S7tc0eZJs3vshRkDgiqggTvzbJHQsDrEtpsARiuzR1syStcakEL430VqpkqKSWJwhruirzNNiAmqiug9sALliBuHOI/vCN473KcdlqxOR9+MvNa2cRx/+0x0VxW5YMKzKM4I722qsJZPnTazwyyrG9FJP0lPcUZJXObobu8DqLXYLwphhG98NkwLkNEBxkBl57PsDd8EwjAUP4ilzuZhfG5pnCYubpRXPMjWj0rLKeKUwccU90tqiZTEuUH6RNw8OUnAEi5kfzo1jHWnKqWxrdWouERDzV5cW91U/fTGvu3n7+iJ12dDY7sYBIzJaCgl7fWAYu4LJqrtIzuQQpZllRMiUVy3O98pdl/xZMptXmv0Z1T0WHLCu/UHrCgjBlbHxWQ2yDTJvnjbh1R754MwDtXzEtXPdngowJj2wh76groMh6uxKHoea7xSm4MnpOYNzGgoJVmay3WJisnHxw421vBFDoyw8t4VqCqlnhRaDLA/7BCDuXrFTaAxDda4zteRq1e+xCTttN6qrPBeHSOlsSSbiUywCv7yOMnXXkqz7wnpWFklzt2ySyQZuOpp+ySVMp3a0PBwt/45bl5KwuVUV87YW1+8CXoxKiLZBsKWt3yfveewn2KFf4Tw2i/W5Nh/7DXIh2iX9/DsFoVnjEllaW7EV/hUUEHFUeH4Y1tKQ9N1+yuU5j95KAdHiGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(44832011)(30864003)(86362001)(26005)(186003)(38100700002)(6916009)(316002)(38350700002)(2906002)(8676002)(66946007)(4326008)(66476007)(66556008)(8936002)(5660300002)(7416002)(6666004)(6506007)(6512007)(52116002)(6486002)(36756003)(508600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gahMtxjJbUG2Nx0yvsS21ofPa9k6ByTzq3S/kf6asl/Fv3kQeLR7R5lVqHKt?=
 =?us-ascii?Q?tTQ6FKlyR9VcLElYSnWEz4Z/WwHxRpMOn3Q2DG6BkjA5aQ6P3fbD5zlmYofm?=
 =?us-ascii?Q?OED/tKCooaemlog24nfXxRJGHKG2o73Fgn9LnugHICczt4WCl/178mSXQ7Ns?=
 =?us-ascii?Q?kXZt2nf/HJSk9kmnC3UWAns5Mi8nFfaNj6gOberGm8qwDGcwg2y0RSpKUl5R?=
 =?us-ascii?Q?kQQJd9gl3pBW0XEUUm1a+R+XVj7329e6b8pGB3PDBemRsR2G1cx8V5WOGAeR?=
 =?us-ascii?Q?PAuYsM+qkkIzXNYqlYIOpqFG5Yvm3gVPbSeJ52mW5u5fGpL++iMcStLEn57D?=
 =?us-ascii?Q?g593DTMneBTn+MektArKpnAppdaQNwk3mug1O/6lUHeCLba9WTKwb9iBg7D0?=
 =?us-ascii?Q?00gsdVxuOieT2kjc6gmzbPSwUDxi1HNMQrdyJSye3JAUT3B2CG+WdpDiNENj?=
 =?us-ascii?Q?v/Uvwem4/8OlSxLBYS9UpJNfrgTFRp04G/JiTPCBxocY8COlbIrb5fwHagWS?=
 =?us-ascii?Q?tlV8cxW+pmp/mV/HWDmpsW1GtkzeTWrJ44jPUFtCx/ysmS+IsFTgbCxetu10?=
 =?us-ascii?Q?fDYDxXlAQEVlxz8AXUgjSHKwY/feVDDjkey3lzd+44FGcq/oH+s+YnN/XjNR?=
 =?us-ascii?Q?Nlhqir4gPKw4G0e4SlHVI2KjbZTKpm4rImzFKL5PJXUSI+89Gukl/NRlO/kZ?=
 =?us-ascii?Q?LtcnUdNk0L4vIANR4/6EqmMJw6G4OQ7Jp+Yz0ZsdZtvbbNj5O0TwBFeSMeqH?=
 =?us-ascii?Q?SpeUBJPlqGbv6UtpTw4ZHF1HkB2AFIq8Zkx/iYuelksH6W8vRmm6u6k/hOap?=
 =?us-ascii?Q?jW/QWnuSdyD/g46JzOuQdi6sBzXuKnmEo7LWrLbEoJ9aJdzBy53vgJ7l+sdf?=
 =?us-ascii?Q?xzNzj9kc8GXSScZg8z26UNGNfvz79A6koMJqHO9J2LNPLw/mN3PbKF8l1v31?=
 =?us-ascii?Q?ObcTdlytnv7wB/l2icvs2L3KYYkWohmHY2UbZ0lMw+JQLT3EZrQqWQYJLqZ6?=
 =?us-ascii?Q?NPrDw/2hw240Cr//Mj2OVsOLlpLO1dxt1R8R2b8jsTShoO+vDUruZA8Hm3t9?=
 =?us-ascii?Q?fAbwBJq8m9tza8YJ4WPWsyLD4OvS0xEQTnBwwdwlIjI3EkD07CNKCW19GSfF?=
 =?us-ascii?Q?ww0b4TCvLjRhjqQIkn4JJJmjjAkzksDoykbuTyxCkHox/4LkGYtzLMkvcDki?=
 =?us-ascii?Q?Gc7hZ+23viSUbqRsteTrYixAN8DEzQrQq5TaUd4IQyz/QZ6kEJdA/HVytBwB?=
 =?us-ascii?Q?AWssDjWeDe4mVT+UgkwggoKelue3U29rD0jhxlGLhFsGnd4E4zdJSq3FchRl?=
 =?us-ascii?Q?qZAtVShGS4uJh4RY6FtZmfnY+rl+bKm3CrR2SubYlbM1f32EdbLeZ63kNvM+?=
 =?us-ascii?Q?sUfhJx/K9ItA440owYhKQfoCGvHksQ7MPYAQsrncrS9vv/jQH2g3gKgU4Pxd?=
 =?us-ascii?Q?RpQO2ylKjL5sp+LxmK62v9xs5jPvQPFSs/uc6G+H4/QRG7y8PMvLiy/03Q18?=
 =?us-ascii?Q?Y2d0tjmpmVrDAunX1l+uBcO4LyemBqmQZK96rOtHOkFKOn9xS6CB5NCnBYhg?=
 =?us-ascii?Q?NCK0SkcpJJ+YCDn5myR93WWfMC+W5XmpZK9pfNOvJo0R4jz6UbCn8/6RLmgE?=
 =?us-ascii?Q?9K0MjzkxO6/4uBWF+agHgpA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b1ab8f-176e-43f4-1179-08da003bb452
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:25.6256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT4MPo+I0N5/Tyd+V9BvAODSF5M8i4/Kbsau2I/Doau8J20F58+IO4o6xlvi0pA2XqK8ysVvMjDx8cE+kbyCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070076
X-Proofpoint-ORIG-GUID: WRvoojmf3qZl4J-qQ4qCXH_rCS66AzfU
X-Proofpoint-GUID: WRvoojmf3qZl4J-qQ4qCXH_rCS66AzfU
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

[Jonah: From patch v12; added a check to @virtio_device_find
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
index dd02909..59665f7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3927,6 +3927,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
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


