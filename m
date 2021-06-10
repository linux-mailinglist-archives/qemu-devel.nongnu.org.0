Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE063A2943
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:21:09 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHoC-00086E-2o
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcf-0005Yb-2M; Thu, 10 Jun 2021 06:09:14 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcY-0004uY-3M; Thu, 10 Jun 2021 06:09:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIngr9BoizHo0VCeNtfjUOwEzUNVeGBMeXAfXuo74WV8G4hl27kEpGWFdRAkuVgWUA/dPkxOn3jfOAuIJxMjpDY4qQpC6kO+MENwu0TuU77TVr7+iYXL6SRaHegYspuZBaZp76VWIjxpiynaGpsBJnI5Gj1BYVqIBGocwMgs0+H/ARieJnDnSyVXRml2PstSumGQrImndoTQ4EbNnsvwgo06QSyWSjxc52MD5xmjUsydB7HqP26yfPfxyCN/4VTg9o0xT7xI4x5Ud02EZon09pOq5qJn77GxFkqosEPqRpscfBwTPjlhEM6imtxUwNmBXY2YwngguCv8BcgT3DK7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfyV/lNT+69Voc0RKUtZU77KprcOf9q7RvP9USKNvWU=;
 b=BE2+3jvYCB9FJh3oRVjzQmY+wejz37HgIxrtwgjpM+NT/A/DAI/l62OYCcz/G3rb6jJi6tnVNivxU+KELJsaXdxzOjxr6/kWSKeRpyBCavrhT2TRB1Aj1XJLwjDjlTqQ2cfUwLMhbvIJDKhFhUJYfEUaqErgITC7cwFVjXYEL4gftHdT5ZRUzS+suvn+bQHjUWZV2pnfl9PbWjQ2J2uSWeltYrJNOILicmRYFuRUJ23x3Ob/VFHYHmFEz/hf3THiXpp9LKo/JGaOjiDhgJLKlCj6jWiaLhQkVcLg7LkD1fuAUBgk+OzrGiPa564qXRRmHphZpnFwuGpYS/gxq+61Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfyV/lNT+69Voc0RKUtZU77KprcOf9q7RvP9USKNvWU=;
 b=rdmie26d91U5OrhdKmqZ4pbRPJPS6nIjQfAuYJfDz8hUTmYKsr6JyMSNOmFEuq1ZPgJF+pytO2LOdeeeZQxnYX5zYDb1njiIC/+Q9RzpTk4nJbiBxWXxq3gEMNP3miIZs938hMarMdbFPA034hAfV75BCqdvl86/2yeLlly/HPU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 05/32] qemu-sockets: introduce
 socket_address_parse_named_fd()
