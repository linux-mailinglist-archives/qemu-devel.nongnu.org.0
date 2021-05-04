Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68C7372764
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:41:20 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqcJ-0002hq-Ol
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqOC-0008Fo-EL; Tue, 04 May 2021 04:26:44 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO9-0007EP-BB; Tue, 04 May 2021 04:26:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOZMqwWUfDZB+MnMpXO6on1e1SJpBe6qyyKEnpRrdU7boStHVKtG2/+SLz29ATE7OAtA/y7QdrZPFI5A1g/FnhXtqH2piZ3G3w2ISnXWNFXtAB543cHQW5diWkaOa/bBXNzy8S5NAbUxJRfDMZ+1bWdduAkICAz7ihq4v3nUnF4vdsIjjrKd5mLnDyHAJqSPkJ+gnPYiFcuXolEU3h2ryHWpFYKwqIfQ2zeR6PrrATD+57ywsxCJeYU0mwr980Fpa0CUejV/Nv9N07C4sAZf/CGZ6UweKYS2P6h20miWNJ2lMO9rxNOqCrIIBJRG3tfgHdH1TnCJCDTKNrurxRPB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q1oNd1d5R+Mo2I2ztKGqDFJlKnbfwaxcMLfeS819TU=;
 b=QvP4uddZ57yzYwALjJnr1xjC01IA038hptzznjiXI+ewYdzS9O7g7U4JqfidYlEJWssybtM9fTorGC1VsdkJJfwgfb4USRAsHkJQaUnNs5+8AkbqGMopoa2f1m2lkY0AMLJtysQk6TJnfbzrz5Cx2xY8QNXohG3a1KUDNu/GqEdELblhgDJcNyjtXbbvTZAYv8kn5usbI4S8S/nADKvrv1EdFHf2XmcYVBeTr8PrwGJjsdh7/NPR584aG8lg7fU3tQjPwSg7r5HNBKCihpmkU8d4Y78/0hROLjWAR/LMf7XF8lF6UM5Pi7Uwt41itWk8Kv4gio36d7c+vm120sxYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q1oNd1d5R+Mo2I2ztKGqDFJlKnbfwaxcMLfeS819TU=;
 b=U94OK8jMqj5tDI/9o32QVzm4ima8VKeHXksOhKlQPjwUGHwTNzrzaoeqG92OLvapFSvf2FDhItco9AB0puyRYqT5iaBjfCXkuLWjXL6dTUlZVMlrHV/vlN059oCuu8M2j1jvs8v9j2ONO6VTL5Tm/dWPL/OEgBK0oIWpAeo2/IQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 9/9] block/write-threshold: drop extra includes
