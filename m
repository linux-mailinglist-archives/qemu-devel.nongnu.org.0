Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE03CEB8F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:03:06 +0200 (CEST)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZTl-000064-Ej
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRO-0005rd-Pw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRL-0005QR-Qd
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:38 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuFZl017810; Mon, 19 Jul 2021 20:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Nf4UGqSD8Cux2WYhmD/1z0z+12sOdGzep4OdKuHLeE0=;
 b=V9FD3hMqkmFyGLTbj2lA/cfTphcwgLtdw4QG81MK0+xu2pBXpNzNlZpjamNQFCWciI5S
 rEDcNofe1LRaKq83fQCKVtA/yDMkgkX9C7qwfNqmAerwHod/QCUF2Gob1NyK29CMqoVp
 ++AEDZExFdPdgCbx4A2HGc5Uf1yytb2pTH5DRN6Uil6gv//Pqz9FabDKys9glsSkHUTu
 1ctrgr6Z6xIgl0o/Tt/Vs4CoDx5Uu0Yivnk8XGSiY//rtlToO9K3SBQcgP1BQO7lFSFY
 LDz55NkG4SXmRHXQupu5huyKZjFExtRGn+Fm4etEt6EjA1Cy5O63kBbo5dXHgdUHIPzA 0w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Nf4UGqSD8Cux2WYhmD/1z0z+12sOdGzep4OdKuHLeE0=;
 b=xEDnGT1UUQv7dRk4WuKbtqTfQlMUnAz1w8ePcJrUIE+Cr8ldSIpyM6yNgwbxl5Bhe3yb
 gaLz1BGHqOo7HOue0Zrcw9ckBdZpleoCl6zb1Zwt1rui1XSaBStjB+I46wOls/HkR/RW
 opXbPocUscBaHOfms14vj5OzEaBoRUIdKIZSbOBQ5tWd/hsLRNRFSxM5MLfNYE1vXz5t
 0/pRFtmzOvKDjrDe0bHctlUrUl2ODVdk0fabRaMVQr4tY62VuhCEspWupYVvh1dNXcnC
 O5YiiTDvJlHL1j/RbccvV98t2F/zg6hxWv95L3tv7z9f+xYWOf6CBIJ+5mfoRlBAYYHj LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfs0as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JJf5Iq033120;
 Mon, 19 Jul 2021 20:00:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 39uq15b6up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBVp3uMZ/Y/uwScKUe+JmVAeCFWhh+X91ld6/EA3fl3fV6flU2iSrM8MikYnDlHAnef9qD69OjNT/B7rzZ/PmQGDvyI+ODnbu8IzczOKg1BOFSPjnALP6RksdiVAV7Ay39GCdtlkeDjRTUrezh4TZpEPmKJhkRalxVwbLITI/PpYckrxcRMb00sJWdIQZjAuRx7Zgb0pCdWn7o/ejCdWRFOPSrHaH1PXR9s1yU/SyNHSZzvslKWniw6XAzCTs70kvx0+oBSo32t7vZBDw1TgdMHOtQ5iuXN0JkcSd4zTrGLMfPe1egPyHcwUxY2UOS9AcXicmHceaut/7AYeTtIeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf4UGqSD8Cux2WYhmD/1z0z+12sOdGzep4OdKuHLeE0=;
 b=eiotXviqR4lqPKbiZifPVZ0GpHxqW+jJqMkE+4uHbStD4U/4jZ2/himqy8vBEI6tN4o3XicbDrKhUiOPAUBUSgvSaEEJz3R9hrfvo4rk1uffmaAHr6fr+qaJndTarBypR/8OeziTgn2iIS8U4njkOA/2l8Kg4tpHW4bxON+I8jAi/ulYPDy1vUld7cHpytCMnq1QxhueM5FL/YRIDUDr2Awci0+5AJUDVACsAm6dDdh+Ah3041ecU5zrDjCLzx6+xGf/GkNbdxB1lFzirpzfqOJOk15CpvE8+ATgAMoE72EKGJ8C/HpFSVZe6tTftc18+IyZ2O7NEoXsuSBw+RtxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf4UGqSD8Cux2WYhmD/1z0z+12sOdGzep4OdKuHLeE0=;
 b=HJj2YimXoWYe7/o+DyaeRTLBIr6NVV5L0T87NCKzKD6oz3foaVCAF/N6LJG5Yxy8MIMuHU+9IDZlzBIxDkmmN+sey1QjXJGbiIyYB9EtU930JqCU02EmGU7EKmrt5LVdKs2imZ5KXHBATS1+BXyXYa7i7IKMLs0lwDoHGFumq/o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3853.namprd10.prod.outlook.com (2603:10b6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 20:00:26 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:26 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 07/11] vfio-user: handle DMA mappings
