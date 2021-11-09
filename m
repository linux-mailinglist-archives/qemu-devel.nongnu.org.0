Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBC44B27D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:09:51 +0100 (CET)
Received: from localhost ([::1]:41924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVZ8-0002zm-9f
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVXU-0001M2-6O; Tue, 09 Nov 2021 13:08:08 -0500
Received: from mail-eopbgr150138.outbound.protection.outlook.com
 ([40.107.15.138]:40966 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVXS-0003EZ-FU; Tue, 09 Nov 2021 13:08:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIfHElark8Q01lohBqB4W7xrHvmBBlgSzJf43TysuR5E97V+2tEB9MJY4D5l6ySQ3SgHFn7Co+vkB6YoPU8tbOguuykkZjl8npj+9sHn1v6Ee+1SP8Kn6ktudp8Qk+tsu3mUGvL/tOfzKKuDDxNmS8atUGSuQdu95lRxcMgMsknv6VQ4nNJxejGTkENxvFXErzLj6g0g5TT0kRIBbwl6K45w0scMNLpE06KLqyzLRJQ2WzgBQziB2w0C/HZ97AEn4j3cMbAdXWAegrQc7X6svFmgpCb0qG6xlEiodwYMoCk4dgMUlDhn5YS6wQ11RhH/+QoVMFDAfIMOSe582KoXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9JeR1xN9cce6P/AsOfeQhAmRGK9j6gJWdokclE5hn4=;
 b=AOBO4UYTta5wbUtitp9kPz5ADk6cwanQQb/BqaKQdrAAz0Me7AukFSxdL80GrafhmUcBjGLWWt7VlJVSV7vj1pmpXqnpCV/e5ne+pNH8CrhbyOD6MkuXBGzbQc7Q8RLDf+lyHQWNO75wAZYbZAjuRgHssawuCIxuxZpaRhbNhAOfM472d3bpxw0fGHNHf1eDzBzf+Gl1PsFnuHYoxLJIv+PK7ZrTAY2Ee4TWcasIeXSiLEa15C84hBmJhBmTktu7EGQdB3xajJxK3YNYxIrePBGG9Px1p9SGGzJ/lcauF2BOnjZhybUQKcX8ksvfD9Uy+mKcztDbjBggfmnDJ01DwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9JeR1xN9cce6P/AsOfeQhAmRGK9j6gJWdokclE5hn4=;
 b=keXpwRqkRKHdobU1KKEw9wL/hRQ1ibWQo42R3RYSwZ78v8qvXN8IQK2R/0Dkzw9oCeW6jJrpMwcfxCuVJJlBxnSRW6jbrVrCDXncn7FGDGgRPSwfIyZ31IpzPsYiF3zbN6xz//DyBsKfxz+QfIhf3D+wsSqsLYfNWqU57IlvE9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 17:52:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:52:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 1/3] docs/block-replication: use blockdev-backup
Date: Tue,  9 Nov 2021 18:52:23 +0100
Message-Id: <20211109175225.2209903-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
References: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0059.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 17:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd68459c-b782-497e-ffd5-08d9a3a9b814
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077D02E310C6F573E8B7E62C1929@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nSmWNB85qJediW7T0uxJw9o7/ofA3wo4aj7ewBtm/aXenh2w7o4tMfa0Xhh9A/xFUoF1SnNH0Qndysm7xX6OykPp7HmX/QLexyPmoBQfUUJFm/qiaseQaVHvvZrcSFdGes9o5y65dxvGaLD33LfKpq8Cikfiu07Hi5ELU9HNsKPG9hq9KhHmr+w5GZrj8cKdSeM0ECpeyAOxSMe/me4x81Fh/sPUG33cBCPLCIO69cDtbXJxEUr54pTA/D/b62d9eqqBCWZKjfYx4rixnf7VCuWK+Lrv8NS8S5jxvOdFOecPtWWwTx+X2sQrXSrcImIcNU8iVPOBq9UJouepR1r0t9GglUpFSCKLEHro1cYJti+rbNSV2/QxXXpKKkkjgsrFBE9jqgLhY17FwgWoLaVqhYNgtT78dyM9hh0NY0MCIWObTUZ+4tTSN1v+JrWzQdJY/9x01g2RxlYB3jmhJz2VuuQvWsMdtgGSSPSlK9OL8OvR4IKmNQNyaZfhVF4NKs1GQA1T6c+OxHiKuC6SN5pEYjVpnPtBJn52LVLuxZ5t8nsDEGfW6Wqb0+i4Ub2cDSLRiA+G0iKVtY6RLu0HtweHfFNAsL/Wm0O3y9xVcZOpwd3e+R9tWGEELAIsjw5vB5PLYHPnMsZGSX0l43I/Eyq3JzV64zrKAT0g0RkeRpNnxZNZUDZJlmrhTNgXJqdtEKNONRc0jL4m+GZSul9epe8psg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(508600001)(2616005)(1076003)(956004)(6916009)(83380400001)(52116002)(8676002)(4326008)(6486002)(5660300002)(36756003)(6512007)(6666004)(38100700002)(38350700002)(66556008)(2906002)(26005)(6506007)(186003)(66946007)(66476007)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f+o0A5o6qe9EmqtAKyUXS1JtLxu0q/Zkkk9QjIjqrdDfDJUzSzDeqk8wAFcl?=
 =?us-ascii?Q?o040Hd4Mvpfho6V7eNUvZEaGgTrFXqqtJejG+wmMw68zgDWBkTbcACgFMI9U?=
 =?us-ascii?Q?edYZO9yYOXxRVVaZNLg8wxACTzg1P4l4MpU4jqlNLYFCkNXjg8KXgKiYP9bi?=
 =?us-ascii?Q?2/gIqZUiHbN2X72PrxQ88mdVeBS1cQ2xdTi3QDs1RYhyq0CxPtaudmXbJgHy?=
 =?us-ascii?Q?Dq3l+avFC6jORJqQH13PX9/zG4psWwEXCu7QuYX7eJoXTQ0YMf07V93Gn7hD?=
 =?us-ascii?Q?0O2i+bkGKaI0ciXcXpqSU6FnfRtaYI2W60e+tcAV4vSquAzViT0Rtoyt0nKV?=
 =?us-ascii?Q?CPEp+xi6kQNW7gLaaH6tuCIwnvY9c5xVqRc7Aawqeg8W/HXaBsXEGuEWpjHH?=
 =?us-ascii?Q?cGwVO0gREKrqjYrz1HeIn+ul01+Z6Elx1AHIR9UEkFjsoYnFrfZva0gnyedp?=
 =?us-ascii?Q?H4sppqXqkQQ1R7oPagKLgTkzoT3Nr5cI6Aow8TGco7zxQ6HAQR0KbEfxjPTQ?=
 =?us-ascii?Q?9/DWrGGYafiMj1BNJFZ2J1X3bLveofnd+3B14cgZ6AzCvNC6NgBOMNOht4Wh?=
 =?us-ascii?Q?MrmC0CPmcSLcmbnrsRf1luzfe524GioD0LN/KCN19flqKbZkRwamOJlXVjD/?=
 =?us-ascii?Q?yoL0ZY8WCOfYULb9wMeqtp2/q7f+PEoeIGrtWdjIihKTOSa8TbaNDe6if6dH?=
 =?us-ascii?Q?/nTcTrOiAszuZjunWjQzt2MTvNaZPc29dRelGXLXiPQfu/EnBgCCDoviXjV7?=
 =?us-ascii?Q?TCR+n3ijsIFWy0RDgczHMpJOBaK47HvS+mghIP+ZT4PEjLT4/EQg4BufZE6g?=
 =?us-ascii?Q?9SWwggEkC0YeNhZxZfPdu7zhEJ98+lQY69qjzMYaDDKtf8OLjDBP/q4l11oB?=
 =?us-ascii?Q?wJY1FtNzjq5/DTODDCXJDNHoSvQTuUOfU+BYNu97S8uPZ4B9Up2nAVYG/HGz?=
 =?us-ascii?Q?6yGln5twwWmycB+7tPlobKNxRXkbxQQI36NBrg0rGOwomQUSG6XCvxbZgNLX?=
 =?us-ascii?Q?htrStE7FFss+bOR4WwSRDw2tsitsY84w8OO5P41nqzFt5Gb4m2K+/KHT6A/b?=
 =?us-ascii?Q?G243E5lkzCfUtFUxDQezc+Y6QNe8saD2iCCbc0nosRTWM+1deHh55PTOHrdz?=
 =?us-ascii?Q?754S4tFuzblP96tkjziyAVfUYkaY+EE/NfYaIVqRwM8v4UfcRGeIWgwiJrIW?=
 =?us-ascii?Q?obbx3kzd9WS4jtf7gyQtqKMhbri52ymTkGmBtUwJ84XylUtkj18u4/oZZ+Al?=
 =?us-ascii?Q?YZuJrvYUmHsylsgxP1JMo/RjnUxUvP9k3QaJ1ObULXLY7OqGhgkQGnvt34mR?=
 =?us-ascii?Q?6VFGWgskQC02HHwderAmrKlNqZSZWTjOEhz+JPxsZtiPcRo3djZOvGUJbpWp?=
 =?us-ascii?Q?ybhH8gHWt4O8TRvG1GfflXTlq1lPAcmC3hLV1FBLJg50WOaXgmcdVY819S7D?=
 =?us-ascii?Q?MP/2sjI+0ObK80YPzjnODw8xXNqbABVFOicKLMbSrXdlEiVvvb7bslrVF60v?=
 =?us-ascii?Q?84oZ+CeU2aSc+qPPxqI2Sj2NPXCsEJHyaTGzrEF5ws8rTLpYeZTX17ERj6oC?=
 =?us-ascii?Q?Y7tEu8E7NIWfp08Ku8ohlOtmWWGzEXC2IEp9Yu8GWuTPwO1BJsAKbhpN/kkq?=
 =?us-ascii?Q?vOf+x+7ev7XMr/SRhKkP4hB2oyxz1T0fvewR3kgaXzRyDD2uzMT/e69ObE4X?=
 =?us-ascii?Q?rfu9fA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd68459c-b782-497e-ffd5-08d9a3a9b814
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:52:38.3925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4FX97DeAb7jZuOspNPJAjEttUjJ7Yw6ZRRU2bS/z8ia7SLQAdIO1r3lPgLHBoUxY89hVo3FrSsb0wJaBv2oYkSnbguaDbR4lHhJiHyDeH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.15.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

We are going to deprecate drive-backup, so don't mention it here.
Moreover, blockdev-backup seems more correct in the context.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/block-replication.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
index 108e9166a8..59eb2b33b3 100644
--- a/docs/block-replication.txt
+++ b/docs/block-replication.txt
@@ -79,7 +79,7 @@ Primary |                 ||  Secondary disk <--------- hidden-disk 5 <---------
                           ||        |                         |
                           ||        |                         |
                           ||        '-------------------------'
-                          ||           drive-backup sync=none 6
+                          ||         blockdev-backup sync=none 6
 
 1) The disk on the primary is represented by a block device with two
 children, providing replication between a primary disk and the host that
@@ -101,7 +101,7 @@ should support bdrv_make_empty() and backing file.
 that is modified by the primary VM. It should also start as an empty disk,
 and the driver supports bdrv_make_empty() and backing file.
 
-6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
+6) The blockdev-backup job (sync=none) is run to allow hidden-disk to buffer
 any state that would otherwise be lost by the speculative write-through
 of the NBD server into the secondary disk. So before block replication,
 the primary disk and secondary disk should contain the same data.
-- 
2.31.1


