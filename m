Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D42361B49
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:26:16 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJnr-0008Fz-6G
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYZ-0001rx-PA; Fri, 16 Apr 2021 04:10:27 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:61157 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYU-0008Kd-Ra; Fri, 16 Apr 2021 04:10:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAuTqvQxT6UuBHspUH+zs/XB0U7jejXeQ4LT+d9/vRb/ziLW95OaqsfOw/GxN9FWnpzs0kK2pA1Rm5T/hJi2XE3Ej6LpIR5mMy89e76vevBDqDtOurJbveE28TBLpA/e+ydbyiYzhaGjO9SM21wED19f+uqZxkTI3BfbCLPzQic/oJH+h5TZQqhxMzZmCb1E00lk8WMb+VkaJ1LoXB3IeLWIwh7QlFMF9BFZKtLSQBbMO/ySCsJeNlnCJYPEIK7YLlU03IVk2snfV71Ul1u1kNK4CcwWaxwasuhgAv/OWMHex9bNCro/On5yPPqlytOQpXm/VZUxLBfTKgJsmrZ8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=A5nQte5lH7v6Y63twZQsCayyVyJ/McC1v3bMnNAITVnRoqKBXemtv0a5O7BvRYZrXZ3V+TD1fmJkQTjFWNWTIp9t3qxFNYnTJ9GGvjrSzFWOjPUU7hjpNPAyYDcNl6Jmy+bnPS1wFRzuFGEhV7X0KdomZN1SYEZ9bES+1UIWGGZDJCgfaz6D70gMnqwvIOyJWlqpJPDoilrjq5Rby7PUlijeZt0w++gPWNreeGCjBVkqIF3WYOEOUCHJn+84rJl2aoMsnQU4OqbJ4wXzd87m2MFaujyKskGeF2t7Pkt8s4E0pYa+lAEvhRp/cRAD22j2qd8koYUxRJqskAIyHmT8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=PTyHKbCjsTMq828Of59jvwIr0x7GliffFx3t/PwpoOmdpmZ96riy7iptg2Hz6ABwDv3Uyv6Rwjs5lZ+1VT6yvXpNyGbWEKPofIBGiAnnqAktNgHQ3O3n24qqcSdKpLtm0Fub7iVzSvZZFi6q7dXMX+DOSO2sBVezhtdSOuMCpGY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:10:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v3 26/33] block-coroutine-wrapper: allow non bdrv_ prefix
Date: Fri, 16 Apr 2021 11:09:04 +0300
Message-Id: <20210416080911.83197-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ec4d3a-d593-4b68-d825-08d900af0939
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717B940E4555E53E69B0361C14C9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYVeWHN5hC9aFmPIPkVcp79fbB2T5z+jvKHYpagQo//GCq4mXJSx1o77PTVgWvEGwKHzFuZcklBbWE7k+rDQuL65KvXzALDfTqZKGpuloIaVGyKFhtD9nlIt4V+VVX4Dt0iiW4LsWXKbHq7V0f9w1W6eg5Q4aBaRD9TNgHFKQYVHhX5L8dByaP17ztG1+6GOZvTdtMUiKlUzwzhrar9Y8gfUvNLVAtNNim6zFTyta8YAhwmc5YzG8kuivMpdWvo7FZCoT/YeOWfRYKuuQX9fhL7Z1jleY6sEvl24Mz13KlKnzy+3AUduRJSdR+nxTIL2sW4hKdVTZLcFQNI7o31EJeEmZUBM4bzZWIdQ4y7tmy5UTqh/H97p7QDxAJZTvMfvsdFK3ooDBwI1E7yYaPPXrDt56EVo8EfJyc65QIEJLRNeetTRcZxaPHlbQZM6JFDQ+gl2NVLBPwhQBdB+jyvBgcxSAnIajNyNasWzN/tPJh2J3wAU88XzrICWEbdGPi2nNvNYVLUh0Jmb8oTWitYBsMWfvJW2x707gYS4PTs9W2sa5SwfKdRCpLdpOwPAf5pp2X2D750YsIHIdQ6ozcfk+xSgtB8vzTR79kYBHT8LiE613+/nqKuBX6ul3kekE2L1LTYn4We9jH+u9Hs7DTj3F7AeC7LeYZO4XkqxyNRASPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(66556008)(2616005)(66476007)(186003)(66946007)(6916009)(2906002)(26005)(6506007)(69590400012)(16526019)(5660300002)(4326008)(52116002)(478600001)(8676002)(8936002)(1076003)(38350700002)(956004)(38100700002)(83380400001)(6486002)(54906003)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dwaTGnkdO/hzfk81swVZ5U73mjdlxtCH0IMCMKFMW97ekwd6hP5LVTkDghqo?=
 =?us-ascii?Q?aaHDLDO0LvaPDJEohbINqvNTSvLN0yQNmAAOhZkaW/ywny1HJMQAJ2SHImBK?=
 =?us-ascii?Q?uvV6SSJx9RAEERdDy3AvT0zUUgw5ewG9GIUaflMK+3xes3CkpE/G4fNw8btR?=
 =?us-ascii?Q?8tYIsBhwT2UNeVXHqz1u/QebOWb1u7q1evkx7Hu8Q9ZI+NWlnNLWhPiafKAg?=
 =?us-ascii?Q?P8Gh6lU1ENKZRihNCWWoJFZkNL8dnuACrXmCXui05O32ntCJ+eiUauygwLZX?=
 =?us-ascii?Q?rgb9EVrS6RyLErS8mife/PzHnM7wBNuLbYF3qsRBy4WD+0K5B6gIQEDbaaD0?=
 =?us-ascii?Q?ykAH1/GtgG9Gn0onIs1eFGsceqWp+FdDQxOT0NyhvpkqSuQAqT2iaOEMAkPC?=
 =?us-ascii?Q?eSjwIhMpTM2a2wVC24qSibC0ayqeeZvY5UxtXimgmReem2QwjvKDvas53nWj?=
 =?us-ascii?Q?5MpvhLbcEEOPftmbx/D0sSb3zgdMBPBWvfz1FSvyjeHcJEcOllfY0zeeB7bT?=
 =?us-ascii?Q?Kn8Nl6yg47PVVOwFOmjnG+I5Sy7O9bB+mqyqIyf682Uv4N76F2VgoPZLZKl8?=
 =?us-ascii?Q?BgjB+1RICCHdSE2zCFiv1H31oxk6wwSzKvMBCNlUl9cOfjdiaiBmAFOULG6v?=
 =?us-ascii?Q?Gp+8HxLhO+rTaFwtMdnblEGpOa1DF1T4oiTEtYvVE1YDFtSvYVtORir7M+hs?=
 =?us-ascii?Q?XqRX7FnCL6zlMhHyGfBL/qxTijjVz9pk04D4zDLpwS0eimhL7YykHNELDHNl?=
 =?us-ascii?Q?yznnNdCsRPbKJOBwhSesmD++36uNbZNnFpa2Cr/O8QRmlZDGqh28qnf09lSl?=
 =?us-ascii?Q?HImHc75wf6N49MffcH4WV6RKc79Qa6CtxF1mL6adBklqMHrGnKtut7gj1hCq?=
 =?us-ascii?Q?oMJavu/bhsSt+3dM4JXa62BAM1CvTm4aJ1SpnJInEVo2dcUn8U/L6lfxndL0?=
 =?us-ascii?Q?yA+Qo1eL0l34cJ1QE6GrLbU+6z4DnOhEB+eC+BtowBOgcIG+gMHZsMb+WXRQ?=
 =?us-ascii?Q?GBraidPISmt+tqqdhTUxK45Pa457itDZPk5bvkbBZEliUhwvFqcYtvtFum2X?=
 =?us-ascii?Q?KzRWxYLVfR3udyFvwNAAEaoIerWkvkQCq9F1YkMGhl+J9+rKPjI32POlG+D3?=
 =?us-ascii?Q?4wO75x/ztJajbg8L4fiUgHnOZtjJEukh2yqtoSamZKMkdeSNXd0WjnadQ3Rv?=
 =?us-ascii?Q?oxqc7FggTOICQSBx4ueDcbOnIyMgFkucWonO0PTuxMzkonXEi5XNddAqWeQj?=
 =?us-ascii?Q?/hnvKYEyw3nlop4o2LgPKy7snjwZZQ7yruVXlGIE8Y4nxpy+fxnjTZei14xs?=
 =?us-ascii?Q?mX6XU2knCz30AWENyd5G3uAd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ec4d3a-d593-4b68-d825-08d900af0939
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:02.5211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TZAfgPS0KOQPPdFiosaDsJUE85O6T/ewDmlE5Pf+jwLSNgvWXbWK2cAmco+QY4lGRZzgDcB8xeJnLAFOGMlrh0jBP+2MwzcKzuRRTOTues=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We are going to reuse the script to generate a qcow2_ function in
further commit. Prepare the script now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/block-coroutine-wrapper.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c45..85dbeb9ecf 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -98,12 +98,13 @@ def snake_to_camel(func_name: str) -> str:
 
 
 def gen_wrapper(func: FuncDecl) -> str:
-    assert func.name.startswith('bdrv_')
-    assert not func.name.startswith('bdrv_co_')
+    assert not '_co_' in func.name
     assert func.return_type == 'int'
     assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
 
-    name = 'bdrv_co_' + func.name[5:]
+    subsystem, subname = func.name.split('_', 1)
+
+    name = f'{subsystem}_co_{subname}'
     bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
     struct_name = snake_to_camel(name)
 
-- 
2.29.2


