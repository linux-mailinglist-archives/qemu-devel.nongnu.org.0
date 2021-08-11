Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FA3E8B64
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:04:28 +0200 (CEST)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjDv-0001lX-2L
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mDjCj-0000yP-NM
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:03:14 -0400
Received: from mail-mw2nam12on20605.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::605]:61960
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mDjCg-0005gC-7i
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:03:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuhkW8Bn+B51h3kMDVwtlOwOTG9LW2hxOCG1l45hBgGIghPcr+F1l7iB0GlsKTZKQvsUajHBHi81kqesU1btXxVkUJrA/qpqGjYOako1NPwj47TGZA8Y2K4LbN+tCTi9deAZIt8nFOSmgFENyAa3PSaG4hDer9fvcNk8ATBfY93tcRb1B06ppd2FfV8YJ+m5FrG6VxoRB7E+npLWq32xYLrAfhsMMndgP96CjWJGGU4NY0yiW7O89YPEiiAV59P8m9LxkAFXqE9QGgUqddHy2Tcnv5C90JR2qMYnwmUb06SzeGM6d6irNh+U+kjWsBCjaDuSI2pZiBy9gmmQE27hoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEeqm3G3UqWvWFBLTNg+jSMWCZSjylpBBg/Isqkgzkg=;
 b=H3yMNtBOAzKTGvEslyL2l1ngQ+gQxsPgHWL9s1EkZwxI2sgGmh+VDaASdptffFoSLHTQIH7Er+YFrCfzWduWp3znKEMH9nKbLjOYlMkfEfK61GklA3VBAv947i1Z6ZtAexQGjjgj78fVHxcHcIP1zX//oG2Rhi1UCqcGs2331reaQrC/MvmdPmf3eRh3ry19AvnldjBaKMFX+9+gRNeft7MruRckAoazonIo5hzw4gQIZeGRrqxVdh/GLpfRn0f8Pza5SBCpgX/02/OB/eLzKnuuehnQ1bIclpTiRZvC7+3zBYZFpUPFbleI3DHkTTN5NpNbybXHzaba7cvDxHhFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEeqm3G3UqWvWFBLTNg+jSMWCZSjylpBBg/Isqkgzkg=;
 b=pCTAIkZ0qCxXg6A+KjDb0Boh1aF/0z955+HjR1yOKZBa4ruAoTmJaeKtBHIqsZ3dQsb+xjFyFsEYiFoF8LmP79e+uea3uZUULbYsP1Br1TCZc1U5oITuic+9uVGseZWYNEnIbFlFViYcu5MOzbkGsQt4EmTQ4ZJQ2NJ27xhEJgS+0IOtWhqVc+B51rwqFEnsOGCtZ4FFv8oaAkOZWCzzPoStnXaoIrw5Lx29BQMMF6nk4CR9VwjElr+B5OIluDYYPSGeXs7Oq5Out+zK1tgJHgjaWkCFEreNMJ7DuVhYazZJHFHNfoAOkA3sYOvRliIsbCrC/cz4cwoLHpXdWJqaxA==
Received: from BYAPR12MB3192.namprd12.prod.outlook.com (2603:10b6:a03:139::14)
 by BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Wed, 11 Aug
 2021 07:58:03 +0000
Received: from BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::1d3d:e561:a8a3:15f3]) by BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::1d3d:e561:a8a3:15f3%5]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 07:58:03 +0000
To: =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Use EGL device extension in display initialization.
Thread-Topic: [PATCH] Use EGL device extension in display initialization.
Thread-Index: AdeKO1v5rK+V8M0rTaC/cxjh3v6BbgAWL2gAAPxdKeA=
Date: Wed, 11 Aug 2021 07:58:02 +0000
Message-ID: <BYAPR12MB3192EC20271BF35444CE2FF3D9F89@BYAPR12MB3192.namprd12.prod.outlook.com>
References: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
 <CAJ+F1CJGfZBR69gfO4kGxvh73=JRX-w2knZ-AemCoK3pit7XOw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJGfZBR69gfO4kGxvh73=JRX-w2knZ-AemCoK3pit7XOw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8102c7cd-a6c7-4f7c-7235-08d95c9dbedb
