Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626453A2ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:53:18 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJFN-0001rF-Eb
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqq-0004Vz-7c; Thu, 10 Jun 2021 07:27:56 -0400
Received: from mail-eopbgr40102.outbound.protection.outlook.com
 ([40.107.4.102]:59870 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIql-0004oO-7s; Thu, 10 Jun 2021 07:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+v/RUGOqD0kRlK5MZLG1u9zeBNvNtyu+yEAIB9nbugWot6tqhKiTuY+HUoEO+d2n87iPHh9MClqvaDQqkxz0hyZMtwL06nv0JErW5TcZlk493Mrz3q9odfU92e/7WIvJ0X+icQ7Qgxz1x2lT/ny3Ne4wCA6V8NAGoseYlg9y3H2XcCqLct6jFRQRKb/MtC38KYSG7cgatVLjnDNnZzEfQj7LEFeTpSLsBI4EsWoNOV4ErmjbO8mVEnhR7EcKsw5/CF8rfOqFJd5NwyxromLUDkHkqGfCDjTbfyla3E7DY3WgUnsbepgVNucYA1yxC7r1BO0jUVaONB8JPnjzDHfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=KcmdXkpH/pZ0Fe9jbbyzBTD4KGppaSlo8ocr44lTb3aZoEJ1vGG3hTOaoWtzCIv0UKCkvbSN5e+tJQ1EjgPk8hQh/7mFq+ssmXwbdhmCxt3nq8PY3EU+/YMwsEZk+XSRxxAH1zhvTg+sXeBWrV8vQzddYg4CeAKZMzOGu+Zz/xsN7RzWwdKHiShWKq3095FRtk+aWysc8woNkzC9OTtclySS6WidC+ykXc/MW1fsDl/zK166guj3ymV45iX6gU9lBsi+P/bjUGWXR/Xakw4kaUB5aB+8lkmkKqqRG2/QnGg1SPXIbQ0COhISfCQ5mQsVGc9Bis8+/qRS0o2K6NwM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=u9nV+MzTNHn259reIv+Ee0O98itLlRocNZUUdzHJt+ASeU0PUuVQ6f1A3GuvYXH/yN0NP6slfgP6kOtuYa6gEcDjQ4PK5mnCRZ3U+uhoZrxjGj+l9XpxamhyyXMtAciJFgU7eA1YKxWPLeC111I6uAgmvlyIL14WoE3Bw/MYHzU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 31/35] iotests.py: hmp_qemu_io: support qdev
