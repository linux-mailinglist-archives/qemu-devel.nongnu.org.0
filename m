Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8867308A26
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:17:10 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5WSL-000733-L9
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5WPA-0005rf-Ev; Fri, 29 Jan 2021 11:13:52 -0500
Received: from mail-am6eur05on2136.outbound.protection.outlook.com
 ([40.107.22.136]:56000 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5WP7-0007JW-HR; Fri, 29 Jan 2021 11:13:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S54dBrxJaPiNCFjO2J3osXE454A8I4hcx1HbR4KeMNAcT/isv9lAXNXsTIB8LQg/uvPrKrBt8LyHHLIlu9TElsqUtU5PEcIQFu5R/phpv+LdRON0RYzfg7+NgE38moB+9qHeoT/mx641VBW/zlw0d9e5evU6Cy1rn3X0evhKsrToHEcVv4dghiCae4WNg7ZPOsx56QE92VYO71MclNx5jDd1tH5XM+VvtaJIokSgtrCPzVo+ABnCMp79LqTHy5ggyGyCzpWkB4oiUxaB8o80dk8BcnQ0fr/LTwpKd/1YdjsxbgjfE104e4x9YuDEL29Vt+oDoCHmZVbp49KCgfwqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AItQ+EEkS/VrB7Yisb7nfXlI3iBp80I0bR+SfPpqaKA=;
 b=Flc6A267pIawPhZ9hrz1FVTz9YXuUGfYt//9xi2Z7UYd8LlA2SaD44iPCcwp97yN9L2ppuLhQoGL0IJ8+lPFWp1B03xe/1rE9+OnjU0a7B531Be8N/UTByQ0e8anZl5Rc2nDcBruEWnQpoFMNdXsBw9BQnSSh9IarwnUpIPZklVXM/kn7rxriO4jep5zKNbM6JIZgW7Kp6w78JB3S1TEViCfBO20mhEN9ye06Z6xV5vBldSaw3l1smAZZffyJcwJJCeiMyAnNT8iYa+hYDEorzNhpAgrflSEuaM5iw5b01N4cf0CSiQnDGqOYcbbqW/mTG8xI6xq0c7wgraWlhGWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AItQ+EEkS/VrB7Yisb7nfXlI3iBp80I0bR+SfPpqaKA=;
 b=DcvEnbFG5gKAtfs8ZlIw3pq3Y0yuw/nqnMjiTZvRQTCEXYJ/cOI54DjRMgyDVAKy/UPvdhZTq3zoqjmCUNovhLGg4+NKeSflw88mN1mtQK8uoCZQZghBELBR++vCGoiw5nmO63+nC6sC1WkvCTEvbIsJ8wjDtbtrI1ANFS0gS+g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2982.eurprd08.prod.outlook.com (2603:10a6:209:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:13:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:13:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] iotests/297: pylint: ignore too many statements
Date: Fri, 29 Jan 2021 19:13:23 +0300
Message-Id: <20210129161323.615027-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:13:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb659e1-2e5f-4f86-3741-08d8c470d8e0
X-MS-TrafficTypeDiagnostic: AM6PR08MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB29821EFAF1252D0EECDF6451C1B99@AM6PR08MB2982.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWTnF/w1Q9/MMyWh4l7gLf4w6DPe6LR+RH+HT5829wxiZ6CGh8IUL04OCw2Y/FpFk0owvgRhkvzVxK5pbB87cC+NXaEfdexV5ELw2YBBBbBOixAgRLd+lVkTYYB/fca/XFaxr3eR0o9LVfo59NrAn/QFQ376pZ7d8ynkrgbpne+ybzy1Q2mjyEuQhS9/RC5WgGU1zdTsZ61kHK6IhFdOCsI8Zrog8HlpUPntA3CK3yPxTm8E3R5JZVSUlFIHgkHvbszmm5uZFxbZgck0urxCkFKciS66CzJIntjDuuDGNLDkd5pbpkc2B2vSktMzjpvPvtw9GpukzE/SmydDO4yM6hvRkueQWYdTjAhyX4iHKaebDxksXhM0PWeu9g0UQ5Lho1D4Yx863nNoaz4HNrERwl/Xka3ijzSnW3h2Xd7+KkPA62K9uGVyDCIsPk8SuDiairtUuf61dzses4WgACZgj4zRh6XB17HPBz4/vAOcgNzOtr6cVVR+7VxIGvtm5zS3eM+/pOE1uwroLksdvbz22A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(366004)(376002)(396003)(478600001)(66946007)(16526019)(6916009)(66556008)(66476007)(2906002)(186003)(8676002)(6506007)(26005)(4326008)(52116002)(5660300002)(86362001)(6512007)(6486002)(8936002)(107886003)(6666004)(83380400001)(2616005)(956004)(36756003)(1076003)(316002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y9aMwZe0MrcmBXYMAxWllVD7vRoTSvmrLBBx4T79+fNxFvM1UEW6FO9TX88x?=
 =?us-ascii?Q?hjGO/PtTQoVhOEAePFbvroQq4yfTjQBuRhGnYkBqyE1MSVDvlvNS66pFwDqc?=
 =?us-ascii?Q?e1ByxdaSEpmYr/M+F5tFKcJIuStzUirsIy5h6NNQSrI/cFoppCYNPOIuIa72?=
 =?us-ascii?Q?qqVX9q+I21sZCys2zV7zmP/K/8+62Jd+iDwY3CqFSn20sVWNAeVkFqmb1FYe?=
 =?us-ascii?Q?617dqXBBV31OcqkIuAq+zVI4nIcI8yuefL+W6y0JWYMbzyFXf97lHZlnPZnz?=
 =?us-ascii?Q?cziKvgBxxeDEDaR7Gfw5nLn9K3gmr3idtRkAc9WJWb9E+DJpT3fu9MuCggEk?=
 =?us-ascii?Q?DA8oTE/4iXcldGBKCmzxoqGJvndqHLTyQUo8MJXHXjqL+U3IJiWhCkAPXWFi?=
 =?us-ascii?Q?QPdecvoCyv8JJ1rYp33rHyUktkFERsd9+V3pER4C33Jv7C/VXJ2+yXwKlNFr?=
 =?us-ascii?Q?UTIfNbp7gd8lzAn1/1cc7kPeCTkoWYy3QKRI101fdQj1raKfauixq4+RLfoU?=
 =?us-ascii?Q?U7+V19Vm74yC9W6Qh3ZE5em7TSwjiO8WSpICsZTmnqPd3Y0NVl22+R0UtBXL?=
 =?us-ascii?Q?ugod+VHqyfNSn2frhd9KfcIpKE5onkRz0AW7kU+JEWcDR99KyzzZ0Gy4Ocfd?=
 =?us-ascii?Q?ykg1AtTNpZu12GRBHpNOBq5ZeTNhScnUiN6W8L0PQ0SBof0GVyDABXh38ApI?=
 =?us-ascii?Q?VENAH//Pg3Rf2JSL/RCkhC94pJNr4LWPlaodyO/Vx6a4X2lqTBF38ZBoDUa7?=
 =?us-ascii?Q?w6dKrVpB5hjV0sAnRUBDl4KYLP/teDXev5Q65iz35Has1cW+vv1VCn/vSzow?=
 =?us-ascii?Q?Hb7ksyXOZhGQnLZozIWyZSAl0PTbDPw5jBIn6fcepoCITy9wnqB8zLcvFiCr?=
 =?us-ascii?Q?nzMrv44MPzhPKp00nUrQdKp4BgR/AmmoZ+S4oQvQLx3afrk1rhdQjH1P/x6s?=
 =?us-ascii?Q?ODcOduWw6BWL3J/MIDesPh2mTLxWSlJd+7kzSpeQ+5wgGulyZcVweFsif1Kj?=
 =?us-ascii?Q?dIzVHvGJi5koBUoEUGEXEKjYtLZp7Mo0W3vZ2DBaz/NrEDAocuFQqZtefP0/?=
 =?us-ascii?Q?sWRf597MJBe/lAczxXJD0q3lNsbJSQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb659e1-2e5f-4f86-3741-08d8c470d8e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:13:42.9398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA05w9NGDrq66WzPyPev3Ou0xQWQ14Q/2FNghtsDqiukdJqaemzVxYzSmKJjYlInzHM/5N7qH/IskEH7tgbqp9no+CiOr9oqyLNDujdK+Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2982
Received-SPF: pass client-ip=40.107.22.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ignore two complains, which now lead to 297 failure on testenv.py and
testrunner.py.

Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/pylintrc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index cd3702e23c..7a6c0a9474 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -21,6 +21,8 @@ disable=invalid-name,
         unsubscriptable-object,
         # These are temporary, and should be removed:
         missing-docstring,
+        too-many-return-statements,
+        too-many-statements
 
 [FORMAT]
 
-- 
2.29.2


