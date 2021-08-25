Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B43F7637
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:44:36 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItCg-0000po-0P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBB-0005rJ-Vf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:58 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBA-0000OG-GR
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9+oBBPONydSXoxkjJYEiYTQra5LZxa9UhP0yyWGGAk2rzYcaJsUzJqSkvwhP8WfvZFV+2wVK1E//oYRYDJG5Gjvkg3fQMeHiAoZpWSFj2ElE0dOaNyPCj16uvyPVx0Hn4opIcVem3m/PQkdgM/i4ApvwpdjnPuOKqXP0QBXOW5425f3sZI/46yKg1e+6jXGQepErMuGcw08/Yaz7ySi5Sdf99SX2D8e5RkppBKxuAKNpCdmLkS4t7+isVYDWGhZykiscU43DWUlKMi9YCu+vg4ijLXOSHpwsf0rYiqd/FOLU2goL7DgKddXC9PnV+7SdwIQnJ2SB4SSE3Rmyn0KcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=eqmaaFEyGIajxUqfhppLFDjG/LpnlaOcEKtT5bwzeZLn9kAvkf+UWi1ersnUaE+c7iHZ/aYYM5+7uZmFhV6TkXGiWoEQV1ZQUws8yWzavhAKOMK+PjwQR+3DILTMKi6zMgXZ7w3jTZEjncxZXnPi/pNXTQ93fdotpMUjeTZMxlnFmfJszJ4SfzquTllEOgG7aOlO/xyv8r8C7zMA4cdy0DYDyZhDiAWeYCs0VLuNdGBUojuFvJOk3nohgYudL6kXBmT8iIOuVoOqkNqyQq8hdnSoZKa4/bSdQMVkFtl8aHkEnTeIO0EWOdz/uydxqSY7RXYU/gWIEsDfmYVOtgeDNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/R1x1z+z1p3xQY7naIic6nQNwUSCMR6gBle7mPU5g=;
 b=Ha23/Gw2WmKegGNvAxk4SEMGWRwTe3r57I1rpLXfdg5kJNvGUClrBRZB0LX5tBRlJXC3spepy36QI6V2M/6neQRLyJSe12VOLqdJv9erCsAivOBA4sttJ3fXrM9E1YkxKq2iAKRPdpHOQUHBHzn4KWmzXyqbOqlnEIAMcpKPxtQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:42:51 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:51 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 5/8] fuzz: use ITIMER_REAL for timeouts