x-ms-traffictypediagnostic: BY5PR12MB3891:
x-microsoft-antispam-prvs: <BY5PR12MB389176C1D1944CE6A43C2321D9F89@BY5PR12MB3891.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSJhGS1APdYWmp5iVFO/rX60Lb+u5WIkxQlj0/xv41VHcDaOPcGg1WHW3iXNkh50CGpKTvlsB4eO01ds9508oO2+q6ozsskRtOGom0Da/SS4rZbgaz6PXaHxH9oMelBZnAfntQEVzI0uA1p773XyuxtMOfF8qzExalhijJjQ7hd/V6NXg2EF/omvHXDYVXyFXSmaLO42ca2aFahJoeqWzDdrv5vg/vOyjjC+ihBrHWFEBgEx1CTzi4laMRqHmtE0Sg0dlE8MMa3oCDbEJzG64QJ2nzBDHBeT3/jQJ+BzM+DcRoHclSx14V+hj2qu7FzVhqKn4oyZyk0VMdxfop6LOaxCaw6Gt6I33Dl+FjQVqKO+dK3GTPrzNLSlSHsNjjeH+YxIKSnERXUJ+f6p/6J+AqNm6/QdmnX84pSv/6+cz3vWeZwkeNaK3LoYBsmtHc26LZvpDuy1MHQEo5fdvqS3ZFJZADRVmuZZMmsS1w0VmjL82oC9zhQsvQuD4YuRi/HDRSDInZhpUyX4s6FiY88+VPmZimtbBRe/DUZMbQvw7gSUIh5KWK2rEgo5D5mcuOBK7Eqj1Eg2pisPtbF2Pif2AyQwIVOVGGbVI0AAihVIwcQOg1S4yCHNrVjTW98RjXvu0CD0hcUvMfnn8gARAThXquIy1XlCM/XiqoM4sWgaKVORKa+C5dD1lHpfVycGlxXAO4wibFCwvsAAHpFi7yZMX6/dLDQR0LBlcDA8D22ZCfVOBhsf8muj2HaLkAczpGpR9cjNsk+LYuT4OdsTsYzB3BqJu+Q/OozpRYaGclYuZhu0tn6nHy359LcpH4ZCciog
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(9686003)(55016002)(186003)(4326008)(66446008)(166002)(86362001)(316002)(33656002)(8936002)(2906002)(66576008)(66476007)(6506007)(122000001)(83380400001)(7696005)(76116006)(66946007)(8676002)(99936003)(53546011)(6916009)(66556008)(38100700002)(71200400001)(38070700005)(26005)(5660300002)(52536014)(45080400002)(64756008)(478600001)(9326002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DaEStIV/9SWyoADcFyXpGLaCdZthNyVsi4U1MQJNyRHceyILQ4DVeRqmrM?=
 =?iso-8859-1?Q?U/wKXp9eccVZI4+tgRqK3W+sRt7JblH/STBYLprPJfmiU9hExlZSzK6nHT?=
 =?iso-8859-1?Q?v+sgQrK/1wBrXh9FJVg70QkOy3FTwZOdBIuG6luXtmVmoJv347EP4Kn8c6?=
 =?iso-8859-1?Q?wS80KSrnIpwak4zguHsHLEPNviD65xJLTazaMH/AQWl1gfQKspnztM4X0x?=
 =?iso-8859-1?Q?JB8fU1IwdEGuCw/D4nKTp6GhfxXNZe4haKeH5vdzT9dlCCxl3DPV11tHHZ?=
 =?iso-8859-1?Q?XJZo7kak5dhX5VNnGUMoPPlKSyP+DBrmoTstIGJ+ODJXUNX/oDecuMCqMh?=
 =?iso-8859-1?Q?Pe7lBuvtjCF/uyByv20+71/KxfDuTshYevT3YPihXKQ0wVG+3N2/TQgM9T?=
 =?iso-8859-1?Q?OUYTbvxWkUTQ6cxtfcPS2O5s4YiHcSrUiNBOk7sHSAO7PLhg6vOfKBSqR8?=
 =?iso-8859-1?Q?x1VO+34c+NC8aX9kxMN7f3lVObApoHm3ZlOM1PNHuiEk6lYkE1XQtYQlTV?=
 =?iso-8859-1?Q?Mf7cLRrmg//ZKkk2Yze/NO4uoHoPVyx0YdcuxikjqIDETYrtPR1O17gWlS?=
 =?iso-8859-1?Q?og/UJm9XjWWkSOnES324lgOmq04x+Gbok/pAbRSlm2NV6q96XRtEuDKRdk?=
 =?iso-8859-1?Q?zdMB2PPkcBYeQ+7/LDxdfJ7w8GQQrj1PpO1KJGniDL1mXL8cIlescJm57k?=
 =?iso-8859-1?Q?vEb/Ezd3vhrjeSUM4bYRLPwDrq6XIZuuujhSQCCaDxTGoFjtaMRid9CVyH?=
 =?iso-8859-1?Q?FYFTlKYttWqjJyXnSEOtL9RwPqFy9nQbiNKEk1FKDWLieuQWJ0ITPzF3eF?=
 =?iso-8859-1?Q?GV0OMDQTJ9OYkht9AsSAebrT2C9b4T9e+Ij1B96/FhUSowlP7mkOn/xORR?=
 =?iso-8859-1?Q?Tn0iEx6EucMLFJXWsH33hvUwmJ1abEdy1iq39yRT+Lb+rXHXT+71w5TD3z?=
 =?iso-8859-1?Q?8DcwwdKqp/ngnrSxsPDCucXdpF7t+/otGZvCVhHcVy9aHTSZe5IRf/Ejwv?=
 =?iso-8859-1?Q?2XHr2qO7kcjuoPLapNYyfe2Zklyc+qa9V1whMKEm+tJNqXerZ/fetpd3Pk?=
 =?iso-8859-1?Q?pDya+1L8m2O91aNjzZ3ozZnlFGBSC5UhGheX6CHKCujUVwEOHbGh1xPHM6?=
 =?iso-8859-1?Q?EznuCpIKI5SuXPHVTs5Pv+guUUsmdqqxk5yzNRj5M0Gnd+IPNJEDgmbxB4?=
 =?iso-8859-1?Q?I8wmvnMzjg9dCBq69pwWNFqtuPh0enRFoM7Ypve8OA76rDX3CMC3EgYogW?=
 =?iso-8859-1?Q?hvK4Slbay6vuT/xyOYQVAaAMNl5p3fLWZkKa+qrD8/DaGiEkTe4+OnBL0y?=
 =?iso-8859-1?Q?wOnS4IKwMHc7do1aiWwxSgSyD6KVEOMzExGuJaukqjTiGyK7qlPcvQwpAs?=
 =?iso-8859-1?Q?cosk6FEQmg?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_005_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8102c7cd-a6c7-4f7c-7235-08d95c9dbedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 07:58:03.0040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL28qVPccJXjZRv+VYDYod8xPHfDuZd0UdxWr726zeJPHCw9Bd3k9yGlnDAG2sygX5cPxbj1PBGuL1jTrrYBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3891
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::605;
 envelope-from=eugeneh@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Eugene Huang <eugeneh@nvidia.com>
From:  Eugene Huang via <qemu-devel@nongnu.org>

--_005_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_"

--_000_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have had some hard time to set up git send-email. I am not even sure if i=
t is doable here. I read that attachments can be used a last resort for fir=
st timers. Here are the attachments. Hope it works.

Thanks,
Eugene

From: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com>
Sent: Friday, August 6, 2021 12:25 AM
To: Eugene Huang <eugeneh@nvidia.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] Use EGL device extension in display initialization.

