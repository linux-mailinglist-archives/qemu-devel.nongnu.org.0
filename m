Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029F3A2935
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:18:59 +0200 (CEST)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHm6-0001MU-47
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcX-0005Oa-EL; Thu, 10 Jun 2021 06:09:05 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcT-0004uY-Gz; Thu, 10 Jun 2021 06:09:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My8SxwUxsngTzlCKFL1Z1ZssKVYXkl1GnJP27avXljNuuBQtQCd8BaPxMdfnVVd5PVeHOvmZpwdEYAdHXPAzA0P2hEJg24ofxozMsYGn1fKcsD1hn7EXVNtnNd3Yg2aokgb5b8o46r3OjTJbepjOsHcamQO4UZUoF1zsy1yOoAo6hJHyrsu84FuKrhqJ8MAWQEuTbf30wI5ne/Al6bzqzJnn/2bpucyr01qXESeeYaVaxCFozAa0BpPOxSBmKiBb9BGlvkj7iMM9C4F3G6iWbJj2XvDdFALTpt24K+zl4vGc4pGWeRwfkq35ucYGtxOCipx79VP9RWKQu/F9syRvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ax9iqJVzK46yGKwpHlZWjCchDHg641E/NyvOBpW+Rc=;
 b=Cb5IyXya/d7AK4BCTSksXPJFlGtj0XqlVwcozFSUcYRXd+Wnoh9cUHO8hMgAetVNn4GJ2eFAzfpQrwSrgl62a3y/zEdelP1MVTG5Nx7TdNvFPaln/ocndvHyvy47K1H3i6sus9kk4k0+PjUodZIil8jcthvEx0jUHSyc3zAPLRijbQROiucJxqEZBuxxinTbGhpQTrDNBuV8Z+q1z7G4AFSj78E/2GtqJzapLstWfEoG1TRkOEO8TsPpQdB8KzgyXUT3bB7zG0/d1/ctb+GZc7XbmGT48htpOeKIE4S7MjyvgpuVrHiMTtFWhV+8M/CwcX9zggbWMI7XARCEF//Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ax9iqJVzK46yGKwpHlZWjCchDHg641E/NyvOBpW+Rc=;
 b=pYO4EyBcQXKYtleQIwR1bHdVAzWezX8niNsTGe6HPfMl/sZiC7Tn65r8HhsCSLcDSjO7PvI9INcZhPkdc+DA+LoUq96dDLlpGj6ipakgxBU1fYhPIK/Em9YwBweh7xhxWieSQb4yP7uXSbpOQHBX94PV+eORmjH/HVG7MWR8TJc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 04/32] block/nbd: connect_thread_func(): do
 qio_channel_set_delay(false)
