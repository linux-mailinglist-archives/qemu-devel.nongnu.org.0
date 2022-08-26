Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD55A229A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:07:57 +0200 (CEST)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUNf-0002Uv-JF
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oRUFr-0006YJ-CT
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:59:52 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:19681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oRUFo-0004tx-KU
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:59:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHQTNH5Ch/Tyuhd1aJIJ+BP5hcohglgC+PAu3V48xNXO5eK8mAsSd62W9wXnXRo7LUMwaQ8ee9ssVvDD3h0luUa9+p7QdKBBne4ntfnaDgp5uCJ7OrwrRu+bxS1re3VGjECZnJ5/D2pUN0W7NzZRgYjBeT6sh3pYmw/Q76PyU8WXdkF8vzpw3VmfUaknmh/Wo8ysUS+orTiCVdtCpTMecy42v6jGKEE/eWdwK1rTav432oGo07roYGLY/39VuG8H9x5S86nuB/oznGR3mGoZBQK8Rbpd1ntc6vymQwlSYMgd2P4Cr+XG07XL7CpFn404LevcoHjixS0qC54yqC7KBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nyW4LfYuR7E3vx/RGt6VHOWx58qbXLtxMa4u/bKpTk=;
 b=aSbWIcQb7PJoXWolLWreldlMqRWf5vxIwnsWNxISBsS8FCsOilaKhQVu3y6gZZRehj6WSTBmS38oTrYq6limS7F4kOIGdBsLEoug4r1/80SmFKrHZbF9D9k+2F9SwpiDm9REqBE7I2FUPAsi6f0o0i05rhAH8MWgp+plX15AVDMiWRZGy3G1HA/ZouO2vVvsQe8AM6PfreXK37JzMG3UBQXQgqDk7HfIiKtleaTRAXHEI+/VGK/yOk6l1g78n8vdw0tamj3ZL0wj3qnDsfLX25KSMvEfbUVUCDBkGnlEAx3YGf+YFwrXrxFezkxWuMNZSJ3Mz17wpxgR2WgZ9MrdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nyW4LfYuR7E3vx/RGt6VHOWx58qbXLtxMa4u/bKpTk=;
 b=qBA54c9DYat+CIN25mgy3KA+uHMFcKWJmWobXXcyqomo6dbesDLA+yxqNezu9ctj4sMMj7MK6qYFqPF+LMJ4qA6I31YXEmGheHzuOuWOxfQpXaYqSwEDgAtwwZSFYdqVHAkHYECizxOmOwe6ZpXy8NDdQNURHvTYDV0Yb6MM17I=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB6PR03MB2967.eurprd03.prod.outlook.com (2603:10a6:6:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 07:59:45 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 07:59:45 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: "thuth@redhat.com" <thuth@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>, "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "vince.delvecchio@mediatek.com"
 <vince.delvecchio@mediatek.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Djordje Todorovic <Djordje.Todorovic@syrmia.com>, 
 "mips32r2@gmail.com" <mips32r2@gmail.com>, Dragan Mladjenovic
 <Dragan.Mladjenovic@syrmia.com>
Subject: Re: [PATCH 15/20] disas/nanomips: Replace exception handling
Thread-Topic: [PATCH 15/20] disas/nanomips: Replace exception handling
Thread-Index: AQHYsHkKmvIFl0YjlkqKd1l5S3qLma3A4pNP
Date: Fri, 26 Aug 2022 07:59:45 +0000
Message-ID: <VE1PR03MB6045C0CAB431C69CD7AFB09CF8759@VE1PR03MB6045.eurprd03.prod.outlook.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-16-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-16-milica.lazarevic@syrmia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad94f212-ab44-4ccf-111e-08da8738f0ca
x-ms-traffictypediagnostic: DB6PR03MB2967:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CIvZAROZymIOrT7mPv7VLUHWCq1j5IlJDd2tz5TKon6J2iS2y1333MvoFiDAxynNNSF99XLNC3Wj5WcIHKJ6w3FQPhkwgtKrZmjKPL+DTVQ/Exuh7KR9hAIUxmsM17eeJTTQX7tQWt6y53HLXvIyhYg/N5zwDFLAxAhoxFuYYepwPXinxO/wtJY3+rVT2l7WhTkbLFaC7A0XBRT3+NRNpid5+oedwJq/kYGzC9qU85GVOFGA1VfpN80iVrKyXIPxODw7EO9Z7peQzh2ugKvn51kukeq8SpqkGsX9fx+bHFtMkF27xST/amP00HtELVnL4vdvv5PwFbngcbaLKRAQ1z/EFLbiv9TTRi3ZX2yHNPct+rML8npd7NsJ8ddwkC19PEmjOcRvRIfKE2PCeLAagO8qtNaMegoXO9091lymXu2BIBzyp9CiB398SrPbeCglUVMK+Npccj1QugsXtk228Ws5tDTWEwEmIFJwcfKYPHFQl1estNxGG2zLqya2ecn8++pxsNyJMeSlq4Pv9KBWf4gKkhv06iICB1zjVLX9ACw9DkBKHerLQiPE0z8V0ZGBUeWHMtI5ztMFl8I7VjvT0onpiDAzeUonsGhUUkoaZDFhdduo3r1qXMAIcoRSvR8Qm7+8v/niCRWJlf7H6cgA73S/WTV6z3giVl6liUDT7n2PC4oSIHeuV0r3b0lAXaa2jldtK7ptunzeZBkSM/bhpwCdgdZYkAotbeP/qc77O0yOga0vvnHOzCFGYgJR2EXOoqtiuo0zK1smb8YwYXr0kA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(376002)(396003)(346002)(136003)(6506007)(7696005)(107886003)(478600001)(9686003)(53546011)(41300700001)(71200400001)(83380400001)(26005)(66446008)(52536014)(8936002)(5660300002)(2906002)(55016003)(186003)(6916009)(54906003)(316002)(4326008)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(33656002)(19627405001)(122000001)(38100700002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cFzN5ImrxeCJx36ZKhvGdenSxvOKgQevs4wyBnH6+Eyt+FQmAadNmD5vS6Dj?=
 =?us-ascii?Q?OJJP7A9sZ1ITKPZ6PqqbhXswd8Ui+UXVwuUwhoiRMAsDIA6eDOTPnWJcgxbF?=
 =?us-ascii?Q?VBTuuGDP5DlA+YxuuhzG1r0VmpUKno09cULfJ9VK33MRk89OcfpGXrE386rA?=
 =?us-ascii?Q?+8daeghxpCcyfkH8leBU9C0coyM8o8wPZnHw6HRiCzHYmXh7EC39GKZugc7X?=
 =?us-ascii?Q?QCal4cs3vKuPKDur2tDQOktsqlunCtoPHcP0Y5B41LtXOUZm/QDvvEKYVKBX?=
 =?us-ascii?Q?JsUmXvZcJH5QrEiDgLcQRvMkMGDF1824ALDrc31gTxUUrQF8rxaxXgfpGjIj?=
 =?us-ascii?Q?h+a8dr5v8HkKn8iN/Szaf60uKRgHAJRCba1ftEsO8O+bgvKDB++fR7zb2hcx?=
 =?us-ascii?Q?b24pg7s3s9ZalH4n3UU/2Y6Y2syjZMM4DQ1cq1opAznSrxGAogkPrdrR9B5H?=
 =?us-ascii?Q?tkbvOBrW7iu9GpOYolrj2au4fpYd9jSxSg97tgCaX2IaqyqLMbbv4mSH8X+i?=
 =?us-ascii?Q?ea4+XK8I6skFP5WjjCAK/9BkcmvAtpWkSRXjAm88Em31mtSlo8EZ/FoGrreb?=
 =?us-ascii?Q?B1jZE54LQQ7dkswG/xTu3A5HGDzG6Il4RrcaQFRfUNwYGjEMniZ5IVOBwzjX?=
 =?us-ascii?Q?BP7e/J1/f+96LBWspfF1i4SbYziQAq31lKib4DO4w77bHHBwFbzaXeC1mA2x?=
 =?us-ascii?Q?Jke8bN9cnGad6wxNH+wNUIZ9WhZky8Rca3UIsNBNwcYKUpABpjWMArBiZUEb?=
 =?us-ascii?Q?DMJeW0xAG3vB4QOMvHGeOr7VPekzxc4katdn+zfOgIhBjZCalQLFD5eP2OSg?=
 =?us-ascii?Q?nMZzMB0IppWBjpmx43JwwxYgb0COpP91Q3cAowaT57BL7hhRz5QNMrfi+8+Q?=
 =?us-ascii?Q?7c4QeO6MskH2S/IiX7Sns9i2RKwZv54J1rXq6xAbewUTLPoCq+49EzOzPvb5?=
 =?us-ascii?Q?MF/b3/YDw2a/F5/Osdk1UHJxjsrNT/5xcr5LEluMhfGOwetdnBaW3QDqb11l?=
 =?us-ascii?Q?BMxy1eWvJEK8h/7otkohLg7QQ9EkuTgXrMlf9MochuaDaoC0sFS3ZETNKi3d?=
 =?us-ascii?Q?O6bqtwradZGjbDaz4OvYuN844Qyr85zHldkxL6qlR47MhFvC8kRtjoSyIKLf?=
 =?us-ascii?Q?qWkfLeR1oCQXOlS1+uOoxLPrLx9Di7CxuoxyZzaN6Z3ZkInU2Wy4w56NtZun?=
 =?us-ascii?Q?W3coFAB2EsqiWfxMUxKouD/wtxbnO5H8syoNmkewJnmNpFu4nenCSt7VsVr1?=
 =?us-ascii?Q?nhOUuJ9yVX2f079FnBlTcoRUWwl+k8zPoM7pwhViuaReXM/YUJHcY9zewQof?=
 =?us-ascii?Q?P/c7aHEbte0dTrTJRUhFHpQjaS9GVP0wOTP2sjN7Otjl/OiswuBpdY9Sx/d/?=
 =?us-ascii?Q?x/pMjxfmF7ZXd35llaYEA2iaexcr5TdOkQfUeG94IMJwDjGDicbClhGKris7?=
 =?us-ascii?Q?kc9ZHmVlt2uz5Rje4pU/R9sXHiihWGhcE+lKfjnaPgQke2ommLw42hNR3+Ue?=
 =?us-ascii?Q?16BBn4E8sCkeR54xrOjCPtArGa8wXfBewNxhvs8dqSQEq+Q0qeCzd48sG/Xe?=
 =?us-ascii?Q?WXGsIo6Azs88LhP2UNKgC7EJXPLrW/RQh2CpHdL0dTFE6gpWaYUgJ8nt/ppY?=
 =?us-ascii?Q?7w=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB6045C0CAB431C69CD7AFB09CF8759VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad94f212-ab44-4ccf-111e-08da8738f0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 07:59:45.3414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLUZ5CghLGHZWFe1mKPnSuk5/E0oEtfQAymulciRIymBdVeupgnM4AP44Y2JYkNcvimgZ9r9glI/ztRD1n4Zn859S25Q2NCKD77K9lz8ABE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2967
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--_000_VE1PR03MB6045C0CAB431C69CD7AFB09CF8759VE1PR03MB6045eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any comments on this patch?
________________________________
From: Milica Lazarevic
Sent: Monday, August 15, 2022 9:31 AM
To: thuth@redhat.com <thuth@redhat.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; cfontana@suse.de <cfonta=
na@suse.de>; berrange@redhat.com <berrange@redhat.com>; pbonzini@redhat.com=
 <pbonzini@redhat.com>; vince.delvecchio@mediatek.com <vince.delvecchio@med=
iatek.com>; richard.henderson@linaro.org <richard.henderson@linaro.org>; pe=
ter.maydell@linaro.org <peter.maydell@linaro.org>; Djordje Todorovic <Djord=
je.Todorovic@syrmia.com>; mips32r2@gmail.com <mips32r2@gmail.com>; Dragan M=
ladjenovic <Dragan.Mladjenovic@syrmia.com>; Milica Lazarevic <Milica.Lazare=
vic@Syrmia.com>
Subject: [PATCH 15/20] disas/nanomips: Replace exception handling

Since there's no support for exception handling in C, the try-catch
blocks have been deleted, and throw clauses are replaced. When a runtime
error happens, we're printing out the error message. Disassembling of
the current instruction interrupts. This behavior is achieved by adding
sigsetjmp() to discard further disassembling after the error message
prints and by adding the siglongjmp() function to imitate throwing an
error.The goal was to maintain the same output as it was.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 135 +++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 66 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 769368a984..a8cd878809 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -31,7 +31,6 @@
 #include "disas/dis-asm.h"

 #include <string.h>
-#include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>

@@ -90,6 +89,8 @@ struct Pool {

 static img_address           m_pc;
 static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
+static struct disassemble_info *disassm_info;
+static jmp_buf j_buf;

 static const char *img_format(const char *format, ...)
 {
@@ -133,10 +134,13 @@ static uint64 renumber_registers(uint64 index, uint64=
 *register_list,
         return register_list[index];
     }

-    throw std::runtime_error(img_format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list =3D %zu",
-                   index, register_list_size));
+    const char *err =3D img_format(
+                      "Invalid register mapping index %" PRIu64
+                      ", size of list =3D %zu",
+                      index, register_list_size);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }


@@ -513,8 +517,11 @@ static const char *GPR(uint64 reg)
         return gpr_reg[reg];
     }

-    throw std::runtime_error(img_format("Invalid GPR register index %" PRI=
u64,
-                                         reg));
+    const char *err =3D img_format("Invalid GPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }


@@ -548,8 +555,11 @@ static const char *FPR(uint64 reg)
         return fpr_reg[reg];
     }

-    throw std::runtime_error(img_format("Invalid FPR register index %" PRI=
u64,
-                                         reg));
+    const char *err =3D img_format("Invalid FPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }


@@ -563,8 +573,11 @@ static const char *AC(uint64 reg)
         return ac_reg[reg];
     }

-    throw std::runtime_error(img_format("Invalid AC register index %" PRIu=
64,
-                                         reg));
+    const char *err =3D img_format("Invalid AC register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }


@@ -628,67 +641,50 @@ static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
                        int table_size)
 {
-    try
-    {
-        for (int i =3D 0; i < table_size; i++) {
-            uint64 op_code =3D extract_op_code_value(data,
-                                 table[i].instructions_size);
-            if ((op_code & table[i].mask) =3D=3D table[i].value) {
-                /* possible match */
-                conditional_function cond =3D table[i].condition;
-                if ((cond =3D=3D 0) || (cond)(op_code)) {
-                    try
-                    {
-                        if (table[i].type =3D=3D pool) {
-                            return Disassemble(data, dis, type,
-                                               table[i].next_table,
-                                               table[i].next_table_size);
-                        } else if ((table[i].type =3D=3D instruction) ||
-                                   (table[i].type =3D=3D call_instruction)=
 ||
-                                   (table[i].type =3D=3D branch_instructio=
n) ||
-                                   (table[i].type =3D=3D return_instructio=
n)) {
-                            if ((table[i].attributes !=3D 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) =3D=3D 0) {
-                                /*
-                                 * failed due to instruction having
-                                 * an ASE attribute and the requested vers=
ion
-                                 * not having that attribute
-                                 */
-                                strcpy(dis, "ASE attribute mismatch");
-                                return -5;
-                            }
-                            disassembly_function dis_fn =3D table[i].disas=
sembly;
-                            if (dis_fn =3D=3D 0) {
-                                strcpy(dis,
-                                "disassembler failure - bad table entry");
-                                return -6;
-                            }
-                            type =3D table[i].type;
-                            const char *dis_str =3D dis_fn(op_code);
-                            strcpy(dis, dis_str);
-                            free((char *)dis_str);
-                            return table[i].instructions_size;
-                        } else {
-                            strcpy(dis, "reserved instruction");
-                            return -2;
-                        }
+    for (int i =3D 0; i < table_size; i++) {
+        uint64 op_code =3D extract_op_code_value(data,
+                             table[i].instructions_size);
+        if ((op_code & table[i].mask) =3D=3D table[i].value) {
+            /* possible match */
+            conditional_function cond =3D table[i].condition;
+            if ((cond =3D=3D 0) || (cond)(op_code)) {
+                if (table[i].type =3D=3D pool) {
+                    return Disassemble(data, dis, type,
+                                       table[i].next_table,
+                                       table[i].next_table_size);
+                } else if ((table[i].type =3D=3D instruction) ||
+                           (table[i].type =3D=3D call_instruction) ||
+                           (table[i].type =3D=3D branch_instruction) ||
+                           (table[i].type =3D=3D return_instruction)) {
+                    if ((table[i].attributes !=3D 0) &&
+                        (m_requested_instruction_categories &
+                         table[i].attributes) =3D=3D 0) {
+                        /*
+                         * failed due to instruction having
+                         * an ASE attribute and the requested version
+                         * not having that attribute
+                         */
+                        strcpy(dis, "ASE attribute mismatch");
+                        return -5;
                     }
-                    catch (std::runtime_error & e)
-                    {
-                        strcpy(dis, e.what());
-                        return -3;          /* runtime error */
+                    disassembly_function dis_fn =3D table[i].disassembly;
+                    if (dis_fn =3D=3D 0) {
+                        strcpy(dis,
+                        "disassembler failure - bad table entry");
+                        return -6;
                     }
+                    type =3D table[i].type;
+                    const char *dis_str =3D dis_fn(op_code);
+                    strcpy(dis, dis_str);
+                    free((char *)dis_str);
+                    return table[i].instructions_size;
+                } else {
+                    strcpy(dis, "reserved instruction");
+                    return -2;
                 }
             }
         }
     }
-    catch (std::exception & e)
-    {
-        strcpy(dis, e.what());
-        return -4;          /* runtime error */
-    }
-
     strcpy(dis, "failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
@@ -22817,6 +22813,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct dis=
assemble_info *info)
     info->insn_type =3D dis_nonbranch;
     info->target =3D 0;
     info->target2 =3D 0;
+    disassm_info =3D info;

     status =3D (*info->read_memory_func)(memaddr, buffer, 2, info);
     if (status !=3D 0) {
@@ -22866,6 +22863,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct di=
sassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }

+    /* Handle runtime errors. */
+    if (sigsetjmp(j_buf, 0) !=3D 0) {
+        info->insn_type =3D dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
     int length =3D nanomips_dis(buf, memaddr, insn1, insn2, insn3);

     /* FIXME: Should probably use a hash table on the major opcode here.  =
*/
--
2.25.1


--_000_VE1PR03MB6045C0CAB431C69CD7AFB09CF8759VE1PR03MB6045eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Any comments on this patch?<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Milica Lazarevic<br>
<b>Sent:</b> Monday, August 15, 2022 9:31 AM<br>
<b>To:</b> thuth@redhat.com &lt;thuth@redhat.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; cfontana@su=
se.de &lt;cfontana@suse.de&gt;; berrange@redhat.com &lt;berrange@redhat.com=
&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; vince.delvecchio@med=
iatek.com &lt;vince.delvecchio@mediatek.com&gt;; richard.henderson@linaro.o=
rg
 &lt;richard.henderson@linaro.org&gt;; peter.maydell@linaro.org &lt;peter.m=
aydell@linaro.org&gt;; Djordje Todorovic &lt;Djordje.Todorovic@syrmia.com&g=
t;; mips32r2@gmail.com &lt;mips32r2@gmail.com&gt;; Dragan Mladjenovic &lt;D=
ragan.Mladjenovic@syrmia.com&gt;; Milica Lazarevic &lt;Milica.Lazarevic@Syr=
mia.com&gt;<br>
<b>Subject:</b> [PATCH 15/20] disas/nanomips: Replace exception handling</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Since there's no support for exception handling in=
 C, the try-catch<br>
blocks have been deleted, and throw clauses are replaced. When a runtime<br=
>
error happens, we're printing out the error message. Disassembling of<br>
the current instruction interrupts. This behavior is achieved by adding<br>
sigsetjmp() to discard further disassembling after the error message<br>
prints and by adding the siglongjmp() function to imitate throwing an<br>
error.The goal was to maintain the same output as it was.<br>
<br>
Signed-off-by: Milica Lazarevic &lt;milica.lazarevic@syrmia.com&gt;<br>
---<br>
&nbsp;disas/nanomips.cpp | 135 +++++++++++++++++++++++---------------------=
-<br>
&nbsp;1 file changed, 69 insertions(+), 66 deletions(-)<br>
<br>
diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp<br>
index 769368a984..a8cd878809 100644<br>
--- a/disas/nanomips.cpp<br>
+++ b/disas/nanomips.cpp<br>
@@ -31,7 +31,6 @@<br>
&nbsp;#include &quot;disas/dis-asm.h&quot;<br>
&nbsp;<br>
&nbsp;#include &lt;string.h&gt;<br>
-#include &lt;stdexcept&gt;<br>
&nbsp;#include &lt;stdio.h&gt;<br>
&nbsp;#include &lt;stdarg.h&gt;<br>
&nbsp;<br>
@@ -90,6 +89,8 @@ struct Pool {<br>
&nbsp;<br>
&nbsp;static img_address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; m_pc;<br>
&nbsp;static TABLE_ATTRIBUTE_TYPE&nbsp;&nbsp; m_requested_instruction_categ=
ories;<br>
+static struct disassemble_info *disassm_info;<br>
+static jmp_buf j_buf;<br>
&nbsp;<br>
&nbsp;static const char *img_format(const char *format, ...)<br>
&nbsp;{<br>
@@ -133,10 +134,13 @@ static uint64 renumber_registers(uint64 index, uint64=
 *register_list,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return register_list[index=
];<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; throw std::runtime_error(img_format(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Invalid register mapping index %&q=
uot; PRIu64<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;, size of list =3D %zu&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index, register_list_size));<br>
+&nbsp;&nbsp;&nbsp; const char *err =3D img_format(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Invalid register=
 mapping index %&quot; PRIu64<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;, size of list =
=3D %zu&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index, register_list_s=
ize);<br>
+&nbsp;&nbsp;&nbsp; (*disassm_info-&gt;fprintf_func)(disassm_info-&gt;strea=
m, &quot;%s&quot;, err);<br>
+&nbsp;&nbsp;&nbsp; free((char *)err);<br>
+&nbsp;&nbsp;&nbsp; siglongjmp(j_buf, 1);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -513,8 +517,11 @@ static const char *GPR(uint64 reg)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gpr_reg[reg];<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; throw std::runtime_error(img_format(&quot;Invalid GPR r=
egister index %&quot; PRIu64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; reg));<br>
+&nbsp;&nbsp;&nbsp; const char *err =3D img_format(&quot;Invalid GPR regist=
er index %&quot; PRIu64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg);<br>
+&nbsp;&nbsp;&nbsp; (*disassm_info-&gt;fprintf_func)(disassm_info-&gt;strea=
m, &quot;%s&quot;, err);<br>
+&nbsp;&nbsp;&nbsp; free((char *)err);<br>
+&nbsp;&nbsp;&nbsp; siglongjmp(j_buf, 1);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -548,8 +555,11 @@ static const char *FPR(uint64 reg)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return fpr_reg[reg];<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; throw std::runtime_error(img_format(&quot;Invalid FPR r=
egister index %&quot; PRIu64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; reg));<br>
+&nbsp;&nbsp;&nbsp; const char *err =3D img_format(&quot;Invalid FPR regist=
er index %&quot; PRIu64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg);<br>
+&nbsp;&nbsp;&nbsp; (*disassm_info-&gt;fprintf_func)(disassm_info-&gt;strea=
m, &quot;%s&quot;, err);<br>
+&nbsp;&nbsp;&nbsp; free((char *)err);<br>
+&nbsp;&nbsp;&nbsp; siglongjmp(j_buf, 1);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -563,8 +573,11 @@ static const char *AC(uint64 reg)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ac_reg[reg];<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; throw std::runtime_error(img_format(&quot;Invalid AC re=
gister index %&quot; PRIu64,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; reg));<br>
+&nbsp;&nbsp;&nbsp; const char *err =3D img_format(&quot;Invalid AC registe=
r index %&quot; PRIu64,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg);<br>
+&nbsp;&nbsp;&nbsp; (*disassm_info-&gt;fprintf_func)(disassm_info-&gt;strea=
m, &quot;%s&quot;, err);<br>
+&nbsp;&nbsp;&nbsp; free((char *)err);<br>
+&nbsp;&nbsp;&nbsp; siglongjmp(j_buf, 1);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -628,67 +641,50 @@ static int Disassemble(const uint16 *data, char *dis,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TABLE_ENTRY=
_TYPE &amp; type, const Pool *table,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int table_s=
ize)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp; try<br>
-&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; table_=
size; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 =
op_code =3D extract_op_code_value(data,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table[i].instructions_size);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op=
_code &amp; table[i].mask) =3D=3D table[i].value) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* possible match */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; conditional_function cond =3D table[i].condition;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if ((cond =3D=3D 0) || (cond)(op_code)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table[=
i].type =3D=3D pool) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return Disassemble(data, dis, type,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table[i].next_table,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table[i].next_table_si=
ze);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if =
((table[i].type =3D=3D instruction) ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table[i].type =3D=
=3D call_instruction) ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table[i].type =3D=
=3D branch_instruction) ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table[i].type =3D=
=3D return_instruction)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if ((table[i].attributes !=3D 0) &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (m_requested_instruction_categories &=
amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table[i].attributes) =3D=3D 0) =
{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * failed due to instruction hav=
ing<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * an ASE attribute and the requ=
ested version<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * not having that attribute<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, &quot;ASE attribute misma=
tch&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -5;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; disassembly_function dis_fn =3D table[i].disassembly;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (dis_fn =3D=3D 0) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;disassembler failure - bad tabl=
e entry&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -6;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; type =3D table[i].type;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; const char *dis_str =3D dis_fn(op_code);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; strcpy(dis, dis_str);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; free((char *)dis_str);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return table[i].instructions_size;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; strcpy(dis, &quot;reserved instruction&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return -2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; table_size; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 op_code =3D extract_op_c=
ode_value(data,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; table[i].instructions_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op_code &amp; table[i].mas=
k) =3D=3D table[i].value) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* poss=
ible match */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conditi=
onal_function cond =3D table[i].condition;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((co=
nd =3D=3D 0) || (cond)(op_code)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (table[i].type =3D=3D pool) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return Disassemble(data, dis, type=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; table[i].next_table,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; table[i].next_table_size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else if ((table[i].type =3D=3D instruction) ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (table[i].type =3D=3D call_instruction) ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (table[i].type =3D=3D branch_instruction) ||<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; (table[i].type =3D=3D return_instruction)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((table[i].attributes !=3D 0) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (m_request=
ed_instruction_categories &amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tabl=
e[i].attributes) =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fa=
iled due to instruction having<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * an=
 ASE attribute and the requested version<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * no=
t having that attribute<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis=
, &quot;ASE attribute mismatch&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -5;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; catch (std::runtime_error &amp; e)=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis=
, e.what());<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -3;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* runtime error */<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disassembly_function dis_fn =3D ta=
ble[i].disassembly;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dis_fn =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;disa=
ssembler failure - bad table entry&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -6;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type =3D table[i].type;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *dis_str =3D dis_fn(op_=
code);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, dis_str);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free((char *)dis_str);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return table[i].instructions_size;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, &quot;reserved instruc=
tion&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp; catch (std::exception &amp; e)<br>
-&nbsp;&nbsp;&nbsp; {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, e.what());<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -4;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* runtime error */<br>
-&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, &quot;failed to disassemble&quot;);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; return -1;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* failed=
 to disassemble&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;}<br>
@@ -22817,6 +22813,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct dis=
assemble_info *info)<br>
&nbsp;&nbsp;&nbsp;&nbsp; info-&gt;insn_type =3D dis_nonbranch;<br>
&nbsp;&nbsp;&nbsp;&nbsp; info-&gt;target =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp; info-&gt;target2 =3D 0;<br>
+&nbsp;&nbsp;&nbsp; disassm_info =3D info;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; status =3D (*info-&gt;read_memory_func)(memaddr, b=
uffer, 2, info);<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (status !=3D 0) {<br>
@@ -22866,6 +22863,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct di=
sassemble_info *info)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*info-&gt;fprintf_func)(i=
nfo-&gt;stream, &quot;&nbsp;&nbsp;&nbsp;&nbsp; &quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp; /* Handle runtime errors. */<br>
+&nbsp;&nbsp;&nbsp; if (sigsetjmp(j_buf, 0) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info-&gt;insn_type =3D dis_noni=
nsn;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return insn3 ? 6 : insn2 ? 4 : =
2;<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; int length =3D nanomips_dis(buf, memaddr, insn1, i=
nsn2, insn3);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: Should probably use a hash table on the =
major opcode here.&nbsp; */<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR03MB6045C0CAB431C69CD7AFB09CF8759VE1PR03MB6045eurp_--

