Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3334A128
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:50:14 +0100 (CET)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfML-0000UF-VS
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHv-0003bS-B1; Fri, 26 Mar 2021 01:45:39 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHm-0004EN-I2; Fri, 26 Mar 2021 01:45:39 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5iLER164277;
 Fri, 26 Mar 2021 05:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dKS7UZVS/9MljmYisshOPIWAJHJw9qDGw2K13h7Pq9M=;
 b=QwqrkJJL314pzFzwuqpX4GVT8ztdMS5tLOBYWwSlLjg2218cyr6vjty1pyvaJrkLsMLL
 tws5bO6ZCrIyatMRsbCrZ/0F9oVzlmfWdDDMI3vXFV8uqHEoL6XjiOef4Lbbt+AxFAiQ
 ITpNy/vQg0YbjQXJyCM7WQJ/FRkeg4tS1Tl03L1dHPumRNw+dRUGHKYrw3ra0M21U/lz
 PxU80dw+7opXshgtGW/MQbORP3tSm6m9qk6ac/ceVFs/fXTa/Z5MADmTV5jKtiGYC5Uc
 UcL0/OxU8TIW6kXZErc/2ju4kT7Y2mjyciphS0MgYJIFwVM9cZ1vCWcul6EmKKZJFWcQ Sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37h13hrvnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5jJET138174;
 Fri, 26 Mar 2021 05:45:24 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by aserp3030.oracle.com with ESMTP id 37h140yy68-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1yz6TkhFBSP4cgDpFkL+4I4LBwahu+9BIp6fBlhUCXpmDQz96mkauMiyEzyvmQdufsJ64B24+3AS6YQrW7AxhngEYWiwgAdVsHQga3Q8b/U8poyJE19MDXT5HUaTIGM/UDw+tEytLr0qpNeIoG6V/11PQvH2E/KNPDjK1MFNmdsTtJfy4TNgh8ax2GstI5nTikhxADMuEV8uOwd2ekisBVFBiad2WiEs3FTLkWoOIatDPiW8wJdvogOtKcfwoySOlWX0LhKNRh/nCe8OA7cFl2Nj/GDFSKmEsNlN4VhFlPaVEXfMHnHJhwSUvjsreYvVm3OzrXcDUri3wjB+941+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKS7UZVS/9MljmYisshOPIWAJHJw9qDGw2K13h7Pq9M=;
 b=oOMN9waX1DxKkIBPrOpwguPAAfdreuIfn5Ou8ZVQGKGjnzXK6JCeKJFBiIFro3OXF7Zt9JAFd+RHegyrHHncEop+Hl+/H9MWaf/Pd6yd9OpuEG+RnHhZQOBjrGw8kx9dwRMPLcn13M/9Y8jiMJSJXThLEIa8eTndJIq3bcs31LEQmQ0UG6vuVZ0/cZUPS5ha6/oOAeyorZdjlmQbBIY3AxpsYdjmjeM8dlLj4w5A4uyxUbBhi4do/MpXCVg9S9m7jFU+pdvownUOO/iLNT4HXEowuUYOv1DDzbP88Dr53OjXViD5kdxoLCbkQN/s1ngCXmrKB2esdioL55GQyNPXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKS7UZVS/9MljmYisshOPIWAJHJw9qDGw2K13h7Pq9M=;
 b=rdRVAmk0+/FNsGd+mxAGwvjRG9Ghh2DWYBeCkUqZ9qVYnRRoq8jrZOPF1gBH+FNHCogtFiag5TWN5tMv2BTJYJGmENOneZ+uk50ADVf+r7tIEfZSh8J/QZtCe48O2hjH+YudEkHFPas7vjlJ1j6N9VRiR7AnVX3bpGAe/oiLvCw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:09 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:09 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/6] vhost-scsi-pci: implement device event interface for
 kick/call