Date: Thu, 10 Jun 2021 13:07:34 +0300
Message-Id: <20210610100802.5888-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a8eabb-752e-4918-d42d-08d92bf7be2c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203589C0E081B2740342EA8AC1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOlDdBOBxSd9FTTxFgu5Sm1K9NGUGYrueoxfsWYTxwRNx37EGh5heTnbEv5vEuRl/FTouzm8iO9o/asiur6kzOy8NjlsuIPpIbJ6XQjooMHukYHaNyu6Cy04RT25hfojRiBeW78xIObmPtsUs7GZaRE6eHAHCVsPejyHEZ0VnE02MA4K3BfF56nsf7U6UXtRBneoQCnb6+WW8cMjB/6x7veF5pTH9t9T1mWVKiF7hx7zdPy5vpmsH5alTiKDgDqRBErAnbmn5YVL4uXQIFzfMyyOnJfeg54nSGcDUdRCH5r+7aBEANZrCSJ5Kapqx/F6aUtS7oIc/kHPXETPjjpDYGzwxk0ZNpnDe6TW0doMt2qqMrBGBaLHUgHooadLyyIIc9ClAEzYiqZuD3AVf046y9dZCEAfuW+lZmYamYEgoWSQ3isbFK+YjfCHjf0tLf2ga1+KEoCAJ+metT9eEsoTHHP+t5AhWI4jg7Ew1FaSKaJcaXlMYfjYNXfxH3mLDqGYs3cRFAVN4bqtN0qYWiH1XE9dvEsVP5CkPDoFvp0xcwb3IjJcFRTqqA7+NDqQpeuvZRzdyv9FuM0t+ls+QX9/i8WNv1xQQJTWKwpGbdil6EiehydrQg8KVQCqBkwOiidabMV41jQd56XwJjU2mqVXDXr48BNvx68GlWe0IZpNxbijYSSloz9zFUvGPTo7V1Ui
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(38350700002)(1076003)(38100700002)(956004)(316002)(4744005)(83380400001)(66476007)(8676002)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OFBiDq6J3/AVESmRP7phkVMxX4fLgYFhXGtC+rft6zmKrsKCPOcIsomtx3Co?=
 =?us-ascii?Q?XNtUQ+ylKlT+iQtOYEDMn2i7+9pRjRad2xEWnL20G/tqHWFU3AIEwX0sgOvN?=
 =?us-ascii?Q?ALanp8jq6LYa9aVe0yz5oRD4uXSY4TNJYTqROjucJhqS9Wky5c+OkvuMyjZN?=
 =?us-ascii?Q?m8Uvre+LTtwil8haCwP61R6RKFvTh4X3iqsgD1j2CycOVCqib1WBLmrBZK3T?=
 =?us-ascii?Q?gFvhiDwEQGb48ZlcN1uwAVqIVbrjGvDcKYtdFZ/UcLw9TKBJhLvxiAepqAM0?=
 =?us-ascii?Q?IXTA/7RtdampFrCrlrh6LzYl8n1CCBNKh4Xi4SHjglB61qGN7P9MRKWVS5Th?=
 =?us-ascii?Q?TWQ1FqhmxSqvFUOyZJDVLL7CrSAPt3isvsQlM2Rr6/oVLIAt4DkRB9k7kz7e?=
 =?us-ascii?Q?VD9ZRRPy0XYbS8etVeTvmpbaE7rnyWKTLT3Za4mQ7TdFyHW6ahrSro3btOeN?=
 =?us-ascii?Q?3bN5Ef0abUP71nWIlBPxcq8mtzF12Z84LpltXthXHPxiuWwHHFEdxCyjNQB5?=
 =?us-ascii?Q?sfp8vINcmN5IUrxvJ121K2ImRf5LUPAK7tT4El7nmoE+XYOGu8M355wzUSXu?=
 =?us-ascii?Q?qVOHyw22bkjWTOPMggtKm14Cx/vgKbIzpJGDqk/EUQOEbtyofGY8Kuo6ulWO?=
 =?us-ascii?Q?U0udJblXQc+JRrESGxYs7ApCguRqEW7G2PaCPdoigOzCJaWzThYxvqJeYMek?=
 =?us-ascii?Q?yo9GtoavGkwa6PomFi97uqhSV/ESizlatgllCJDMjTN6e8RVGW40MEWaSHsS?=
 =?us-ascii?Q?chUcX3aM3JvK8URSxhz9fCZ/6PuOTbV8j9dql1oOz1+kDh4ntmqQo2XjFmn3?=
 =?us-ascii?Q?BUk5fWHgtDlyYJIITNoyanQXSlDjJ8zyAoPA3tbdITXuqCj9wS/CVvKL7NM1?=
 =?us-ascii?Q?mUjizKhlI7zjrdpqukKCaT0SLN7Q2Rgj5B5S/E46Fizx+av6pZiVc2vVildE?=
 =?us-ascii?Q?Kjl+vaueaf9SoeWBuRh3gtnTH/aNChoQuRLe4CF7pKrQgb8RAEDcXlHxWkrY?=
 =?us-ascii?Q?tVOB91UK5Fl9ZTy+mcXv+WDpzGtwF6DDmOfFVFGAxpcWdBz986ZUo9Hu9Kf7?=
 =?us-ascii?Q?WQEFopqpECuMrxs7VD+eJQk26dbsUonU47vfQY1cbtae/xEYtBPm7teeWcAT?=
 =?us-ascii?Q?+xxPQgyHxBMZvmyOgXkre+HUFSfyQe4VXq+lw6EgDFFlnKzHt6SclzhtyAnc?=
 =?us-ascii?Q?slBUj0Lm3lKH2ihJJ4AngXtRc22HW8QmLJzmOMZQxKSA4YHwWGXJ5jb+eokd?=
 =?us-ascii?Q?ELzCnw4okTnlqHKe+TUGCfjKVqhnhzD7wSHejCVvGu+GFm5Ou5HOaZdx6FQW?=
 =?us-ascii?Q?FC9mWQl6wU3Vdo6NL/bYm6cj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a8eabb-752e-4918-d42d-08d92bf7be2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:49.8843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qk2Ne7s27mvbMtooLg6GpaQi8eNl5H90d/4CVDibFPDmqEDoX0cFnh5SMgZjonYjoi/3F8n4C7z3H3DgTydsWz5TeIYc067Ef67t+N6sTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
Received-SPF: pass client-ip=40.107.21.90;
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

nbd_open() does it (through nbd_establish_connection()).
Actually we lost that call on reconnect path in 1dc4718d849e1a1fe
"block/nbd: use non-blocking connect: fix vm hang on connect()"
when we have introduced reconnect thread.

Fixes: 1dc4718d849e1a1fe665ce5241ed79048cfa2cfc
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 01d2c2efad..f3a036354d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -408,6 +408,8 @@ static void *connect_thread_func(void *opaque)
         thr->sioc = NULL;
     }
 
+    qio_channel_set_delay(QIO_CHANNEL(thr->sioc), false);
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
-- 
2.29.2