External email: Use caution opening links or attachments

Hi

On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang <eugeneh@nvidia.com<mailto:euge=
neh@nvidia.com>> wrote:

This patch enables running generic EGL devices such as Nvidia's in headless=
 mode. It assumes single device. More work is needed to support multiple de=
vices.



Signed-off-by: Eugene Huang <eugeneh@nvidia.com<mailto:eugeneh@nvidia.com>>

Thanks for the patch. It isn't correctly formatted and git apply fails  (ht=
tps://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192=
.namprd12.prod.outlook.com/<https://nam11.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB319275649A1403C254A9EA43=
D9F29%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&data=3D04%7C01%7Ceugeneh=
%40nvidia.com%7C2d1240b866904cc7971308d958ab4471%7C43083d15727340c1b7db39ef=
d9ccc17a%7C0%7C0%7C637638314899347574%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DEsDRdt=
G01ja1P9NDZG8ScE7SgC8ZILFS6p%2B9mGoklnY%3D&reserved=3D0>). Please use git s=
end-email.


---

ui/egl-helpers.c | 41 +++++++++++++++++++++++++++++++++++++----

1 file changed, 37 insertions(+), 4 deletions(-)



diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c

index 7c530c2825..c11610c083 100644

--- a/ui/egl-helpers.c

+++ b/ui/egl-helpers.c

@@ -1,6 +1,8 @@

/*

  * Copyright (C) 2015-2016 Gerd Hoffmann <kraxel@redhat.com<mailto:kraxel@=
redhat.com>>

  *

+ * Copyright (c) 2021, NVIDIA CORPORATION & AFFILIATES. All rights reserve=
d.

+ *

  * This library is free software; you can redistribute it and/or

  * modify it under the terms of the GNU Lesser General Public

  * License as published by the Free Software Foundation; either

@@ -349,11 +351,26 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDispl=
ayType native,

     EGLDisplay dpy =3D EGL_NO_DISPLAY;

     /* In practise any EGL 1.5 implementation would support the EXT extens=
ion */

-    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {

+    if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")

+        && epoxy_has_egl_extension(NULL, "EGL_EXT_platform_device")

+        && (epoxy_has_egl_extension(NULL, "EGL_EXT_device_base")

+        || epoxy_has_egl_extension(NULL, "EGL_EXT_device_enumeration"))) {

         PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =3D

             (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");

         if (getPlatformDisplayEXT && platform !=3D 0) {

-            dpy =3D getPlatformDisplayEXT(platform, native, NULL);

+            if (platform =3D=3D EGL_PLATFORM_DEVICE_EXT) {

+                static const int MAX_DEVICES =3D 4;

+                EGLDeviceEXT eglDevs[MAX_DEVICES];

+                EGLint numDevices;

+

+                PFNEGLQUERYDEVICESEXTPROC eglQueryDevicesEXT =3D

+                    (PFNEGLQUERYDEVICESEXTPROC)

+                eglGetProcAddress("eglQueryDevicesEXT");

+                eglQueryDevicesEXT(MAX_DEVICES, eglDevs, &numDevices);

+                dpy =3D getPlatformDisplayEXT(platform, eglDevs[0], 0);

Given that the function has a lengthy comment to explain it, and this is qu=
ite archaic stuff, I think you should update the comments with your additio=
ns.


+            } else {

+                dpy =3D getPlatformDisplayEXT(platform, native, NULL);

+            }

         }

     }

@@ -386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,

         EGL_ALPHA_SIZE, 0,

         EGL_NONE,

     };

