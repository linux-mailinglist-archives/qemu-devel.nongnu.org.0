Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66C3CEC3F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:18:02 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZiD-0002XC-SI
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRl-0006RV-L4
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRj-0005kh-Jm
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:01 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJu6iQ017735; Mon, 19 Jul 2021 20:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=d8ctp07v7dtvx0lo7U5JYtOKCpaNBC1TURFpny+sErQ=;
 b=f2V1P+a5HhHZL9H7sIzQCKzejcZIYP7CDVEqmt1Z4YDpM9Bft09WZXd+9LPd4SFcp5YW
 q6vPOLJMSLwCfmPTiug41i3DGd7pXn4p1BS7gnzbLGG05rs1iSainGWxvO9KQZA+m23z
 CkCaLsz8xXeY3LbWiAYQtL3FA3Zi4Asohxj8thavMKsL4amVcgtV+/os/1EbsZCDb5b3
 ChYZr0J5FCHyxY/ltYtV7kOw9MSP3RodGSj0XuUVHXleSVwCUl618xcW2RcmoxVngpWc
 GIsZbnmAAqPWim4oD6xZN+/8A1NETdtkMzi8D12/kYtfbekddd8Tk6oL+pFTEeUuXE6t Uw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=d8ctp07v7dtvx0lo7U5JYtOKCpaNBC1TURFpny+sErQ=;
 b=dJsI4EQBrL9dorx74XWj6lrGxdwtZRUh80KM86/4nLNAbJIDqOPqm4tcWd4FFZRubJpy
 HZgsLVILvLNUIyRp8JpdlKVNykIwDdiIVi2zpveU24f0h5HlE8v11aHrZao1wPQbxR9r
 tkuddlV41RUorFU1FQWWMSke8jfUGAZ3Tg0FfVJEScTlu2aTg/ZoXWLmknTcrktBYTF4
 ZWbcjNOyzxMbOqEKjU+cYEoc1ytvTzJ6HL/MYJSjL2rqQc4sQ9mHp0hun1Im8ZqtKT51
 sOQqWknz+ySQJB/qxVWgdWj3PFLBT9dcKaf1wr7pz9F7V2xvw+Kpufis8/oK65kjRcTm bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfs0d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0Zpi127869;
 Mon, 19 Jul 2021 20:00:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 39v8ytbgn6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGK/XRiPHl6H0xrd/ShnxRGwP79+ovA74gsyZNCFhe7Dw6t+iHv2lrjkpOuoe+hQp0NOXkjEUgB4mNgtVxBR4sdo5moDh75YHoAJVWxP0Ql6rp0YvtjaPeieRRZJ47lxb8E5tAqVebUwYqS/95ob4COLklnr54M1wN2rNmyjABQP9uau403UJ1BvWh6JJwyoY5Uk11pYPUhUnc3YTnY+9uZPyN++e3U6ZHAJuyXF+jbEbx9C63SkZximLB//6yuLnsEo0WaxZEtu3FrIDasb1jHgV6vKr17WcWscmyMTL+C+OjKScMQukyGL3TcmV7XCzwBZfYBrXabvS57697gjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8ctp07v7dtvx0lo7U5JYtOKCpaNBC1TURFpny+sErQ=;
 b=Br7omeyahj+qeJr3G4KVZimyytymBDh4En0EFCxd3SH1q8WDSL04gqkOdwmGW1AJp/SNdcFlAsztyeoIyrH2GG5mYnjDiwHs9z5kodQFyNGL9PqnOSd7/WnWsUJXtsVKbaKX7NjJFojGxq2ER4auqPiSKtSCpMklc12ribBrK4fTmLbTTUQ7VJFYR9to03ZxVUPSNx0jnIkhEfIjeRfw5nnZvrlJc+nXkwfxDri+Xvj2GklopBJfEexGHlp7YB/PHqLwcssT0ZKMcBl5phLB5ZBsIdN11t35UGPgnrv/rppsk++WXdP2ExFxNpscrLcrwu/u1JiEp1ANvMeB/B7ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8ctp07v7dtvx0lo7U5JYtOKCpaNBC1TURFpny+sErQ=;
 b=SN/AMHCCGIWSC0hlk7sXznoKNfLYSExvHauQJEgvj4b95zQISwV3b3S5j04uL/LU19dG6J5kfHZu9erFJwkG0YRYam86NmRSF8G7cfN0Cd4/UqfCWtAdWpEiuFcm31GSgE2OWg0dpkP2+67Ctwd6DJjzeXXoLLGRsMMo/AMyd8Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3792.namprd10.prod.outlook.com (2603:10b6:208:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:00:22 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:22 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 04/11] vfio-user: find and init PCI device
