Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575343F5A33
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:52:35 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISAc-0006FJ-9Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRya-0003dg-E0; Tue, 24 Aug 2021 04:40:08 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyY-0007eD-VQ; Tue, 24 Aug 2021 04:40:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRkhZ3OXCmm+VS0P/lesF+2l6bl9eevRdWJt0AjKYIwAR8kQ0DzHlZJGHTdTXmLNt34hRkUBbM9/wYoZqNNZmfG3wZvguklyptX6Qe6SWOiBOoCSQs2jm4FHYOf2baACbl7cYLvSaOVZEvpjl9GRzrWaN7QvNdrP4HABku3jRs5r2ZfXd6Z1fLGEPQ2L705yLYwG43oqYiquWktNRBiE8Nklt06+K36u7GOUJYiqiECkZCXGvoahPaFPcgWbJS2J9ZXxfE3v/MEEy7FeS/k2aPpZfUSTrX6dygif3WSD9vK3L63iqPhqcN4KS3Yl2co74eD7F7M+zfMXGpI9+SZhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=GKM/f4g7kOn2dIfCB3YsvXIGmcCJ2hxQ1/5HLsG3gjDVNWI5HsoIRDlqGKrhihPBse9ZHtIaGYvGBbj6AseNh3uRTyrS7mFmhEuv8ilyqNHllI2VT7Sd8nA3e+qws1hOfEG4icNrXDfC0rweVN5c7SZgBazL9gLhxM41mzb0H+75AoRI9kVFHTenbp+C/VHZ8VOBUIKpmBepSoqegf8a38MFFIr+/WhXJb+zOlarSUshWZGmauO22vJwyT1tKO5Qd72+JLw44hfbtYZGpcFtCB+JAIUrG052QY7CHrO3g4537D2zjTlh3NVPcCVJd+eBdVrWtMo6RlftU3ABViQYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=sdqaqTmumBq0JLZoCEH9az+z70gnHXw53H6rxx3RXcrxOn0fkCKuCH7HrJSrdd1WRwEA8LfG4GC2YcwmYp6SJMRvb2JLOghGEQ/YkIKqJS2pJPxnduW+XEv+40AHY8AaDhDpxuZ5jB5ALcXBhKcxvixnwVuTERzi0mFIP4QETn8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 28/34] iotests: move 222 to tests/image-fleecing
Date: Tue, 24 Aug 2021 11:38:50 +0300
Message-Id: <20210824083856.17408-29-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79081a19-ae63-4808-2838-08d966dac044
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088A3480878F4C6156FC263C1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbuXObNz3lE9TtblFfjXcgTVCnkJvSpk34uX269gCqQz34TIk2Z3DqwDk9U3UAiiMSF1XCbCZ0hqSY0xAduza2Gi2/2BxFGtjxLHX+Lx5GUIl+MM2YjlpRJY8N8dabTys2lDAU91+PJkBNioF72KaRd1WaDPSN5+htKEoiIh0wyKWDIaHLovFnHz/+5ggQziqZdNhpc67PeSeKaRRdcIAqm2cQjFjE/xZUhFogOOrUxTlw9anXdObvBIcBfFM9r0PMtRotu8woquOlrAe3Zvi8pcJRiBIgghvqNZp6PVwZmoIurm/LCvF7g6AcDVa81fXmEEgsyw7dRhb8amUqJcjhH1Pf9Pa2jxTHAkyC8ncJKslRtHNMz2cEv0M31DMurOe/TFI42wjgWiShxp8xNqmv4ZUwm5M6WcT5CfE7L9ZtkhZXnumhfxZOiiUmq52fqSx+oaIbfjD+3DYcYBGFfsUkrLAw9lDCtqutgI19aB73J3Eo2MNNLBw9RUkprPY2zycWn89fJ4d1x3YWF/OhQQHJ7AbYY5qYA/9qTy/ahxQp0pHcLw36fe8Zw4Jpnv4q/W8Ql8Fxvh1FuqIHBQ894mI5zmX1a/jzldjN3c/ZKyI4R0Ji6voXDiM7nypRKXu7tPTl+HjTAJM55Yk3kXYROwQHxVX0boPDtYnmnmqxtl/7o5gmxw/XKfSp4fPH3PniflUudqfaN3ngKG/y6BAEyZsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(4744005)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJwyqy6HC1C1oy9P2WK717ZbUTtDmaO8TJsHXmt4ixJqsHOdHVuGVdHP9Jqc?=
 =?us-ascii?Q?XIamjgq00JQI701Fo+girdV486c8OaLzLCwI0WmaxH1OmZMwo63XKO7YBNgw?=
 =?us-ascii?Q?icX/HpDzA5R0gvGa0BEsAgSEBfyssimbP9V/FbqZMg+dI/gzCrnbt3a0RIhB?=
 =?us-ascii?Q?6MUWN0YkLMzM0AzZcpQk8xAJEu04Vk911Hllr0BH7RcjBFgvTxe493akMi/j?=
 =?us-ascii?Q?K5GVIEVy1Lp2srPGsVZSGAWBW7uO8F4z90iMfkIO7AMed5DBg/ubo2FwdiP2?=
 =?us-ascii?Q?tc5L6WYh2ySV3805yEcPlV0AnrqsmiHFvreRfr8kyHxNUenLKb7Azzw/m1FV?=
 =?us-ascii?Q?gTbcDjijXQxyM0Lw5b1gtY3j+xsuMHacsfS0K/VYd+ruUR+V8NmQ9lvNgJKs?=
 =?us-ascii?Q?cfwEvSsCzIkT7Mfr95wgi5JgI+Cgdx1bVzWaadOoO4cxXvyKQ623+bV5CLhY?=
 =?us-ascii?Q?FtlHuTiUNwEvfpx7QIdjcVyLCHB6ysD2vC5g+9GaSG1bK/jTlqVWektZDGws?=
 =?us-ascii?Q?V5rQuxV99GiQ9T+uKeaWUKF/+uIM68dEMufxqwF87mAU5eYlCKcAWdlTEJ5H?=
 =?us-ascii?Q?0czCYoYhiCty573e97Uvz7qAXBNRdbOyBOIX8R2Hoe3itOnn71v9JsT40rV+?=
 =?us-ascii?Q?REJVLIDuSK40QM8zPqf3J8Q3UyDk3UqTP+iLQvzEEhOw9lwcv+oLOr+JpvEb?=
 =?us-ascii?Q?04Jvrai9s3mx9HPun+8glhP4Uraar7wwuW4TNrTqPHS82feLOz+T3knD9tEN?=
 =?us-ascii?Q?dXKzzfDKq9QehqiylZ8Im0Z58hwjydt45z3ZxHXDBhnJvw2nBEX9G9A5xAKj?=
 =?us-ascii?Q?zYHEpd2gS9XXmOjED8W5/0bTXnMIzjenAGbAokqf4gHXbSjtB9v2Cr1nI9by?=
 =?us-ascii?Q?au5X8IfaMeStJl7mDMLzrnwtphFpNsjRdB0F1fR2LYR68C/pciLsSotkdd2g?=
 =?us-ascii?Q?lMTElQcNjmTRnPeEe0ST1NmphtJHLITyIk/VsY0tbd2Wi9PzsiYpw0rNPAIb?=
 =?us-ascii?Q?FObHWMGOqDH+SzcCLLt/1aynr9Q43PY8h03bg7O4ftkGXLDsBGmOGaQuAx4w?=
 =?us-ascii?Q?WNFlfNgMijIPtNO6g9XKkwmdd7uBOdSu31l0sQw6YLYH48zvysRDnfGfLZdU?=
 =?us-ascii?Q?Vv1tdfmFgCAlTpdIiV11EiZsROXNGv9zqNV+/cBZkJ79VSlVE1npwxe4y1Fc?=
 =?us-ascii?Q?9zM5lgN+RQZSmGxemnHrPq9F7DBJTFnWGEMUJdLVjp5F9e2vOnKTxp+UvzCf?=
 =?us-ascii?Q?FE+8XbevyVDASCzyaN4MRBA1p74xzskIadBTWT6RrupSLPs7TYOK6i+TDPOP?=
 =?us-ascii?Q?2IF7DJuzDrTjVGY4PB3V314d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79081a19-ae63-4808-2838-08d966dac044
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:56.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKHBUCrnMu6XUmBggOVU/MuqqU+MAMlt3qBpub/t9NfkAl1DegA+xhG8vrqRqttVVks410/MX8qkfetXBa+dcN5+18GUNBRESATw+NL8kt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