+

+    static const EGLint conf_att_pbuffer[] =3D {

+        EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,

+        EGL_RED_SIZE, 8,

+        EGL_GREEN_SIZE, 8,

+        EGL_BLUE_SIZE, 8,

+        EGL_DEPTH_SIZE, 1,

+        EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,

+        EGL_NONE

+    };

+

     EGLint major, minor;

     EGLBoolean b;

     EGLint n;

@@ -411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNativeDisplayType dpy,

     }

     b =3D eglChooseConfig(qemu_egl_display,

-                        gles ? conf_att_gles : conf_att_core,

-                        &qemu_egl_config, 1, &n);

+        gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_EXT ? =
conf_att_pbuffer : conf_att_core),

+        &qemu_egl_config, 1, &n);

     if (b =3D=3D EGL_FALSE || n !=3D 1) {

         error_report("egl: eglChooseConfig failed (%s mode)",

                      gles ? "gles" : "core");

@@ -434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, Di=
splayGLMode mode)

 int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)

{

+    // Try EGL Device Extension

+    if (qemu_egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) {

+        return 0;

+    }

+

#ifdef EGL_MESA_platform_gbm

     return qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);

#else

--

2.17.1



thanks

--
Marc-Andr=E9 Lureau

--_000_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.gmail-m-5372014696273679682msoplaintext, li.gmail-m-5372014696273679682ms=
oplaintext, div.gmail-m-5372014696273679682msoplaintext
	{mso-style-name:gmail-m_-5372014696273679682msoplaintext;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have had some hard time to set up git send-email. =
I am not even sure if it is doable here. I read that attachments can be use=
d a last resort for first timers. Here are the attachments. Hope it works.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Eugene<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Marc-Andr=E9 Lureau &lt;marcandre.lurea=
u@gmail.com&gt; <br>
<b>Sent:</b> Friday, August 6, 2021 12:25 AM<br>
<b>To:</b> Eugene Huang &lt;eugeneh@nvidia.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org<br>
<b>Subject:</b> Re: [PATCH] Use EGL device extension in display initializat=
ion.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"1" cellpadding=3D"0" style=3D"bac=
kground:#FFEB9C">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:black">External email: Use caution opening l=
inks or attachments</span></b><span style=3D"font-size:7.5pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:black">
</span><o:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Aug 6, 2021 at 2:28 AM Eugene Huang &lt;<a h=
ref=3D"mailto:eugeneh@nvidia.com">eugeneh@nvidia.com</a>&gt; wrote:<o:p></o=
:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m-5372014696273679682msoplaintext">This patch enables run=
ning generic EGL devices such as Nvidia&#8217;s in headless mode. It assume=
s single device. More work is needed to support multiple devices.<o:p></o:p=
></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext">&nbsp;<o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">Signed-off-by: Eugene Huang &=
lt;<a href=3D"mailto:eugeneh@nvidia.com" target=3D"_blank">eugeneh@nvidia.c=
om</a>&gt;</span><o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the patch. It isn't correctly formatted a=
nd git apply fails&nbsp; (<a href=3D"https://nam11.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2FQEMU%2FBYAPR12MB319275649A1403C=
254A9EA43D9F29%40BYAPR12MB3192.namprd12.prod.outlook.com%2F&amp;data=3D04%7=
C01%7Ceugeneh%40nvidia.com%7C2d1240b866904cc7971308d958ab4471%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C637638314899347574%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DEsDRdtG01ja1P9NDZG8ScE7SgC8ZILFS6p%2B9mGoklnY%3D&amp;reserved=3D=
0">https://patchew.org/QEMU/BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12M=
B3192.namprd12.prod.outlook.com/</a>).
 Please use git send-email.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">---</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">ui/egl-helpers.c | 41 +++++++=
++++++++++++++++++++++++++++++----</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">1 file changed, 37 insertions=
(+), 4 deletions(-)</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">diff --git a/ui/egl-helpers.c=
 b/ui/egl-helpers.c</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">index 7c530c2825..c11610c083 =
100644</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">--- a/ui/egl-helpers.c</span>=
<o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+++ b/ui/egl-helpers.c</span>=
<o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">@@ -1,6 +1,8 @@</span><o:p></=
o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">/*</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp; * Copyright (C) 2015-2=
016 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp; *</span><o:p></o:p></p=
>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+ * Copyright (c) 2021, NVIDI=
A CORPORATION &amp; AFFILIATES. All rights reserved.</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+ *</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp; * This library is free=
 software; you can redistribute it and/or</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp; * modify it under the =
terms of the GNU Lesser General Public</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp; * License as published=
 by the Free Software Foundation; either</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">@@ -349,11 +351,26 @@ static =
EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,</span><o:p></o=
:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLD=
isplay dpy =3D EGL_NO_DISPLAY;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;/* In practise any EGL 1.5 implementation would support the EXT extension =
*/</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">-&nbsp;&nbsp;&nbsp; if (epoxy=
_has_egl_extension(NULL, &quot;EGL_EXT_platform_base&quot;)) {</span><o:p><=
/o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; if (epoxy=
_has_egl_extension(NULL, &quot;EGL_EXT_platform_base&quot;)</span><o:p></o:=
p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &amp;&amp; epoxy_has_egl_extension(NULL, &quot;EGL_EXT_platf=
orm_device&quot;)</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &amp;&amp; (epoxy_has_egl_extension(NULL, &quot;EGL_EXT_devi=
ce_base&quot;)</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; || epoxy_has_egl_extension(NULL, &quot;EGL_EXT_device_enumer=
ation&quot;))) {</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =
=3D</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void *) eglGetProcAddress(&quo=
t;eglGetPlatformDisplayEXT&quot;);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (getPlatformDisplayEXT &amp;&amp; platform !=3D 0) {=
</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platfo=
rm, native, NULL);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (platform =3D=3D EGL_PLATFORM_DEV=
ICE_EXT) {</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const=
 int MAX_DEVICES =3D 4;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGLDeviceEXT=
 eglDevs[MAX_DEVICES];</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGLint numDe=
vices;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PFNEGLQUERYD=
EVICESEXTPROC eglQueryDevicesEXT =3D</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; (PFNEGLQUERYDEVICESEXTPROC)</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eglGetProcAd=
dress(&quot;eglQueryDevicesEXT&quot;);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eglQueryDevi=
cesEXT(MAX_DEVICES, eglDevs, &amp;numDevices);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D getP=
latformDisplayEXT(platform, eglDevs[0], 0);</span><o:p></o:p></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Given that the function has a lengthy comment to exp=
lain it, and this is quite archaic stuff, I think you should update the com=
ments with your additions.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D getP=
latformDisplayEXT(platform, native, NULL);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; }</s=
pan><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">@@ -386,6 +403,17 @@ static i=
nt qemu_egl_init_dpy(EGLNativeDisplayType dpy,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; EGL_ALPHA_SIZE, 0,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; EGL_NONE,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; };</=
span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; static co=
nst EGLint conf_att_pbuffer[] =3D {</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_RED_SIZE, 8,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_GREEN_SIZE, 8,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_BLUE_SIZE, 8,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_DEPTH_SIZE, 1,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_RENDERABLE_TYPE, EGL_OPENGL_BIT,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; EGL_NONE</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; };</span>=
<o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLi=
nt major, minor;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLB=
oolean b;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLi=
nt n;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">@@ -411,8 +439,8 @@ static in=
t qemu_egl_init_dpy(EGLNativeDisplayType dpy,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; }</s=
pan><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;b =3D eglChooseConfig(qemu_egl_display,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles ? conf_att_gles : conf_att_core,</=
span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;qemu_egl_config, 1, &amp;n);</span=
><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; gles ? conf_att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_=
EXT ? conf_att_pbuffer : conf_att_core),</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &amp;qemu_egl_config, 1, &amp;n);</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; if (=
b =3D=3D EGL_FALSE || n !=3D 1) {</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; error_report(&quot;egl: eglChooseConfig failed (%s mode=
)&quot;,</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; gles ? &quot;gles&quot; : &quot;core&quot;);</span><=
o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">@@ -434,6 +462,11 @@ int qemu=
_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode)</span><o:p>=
</o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;int qemu_egl_init_dpy_m=
esa(EGLNativeDisplayType dpy, DisplayGLMode mode)</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">{</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; // Try EG=
L Device Extension</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; if (qemu_=
egl_init_dpy(dpy, EGL_PLATFORM_DEVICE_EXT, mode) =3D=3D 0) {</span><o:p></o=
:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return 0;</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp; }</span><=
o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">+</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">#ifdef EGL_MESA_platform_gbm<=
/span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; retu=
rn qemu_egl_init_dpy(dpy, EGL_PLATFORM_GBM_MESA, mode);</span><o:p></o:p></=
p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">#else</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">--
</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">2.17.1</span><o:p></o:p></p>
<p class=3D"gmail-m-5372014696273679682msoplaintext"><span style=3D"font-si=
ze:8.0pt;font-family:&quot;Courier New&quot;">&nbsp;</span><o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">thanks<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Marc-Andr=E9 Lureau<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_--