Date: Thu, 25 Mar 2021 22:44:32 -0700
Message-Id: <20210326054433.11762-6-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e38a7823-8128-46f6-ebed-08d8f01a50e1
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3068ECC6556F2D24F3E0D850F0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EopLsMj2ONpMugVU0ImsO5x/DnNJwTo17L8QndW8k9PwYf2zRkx+Z/7/YaDD5Yx07yxoZIYZtQmReCGV+pQJSPqVXo6XCOemAHPWGllQWeRPsV2WnWgsQMbqyxEnystT42/rIGz8iJnZ4vkFQuro70G81tjny54ja9PSxygLNHW/iumfKtHqDrynHbE0gZt8qIBRlgAryCcuDkGzMsW2V3F0FeY+pefHIAzE8L5ZPWnKczJFDqbCeApRopsI3ZtlgurC9ZLLGc1/dFIe1GumsUo0sRduNrY/d9alhZhMl5D0bZN9XtAOtN66MPG8o1v73KVuTXAbTTiyYvhpotSRK0U+NTykWaAHfUJdcZN21A2H2hG2UJ3bSr7uFxfkCQ5LIkX0BWMpyvSRN1NcZhPkXo6kfMGNbYo7DNewtBsdQMfDpgOtd/uGpchVGkFpFXBvH/RPP/TgElXjkZfv6D2Br6CuCvuBnybFhkMmFw9USZkkrUyll0aiZHisd6yHcHWclMOEvLx5scFaCSE5JAHpcPsnngFIrRtvVxZg162f6GOYScfyPGTQm70IzPiGG3c7Zxe3uflS86WjFvls02bx0Eqo1m0d4/obacgBaVnewwTZqlOhHWNrN20kCx2zi94YvD/5DxqkkHBDWOnmq+l6rDrX8TJa6BgSfNA41MR6FKsUBy7rsNXgZsdKEjqNGSCQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(7416002)(6506007)(186003)(6486002)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4kd8aCN1h3oODS7TdroiyaJleYE9IPQUX074qCjgyrWj852+BR50Jm2bxa+Q?=
 =?us-ascii?Q?5a5u43Z26CL6Za0UchX+k6fF7k5Y+Yz/Ulh4VnJNDXjjI/5+7+fKfbZlRYaA?=
 =?us-ascii?Q?6ECIEV7Wm861/TwBPTe6Y8lUQ8R+bPWpbN4iJlLGx9xgp72j6kPiXFUNHBCL?=
 =?us-ascii?Q?OZyceGpFxYD+WX/+Et1eiu4hPw9Vk++5VRmTi4YbgywQHRNwvWrUgGSRzBVO?=
 =?us-ascii?Q?fDE5s7EPYYFjJfrLFW0BrNl74huig8OonlMXtGTUi1LV8k9tWaGm6I4kLm7w?=
 =?us-ascii?Q?vGPSoe1/RGwQtngXKtjAQg0B26wg3lkWylrNhas5MfCc4kbciF7DLh0C2QAO?=
 =?us-ascii?Q?IilCEQJeaBfROD3Dm5PY/s9S0jUgIYTF+KARk9Ifepj+cbUD4UNeTDeYlFnB?=
 =?us-ascii?Q?TPgea3aJwHRnRg/v8XQ4XrLALYM2nG9yeTYdJ84RYZL0PLvH7IurZyx+zto7?=
 =?us-ascii?Q?SbBGC/JaME1L3mYnoURsqDxxYcummWokt2FEDvq88HSxJaup8Q/zgT+rnrzW?=
 =?us-ascii?Q?kbVivSKiaQfJXuieduPhylfGwP0DbjZYc0abFFF07cWe9f22BVdVME5OCV9u?=
 =?us-ascii?Q?n6RHWLF2DS1YJDiBn5IZzQWuQpCoLfQyHnEtA8Z4+KcvtCMe6hLhRTt8hfhl?=
 =?us-ascii?Q?dfS9xp2OblQPCuaRaBcDa1wzUIdFRjsfJ1M2f3QgE/Ckt8jPQcvI1rmKdABh?=
 =?us-ascii?Q?pVT2JHC6SSgAbp8sC1RJOWqnA2Kc51vsPq6J17ZtpvwR+NqI5+bxvtDv8/vL?=
 =?us-ascii?Q?qjx4kjJ7DuMDlIhw/Ja0p/Y7WUolbNnAlTidbm3g3F9fyj/c7Edk3qcB0N9b?=
 =?us-ascii?Q?UDBB73/9n1smASN072BfDaUvgYVmDnD9UHw1UaTgakqZgm65ixyqfcTKhhFO?=
 =?us-ascii?Q?NGB/Ygl0U3t9twYNo16djfnbFTk1wFOqMSclNp671s1kazXu0Q7QzshtWz5W?=
 =?us-ascii?Q?r/nBs5p4BDe56B4g3NJ5arcxkOEQuEk2CL+jbUmdfInQ8Kex/VxnXES//i9U?=
 =?us-ascii?Q?NqXTYzJ2sZkSgEKVwNfTfRW41K9PyOuBKko1/WgbBmfsWUw//iqX5jNCjoor?=
 =?us-ascii?Q?Q5wRHPj2Uh0tUfRxFshHeO4k1zkz/1Y13s9CTzOm70wtAisrpyP1zCcEFRao?=
 =?us-ascii?Q?vZXlb5gKYnRO8cLSX3P08cEAcGdXv/2m9XuBfz0c2iuumA8fZKkrSfUeT8QS?=
 =?us-ascii?Q?5Kpc7OaO2ZsnWVfoZlvF4pOUPnXXctFtxx+3nk3Xvn2PrDscA5cpJ4huno9/?=
 =?us-ascii?Q?APdmuk8Stgk4RRfXYA3A4Pg7UlkWQxsTeCkHR0KEKKpgXPZaMDypji9qrzYl?=
 =?us-ascii?Q?T/tCvxJlB12XrX9+GTr/FC9O?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38a7823-8128-46f6-ebed-08d8f01a50e1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:09.3762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RO0QeINBxf37zmMxxiYgTPHaAOI5AY8UOMtg+XfJSZbUyUb1jp/CE71QjYkRnp1qsPnVa7t8asoFHjuiUxY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
