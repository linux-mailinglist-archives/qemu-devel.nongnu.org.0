Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01783F7602
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:38:40 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt6r-0006s6-RP
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2k-0008BK-V0
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:14 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2g-0005W2-SJ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm+ZBqt9xWbZ3mNT1zvTISud6vcDJXVMqBrUEqTJtNyPtktff2QtleTEukpWSLDN0r4qguUTiJW8xJ0RZRfnnPsz24UeRCssDmUruzj9ZmTN4+OjOdbB2hUldT3m5jsul41Y5hUI1qyPGjtKsT/yD+wZ4lKdMUdHQ03KRqgNGLl/PnXbFapFEWZR0lV2ozhWK7HCWdnaZ+w5b27PP44RPEWmYZmee8XhTiQ7pxu/5JGF7C9hKObjeK0x5YaQP3tuov5e4gLU9UV0OSHZm6u6DMK2gpCJ3i5ANt+VRMRd7mHiu43jubahWv+mKJTXgSLjEShvYOIbkb3FojGbmWZYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=jbwedyjyflpW09ok5F+6Ba5CILbv8kHwgCJ77UhJ5YKs4Mw52Vpd+IyABlzErF7j/H4P/HT/bb9jOPdfga+dUO5IruvukFE420Di8WEpeP8a1bDCflwhXqJMnqUJKcapnjv7z2pmuK38xe7devS9ZOE351uE+siOi0WiKaD/fPG50eiJQ94cvfQQ+GoKt5yRuJaCWjo9PeYzltAIom7OGO6h/gi82xaAf6IeRMyxGroRSWVpKUplJnbeGMPzE9aPx4mwyEpfjXke/VuBeNAEujRZnkgCkq/CkeR+l3uiJoQD0qliCuPxt5cEw9XDeyvPZH/Dj8ph/gdIai8cqqjI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=FZuGrdkCzVCHDjDoGBkyeTsx2oV6kUOdbgB3M7Yo+f0wpcD1DLvYmsZQrlrCSdsSLD4j1lT9SBepdk8K0jFCyGBmal5tYloIyWXHlUEHOhefySc0yhadfIEpPrLlHuKjO51kYeBL1ylvI26YAMvHqjaLWHYiBWkaMhA3YhbYz+w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:51 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:51 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 5/8] fuzz: use ITIMER_REAL for timeouts
Date: Wed, 25 Aug 2021 09:33:29 -0400
Message-Id: <20210825133332.44378-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25a94bc1-d193-4bad-6b75-08d967ccf9bd
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447ADA637F780D3589FD805BAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgrF2psX98GS9uJ2NnPVg9OtPHukJ0ji+aH2encuA4/aeIr/mzW69vS2u5od6xFZf4IiZ4vn4Yw+LSticr4hOfMhn13nrETOJPTwXivxh8zDuEci9dAWDb/E4WkbESIlmzBYZ1m8zmOGjCaXwIMGgX/NEXRwvoYvsqwvShYGFW3Mr42GyXQHYu3VOYBGuIA357QP5O0l7Ou6gzcHRWRkirtwkZwkNNJUJjqTyXeXeYnyKJjnZHC+QMxxRMyqXEdflh4D9vQwdZN0JzRBAlht8B3dJU3J7TnTjl3sGctsRVU5805AAkyw18VidwLerD6uAi9pyny2hyPlmTxcKqeZxS5QpUUehTpoWvRkK4fzepCwDwHFB1L03TeCI4Zzy7unArT3DVRSHSvVNCgtXrKRIuLZ5L2G091q4fsWUx9YtUHCCc+Mw4imMrB+ToXLzYYKwQi18WtFBYVoQdYm+KVeV2yqm1gNqJhHDqW90jE+BVt0I4cpengCiSiBV0zigDdFnvMUXEtFKl0afIp6Tfd668E8DNEI1skd+3GNM5+ValYOHdm4PRzVKoNIPqyIwKu6+JHNpY5RoFBh1H/kjFeJm0yf6bB6/ZTyDho3AqiTXmUkPqnT86NXIqcdN/S9zgkQ9LhcO1CkrY0qZ8QWUpndqcaoT2J3ZNpI1fyAjS0wKW5jlWy82oQqSHx60IHy/w6r51ebEwDT49uQXFfIDzRrWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFCnMbP9w6cCOHxxyNPwoc4TKylmHW2jv1zJZr9oVc0damd6LOK8qsTuGgnz?=
 =?us-ascii?Q?KoLD0WyyqdwLgSBRU/rh5yY4bp6bGHZgdNUZDldK53Safw2P7TUsHKHLj6HS?=
 =?us-ascii?Q?MLK7cmM4O9MKLopt1IKzu5UBAJAsWfvSbtDdl3ep58hbfb4rcvw3e/n+S5Fl?=
 =?us-ascii?Q?HVTVX7XmxmxpNgak9a/k2sB2DsR7s2wDct67bBWZ6JIEg9aUxdXIFimTgG6E?=
 =?us-ascii?Q?QQGNt1aTdHNGgerKsCt++zbzayJonxjVdeDCII2nON88VR1p1JmmpWOugzBu?=
 =?us-ascii?Q?UWne2Ef2EOkimqauDJDYohyUjXJsryZ9kJ4+sObkO5+smYI9HEYZBpM3k1Wo?=
 =?us-ascii?Q?k3t7cJa5AjnX7vIdISeytLzl0g70Sje1bu3Pd6f2R7eS44DABu5eJ3qAgCUT?=
 =?us-ascii?Q?gC4dXM6NF4//zckfO6bAO+7hC395q+3tFI2UUqWYMhEoRPWCDzRx6pVp5wCw?=
 =?us-ascii?Q?UB1kwFakQaBmqxLVbnUsNz774I9UvrcisbnpnSNC/gcQ3djTY0DTszFPDs5v?=
 =?us-ascii?Q?pnzCj8g6FwNQsDTUMU3FxB2TVpYxNRVuS1S/hvI8oX2rIzwJqO0ItnO4g3qA?=
 =?us-ascii?Q?0zbKx90tXMccSdxJ1prA7kCK+3ro+g/GlOodcbNY8vyvm+MyW9gar8sts0Ql?=
 =?us-ascii?Q?x82YTVEatmSGfHHTBkE6rAmC5Fd+B5/CoE1Ay54W7DWmr+rMvXRM6LdX9e9F?=
 =?us-ascii?Q?KqFBjUUGO788pjZTFnmP6PmUWkXqkOpEG0xXDkozHS2SfiD5n9ll7SGMSst3?=
 =?us-ascii?Q?ZeWnVN3DpItn35wJw/5ZXtFPqIF7jAvnHywiHpK2zO8tMC6QLoo0N5prZQcp?=
 =?us-ascii?Q?HFvHWE9nimWNuZ846fsOTiDjr0uBBUGPiM4KbF7GSfZydAbLcutuJ1LWTyfW?=
 =?us-ascii?Q?BOxds9peZsyL562WqH9ZvXk7g9AbvPCZDL4wo/MYoiNRrq5eqbfCGkSQ9las?=
 =?us-ascii?Q?A5WFwTy85BKtrC02zDljmmirpBdJocEegf7W5ZwRT0oPf24NOjh7CChnSnIG?=
 =?us-ascii?Q?CBCnWKsPIxB74lII4QtFmYLOpLb2TEbxKOTveeYqs1b7oOlLX+DNUqbNz1hR?=
 =?us-ascii?Q?4E+a8Fn7UTnDfCeRpWeeCf2IPS5Jg1oo7fcbsms9GAY51O9hhR3guZrjqgBl?=
 =?us-ascii?Q?c8j6Nmw0UMefPtSTPmye2XaSpbIZmxG1VleDTPVeA9PQLTawsEYQqS3LXWkw?=
 =?us-ascii?Q?/nIjR89Ifg3lRMT4CXDBNRwBouz7xDWfSHDailNmLi4eMZdDgoa2gA81WH8x?=
 =?us-ascii?Q?paJwgUEa6RhWrfc6wKWRbNr5KlmMfA5Hu47ClHR3PFWGXolhrZPQyOecB5j1?=
 =?us-ascii?Q?lf2p3qFG5DlHJzUz3kpAjptW?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a94bc1-d193-4bad-6b75-08d967ccf9bd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:51.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOnLVtbBty22J7rxmRyxZZ2jTWtkOui7fv5IWfRY0670L2G568QsRHd1jHuwITjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
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