Date: Mon, 19 Jul 2021 16:00:06 -0400
Message-Id: <9c728a63a896ecf3de92a269668c3306cc3e6f5f.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8cde697-e858-4aae-28e8-08d94aefd7b6
X-MS-TrafficTypeDiagnostic: MN2PR10MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37920C3A4350DD893B3001FA90E19@MN2PR10MB3792.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnesEXu0bKkUOP/ayEfAXlOVpAmRSC3eArqOiXr6YLrT/y0OvEYUC2BC9zlhexW5fynuNXUyV+DLf8SAMmGaZbvldJYCzpnQnjGfaYY9A7ZvSzAzVwrFRM/qiKLri0h/IOpt2grZMAEIcdwaJhlA02kCx4feF/QEnvm5ebVdsPb+fKUsSHJVErW6uGgdJIXnZH+Gk8jXtDoDsd58qpqHo5YtegN73xBFQJUpdDMq33Uddgq9UXVCtfze3koiqAnGsSMg9mN2wI94KDCcTPQZj8A3T1AOBAWIy4XGldkisJTq9acxbLPdqaZapGmDd4eiEy3tFLOHMDxSkwZBBN0tyG1ckgKYQInmP89y0YZM860mPGwc31FN+7UEnusGgrQ4JbxWE+JgUIfjwTIbPX16MholuZ2nFuEsRrlfRK8POpeNSHLss0hCiWV1AALKFjm+n352PNr9Tj6hjlzjnWcNhtucDOyzeQL4nf7gwu5wY3GLfMnsJqZCYMMrr6yvYeze+2zDSSM6g8NXYVN9YfoWc05Bz8DZKN/XpI3RlYKON/t75yY6NIwLfAcz4/7btQ1NdDkPczojHYQIO8Z+fWEyznRlOra6QFES5KOcKgbO0t42DAWbdnh1aI2B3oBTqT/Wd4PQmA5YluJ77Tfrcp0ScGoD9gdilo5CoTELFQETouvOVyrTwBQ5XVrc3WIM5hGsYOVkgqKlD6NYm2UQncLxcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(107886003)(8676002)(478600001)(36756003)(6666004)(8936002)(66946007)(86362001)(4326008)(6486002)(186003)(316002)(2906002)(5660300002)(52116002)(6916009)(7696005)(38100700002)(38350700002)(26005)(66556008)(66476007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W434D5yjvzuF+yHDRf4eyYdcNvFYhjz/P0Q922jevDI9XzW/Oy34IDohTacuDDh4HtojeMBV79GMx9dotY2Zes3cwPu7zzHi/vmR5ON6HIDKtD+Cko/1/2AyzweYxQoei26iyXbAnuYd7JdK2D4ykIdIQACYYPpt3YMi/sD7NeLes7EBr7mndgL79bJsbaF7emIrP7FYjgZkfwi2qbjusy+WVjJXmb3R02oHvLzmWBBVlns2mQfGai2o4NaYtNJ2PPiDKHLbp3A7bzBYleFDeGvNXgfs72I0KWqY5yPdOhpIBqRkNwrf5y/tdmVTPIbR9W2mbpSBngL/t54LkqjWt9+52DY19keeAK4bsvrbgY5DY2MBgZ6H8lXPtoF5rldTmtSqbxZl1Es/zUQn5Pz1yBfl6+WK5x2jndW6QXcI2AKIUi7+6iTTfZhJB2wxZgnutJVnSuXxzbmKz+m4T1xeeekMGCnHyFVz1ascggmmE4fdbTPPr2YqugtJmedBFI49QrS/YohWDABdAik2w//vLdINOQ8YIp6mNwa1stGAKSLXRfsDZRwlFcNwyjD+RzM94SB2nvHMq7qSv7B5P7w6nEky4WT5iSNVr9E6jxfJTGrtOSfB0FN4OmrTzwlKKYezA29WbGgmUbUmrSgI+NxwD3ukdtvw3KlEiI1Im2Z/hNiy5ALb5fSTTN/coFJtsdLeV8Y4/K0WHq8XeVwue82KHzBci8YKvEr9qasdJuuvz+56JyktzsEhXYDuSN6JTz1+
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cde697-e858-4aae-28e8-08d94aefd7b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:22.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjhVwYJx4yxkbGiGzm7FfLTwCJG04kl7NMzLqs5/2muQxMyCPXwAhr6iczaJdFB7AzrqHBJ8qZybmnPtKzN1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3792
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: B5XgypIMVqbOXziw7U3aKHFQOLDxN8VX
X-Proofpoint-ORIG-GUID: B5XgypIMVqbOXziw7U3aKHFQOLDxN8VX
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index adb3193..e362709 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -37,6 +37,8 @@
 #include "qemu/notify.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #include "libvfio-user/include/libvfio-user.h"
 
@@ -62,6 +64,8 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -89,6 +93,8 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    DeviceState *dev = NULL;
+    int ret;
 
     o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
                                 o, VFU_DEV_TYPE_PCI);
@@ -97,6 +103,28 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
+    if (dev == NULL) {
+        error_setg(&error_abort, "vfu: Device %s not found", o->devid);
+        return;
+    }
+    o->pci_dev = PCI_DEVICE(dev);
+
+    ret = vfu_pci_init(o->vfu_ctx, VFU_PCI_TYPE_CONVENTIONAL,
+                       PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
+    vfu_pci_set_id(o->vfu_ctx,
+                   pci_get_word(o->pci_dev->config + PCI_VENDOR_ID),
+                   pci_get_word(o->pci_dev->config + PCI_DEVICE_ID),
+                   pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID),
+                   pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_ID));
 }
 
 static void vfu_object_init(Object *obj)
-- 
1.8.3.1


