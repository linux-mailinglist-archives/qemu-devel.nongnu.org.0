Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54C2B1B87
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:03:13 +0100 (CET)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYjQ-0007fH-3c
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfg-0005vO-Gj; Fri, 13 Nov 2020 07:59:20 -0500
Received: from mail-eopbgr30096.outbound.protection.outlook.com
 ([40.107.3.96]:46759 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYfe-0004BU-RK; Fri, 13 Nov 2020 07:59:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2Hgyd0yu3og2yWs7HVzum22roJc5itiW/0ovRox34G1PyPdNqZe1t6tCDkGqIELUXZrYRfbNKPC3y0hWoItvH90wYoiU6ORdToDUfTLurLfITDZ58hLQEfwmC4ArGj+Ao2R8hgwx1jFVpr+luPcwMAPNwzhTjX7Az/SnDed0mbe+ivSdtODwXoksTuM2ASHJwnRyDVmdGdKCpuWbhTN+/PpjA/WMNlNAd2cMQak0LmECc5HIPg5ibFIhz5hz7AxgLm6RzBXftQN49p9cV47SxvKo0KAQCHaHClj0dXKzjkmTCTXMdvgCL3XZQ4KEeqmBcvQkq1voaGXAjEJVcO+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrMPuj88x0lQyJrHFLnx6CExp05zu9SZOd6PJgS1V0Y=;
 b=E28vjjVPzR0iPGX5O4J3cFvIrOaLGBNIBploTsVz53VYZAsyp3Rdp80pQR5CRtTx6vn6lSSMLeFtAnBWtZPZB2Tm1JFzR1j6n14lNS1ncsPvx67i4TM+W7ByrQ2ER4BqLK0x6UuaYk8ODSBy2iiQ1/1CEHIFJU/HvtbU36AgbCVu4gsoCLS7iwddjoErnFM+/hgwzbDwn6MNYK9NlEItnA9NBNPqcBKMxutEO4kh68ZuwpBvKEBXeVU4yyy2IZ0tfJoO1V/UnSfu4+dhjQ13f8150vvQc5L7GnSVMkhKaZ5Ot9oIGYBWNTqx76oRn/Qldnq35wSAWFA6A5qfkGfWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrMPuj88x0lQyJrHFLnx6CExp05zu9SZOd6PJgS1V0Y=;
 b=UCNe/g0gDuw+45x47pp0ZHQVd9JehbqrJjBRyviwtej+iz9N8c5visPT/GSBpexS9VbKEp5tT/vfknHU61ibSzw87xPxlbQuWdaP5IEBCCevISDbcgD49ZibZ94M+1+FxdgMkPuiUcNI7Jjak89J0zy/UT2Z6H2kWdWdsRER0t8=
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
Subject: [PATCH 2/5] block/prl-xml: add bdrv_co_readv/writev and flush
Date: Fri, 13 Nov 2020 15:58:45 +0300
Message-Id: <20201113125848.20498-3-vsementsov@virtuozzo.com>
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
 Transport; Fri, 13 Nov 2020 12:59:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b741cf-4d5c-47c4-cb83-08d887d3e6a8
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB587792F196AC05E4FE685EA3C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:25;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jn3o3lno1aRoHkj49FdEEvy2IDdQhX2JjHWb8DUzzvmj7fCFdcRBiXf0N7w7yJVliY5v/qt6muTeWqOQZMoWlhQ8FjHqUiom0Ev4oMdbNy7Ij5WgglzirsKKppTutUYD1pPBEPCuhFR7OVsmBPG+bP0E30yShYuQS9JBxTFfE0QpHs2+p3bjrOD+nyRwgfzaeKXVVjKwyKtAMa8fWhpztUVOGrNpI+x59153dn9s4YpnqasdeSrognBlgYGDcv4QQdvcWcyegSgD+QL4/LOtotNFuOYAT+RAxAMGYcwT6OnF7+mzYcWFI2ZlKHlPcShmNj0q+f1xBfZ1qqD8m7/zwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 2Tr2cjL8U7ghHIoW+ScQiKXKhEAng3QeVslNbvR3cAMONuuqYsI1CALQRN6WaXqSNYjz3k7UZkh0BCY4EPw+tsRjG+gkx77f7abkjlPsGLOETo/B2CezbXlblUvUVjdFJjLch8A3KTsmb/kY9AAPlEU/HHaRGgmkQmUxtCs6JD+KjzCAzrRtxWPvKARMLtV93XCn2fD2dOmXlFJPuBIfcHOAxrWkD6QYURz9KPP5/37gdWWKivAE8q3bFFqSEGqLnk9RAqdZTPASS6MKyevBe6jvDBJHhr/UKtCD2FZZnbwp2TNrLU/iCebEUb8sC4i/5xmjtjVxVIoMTe0/fIPyLpmwBJqap2DnBcTa398trafMz+BwTAnSXB/JbBs2V/0XNJ/ek13McRyih4tJ2DICTMa975DhtQlScgcSzw8LFpM4sMUysereJIn2myhJYKF6yDWxY2ycQtz6jKZgy+CtDgIh+aXbndMJwaTv1nih8u+WU7Bku7yJYt04K+IstHIxcDWuXXTAmm51ONtbnLLy0NpED03whS+Iw0+3o6c46ghOeLUtpm+sgpG0cLjiGPRfQfzFqpn4lukTexYjfXb7dp+r/g5d9XQkmLTne+F+YIHvsXMA3r3yXyTKa9GPhSibxnxEt/XCeUemGwBWGxR5nw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b741cf-4d5c-47c4-cb83-08d887d3e6a8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:05.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHNA5PUgGtCSgueOkK/xAsQamwzaO2bBD7zYnC95W1ZSNvIhCLR3sadkLLP5c91EL+DttpqosJT0S1yhEsbGUR6Qb2aS0QcVJrGnCNnYojc=
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

This commit adds bdrv_co_readv, bdrv_co_writev, and bdrv_co_flush_to_os
implementation. It merely passes these functions down
to top BlockDriverState in the snapshot chain.

Signed-off-by: Klim Kireev <klim.kireev@virtuozzo.com>
Signed-off-by: Edgar Kaziakhmedov <edgar.kaziakhmedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
---
 block/prl-xml.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/block/prl-xml.c b/block/prl-xml.c
index fa9c4fd5fa..5ab32bb6ab 100644
--- a/block/prl-xml.c
+++ b/block/prl-xml.c
@@ -467,6 +467,22 @@ fail:
     return ret;
 }
 
