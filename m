Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155AE3B25B1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:47:10 +0200 (CEST)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGKa-0004wl-UR
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIx-0002xO-DF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:27 -0400
Received: from mail-bn7nam10on2106.outbound.protection.outlook.com
 ([40.107.92.106]:38420 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIv-0004TK-Qu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qa01YmQajG7aXU2LQaauqSmqAGYZJL7td7EB9bRfpzz8ZpE5boV7mLcGMgvstilLlsKJ34o8ZELCZqj4i3Umc0ekx72qjZzGJi1E71EiO2EdXPH6Y8XERTyIxsnCF+0QrTxZSkh83jA8xiGciWcp3+n5iBtz3jwrMZGnVTdWRWQWlcLF8MaOWRzPLqr88ohpkwjIL55/3SPobW13vppLpW1TARXQ31qxiGkItbksUWwkSu2nyrYgpfQw8Ul7rWDqLRNMQwZ0tN5Wn9fF4bdTd/KJ0kyB2t24D2lV4zWnBf4/9es/Y8M4UGbQ1pndE+9Rt1AS1Y/dm12NOEkBLqUsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=ZeOxX0/KFC9UHbGPgXPUbdjtQQH4kuE9goVYbiF+WzmWX+m80fEnAbEd8KU14QzrB2RK4Vp1Tza++wuwojSrKgcRysAm+Nsjscu/xQ5yZO7CO2A3zmIksAlOjXKbzj96P1NCTQF+7zamlvmDdTo40eN4ecUGLMlyidtpyqFASnQBeApZ1MPS5/ENsgWAJ1ZSsoyaHCLeA+HUtRkLrzucz98SlxWkVYVdzCrH/z16h6QpCxm2yEm08npIcx8GqN07LBxMc/69GiY1FhAL0f/IU5G+EXRH0NGikin9JA6UfMjnjqTIWy1708GfZ+89e0Nd9xkeyxhonYCLfnHjrJJuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQycF3y1+e2rga8fnL9V0JqhlEEUHFXnevG6nygxWyc=;
 b=Ro2o4LFQwUnMuMsah0x2AzOk9PjNzTnpmBCnXA0WF4VPEFtrPtW6o3eQhUpOreZbwXyMSMESCx/8AqhQ2kF50FXIpFRDuMQ/MjFTHDWI8aa+phexlA7tAEyKkkGy6GfhITkGrsQ/cRJUdhGC0arM/cI+SUPqFx4uVZ467Zu2WWo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 03:45:18 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 03:45:18 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] fuzz: fix the ES1370 generic-fuzzer config.
Date: Wed, 23 Jun 2021 23:45:03 -0400
Message-Id: <20210624034503.86256-5-alxndr@bu.edu>
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
 Transport; Thu, 24 Jun 2021 03:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a245b7a-09f5-4ca0-cbba-08d936c27c1e
