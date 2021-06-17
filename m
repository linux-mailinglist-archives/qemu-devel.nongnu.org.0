Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B13ABD38
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:59:20 +0200 (CEST)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltyAZ-0007s8-3T
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty6A-00010O-N3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:46 -0400
Received: from mail-dm6nam11on2110.outbound.protection.outlook.com
 ([40.107.223.110]:19734 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lty69-0005so-78
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5LGb2tTQRqzvZFwjkAm3ZXdYLwsYuy4cKxhdylJP66YQuFBqy5mBYPmhq7V7VF97w5GW1czjAW7wU9scjy60xw1AaSTahDxPpQR2RCGLYQuu5kgo71JtuRibnxhI8J4u8UEE1VYggRAjcCu7OU+Snms53aXk5keoqBoEB5wv7YQFltuzGV79zLBhhyY8EZn9G+tOQNv5OZAGyva9Aw8ZwIdU31h1ZbiOLkrq/Jut0iD5EgIUMUpqVHjYTfPRHareibD1gSnY7pcbixFCRvzRNF2hU+83UyJ1Fs7NvsRtG2CK/3toTAP+IUe+6CBsd3ahwnKehLzDG/30A4hDRKQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=dhhhL/0t/Ru80axbzsAqyeZkgs7EzYA3DSVpOGgcc64Gg05582UaxbDrOazFCPRYlM1oKzEpMsFs36GhspVzNgH+BvkLuvurpmuSANYGUQQUhGNmJ56bmt04BVKqOMXAuhC3u0SjlAOhTxNR+vM3hlsOvyIepyrW9FlE0DbbzOH5LWmPt20bAkJa1X52LDKw9HZYFqYh2D5CKX9La1E/Aorbi4EWkuktRgdMf/kdoN5sDYWy0fufBnbnv+ak4cu+pvoKvfzp9J4QlEM7FWre6f8EenvhhsgYMOW1fp/qPhOT8tJs0XoSq2GJkNEJLYXmHsaPClD6XF051LvnqPCEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=FhHo1p9ZhgtSIl7jJe08HonGme5/rsqe5zE4D9onyAuDOIiRwmbrODv6Pdf6pfdb5/vruDL232OKa373QvYitEaiDZhMLJSRZWNGuu2u9KXZFsBJFmInkK0X+Y/4TXFu6DSChflnPZ+sTeZAt2oEUrnt0EtbeLs3ihCAXVmJcyc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3677.namprd03.prod.outlook.com (2603:10b6:805:41::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 19:54:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 19:54:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] fuzz: fix the ES1370 generic-fuzzer config.
Date: Thu, 17 Jun 2021 15:53:53 -0400
Message-Id: <20210617195353.284082-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210617195353.284082-1-alxndr@bu.edu>
References: <20210617195353.284082-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 19:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75dabc30-a635-48c5-b3d9-08d931c9ab0d
X-MS-TrafficTypeDiagnostic: SN6PR03MB3677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB36778060DA5FC17860AAD1D4BA0E9@SN6PR03MB3677.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qD6B3oSAtSq3jf7vVHa3PPRq8UT81We0G5sx/Qs+0A4sl9MqT51Ws7Dl7vQsgpRpB0/pblq7tGC7DcCmTe2ba2mqn2JJo+ky6+KiZgGLuG3t+0j9juR7MAkwqiECrYTomo3kc4JXGjCxrI31CPIlypUSKVYb/pgLc1I4szQHwhNwgKlryeTnjU2dyHir251I6SkEKoeLoj2KtCjm7G5lobNGaNX2nR6gr7lE3LXYm1Mu7nVpUJffXavZENLW2RrDuyEwcfoCHiBl6EecEpIzyEqTlWuzCTLfUsJCqAKx+uTGcxhglWVjFoQ33ns3yrQdZCBdLaLJaT/QZP9Ex0fKOZenY5nKY4+e3VRYAe76qUaSuFb7s27C7F0M68petW+v7SB5d2tjSnfG3ACTz6dlLdGi9XaCGYa4kvMh+6GxkmmZmJ7W94UtS/gTq0BAU482S+AcZL1OCZsJCTvYFCFZE2uBIPW+9IUfy33qjNKlgwdQthyqKxp5pcE6bmwQsgKEQCTHdqX0rcMGHPz2yHOT9qIdVF2xJ0q0SQOosAwusetn1RhFhdTLE4gqBdLiAjSNXayNDFQVQIAbvoyB7k0duxNB1eIkDKawqkusFB5Su6+Aop7fSY6ky/MKyvbUwlKFThqo/chch7pdBDAmuLh8obkajVWwNYlS3cwD3qwDA4qF7XM8Hmi5Ke0y7SOdSEgh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(16526019)(54906003)(4744005)(186003)(786003)(316002)(2906002)(6486002)(83380400001)(52116002)(36756003)(956004)(66946007)(75432002)(26005)(5660300002)(86362001)(6512007)(66476007)(66556008)(8936002)(6916009)(38350700002)(6666004)(8676002)(6506007)(4326008)(1076003)(2616005)(38100700002)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SqHyARaJsLTI5H4gj+rFF1455TRQDsh8v7xvAdXHCoXv+TwzOUWD2Kl+Kj0F?=
 =?us-ascii?Q?opA3/W9wE3IjrdiAEIOi9yEJ47FlxWG1n7JTJygibUlY3ghXo0I4AZHdRB7o?=
 =?us-ascii?Q?kRKPncq74pMcnA1c0GwRczjG9vuPoc9gol/Ytms3cc5j5dyK11Ft5t/pxN5N?=
 =?us-ascii?Q?Pu2ioVJtZgvUkGCRVQq8ghKlrQNQ4PpO0bMW3X3GMYl4RELiZ0boA1ERLf63?=
 =?us-ascii?Q?RuOmASp5fpV5veeGN8A/Od0dJFD4/3fQcapNGQALt+MIDJFxjIY5R4jXdXZy?=
 =?us-ascii?Q?YNM/j4rlC30KblWBZb75E/lXQ+aRMKxwGoUtS68EtcqN1SWLdByDUokvceES?=
 =?us-ascii?Q?LNLMZ5hQH58eQXfv8reBid41PJhOS/TNvBHMkUzZJAAadZi52B7liwSAyCwi?=
 =?us-ascii?Q?9mjUjAnSGrMlmJ/94U3kAGE72xu7Pw78v6uFgN1phrZlMl5MYaHWndMBVPgd?=
 =?us-ascii?Q?CCIgPZKEd5GPzd35LzPEqxKtEDuAF7uk4YU0vFqKo928RnRVRdbfpL9EasJ3?=
 =?us-ascii?Q?HiRL3pHL7M48BCiG67xfYUEItQ+4C7uKOUFaI+R4fRVzHsvR4aHdzV/kFbWp?=
 =?us-ascii?Q?YidvmBtAHZfRzQ+ibOShWiHZWPB15eROKlabI0rgwDHg1/WsQcDcxG8MzkZ9?=
 =?us-ascii?Q?q9v05nsvCvE8xbjFY8/4GvZPTu/e+sVcv1/5tocVf00f6i64X636ATbKQICD?=
 =?us-ascii?Q?MOmm8goL8ZvhaYbdASOA2EHceYetTHAwFGWMw2uk9+YGTCbFcs/K/t9Fd0ey?=
 =?us-ascii?Q?nsvLunKGC+amv679iW/o3T6iCX/8U3zKSW3WhzSASxaJ/DSnwS+kfmepYHkt?=
 =?us-ascii?Q?yNdsdl6Vqj3mU2M5d4Pczv8Jj84j5t5fo4mUszMLzTtmQkW7POqRFhTC+hpm?=
 =?us-ascii?Q?PyLRoOcZWfMiMnta6VgVbZfJaeMFFZ0KV2kwCtTEccqatLtwIuwdAUW6YibF?=
 =?us-ascii?Q?x/kXU0/Lh5p0WAsofhy74wPSa8yxTET8QYQ0nuFZxMvFBNYv+696CcW4izql?=
 =?us-ascii?Q?/v1RZEqicX5XzYNMdTjP4FY9LTfHCrfISwfMeuUjSSycAg/k/EpEopcYnIur?=
 =?us-ascii?Q?PHErIyZY9hY6TTUN6hbdGtaMoyfSfjrEuCv+vMkplRKtz4BGRImAQkU4IPpQ?=
 =?us-ascii?Q?xQ8Z3oVYHiYod8Jq+ZTlZa7BYtFZG+YixhCdbzw2zdEfOetKG0p9oGwJoLPl?=
 =?us-ascii?Q?Kv6l6TlPkLAW13gdVQbIXPnv7gZMqTPFelzg2IoOkAk7hXUi0GrvEcSF6yFW?=
 =?us-ascii?Q?0I135g3gj6z3xQ722AG9C8nradf9jRyrSxlqUD7KX6i4Kr4pbjGEqyKyWCMI?=
 =?us-ascii?Q?7GeTWN6RA6mu3EZ60c2+x3vn?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dabc30-a635-48c5-b3d9-08d931c9ab0d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 19:54:08.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8Y42CTbpXl/v/UNqe+7eaxk+td2PgCpWiekx3K7ZmWHc3JBNvQXe69gNw/mj89J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3677
Received-SPF: pass client-ip=40.107.223.110; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_ES1370 is "ES1370", capitalized. Fix the config to account for
that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 049697b974..5070bc175a 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -228,7 +228,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "es1370",
         .args = "-machine q35 -nodefaults "
         "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
-        .objects = "es1370*",
+        .objects = "es1370* ES1370",
     },{
         .name = "sb16",
         .args = "-machine q35 -nodefaults "
-- 
2.28.0


