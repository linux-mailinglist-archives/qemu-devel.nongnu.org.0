Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272C3A2AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:49:42 +0200 (CEST)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJBt-0007ss-Dj
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqV-00049U-T3; Thu, 10 Jun 2021 07:27:36 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqJ-0004ZR-IK; Thu, 10 Jun 2021 07:27:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O28JpC9RuxTooLzqh8LQMcoKQqALeIoCzIRHjtAH0l0NWtvK3DOHPxlEx93pI1FH5JWc5gJNxHXjC1ELqeFJ9C/vjOhaQ0JENQcmeP/QwlU0hvwV2bUFM040lOq1rZUvmJOvoiYiiHBEwgJqvUkokwUzpGAViNAuidrnvuRRgCmcPplEMGyutA9JqkV7yvW0GvKEZF+SzRmm/D6uWSB7rwblfsnIxmbEkEv9xhFe2zoZw/j2v+6Nl5QyjoSNM6LQGss1AA9LIRiq6NcxIdtt6sEtyug6mf+AioXlquIJnP+yzKfH4FTJzq1ZXrUnRmB3KCPvmimBvUj/d/nqA54zWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=KbhIxxmYDEGCa1zeBKMxVzpf2nK0zIFGFcmZRf/Kh9a6E9Udh3svS2b1TYe6wIL2jmlbYyjCAfgx9TBSleYTa4NdH8QInUNuscgZh92ZLfxBE8rdXMwk4Syi56sEacW7NvcDlkDIkbNlU+NksclaiLGI8DqPRFDBTdm3w6a36mY3qzweHZPR3RQ3sbIx5b1tBjXHdjZ4nvVIQ+cRV9tBzG/wU4jaK5fXIulPaZ/0y05BeRQxjJH2uh9RURfaIOuUd4vNKN3/RPEWoSKe8sV7GSA4xMyPkrRNfaOyt+rVxnUTEswo/ZhxFVHzZKA+spfxdxO4wfh449BLIgbe5zqBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=wWRqnxwDhsD7Ju9AKTSSmLESVgQBrgGye7yhXT7q+ThzKbVJDitP+y7GSv4jCtpoDPtqiyFveG1Vuw7XyBFb50o+MBHktU3gMM+LcCs0TdZ7VV/GyriJapBcKYrNqtuKtwICU1IaEiijX+4X50QXoNaGS09QVy9VW4CevlB4C5k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:27:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 27/35] iotests.py: VM: add own __enter__ method
Date: Thu, 10 Jun 2021 14:26:10 +0300
Message-Id: <20210610112618.127378-28-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7885e2ec-d9d4-4469-6c26-08d92c02ab47
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628038B4DE159B626A2ED064C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cC3psvr7MWpY0F+h9pyBcsSoxiLSul/sicjbKCdeTuj1Tgn/IT8taA38eTXjzTPDMNAhqYOdMmQ3ROFlEMyZvtWyIbZHzvFpFxnT0mssTMU2acT6bVpvtujE31dZaq+wtj+WxdAY2jrK59h9u6kAbI/qDItdjj4vjO4UCvxU9+sPHsQwsmTTQDyoxpkys2QeunfNouf1lVgSUrvlCISWV5SsNoDgXkstRcs6kQB5JljrOZK7NRIIWYWcxSqIskEyX+L5f4m8exH81GnLZhLPNDZcICDjvVRasA+A5qsrKiTCnWXzyAEkBR8QVnPqsRTkRH/h7Sd0vKrB0YrrXh/3YJ4ImEdKzUPhtswrPod5hB2eUmj4Hvag5F6Eu1REaf335XSsslhMQWxoTMzQTdyM1nxN3nNqhs1Lsfs/0bc2WXJZ1pzCt5KEEjR4jCEUpvs0YS6cvsNuQJUMjq3XA2cVSGhIoOCKy8JIW7P0rAiUTMf3K8ebfzTLIqvAC/q3kphmkpW1zoCAfDwl6cmaR4N0M8Wq5LCamtux/Sc6irez7v9JfJTUN7DVJwNa8kq9yWT8UIozrp3PYaJF6YEE/Gv7pV07TZ5nrrhcvnBn9XFLxemEbWSuoQGdnsHUD3q92NWiuVg5RN8Jsy/qWN5UW42inW+7vNVAUh5ZFEk/FuANWUVdSV28eY8FP30HiMuQnHha
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(4744005)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YE75tDoTBiWAmtPlkzxtdSSgc1ahvBwWOUPahe2GWP9W48m9NXGQ7jyYRJor?=
 =?us-ascii?Q?44PbO/vPCjH1UhN68wSDAFp4M/klDyjFrFlCpTwXKJPSXrw1RLoOcT2wrcED?=
 =?us-ascii?Q?Qr0xwdGzDX/aFxDuTQAvF55CTuoodEJZsARbefQlUwVVeXib7KGvvsAvcFou?=
 =?us-ascii?Q?24TpMc0RbTurIovk9TisTWN9hEf1xlyJkIbZ6maK+otZi35Gh/zOXNGhRO19?=
 =?us-ascii?Q?6fsjw70CVnIkkOusDK/Y83D/ivy1mERXyxKDO0oJKAIcXqyX4OQk3FJMOMWQ?=
 =?us-ascii?Q?bUEXuWa/ARGSxwAwTy3iQ+peBN4stks6U/SkOVUYi5mi++EuyXf4PntNjW36?=
 =?us-ascii?Q?A7N720FBtj5LN+HhJr4Gmdm4o228IZ9FZTPGPwYBIb+3hzB5emEPDKfdJY0Z?=
 =?us-ascii?Q?lFH3clVr3rhUzD5hRgzmzBueMAiZvNxvn50Azc5Pl5ND6CFSwiKiZozcew3N?=
 =?us-ascii?Q?7knIiGPDWa+r95OPLuWCJbB8h+LwDzqfOcw4KoMvdr6Dw0GqgVVTnJCiqjGX?=
 =?us-ascii?Q?SMUEXp30IYb/6U6K3vXdhSfki4+qYeXF1qGfe9zuAp5oXhHZXYV/obWdEGyD?=
 =?us-ascii?Q?a0sW4Ey0V8IY1Bl4AfDYV85fPK0hX1lOX9CNh62F5wUkSbZv4yMA5Qyj/+ZR?=
 =?us-ascii?Q?JLawLXtrQgXU64Hl8G15aPebZLhfe0Zott4zT6rqrEbHpYu8BtAFwQAHsGae?=
 =?us-ascii?Q?Lr3461y4mJ3oKOVHQHh5lP1G29rMEHHyB8ZF5h6SVn+gd0xv+IYR2D1tKucX?=
 =?us-ascii?Q?BpZ7holfg9dNRNzwjlDq0UfUAAAHWx9OV7XFZ/sGeFwR5D1aNtpSRXWJnQS2?=
 =?us-ascii?Q?qaasWDG0g+CPtBT2ewcMXpNzCTduU1Rhwor902fOr1E+yoLIEufelkQI4O/O?=
 =?us-ascii?Q?mshDhU4riuRqafG/+lKQNDGCjlMc6xx0N75lis9/4FHf9MB5MqsR4lM2m65o?=
 =?us-ascii?Q?hswO8DpecZ2Atd5A3978+0f79mPV6RVCfaBtUoLs9BNKU3hwTknCqDwty70D?=
 =?us-ascii?Q?x9t3l4AeNfUNQLNhKPzbWHiiJL+wMil48sn7F2SCDUOEa9BCQi/ZRWXM1kcJ?=
 =?us-ascii?Q?H5hqQ+iU4UbgJ6A7H8crY76R1MAoUfXBfobGrO+MJbdo5WrCbaAg6KiJplDG?=
 =?us-ascii?Q?gCB4O/XHml78ROx1ZjPuJaZkLI2Uhmta+DEJLQl6WKrju5LalJ/QLfWtxWhp?=
 =?us-ascii?Q?JonYbiUuvuMTX2oSwiq/2EHMBuH2v9kQXFwmVWBLj2EHmnE+KivCPjy3iClZ?=
 =?us-ascii?Q?8Vh1wsQoOLLnqUXUMIjiH0YEFUGW3re0Z2Q0twxpAXQNrQr9f04g5ALaQZCP?=
 =?us-ascii?Q?JbU+j6icCMp/mLodhpEAnYVQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7885e2ec-d9d4-4469-6c26-08d92c02ab47
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:02.6728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afPq0mpKk/HHvY3/9pvIn8gxqIGqNoM3tIaTdEm4JKIHH6UrdYQxf6tLkzoW5S3GG5oUq89aqEIa2yj+B9EEEWitniJP5WetN7R72qKb298=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

In superclass __enter__ method is defined with return value type hint
'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
type hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..025e288ddd 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -568,6 +568,10 @@ def remote_filename(path):
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
+    # Redefine __enter__ with proper type hint
+    def __enter__(self) -> 'VM':
+        return self
+
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-- 
2.29.2


