Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9C3B25B8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:50:53 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGOC-0002Mp-SA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIv-0002uf-Mx
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:26 -0400
Received: from mail-bn7nam10on2106.outbound.protection.outlook.com
 ([40.107.92.106]:38420 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIu-0004TK-3f
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvU+zEyFdwplS5jdaDLeaM4d/JI/Iz9uzqtAeIj7DkLEQZCF+up61tSyyuPgTyJGusmItbHuGmrUDwegdDjELRfoBn0m5r/1Ik4pYJnItFm+RaLZCmJzixVbq+CBqMdjSakjeKO5174QXdkeTXpyEcvxiI/a9H1AetOnQEzsuB5aObJexIWNL/EE86MpdkApPGhqR5tOMTN4J4T5G0gn4tP5udh3zXMgXOJOvr5lFYWwthcZVL64uM2L+jqq2YXVuZ1hfTvCGNaIew5hS2x1OoLu9JN4IRQDg5JkHUF73gVDMWgjb9b5wnSW+y4TrXjYPPjpzpUuW15Vju9dy0HmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=bvjMt1tiV+n7jSVs8oSyYiQ0kJJwTSKf03nVp9+GG+EWh/1MhDtdh334eEYKFlcREz1m4ZQFZEE20st+b4TSwjpUU2I/eJ9AxsrEah2+iV+uAC8RPpL7Anybng7j2LTT9+cnhscppj/qfAB6Yfo72CbQWfsQd/OViNDXiImh9ty1YKQL8wnguH8HJjjFKJ33I/MiusGJRyN7v/snxqZzdKAFL+zHLlyqVOxeRjBglJkPCebv4IbNIls1ABobtnIDvjqhIjgeg+aMENIf2w5ne7v6iQoaLKUpMvPueRvcx1ASfjTsagSX8ooHS12Sk4UwPk0Mg4uGDKm8yPGtSB6iTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=EJgwbEkt+5I/X5ozjqkARn5P5/847wFPE4S4qoWtgnaNS1Bc1BsX8fOeG1YPHATs1OvY8/NdmYqDdxGXvwd6J6wTRsYZ9xZqK2hrRg/RfocsODO4Odgp1e3adTw4RBaSOl8WZGRK1dvc5WGSXbHFuNsHjyrbAqgrn2y6EuYRMQE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 03:45:17 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 03:45:17 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] fuzz: fix the AC97 generic-fuzzer config.
Date: Wed, 23 Jun 2021 23:45:02 -0400
Message-Id: <20210624034503.86256-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624034503.86256-1-alxndr@bu.edu>
References: <20210624034503.86256-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 03:45:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09a18dfc-aeb4-45ad-b4c5-08d936c27b71
X-MS-TrafficTypeDiagnostic: SA0PR03MB5468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5468757C5BAB679B47C16153BA079@SA0PR03MB5468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EasRZM4gN294uVRWPUmBT01PUgTsPJyINpgVkmw2uq37Nb/iVO6XSXXnbXaJ7qZk9YdrXWtoMNawih0gDq+kbDc/ah09h1TTZ3AzB41zgHoOK18Fx63ZbmcNQ3RRiFVliqAmhHBiEnaqbmbKiu/Wd50zz4StIY19AJnDOKVTOvQik8DSV2FSIV5mD4Ipoc4XusDJesAobfbie/UISVVz5MXiBchscy7rQZnRkjyU6pjpIVpQYyNka2A7oJ/L1NPrWozG1wG9bJdZdisrgzPE6i7M9Sjq3eoAxPe1VKCVqdtYa6BlITfve0eYAl9HYBM02seoPxYCyL4J51b2LXp0gkZUc003s8dQWExyZA9YZAEvgd3Dw2hqBnnO4j/zT2fONnMZa45aU/5NRRvuBHRiFYrjVly4sy3ZwwINFCEJuPzR2rZHVuCvqI+k4AG/f3KGkp4UtGSuTMKseENegP+ugFguS+SC7xevDG+/9DBtAC2iteEWeJ565gMyOnlHsqIPqCsuRfisHHWkrwQV+o1PNICMm0MX5RBxCPv9aAUF9nNrrsu76RusNwhI/iCkhvXkRmsxa89Z3volepoJ2oaqSyaAzPeHe29zJ3vwlFEDOxi/4VZtcmt3AxeskyF5wVln/F06VlT+qf64f/dxv5vxr2JFqDpA0rkBjhDPpTcMGY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(36756003)(75432002)(52116002)(66556008)(786003)(6486002)(4326008)(6666004)(6512007)(316002)(8676002)(6916009)(4744005)(66946007)(66476007)(26005)(38350700002)(2906002)(86362001)(956004)(8936002)(38100700002)(54906003)(186003)(16526019)(83380400001)(5660300002)(2616005)(1076003)(6506007)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1x3dUe6bpPRa3p0l7hXMkZVSCakpNg669k1izAe3UZgNnNiV5OCCqgxdUiYi?=
 =?us-ascii?Q?k7g9HHENe0hh7Kt1EDgT/tKDjDq4HAoMXhhjVFb+Th5M6Ii15SgGS3kQGY35?=
 =?us-ascii?Q?se3uGwNaw3sQS1vocYPpKkFdUZzC2De4v+fkQ0l+CUF1rZybLBXJidP66L+W?=
 =?us-ascii?Q?AFonSs2dZjC1DtIi7fL/tlwVxPK4R8Ozdu246QiYTi4t6+x0ztOjUR60hh6P?=
 =?us-ascii?Q?kRrDvNJypTZIGsaqeRT0PDUeC+eInUsFBmeDe9nCUs/GAol2SDUQ2bHfKpMh?=
 =?us-ascii?Q?Y1suiCfSE3ocIUF7RX56FkRx3Jzy2IhBgXwYzKbAjm4XjI3Fv5IVVdhn0SPU?=
 =?us-ascii?Q?ToQ7wQJ0qdFZhVt/n+hLFTAJ08b8vJjeMSLPLn42Z9oq/L4wBP5VF6JZW608?=
 =?us-ascii?Q?MkqcK6eW6ZHTDxSFSjqYO06SmWTNA3Ox8viE+Y2LbMqPpOWFKTdrrWSTWNKN?=
 =?us-ascii?Q?5Vh7lI0DMFApIZ4y65CNftFpRpDNgpwWBQliNwll6vqbVpS0kjB6of2nleb8?=
 =?us-ascii?Q?dr2jSidudDdkMLD3KaTIDkmu5uDgQ9g4lul/vrnMBW1oGQlsXcffxnn6TsFH?=
 =?us-ascii?Q?/ULishKlQv6mYiNy0okNuw1Ar1sTMZLAgsdUI/5+R0APFULxU+YcmsjSzw/E?=
 =?us-ascii?Q?3NAgbzYbzUbcxs355jWvg86E73AuzwS8njlF0oL90Xlf14hPhCHv+GSkflgr?=
 =?us-ascii?Q?iRTp65zoJfeyC+yBnLvSyjOPrahXB/8df/ZBIO1LSDw4KkE3F6N3XRXqPU7G?=
 =?us-ascii?Q?zpNikn0DZ9Ie5mgHeqhnGYZf86+gZTvJxjwASKbR0YOYkz3oRR2if8YshaKo?=
 =?us-ascii?Q?L4GU2vXZAm9cdJgXWm8QB22Z4EQ2KTqDLB2IJG1GuY9fv0Wg8+/tHigoF1G3?=
 =?us-ascii?Q?wSWU1dIZFm9w2ttBcPlk8GAK0//5axF89I/lGsL1LC8CgrZAolZO82Ftc86n?=
 =?us-ascii?Q?vtBZqpn4q8rE+OY4cobGvGzx+QFnQ66xAMKz07RzbuUDS+1h0aDU1FRII2/e?=
 =?us-ascii?Q?eL4PuOccd15DKbAxl188Lo3C4H3xlU9BpjbJQuourWRZ8CXObvf/JCT//x70?=
 =?us-ascii?Q?rXaFnibcEuW2msxUOpbJLpPKQ3C4RkslxIEriWLrw3i+/5Xoe5O+IooSxlDh?=
 =?us-ascii?Q?IxbntCVPJfq7fUWTpfFd3XgtF1qPclfdd3X0dVDThKNwthWEuLsQeIq9ppWY?=
 =?us-ascii?Q?bOvY0w4BfuDteeNerLpN5TFYf4Dz2fNDXboSFF/ZMRRyi4QTPiVvvqjMEX06?=
 =?us-ascii?Q?0A6vpVQtu31A8S2r6jEfJ7H1F5hN2tbpzPWaWj9/7Y3CruO8yJVrG5VSINSi?=
 =?us-ascii?Q?IkpZZSE8DenB0p5iOgQybvNh?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a18dfc-aeb4-45ad-b4c5-08d936c27b71
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:45:17.4069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pplT4lSc2ljV+MLahUoRHXTFiEUDia8m4xeB0oA7C3nOXLmemP5KGyCX5AtFyF5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5468
Received-SPF: pass client-ip=40.107.92.106; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_AC97 is "AC97", capitalized. Fix the config to account for that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 004c701915..049697b974 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -218,7 +218,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
         "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
-        .objects = "ac97*",
+        .objects = "ac97* AC97",
     },{
         .name = "cs4231a",
         .args = "-machine q35 -nodefaults "
-- 
2.28.0