X-Proofpoint-GUID: xlCDIaY88qvEcxTektITJcVHqHLNw61J
X-Proofpoint-ORIG-GUID: xlCDIaY88qvEcxTektITJcVHqHLNw61J
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260041
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is to implement the device event interface for vhost-scsi-pci.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/scsi/vhost-scsi.c           |  6 ++++++
 hw/virtio/vhost-scsi-pci.c     | 10 ++++++++++
 include/hw/virtio/vhost-scsi.h |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 4d70fa036b..11dd94ff92 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -163,6 +163,12 @@ static const VMStateDescription vmstate_virtio_vhost_scsi = {
     .pre_save = vhost_scsi_pre_save,
 };
 
+void vhost_scsi_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp)
+{
+    virtio_device_event(dev, event, queue, true, errp);
+}
+
 static void vhost_scsi_realize(DeviceState *dev, Error **errp)
 {
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(dev);
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index cb71a294fa..c7a614cb11 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -44,6 +44,15 @@ static Property vhost_scsi_pci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void vhost_scsi_pci_event(DeviceState *dev, int event, int queue,
+                                 Error **errp)
+{
+    VHostSCSIPCI *vscsi = VHOST_SCSI_PCI(dev);
+    DeviceState *vdev = DEVICE(&vscsi->vdev);
+
+    vhost_scsi_device_event(vdev, event, queue, errp);
+}
+
 static void vhost_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VHostSCSIPCI *dev = VHOST_SCSI_PCI(vpci_dev);
@@ -70,6 +79,7 @@ static void vhost_scsi_pci_class_init(ObjectClass *klass, void *data)
     k->realize = vhost_scsi_pci_realize;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     device_class_set_props(dc, vhost_scsi_pci_properties);
+    dc->event = vhost_scsi_pci_event;
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_SCSI;
     pcidev_k->revision = 0x00;
diff --git a/include/hw/virtio/vhost-scsi.h b/include/hw/virtio/vhost-scsi.h
index 7dc2bdd69d..b47854a0c6 100644
--- a/include/hw/virtio/vhost-scsi.h
+++ b/include/hw/virtio/vhost-scsi.h
@@ -32,4 +32,7 @@ struct VHostSCSI {
     VHostSCSICommon parent_obj;
 };
 
+void vhost_scsi_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp);
+
 #endif
-- 
2.17.1