X-MS-TrafficTypeDiagnostic: SA0PR03MB5468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5468440FD0B93288E2919AF1BA079@SA0PR03MB5468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YlbgfPb70eVgnfnpOM4p5jDYqUXDq0jZcjQEnyZntEfFPcISZmkqRs8v6IlPpwUUgzwKg/OARmTrQtG0R9VzDpPUKt28xJmszGiexCF+3zOxHhr0g8svCaSBfEMhk+ejthd3ZhW3/n/RbhT1wmlaPqvJzkgNXthKoM0pbOkHCVkYGyIZGESRY5uacLKrtlD21XsXKM9frzTGwssQBslmyRqoeTqPT2W0i23FOQb/mb+UTjrITlMY/jdjetHkKBtTsr5NFe0jKlg2G8taL6mHUxKJDiHqdpTkRFvgTerCFFThj5g9QZ8EwMGz+P1i7KFEpCufWchspCeEtNx5krrpM5UlNC/oZXiPm8IsUxdMeWCHOigzrt5LoEKpS20k55KfByXoixZ7XIpGJs7Jsst4X4X1VgpKdJqzdk7B6zc5HESLVJ2rdcdBjYcN+894HCb+o7M8fwkbl//v51yBeTXr67ecEe17qi4jDHUkwvIEKDSkGeQbpOnLs2DSZcvFg4gH9zBvLOUfeLDG/Hsebhg8Xm7zuxU5zwkjLM8V06MvHUizaD1Da2Tksz0tjnJ7hgFhejiP9z50mAAxhtXPJ/W383DSKqxTLqmlD+tqbeL4/SOEQszms5/NhxAXU/teN2a9CAcx5I6/1s0x/DuNJ/6Yw7nvzV1ibIu1xwUD7kwCw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(36756003)(75432002)(52116002)(66556008)(786003)(6486002)(4326008)(6666004)(6512007)(316002)(8676002)(6916009)(4744005)(66946007)(66476007)(26005)(38350700002)(2906002)(86362001)(956004)(8936002)(38100700002)(54906003)(186003)(16526019)(83380400001)(5660300002)(2616005)(1076003)(6506007)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dJ1SpuZSoGLtr+A/FW12Y/SyWYd0mVTN2WtDfj55dSXyBEZSBUR5IK3cEecG?=
 =?us-ascii?Q?4eXGRavaeIP87+J9RW2qcUBi32cn5GzCHQZOwLu1mbXsnVqz5ecoZp+uvny+?=
 =?us-ascii?Q?bGs9PhAYWedGuB+Nc69of+Md8Is5hEblL2Q+RSxtFhh3IjFHhvlOaUbgJ8uY?=
 =?us-ascii?Q?rlpgloOCidxdU5Nw6wyRCrO7fd2qXMVu+fKdfO74pZZnYZkHIvu0lvTooCdc?=
 =?us-ascii?Q?Ciupn8fnICKd2XZByTbMPSAMtO6gi9xDAcna96gT5Lj7Y1k9uweaxub4wtqW?=
 =?us-ascii?Q?tdlCNxYkrKlKLUh6MCn8RXhV/8olIt/MZ/Fj60Og3ISxle5v4gEsK8v09+5T?=
 =?us-ascii?Q?WTLIk6OVdq7tGDp2fuOfF5mb1pGWaM91c+gqvfyNEKQGP4x7JtPTSOAHI8dB?=
 =?us-ascii?Q?LreFY9SK7yWThqlZ1IThb+lnhxRSCX1JD4HKyRGv+fCvNU5yU0Nmm/iWOEW5?=
 =?us-ascii?Q?bGe24Qx96z6Ba7QawPcqASARpCKtoemmeYaLGXOVKF3j8CHDBhCcLuHRXKit?=
 =?us-ascii?Q?vZkf6/KE3MOp8TWPLaD9ebO7Ymh+GMn8d9tg6mnXy7k6fUSWE8uH27qErQ+y?=
 =?us-ascii?Q?PGSThaj36EiNuP0rd83qiVdrYUQHBRK9PRpwPOLHSeglUb99eZvQZ7OWoVTe?=
 =?us-ascii?Q?mdXSldIHLOA+P+MxViETlQ30YwfBDCR+Aian6/dPE6hYcew6GpZozZJxpU9K?=
 =?us-ascii?Q?5/bKHamYMH7Wzuufa4dTZiJrQzKCV1acntNp86bLHZPKE31CP0mwy7p7uN9a?=
 =?us-ascii?Q?eB/msV6bLolkfLYYf3cUYqpwVf6sZDMJ3oNpFm1Gnd0oUtDn+ZfYQQoHIDoq?=
 =?us-ascii?Q?GHe6KysMboSe1egqxQAjQZbVOuvbOQRFA/2pRH04DHZKJBVYoAYI8OLfrfUa?=
 =?us-ascii?Q?lxi+2SVIAEpQVTP2uGdCb0vMHrHT5qErg0yR9Ta3dPMcO9Pm6GO1rQlOCr5E?=
 =?us-ascii?Q?NYnXaRicbGmwo9NxucFR/mgP0QrO5JoFWeUEQrM8bIHhFzjo9pYTPvKR+aPw?=
 =?us-ascii?Q?65IP0XcBq/00pVidJCTe+5m70ze4Bv0IiC9G5HXkfIi29fSe3kz/c655m8cl?=
 =?us-ascii?Q?5TnpBiBRTFLt/e6Bv3Syj7op1JCOlD+MVdtNECs4KovbQmyUGtI92chj5DDd?=
 =?us-ascii?Q?Ma1Ih4yZWxp8Sat3GZ7e/Ohvnt70BLkLJndoGSEquKG08dFim4W1CPDrTmqX?=
 =?us-ascii?Q?QZ73X1IJCBp2AIeUq9CNCLxY4n0cHDsMoW4HZLqHpRhIs5ajMB9cqJ/Jn/Yq?=
 =?us-ascii?Q?6GGBcNcmOVArYn/WBAFd+80/tVhRJFLHO69rO4dILbzPwuc00P47nyOrHsOq?=
 =?us-ascii?Q?2okIxSn1Ugt38D0p/Wg4FO+t?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a245b7a-09f5-4ca0-cbba-08d936c27c1e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:45:18.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok/tqTbQ5648x6nBE336IRIAEvx/FebcxV5aw5SrPB4AqgWpATsxrSIPqex0GoT9
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


