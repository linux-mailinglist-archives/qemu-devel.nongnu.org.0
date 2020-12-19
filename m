Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E96A2DF123
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 19:58:14 +0100 (CET)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhQh-0005d4-0q
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 13:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhNb-00051w-Vr
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:55:00 -0500
Received: from mail-oln040092253062.outbound.protection.outlook.com
 ([40.92.253.62]:6114 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kqhNZ-0004kb-KN
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:54:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3ZrJd+7j59DFpIJ7RWYf2OGVhxP/Uczi50w6g+nUi1e3ewjS8gLqqMn8IKNpirjxEi8JWvH2wLDYybA4Bt2E+LhDL2N2scP33sRM5In/d+zsBdkvnciDpT9f9nxSnYnkDBBANCNei5fsnFu39Qq4PniHjs5ZwhLNAJkhvwA9msOG+C1zobhiH2NetjDMOBit6bhR8cmcYDsTLRxKMrjPbBYKnWE6T3m0yzI9bx7stQtEKkrfnDUt1qv3746YCXv+OnnS0vjxrky0V+qXVPr5VHl1j3cqFiz6WHlUuTVwUwrxUo5oVI28ZnkDSbmYi5Jn/KFh+vWl3H0Svy94F8Bhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9tqqXw8p4RjZqpm5ejrx5coGIaqdPhjpReZEOoYO7Q=;
 b=ZNlw/fZvUyg8Lnbk8fhdWsZs/rBBQ2X8dj7kyKrb359DEPFJKAu7kGfFjVuHv/9chTCD0jH72aQhGu2oSDbBfvIYAIDTe3Hh/+249CB/apznwmyeKoowkx3NWym+Zi/UqFT37uexZz62VQsP8+xhKRIjI3JkNj03jS+2QKenFsRKTFwdwbS/Y8HhSjVwcl8ddj7g/oKGRi0pbGnPpDOl/HGXmHqAwCfaaX5tJBRty/XdMTgFmVLXxz24KVPUIs1wUWGIL9Y4bM0+G/+fIU+IE1BDWaX4kHjBsurOOLYUGZbjO5OefNouI7G9mDJi3HHcTlDaVks0enlaXPjT7tI6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9tqqXw8p4RjZqpm5ejrx5coGIaqdPhjpReZEOoYO7Q=;
 b=fobjEAv2vVobR5LO2MkVccidBPB8Nr9hIppUSsGtA87AcNAUbHdqoqh9g45CVeealjAdab38h69ikoDhg/6p3hHamkAbKHoqWQH487bfVJV869d4LkQjmdyvuQslDtbk2mbESyjy9p6NBSJ4NQG0kE9py6cqRONhlsOOQ9ZW3FWKrqR4WulUaeWv+W0B5Qpig8bsdu7kGh3hY9XfkZPpyUnaG1xpCVJUxlO2HNC8h982VMF+dl2DTDBEpyJAOcP4F9rXzAmT1fc0KDsquQoAZZMlqqwcg++kLx4EsyJU0S4BX5g7tajbeaJfTHT0RjgkGqbvSsye5LrI4mszc5yucA==
Received: from PU1APC01FT014.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::45) by
 PU1APC01HT017.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::378)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:39:30 +0000
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::40)
 by PU1APC01FT014.mail.protection.outlook.com
 (2a01:111:e400:7ebe::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Sat, 19 Dec 2020 18:39:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:747A98DB69723032E4D2B7D73478E4F8A07D891722B88BB1D6FED9AE2D93600B;
 UpperCasedChecksum:E8D11E2493CCAF2166112BE4A6BA076BBB968F1138D69346DE3576FBFE518511;
 SizeAsReceived:7449; Count:45
Received: from ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7]) by ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d86c:2255:e334:54f7%5]) with mapi id 15.20.3676.025; Sat, 19 Dec 2020
 18:39:30 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] improve crash case minimization
Date: Sun, 20 Dec 2020 02:39:26 +0800
Message-ID: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [uLv891GMh1YNh7XpEW320ylfnqkr0EHb/lAjZo5LDFYfqZfjREeqBppy5ZAcw/ft]
X-ClientProxiedBy: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:a0::14)
X-Microsoft-Original-Message-ID: <20201219183926.426205-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:1079:e2bc:42d3:a57e) by
 HK2PR04CA0045.apcprd04.prod.outlook.com (2603:1096:202:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Sat, 19 Dec 2020 18:39:29 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3244c92b-1e6d-476c-7125-08d8a44d6bf4
X-MS-TrafficTypeDiagnostic: PU1APC01HT017:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LYNATBYKt13kxsnVT97xcrjDJ2WDSopMKH+toffxKZPp6j2hGS7WHcg+bt4qWXx+YJIJ76CAzqSJXOpMelByZ0y3a5yVZdfU1Ks4dr0Umnxlwl6ZS4Dq9jhrmu4fjqVqvWgbLx14K4egPRBmAXl8SfQCdUOWOTuOnWGBsITR2trA86gP1kIs5KB6wJTGndb9KdlcfqnU+saF7X75V29P9cJvoFNabSSHkbIO8jn25UuZ/VAanavCFWF1MWnXLlC
X-MS-Exchange-AntiSpam-MessageData: 8xrXBaRAWLpHSNFHoX76/hO9WTO8XjRjZ1kJwrj41xwzqbPpSH9TtmPLtEZjSVZi8msbpA0vdWiS1l7XhRiOi+D6BXM72G/KQl8wr7lO6gPA9S1+iXTZ3tzNClXhwdpSB80Ibxe4q8h1nN8P7hUyeEdOglgmSsvINf3Vv+ZdD3CiLVs1j+qwXb7hR+vbWzCyUHlr5P8ggC8vWOgQeJdpPA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:39:30.2847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3244c92b-1e6d-476c-7125-08d8a44d6bf4
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT017
Received-SPF: pass client-ip=40.92.253.62; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend and refine the crash case minimization process.

I forgot to cc some reviewers in the last patch, so I merge it as the
first on in this patch series.

Qiuhao Li (4):
  fuzz: refine crash detection mechanism
  fuzz: split QTest writes from the rightmost byte
  fuzz: setting bits in operand of out/write to zero
  fuzz: delay IO until they can't trigger the crash

 scripts/oss-fuzz/minimize_qtest_trace.py | 126 ++++++++++++++++++++---
 1 file changed, 110 insertions(+), 16 deletions(-)

-- 
2.25.1


