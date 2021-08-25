Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5283F75F3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:35:37 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt3z-0001Yp-J1
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2X-0007JX-C3
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:01 -0400
Received: from mail-bn8nam08on2135.outbound.protection.outlook.com
 ([40.107.100.135]:56000 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2T-0005Wx-BN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPScJAISDNkkHX1qlq3iMasg+eDQ9Z4GHYOcAijQNGROUNqbUsubeEgWIhI7x6WYp/WkihTGlLARmauJtDaKF/tBuKRY+VAyzBI9kydLsXiQQTYJxcge4f/e1CWNDLrKm3aHOuy8pEUTV+w7j18H/4soDXHIthAQWVVhTa4BYAwWf0864VKkou8DQM7MKBvixTrQQIkIffOOk48D8gaRABwnXf0PGb0rJoF8z5S9f75uYFXzBUpq4pWySAD4XVQuun7ffvCr4n5kMJDZuehwv08ZbuEl6r0VAD8bYDoZ8oVJqRi5rISOi4LEvvvu8blXVsQQ6aR0M37pXpRPZSIKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8y7fAv7xVpWUn7zCNt3QXu4XFGUmA2uznSX6GRMyeY=;
 b=HXa04C0YvEMSdFYPRwz5105kW6qq5UDyT6h8OYHgGVKGxgpM3ylHl773G06vhx/jZHDMHoDnMKu/7jWdJ7jhw49iy/VKCY5fdKXKqAHm80nhyXAuORMw9kamlewuTl8FNqmNMaLY1MCNpNPcEX02I3C+r8M6dEeFtpdpy57CcaQ9kh2NxBrD6SBjYNirkbhkl6NypX8jacFfKsAV+qmA6UoLAM1saaZo4EXE5uP3r866GWZBzWOWtfOsOxFftAhWwBy1Zr/k6B9PDzHPPZ19tz2INHxbDl8WGtsbif+QCeZm5WrJDYb46c048ZXGLu2G3kGvmHyIOH1T9pg/L42ZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8y7fAv7xVpWUn7zCNt3QXu4XFGUmA2uznSX6GRMyeY=;
 b=HdswABlIAr92AVJVE4BgvXuQqG78COI9RC8aG+Gu5gmfmDKwuXKq+H3THXdsSKpc6oc3esJNEKfGzuGCoxPET9XnuZY+7QNNmai0ANhY19r7F+qP8haDCDTUALCZxw8+w9aYQmmUvPGIDutcgLY5A8mH0HvEu6x56k1HJhn97s0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5481.namprd03.prod.outlook.com (2603:10b6:806:b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 13:33:54 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:54 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 8/8] MAINTAINERS: add fuzzing reviewer
Date: Wed, 25 Aug 2021 09:33:32 -0400
Message-Id: <20210825133332.44378-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0427dd1-9098-4250-35df-08d967ccfb92
X-MS-TrafficTypeDiagnostic: SA0PR03MB5481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB54814C08DFB30B2FBFB21B4EBAC69@SA0PR03MB5481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ps9owZjJK8KcENc/e7f1ve0Y1a+cCocrLLfTMrTKvFST09TzxIL7gkSAvun+SyDWBtEEPnZH3hpxMTyIbHOnVLUF0GLuCQNwxheZKct3Zv6JwOtuygY1xgMCWYx9gKBqRUMFu03FHoRjmcWZec9oVfElXWN1DLJWDt7JiE0RtdHWVo9eWpD6WeHV7Na0p4JWo2ILbn2JUU4qFPCHehaL8udFYFgmLCRfZL3NGX7lUeqaj75mrN3LtFAR3UJG+QFSCWniRmR9iC3RVlAFIT6NyyJR7NSfUY5Q0cQ2/eggR2mtTsKhN/oeatpYnWGxj4Vo97CZipYO8y3aq5i7M5MOCiPFRP3Q/bxlAKInyBWr0XEA1LNJKDuRsakkQPx+ccJoiEjB4X/Pmsh2uzjwUA6DG6K9vJ7KtQdFO84dXfbsFE6uHrVyO2+shFb+Af5rPnhTzDHj3Q5Hj4Lbaqo4ceVQ7Zb/jpHePfNGCddv+FFqCSPn/KSz+xiSMxEhq5oATv0/gLFG9MEqH8sscdfe8O88ERArQfDpy607QL+ay77Gcw6Q/0zGZJukk6ml7sQ33vOprlLl78mLEOX3AVd8/Nwd3yLv4epyEiRj8AaFOJktfYVW5XOA3ZeRtshD8vBSiBUtkBlDHIBa0WMTqG3P/lyy8IFUbJdsF8/6RHl7cMPY+eZ8KS0d0k/XeDYlRjQ5sTGl7lprc+a/PQDQTP08AV1RUOJ458joMIID3w+Y3gSs4AUqm2fLHSdNTh9vY9J8VBKpS/54xDxrukm2/HMT/QcXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(6916009)(38100700002)(38350700002)(66556008)(66476007)(66946007)(2616005)(956004)(4744005)(1076003)(5660300002)(4326008)(75432002)(6666004)(54906003)(6506007)(6486002)(186003)(316002)(966005)(786003)(36756003)(8936002)(45080400002)(26005)(478600001)(52116002)(2906002)(8676002)(86362001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNkOG82MVYxenUxbDA3MUk5azVrSFhHS1Rwdkc2Yk5SV3laaUtsTVVGU0tW?=
 =?utf-8?B?dWRoZlBjLzczOGluTnJmeVZqRjVUalZEaGE1aGlaTnlKbFFUcWVnZFdCbStU?=
 =?utf-8?B?cXRCRmdlY05jYWw3aVdrcE1QbjliOEpZVkNWRmx0ek9KcitDODZJeS8vY0hz?=
 =?utf-8?B?cEgvY2FsQkNkVHR3aWdMcHlTc1JyeXlCaWdlU29sQVBBSXlVVXZ0SVhTd2dC?=
 =?utf-8?B?VkJ3V1J5RmpTblU1VkpkWWtZSTc3bVlXTzg2czBTWm1NaUlTQ09yVkZUQllS?=
 =?utf-8?B?cWZ5UjNVdXF1bXkyN01PRmlKZE5MSmNQUHErZThBNTlRWTZOL0RCODB4ZEpH?=
 =?utf-8?B?M0dOYmtIY2JkM1UyV1pYa2FZc3NJckJQOUY5elVYUGlqRndDbmdVY1lUZEEv?=
 =?utf-8?B?VldHSlVtSTJpci8va0gyY1Z3Y014T2VEQWQxVmZXa2NRdkV4VWdzVmlHUVVN?=
 =?utf-8?B?SFZSU0g0L2xVaWpTNVVNSGM0TTlOWlREMEdrQWM0cG0vM1Zlb3ErNDEzMVNk?=
 =?utf-8?B?ajJRZU9JSm0yS0RaUFNkTi9lQlhSejB5a1I1bHJDNW5kcU4zUWY5VDUySGZD?=
 =?utf-8?B?MnpRaTNSRndIT2pITzJhRTYyNEx2MHY2Y1poWXVlajlYbTJFZlJySW53cjdS?=
 =?utf-8?B?RTVoUk5TelFrUlRjK2lEMVdGNFU4TThWN2ZJK1AxOWlsUDhFYU9NM0Z6SlR1?=
 =?utf-8?B?aGtocnVoUWJ1ODlCTm93b0RGUjFHWkgrcGlNK1lzc3B4YWJ0b2lXblNmQ3Nm?=
 =?utf-8?B?V3M2Ym9xZ1QxTzk0aWlML05LSlEycVlQQWRPUkVXOVB4aVc0aFBSTTZrYm5m?=
 =?utf-8?B?V2tWTGRHWE1kekNBSk1VUGp2SjdWanhCM0wrb0FuSHBmRStIMlA2MjZHODZx?=
 =?utf-8?B?MWJYUjRxQjN4RTdqcDZCeEJHUFZWSThUMXpqZEFxaCtYT3lxa1FPS1c2M1lI?=
 =?utf-8?B?dnl0ZXFHeUxvWXdtYmg4YnZOVVBKVzZXWCt3K0szRXpXT0NQSGtsNG5JWlFE?=
 =?utf-8?B?RUlMcGVSeHFoTi9qTVF3K1cxcTdXYmdvQk1xN2FGWTd6UGlHVXptL0JIdGx1?=
 =?utf-8?B?emM4Wjh5NVJoQnQ3QmY4RjNmdy9uUjV0c1NuUHQrUzVoVVhQWE4zaEczUlZU?=
 =?utf-8?B?NkhCUTBVdVh4YllSbkg0ZlFJVTA2UklTbjVNSW1hRmdJVE4wcnF2UjFtZlgy?=
 =?utf-8?B?cndwQVY2ZXRpZGMremEzOWhWelFtK2VEVUhNMXJ3dVplRjQzeU8vV1EwaXY3?=
 =?utf-8?B?NzNyak5nZnRYMEhSclk1aE1WK1g5WWxER0NtTzExZC9WbjdWNS9EbXBaUVNZ?=
 =?utf-8?B?U1lRNFFxbG41VE1ZUThKNXNHQytlbnBzNEhmNWtRZHZSTnNoNEp2RFRsaDhj?=
 =?utf-8?B?amxOTFEwSnV2YkJYMExYcDRkWGhiODJOcDhQUlYvNGp4Vjh0TlZTKzNoM09h?=
 =?utf-8?B?SnZnVXhXSHlCV3VlQkVoVlZqYzJJM1FWT0YwUWZodGh0SXJZVkhmZHNpeWZr?=
 =?utf-8?B?VWREb3J5VHNJaEpwVWtwYmthVkR0cXJWWHlsQXpJWk82eTJEeElVLzdhbDVn?=
 =?utf-8?B?WGI3OVgzYXlXMUlHNzAxN3QvWmpyUEgycnRHVXlidnlVSk9IL1Q2dEFaZGMv?=
 =?utf-8?B?dkhkcHg5MXNKejh4b0JaZFQ0OVZzaDhab2pWcS9BM3Z1aktPTkFLOS90aW5R?=
 =?utf-8?B?emNRZHZESFYxaWJ4SjFmQ1V3WklidVdaZmlSWTdpSHlidTgwU1VOdzBLYUtP?=
 =?utf-8?Q?3UDnnWA1FNn6bekfXH317nyE1BNgwW+cN//VWgL?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e0427dd1-9098-4250-35df-08d967ccfb92
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:54.3807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJbc8eGeq56RtDF51Z0ADvp/ZYkpYmnD2lcJa3m6LFxFt0SNNmlFgL9DFkUKtzyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5481
Received-SPF: pass client-ip=40.107.100.135; envelope-from=alxndr@bu.edu;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

To keep me cc-ed when something changes. Suggested by Alexander.

https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03631.html

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bef084ca1..be840225c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2707,6 +2707,7 @@ R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 R: Darren Kenny <darren.kenny@oracle.com> 
+R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.30.2