Date: Tue,  4 May 2021 11:25:53 +0300
Message-Id: <20210504082553.20377-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f75f80d8-d389-4259-0474-08d90ed64a6d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381E1404B192A82855197FFC15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8YgM5WYurCOCtLDmx0lY81v6xTyij3uw072/2hIhP8DLRbOMoSIzY83aApK/RLivBbcjIP6bbrtLGorfyoCHoueQ8uzv5rQfEIhPAHGBwycpyitb/vdwUpGRpE62i1u/6RayMA7YPOS66rUH317uGzQo6D3u8EVw3pjfD0DjMTatxG/NbOcgdhfDSfhCgi73dQYDJxA1X/EpwMcriZ4cOdeFkawbw77+D576fcPyrR9CuFepyj75sX7M8HRSXsN+9krlLmwbnYD715loc8LsClbXWNK3L6jl3avm8d9zoC4qwrYiGBJoyp6fmLH4XNzySxoGu7vdRMKd9pI6saCpY7EBojri1Nn52gsn9iQltwkcQnu361R8FgHE/P//uv5Gtkv9uPVWhwBmRAhQ7vmpDCAdWAWd7Og4UjVe1T00HDUsT+yu0WP3csfetQw6BBHBk8Jkk8VttryoG/P34nmuoGfs5tY5zK+ITNY7M6uFDiabvhDhDZdNVWwfl1sAu+ath0SsxnLkIaoawmUWToSE6O1kyZyoClRlU2Qi0/9CuzfDSuWHWfZ3zpP4fdiapDeVu1nVnVkC32ZoIyM6ICMFWkpUeE6cRu5thaG/UD7HGbto12BQGabITTD6AigDgX4YKcHS7PtH/gc/W6cIan64nQosN/2TieypXqFZBmdgEyh1uNgSEaJBwR5deQybza/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(4744005)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PgMQnnd913F7zj6irA8AqBghvzmW+TAxmAUreRFgQaf+Sfn4at+WK8OkL0A4?=
 =?us-ascii?Q?bE2UUmbpQ0AJ5ahmOPhsro5YKDdPqprSUdKI/W1XIL+ixGioXN3fbh7cpwzp?=
 =?us-ascii?Q?/H2iAl8RG8gFzgdOzfdUNdfvk4PYX7hpuLXwTZeyWcjtG56mwCkMRfrFqjg4?=
 =?us-ascii?Q?JB3hHBNz7j+snKyPclEPkDuRUfYuo2EsT+0ll35IKHtrEWI/lI6IjtmPdFMm?=
 =?us-ascii?Q?g1yErZWhB/6Hy0RLyWnn0OWlA/ehizmZ7bfRw8MaTIh/EVny4JrgAN23NCLJ?=
 =?us-ascii?Q?7RON+zbXiOQfiNF5jKe4HJ3Fwlb8rcsQgE9IjWqORJGYskjejDu3GvGZ6DhZ?=
 =?us-ascii?Q?Eh+WBV5WhLrUMGzviYTp3k2IwECUXFZcep60X3a1u2AQ9VnK3q8IYmY0yGib?=
 =?us-ascii?Q?mYlX+8McG3gOWOYSyx3+bv1oTg/GIMJ+zDX/NkBnCH/XpJ3CgHQGdfESVh++?=
 =?us-ascii?Q?ERBDqmXlMcN0hwNJLN+tlwydrPPhQAXxs98ouZkDzC+NUeJ/pnnGvNcFlcnF?=
 =?us-ascii?Q?4q31wDq/xgbF6tRcwtukryAbUqHdn2goM9F6sW2nBD5/7v5dcICZDcRrB6mN?=
 =?us-ascii?Q?NaW4t+YZs2XbVhIAKEZV1eQ9Ar98Ajue0O8wPfqp2tS74kbIav2kskmouK2i?=
 =?us-ascii?Q?x7L7dznPCZ9fRKmh4LdhTj7XpoFOqv8Zu5Z0ivUT9QxjRa6rhrUUxd8qJOMq?=
 =?us-ascii?Q?IdPnUPB9QG2D+sEyddoP2VCgg1VTEuf+ELGupEj4m+EHjK3H3gpepoYc3Db3?=
 =?us-ascii?Q?Np5Aom0ve3Wa8DKtWRUabejMccmfR+bAIwRpWqOiryXDlOk7SnmHOrrI8jvM?=
 =?us-ascii?Q?439rg3Ai5ZpdwSR+20otLxeAsuTxG6mNP9vksYtyhq3sMvecyQcmQicfBbiH?=
 =?us-ascii?Q?vKhfKctnpx4M0dpc5GU9a28XmapBvxKOMmbnQU+d5U7RT3tV4pXsWBcQFEHO?=
 =?us-ascii?Q?60K77LTL6dDugOx5uUGRm/4jyHFegq7zmyTO/fVs8q4YDzUxvTIZw0vSNq3b?=
 =?us-ascii?Q?GlUIjcwLlh6eOMG9E1teo3P6vRfDxorI9SRc4ri1AIhTWpqD4uarwqFO82ct?=
 =?us-ascii?Q?syzWkmvAjFUuaH4JMX1LRYCzzInAWeiOkxIwQG6HseuZT6cdSHPj6noroEMx?=
 =?us-ascii?Q?+E8H0KaO4IpC80tzIC/ENhpxFYPWeHkk1pJ6NEzpGQxv9/U2oz7ps+uKl83J?=
 =?us-ascii?Q?ddvja4AmVuhiC4UkdO+JcCkqZiBEi0QZ2q/TFqohWtbvxhckMwpqyMV59GnC?=
 =?us-ascii?Q?9JmtUZxe34zbohtaoGPTXBEK+oVVAeIUasirdJ/lBFqINOvFHaqiXnqpd++8?=
 =?us-ascii?Q?5rXCJyahQLtUP1NWq3BDo/iV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75f80d8-d389-4259-0474-08d90ed64a6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:18.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTznG36iakgGEXBy/Yk0Pt3OzWJ1XQG+X3DJST6zQNrYvyzZTN0e54Ke2JTm/75efA+lrP2r4BZBJH3Ycy0IzjBtaNomclXfcReAEIyAJDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
---
 block/write-threshold.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/write-threshold.c b/block/write-threshold.c
index fbf4e6f5c4..db271c5537 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -12,10 +12,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "block/block_int.h"
-#include "qemu/coroutine.h"
 #include "block/write-threshold.h"
-#include "qemu/notify.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-events-block-core.h"
-- 
2.29.2


