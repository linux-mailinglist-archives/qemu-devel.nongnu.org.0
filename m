Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A55A229B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:08:32 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUOE-00031y-L0
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oRUFV-0006Mo-Am
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:59:29 -0400
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:14944 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oRUFM-0004sy-3u
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 03:59:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7P+upSa7raGkQCnJbVumy12NjtSqrRYTGHTKkRRaibB7P5VA+tTI6rmWWvOS84Y/ButJ38RJOjkj4HbWlbxvQqGPLO42jGUwhFSkSAIDjdeM7yE6UIqz8t9H64q3vB3f0pfPgmoBt4OPMPUvjO+p6mxz33it5UcKq/WEHtpK0Y28ccH2xB4pz8ErjzwGl55zt+b92S4UzREAumq/sA5aDTVXVxNBVjyiAtb41I0HA+SiCaoLeXTYnw9u8X0M0vzh9tl31EA/D/vB0V/9IkxMmgsChSmiXy4CAKmgiuFftYfIh/8YDEZaQcwPGLoQmF1ZrJLbGfJapcAX17TidzqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcJMoIV5XRHEXk3QEDTijnR04QVp8MMUVh3GIc0xxvU=;
 b=QSfb/josUcE3NpBJH93YXfm2/i7fd51K+ppKvVp3L+mrzqwBaa6Umj3y1IBuzQR0CUMcrAtHk0JJnQMwAs7ytB9HT8tGGWVDsn6k7fzHaI1eKkRJQ68OaQFBJ3uRFiBtwvlEE4xaw4V6ePeUipoYoEiXtGaE+jwSPLVPlJCCxcN9JuGJ0s+43huw2le4Ph4HqgbZNkfm/HKOQfRiZesUYzEVLeWOtb3ScIzf+ET4OJPszWdHibk/UvsKvAGMjhnWlA8aQw9UmEqQvsctdxMu/YWpEj8uz2O/U3I5QOce1mAy39fwl2eIUvu4Fg9lmfM5DeqQaehfxnUB2/6g6bHx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcJMoIV5XRHEXk3QEDTijnR04QVp8MMUVh3GIc0xxvU=;
 b=pmGKsAhkiBJmN29VGMeskbbjxYzgSJdFUjYujth9IA69CGiS3z7h3g+GEDWPFvLvr9KlW8Fll5ssR4vPpwt+cEUJpXSk+fsuP8IBJuifZ6VoGUbcR5XJwEDKTZfGIBxtCR77VOZNMCkQaRFtPstj6Sfh7xobqCGUryqCHaQwBaI=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB6PR03MB2967.eurprd03.prod.outlook.com (2603:10a6:6:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 07:59:12 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 07:59:12 +0000
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
Subject: Re: [PATCH 13/20] disas/nanomips: Add free() calls
Thread-Topic: [PATCH 13/20] disas/nanomips: Add free() calls
Thread-Index: AQHYsHjubFx960CuE0eaaquCTlm9tq3A4miR
Date: Fri, 26 Aug 2022 07:59:12 +0000
Message-ID: <VE1PR03MB6045A14C1F14283954736B04F8759@VE1PR03MB6045.eurprd03.prod.outlook.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-14-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-14-milica.lazarevic@syrmia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4febc8f6-b1b2-4dc2-fb9e-08da8738dd5c
x-ms-traffictypediagnostic: DB6PR03MB2967:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9AwN6bUrZFF7wJW9AiLJHgnwInfzUq+yN0RzHg1zjRKyXlOFkfXNjFvpY85kCk6kwN9Lm1hC4c8/yyMjkQbQT7XvEcWsUSf63nfs9c8msg5pjHTzeyv3FBdBkesQvTAhN+1EFQLYq1fLUFikXrVBKk/uuAZ2TJ7aLDcecD76WqBhnDp43NXTffr7PqsM5n4YHpnvstQSYy2Yl0ilR9nkQjD5CRkvDYN6OGx21tS4P9Le7Q9FVjlU6PkkJ0kjZ6bLwLo6bpkIQDI3R3Ot6fgR939tzbSeWostAAGSP0SceRVhAmiIQGy3fYQqwrOwelnotA5bzFNV7U87Q1e1ulziaK+KoTPLmCPWdHrZ2MGwsSRUB0ENC7Dc5W90Kka5wqwAkT05jqu2SudV7XmGsw8+tW4ddnQ8leO2arUVI0H9zKjxlRN2P7dMC0MKLhpZoZiB6BUdqccjWYQPSfXAYc390901a0PBCYF2RAYb3W/uDSM1n6tx8Fit2AKOy5LDgpkyngXD9s8WHdGllVphHuHsj9uQPoMMWHmJY4jI7VE90FS08t24YwlFL7axAY9/3ZMo9h33SE1m3yzxjCuMSB97S+SbAOyE6L15jxcVfmDcfk8nvx4csU5PpNU/FvvumpDeBvABz8cJYjhD5R4yFy+e3xZi7IzYoEAnkUzyrPDfNDfSNHIRGrftMMReJFiSw+25OmjxNpaggwd0+Q396+365Ba2qghvNoiAKJCEFBZyBQYzkiDn/EtJyWRMnMNkbF/CTfG3ADxgaxTqxj8uvdOEzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(376002)(396003)(346002)(136003)(6506007)(7696005)(107886003)(478600001)(9686003)(53546011)(41300700001)(71200400001)(83380400001)(26005)(66446008)(52536014)(8936002)(30864003)(5660300002)(2906002)(55016003)(186003)(6916009)(54906003)(316002)(4326008)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(33656002)(19627405001)(122000001)(38100700002)(86362001)(38070700005)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FMJOuDT4iaTxxgVJyT+J8OaEKoR0Y0kyYgIgvGzw8mkzu+aOxZB1aMMQSLJB?=
 =?us-ascii?Q?f4xqfcI4hs3vnhN9l3OgkJlZXqjD8fnYlk97Jq48byFwwoJJVnJXAR2IdgPL?=
 =?us-ascii?Q?BeVuWcWSWK+YWw4tq6ea8wSmbLr38C07x1HaBqGTAWTCfmj5XY320IK6Naet?=
 =?us-ascii?Q?cA+2T2aan/u7Znmn1ijH5yt7DltxLL99cbTmTM5C2irqxHvMfBY8VPQfr5mv?=
 =?us-ascii?Q?h+0CatY52I4xFXgsC0YBkuw5cyrqJdFdXbkAfJ3CLXuQ/85HZyqZ+aiUzYKe?=
 =?us-ascii?Q?CMjoJ8MIjLnGyf8ZRZKGDxqZqftClSI9cwWXNH/VKSScozbpQz1HXPY9r7Rr?=
 =?us-ascii?Q?DvcoOzm/2GPT/v7pIi5W5sVghUQICsg+y5ttw6d+t2/08dplzaOOtlfcpBim?=
 =?us-ascii?Q?bnGbZyROs2ZejdWaviSyIsl9HmKERBvPVJFLcqSm8oy4dx1Zww4FvSzPPl2q?=
 =?us-ascii?Q?b1Y73RCELo/OjNza5GhH/zqfT4uhBpS4b2jLQyPFvRk/UKJ+33G2Y+AHSRQg?=
 =?us-ascii?Q?LQ/YTa/7A+V0Q2qkyCjknBcXCUwQVORIpAtDRvuEOGdT5hnAxpIwl2/7OA16?=
 =?us-ascii?Q?12xDJVwiF3gvl4QuxIJPrzA8UYrTZglgzyh67uDSKljyYb1+uhFKH6V108FX?=
 =?us-ascii?Q?cFLt+5cgdC6u0oihfaAgQ36zsHEmnLC7LvoLnRde8dv//paXGO8dchXbqXmE?=
 =?us-ascii?Q?US1VChcsMet4p7iSFfo/565mmU7YH16LXAS0fMbTSWZ9+EAB3WUogm3ZF9IL?=
 =?us-ascii?Q?+pCRm9WlhJMHWbZXWfMvLL/VaGNkl2UuyhQKIhXKKZl87w+REyvL+Ejkl7Cp?=
 =?us-ascii?Q?Dz3oT2y8S+KLzqFSD7V7+AG2n3GDEd12RahqG9T+kkz1xU6ZN/S8qlTTsgM+?=
 =?us-ascii?Q?jbEyUpBSRMVxfcq9+KFKe5ONTKFRv8TACn9WZJ1KTe3gW0i2tolf5N1Zpteo?=
 =?us-ascii?Q?FAEdsVEVya/MIpkYQYIFx6HL6pyksQVaJC2XLCIlNGe1ya8MLg2yF/Ry06vi?=
 =?us-ascii?Q?uGyw2O6Oj0eQhQt4X86K+4Qzw6ALuPRDcV/5JwrR2+Na03H/1Ba8vLVIfJjB?=
 =?us-ascii?Q?r5TDH8yY67bpztWJCuW11pi6I+K9nC5n1w7PIEHsl9qZ5Q9ePE8r7ZSRYkGA?=
 =?us-ascii?Q?iUv0sW5viwuWjj/3KJW/rImcjwf8n2e/9hwpaIdyndS55CKg4HzklQQfbjP9?=
 =?us-ascii?Q?hHpeDTZr3j+cQeoklsLBUF56Z8OQoQC/6RMgPTjrgJgX6p6fhooGKqdVYyNR?=
 =?us-ascii?Q?rzhAGlSEJjoC0uBVKw0Qyt/cgqS1yr0Bc/O0LXAzrhgMMumk0l/+wTBUsisB?=
 =?us-ascii?Q?dWyhYz3Njh0HPxnbANQipr+bzCIPdwZXJ0iQuSWEf5lnGlJP4udvv+9vZV5I?=
 =?us-ascii?Q?xqIPoWZru6wV0urbRxwUGPNHLFL1CH7J6NvO+x3koCPG/A2bDb+KvAnX1AeU?=
 =?us-ascii?Q?VlP0W+TCFzdppsTzzAuZ4iXryFAZsHMjtyHXaw7agmr4tMhErdGQkHAR4W70?=
 =?us-ascii?Q?EiK11R5jTwRUmEojmOEXgE9zBiAlaQVkaY0V8A2VkgkChK6khPt0RBpiYSt8?=
 =?us-ascii?Q?DdzHmSNDRe3OOFWfDSncNNbAijWEcBmlXoCbdmh02SVjDQ4vlKBGg9He9DSY?=
 =?us-ascii?Q?fw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB6045A14C1F14283954736B04F8759VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4febc8f6-b1b2-4dc2-fb9e-08da8738dd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 07:59:12.7498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4op1Mjp7ODvMiVJcY6XaQNIi6DmJIh91IfJR9MtrLkeAqDh1e02B8a6BnifAEtomqyzMs2opsBf7Nxl85qfHktzs8TBrCKX/vOOiI0TTxV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2967
Received-SPF: pass client-ip=40.107.21.106;
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

--_000_VE1PR03MB6045A14C1F14283954736B04F8759VE1PR03MB6045eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any comments on this patch?
________________________________
From: Milica Lazarevic
Sent: Monday, August 15, 2022 9:30 AM
To: thuth@redhat.com <thuth@redhat.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; cfontana@suse.de <cfonta=
na@suse.de>; berrange@redhat.com <berrange@redhat.com>; pbonzini@redhat.com=
 <pbonzini@redhat.com>; vince.delvecchio@mediatek.com <vince.delvecchio@med=
iatek.com>; richard.henderson@linaro.org <richard.henderson@linaro.org>; pe=
ter.maydell@linaro.org <peter.maydell@linaro.org>; Djordje Todorovic <Djord=
je.Todorovic@syrmia.com>; mips32r2@gmail.com <mips32r2@gmail.com>; Dragan M=
ladjenovic <Dragan.Mladjenovic@syrmia.com>; Milica Lazarevic <Milica.Lazare=
vic@Syrmia.com>
Subject: [PATCH 13/20] disas/nanomips: Add free() calls

The free() function is called for every string allocated using the
strdup() function to prevent memory leaking.

The implementation of the several functions working with dynamically
allocated strings is slightly changed so we can free those strings.

Almost every disassembly_function returns the result of the img_format()
function, which returns a dynamically allocated string. To be able to
free that string for every disassembly_function, a strdup() call is
added for returning value of some disassembly functions like TLBGINV,
TLBGINVF, TLBGP, etc.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 1117 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 841 insertions(+), 276 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 561e4ff095..551bcb3164 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -526,7 +526,9 @@ static const char *save_restore_list(uint64 rt, uint64 =
count, uint64 gp)
     for (uint64 counter =3D 0; counter !=3D count; counter++) {
         bool use_gp =3D gp && (counter =3D=3D count - 1);
         uint64 this_rt =3D use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & =
0x1f;
-        strcat(str, img_format(",%s", GPR(this_rt)));
+        const char *dis_str =3D img_format(",%s", GPR(this_rt));
+        strcat(str, dis_str);
+        free((char *)dis_str);
     }

     return strdup(str);
@@ -663,7 +665,9 @@ static int Disassemble(const uint16 *data, char *dis,
                                 return -6;
                             }
                             type =3D table[i].type;
-                            strcpy(dis, dis_fn(op_code));
+                            const char *dis_str =3D dis_fn(op_code);
+                            strcpy(dis, dis_str);
+                            free((char *)dis_str);
                             return table[i].instructions_size;
                         } else {
                             strcpy(dis, "reserved instruction");
@@ -1737,7 +1741,10 @@ static const char *ACLR(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("ACLR %s, %s(%s)", bit, s, rs);
+    const char *ret =3D img_format("ACLR %s, %s(%s)", bit, s, rs);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }


@@ -1833,7 +1840,9 @@ static const char *ADDIU_32_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("ADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -1853,8 +1862,9 @@ static const char *ADDIU_48_(uint64 instruction)

     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));