--_005_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_
Content-Type: application/octet-stream;
	name="0002-Add-comment-for-qemu_egl_get_display.patch"
Content-Description: 0002-Add-comment-for-qemu_egl_get_display.patch
Content-Disposition: attachment;
	filename="0002-Add-comment-for-qemu_egl_get_display.patch"; size=1146;
	creation-date="Wed, 11 Aug 2021 07:49:40 GMT";
	modification-date="Wed, 11 Aug 2021 07:49:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwNWVlZTFmMjFiMjFlNzZjYWM2YjM5MjJmNjk3MWM0ZGUwMjI4OTYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFdWdlbmUgSHVhbmcgPGV1Z2VuZWhAbnZpZGlhLmNvbT4KRGF0
ZTogV2VkLCAxMSBBdWcgMjAyMSAwMDoyMzo1NCAtMDcwMApTdWJqZWN0OiBbUEFUQ0ggMi8yXSBB
ZGQgY29tbWVudCBmb3IgcWVtdV9lZ2xfZ2V0X2Rpc3BsYXkKClNpZ25lZC1vZmYtYnk6IEV1Z2Vu
ZSBIdWFuZyA8ZXVnZW5laEBudmlkaWEuY29tPgotLS0KIHVpL2VnbC1oZWxwZXJzLmMgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS91aS9lZ2wt
aGVscGVycy5jIGIvdWkvZWdsLWhlbHBlcnMuYwppbmRleCBjZTA5NzE0MjJiLi5kZWUzMWM2ZmJi
IDEwMDY0NAotLS0gYS91aS9lZ2wtaGVscGVycy5jCisrKyBiL3VpL2VnbC1oZWxwZXJzLmMKQEAg
LTM0Niw2ICszNDYsMTAgQEAgRUdMU3VyZmFjZSBxZW11X2VnbF9pbml0X3N1cmZhY2VfeDExKEVH
TENvbnRleHQgZWN0eCwgRUdMTmF0aXZlV2luZG93VHlwZSB3aW4pCiAgKiBXZSBjYW4gd29ya2Fy
b3VuZCB0aGlzIChjaXJjdWxhciBkZXBlbmRlbmN5KSBieSBwcm9iaW5nIGZvciB0aGUgRUdMIDEu
NQogICogcGxhdGZvcm0gZXh0ZW5zaW9ucyAoRUdMX0tIUl9wbGF0Zm9ybV9nYm0gYW5kIGZyaWVu
ZHMpIHlldCBpdCBkb2Vzbid0IHNlZW0KICAqIGxpa2UgbWVzYSB3aWxsIGJlIGFibGUgdG8gYWR2
ZXJ0aXNlIHRoZXNlIChldmVuIHRob3VnaCBpdCBjYW4gZG8gRUdMIDEuNSkuCisgKgorICogNS4g
SXQgaXMgd29ydGggYWRkaW5nIGFuIEVHTF9FWFRfcGxhdGZvcm1fZGV2aWNlICYmIChFR0xfRVhU
X2RldmljZV9iYXNlIHx8CisgKiBFR0xfRVhUX2RldmljZV9lbnVtZXJhdGlvbikgZXh0ZW5zaW9u
IGNoZWNrIHdpdGggdGhlIEVHTF9FWFRfcGxhdGZvcm1fYmFzZQorICogY2hlY2sgYmVmb3JlIHVz
aW5nIHRoZSBFR0xEZXZpY2UgZnVuY3Rpb25hbGl0eS4KICAqLwogc3RhdGljIEVHTERpc3BsYXkg
cWVtdV9lZ2xfZ2V0X2Rpc3BsYXkoRUdMTmF0aXZlRGlzcGxheVR5cGUgbmF0aXZlLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUdMZW51bSBwbGF0Zm9ybSkKLS0gCjIu
MTcuMQoK