Date: Thu, 10 Jun 2021 14:26:14 +0300
Message-Id: <20210610112618.127378-32-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23b379cc-b8a4-4da9-5961-08d92c02adbe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381EA665AB7FD10B1CD7591C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ycx8DOBc77E5q89Nisk4WrNhkDQ441gttKyODdM4fN5mKhGqr5GH9gTA/DvtD7fM1OlX1OEu+8EROmm7zkoAYscAPejTn1KuSUEdwlATjVfRR2/NutNmRmPlhKKbVEE48rCJMSmMeRhz66hOOOdglCpBtuWZVA/GD4BMVEnX6/iEmONIXEAPJGUNW3+GTIBrY0KgZHcnqhCM0FjWMYtZQ3WOcD71sgYmaIhO54mgrW7viq1ECAPduYDZssXdl9QQSa3GtO/vHLB3mA1jXoUoLmrlwt8foIP5d5PVzFACuRt06rn1CFFYJ2CqzBYrwUaMj72VaRaZlv5Bgnh/b7QNC3tAe8KLQum0GhSm2eQqeAWmucCZ2UHjAXBDIZYVjaH2IMzv5/o2nI+ULsNDWfecrIHYuvZDjNwL8tAAxi4mUaSLw7bsAUcWqK77tPq5sukmnHBZkweFDQP4aRip4NtXD7J2t6ZvxTUnolR5SLJQexrnQPndHVRyhS1zoMCfMVV8LDggGWIisxxJqVjOmxA//O0L8mmbU0NvJf7KLGb8koaIFFjwpbkAleMFvLgayr0xEhvYti5/qNddYgPNiCKBSNM9/S/5cYl9bDKFr6mPblk7sQhyW0ZVyIA/TrytHvVuD2bOrvsG/f+rMary/CHsqlfhXYaGVyNbqbuuhja3pliu9Vc3F8PshMeScZHR2Tc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4744005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8ZIrLJ3QwZ7SeCJydtzxTrSNJH11nSgKBpfe7/glTIvmBVAP5kzQLPi0oKaw?=
 =?us-ascii?Q?k7BtP7gmXPX4MjC+GZJsL0Bc9UIcAtbqPeqclqrg2XIghP52jR7jAXKyY1ds?=
 =?us-ascii?Q?Yg7dapTsAt5iWSf5WJOvepJyaMw4jeQYvQUHzD/4xOnPFHxCDjcWHDwMkEsj?=
 =?us-ascii?Q?mJHuyGG7z81q2a6jQjw/9L5uw4FoqbF7k1KnVZNty+hhle10jIxpLqzD9hob?=
 =?us-ascii?Q?UkqfkxxvS2N/6mYFFCVdJksv9EkiPdkyximpyVCRydUQMdJbdhJ4VmLf+nAB?=
 =?us-ascii?Q?8ulKgtUrBNjo3fDpMWf/qKZM8U/XqxGG2SuPET2jV24nwRx7OTrTaOZ/iVPG?=
 =?us-ascii?Q?wRtues4Wt7ykMnW3qAcy2JCJZhotO4rFtOhLf1lqvu/gN9cUIzOQpI7cocO2?=
 =?us-ascii?Q?NdtszEL9hXepe35WebZR9v3150yaXV0J/raFESfaKqKK13ehTEw8F5kj9q5q?=
 =?us-ascii?Q?T0FzqdKh3N4peikhfPAi0f6t742Dy8upIxXGQ8FtJo5sP/jTHeA7pgMvArZY?=
 =?us-ascii?Q?ng2+35oV1ZD9koeOclhIZXGrOhixp4++QLhTAGXJAVcgR05TLYWZ7BJM0vLB?=
 =?us-ascii?Q?naydSW230JHxPTrhFc7H2rmTRLq0WZPawPR6wcgcC+FgFNzPGzRMmSnq4VgL?=
 =?us-ascii?Q?qCWIN/D4A2xWYa8bi94eIdJhMCCFYRvdpPy+fKy5OpMF3mPftMCR7IUuOqUG?=
 =?us-ascii?Q?YZlAFP4kBMp/hsZ1iT4QVO/F9Qov4MClddaKGuaitURfcYGoAx4YNfAED5I5?=
 =?us-ascii?Q?ZiyihSjm5GqGw+gdaPxyH7SfJ7RrVAHqgraR9176F8UgzILk/pmJmU7roN42?=
 =?us-ascii?Q?7F2j3RpfEDhTJ/tCs+FVEcrRsSNkKtb7Py50zxCKREdcJQp0HTfwa0b48WcY?=
 =?us-ascii?Q?rNRnbuRsZA19pZm0lD318ZT99XopEZqrFA+JDQK3I+LwZlnP+yTLgcl6q5AZ?=
 =?us-ascii?Q?C0j3x4FNlhdPlrhM9lIam0j0+FM2IYkXjRJfINfAbMsDMDwMwt1yvEnSlZJn?=
 =?us-ascii?Q?0P+t390r8t5vsTJVLnJvZR+C66/4/qMgLzMEgWAU8GJCrXT0Rf9ayBDdIIQt?=
 =?us-ascii?Q?78TIgT0Yj4hAH8PQeBMtJNmRYSOY0ljpHGwDacfTIoWgFUAycwAMYOsPyHHN?=
 =?us-ascii?Q?0fPN/wFEjO2B0WkUqiq1lgeqfji1vd8TqfIZDIoVfhssVXgk8hYcwlouwrE1?=
 =?us-ascii?Q?H+WR05KoDiC0Mbe0oBUlzprD1HgQDQZzISaweAKtp287pDs1m8ZrMItgHfZj?=
 =?us-ascii?Q?pSonKNGUVrefj2OkGagsxneuXL2Y6bAJ6cU5+dbIOZkl+MRN2KpFmY00zjWC?=
 =?us-ascii?Q?0K54mt5dHOeL+iiGWx1KAZA+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b379cc-b8a4-4da9-5961-08d92c02adbe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:06.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGBlkn3A+Or0IZkDjrlSDaIV4bLQGws+N0JVDbeaFtoMgEhM4JAlljhArGNB9B4IUkmRMvdSDeai0fs0dzb8nXZTmJO7FoYzgViQPKtUkgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 025e288ddd..9d0031a0e8 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPMessage:
+                    use_log: bool = False, qdev: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
-        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
+        d = '-d ' if qdev else ''
+        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-- 
2.29.2