-
-    return img_format("ADDIU %s, %s", rt, s);
+    const char *ret =3D img_format("ADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -1874,8 +1884,9 @@ static const char *ADDIU_GP48_(uint64 instruction)

     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));
-
-    return img_format("ADDIU %s, $%d, %s", rt, 28, s);
+    const char *ret =3D img_format("ADDIU %s, $%d, %s", rt, 28, s);
+    free((char *)s);
+    return ret;
 }


@@ -1896,7 +1907,9 @@ static const char *ADDIU_GP_B_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    const char *ret =3D img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    free((char *)u);
+    return ret;
 }


@@ -1917,7 +1930,9 @@ static const char *ADDIU_GP_W_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    const char *ret =3D img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    free((char *)u);
+    return ret;
 }


@@ -1940,7 +1955,9 @@ static const char *ADDIU_NEG_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(neg_copy(u_value));

-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("ADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -1961,7 +1978,9 @@ static const char *ADDIU_R1_SP_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
+    const char *ret =3D img_format("ADDIU %s, $%d, %s", rt3, 29, u);
+    free((char *)u);
+    return ret;
 }


@@ -1984,7 +2003,9 @@ static const char *ADDIU_R2_(uint64 instruction)
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
+    const char *ret =3D img_format("ADDIU %s, %s, %s", rt3, rs3, u);
+    free((char *)u);
+    return ret;
 }


@@ -2004,7 +2025,9 @@ static const char *ADDIU_RS5_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));

-    return img_format("ADDIU %s, %s", rt, s);
+    const char *ret =3D img_format("ADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -2026,7 +2049,9 @@ static const char *ADDIUPC_32_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("ADDIUPC %s, %s", rt, s);
+    const char *ret =3D img_format("ADDIUPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -2048,7 +2073,9 @@ static const char *ADDIUPC_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 6);

-    return img_format("ADDIUPC %s, %s", rt, s);
+    const char *ret =3D img_format("ADDIUPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -2506,7 +2533,9 @@ static const char *ALUIPC(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    const char *ret =3D img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -2574,7 +2603,9 @@ static const char *ANDI_16_(uint64 instruction)
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));
     const char *eu =3D IMMEDIATE(encode_eu_from_u_andi16(eu_value));

-    return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
+    const char *ret =3D img_format("ANDI %s, %s, %s", rt3, rs3, eu);
+    free((char *)eu);
+    return ret;
 }


@@ -2598,7 +2629,9 @@ static const char *ANDI_32_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ANDI %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("ANDI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -2622,7 +2655,9 @@ static const char *APPEND(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("APPEND %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("APPEND %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -2646,7 +2681,10 @@ static const char *ASET(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("ASET %s, %s(%s)", bit, s, rs);
+    const char *ret =3D img_format("ASET %s, %s(%s)", bit, s, rs);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }


@@ -2666,7 +2704,9 @@ static const char *BALC_16_(uint64 instruction)

     const char *s =3D ADDRESS(encode_s_from_address(s_value), 2);

-    return img_format("BALC %s", s);
+    const char *ret =3D img_format("BALC %s", s);
+    free((char *)s);
+    return ret;
 }


@@ -2686,7 +2726,9 @@ static const char *BALC_32_(uint64 instruction)

     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BALC %s", s);
+    const char *ret =3D img_format("BALC %s", s);
+    free((char *)s);
+    return ret;
 }


@@ -2732,7 +2774,10 @@ static const char *BBEQZC(uint64 instruction)
     const char *bit =3D IMMEDIATE(copy(bit_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BBEQZC %s, %s, %s", rt, bit, s);
+    const char *ret =3D img_format("BBEQZC %s, %s, %s", rt, bit, s);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }


@@ -2756,7 +2801,10 @@ static const char *BBNEZC(uint64 instruction)
     const char *bit =3D IMMEDIATE(copy(bit_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BBNEZC %s, %s, %s", rt, bit, s);
+    const char *ret =3D img_format("BBNEZC %s, %s, %s", rt, bit, s);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }


@@ -2776,7 +2824,9 @@ static const char *BC_16_(uint64 instruction)

     const char *s =3D ADDRESS(encode_s_from_address(s_value), 2);

-    return img_format("BC %s", s);
+    const char *ret =3D img_format("BC %s", s);
+    free((char *)s);
+    return ret;
 }


@@ -2796,7 +2846,9 @@ static const char *BC_32_(uint64 instruction)

     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BC %s", s);
+    const char *ret =3D img_format("BC %s", s);
+    free((char *)s);
+    return ret;
 }


@@ -2818,7 +2870,9 @@ static const char *BC1EQZC(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BC1EQZC %s, %s", ft, s);
+    const char *ret =3D img_format("BC1EQZC %s, %s", ft, s);
+    free((char *)s);
+    return ret;
 }


@@ -2840,7 +2894,9 @@ static const char *BC1NEZC(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BC1NEZC %s, %s", ft, s);
+    const char *ret =3D img_format("BC1NEZC %s, %s", ft, s);
+    free((char *)s);
+    return ret;
 }


@@ -2862,7 +2918,9 @@ static const char *BC2EQZC(uint64 instruction)
     const char *ct =3D CPR(copy(ct_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BC2EQZC %s, %s", ct, s);
+    const char *ret =3D img_format("BC2EQZC %s, %s", ct, s);
+    free((char *)s);
+    return ret;
 }


@@ -2884,7 +2942,9 @@ static const char *BC2NEZC(uint64 instruction)
     const char *ct =3D CPR(copy(ct_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BC2NEZC %s, %s", ct, s);
+    const char *ret =3D img_format("BC2NEZC %s, %s", ct, s);
+    free((char *)s);
+    return ret;
 }


@@ -2908,7 +2968,9 @@ static const char *BEQC_16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *u =3D ADDRESS(encode_u_from_address(u_value), 2);

-    return img_format("BEQC %s, %s, %s", rs3, rt3, u);
+    const char *ret =3D img_format("BEQC %s, %s, %s", rs3, rt3, u);
+    free((char *)u);
+    return ret;
 }


@@ -2932,7 +2994,9 @@ static const char *BEQC_32_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BEQC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BEQC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -2956,7 +3020,10 @@ static const char *BEQIC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BEQIC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BEQIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -2978,7 +3045,9 @@ static const char *BEQZC_16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 2);

-    return img_format("BEQZC %s, %s", rt3, s);
+    const char *ret =3D img_format("BEQZC %s, %s", rt3, s);
+    free((char *)s);
+    return ret;
 }


@@ -3002,7 +3071,9 @@ static const char *BGEC(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BGEC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BGEC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -3026,7 +3097,10 @@ static const char *BGEIC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BGEIC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BGEIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -3050,7 +3124,10 @@ static const char *BGEIUC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BGEIUC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BGEIUC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -3074,7 +3151,9 @@ static const char *BGEUC(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BGEUC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BGEUC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -3098,7 +3177,9 @@ static const char *BLTC(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BLTC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BLTC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -3122,7 +3203,10 @@ static const char *BLTIC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BLTIC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BLTIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -3146,7 +3230,10 @@ static const char *BLTIUC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BLTIUC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BLTIUC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -3170,7 +3257,9 @@ static const char *BLTUC(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BLTUC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BLTUC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -3194,7 +3283,9 @@ static const char *BNEC_16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *u =3D ADDRESS(encode_u_from_address(u_value), 2);

-    return img_format("BNEC %s, %s, %s", rs3, rt3, u);
+    const char *ret =3D img_format("BNEC %s, %s, %s", rs3, rt3, u);
+    free((char *)u);
+    return ret;
 }


@@ -3218,7 +3309,9 @@ static const char *BNEC_32_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BNEC %s, %s, %s", rs, rt, s);
+    const char *ret =3D img_format("BNEC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -3242,7 +3335,10 @@ static const char *BNEIC(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BNEIC %s, %s, %s", rt, u, s);
+    const char *ret =3D img_format("BNEIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }


@@ -3264,7 +3360,9 @@ static const char *BNEZC_16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 2);

-    return img_format("BNEZC %s, %s", rt3, s);
+    const char *ret =3D img_format("BNEZC %s, %s", rt3, s);
+    free((char *)s);
+    return ret;
 }


@@ -3284,7 +3382,9 @@ static const char *BPOSGE32C(uint64 instruction)

     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("BPOSGE32C %s", s);
+    const char *ret =3D img_format("BPOSGE32C %s", s);
+    free((char *)s);
+    return ret;
 }


@@ -3304,7 +3404,9 @@ static const char *BREAK_16_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("BREAK %s", code);
+    const char *ret =3D img_format("BREAK %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -3324,7 +3426,9 @@ static const char *BREAK_32_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("BREAK %s", code);
+    const char *ret =3D img_format("BREAK %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -3368,7 +3472,10 @@ static const char *CACHE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("CACHE %s, %s(%s)", op, s, rs);
+    const char *ret =3D img_format("CACHE %s, %s(%s)", op, s, rs);
+    free((char *)op);
+    free((char *)s);
+    return ret;
 }


@@ -3392,7 +3499,10 @@ static const char *CACHEE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("CACHEE %s, %s(%s)", op, s, rs);
+    const char *ret =3D img_format("CACHEE %s, %s(%s)", op, s, rs);
+    free((char *)op);
+    free((char *)s);
+    return ret;
 }


@@ -4967,7 +5077,9 @@ static const char *COP2_1(uint64 instruction)

     const char *cofun =3D IMMEDIATE(copy(cofun_value));

-    return img_format("COP2_1 %s", cofun);
+    const char *ret =3D img_format("COP2_1 %s", cofun);
+    free((char *)cofun);
+    return ret;
 }


@@ -5297,7 +5409,9 @@ static const char *DADDIU_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));

-    return img_format("DADDIU %s, %s", rt, s);
+    const char *ret =3D img_format("DADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -5321,7 +5435,9 @@ static const char *DADDIU_NEG_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(neg_copy(u_value));

-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("DADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -5345,7 +5461,9 @@ static const char *DADDIU_U12_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("DADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -5503,7 +5621,7 @@ static const char *DERET(uint64 instruction)
 {
     (void)instruction;

-    return "DERET ";
+    return strdup("DERET ");
 }


@@ -5529,7 +5647,10 @@ static const char *DEXTM(uint64 instruction)
     const char *lsb =3D IMMEDIATE(copy(lsb_value));
     const char *msbd =3D IMMEDIATE(encode_msbd_from_size(msbd_value));

-    return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret =3D img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, ms=
bd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }


@@ -5555,7 +5676,10 @@ static const char *DEXT(uint64 instruction)
     const char *lsb =3D IMMEDIATE(copy(lsb_value));
     const char *msbd =3D IMMEDIATE(encode_msbd_from_size(msbd_value));

-    return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret =3D img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msb=
d);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }


@@ -5581,7 +5705,10 @@ static const char *DEXTU(uint64 instruction)
     const char *lsb =3D IMMEDIATE(copy(lsb_value));
     const char *msbd =3D IMMEDIATE(encode_msbd_from_size(msbd_value));

-    return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret =3D img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, ms=
bd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }


@@ -5608,8 +5735,11 @@ static const char *DINSM(uint64 instruction)
     const char *size =3D IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value=
));
     /* !!!!!!!!!! - no conversion function */

-    return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret =3D img_format("DINSM %s, %s, %s, %s", rt, rs, pos, si=
ze);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }


@@ -5636,8 +5766,11 @@ static const char *DINS(uint64 instruction)
     const char *size =3D IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value=
));
     /* !!!!!!!!!! - no conversion function */

-    return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret =3D img_format("DINS %s, %s, %s, %s", rt, rs, pos, siz=
e);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }


@@ -5664,8 +5797,11 @@ static const char *DINSU(uint64 instruction)
     const char *size =3D IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value=
));
     /* !!!!!!!!!! - no conversion function */

-    return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret =3D img_format("DINSU %s, %s, %s, %s", rt, rs, pos, si=
ze);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }


@@ -5807,7 +5943,9 @@ static const char *DLSA(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u2 =3D IMMEDIATE(copy(u2_value));

-    return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    const char *ret =3D img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    free((char *)u2);
+    return ret;
 }


@@ -5829,7 +5967,9 @@ static const char *DLUI_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("DLUI %s, %s", rt, u);
+    const char *ret =3D img_format("DLUI %s, %s", rt, u);
+    free((char *)u);
+    return ret;
 }


@@ -5853,7 +5993,9 @@ static const char *DMFC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }


@@ -5921,7 +6063,9 @@ static const char *DMFGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }


@@ -5993,7 +6137,9 @@ static const char *DMTC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }


@@ -6061,7 +6207,9 @@ static const char *DMTGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }


