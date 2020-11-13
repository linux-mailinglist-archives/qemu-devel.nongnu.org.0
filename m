Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D832B1B88
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:03:16 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYjT-0007kD-AA
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfi-0005zM-Ou; Fri, 13 Nov 2020 07:59:22 -0500
Received: from mail-eopbgr30096.outbound.protection.outlook.com
 ([40.107.3.96]:46759 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfh-0004BU-3z; Fri, 13 Nov 2020 07:59:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lONjRf3bKieQ5Z1ZMEYWJIz2JOTcWOZi7f+K0dmlhKYD8gU3F6nfC9EPiSfx1G6EjQSK73UXWbEuSmPeYv/gJmDnd46B/uK1h9EQSrcVsLdaw8IE7DCpsmfB1n52piHEYFdRcnwNJ9O139aw8o4pPa8rk2jxQQPKqATkcFjPYxyb0vedjbGniwplgSYfC+C6TdGUqlNpnnWKx4mlCteAAx83BkVMwoL3ivBPAM1tHMhsXg3uhEMJZwWMmS3SQUTStLu5uuvxjayzMggrp9r75dXojWUwKQ9khT+RHOcACWg5EjsjiLUO+7O9IKC00W+oSgiVF8Hj5A5qMANs1RzofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DST90u0lTqp4qz6Wxepgl5RFrbR61QPt1qCO+KBYsxI=;
 b=DTDOun424d4mbXm+1iXLJccU0E1I2CoWF6GwGZ8P3TP+Lc+GUBqu8LJwtecv1q6ohnrU5lVaH8HlvMBurPm7/ph07JfQIUKj0WwGhInT8FEKRB+seQ/w7XTPzWt3A8wzPg9nRyeOMu+whOMIfNyvCfv4zxYqxrIR/nCVXkMVFaTuaxRGXqK8E1GQ0ZK+jd6CJ/SEXrnOhAHxzhm6f6LQVjVDY+mGo3JFdJNxG5hm+zJJ7ORnPNDrdPjSWsgXnhVyDRXMVReDJHh8JoJOBzicUfbNLE1Hrcfg6jaTUCvtkuSvr+N/e1U1yrZyoomOf0I1eDLzFsz9iQxoNNPEb9kE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DST90u0lTqp4qz6Wxepgl5RFrbR61QPt1qCO+KBYsxI=;
 b=m7g/N+G+M/0AT9lxAWAvFal5mk3cIAKZ0bK69miTAD2gir2RmQr+Et32YgV/l4vPkc0p3/m02C+SEo2c8YD0XGv4VqFX59Yw4tYsnZp2t/PTYaW/ydqmImad7UmNwW6XW9F3oLfR7e3iarmSd42EXOvgazh2WnYhPO2XP7LqWMY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 12:59:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 12:59:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 dautovri@hpcdlab.com
Subject: [PATCH 3/5] block/prl-xml: add bdrv_probe
Date: Fri, 13 Nov 2020 15:58:46 +0300
Message-Id: <20201113125848.20498-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201113125848.20498-1-vsementsov@virtuozzo.com>
References: <20201113125848.20498-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.71) by
 AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 12:59:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fff273b-f96f-471e-c8d1-08d887d3e70a
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5877D4B6BBBA53358872F667C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7/9kv0pX5q4QOgWB2DwsQ7yDmKcc0GZQQp+LCF9UsKlj06hFhw52iaDcmgWkyFXTRHckr8pSDIN43D9AsdUe/GTIYUWmq+MK2hn8z5abu2CUyXom5dDQsbf2mZndOQXLiCvSDOWCU0bMhlmVdsyQV12LtBlM6mDDSo/imKrdAcIzgPDbntYgoTperrve8MdJue3E3AhgyPkDIL33LkDaKCBV7WkT6R7vqpBPzQmVmQgtTS1UpyPbyOn92ReVcXNIs7H7RBac5FV3bhzJb9MpaAXF70NjtLUtDKkebdjB2qIEibXKqjLPMmfi2AshArBDq9wteoaUhUYrgvSb5GLsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: TM+OWTTMEEsTXAKMc0JweBLqabFnTDSbXelhoY+yMruO5wn1RwL0PtcwivdFHSW2i9D62gGukXeGfrwwqlMcExckeUFwC8HGR2krWsfOITzuVrRODC8NdZipQjax9BWGSom+KCBn084SuOlTOzTdlF6Ft2RIvzseOoXC4eLoKsluCTdSfXuA8jLojL/CSJG6MaZtqRK1rhGRJ0f+6wmSU0EzhQffHVyhupicij8oYJaTzpYg9oCzzYpd1yhGQeLpt2K0pd8butwoaC0/dUY7BmiMM4TjqnzlsB0dUweR0oFQE4sConpEfWbf2yXaMTzXa0pWU7fluN2tB4aZ9cGSCnV5DxoeNFdSP/YIPbEv7vC/G7oxPhZRKfBVfkDNAhmQ/wRpk4luBqTSR56N3XbmzkY+p2loKRbsBTACrv7Fjul9FFPPnm1WN0AJUjbi8/zWYuk0FkGVwfiVgWNIwq1YKay4KsnmlkeWbL/vdRw/+9ur7kmRafhTEyUiNxKZ8p4mjAO8gEOwlcwOTSJe/6ZvK2e+taUlR1zxsN0dcHm8IJ8J3ZMHW7r7QpO+C1IMdWqAszquy8WgF9EoWjWeXJjM383uu++7EgKks5jjHZGPL9uxHQM0OAeCd7DkvtyANvsVzzL0PI0QAU2VkjtXPBWPNw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fff273b-f96f-471e-c8d1-08d887d3e70a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:05.8541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN1ufO9Ah0TkzkIWkmDylcpRqzfGTpFVmD57Z/oco7uxNVRP1SN8Mnmn4v3xP7u+8ModTugha+XetJ6sgGevgWz6ZQWuDljCDXgZflEgTZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.3.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 07:59:13
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klim Kireev <klim.kireev@virtuozzo.com>

