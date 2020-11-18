Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C62B83B5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:21:07 +0100 (CET)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS4o-0008Jz-8S
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpG-0004do-Ur; Wed, 18 Nov 2020 13:05:03 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpE-0008Rp-SM; Wed, 18 Nov 2020 13:05:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=homqPMtNSAFcVh5RIEQyAyKRCTiz2Np1uQTItCBvfoe9sIC4z3PaKO2RCm6fzt/pJa7ZjiPwtTcVLy9CtcMpzchlUtlIG+dYXgOMKkgnJOtfrNOhpn0JDZ7E4ijjIae60MUEk2Q4yX2BO5JKS0LyHtVtyMJgz5mm3Gquf8USWHtTtW716bH024CwFnTvFu3HOuvyU571Clb32Z+1/FWee09/Qn8jycP+u1T+TLnxPDcVQFCyzCiNxNGocgIAWz5L4gPOGaWNrh+Gi6K96lkSsYGN3q5Nj8xZDZ0SosGPPF4O314VKWoIlz3IuAgBIRwCVT1st6J9YXoVDF16MIg20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNFRUp0mQ0s/nWQQfGelmRdP2OuLyZprvBZEBobA4Xc=;
 b=iz8h0lmT4BczChaGMEvjHDizM5sfdckbyMJIyddeeYaFbzLd5IuSWHoLi4mCjPvapr41ubZsnGP5GP4XN/3x68jhzMXAKWJV+OHJB4P6vp9A+bLZ1cA80E1ozxKLJcZY6N669wzBNg/FG+wpQpfjm4+inWwxdGcEEAJy8clf+31FYCMKXc1Sku0zjxYS5wJfxQC85Cp5mkoEkIw113YFtzDzwVBZriLJ7ZVgtlL+TgjcPaxNP9fTzpr3tQOtJUaIek6qVpk51WAU7UX4ApVrGcgTzKV/QlubG3S3gdhXxKzDzZYr111Ec5Bmd5aza2xSvqS7g11kY357ndrbm0toDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNFRUp0mQ0s/nWQQfGelmRdP2OuLyZprvBZEBobA4Xc=;
 b=K/qCFodSdDeXqeJH8bWgdNgh5v4GsJoOOCJK2Lt+mxAYrwFXTxE+ZyC68xYSGM8XVllzxUu09NTzVJN+WP6f7V/SvzDtrhr3Jqlaw31fo8wojqrnPA0Cw74TmUoQYv1fZQ3OlVFc9V2y0s/nYFuaZoUyQZf2v6I3LekAE10IaTs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 03/11] block/raw-format: implement .bdrv_cancel_in_flight
 handler
Date: Wed, 18 Nov 2020 21:04:25 +0300
Message-Id: <20201118180433.11931-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd072cc-0e1d-4731-5f2d-08d88bec7065
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912ED4AB3DFA69A6D4E810EC1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNLhATuwZA7dP1rZ9Url3V9Q9Fu4d/ykM2tkQ0H/ttku4Q1C5K641gtF8jb0Syyd9vxTskJwpSehTIWpq+rsGLif4BnToWSyHCz08u0s8imNPRSV15TErCfY65WLl0G9gRrJ68cH+d7Z6XQh1WEa2Zw505BA/tAH6GxD+Hg0yNzl+A3vLIic4GBsOvQ5rwfJ5a19iy2KkDFc6lZPPAlZ+QexCpfXu/5DzalhVlCLe59mpZQn788PP3WYkIxmlFjycIfVOspDXSLFjGBJSVTnqOzehGNE6Jxcm3SlQpjCjnnq7jL/O3TehXRelIN2q595s2zhvAhCEgdOsr15VTrCpooSmRgwaBIPYAVpI0zy28IRJLCyeHzR2U2GMfzCqK+5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(4744005)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: zdU1R8uYd5hLbDm/eUTgApasSUoXDYr2Xcl9uw5WzhO9MVbQP2Zv/wVU+5Kubv4jGTc6nMf51Rs5M9j7Mf4VrV19G4RPSszVEeJnhAN6p/IsL6Ggll8/F9bho9SmtjnENy2S4o192EyH7M/fXXTMzv/DLMKmNdaS3iNicXndu+QkF618M1kiYcemUArTGALI9wF6LNCjFlLBJN5UR+LwaAbRNGBU9jgj4PqQK5msQszdfOA/5pO1vl15Zm91c+sdGjo0dde4ZYXRXz5bKm9x9CMx4yW6BtNSN9+e6LrloAh3syslyon2xznsD5wPlCumth8PdB/lCBFoObf0ycYAwufU6NAUZCmiGDko3cRNiRy9FaW/7QBNwOAu/XuEXwmebRip4wMovbWN1EPTEdDbHVsrDxi7bIVIeDc3oUiecHIOVlOtd6kQ7frZDI65smpRwJnTtca+togmtWbD5pGNvGtZMDaGiuutObqlSDVHckoSFbDCP0ODd3A/rktK+TrbhWQWOnNtR/bqfqaquHpluEebiRyoERznPz7lDpv7UShe+rZGE3Y6Bnj3KPuxTliRpxEcCER3R3cH4GfKNz40VL8KlkwBTYoAVZJlwhiZnzX1/rpx62EIVOqPc6corxrXM4vqaPZy7Ol0Wt+H61a88A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd072cc-0e1d-4731-5f2d-08d88bec7065
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:48.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNaQSs4rHNMy7EqMUI0yjePBGxDuRzK18KwXrEWZoDcYUFOu5eTC6mm6uEJbTSPq8cxUAQ/Egay13HI1EMUCa6w1pPTyL7cWd6JnjjY7GUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:54
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

We are going to cancel in-flight requests on mirror nbd target on job
cancel. Still nbd is often used not directly but as raw-format child.
So, add pass-through handler here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/raw-format.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 42ec50802b..7717578ed6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -575,6 +575,11 @@ static const char *const raw_strong_runtime_opts[] = {
     NULL
 };
 
+static void raw_cancel_in_flight(BlockDriverState *bs)
+{
+    bdrv_cancel_in_flight(bs->file->bs);
+}
+
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
@@ -608,6 +613,7 @@ BlockDriver bdrv_raw = {
     .bdrv_has_zero_init   = &raw_has_zero_init,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
+    .bdrv_cancel_in_flight = raw_cancel_in_flight,
 };
 
 static void bdrv_raw_init(void)
-- 
2.21.3