@@ -6586,7 +6734,9 @@ static const char *DROTR(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DROTR %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DROTR %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6610,7 +6760,9 @@ static const char *DROTR32(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DROTR32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6660,7 +6812,10 @@ static const char *DROTX(uint64 instruction)
     const char *shift =3D IMMEDIATE(copy(shift_value));
     const char *shiftx =3D IMMEDIATE(copy(shiftx_value));

-    return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    const char *ret =3D img_format("DROTX %s, %s, %s, %s", rt, rs, shift, =
shiftx);
+    free((char *)shift);
+    free((char *)shiftx);
+    return ret;
 }


@@ -6684,7 +6839,9 @@ static const char *DSLL(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSLL %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSLL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6708,7 +6865,9 @@ static const char *DSLL32(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSLL32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6756,7 +6915,9 @@ static const char *DSRA(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSRA %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSRA %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6780,7 +6941,9 @@ static const char *DSRA32(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSRA32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6828,7 +6991,9 @@ static const char *DSRL(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSRL %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSRL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6852,7 +7017,9 @@ static const char *DSRL32(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("DSRL32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -6982,7 +7149,7 @@ static const char *EHB(uint64 instruction)
 {
     (void)instruction;

-    return "EHB ";
+    return strdup("EHB ");
 }


@@ -7040,7 +7207,7 @@ static const char *ERET(uint64 instruction)
 {
     (void)instruction;

-    return "ERET ";
+    return strdup("ERET ");
 }


@@ -7058,7 +7225,7 @@ static const char *ERETNC(uint64 instruction)
 {
     (void)instruction;

-    return "ERETNC ";
+    return strdup("ERETNC ");
 }


@@ -7124,7 +7291,10 @@ static const char *EXT(uint64 instruction)
     const char *lsb =3D IMMEDIATE(copy(lsb_value));
     const char *msbd =3D IMMEDIATE(encode_msbd_from_size(msbd_value));

-    return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret =3D img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd=
);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }


@@ -7150,7 +7320,9 @@ static const char *EXTD(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret =3D img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shif=
t);
+    free((char *)shift);
+    return ret;
 }


@@ -7176,7 +7348,9 @@ static const char *EXTD32(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret =3D img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, sh=
ift);
+    free((char *)shift);
+    return ret;
 }


@@ -7200,7 +7374,9 @@ static const char *EXTPDP(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *size =3D IMMEDIATE(copy(size_value));

-    return img_format("EXTPDP %s, %s, %s", rt, ac, size);
+    const char *ret =3D img_format("EXTPDP %s, %s, %s", rt, ac, size);
+    free((char *)size);
+    return ret;
 }


@@ -7248,7 +7424,9 @@ static const char *EXTP(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *size =3D IMMEDIATE(copy(size_value));

-    return img_format("EXTP %s, %s, %s", rt, ac, size);
+    const char *ret =3D img_format("EXTP %s, %s, %s", rt, ac, size);
+    free((char *)size);
+    return ret;
 }


@@ -7297,7 +7475,9 @@ static const char *EXTR_RS_W(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    const char *ret =3D img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -7322,7 +7502,9 @@ static const char *EXTR_R_W(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    const char *ret =3D img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -7347,7 +7529,9 @@ static const char *EXTR_S_H(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    const char *ret =3D img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -7372,7 +7556,9 @@ static const char *EXTR_W(uint64 instruction)
     const char *ac =3D AC(copy(ac_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
+    const char *ret =3D img_format("EXTR.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -7499,7 +7685,9 @@ static const char *EXTW(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret =3D img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shif=
t);
+    free((char *)shift);
+    return ret;
 }


@@ -7631,7 +7819,9 @@ static const char *HYPCALL(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("HYPCALL %s", code);
+    const char *ret =3D img_format("HYPCALL %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -7651,7 +7841,9 @@ static const char *HYPCALL_16_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("HYPCALL %s", code);
+    const char *ret =3D img_format("HYPCALL %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -7678,8 +7870,11 @@ static const char *INS(uint64 instruction)
     const char *size =3D IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value=
));
     /* !!!!!!!!!! - no conversion function */

-    return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret =3D img_format("INS %s, %s, %s, %s", rt, rs, pos, size=
);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }


@@ -7718,7 +7913,7 @@ static const char *IRET(uint64 instruction)
 {
     (void)instruction;

-    return "IRET ";
+    return strdup("IRET ");
 }


@@ -7826,7 +8021,9 @@ static const char *LB_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("LB %s, %s(%s)", rt3, u, rs3);
+    const char *ret =3D img_format("LB %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -7848,7 +8045,9 @@ static const char *LB_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LB %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LB %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -7872,7 +8071,9 @@ static const char *LB_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LB %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LB %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -7896,7 +8097,9 @@ static const char *LB_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LB %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LB %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -7920,7 +8123,9 @@ static const char *LBE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LBE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LBE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -7944,7 +8149,9 @@ static const char *LBU_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("LBU %s, %s(%s)", rt3, u, rs3);
+    const char *ret =3D img_format("LBU %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -7966,7 +8173,9 @@ static const char *LBU_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LBU %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LBU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -7990,7 +8199,9 @@ static const char *LBU_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LBU %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LBU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8014,7 +8225,9 @@ static const char *LBU_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LBU %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LBU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -8038,7 +8251,9 @@ static const char *LBUE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LBUE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LBUE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8108,7 +8323,9 @@ static const char *LD_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LD %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LD %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -8132,7 +8349,9 @@ static const char *LD_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LD %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8156,7 +8375,9 @@ static const char *LD_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LD %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LD %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -8178,7 +8399,9 @@ static const char *LDC1_GP_(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LDC1 %s, %s($%d)", ft, u, 28);
+    const char *ret =3D img_format("LDC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -8202,7 +8425,9 @@ static const char *LDC1_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LDC1 %s, %s(%s)", ft, s, rs);
+    const char *ret =3D img_format("LDC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8226,7 +8451,9 @@ static const char *LDC1_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LDC1 %s, %s(%s)", ft, u, rs);
+    const char *ret =3D img_format("LDC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -8298,7 +8525,9 @@ static const char *LDC2(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LDC2 %s, %s(%s)", ct, s, rs);
+    const char *ret =3D img_format("LDC2 %s, %s(%s)", ct, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8324,7 +8553,10 @@ static const char *LDM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("LDM %s, %s(%s), %s", rt, s, rs, count3=
);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -8346,7 +8578,9 @@ static const char *LDPC_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 6);

-    return img_format("LDPC %s, %s", rt, s);
+    const char *ret =3D img_format("LDPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -8418,7 +8652,9 @@ static const char *LH_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("LH %s, %s(%s)", rt3, u, rs3);
+    const char *ret =3D img_format("LH %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -8440,7 +8676,9 @@ static const char *LH_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LH %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LH %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -8464,7 +8702,9 @@ static const char *LH_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LH %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8488,7 +8728,9 @@ static const char *LH_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LH %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LH %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -8512,7 +8754,9 @@ static const char *LHE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LHE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LHE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8536,7 +8780,9 @@ static const char *LHU_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("LHU %s, %s(%s)", rt3, u, rs3);
+    const char *ret =3D img_format("LHU %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -8558,7 +8804,9 @@ static const char *LHU_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LHU %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LHU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -8582,7 +8830,9 @@ static const char *LHU_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LHU %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LHU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8606,7 +8856,9 @@ static const char *LHU_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LHU %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LHU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -8630,7 +8882,9 @@ static const char *LHUE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LHUE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LHUE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8748,7 +9002,9 @@ static const char *LI_16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *eu =3D IMMEDIATE(encode_eu_from_s_li16(eu_value));

-    return img_format("LI %s, %s", rt3, eu);
+    const char *ret =3D img_format("LI %s, %s", rt3, eu);
+    free((char *)eu);
+    return ret;
 }


@@ -8770,7 +9026,9 @@ static const char *LI_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));

-    return img_format("LI %s, %s", rt, s);
+    const char *ret =3D img_format("LI %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -8794,7 +9052,9 @@ static const char *LL(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LL %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LL %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8818,7 +9078,9 @@ static const char *LLD(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LLD %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LLD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8866,7 +9128,9 @@ static const char *LLE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LLE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LLE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -8940,7 +9204,9 @@ static const char *LSA(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u2 =3D IMMEDIATE(copy(u2_value));

-    return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    const char *ret =3D img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    free((char *)u2);
+    return ret;
 }


@@ -8962,7 +9228,9 @@ static const char *LUI(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D IMMEDIATE(copy(s_value));

-    return img_format("LUI %s, %%hi(%s)", rt, s);
+    const char *ret =3D img_format("LUI %s, %%hi(%s)", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -8986,7 +9254,9 @@ static const char *LW_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("LW %s, %s(%s)", rt3, u, rs3);
+    const char *ret =3D img_format("LW %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -9010,7 +9280,9 @@ static const char *LW_4X4_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs4 =3D GPR(decode_gpr_gpr4(rs4_value));

-    return img_format("LW %s, %s(%s)", rt4, u, rs4);
+    const char *ret =3D img_format("LW %s, %s(%s)", rt4, u, rs4);
+    free((char *)u);
+    return ret;
 }


@@ -9032,7 +9304,9 @@ static const char *LW_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LW %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LW %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -9054,7 +9328,9 @@ static const char *LW_GP16_(uint64 instruction)
     const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LW %s, %s($%d)", rt3, u, 28);
+    const char *ret =3D img_format("LW %s, %s($%d)", rt3, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -9078,7 +9354,9 @@ static const char *LW_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LW %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LW %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -9100,7 +9378,9 @@ static const char *LW_SP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LW %s, %s($%d)", rt, u, 29);
+    const char *ret =3D img_format("LW %s, %s($%d)", rt, u, 29);
+    free((char *)u);
+    return ret;
 }


@@ -9124,7 +9404,9 @@ static const char *LW_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LW %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LW %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -9146,7 +9428,9 @@ static const char *LWC1_GP_(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LWC1 %s, %s($%d)", ft, u, 28);
+    const char *ret =3D img_format("LWC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -9170,7 +9454,9 @@ static const char *LWC1_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWC1 %s, %s(%s)", ft, s, rs);
+    const char *ret =3D img_format("LWC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -9194,7 +9480,9 @@ static const char *LWC1_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWC1 %s, %s(%s)", ft, u, rs);
+    const char *ret =3D img_format("LWC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -9266,7 +9554,9 @@ static const char *LWC2(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWC2 %s, %s(%s)", ct, s, rs);
+    const char *ret =3D img_format("LWC2 %s, %s(%s)", ct, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -9290,7 +9580,9 @@ static const char *LWE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LWE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -9316,7 +9608,10 @@ static const char *LWM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("LWM %s, %s(%s), %s", rt, s, rs, count3=
);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -9338,7 +9633,9 @@ static const char *LWPC_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 6);

-    return img_format("LWPC %s, %s", rt, s);
+    const char *ret =3D img_format("LWPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -9360,7 +9657,9 @@ static const char *LWU_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("LWU %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("LWU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -9384,7 +9683,9 @@ static const char *LWU_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWU %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("LWU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -9408,7 +9709,9 @@ static const char *LWU_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("LWU %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("LWU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -9504,7 +9807,9 @@ static const char *LWXS_16_(uint64 instruction)
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 =3D IMMEDIATE(decode_gpr_gpr3(rt3_value));

-    return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    const char *ret =3D img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    free((char *)rt3);
+    return ret;
 }


@@ -9846,7 +10151,10 @@ static const char *MFC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MFC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -9914,7 +10222,10 @@ static const char *MFGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -9938,7 +10249,10 @@ static const char *MFHC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10006,7 +10320,10 @@ static const char *MFHGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10053,7 +10370,11 @@ static const char *MFHTR(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret =3D img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel=
);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }


@@ -10100,7 +10421,11 @@ static const char *MFTR(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret =3D img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel)=
;
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }


@@ -10336,7 +10661,9 @@ static const char *MOVE_BALC(uint64 instruction)
     const char *rtz4 =3D GPR(decode_gpr_gpr4_zero(rtz4_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 4);

-    return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    const char *ret =3D img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    free((char *)s);
+    return ret;
 }


@@ -10580,7 +10907,10 @@ static const char *MTC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MTC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10648,7 +10978,10 @@ static const char *MTGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10672,7 +11005,10 @@ static const char *MTHC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10740,7 +11076,10 @@ static const char *MTHGC0(uint64 instruction)
     const char *c0s =3D CPR(copy(c0s_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret =3D img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }


@@ -10808,7 +11147,11 @@ static const char *MTHTR(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret =3D img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel=
);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }


@@ -10855,7 +11198,11 @@ static const char *MTTR(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret =3D img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel)=
;
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }


@@ -11431,7 +11778,7 @@ static const char *NOP_16_(uint64 instruction)
 {
     (void)instruction;

-    return "NOP ";
+    return strdup("NOP ");
 }


@@ -11449,7 +11796,7 @@ static const char *NOP_32_(uint64 instruction)
 {
     (void)instruction;

-    return "NOP ";
+    return strdup("NOP ");
 }


@@ -11565,7 +11912,9 @@ static const char *ORI(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("ORI %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("ORI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -11608,7 +11957,7 @@ static const char *PAUSE(uint64 instruction)
 {
     (void)instruction;

-    return "PAUSE ";
+    return strdup("PAUSE ");
 }


@@ -11940,7 +12289,9 @@ static const char *PRECR_SRA_PH_W(uint64 instructio=
n)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa=
);
+    free((char *)sa);
+    return ret;
 }


@@ -11965,7 +12316,9 @@ static const char *PRECR_SRA_R_PH_W(uint64 instruct=
ion)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, =
sa);
+    free((char *)sa);
+    return ret;
 }


@@ -12089,7 +12442,10 @@ static const char *PREF_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("PREF %s, %s(%s)", hint, s, rs);
+    const char *ret =3D img_format("PREF %s, %s(%s)", hint, s, rs);
+    free((char *)hint);
+    free((char *)s);
+    return ret;
 }


@@ -12113,7 +12469,10 @@ static const char *PREF_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("PREF %s, %s(%s)", hint, u, rs);
+    const char *ret =3D img_format("PREF %s, %s(%s)", hint, u, rs);
+    free((char *)hint);
+    free((char *)u);
+    return ret;
 }


@@ -12137,7 +12496,10 @@ static const char *PREFE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("PREFE %s, %s(%s)", hint, s, rs);
+    const char *ret =3D img_format("PREFE %s, %s(%s)", hint, s, rs);
+    free((char *)hint);
+    free((char *)s);
+    return ret;
 }


@@ -12161,7 +12523,9 @@ static const char *PREPEND(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("PREPEND %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("PREPEND %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -12203,7 +12567,9 @@ static const char *RDDSP(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *mask =3D IMMEDIATE(copy(mask_value));

-    return img_format("RDDSP %s, %s", rt, mask);
+    const char *ret =3D img_format("RDDSP %s, %s", rt, mask);
+    free((char *)mask);
+    return ret;
 }


@@ -12227,7 +12593,10 @@ static const char *RDHWR(uint64 instruction)
     const char *hs =3D CPR(copy(hs_value));
     const char *sel =3D IMMEDIATE(copy(sel_value));

-    return img_format("RDHWR %s, %s, %s", rt, hs, sel);
+    const char *ret =3D img_format("RDHWR %s, %s, %s", rt, hs, sel);
+    free((char *)hs);
+    free((char *)sel);
+    return ret;
 }


@@ -12316,6 +12685,7 @@ static const char *REPL_PH(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));

     return img_format("REPL.PH %s, %s", rt, s);
+
 }


@@ -12337,7 +12707,9 @@ static const char *REPL_QB(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("REPL.QB %s, %s", rt, u);
+    const char *ret =3D img_format("REPL.QB %s, %s", rt, u);
+    free((char *)u);
+    return ret;
 }


@@ -12402,8 +12774,13 @@ static const char *RESTORE_32_(uint64 instruction)
     uint64 gp_value =3D extract_gp_2(instruction);

     const char *u =3D IMMEDIATE(copy(u_value));
-    return img_format("RESTORE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str =3D save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret =3D img_format("RESTORE %s%s", u, save_restore_str);
+    free((char *)save_restore_str);
+    free((char *)u);
+    return ret;
 }


@@ -12424,8 +12801,13 @@ static const char *RESTORE_JRC_16_(uint64 instruct=
ion)
     uint64 count_value =3D extract_count_3_2_1_0(instruction);

     const char *u =3D IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    const char *save_restore_str =3D save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+
+    const char *ret =3D img_format("RESTORE.JRC %s%s", u, save_restore_str=
);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }


@@ -12447,8 +12829,13 @@ static const char *RESTORE_JRC_32_(uint64 instruct=
ion)
     uint64 gp_value =3D extract_gp_2(instruction);

     const char *u =3D IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str =3D save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret =3D img_format("RESTORE.JRC %s%s", u, save_restore_str=
);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }


@@ -12470,7 +12857,10 @@ static const char *RESTOREF(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *count =3D IMMEDIATE(copy(count_value));

-    return img_format("RESTOREF %s, %s", u, count);
+    const char *ret =3D img_format("RESTOREF %s, %s", u, count);
+    free((char *)u);
+    free((char *)count);
+    return ret;
 }


@@ -12538,7 +12928,9 @@ static const char *ROTR(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("ROTR %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("ROTR %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -12590,8 +12982,12 @@ static const char *ROTX(uint64 instruction)
     const char *shiftx =3D IMMEDIATE(copy(shiftx_value));
     const char *stripe =3D IMMEDIATE(copy(stripe_value));

-    return img_format("ROTX %s, %s, %s, %s, %s",
+    const char *ret =3D img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
+    free((char *)shift);
+    free((char *)shiftx);
+    free((char *)stripe);
+    return ret;
 }


@@ -12744,8 +13140,13 @@ static const char *SAVE_16_(uint64 instruction)
     uint64 count_value =3D extract_count_3_2_1_0(instruction);

     const char *u =3D IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    const char *save_restore_str =3D save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+
+    const char *ret =3D img_format("SAVE %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }


@@ -12767,8 +13168,13 @@ static const char *SAVE_32_(uint64 instruction)
     uint64 gp_value =3D extract_gp_2(instruction);

     const char *u =3D IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str =3D save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret =3D img_format("SAVE %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }


@@ -12790,7 +13196,10 @@ static const char *SAVEF(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *count =3D IMMEDIATE(copy(count_value));

-    return img_format("SAVEF %s, %s", u, count);
+    const char *ret =3D img_format("SAVEF %s, %s", u, count);
+    free((char *)u);
+    free((char *)count);
+    return ret;
 }


@@ -12814,7 +13223,9 @@ static const char *SB_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("SB %s, %s(%s)", rtz3, u, rs3);
+    const char *ret =3D img_format("SB %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -12836,7 +13247,9 @@ static const char *SB_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SB %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("SB %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -12860,7 +13273,9 @@ static const char *SB_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SB %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SB %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -12884,7 +13299,9 @@ static const char *SB_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SB %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("SB %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -12908,7 +13325,9 @@ static const char *SBE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SBE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SBE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -12956,7 +13375,9 @@ static const char *SC(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SC %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SC %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -12980,7 +13401,9 @@ static const char *SCD(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SCD %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SCD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13028,7 +13451,9 @@ static const char *SCE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SCE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SCE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13098,7 +13523,9 @@ static const char *SD_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SD %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("SD %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -13122,7 +13549,9 @@ static const char *SD_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SD %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13146,7 +13575,9 @@ static const char *SD_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SD %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("SD %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -13166,7 +13597,9 @@ static const char *SDBBP_16_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("SDBBP %s", code);
+    const char *ret =3D img_format("SDBBP %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -13186,7 +13619,9 @@ static const char *SDBBP_32_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("SDBBP %s", code);
+    const char *ret =3D img_format("SDBBP %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -13208,7 +13643,9 @@ static const char *SDC1_GP_(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SDC1 %s, %s($%d)", ft, u, 28);
+    const char *ret =3D img_format("SDC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -13232,7 +13669,9 @@ static const char *SDC1_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SDC1 %s, %s(%s)", ft, s, rs);
+    const char *ret =3D img_format("SDC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13256,7 +13695,9 @@ static const char *SDC1_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SDC1 %s, %s(%s)", ft, u, rs);
+    const char *ret =3D img_format("SDC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -13328,7 +13769,9 @@ static const char *SDC2(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SDC2 %s, %s(%s)", cs, s, rs);
+    const char *ret =3D img_format("SDC2 %s, %s(%s)", cs, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13354,7 +13797,10 @@ static const char *SDM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("SDM %s, %s(%s), %s", rt, s, rs, count3=
);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -13376,7 +13822,9 @@ static const char *SDPC_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 6);

-    return img_format("SDPC %s, %s", rt, s);
+    const char *ret =3D img_format("SDPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -13636,7 +14084,9 @@ static const char *SEQI(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SEQI %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("SEQI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -13660,7 +14110,9 @@ static const char *SH_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("SH %s, %s(%s)", rtz3, u, rs3);
+    const char *ret =3D img_format("SH %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -13682,7 +14134,9 @@ static const char *SH_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SH %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("SH %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -13706,7 +14160,9 @@ static const char *SH_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SH %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13730,7 +14186,9 @@ static const char *SH_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SH %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("SH %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -13754,7 +14212,9 @@ static const char *SHE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SHE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SHE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -13776,7 +14236,9 @@ static const char *SHILO(uint64 instruction)
     const char *shift =3D IMMEDIATE(copy(shift_value));
     const char *ac =3D AC(copy(ac_value));

-    return img_format("SHILO %s, %s", ac, shift);
+    const char *ret =3D img_format("SHILO %s, %s", ac, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -13822,7 +14284,9 @@ static const char *SHLL_PH(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -13846,7 +14310,9 @@ static const char *SHLL_QB(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -13871,7 +14337,9 @@ static const char *SHLL_S_PH(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -13895,7 +14363,9 @@ static const char *SHLL_S_W(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14017,7 +14487,9 @@ static const char *SHRA_PH(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14041,7 +14513,9 @@ static const char *SHRA_QB(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14065,7 +14539,9 @@ static const char *SHRA_R_PH(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14089,7 +14565,9 @@ static const char *SHRA_R_QB(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14113,7 +14591,9 @@ static const char *SHRA_R_W(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14257,7 +14737,9 @@ static const char *SHRL_PH(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14281,7 +14763,9 @@ static const char *SHRL_QB(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *sa =3D IMMEDIATE(copy(sa_value));

-    return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    const char *ret =3D img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }


@@ -14398,7 +14882,9 @@ static const char *SIGRIE(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("SIGRIE %s", code);
+    const char *ret =3D img_format("SIGRIE %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -14422,7 +14908,9 @@ static const char *SLL_16_(uint64 instruction)
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));
     const char *shift3 =3D IMMEDIATE(encode_shift3_from_shift(shift3_value=
));

-    return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
+    const char *ret =3D img_format("SLL %s, %s, %s", rt3, rs3, shift3);
+    free((char *)shift3);
+    return ret;
 }


@@ -14446,7 +14934,9 @@ static const char *SLL_32_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("SLL %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("SLL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -14518,7 +15008,9 @@ static const char *SLTI(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SLTI %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("SLTI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -14542,7 +15034,9 @@ static const char *SLTIU(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SLTIU %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("SLTIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


@@ -14610,7 +15104,9 @@ static const char *SPECIAL2(uint64 instruction)

     const char *op =3D IMMEDIATE(copy(op_value));

-    return img_format("SPECIAL2 %s", op);
+    const char *ret =3D img_format("SPECIAL2 %s", op);
+    free((char *)op);
+    return ret;
 }


@@ -14678,7 +15174,9 @@ static const char *SRA(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("SRA %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("SRA %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -14726,7 +15224,9 @@ static const char *SRL_16_(uint64 instruction)
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));
     const char *shift3 =3D IMMEDIATE(encode_shift3_from_shift(shift3_value=
));

-    return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
+    const char *ret =3D img_format("SRL %s, %s, %s", rt3, rs3, shift3);
+    free((char *)shift3);
+    return ret;
 }


@@ -14750,7 +15250,9 @@ static const char *SRL_32_(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *shift =3D IMMEDIATE(copy(shift_value));

-    return img_format("SRL %s, %s, %s", rt, rs, shift);
+    const char *ret =3D img_format("SRL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }


@@ -15240,7 +15742,9 @@ static const char *SW_16_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value));

-    return img_format("SW %s, %s(%s)", rtz3, u, rs3);
+    const char *ret =3D img_format("SW %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }


@@ -15264,7 +15768,9 @@ static const char *SW_4X4_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs4 =3D GPR(decode_gpr_gpr4(rs4_value));

-    return img_format("SW %s, %s(%s)", rtz4, u, rs4);
+    const char *ret =3D img_format("SW %s, %s(%s)", rtz4, u, rs4);
+    free((char *)u);
+    return ret;
 }


@@ -15286,7 +15792,9 @@ static const char *SW_GP16_(uint64 instruction)
     const char *rtz3 =3D GPR(decode_gpr_gpr3_src_store(rtz3_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SW %s, %s($%d)", rtz3, u, 28);
+    const char *ret =3D img_format("SW %s, %s($%d)", rtz3, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -15308,7 +15816,9 @@ static const char *SW_GP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SW %s, %s($%d)", rt, u, 28);
+    const char *ret =3D img_format("SW %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -15332,7 +15842,9 @@ static const char *SW_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SW %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SW %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15354,7 +15866,9 @@ static const char *SW_SP_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SW %s, %s($%d)", rt, u, 29);
+    const char *ret =3D img_format("SW %s, %s($%d)", rt, u, 29);
+    free((char *)u);
+    return ret;
 }


@@ -15378,7 +15892,9 @@ static const char *SW_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SW %s, %s(%s)", rt, u, rs);
+    const char *ret =3D img_format("SW %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -15400,7 +15916,9 @@ static const char *SWC1_GP_(uint64 instruction)
     const char *ft =3D FPR(copy(ft_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("SWC1 %s, %s($%d)", ft, u, 28);
+    const char *ret =3D img_format("SWC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }


@@ -15424,7 +15942,9 @@ static const char *SWC1_S9_(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SWC1 %s, %s(%s)", ft, s, rs);
+    const char *ret =3D img_format("SWC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15448,7 +15968,9 @@ static const char *SWC1_U12_(uint64 instruction)
     const char *u =3D IMMEDIATE(copy(u_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SWC1 %s, %s(%s)", ft, u, rs);
+    const char *ret =3D img_format("SWC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }


@@ -15520,7 +16042,9 @@ static const char *SWC2(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SWC2 %s, %s(%s)", cs, s, rs);
+    const char *ret =3D img_format("SWC2 %s, %s(%s)", cs, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15544,7 +16068,9 @@ static const char *SWE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SWE %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("SWE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15570,7 +16096,10 @@ static const char *SWM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("SWM %s, %s(%s), %s", rt, s, rs, count3=
);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -15592,7 +16121,9 @@ static const char *SWPC_48_(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *s =3D ADDRESS(encode_s_from_address(s_value), 6);

-    return img_format("SWPC %s, %s", rt, s);
+    const char *ret =3D img_format("SWPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }


@@ -15660,7 +16191,9 @@ static const char *SYNC(uint64 instruction)

     const char *stype =3D IMMEDIATE(copy(stype_value));

-    return img_format("SYNC %s", stype);
+    const char *ret =3D img_format("SYNC %s", stype);
+    free((char *)stype);
+    return ret;
 }


@@ -15682,7 +16215,9 @@ static const char *SYNCI(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SYNCI %s(%s)", s, rs);
+    const char *ret =3D img_format("SYNCI %s(%s)", s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15704,7 +16239,9 @@ static const char *SYNCIE(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("SYNCIE %s(%s)", s, rs);
+    const char *ret =3D img_format("SYNCIE %s(%s)", s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -15724,7 +16261,9 @@ static const char *SYSCALL_16_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("SYSCALL %s", code);
+    const char *ret =3D img_format("SYSCALL %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -15742,7 +16281,9 @@ static const char *SYSCALL_32_(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("SYSCALL %s", code);
+    const char *ret =3D img_format("SYSCALL %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -15782,7 +16323,7 @@ static const char *TLBGINV(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGINV ";
+    return strdup("TLBGINV ");
 }


@@ -15800,7 +16341,7 @@ static const char *TLBGINVF(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGINVF ";
+    return strdup("TLBGINVF ");
 }


@@ -15818,7 +16359,7 @@ static const char *TLBGP(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGP ";
+    return strdup("TLBGP ");
 }


@@ -15836,7 +16377,7 @@ static const char *TLBGR(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGR ";
+    return strdup("TLBGR ");
 }


@@ -15854,7 +16395,7 @@ static const char *TLBGWI(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGWI ";
+    return strdup("TLBGWI ");
 }


@@ -15872,7 +16413,7 @@ static const char *TLBGWR(uint64 instruction)
 {
     (void)instruction;

-    return "TLBGWR ";
+    return strdup("TLBGWR ");
 }


@@ -15890,7 +16431,7 @@ static const char *TLBINV(uint64 instruction)
 {
     (void)instruction;

-    return "TLBINV ";
+    return strdup("TLBINV ");
 }


@@ -15908,7 +16449,7 @@ static const char *TLBINVF(uint64 instruction)
 {
     (void)instruction;

-    return "TLBINVF ";
+    return strdup("TLBINVF ");
 }


@@ -15926,7 +16467,7 @@ static const char *TLBP(uint64 instruction)
 {
     (void)instruction;

-    return "TLBP ";
+    return strdup("TLBP ");
 }


@@ -15944,7 +16485,7 @@ static const char *TLBR(uint64 instruction)
 {
     (void)instruction;

-    return "TLBR ";
+    return strdup("TLBR ");
 }


@@ -15962,7 +16503,7 @@ static const char *TLBWI(uint64 instruction)
 {
     (void)instruction;

-    return "TLBWI ";
+    return strdup("TLBWI ");
 }


@@ -15980,7 +16521,7 @@ static const char *TLBWR(uint64 instruction)
 {
     (void)instruction;

-    return "TLBWR ";
+    return strdup("TLBWR ");
 }


@@ -16116,7 +16657,10 @@ static const char *UALDM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("UALDM %s, %s(%s), %s", rt, s, rs, coun=
t3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -16140,7 +16684,9 @@ static const char *UALH(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("UALH %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("UALH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -16166,7 +16712,10 @@ static const char *UALWM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("UALWM %s, %s(%s), %s", rt, s, rs, coun=
t3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -16192,7 +16741,10 @@ static const char *UASDM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("UASDM %s, %s(%s), %s", rt, s, rs, coun=
t3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -16216,7 +16768,9 @@ static const char *UASH(uint64 instruction)
     const char *s =3D IMMEDIATE(copy(s_value));
     const char *rs =3D GPR(copy(rs_value));

-    return img_format("UASH %s, %s(%s)", rt, s, rs);
+    const char *ret =3D img_format("UASH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }


@@ -16242,7 +16796,10 @@ static const char *UASWM(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *count3 =3D IMMEDIATE(encode_count3_from_count(count3_value=
));

-    return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret =3D img_format("UASWM %s, %s(%s), %s", rt, s, rs, coun=
t3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }


@@ -16262,7 +16819,9 @@ static const char *UDI(uint64 instruction)

     const char *op =3D IMMEDIATE(copy(op_value));

-    return img_format("UDI %s", op);
+    const char *ret =3D img_format("UDI %s", op);
+    free((char *)op);
+    return ret;
 }


@@ -16280,7 +16839,9 @@ static const char *WAIT(uint64 instruction)

     const char *code =3D IMMEDIATE(copy(code_value));

-    return img_format("WAIT %s", code);
+    const char *ret =3D img_format("WAIT %s", code);
+    free((char *)code);
+    return ret;
 }


@@ -16302,7 +16863,9 @@ static const char *WRDSP(uint64 instruction)
     const char *rt =3D GPR(copy(rt_value));
     const char *mask =3D IMMEDIATE(copy(mask_value));

-    return img_format("WRDSP %s, %s", rt, mask);
+    const char *ret =3D img_format("WRDSP %s, %s", rt, mask);
+    free((char *)mask);
+    return ret;
 }


@@ -16394,7 +16957,9 @@ static const char *XORI(uint64 instruction)
     const char *rs =3D GPR(copy(rs_value));
     const char *u =3D IMMEDIATE(copy(u_value));

-    return img_format("XORI %s, %s, %s", rt, rs, u);
+    const char *ret =3D img_format("XORI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }


--
2.25.1


--_000_VE1PR03MB6045A14C1F14283954736B04F8759VE1PR03MB6045eurp_
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
<b>Sent:</b> Monday, August 15, 2022 9:30 AM<br>
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
<b>Subject:</b> [PATCH 13/20] disas/nanomips: Add free() calls</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The free() function is called for every string all=
ocated using the<br>
strdup() function to prevent memory leaking.<br>
<br>
The implementation of the several functions working with dynamically<br>
allocated strings is slightly changed so we can free those strings.<br>
<br>
Almost every disassembly_function returns the result of the img_format()<br=
>
function, which returns a dynamically allocated string. To be able to<br>
free that string for every disassembly_function, a strdup() call is<br>
added for returning value of some disassembly functions like TLBGINV,<br>
TLBGINVF, TLBGP, etc.<br>
<br>
Signed-off-by: Milica Lazarevic &lt;milica.lazarevic@syrmia.com&gt;<br>
---<br>
&nbsp;disas/nanomips.cpp | 1117 +++++++++++++++++++++++++++++++++----------=
-<br>
&nbsp;1 file changed, 841 insertions(+), 276 deletions(-)<br>
<br>
diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp<br>
index 561e4ff095..551bcb3164 100644<br>
--- a/disas/nanomips.cpp<br>
+++ b/disas/nanomips.cpp<br>
@@ -526,7 +526,9 @@ static const char *save_restore_list(uint64 rt, uint64 =
count, uint64 gp)<br>
&nbsp;&nbsp;&nbsp;&nbsp; for (uint64 counter =3D 0; counter !=3D count; cou=
nter++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool use_gp =3D gp &amp;&a=
mp; (counter =3D=3D count - 1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 this_rt =3D use_gp =
? 28 : ((rt &amp; 0x10) | (rt + counter)) &amp; 0x1f;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(str, img_format(&quot;,%=
s&quot;, GPR(this_rt)));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *dis_str =3D img_for=
mat(&quot;,%s&quot;, GPR(this_rt));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(str, dis_str);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free((char *)dis_str);<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; return strdup(str);<br>
@@ -663,7 +665,9 @@ static int Disassemble(const uint16 *data, char *dis,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -6;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; type =3D table[i].type;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; strcpy(dis, dis_fn(op_code));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; const char *dis_str =3D dis_fn(op_code);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; strcpy(dis, dis_str);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; free((char *)dis_str);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; return table[i].instructions_size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } els=
e {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; strcpy(dis, &quot;reserved instruction&quot;);<br>
@@ -1737,7 +1741,10 @@ static const char *ACLR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ACLR %s, %s(%s)&quot;, bit, s, =
rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ACLR %s, %s(%s)&qu=
ot;, bit, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)bit);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1833,7 +1840,9 @@ static const char *ADDIU_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, %s, %s&quot;, rt, rs,=
 u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, %s, %s&q=
uot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1853,8 +1862,9 @@ static const char *ADDIU_48_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
-<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, %s&quot;=
, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1874,8 +1884,9 @@ static const char *ADDIU_GP48_(uint64 instruction)<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
-<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, $%d, %s&quot;, rt, 28=
, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, $%d, %s&=
quot;, rt, 28, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1896,7 +1907,9 @@ static const char *ADDIU_GP_B_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, $%d, %s&quot;, rt, 28=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, $%d, %s&=
quot;, rt, 28, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1917,7 +1930,9 @@ static const char *ADDIU_GP_W_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, $%d, %s&quot;, rt, 28=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, $%d, %s&=
quot;, rt, 28, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1940,7 +1955,9 @@ static const char *ADDIU_NEG_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(neg_copy(u_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, %s, %s&quot;, rt, rs,=
 u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, %s, %s&q=
uot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1961,7 +1978,9 @@ static const char *ADDIU_R1_SP_(uint64 instruction)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, $%d, %s&quot;, rt3, 2=
9, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, $%d, %s&=
quot;, rt3, 29, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -1984,7 +2003,9 @@ static const char *ADDIU_R2_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, %s, %s&quot;, rt3, rs=
3, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, %s, %s&q=
uot;, rt3, rs3, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2004,7 +2025,9 @@ static const char *ADDIU_RS5_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIU %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIU %s, %s&quot;=
, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2026,7 +2049,9 @@ static const char *ADDIUPC_32_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIUPC %s, %s&quot;, rt, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIUPC %s, %s&quo=
t;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2048,7 +2073,9 @@ static const char *ADDIUPC_48_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 6);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ADDIUPC %s, %s&quot;, rt, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ADDIUPC %s, %s&quo=
t;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2506,7 +2533,9 @@ static const char *ALUIPC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ALUIPC %s, %%pcrel_hi(%s)&quot;=
, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ALUIPC %s, %%pcrel=
_hi(%s)&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2574,7 +2603,9 @@ static const char *ANDI_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *eu =3D IMMEDIATE(encode_eu_from_u_andi=
16(eu_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ANDI %s, %s, %s&quot;, rt3, rs3=
, eu);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ANDI %s, %s, %s&qu=
ot;, rt3, rs3, eu);<br>
+&nbsp;&nbsp;&nbsp; free((char *)eu);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2598,7 +2629,9 @@ static const char *ANDI_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ANDI %s, %s, %s&quot;, rt, rs, =
u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ANDI %s, %s, %s&qu=
ot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2622,7 +2655,9 @@ static const char *APPEND(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;APPEND %s, %s, %s&quot;, rt, rs=
, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;APPEND %s, %s, %s&=
quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2646,7 +2681,10 @@ static const char *ASET(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ASET %s, %s(%s)&quot;, bit, s, =
rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ASET %s, %s(%s)&qu=
ot;, bit, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)bit);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2666,7 +2704,9 @@ static const char *BALC_16_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BALC %s&quot;, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BALC %s&quot;, s);=
<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2686,7 +2726,9 @@ static const char *BALC_32_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BALC %s&quot;, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BALC %s&quot;, s);=
<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2732,7 +2774,10 @@ static const char *BBEQZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *bit =3D IMMEDIATE(copy(bit_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BBEQZC %s, %s, %s&quot;, rt, bi=
t, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BBEQZC %s, %s, %s&=
quot;, rt, bit, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)bit);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2756,7 +2801,10 @@ static const char *BBNEZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *bit =3D IMMEDIATE(copy(bit_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BBNEZC %s, %s, %s&quot;, rt, bi=
t, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BBNEZC %s, %s, %s&=
quot;, rt, bit, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)bit);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2776,7 +2824,9 @@ static const char *BC_16_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC %s&quot;, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC %s&quot;, s);<b=
r>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2796,7 +2846,9 @@ static const char *BC_32_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC %s&quot;, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC %s&quot;, s);<b=
r>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2818,7 +2870,9 @@ static const char *BC1EQZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC1EQZC %s, %s&quot;, ft, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC1EQZC %s, %s&quo=
t;, ft, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2840,7 +2894,9 @@ static const char *BC1NEZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC1NEZC %s, %s&quot;, ft, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC1NEZC %s, %s&quo=
t;, ft, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2862,7 +2918,9 @@ static const char *BC2EQZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ct =3D CPR(copy(ct_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC2EQZC %s, %s&quot;, ct, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC2EQZC %s, %s&quo=
t;, ct, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2884,7 +2942,9 @@ static const char *BC2NEZC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ct =3D CPR(copy(ct_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BC2NEZC %s, %s&quot;, ct, s);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BC2NEZC %s, %s&quo=
t;, ct, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2908,7 +2968,9 @@ static const char *BEQC_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D ADDRESS(encode_u_from_address(u_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BEQC %s, %s, %s&quot;, rs3, rt3=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BEQC %s, %s, %s&qu=
ot;, rs3, rt3, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2932,7 +2994,9 @@ static const char *BEQC_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BEQC %s, %s, %s&quot;, rs, rt, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BEQC %s, %s, %s&qu=
ot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2956,7 +3020,10 @@ static const char *BEQIC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BEQIC %s, %s, %s&quot;, rt, u, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BEQIC %s, %s, %s&q=
uot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -2978,7 +3045,9 @@ static const char *BEQZC_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BEQZC %s, %s&quot;, rt3, s);<br=
>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BEQZC %s, %s&quot;=
, rt3, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3002,7 +3071,9 @@ static const char *BGEC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BGEC %s, %s, %s&quot;, rs, rt, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BGEC %s, %s, %s&qu=
ot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3026,7 +3097,10 @@ static const char *BGEIC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BGEIC %s, %s, %s&quot;, rt, u, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BGEIC %s, %s, %s&q=
uot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3050,7 +3124,10 @@ static const char *BGEIUC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BGEIUC %s, %s, %s&quot;, rt, u,=
 s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BGEIUC %s, %s, %s&=
quot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3074,7 +3151,9 @@ static const char *BGEUC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BGEUC %s, %s, %s&quot;, rs, rt,=
 s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BGEUC %s, %s, %s&q=
uot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3098,7 +3177,9 @@ static const char *BLTC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BLTC %s, %s, %s&quot;, rs, rt, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BLTC %s, %s, %s&qu=
ot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3122,7 +3203,10 @@ static const char *BLTIC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BLTIC %s, %s, %s&quot;, rt, u, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BLTIC %s, %s, %s&q=
uot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3146,7 +3230,10 @@ static const char *BLTIUC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BLTIUC %s, %s, %s&quot;, rt, u,=
 s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BLTIUC %s, %s, %s&=
quot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3170,7 +3257,9 @@ static const char *BLTUC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BLTUC %s, %s, %s&quot;, rs, rt,=
 s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BLTUC %s, %s, %s&q=
uot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3194,7 +3283,9 @@ static const char *BNEC_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D ADDRESS(encode_u_from_address(u_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BNEC %s, %s, %s&quot;, rs3, rt3=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BNEC %s, %s, %s&qu=
ot;, rs3, rt3, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3218,7 +3309,9 @@ static const char *BNEC_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BNEC %s, %s, %s&quot;, rs, rt, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BNEC %s, %s, %s&qu=
ot;, rs, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3242,7 +3335,10 @@ static const char *BNEIC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BNEIC %s, %s, %s&quot;, rt, u, =
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BNEIC %s, %s, %s&q=
uot;, rt, u, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3264,7 +3360,9 @@ static const char *BNEZC_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 2);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BNEZC %s, %s&quot;, rt3, s);<br=
>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BNEZC %s, %s&quot;=
, rt3, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3284,7 +3382,9 @@ static const char *BPOSGE32C(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BPOSGE32C %s&quot;, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BPOSGE32C %s&quot;=
, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3304,7 +3404,9 @@ static const char *BREAK_16_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BREAK %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BREAK %s&quot;, co=
de);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3324,7 +3426,9 @@ static const char *BREAK_32_(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;BREAK %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;BREAK %s&quot;, co=
de);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3368,7 +3472,10 @@ static const char *CACHE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;CACHE %s, %s(%s)&quot;, op, s, =
rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;CACHE %s, %s(%s)&q=
uot;, op, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)op);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -3392,7 +3499,10 @@ static const char *CACHEE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;CACHEE %s, %s(%s)&quot;, op, s,=
 rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;CACHEE %s, %s(%s)&=
quot;, op, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)op);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -4967,7 +5077,9 @@ static const char *COP2_1(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *cofun =3D IMMEDIATE(copy(cofun_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;COP2_1 %s&quot;, cofun);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;COP2_1 %s&quot;, c=
ofun);<br>
+&nbsp;&nbsp;&nbsp; free((char *)cofun);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5297,7 +5409,9 @@ static const char *DADDIU_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DADDIU %s, %s&quot;, rt, s);<br=
>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DADDIU %s, %s&quot=
;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5321,7 +5435,9 @@ static const char *DADDIU_NEG_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(neg_copy(u_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DADDIU %s, %s, %s&quot;, rt, rs=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DADDIU %s, %s, %s&=
quot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5345,7 +5461,9 @@ static const char *DADDIU_U12_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DADDIU %s, %s, %s&quot;, rt, rs=
, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DADDIU %s, %s, %s&=
quot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5503,7 +5621,7 @@ static const char *DERET(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;DERET &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;DERET &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5529,7 +5647,10 @@ static const char *DEXTM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *lsb =3D IMMEDIATE(copy(lsb_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *msbd =3D IMMEDIATE(encode_msbd_from_si=
ze(msbd_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DEXTM %s, %s, %s, %s&quot;, rt,=
 rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DEXTM %s, %s, %s, =
%s&quot;, rt, rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; free((char *)lsb);<br>
+&nbsp;&nbsp;&nbsp; free((char *)msbd);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5555,7 +5676,10 @@ static const char *DEXT(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *lsb =3D IMMEDIATE(copy(lsb_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *msbd =3D IMMEDIATE(encode_msbd_from_si=
ze(msbd_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DEXT %s, %s, %s, %s&quot;, rt, =
rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DEXT %s, %s, %s, %=
s&quot;, rt, rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; free((char *)lsb);<br>
+&nbsp;&nbsp;&nbsp; free((char *)msbd);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5581,7 +5705,10 @@ static const char *DEXTU(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *lsb =3D IMMEDIATE(copy(lsb_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *msbd =3D IMMEDIATE(encode_msbd_from_si=
ze(msbd_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DEXTU %s, %s, %s, %s&quot;, rt,=
 rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DEXTU %s, %s, %s, =
%s&quot;, rt, rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; free((char *)lsb);<br>
+&nbsp;&nbsp;&nbsp; free((char *)msbd);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5608,8 +5735,11 @@ static const char *DINSM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(encode_lsb_from_pos=
_and_size(msbd_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* !!!!!!!!!! - no conversion function */<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DINSM %s, %s, %s, %s&quot;, rt,=
 rs, pos, size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DINSM %s, %s, %s, =
%s&quot;, rt, rs, pos, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* hand edited */<br>
+&nbsp;&nbsp;&nbsp; free((char *)pos);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5636,8 +5766,11 @@ static const char *DINS(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(encode_lsb_from_pos=
_and_size(msbd_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* !!!!!!!!!! - no conversion function */<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DINS %s, %s, %s, %s&quot;, rt, =
rs, pos, size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DINS %s, %s, %s, %=
s&quot;, rt, rs, pos, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* hand edited */<br>
+&nbsp;&nbsp;&nbsp; free((char *)pos);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5664,8 +5797,11 @@ static const char *DINSU(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(encode_lsb_from_pos=
_and_size(msbd_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* !!!!!!!!!! - no conversion function */<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DINSU %s, %s, %s, %s&quot;, rt,=
 rs, pos, size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DINSU %s, %s, %s, =
%s&quot;, rt, rs, pos, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* hand edited */<br>
+&nbsp;&nbsp;&nbsp; free((char *)pos);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5807,7 +5943,9 @@ static const char *DLSA(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u2 =3D IMMEDIATE(copy(u2_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DLSA %s, %s, %s, %s&quot;, rd, =
rs, rt, u2);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DLSA %s, %s, %s, %=
s&quot;, rd, rs, rt, u2);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u2);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5829,7 +5967,9 @@ static const char *DLUI_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DLUI %s, %s&quot;, rt, u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DLUI %s, %s&quot;,=
 rt, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5853,7 +5993,9 @@ static const char *DMFC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DMFC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DMFC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5921,7 +6063,9 @@ static const char *DMFGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DMFGC0 %s, %s, %s&quot;, rt, c0=
s, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DMFGC0 %s, %s, %s&=
quot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -5993,7 +6137,9 @@ static const char *DMTC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DMTC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DMTC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6061,7 +6207,9 @@ static const char *DMTGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DMTGC0 %s, %s, %s&quot;, rt, c0=
s, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DMTGC0 %s, %s, %s&=
quot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6586,7 +6734,9 @@ static const char *DROTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DROTR %s, %s, %s&quot;, rt, rs,=
 shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DROTR %s, %s, %s&q=
uot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6610,7 +6760,9 @@ static const char *DROTR32(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DROTR32 %s, %s, %s&quot;, rt, r=
s, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DROTR32 %s, %s, %s=
&quot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6660,7 +6812,10 @@ static const char *DROTX(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shiftx =3D IMMEDIATE(copy(shiftx_value=
));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DROTX %s, %s, %s, %s&quot;, rt,=
 rs, shift, shiftx);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DROTX %s, %s, %s, =
%s&quot;, rt, rs, shift, shiftx);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shiftx);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6684,7 +6839,9 @@ static const char *DSLL(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSLL %s, %s, %s&quot;, rt, rs, =
shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSLL %s, %s, %s&qu=
ot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6708,7 +6865,9 @@ static const char *DSLL32(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSLL32 %s, %s, %s&quot;, rt, rs=
, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSLL32 %s, %s, %s&=
quot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6756,7 +6915,9 @@ static const char *DSRA(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSRA %s, %s, %s&quot;, rt, rs, =
shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSRA %s, %s, %s&qu=
ot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6780,7 +6941,9 @@ static const char *DSRA32(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSRA32 %s, %s, %s&quot;, rt, rs=
, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSRA32 %s, %s, %s&=
quot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6828,7 +6991,9 @@ static const char *DSRL(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSRL %s, %s, %s&quot;, rt, rs, =
shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSRL %s, %s, %s&qu=
ot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6852,7 +7017,9 @@ static const char *DSRL32(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;DSRL32 %s, %s, %s&quot;, rt, rs=
, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;DSRL32 %s, %s, %s&=
quot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -6982,7 +7149,7 @@ static const char *EHB(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;EHB &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;EHB &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7040,7 +7207,7 @@ static const char *ERET(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;ERET &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;ERET &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7058,7 +7225,7 @@ static const char *ERETNC(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;ERETNC &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;ERETNC &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7124,7 +7291,10 @@ static const char *EXT(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *lsb =3D IMMEDIATE(copy(lsb_value));<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *msbd =3D IMMEDIATE(encode_msbd_from_si=
ze(msbd_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXT %s, %s, %s, %s&quot;, rt, r=
s, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXT %s, %s, %s, %s=
&quot;, rt, rs, lsb, msbd);<br>
+&nbsp;&nbsp;&nbsp; free((char *)lsb);<br>
+&nbsp;&nbsp;&nbsp; free((char *)msbd);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7150,7 +7320,9 @@ static const char *EXTD(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTD %s, %s, %s, %s&quot;, rd, =
rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTD %s, %s, %s, %=
s&quot;, rd, rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7176,7 +7348,9 @@ static const char *EXTD32(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTD32 %s, %s, %s, %s&quot;, rd=
, rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTD32 %s, %s, %s,=
 %s&quot;, rd, rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7200,7 +7374,9 @@ static const char *EXTPDP(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(copy(size_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTPDP %s, %s, %s&quot;, rt, ac=
, size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTPDP %s, %s, %s&=
quot;, rt, ac, size);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7248,7 +7424,9 @@ static const char *EXTP(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(copy(size_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTP %s, %s, %s&quot;, rt, ac, =
size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTP %s, %s, %s&qu=
ot;, rt, ac, size);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7297,7 +7475,9 @@ static const char *EXTR_RS_W(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTR_RS.W %s, %s, %s&quot;, rt,=
 ac, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTR_RS.W %s, %s, =
%s&quot;, rt, ac, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7322,7 +7502,9 @@ static const char *EXTR_R_W(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTR_R.W %s, %s, %s&quot;, rt, =
ac, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTR_R.W %s, %s, %=
s&quot;, rt, ac, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7347,7 +7529,9 @@ static const char *EXTR_S_H(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTR_S.H %s, %s, %s&quot;, rt, =
ac, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTR_S.H %s, %s, %=
s&quot;, rt, ac, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7372,7 +7556,9 @@ static const char *EXTR_W(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTR.W %s, %s, %s&quot;, rt, ac=
, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTR.W %s, %s, %s&=
quot;, rt, ac, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7499,7 +7685,9 @@ static const char *EXTW(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;EXTW %s, %s, %s, %s&quot;, rd, =
rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;EXTW %s, %s, %s, %=
s&quot;, rd, rs, rt, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7631,7 +7819,9 @@ static const char *HYPCALL(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;HYPCALL %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;HYPCALL %s&quot;, =
code);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7651,7 +7841,9 @@ static const char *HYPCALL_16_(uint64 instruction)<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;HYPCALL %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;HYPCALL %s&quot;, =
code);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7678,8 +7870,11 @@ static const char *INS(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *size =3D IMMEDIATE(encode_lsb_from_pos=
_and_size(msbd_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* !!!!!!!!!! - no conversion function */<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;INS %s, %s, %s, %s&quot;, rt, r=
s, pos, size);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;INS %s, %s, %s, %s=
&quot;, rt, rs, pos, size);<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* hand edited */<br>
+&nbsp;&nbsp;&nbsp; free((char *)pos);<br>
+&nbsp;&nbsp;&nbsp; free((char *)size);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7718,7 +7913,7 @@ static const char *IRET(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;IRET &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;IRET &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7826,7 +8021,9 @@ static const char *LB_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LB %s, %s(%s)&quot;, rt3, u, rs=
3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LB %s, %s(%s)&quot=
;, rt3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7848,7 +8045,9 @@ static const char *LB_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LB %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LB %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7872,7 +8071,9 @@ static const char *LB_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LB %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LB %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7896,7 +8097,9 @@ static const char *LB_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LB %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LB %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7920,7 +8123,9 @@ static const char *LBE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7944,7 +8149,9 @@ static const char *LBU_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBU %s, %s(%s)&quot;, rt3, u, r=
s3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBU %s, %s(%s)&quo=
t;, rt3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7966,7 +8173,9 @@ static const char *LBU_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBU %s, %s($%d)&quot;, rt, u, 2=
8);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBU %s, %s($%d)&qu=
ot;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -7990,7 +8199,9 @@ static const char *LBU_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBU %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBU %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8014,7 +8225,9 @@ static const char *LBU_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBU %s, %s(%s)&quot;, rt, u, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBU %s, %s(%s)&quo=
t;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8038,7 +8251,9 @@ static const char *LBUE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LBUE %s, %s(%s)&quot;, rt, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LBUE %s, %s(%s)&qu=
ot;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8108,7 +8323,9 @@ static const char *LD_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LD %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LD %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8132,7 +8349,9 @@ static const char *LD_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LD %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LD %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8156,7 +8375,9 @@ static const char *LD_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LD %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LD %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8178,7 +8399,9 @@ static const char *LDC1_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDC1 %s, %s($%d)&quot;, ft, u, =
28);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDC1 %s, %s($%d)&q=
uot;, ft, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8202,7 +8425,9 @@ static const char *LDC1_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDC1 %s, %s(%s)&quot;, ft, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDC1 %s, %s(%s)&qu=
ot;, ft, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8226,7 +8451,9 @@ static const char *LDC1_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDC1 %s, %s(%s)&quot;, ft, u, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDC1 %s, %s(%s)&qu=
ot;, ft, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8298,7 +8525,9 @@ static const char *LDC2(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDC2 %s, %s(%s)&quot;, ct, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDC2 %s, %s(%s)&qu=
ot;, ct, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8324,7 +8553,10 @@ static const char *LDM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDM %s, %s(%s), %s&quot;, rt, s=
, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDM %s, %s(%s), %s=
&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8346,7 +8578,9 @@ static const char *LDPC_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 6);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LDPC %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LDPC %s, %s&quot;,=
 rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8418,7 +8652,9 @@ static const char *LH_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LH %s, %s(%s)&quot;, rt3, u, rs=
3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LH %s, %s(%s)&quot=
;, rt3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8440,7 +8676,9 @@ static const char *LH_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LH %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LH %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8464,7 +8702,9 @@ static const char *LH_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LH %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LH %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8488,7 +8728,9 @@ static const char *LH_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LH %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LH %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8512,7 +8754,9 @@ static const char *LHE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8536,7 +8780,9 @@ static const char *LHU_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHU %s, %s(%s)&quot;, rt3, u, r=
s3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHU %s, %s(%s)&quo=
t;, rt3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8558,7 +8804,9 @@ static const char *LHU_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHU %s, %s($%d)&quot;, rt, u, 2=
8);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHU %s, %s($%d)&qu=
ot;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8582,7 +8830,9 @@ static const char *LHU_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHU %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHU %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8606,7 +8856,9 @@ static const char *LHU_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHU %s, %s(%s)&quot;, rt, u, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHU %s, %s(%s)&quo=
t;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8630,7 +8882,9 @@ static const char *LHUE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LHUE %s, %s(%s)&quot;, rt, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LHUE %s, %s(%s)&qu=
ot;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8748,7 +9002,9 @@ static const char *LI_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *eu =3D IMMEDIATE(encode_eu_from_s_li16=
(eu_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LI %s, %s&quot;, rt3, eu);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LI %s, %s&quot;, r=
t3, eu);<br>
+&nbsp;&nbsp;&nbsp; free((char *)eu);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8770,7 +9026,9 @@ static const char *LI_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LI %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LI %s, %s&quot;, r=
t, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8794,7 +9052,9 @@ static const char *LL(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LL %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LL %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8818,7 +9078,9 @@ static const char *LLD(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LLD %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LLD %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8866,7 +9128,9 @@ static const char *LLE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LLE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LLE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8940,7 +9204,9 @@ static const char *LSA(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u2 =3D IMMEDIATE(copy(u2_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LSA %s, %s, %s, %s&quot;, rd, r=
s, rt, u2);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LSA %s, %s, %s, %s=
&quot;, rd, rs, rt, u2);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u2);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8962,7 +9228,9 @@ static const char *LUI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LUI %s, %%hi(%s)&quot;, rt, s);=
<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LUI %s, %%hi(%s)&q=
uot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -8986,7 +9254,9 @@ static const char *LW_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s(%s)&quot;, rt3, u, rs=
3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s(%s)&quot=
;, rt3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9010,7 +9280,9 @@ static const char *LW_4X4_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs4 =3D GPR(decode_gpr_gpr4(rs4_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s(%s)&quot;, rt4, u, rs=
4);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s(%s)&quot=
;, rt4, u, rs4);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9032,7 +9304,9 @@ static const char *LW_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9054,7 +9328,9 @@ static const char *LW_GP16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D GPR(decode_gpr_gpr3(rt3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s($%d)&quot;, rt3, u, 2=
8);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s($%d)&quo=
t;, rt3, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9078,7 +9354,9 @@ static const char *LW_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9100,7 +9378,9 @@ static const char *LW_SP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s($%d)&quot;, rt, u, 29=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s($%d)&quo=
t;, rt, u, 29);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9124,7 +9404,9 @@ static const char *LW_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LW %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LW %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9146,7 +9428,9 @@ static const char *LWC1_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWC1 %s, %s($%d)&quot;, ft, u, =
28);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWC1 %s, %s($%d)&q=
uot;, ft, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9170,7 +9454,9 @@ static const char *LWC1_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWC1 %s, %s(%s)&quot;, ft, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWC1 %s, %s(%s)&qu=
ot;, ft, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9194,7 +9480,9 @@ static const char *LWC1_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWC1 %s, %s(%s)&quot;, ft, u, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWC1 %s, %s(%s)&qu=
ot;, ft, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9266,7 +9554,9 @@ static const char *LWC2(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWC2 %s, %s(%s)&quot;, ct, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWC2 %s, %s(%s)&qu=
ot;, ct, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9290,7 +9580,9 @@ static const char *LWE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9316,7 +9608,10 @@ static const char *LWM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWM %s, %s(%s), %s&quot;, rt, s=
, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWM %s, %s(%s), %s=
&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9338,7 +9633,9 @@ static const char *LWPC_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 6);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWPC %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWPC %s, %s&quot;,=
 rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9360,7 +9657,9 @@ static const char *LWU_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWU %s, %s($%d)&quot;, rt, u, 2=
8);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWU %s, %s($%d)&qu=
ot;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9384,7 +9683,9 @@ static const char *LWU_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWU %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWU %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9408,7 +9709,9 @@ static const char *LWU_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWU %s, %s(%s)&quot;, rt, u, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWU %s, %s(%s)&quo=
t;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9504,7 +9807,9 @@ static const char *LWXS_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt3 =3D IMMEDIATE(decode_gpr_gpr3(rt3_=
value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;LWXS %s, %s(%s)&quot;, rd3, rs3=
, rt3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;LWXS %s, %s(%s)&qu=
ot;, rd3, rs3, rt3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)rt3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9846,7 +10151,10 @@ static const char *MFC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFC0 %s, %s, %s&quot;, rt, c0s,=
 sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFC0 %s, %s, %s&qu=
ot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9914,7 +10222,10 @@ static const char *MFGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFGC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFGC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -9938,7 +10249,10 @@ static const char *MFHC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFHC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFHC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10006,7 +10320,10 @@ static const char *MFHGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFHGC0 %s, %s, %s&quot;, rt, c0=
s, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFHGC0 %s, %s, %s&=
quot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10053,7 +10370,11 @@ static const char *MFHTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFHTR %s, %s, %s, %s&quot;, rt,=
 c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFHTR %s, %s, %s, =
%s&quot;, rt, c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10100,7 +10421,11 @@ static const char *MFTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MFTR %s, %s, %s, %s&quot;, rt, =
c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MFTR %s, %s, %s, %=
s&quot;, rt, c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10336,7 +10661,9 @@ static const char *MOVE_BALC(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rtz4 =3D GPR(decode_gpr_gpr4_zero(rtz4=
_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 4);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MOVE.BALC %s, %s, %s&quot;, rd1=
, rtz4, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MOVE.BALC %s, %s, =
%s&quot;, rd1, rtz4, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10580,7 +10907,10 @@ static const char *MTC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTC0 %s, %s, %s&quot;, rt, c0s,=
 sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTC0 %s, %s, %s&qu=
ot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10648,7 +10978,10 @@ static const char *MTGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTGC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTGC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10672,7 +11005,10 @@ static const char *MTHC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTHC0 %s, %s, %s&quot;, rt, c0s=
, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTHC0 %s, %s, %s&q=
uot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10740,7 +11076,10 @@ static const char *MTHGC0(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *c0s =3D CPR(copy(c0s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTHGC0 %s, %s, %s&quot;, rt, c0=
s, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTHGC0 %s, %s, %s&=
quot;, rt, c0s, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10808,7 +11147,11 @@ static const char *MTHTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTHTR %s, %s, %s, %s&quot;, rt,=
 c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTHTR %s, %s, %s, =
%s&quot;, rt, c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -10855,7 +11198,11 @@ static const char *MTTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;MTTR %s, %s, %s, %s&quot;, rt, =
c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;MTTR %s, %s, %s, %=
s&quot;, rt, c0s, u, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)c0s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11431,7 +11778,7 @@ static const char *NOP_16_(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;NOP &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;NOP &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11449,7 +11796,7 @@ static const char *NOP_32_(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;NOP &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;NOP &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11565,7 +11912,9 @@ static const char *ORI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ORI %s, %s, %s&quot;, rt, rs, u=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ORI %s, %s, %s&quo=
t;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11608,7 +11957,7 @@ static const char *PAUSE(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;PAUSE &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;PAUSE &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11940,7 +12289,9 @@ static const char *PRECR_SRA_PH_W(uint64 instructio=
n)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PRECR_SRA.PH.W %s, %s, %s&quot;=
, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PRECR_SRA.PH.W %s,=
 %s, %s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -11965,7 +12316,9 @@ static const char *PRECR_SRA_R_PH_W(uint64 instruct=
ion)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PRECR_SRA_R.PH.W %s, %s, %s&quo=
t;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PRECR_SRA_R.PH.W %=
s, %s, %s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12089,7 +12442,10 @@ static const char *PREF_S9_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PREF %s, %s(%s)&quot;, hint, s,=
 rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PREF %s, %s(%s)&qu=
ot;, hint, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)hint);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12113,7 +12469,10 @@ static const char *PREF_U12_(uint64 instruction)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PREF %s, %s(%s)&quot;, hint, u,=
 rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PREF %s, %s(%s)&qu=
ot;, hint, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)hint);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12137,7 +12496,10 @@ static const char *PREFE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PREFE %s, %s(%s)&quot;, hint, s=
, rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PREFE %s, %s(%s)&q=
uot;, hint, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)hint);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12161,7 +12523,9 @@ static const char *PREPEND(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;PREPEND %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;PREPEND %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12203,7 +12567,9 @@ static const char *RDDSP(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *mask =3D IMMEDIATE(copy(mask_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RDDSP %s, %s&quot;, rt, mask);<=
br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RDDSP %s, %s&quot;=
, rt, mask);<br>
+&nbsp;&nbsp;&nbsp; free((char *)mask);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12227,7 +12593,10 @@ static const char *RDHWR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *hs =3D CPR(copy(hs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sel =3D IMMEDIATE(copy(sel_value));<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RDHWR %s, %s, %s&quot;, rt, hs,=
 sel);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RDHWR %s, %s, %s&q=
uot;, rt, hs, sel);<br>
+&nbsp;&nbsp;&nbsp; free((char *)hs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sel);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12316,6 +12685,7 @@ static const char *REPL_PH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; return img_format(&quot;REPL.PH %s, %s&quot;, rt, =
s);<br>
+<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12337,7 +12707,9 @@ static const char *REPL_QB(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;REPL.QB %s, %s&quot;, rt, u);<b=
r>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;REPL.QB %s, %s&quo=
t;, rt, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12402,8 +12774,13 @@ static const char *RESTORE_32_(uint64 instruction)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint64 gp_value =3D extract_gp_2(instruction);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RESTORE %s%s&quot;, u,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; save_restore_list(rt_value, count_value, gp_value));<br>
+&nbsp;&nbsp;&nbsp; const char *save_restore_str =3D save_restore_list(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rt_value, count_value, gp_value=
);<br>
+<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RESTORE %s%s&quot;=
, u, save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12424,8 +12801,13 @@ static const char *RESTORE_JRC_16_(uint64 instruct=
ion)<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint64 count_value =3D extract_count_3_2_1_0(instr=
uction);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RESTORE.JRC %s%s&quot;, u,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_restore_list(encode_rt1_fr=
om_rt(rt1_value), count_value, 0));<br>
+&nbsp;&nbsp;&nbsp; const char *save_restore_str =3D save_restore_list(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encode_rt1_from_rt(rt1_value), =
count_value, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RESTORE.JRC %s%s&q=
uot;, u, save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12447,8 +12829,13 @@ static const char *RESTORE_JRC_32_(uint64 instruct=
ion)<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint64 gp_value =3D extract_gp_2(instruction);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RESTORE.JRC %s%s&quot;, u,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; save_restore_list(rt_value, count_value, gp_value));<br>
+&nbsp;&nbsp;&nbsp; const char *save_restore_str =3D save_restore_list(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rt_value, count_value, gp_value=
);<br>
+<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RESTORE.JRC %s%s&q=
uot;, u, save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12470,7 +12857,10 @@ static const char *RESTOREF(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count =3D IMMEDIATE(copy(count_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;RESTOREF %s, %s&quot;, u, count=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;RESTOREF %s, %s&qu=
ot;, u, count);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12538,7 +12928,9 @@ static const char *ROTR(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ROTR %s, %s, %s&quot;, rt, rs, =
shift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ROTR %s, %s, %s&qu=
ot;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12590,8 +12982,12 @@ static const char *ROTX(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shiftx =3D IMMEDIATE(copy(shiftx_value=
));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *stripe =3D IMMEDIATE(copy(stripe_value=
));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;ROTX %s, %s, %s, %s, %s&quot;,<=
br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;ROTX %s, %s, %s, %=
s, %s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rt, rs, shi=
ft, shiftx, stripe);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shiftx);<br>
+&nbsp;&nbsp;&nbsp; free((char *)stripe);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12744,8 +13140,13 @@ static const char *SAVE_16_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; uint64 count_value =3D extract_count_3_2_1_0(instr=
uction);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SAVE %s%s&quot;, u,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_restore_list(encode_rt1_fr=
om_rt(rt1_value), count_value, 0));<br>
+&nbsp;&nbsp;&nbsp; const char *save_restore_str =3D save_restore_list(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encode_rt1_from_rt(rt1_value), =
count_value, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SAVE %s%s&quot;, u=
, save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12767,8 +13168,13 @@ static const char *SAVE_32_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; uint64 gp_value =3D extract_gp_2(instruction);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SAVE %s%s&quot;, u,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; save_restore_list(rt_value, count_value, gp_value));<br>
+&nbsp;&nbsp;&nbsp; const char *save_restore_str =3D save_restore_list(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rt_value, count_value, gp_value=
);<br>
+<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SAVE %s%s&quot;, u=
, save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)save_restore_str);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12790,7 +13196,10 @@ static const char *SAVEF(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count =3D IMMEDIATE(copy(count_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SAVEF %s, %s&quot;, u, count);<=
br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SAVEF %s, %s&quot;=
, u, count);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12814,7 +13223,9 @@ static const char *SB_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SB %s, %s(%s)&quot;, rtz3, u, r=
s3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SB %s, %s(%s)&quot=
;, rtz3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12836,7 +13247,9 @@ static const char *SB_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SB %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SB %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12860,7 +13273,9 @@ static const char *SB_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SB %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SB %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12884,7 +13299,9 @@ static const char *SB_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SB %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SB %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12908,7 +13325,9 @@ static const char *SBE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SBE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SBE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12956,7 +13375,9 @@ static const char *SC(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SC %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SC %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -12980,7 +13401,9 @@ static const char *SCD(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SCD %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SCD %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13028,7 +13451,9 @@ static const char *SCE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SCE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SCE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13098,7 +13523,9 @@ static const char *SD_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SD %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SD %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13122,7 +13549,9 @@ static const char *SD_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SD %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SD %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13146,7 +13575,9 @@ static const char *SD_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SD %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SD %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13166,7 +13597,9 @@ static const char *SDBBP_16_(uint64 instruction)<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDBBP %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDBBP %s&quot;, co=
de);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13186,7 +13619,9 @@ static const char *SDBBP_32_(uint64 instruction)<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDBBP %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDBBP %s&quot;, co=
de);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13208,7 +13643,9 @@ static const char *SDC1_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDC1 %s, %s($%d)&quot;, ft, u, =
28);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDC1 %s, %s($%d)&q=
uot;, ft, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13232,7 +13669,9 @@ static const char *SDC1_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDC1 %s, %s(%s)&quot;, ft, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDC1 %s, %s(%s)&qu=
ot;, ft, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13256,7 +13695,9 @@ static const char *SDC1_U12_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDC1 %s, %s(%s)&quot;, ft, u, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDC1 %s, %s(%s)&qu=
ot;, ft, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13328,7 +13769,9 @@ static const char *SDC2(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDC2 %s, %s(%s)&quot;, cs, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDC2 %s, %s(%s)&qu=
ot;, cs, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13354,7 +13797,10 @@ static const char *SDM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDM %s, %s(%s), %s&quot;, rt, s=
, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDM %s, %s(%s), %s=
&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13376,7 +13822,9 @@ static const char *SDPC_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 6);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SDPC %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SDPC %s, %s&quot;,=
 rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13636,7 +14084,9 @@ static const char *SEQI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SEQI %s, %s, %s&quot;, rt, rs, =
u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SEQI %s, %s, %s&qu=
ot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13660,7 +14110,9 @@ static const char *SH_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SH %s, %s(%s)&quot;, rtz3, u, r=
s3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SH %s, %s(%s)&quot=
;, rtz3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13682,7 +14134,9 @@ static const char *SH_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SH %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SH %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13706,7 +14160,9 @@ static const char *SH_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SH %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SH %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13730,7 +14186,9 @@ static const char *SH_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SH %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SH %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13754,7 +14212,9 @@ static const char *SHE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13776,7 +14236,9 @@ static const char *SHILO(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ac =3D AC(copy(ac_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHILO %s, %s&quot;, ac, shift);=
<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHILO %s, %s&quot;=
, ac, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13822,7 +14284,9 @@ static const char *SHLL_PH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHLL.PH %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHLL.PH %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13846,7 +14310,9 @@ static const char *SHLL_QB(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHLL.QB %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHLL.QB %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13871,7 +14337,9 @@ static const char *SHLL_S_PH(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHLL_S.PH %s, %s, %s&quot;, rt,=
 rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHLL_S.PH %s, %s, =
%s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -13895,7 +14363,9 @@ static const char *SHLL_S_W(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHLL_S.W %s, %s, %s&quot;, rt, =
rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHLL_S.W %s, %s, %=
s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14017,7 +14487,9 @@ static const char *SHRA_PH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRA.PH %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRA.PH %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14041,7 +14513,9 @@ static const char *SHRA_QB(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRA.QB %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRA.QB %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14065,7 +14539,9 @@ static const char *SHRA_R_PH(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRA_R.PH %s, %s, %s&quot;, rt,=
 rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRA_R.PH %s, %s, =
%s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14089,7 +14565,9 @@ static const char *SHRA_R_QB(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRA_R.QB %s, %s, %s&quot;, rt,=
 rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRA_R.QB %s, %s, =
%s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14113,7 +14591,9 @@ static const char *SHRA_R_W(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRA_R.W %s, %s, %s&quot;, rt, =
rs, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRA_R.W %s, %s, %=
s&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14257,7 +14737,9 @@ static const char *SHRL_PH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRL.PH %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRL.PH %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14281,7 +14763,9 @@ static const char *SHRL_QB(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *sa =3D IMMEDIATE(copy(sa_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SHRL.QB %s, %s, %s&quot;, rt, r=
s, sa);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SHRL.QB %s, %s, %s=
&quot;, rt, rs, sa);<br>
+&nbsp;&nbsp;&nbsp; free((char *)sa);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14398,7 +14882,9 @@ static const char *SIGRIE(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SIGRIE %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SIGRIE %s&quot;, c=
ode);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14422,7 +14908,9 @@ static const char *SLL_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift3 =3D IMMEDIATE(encode_shift3_fro=
m_shift(shift3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SLL %s, %s, %s&quot;, rt3, rs3,=
 shift3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SLL %s, %s, %s&quo=
t;, rt3, rs3, shift3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14446,7 +14934,9 @@ static const char *SLL_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SLL %s, %s, %s&quot;, rt, rs, s=
hift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SLL %s, %s, %s&quo=
t;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14518,7 +15008,9 @@ static const char *SLTI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SLTI %s, %s, %s&quot;, rt, rs, =
u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SLTI %s, %s, %s&qu=
ot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14542,7 +15034,9 @@ static const char *SLTIU(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SLTIU %s, %s, %s&quot;, rt, rs,=
 u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SLTIU %s, %s, %s&q=
uot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14610,7 +15104,9 @@ static const char *SPECIAL2(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *op =3D IMMEDIATE(copy(op_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SPECIAL2 %s&quot;, op);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SPECIAL2 %s&quot;,=
 op);<br>
+&nbsp;&nbsp;&nbsp; free((char *)op);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14678,7 +15174,9 @@ static const char *SRA(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SRA %s, %s, %s&quot;, rt, rs, s=
hift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SRA %s, %s, %s&quo=
t;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14726,7 +15224,9 @@ static const char *SRL_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift3 =3D IMMEDIATE(encode_shift3_fro=
m_shift(shift3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SRL %s, %s, %s&quot;, rt3, rs3,=
 shift3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SRL %s, %s, %s&quo=
t;, rt3, rs3, shift3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -14750,7 +15250,9 @@ static const char *SRL_32_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *shift =3D IMMEDIATE(copy(shift_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SRL %s, %s, %s&quot;, rt, rs, s=
hift);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SRL %s, %s, %s&quo=
t;, rt, rs, shift);<br>
+&nbsp;&nbsp;&nbsp; free((char *)shift);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15240,7 +15742,9 @@ static const char *SW_16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs3 =3D GPR(decode_gpr_gpr3(rs3_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s(%s)&quot;, rtz3, u, r=
s3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s(%s)&quot=
;, rtz3, u, rs3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15264,7 +15768,9 @@ static const char *SW_4X4_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs4 =3D GPR(decode_gpr_gpr4(rs4_value)=
);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s(%s)&quot;, rtz4, u, r=
s4);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s(%s)&quot=
;, rtz4, u, rs4);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15286,7 +15792,9 @@ static const char *SW_GP16_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rtz3 =3D GPR(decode_gpr_gpr3_src_store=
(rtz3_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s($%d)&quot;, rtz3, u, =
28);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s($%d)&quo=
t;, rtz3, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15308,7 +15816,9 @@ static const char *SW_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s($%d)&quot;, rt, u, 28=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s($%d)&quo=
t;, rt, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15332,7 +15842,9 @@ static const char *SW_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s(%s)&quot;, rt, s, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s(%s)&quot=
;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15354,7 +15866,9 @@ static const char *SW_SP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s($%d)&quot;, rt, u, 29=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s($%d)&quo=
t;, rt, u, 29);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15378,7 +15892,9 @@ static const char *SW_U12_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SW %s, %s(%s)&quot;, rt, u, rs)=
;<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SW %s, %s(%s)&quot=
;, rt, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15400,7 +15916,9 @@ static const char *SWC1_GP_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *ft =3D FPR(copy(ft_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWC1 %s, %s($%d)&quot;, ft, u, =
28);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWC1 %s, %s($%d)&q=
uot;, ft, u, 28);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15424,7 +15942,9 @@ static const char *SWC1_S9_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWC1 %s, %s(%s)&quot;, ft, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWC1 %s, %s(%s)&qu=
ot;, ft, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15448,7 +15968,9 @@ static const char *SWC1_U12_(uint64 instruction)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWC1 %s, %s(%s)&quot;, ft, u, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWC1 %s, %s(%s)&qu=
ot;, ft, u, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15520,7 +16042,9 @@ static const char *SWC2(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWC2 %s, %s(%s)&quot;, cs, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWC2 %s, %s(%s)&qu=
ot;, cs, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15544,7 +16068,9 @@ static const char *SWE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWE %s, %s(%s)&quot;, rt, s, rs=
);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWE %s, %s(%s)&quo=
t;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15570,7 +16096,10 @@ static const char *SWM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWM %s, %s(%s), %s&quot;, rt, s=
, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWM %s, %s(%s), %s=
&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15592,7 +16121,9 @@ static const char *SWPC_48_(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D ADDRESS(encode_s_from_address(s_=
value), 6);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SWPC %s, %s&quot;, rt, s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SWPC %s, %s&quot;,=
 rt, s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15660,7 +16191,9 @@ static const char *SYNC(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *stype =3D IMMEDIATE(copy(stype_value))=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SYNC %s&quot;, stype);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SYNC %s&quot;, sty=
pe);<br>
+&nbsp;&nbsp;&nbsp; free((char *)stype);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15682,7 +16215,9 @@ static const char *SYNCI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SYNCI %s(%s)&quot;, s, rs);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SYNCI %s(%s)&quot;=
, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15704,7 +16239,9 @@ static const char *SYNCIE(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SYNCIE %s(%s)&quot;, s, rs);<br=
>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SYNCIE %s(%s)&quot=
;, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15724,7 +16261,9 @@ static const char *SYSCALL_16_(uint64 instruction)<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SYSCALL %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SYSCALL %s&quot;, =
code);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15742,7 +16281,9 @@ static const char *SYSCALL_32_(uint64 instruction)<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;SYSCALL %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;SYSCALL %s&quot;, =
code);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15782,7 +16323,7 @@ static const char *TLBGINV(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGINV &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGINV &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15800,7 +16341,7 @@ static const char *TLBGINVF(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGINVF &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGINVF &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15818,7 +16359,7 @@ static const char *TLBGP(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGP &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGP &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15836,7 +16377,7 @@ static const char *TLBGR(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGR &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGR &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15854,7 +16395,7 @@ static const char *TLBGWI(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGWI &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGWI &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15872,7 +16413,7 @@ static const char *TLBGWR(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBGWR &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBGWR &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15890,7 +16431,7 @@ static const char *TLBINV(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBINV &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBINV &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15908,7 +16449,7 @@ static const char *TLBINVF(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBINVF &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBINVF &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15926,7 +16467,7 @@ static const char *TLBP(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBP &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBP &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15944,7 +16485,7 @@ static const char *TLBR(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBR &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBR &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15962,7 +16503,7 @@ static const char *TLBWI(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBWI &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBWI &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -15980,7 +16521,7 @@ static const char *TLBWR(uint64 instruction)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; (void)instruction;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return &quot;TLBWR &quot;;<br>
+&nbsp;&nbsp;&nbsp; return strdup(&quot;TLBWR &quot;);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16116,7 +16657,10 @@ static const char *UALDM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UALDM %s, %s(%s), %s&quot;, rt,=
 s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UALDM %s, %s(%s), =
%s&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16140,7 +16684,9 @@ static const char *UALH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UALH %s, %s(%s)&quot;, rt, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UALH %s, %s(%s)&qu=
ot;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16166,7 +16712,10 @@ static const char *UALWM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UALWM %s, %s(%s), %s&quot;, rt,=
 s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UALWM %s, %s(%s), =
%s&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16192,7 +16741,10 @@ static const char *UASDM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UASDM %s, %s(%s), %s&quot;, rt,=
 s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UASDM %s, %s(%s), =
%s&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16216,7 +16768,9 @@ static const char *UASH(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *s =3D IMMEDIATE(copy(s_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UASH %s, %s(%s)&quot;, rt, s, r=
s);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UASH %s, %s(%s)&qu=
ot;, rt, s, rs);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16242,7 +16796,10 @@ static const char *UASWM(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *count3 =3D IMMEDIATE(encode_count3_fro=
m_count(count3_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UASWM %s, %s(%s), %s&quot;, rt,=
 s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UASWM %s, %s(%s), =
%s&quot;, rt, s, rs, count3);<br>
+&nbsp;&nbsp;&nbsp; free((char *)s);<br>
+&nbsp;&nbsp;&nbsp; free((char *)count3);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16262,7 +16819,9 @@ static const char *UDI(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *op =3D IMMEDIATE(copy(op_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;UDI %s&quot;, op);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;UDI %s&quot;, op);=
<br>
+&nbsp;&nbsp;&nbsp; free((char *)op);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16280,7 +16839,9 @@ static const char *WAIT(uint64 instruction)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *code =3D IMMEDIATE(copy(code_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;WAIT %s&quot;, code);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;WAIT %s&quot;, cod=
e);<br>
+&nbsp;&nbsp;&nbsp; free((char *)code);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16302,7 +16863,9 @@ static const char *WRDSP(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rt =3D GPR(copy(rt_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *mask =3D IMMEDIATE(copy(mask_value));<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;WRDSP %s, %s&quot;, rt, mask);<=
br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;WRDSP %s, %s&quot;=
, rt, mask);<br>
+&nbsp;&nbsp;&nbsp; free((char *)mask);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
@@ -16394,7 +16957,9 @@ static const char *XORI(uint64 instruction)<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *rs =3D GPR(copy(rs_value));<br>
&nbsp;&nbsp;&nbsp;&nbsp; const char *u =3D IMMEDIATE(copy(u_value));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; return img_format(&quot;XORI %s, %s, %s&quot;, rt, rs, =
u);<br>
+&nbsp;&nbsp;&nbsp; const char *ret =3D img_format(&quot;XORI %s, %s, %s&qu=
ot;, rt, rs, u);<br>
+&nbsp;&nbsp;&nbsp; free((char *)u);<br>
+&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR03MB6045A14C1F14283954736B04F8759VE1PR03MB6045eurp_--