Date: Mon, 19 Jul 2021 16:00:09 -0400
Message-Id: <609dee10d839194f1dca5aac3064e75c408fbbdb.1626722742.git.jag.raman@oracle.com>
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
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf56f81b-d985-4a61-5886-08d94aefda14
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB38531C8D9EBD17AA026FB47990E19@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKF4cNprNUYPWoLBzZmf7OzB/73u3ovTDip6rFJG1Wr0Zp+0tkpfGxI589zDoAZvUdEHTKvxgMqxNHaIRUNUj7jDiBVrQMSwrGQTet8RwUAuCaC8f9y/rNXTlKHMs0sLqpgK5sr+yTy+06dmczbmpZTJRzO8jRcOv4HeT2TkhqCigirf10QihDms05TW5ZIIqZfMG7+de7NPPllkyHzftq7GIOuRwX0ON0Lkl4eLSMgY2t05vTC6T1kZuL0e3pXgU5AxvFV1a2QtTrT2BtzlbfleYOmvUBdM89oSYgYdRiUXQwYIFhTDqLyVDXIPuHn1UjGRIPpOwMSMRnz2o2CnZU6lEagdOBrBF/SVmcWaZ4vtOQx/vna/L16hBtELtqFukaEemZLQ/08VqVLqz4p1/vnLOernNvEmXEJ8dUdXWJRhDPLU39JPnTSlNIobc8FKx5IyuM9+57FoJAXK0H20pJwFJeJGzeDdLvgCtx17AvaalRGX5gaSZEnzUqFiK+qGn3tkEux/KfMG+tRUGnWA5Snb4dc4Z7hejQ90LzEcm+cXLLm04Ml1WpOlyCYplIj5fKo2Chwul46VvR/Nh50tCv2XU4zO1jUOsBHc6eySzW+2TO8x29uYUgayDdxSuS7MyEyvc5ETu5SqeEFVwQxMETLCXiJuc2mxqCbln0QuQPCZFkeCTFp92Yh8HU3Jip6H/q/PPKs0fW2l/sXV8wVbPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(5660300002)(956004)(2616005)(107886003)(7696005)(26005)(6666004)(508600001)(38350700002)(38100700002)(52116002)(36756003)(86362001)(186003)(6486002)(4326008)(66556008)(66476007)(6916009)(66946007)(83380400001)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DuASCUykPWfQhfgzwj/tWgP2arBLRattFL3q9lMe0tFnkD2Iehcpt6HI7sA1Hv3oWrkn0JyBGgoXbLVSn45PKb8F3a/yxRspzoI4m4dC+lcJsrZ2WZPrq7rstzp/tz5Gix/AXOgrgFP5SrfLGTxnUiNR0JYdCczIpQ1ODZI8dqiYzLr26xNRd3spGCqBE/WPne5ZYFd0nLd7chOP/HC+l8x64sR+4p9k2hIy5nEJzH/Iab6MGjklX/dT5Fp8l6JKYAva/c2kmBew1kV1kNjIf1xEg85Jf796KxoLNE/b7BzmJ7hQz7xruZEgAtmciDYTHLfe+PEPuGhf39CoWJef1KXztkJ0yKOUiA61pWAYz708xV/dNxwdfRIgjkYWsBWzm5IhzMkaEyjlgqljSkODrMnPjqJuTQct3/bM3AFr2q9MoqlkK4r9k71noehUDWout8kyCWriprtba3+zJyZD+adYnOQXfCKxzbCmWvnPocEQgUqwup3vs5HtmYbRrfEGHXFdU9wg1FCsyIorg03FF4/MRhYVkxxAFGjdxvG7xdsaAe4vVn8TDc3sMo4xanBb5EjUOT5IwbicYNkgPq0kcum9yI03YLLpQ3c2FuqrM4fzE+lfoIeQcbiM3yZIc9qihNnIt4gWugcheQIWI3iDwXfiaKRGewnvMSbHfDXx37J9GFhp0xdd0k00iHO3pfE48lL9ma2ksDZvbX1M2jcKO0qHcPQXfYo3gpFmilbTxF3j4+HaGSG7a9UVsQmTbgpR
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf56f81b-d985-4a61-5886-08d94aefda14
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:26.7720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq4AbkfzmDSz3qL6XTAOjeGTN3K5dk9XtSSxhHb4dPKiD2UjFVnwaRkcFZbDXl1Alu+0aSrjU8yN+7YpLBTxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190112
X-Proofpoint-GUID: QT0pqD2Pi00M6tWe9IzFKiPhpqTQsAp6
X-Proofpoint-ORIG-GUID: QT0pqD2Pi00M6tWe9IzFKiPhpqTQsAp6
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 60d9fa8..d158a7f 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -161,6 +161,57 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    static unsigned int suffix;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("remote-mem-%u", suffix++);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    qemu_mutex_lock_iothread();
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_base,
+                                subregion);
+
+    qemu_mutex_unlock_iothread();
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return 0;
+    }
+
+    qemu_mutex_lock_iothread();
+
+    memory_region_del_subregion(get_system_memory(), mr);
+
+    object_unparent((OBJECT(mr)));
+
+    qemu_mutex_unlock_iothread();
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+
+    return 0;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -208,6 +259,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup DMA handlers for %s",
+                   o->devid);
+        return;
+    }
+
     qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
                        o, QEMU_THREAD_JOINABLE);
 }
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884..f945c7e 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
1.8.3.1


