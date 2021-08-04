Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA83E028A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:58:29 +0200 (CEST)
Received: from localhost ([::1]:48914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHPe-0002T1-Je
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHO3-0000hK-Ep
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:56:50 -0400
Received: from mail-dm6nam10on2133.outbound.protection.outlook.com
 ([40.107.93.133]:31613 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHO0-0006zL-Od
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:56:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngsIBf018YmJI9wtu5ljshmDY+jElChDlrgYcOM9YQ8zAbZ+Ae35ChVCLi9Uv9iuIlyFnvJyPQK72rbcCILZ86g8ZMttrOzymo4LjoWexWWxnGeLYHi0nD54g/0sjKKRyRFPBwu+HMX0KaO2TZp2GhBbD8b8RpURTsev7hZAh05FFG767vixn5EH+9VfptpP8VVcZzDC3A4nWEfdYfgIKNM9eZpGT2xakQEzJfPI8zlQb+g4Io0pgJa9uYYqSYVYEJKqcvZbVu587sIR8XBxlm/vW/MGdktT2mp4G8f37Z2lYsBn0KqUDnoABynmtvsP70uBA25UhUK/yTUiF2h9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNWPitBmuNnTVLBrPrV8lcwqk/hdXX0YNs/xd6oaT7U=;
 b=BLmnsCYnpLuqFmhthvaR52x00qFLA5n0ILfAAmvOFMm5yA16CfluNCdSxjqEDF+qR0KkDQrpabfdDZfEFNxToUQueVNDJ+GKJJwb1rT/UbWKQjz2L3HAHXMUl0uqzbEg5vnIZD2Cx/s1FRw123fVmAf+uBfMMfbZWMiLrgBf13oXGFkju2i3XoNKk36L8SJ3n24FEmX0d7EyFC7WsHG/c9qvux0cf9uEoh5SSLxa7/9eQCD/W0bqeslzoE/gjL07YNe4kMpzeguDbTRA+nzHnB9iDtb9K76dXsxkp77DXRADijRIPWXoXcIQ3kRY8f77XqYqoeYW1WAg8Yx/gLsGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNWPitBmuNnTVLBrPrV8lcwqk/hdXX0YNs/xd6oaT7U=;
 b=sRtOQi/hOEZtYuqfw3tJADY4Fyz3XHNbXgTBusIZlq3XghGMsttE42GnDi7gHMnj7xUAV9RNyvxyi51iLTblj/Qk6HdSfXsq5pRScSfMB7wM8ukH27YO1HYcflH7nFXn40N+OMU8BsD7cU+kL5b29ISjNM880Va83p2E5JyC1TI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3854.namprd03.prod.outlook.com (2603:10b6:805:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Wed, 4 Aug
 2021 13:56:39 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 13:56:39 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] fuzz: use ITIMER_REAL for timeouts
Date: Wed,  4 Aug 2021 09:56:20 -0400
Message-Id: <20210804135621.31455-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804135621.31455-1-alxndr@bu.edu>
References: <20210804135621.31455-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Wed, 4 Aug 2021 13:56:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2c41874-684b-4bb6-4af8-08d9574fae4e
X-MS-TrafficTypeDiagnostic: SN6PR03MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3854DA699B2AF5AEE35928C8BAF19@SN6PR03MB3854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JT7pAR1PVdgvIAaQSIRGkfVdfgBoPT3aMqmLrdVwOiA4e7sxM4vz4KG/FbvnjnwI+SrEJyEVKIi3mQs8eME9c1HxqJbaePuzWe3l0TZW9rhDqZ2dus/NMWyS44DPbXxP7AIYr/RGw5HFB/ZB+yWZMMQTMWdTqDZJ12+aYGSzG1g1Pbaa3JyPQgf6/qCJR6LSQbgYfn5IfrCiCYUUP/3U5+HoIEeLa3bcr5jSnU50cwNQz2Xvvkuf4BFyaqOnl+t9FN2ZPN3ovwu6IcWUJvV46/E+NU47mcNY1CkIb53Miwl/5CxsKMV6bz0dI8HEYdtyNb4UMTor2pzWg5/Jg+3XwMwxKd6/PJtpvV10f/bV/mSB30ks/PXhoxinDiQ1uJMrZsh231/PieMMYb7Wu0H8J4/s7NE56thL5Ka7eEE1FcJ2+iL2LpHzDwKvg87ki5TMAz3JWWMw06kb2tzznx4L+HWKz45WBz8v5oCgpbLxzF0ZxZVrKuoYRol6eq6haJ9PJufp/WIaP19mg5LP2WZ3AIvv3lrN0lwwAf6FiCY552YQSbsmzRbaJugjKRtbVD4BB5zEn3kU/YQr779K/kKM8eb4GoFxh1QpgAGukNcpLIksxGY39tmZW5R28+P8+cMbRwZZOyGA8Ijba9afDektMQbKiO2oihKuw3USiVV9VckJyLDTzu8Pvu9ERslvyL65KC40yOPL267gjQst206l0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38350700002)(508600001)(6506007)(6512007)(54906003)(8936002)(66556008)(786003)(66946007)(5660300002)(66476007)(26005)(316002)(75432002)(36756003)(956004)(8676002)(83380400001)(52116002)(4326008)(2616005)(1076003)(6916009)(186003)(6666004)(86362001)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXvph+PvR3Q/Jria+iytU7gMtXaqwlmKz14Xtngu7EX/82Mca4R8F7L2YM9m?=
 =?us-ascii?Q?gt7yLiQfgka0sbyzNYnb6Uh6tmwgwE9/qxkb5Jr/Yt7cep1HzC1PDztdRZvx?=
 =?us-ascii?Q?1ZoGRKZwLWeMCXZGFI0DVjtk1MCFMYw2PqEHV7LN9OjlXYGSLLTwgQmicKQE?=
 =?us-ascii?Q?QL61nJZ9emvv8DvVRuoPaJQBi+Rb2wdZov0NtHmm+aq7Jc+2FbZC1ewFpC8m?=
 =?us-ascii?Q?5xcwRIhVPH/vGRpHGxW0KCqHmGQhLGkSb27usKlHUsi9MmMtX8VrE7oLKXt3?=
 =?us-ascii?Q?l8rHsUCbXhh/89MI0+/FXhUljBmyr3vXE/VAk68a5orOAMtDC2V/3RX0+JfO?=
 =?us-ascii?Q?PjTb/bSBLx8GU5Kv0ddHQUsjJhokMbvbH1d5BwXN40aE4kXFg9GS8HDVAi+p?=
 =?us-ascii?Q?Q3Cta+g/OCaBt8dWw4EsugaMOBfbNCqp3q62lgGoG01+YnY5OGgoe+8OogJz?=
 =?us-ascii?Q?Jfdv+QRthDnmmpAGIRaiIJeR5teS3wLK5Mh+bhKhIuOQdOnRIVXQK+P5rX5f?=
 =?us-ascii?Q?7mbDlHg0d/US5mvwFrpAeJthTS89MNeYXPhq6UlU6alOTgO8Kp/bHYccUNj+?=
 =?us-ascii?Q?hDexkEFYcoRTu/W6ufKhn/VndmA7HpOjny6L50Nb1H0G4Zp/+TAK0PHjiLjY?=
 =?us-ascii?Q?cdm/LzmgQD0GXTADWv4+rX+xH/R/4OKZBuLqwW4KzmZ6QidBGGGvInmqRqeK?=
 =?us-ascii?Q?Q1JB1nlc/tDICHt5gPIDWWhWx1xdcG1gs7oLuzPRVVNN3MXOLiu5rwEfauqG?=
 =?us-ascii?Q?uMYyjY0g3COqJHGLAaAMYtNg3ZgpJh9ZTIHFiwUpV3i1oO10EIaV92+NrsqL?=
 =?us-ascii?Q?mhfE0R/M3nLXxj6SWcio7GpRnaVtJ2mwyayn03Ng3/kFkjRRo8uA4AUwH15J?=
 =?us-ascii?Q?Kd7LC0v59yO4CeYcfCC9UspcP21IdnrFDP0TGgRdX0NqpfgNU7O+18T5BKF7?=
 =?us-ascii?Q?RoNlkdGeIyAik4u3877pguD96Mtge2XcCPDCjYGNt5V3WzVo/28rrwbq9Byz?=
 =?us-ascii?Q?yoV5XjwwmjRh3HdTfV7mYZgM5wC79vqOLPdEN0zVPK3a89jFAbNWu31ESnLn?=
 =?us-ascii?Q?YM17+kqL7oMQOWEY8pP8YcQdbiHf70E49BvsdQ+iYdGBHxHYVlw1MNq4fTHD?=
 =?us-ascii?Q?RB8ZfYZ9kfDWmDkJAzXfvtWACLfhz0bg+9lFj/yRvVGxwWzoh/rKRDYm7x4W?=
 =?us-ascii?Q?l8nUP6ap2AslGZnr54CO4JGsZ5PoeUfDfISpkjaw8ibB9fFSjQXWjTY1R2Yn?=
 =?us-ascii?Q?E6u2kBc6gHhiKsD8qyhUkiITmfUhZk/Wl5Mw+ODQDazMDRDuzlCGoksFGVW2?=
 =?us-ascii?Q?3L2/npt4MQmJZJua05LcbXpi?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c41874-684b-4bb6-4af8-08d9574fae4e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:56:39.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4wP8hybYjB4XlgBkhl9BPXDBjyP1pnf+bJER7Gi+TX4VOcCxwEf7xD0mlYyWcGm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3854
Received-SPF: pass client-ip=40.107.93.133; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using ITIMER_VIRTUAL is a bad idea, if the fuzzer hits a blocking
syscall - e.g. ppoll with a NULL timespec. This causes timeout issues
while fuzzing some block-device code. Fix that by using wall-clock time.
This might cause inputs to timeout sometimes due to scheduling
effects/ambient load, but it is better than bringing the entire fuzzing
process to a halt.

Based-on: <20210713150037.9297-1-alxndr@bu.edu>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 3e8ce29227..de427a3727 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -695,7 +695,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
         while (cmd && Size) {
             /* Reset the timeout, each time we run a new command */
             if (timeout) {
-                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+                setitimer(ITIMER_REAL, &timer, NULL);
             }
 
             /* Get the length until the next command or end of input */
-- 
2.30.2