Date: Wed, 25 Aug 2021 09:42:29 -0400
Message-Id: <20210825134232.45074-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab6858d-7bdb-485c-a9d9-08d967ce3b96
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4399752E36881E571D83A43ABAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PSCc42JMc1KWQVzt4BnUiAn2AOnj74Fdm/McVMm7vq615KcZucUiuQDMof1YmdXW885CpCrbLfn/ULaAA7FV3Jt1+g0v6PYvoMyACxl67F7EGSPHR4m0fTHAO2qjbPHLjd7aRS64/GkZzxJsdF8UMZaSNJgIHwWyWrkBt4b78KgUVNIXYV9Ll0Mwt5UV2TJlZLNqWxCn4h/9H0GDePSf49ww+7+pHeKyZKDRZDhLEG22lp3fro8P7DpSg2qdNpggUZQdwIuYObqjgjTrQW/sZ+Mhh88YD3gsrmSeiaHr0Wum2Xi17Qvyq2oHRHkmPZTtLybdRnqG5PQqIxoGXrcqvPph54eMAxbdaqUUxb77I5RxxZmcZadaITcwOgnR1F75OOpgSZFfAnZVz7O52FGrX06gZN8V8WA6hOgWfIlzSeNoTas+yKrOhRzYhwvmv0/APNLOg02tc3AfrpLt2ys9Voj9pYByNt7BS2yOnNo6uYvcUc83nKHk2z6yM0y3P+CuO3DtjyeyjMvyCqn6IZA75JnVz8wU9bUr+WoQ6z8iSvs3xO3x7IvoNj1eOVYEV8120v1RPokMGS6ERclWnyauHZ3PDwXPFZBOqQF8Rx4DxuuCX6uqV0/SJE4aM5jSp6ArHbZ8yHG5irZ8atSTydElIzEfyITizclLM+qdyDDG87G94Lu+vV0VmPthZH3Gt2doBI4t7mtt7hyUKHT1cc8x7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(83380400001)(4326008)(26005)(316002)(786003)(6506007)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1vJCGlUUkAFSH4FuaSxHvWl6MczSwgcRTJ1djRGn1RCGJhc8qu4y7oTlQXtv?=
 =?us-ascii?Q?P1L6BVRcIz1mJfx8q45iXKR60FdN3d2M/iKLx/VbJe47KFZlfB0OjVinln0X?=
 =?us-ascii?Q?0W6uW6jhwa7keanEoYqNUe/eH7149KdWWcHakMpzq+RlHK0BP6jCLhyo7M/p?=
 =?us-ascii?Q?5+UkZLEGQ9Y4y7obEqgQGQj6iWndOMHrcNO2SXAPcNgL7UQaQZA+hsbJdtB5?=
 =?us-ascii?Q?vSFbgnqhX5VnNAhH5hgsex+39c2CmsgOXuS7GRSl7DfOaJBsZFf5LrawGbSc?=
 =?us-ascii?Q?4ILkIVW+AmVOzzJGTJO2K3f1EtjmEMu0aZNkPEr8QgJTuFGm1q6zwkU1/M6l?=
 =?us-ascii?Q?iCwn6vwiNCxf25QvN0e/MHhvoIE7m9u5nxK2uyKdkhOAMz8mrE8iuHTFHrZa?=
 =?us-ascii?Q?6ruOJuLgb3eXchN1QrAjGdtiqiOmZiD+MiFGu0BCJRfY7krZg9WlLzEh2HDD?=
 =?us-ascii?Q?ZpQ6ep752MpcM+NVcn+Uchwt+wIrTgSNafisBoLCyDBr11Il3stpYjL0e4XN?=
 =?us-ascii?Q?rZOYHtdHZ1wPS+qNGYLDAZOIXr3IrSsjML2d8tuSUHz3uKvsIfdBEiwowmnJ?=
 =?us-ascii?Q?C30GfF8294+9GQaO8gtF4GBjr3UgwpCgvdSKTbGJAtob/VyNBd9FyptReAsq?=
 =?us-ascii?Q?B940tGh8EUvP5xPAk5P8sq6SNR5z9aIbfr7wAczuBMlrPJ/TSZMRCSBOW9t/?=
 =?us-ascii?Q?hFtC9gd90C4x5voS8/IRx9nocvfVWopd5zJejfQkFB/VXORACbbuD1G9R7m0?=
 =?us-ascii?Q?34VROZr0uSxouLptIrsd9vIJUFRvZOxyMTV/cEtVX8pKcvHcQT2iqMgZjv3d?=
 =?us-ascii?Q?M35DMSej1GacGR674H8d2/UcMyz0mq2ksnT7oSiMuPHJr2pVnI8BTLUUCLjn?=
 =?us-ascii?Q?VIT7NrZIJjVRWAtHFlEc1lIr/X2Jdh3FXwh3lHhoaA9RVWWmmKlcvad9/rRZ?=
 =?us-ascii?Q?l5OaTCK20le0f8yIVucBj+K7OAQA5yRui0RKT5re2nkF74AyTloDqiJis/tW?=
 =?us-ascii?Q?nzva8u5C2p/yJZ6WguzikZgqMP4nbLLxTdPn8kOv7k4cbR8utrGxsa7Z2kvU?=
 =?us-ascii?Q?7riw1DgTxjXXzYqYMMQXcrxKpqOLZzCK1bkgv7NuctESSAsJkpa3TGZa22E+?=
 =?us-ascii?Q?IrtM2ynUuoWaC6dnGOUU73XbiLhqi094NFPdOWfnL7uqtPgcfNPLpOPQnZTv?=
 =?us-ascii?Q?MrkMk82raulwwvv+Lyqbo0l/vdp3A+lpO6gtxxAL0AwP8wbRwgLPOE4WwjBM?=
 =?us-ascii?Q?bEPJr3bKqDSAFIhESeY4/cuYt2yIEqb/J4Ac5iJUPNOS9kjLWIQao/wikSSF?=
 =?us-ascii?Q?flKP/+yElWHNmmSheA/9hqAV?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab6858d-7bdb-485c-a9d9-08d967ce3b96
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:51.2178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrLDSuY0PTrxmqaTWPnfTf3JfmmI8VerPlxLbAUvP4GpUY6v8vWuPLjxKbkP+n84
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4399
Received-SPF: pass client-ip=40.107.243.127; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
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