+static coroutine_fn int
+prl_co_readv(BlockDriverState *bs, int64_t sector_num,
+             int nb_sectors, QEMUIOVector *qiov)
+{
+    BDRVPrlXmlState *s = bs->opaque;
+    return bdrv_co_readv(s->image, sector_num, nb_sectors, qiov);
+}
+
+static coroutine_fn int
+prl_co_writev(BlockDriverState *bs, int64_t sector_num,
+              int nb_sectors, QEMUIOVector *qiov)
+{
+    BDRVPrlXmlState *s = bs->opaque;
+    return bdrv_co_writev(s->image, sector_num, nb_sectors, qiov);
+}
+
 static void prl_close_xml(BlockDriverState *bs)
 {
     BDRVPrlXmlState *s = bs->opaque;
@@ -474,11 +490,20 @@ static void prl_close_xml(BlockDriverState *bs)
     xmlFreeDoc(s->xml);
 }
 
+static coroutine_fn int prl_co_flush_to_os(BlockDriverState *bs)
+{
+    BDRVPrlXmlState *s = bs->opaque;
+    return bdrv_co_flush(s->image->bs);
+}
+
 static BlockDriver bdrv_prl_xml = {
     .format_name                = "prl-xml",
     .instance_size              = sizeof(BDRVPrlXmlState),
     .bdrv_open                  = prl_open_xml,
+    .bdrv_co_readv              = prl_co_readv,
+    .bdrv_co_writev             = prl_co_writev,
     .bdrv_close                 = prl_close_xml,
+    .bdrv_co_flush_to_os        = prl_co_flush_to_os,
     .create_opts                = &prl_xml_create_opts,
     .bdrv_child_perm            = bdrv_filter_default_perms,
     .is_filter                  = true
-- 
2.21.3


