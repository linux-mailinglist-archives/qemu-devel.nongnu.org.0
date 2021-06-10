Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8953A2AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:48:06 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJAL-000351-7B
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpw-0003no-1I; Thu, 10 Jun 2021 07:27:01 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpt-0004Ve-A8; Thu, 10 Jun 2021 07:26:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixKKl/2UyYr7J+e9MqP3wnSeUmht3mVAIMh1ZkhcqvD5KfFg9HuIzddMJIMtLw0IMn8Ycc3OQMEItinMCnOoC3Z/Glv7GiNEzlVYUwLf6fvY0zJJ/x0Cj/IPEHYRa40rO/kLEtyXrhTseEgCFDKLZ1yGKSi3s30Lma0PlrFsTbzoeED11kUH20bGW1h+ZjEcmI70BXZc+eRkWga457lGp+3O+pvFI3a8FwvMXOZP03TXZ5ueRdhia+EoJc65O9eQ5okzNHjwwNe8woEZaEaxudUUOY90tlt4i9P4mu/KhDx6YUcduOMkWC53nzhWmgKA/4PuAAE+Q7vK2gw7uJiTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=E3lbPhr7n8GZJLJELtrU8tBw2h0ybbHstmfEWCfp178zFuBB850jc8MDYxcEBJ1rZLfEKx1e2Bqg6oLWfz6xfl5rD9pFymMzNzxOhLKRLPLHNLZnJw0bbJJAnlcGeuJ8qSRgRoSMwjxPE5moboxI9e0C7l0eV2zQUDA8kL+p+QDQHWL27simlRSM9Ckl24eXypHZ4XCDSvK1REh56Qc0k2TDdFdzaAJcL8Kfw24EnCgO9t9dElagzV9N9RU5HYRBJ9px4Wu1stIhBv3V8O57/p2jpyDGJPfO7ZhXoJ71Ht7EvtW1KT49YDMZbir8vOzY0ShtkMteE/W8vX4SJHjWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=Kx7GYkTA5276CIBK9nInrwXSVqeRMM9qNnt1RviCWzYQ5q43cBZYbg+tlpAYC5CepsJo+MIQ35SbOh2qRFpVTn1HMKbJ5rvf5Q3kPWLnFD0lJrnL8QlgxuPnmgskK0Gc9JDE0Lu85KZT1eVNz81dDCeAWY3WSzcFMsCEgz+GJ6w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 13/35] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Thu, 10 Jun 2021 14:25:56 +0300
Message-Id: <20210610112618.127378-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fcca708-f61c-489f-9a1d-08d92c02a273
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33818BAF6A5ECB55D2C6A004C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoJcMWjVADA72izL95n8eRP+vkHh1jOnMNY2Hf1TFIasOijROLH3exsoUZcFCcqhVbvBpGADlRqcFPmr8yWDywTskGp0oZdacOfEXny08RiwphE1AfRIZUtsU/vLhBtiFBuJ1pq1PpytqJVZc4BBhMNYrv03Qz5ohTPfWD0/kDtBKsEWt0D9lGl7Ou0+PW/LHiOMKERkcnlQyGO1RLSv3qXhaxDyCO5RlX5J5vNIL5pW1snI7moVvcQLDWW03LNZg1vIy4m5LScOCPdHIHZxMwr6Xul3OxdtSdAm7d+yCvtPeczIzbzIjDlMuFVAlsJLxAnyIhzkpk6VZWLyz4dTMtazqN/lH5GQpiOoS7U4Gwn35zjxFaA7Yj4nqE0aDyQJBdLtpM43nnZV9gcubtEURhcHcd5a4yrcIBykeGeOwpc/gyEA6o10dGB1qkwgJCqBztg+iTRh/7gTMKC0QXLJoSPn3izbZ/geMQ12AHYveHSeVr/cfCGdOFMiW3ysMOqJfAEtMIGKE2AqIXTaXInCRPgDE2bXMtoD73DDEIVX4pUs93ejURRF4psHDb80pIl8WLFhHgZkCXjLV3orDzjI/sFDFGk6BMqWBKjkvAqoX/rrkR2YEeA+8eq4kw4AN//HOQr7xI4ZfiS8k010w04x3mi66G7zxok9U/c8D9U6VjWTek03TILDaA5uoPh0Ebv2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4744005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LpG6Lk/QRzkW2EJhwF4YF4u9PMw2OfCY3wpcRm1mrFt3Brr8gBtRlL8GwXKx?=
 =?us-ascii?Q?dF3ogshTVaZt9xv2smVAR+S6lqVOCa/QbrEC2iGBME5VvxSaVGI3MYNIDeS3?=
 =?us-ascii?Q?k6BOO/plxX/U/XVPL6jJ3nje2WC7MvuW4KOmNKs2iOKdqW0EeLkCDlwUoTQ8?=
 =?us-ascii?Q?IC2B08/zvooDHcYikIvpxN1sk9C9qQxXAi5ml5lwinHGPM/Fw8+cOb9CMpVg?=
 =?us-ascii?Q?RZNAnVurozQ1dAyFR1HFLQe/aQExYlJok3MXiNhdDngV1CVRdLhtPCfSZcqQ?=
 =?us-ascii?Q?vJrbRtYUvMrnX+Cv1Orts5ICP4j3Ij2A7kqQTfN39JD87/OMbzaufzgfaGKD?=
 =?us-ascii?Q?WO4584x+48PDQJwk+qsU/2KSQshdixf49J06WX1jA0zoADboCiNa3pI93w9q?=
 =?us-ascii?Q?C/KVO1zSxJbdcck1wrQntOAV4B1W6v51jN82hRbcH9k6fOgIrV4uENEd1vX/?=
 =?us-ascii?Q?FWJuRz5seDvoxB07TF9AvIvTxlYiuBrJtlikZUwkkvlh3zKdDGXo89XvIP7U?=
 =?us-ascii?Q?yImXXhpnOPfhGxrv6jONXhbjeszubtkF99O4Dq9yEsf28rQkXV3PD9/6rM1g?=
 =?us-ascii?Q?QpXwdv5PgH8FVEf2GJc2QmkSnI/tLJXlVKPaJubN5GY2IuDGds1kFF1v3PUK?=
 =?us-ascii?Q?q5rD76FjTp24g7O8IRpxKCu+am3yqIF7wGs/XmdjJJnRBnWg3xJ+oV+uFxdP?=
 =?us-ascii?Q?dxmak4yJyb635HshYhSLIJ6xqRnSIYy6Cdzmi087NkkO3499T/J+nJB95CIE?=
 =?us-ascii?Q?StHN05yj606o6+BCiz/BaMMfCUYKQRn5t7y8ZxO5iZ42CF2WPH+qOUeDykcU?=
 =?us-ascii?Q?8qBNSwKoW821M77Bc2VfLa4896o39tObAG+awvWxLk9sDd4zgWXLVohp7uwJ?=
 =?us-ascii?Q?pX/0HDx/yCLVx1NhZd+W434eDI/t83qasdOlIjw5XrXrwH7nBB+GpFr3U4NQ?=
 =?us-ascii?Q?SrCJg6sO3Vtkq30dR/M2t+buCjj4gR8iNbAncCT6p9sxSzC1B5rXg2RYCCb1?=
 =?us-ascii?Q?yFSIWTHlwDtrgt+vYxWGFfsQxfN7oi1Sjz91Xcg6Vz89Ggwtn1OowUUTyRYx?=
 =?us-ascii?Q?Qq45rzc2aT951o/XoMVvc6iuIZE7zCuiox03Dny6fvoHEN1MGiBEB30OpR3z?=
 =?us-ascii?Q?bMrIUHeC+g6T8LIa2sbVh/ZItVNM5SMyM1p5GSZbTm9iFOqcEX/T4HshGCL7?=
 =?us-ascii?Q?pN/wjO0PimflvbtVKsrOh21lmZiD5h5qg+hw+L8TkmQwwlch6aPK3Aa2Wq9x?=
 =?us-ascii?Q?aLUmbhOcr5bIonNnSMr6xfm5cqMFg7BgNPKd+LTCBHUtKY6hHPXsRtf2yw+G?=
 =?us-ascii?Q?shyqwb66xH1lvQYoDTVLspwg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcca708-f61c-489f-9a1d-08d92c02a273
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:47.8509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GnHLsNmG/R6eb3CTOCJArcQawUmLvclGWEl2D+m4fYy4DZSiMTv5gGDyhYbsM25Eg06BZMBv/L439+UWTqLo/b/e9w7cayOpb6rdOkwuJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