Date: Thu, 10 Jun 2021 13:07:35 +0300
Message-Id: <20210610100802.5888-6-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf1d026e-a850-4ce5-f86c-08d92bf7bee9
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20359EF9D5A710B0C98BD74EC1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgasI5oX8VTTf8RXnbVSgIRfwl21jtswp10ijpnQFk3XWdhOdSRrPyPGsTBiDO7AfqKP1mX9heo4/lomOVKHtcWgkXnuyIgww4YjgyhWrPiPEF7moGFDTGZAdO6XkbTM/YUKS4qsd6CiGmECUMUtGNM9VbRylJep3buBNGzbbT1KLzzMQSPPV5u0xGhwD8Lpdb9My7I/qXS5/gPzvU0T8qAqDCk9EuVcU1Px2XDUvRuOvKVLqUS64Qyz7MdBrUvHFE8dVe0A6SVGNPrXNrnZ4I8eFJbhkjfHMsFjQpuUn5rs3of6LVLpUrdOoN9GKbr6zDdh3ec8z2C/nOqytw6/zW36bmHSKHw9R14va+nHLH/n4hpP8UBlfi+zDiyuHbacafJIjLQ/r0qLcExkNdqjWqMrDmzaacaTAEEAEEQO0zmE80oHJSWa6zrVcKbrptzXtXq4HPye36r40C73DJR+jFYfVkwNLDoiKYZQ0JTYSqXWNsrBoWetsf5JFF/N3W5ANxfkndVfj+gMJY/5/phubK81M5tFNLYx64s/EOk9eUVfQ9FLAjfmjvh28GWOTlJnkZUUp3t+/VUAo8dRY40a/5sCpK8BV+q8eRaCh5oXf0CXJ9CrDoLYaL+tH0XkPa6hI14akhe9tgE5jPEsCzRrauOP144sPbMzkJ6F658DXV+GP+ZljYskOUby/m3DiyAz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(54906003)(38350700002)(1076003)(38100700002)(956004)(316002)(66476007)(8676002)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ke5qNepTSszivLGLGwzP3A/C8g68IMMgxD+hoy5VMUCLXXnkDUzcTlWtqxqe?=
 =?us-ascii?Q?reMJSpR6dgF3PXJ+xwKZmtJocaE5iTorbO0AJCeZIJg2K3Q67IETof6ZmIe8?=
 =?us-ascii?Q?+uWCZobePsPB5KagxoC6fyNgNBbOGmXHOhGXA6yO5FUPCNdqAW6fU0gIxy/i?=
 =?us-ascii?Q?xac18zi8XMSWyYQ1awvMy2LfbIKUuaMWCm4/eQooUWzPotRtDzbClfdyDQKZ?=
 =?us-ascii?Q?e4bV03jtEsYp1B86jrR5hWFYccQW09Xl40uSOPGiqTzZXBIEYfk1EeG1TQxZ?=
 =?us-ascii?Q?fUOEK30kC9ZqUlVGp6Ra7f0DM66QtlZ97xgtAnaEwZd9qi4YGHg3ZZHtx6ZP?=
 =?us-ascii?Q?cFqS7kzEpeCloBJ/f6ORHLik/v3O53Q12WGRswfB7CoM9VKbENyn30jwvfYK?=
 =?us-ascii?Q?z35Scv1JZ0wF4aWEKajhE7nxlYXybtql03jTYtMZkYY/7ImrhCYiZeqQ/zoT?=
 =?us-ascii?Q?h47LtirZgYTp/AiL/QAFKKE9aoC75479iuNgG1OnEMipVCXQ8klzSe7WZIMJ?=
 =?us-ascii?Q?HzW96YobtZy9/yFIS3cRBwMeVCmk0LiTYizXvEk5fZCgR4huewmwXovBv6HQ?=
 =?us-ascii?Q?4Jl5Z49JOv1DbP/fNWzpGEbavs/KO0DuHwPKP7a5RPOf5rejy6ll4vHVfMei?=
 =?us-ascii?Q?QYE0rhuXQBI84Fb1IrDL4pwV/KsWtkoX35b4/h3MxlQguI+/2S5qUtUgk/A9?=
 =?us-ascii?Q?h+Pw2kSwIlvNtGYYe2sKoc/cb7SFQQOWRCoA21ZPa3P7kZaQJff6Q2SnVmQ2?=
 =?us-ascii?Q?wJ697dt+0qRYx6+GQ3R2w2cU84AvMPu+Ly3WKoyovEJCeRM5RCbDVCeXiLjK?=
 =?us-ascii?Q?S2I0NoRhRKl04+hS0BlaruNQyLSDL+YDlYpXdzFBJG2akSfJZD1OgbM/G8T0?=
 =?us-ascii?Q?zzqOLQS9Mu/IIsRiMWYlSwZUG5ok3OWCHx1ZH/Q7QlvlUoa7RaTPKzXLIe0j?=
 =?us-ascii?Q?PTNGB906IVchMPmqWM3XXby8LuIrK2PDSkTfSGBgHhwVucrqxnqrU9VW2IjA?=
 =?us-ascii?Q?z/oT6ObBrB2kGTJtEnhTkQlH6Q3Z+xMtmBOSZ3zAzQZEgk7t/AgMcqu01Vp/?=
 =?us-ascii?Q?P6nR5Aimd5SdwoC7C12P+C2ZEipUk8pgz//jsPOOiFBWsxF7wLGcnrX6+/g9?=
 =?us-ascii?Q?yfUyPnRtxry+/SpFlIgXLbG8yotQZKacLgIVJ8qWy/lIblAhQo7XFR+p+lka?=
 =?us-ascii?Q?59BT/YxWMUuzdC5HZvQM3k5UW415HuQgYxx69Cq9xKTeGTMZNtKOG+gqlMdR?=
 =?us-ascii?Q?IBTB8U4Hl6gJEzfVQpAWbPXsdohePoEDgOC5woN3iCO43hA0y73T7HnibbS2?=
 =?us-ascii?Q?OXERTAOmbsqGG4qph07p6KEj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1d026e-a850-4ce5-f86c-08d92bf7bee9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:51.1010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YViIZV1tIi1f7FvNwPkiD1OqsqCizqGf/bgAk+eBHMzMxboS2jbPnj659AMjtBu42FW4woW1t3a1eRxA1DXwmKMEy3xl5BdVu3TOioW3zI=
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

Add function that transforms named fd inside SocketAddress structure
into number representation. This way it may be then used in a context
where current monitor is not available.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/sockets.h | 14 ++++++++++++++
 util/qemu-sockets.c    | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..1f4f18a44a 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -111,4 +111,18 @@ SocketAddress *socket_remote_address(int fd, Error **errp);
  */
 SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
 
+/**
+ * socket_address_parse_named_fd:
+ *
+ * Modify @addr, replacing named fd by corresponding number.
+ *
+ * Parsing named fd (by sockget_get_fd) is not possible in context where
+ * current monitor is not available. So, SocketAddress user may first call
+ * socket_parse_named_fd() to parse named fd in advance, and then pass @addr to
+ * the context where monitor is not available.
+ *
+ * Return 0 on success.
+ */
+int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
+
 #endif /* QEMU_SOCKETS_H */
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 2463c49773..86316b6314 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1141,6 +1141,25 @@ static int socket_get_fd(const char *fdstr, Error **errp)
     return fd;
 }
 
+int socket_address_parse_named_fd(SocketAddress *addr, Error **errp)
+{
+    int fd;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_FD) {
+        return 0;
+    }
+
+    fd = socket_get_fd(addr->u.fd.str, errp);
+    if (fd < 0) {
+        return fd;
+    }
+
+    g_free(addr->u.fd.str);
+    addr->u.fd.str = g_strdup_printf("%d", fd);
+
+    return 0;
+}
+
 int socket_connect(SocketAddress *addr, Error **errp)
 {
     int fd;
-- 
2.29.2