This commit adds bdrv_probe implementation.
It checks the filename (it must be DiskDescriptor.xml).
Then it checks correctness of the xml file using libxml2.

Signed-off-by: Klim Kireev <klim.kireev@virtuozzo.com>
---
 block/prl-xml.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/block/prl-xml.c b/block/prl-xml.c
index 5ab32bb6ab..023651342c 100644
--- a/block/prl-xml.c
+++ b/block/prl-xml.c
@@ -467,6 +467,30 @@ fail:
     return ret;
 }
 
+static int prl_probe_xml(const uint8_t *data, int buf_size,
+                         const char *filename)
+{
+    xmlDoc *doc = NULL;
+    xmlNodePtr root;
+
+    if (strcmp(basename(filename), PRL_XML_FILENAME) != 0) {
+        return 0;
+    }
+
+    doc = xmlReadFile(filename, NULL, XML_PARSE_NOERROR | XML_PARSE_NOWARNING);
+    if (doc == NULL) {
+        return 0;
+    }
+
+    root = xmlDocGetRootElement(doc);
+    if (root == NULL) {
+        return 0;
+    }
+
+    xmlFreeDoc(doc);
+    return 100;
+}
+
 static coroutine_fn int
 prl_co_readv(BlockDriverState *bs, int64_t sector_num,
              int nb_sectors, QEMUIOVector *qiov)
@@ -499,6 +523,7 @@ static coroutine_fn int prl_co_flush_to_os(BlockDriverState *bs)
 static BlockDriver bdrv_prl_xml = {
     .format_name                = "prl-xml",
     .instance_size              = sizeof(BDRVPrlXmlState),
+    .bdrv_probe                 = prl_probe_xml,
     .bdrv_open                  = prl_open_xml,
     .bdrv_co_readv              = prl_co_readv,
     .bdrv_co_writev             = prl_co_writev,
-- 
2.21.3