--_005_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_
Content-Type: application/octet-stream;
	name="0001-Use-EGL-device-extension-in-display-initialization.patch"
Content-Description:  0001-Use-EGL-device-extension-in-display-initialization.patch
Content-Disposition: attachment;
	filename="0001-Use-EGL-device-extension-in-display-initialization.patch";
	size=3746; creation-date="Wed, 11 Aug 2021 07:49:40 GMT";
	modification-date="Wed, 11 Aug 2021 07:49:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMDFmM2MxNmUxMTZkZTAxZDYwNTk1Yzk1NGY0MmQ0MmU5OGNmY2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFdWdlbmUgSHVhbmcgPGV1Z2VuZWhAbnZpZGlhLmNvbT4KRGF0
ZTogRnJpLCA2IEF1ZyAyMDIxIDExOjE3OjQyIC0wNzAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIFVz
ZSBFR0wgZGV2aWNlIGV4dGVuc2lvbiBpbiBkaXNwbGF5IGluaXRpYWxpemF0aW9uLgoKU2lnbmVk
LW9mZi1ieTogRXVnZW5lIEh1YW5nIDxldWdlbmVoQG52aWRpYS5jb20+Ci0tLQogdWkvZWdsLWhl
bHBlcnMuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS91aS9lZ2wtaGVscGVycy5jIGIvdWkvZWdsLWhlbHBlcnMuYwppbmRleCA2ZDBjYjJiNWNi
Li5jZTA5NzE0MjJiIDEwMDY0NAotLS0gYS91aS9lZ2wtaGVscGVycy5jCisrKyBiL3VpL2VnbC1o
ZWxwZXJzLmMKQEAgLTEsNiArMSw4IEBACiAvKgogICogQ29weXJpZ2h0IChDKSAyMDE1LTIwMTYg
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CiAgKgorICogQ29weXJpZ2h0IChjKSAy
MDIxLCBOVklESUEgQ09SUE9SQVRJT04gJiBBRkZJTElBVEVTLiBBbGwgcmlnaHRzIHJlc2VydmVk
LgorICoKICAqIFRoaXMgbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IKICAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBM
ZXNzZXIgR2VuZXJhbCBQdWJsaWMKICAqIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgpAQCAtMzUxLDExICszNTMsMjYgQEAgc3RhdGlj
IEVHTERpc3BsYXkgcWVtdV9lZ2xfZ2V0X2Rpc3BsYXkoRUdMTmF0aXZlRGlzcGxheVR5cGUgbmF0
aXZlLAogICAgIEVHTERpc3BsYXkgZHB5ID0gRUdMX05PX0RJU1BMQVk7CiAKICAgICAvKiBJbiBw
cmFjdGlzZSBhbnkgRUdMIDEuNSBpbXBsZW1lbnRhdGlvbiB3b3VsZCBzdXBwb3J0IHRoZSBFWFQg
ZXh0ZW5zaW9uICovCi0gICAgaWYgKGVwb3h5X2hhc19lZ2xfZXh0ZW5zaW9uKE5VTEwsICJFR0xf
RVhUX3BsYXRmb3JtX2Jhc2UiKSkgeworICAgIGlmIChlcG94eV9oYXNfZWdsX2V4dGVuc2lvbihO
VUxMLCAiRUdMX0VYVF9wbGF0Zm9ybV9iYXNlIikKKyAgICAgICAgJiYgZXBveHlfaGFzX2VnbF9l
eHRlbnNpb24oTlVMTCwgIkVHTF9FWFRfcGxhdGZvcm1fZGV2aWNlIikKKyAgICAgICAgJiYgKGVw
b3h5X2hhc19lZ2xfZXh0ZW5zaW9uKE5VTEwsICJFR0xfRVhUX2RldmljZV9iYXNlIikKKyAgICAg
ICAgfHwgZXBveHlfaGFzX2VnbF9leHRlbnNpb24oTlVMTCwgIkVHTF9FWFRfZGV2aWNlX2VudW1l
cmF0aW9uIikpKSB7CiAgICAgICAgIFBGTkVHTEdFVFBMQVRGT1JNRElTUExBWUVYVFBST0MgZ2V0
UGxhdGZvcm1EaXNwbGF5RVhUID0KICAgICAgICAgICAgICh2b2lkICopIGVnbEdldFByb2NBZGRy
ZXNzKCJlZ2xHZXRQbGF0Zm9ybURpc3BsYXlFWFQiKTsKICAgICAgICAgaWYgKGdldFBsYXRmb3Jt
RGlzcGxheUVYVCAmJiBwbGF0Zm9ybSAhPSAwKSB7Ci0gICAgICAgICAgICBkcHkgPSBnZXRQbGF0
Zm9ybURpc3BsYXlFWFQocGxhdGZvcm0sIG5hdGl2ZSwgTlVMTCk7CisgICAgICAgICAgICBpZiAo
cGxhdGZvcm0gPT0gRUdMX1BMQVRGT1JNX0RFVklDRV9FWFQpIHsKKyAgICAgICAgICAgICAgICBz
dGF0aWMgY29uc3QgaW50IE1BWF9ERVZJQ0VTID0gNDsKKyAgICAgICAgICAgICAgICBFR0xEZXZp
Y2VFWFQgZWdsRGV2c1tNQVhfREVWSUNFU107CisgICAgICAgICAgICAgICAgRUdMaW50IG51bURl
dmljZXM7CisKKyAgICAgICAgICAgICAgICBQRk5FR0xRVUVSWURFVklDRVNFWFRQUk9DIGVnbFF1
ZXJ5RGV2aWNlc0VYVCA9CisgICAgICAgICAgICAgICAgICAgIChQRk5FR0xRVUVSWURFVklDRVNF
WFRQUk9DKQorICAgICAgICAgICAgICAgIGVnbEdldFByb2NBZGRyZXNzKCJlZ2xRdWVyeURldmlj
ZXNFWFQiKTsKKyAgICAgICAgICAgICAgICBlZ2xRdWVyeURldmljZXNFWFQoTUFYX0RFVklDRVMs
IGVnbERldnMsICZudW1EZXZpY2VzKTsKKyAgICAgICAgICAgICAgICBkcHkgPSBnZXRQbGF0Zm9y
bURpc3BsYXlFWFQocGxhdGZvcm0sIGVnbERldnNbMF0sIDApOworICAgICAgICAgICAgfSBlbHNl
IHsKKyAgICAgICAgICAgICAgICBkcHkgPSBnZXRQbGF0Zm9ybURpc3BsYXlFWFQocGxhdGZvcm0s
IG5hdGl2ZSwgTlVMTCk7CisgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9CiAKQEAgLTM4
OCw2ICs0MDUsMTcgQEAgc3RhdGljIGludCBxZW11X2VnbF9pbml0X2RweShFR0xOYXRpdmVEaXNw
bGF5VHlwZSBkcHksCiAgICAgICAgIEVHTF9BTFBIQV9TSVpFLCAwLAogICAgICAgICBFR0xfTk9O
RSwKICAgICB9OworCisgICAgc3RhdGljIGNvbnN0IEVHTGludCBjb25mX2F0dF9wYnVmZmVyW10g
PSB7CisgICAgICAgIEVHTF9TVVJGQUNFX1RZUEUsIEVHTF9QQlVGRkVSX0JJVCwKKyAgICAgICAg
RUdMX1JFRF9TSVpFLCA4LAorICAgICAgICBFR0xfR1JFRU5fU0laRSwgOCwKKyAgICAgICAgRUdM
X0JMVUVfU0laRSwgOCwKKyAgICAgICAgRUdMX0RFUFRIX1NJWkUsIDEsCisgICAgICAgIEVHTF9S
RU5ERVJBQkxFX1RZUEUsIEVHTF9PUEVOR0xfQklULAorICAgICAgICBFR0xfTk9ORQorICAgIH07
CisKICAgICBFR0xpbnQgbWFqb3IsIG1pbm9yOwogICAgIEVHTEJvb2xlYW4gYjsKICAgICBFR0xp
bnQgbjsKQEAgLTQxMyw4ICs0NDEsOCBAQCBzdGF0aWMgaW50IHFlbXVfZWdsX2luaXRfZHB5KEVH
TE5hdGl2ZURpc3BsYXlUeXBlIGRweSwKICAgICB9CiAKICAgICBiID0gZWdsQ2hvb3NlQ29uZmln
KHFlbXVfZWdsX2Rpc3BsYXksCi0gICAgICAgICAgICAgICAgICAgICAgICBnbGVzID8gY29uZl9h
dHRfZ2xlcyA6IGNvbmZfYXR0X2NvcmUsCi0gICAgICAgICAgICAgICAgICAgICAgICAmcWVtdV9l
Z2xfY29uZmlnLCAxLCAmbik7CisgICAgICAgIGdsZXMgPyBjb25mX2F0dF9nbGVzIDogKHBsYXRm
b3JtID09IEVHTF9QTEFURk9STV9ERVZJQ0VfRVhUID8gY29uZl9hdHRfcGJ1ZmZlciA6IGNvbmZf
YXR0X2NvcmUpLAorICAgICAgICAmcWVtdV9lZ2xfY29uZmlnLCAxLCAmbik7CiAgICAgaWYgKGIg
PT0gRUdMX0ZBTFNFIHx8IG4gIT0gMSkgewogICAgICAgICBlcnJvcl9yZXBvcnQoImVnbDogZWds
Q2hvb3NlQ29uZmlnIGZhaWxlZCAoJXMgbW9kZSkiLAogICAgICAgICAgICAgICAgICAgICAgZ2xl
cyA/ICJnbGVzIiA6ICJjb3JlIik7CkBAIC00MzYsNiArNDY0LDExIEBAIGludCBxZW11X2VnbF9p
bml0X2RweV94MTEoRUdMTmF0aXZlRGlzcGxheVR5cGUgZHB5LCBEaXNwbGF5R0xNb2RlIG1vZGUp
CiAKIGludCBxZW11X2VnbF9pbml0X2RweV9tZXNhKEVHTE5hdGl2ZURpc3BsYXlUeXBlIGRweSwg
RGlzcGxheUdMTW9kZSBtb2RlKQogeworICAgIC8vIFRyeSBFR0wgRGV2aWNlIEV4dGVuc2lvbgor
ICAgIGlmIChxZW11X2VnbF9pbml0X2RweShkcHksIEVHTF9QTEFURk9STV9ERVZJQ0VfRVhULCBt
b2RlKSA9PSAwKSB7CisgICAgICAgIHJldHVybiAwOworICAgIH0KKwogI2lmZGVmIEVHTF9NRVNB
X3BsYXRmb3JtX2dibQogICAgIHJldHVybiBxZW11X2VnbF9pbml0X2RweShkcHksIEVHTF9QTEFU
Rk9STV9HQk1fTUVTQSwgbW9kZSk7CiAjZWxzZQotLSAKMi4xNy4xCgo=

--_005_BYAPR12MB3192EC20271BF35444CE2FF3D9F89BYAPR12MB3192namp_--

