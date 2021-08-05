Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C73E1EAE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:28:50 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlr7-0006re-Sz
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mBlbp-0008Tc-L2
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:13:01 -0400
Received: from mail-mw2nam10on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::614]:44992
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mBlbm-0002fE-Jy
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:13:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY0mBmufTdx9b+XhYGuhLfoA0MzLNnUa/8panvGNN/85on6vSfNr+qjBZNhG4ho9otoqLnDCUeOrc0ZKg6QJzkIRpXc5dGY6HrgExgx/f6hpvGuxKIrPXxWCig6vSzFJkYdHKvjg3I+XrKljiM8elJOtNjiwFJqmgVZmZ250XL8dEtJiDPTduG/WNhpFisAE1wELV9vYKeaakeg9yQsHlSjba3JpXCPkpvWSbaly+p7v39nZZzUqUXHv6zs2CWnUzSQxxVi3TcFwNfJPc58fTW1FaUQLdhnWfwoWOsvfhTEVtJ4qjYEZCAiUHi8ncD8Lwug/xtmnWZnClJUh2nLk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjcs4sYV2I5wpUVD7AnUFno7EeP4ed73vu6uZ+osoD0=;
 b=ilO3VFVDlcHjFrQZ7o7FEORTBB1sViadQEqp8VOyxYzuehWREdHi180y8Y3RuMe3BWAjndwIMnsVqkwst7mASN7lN+3r10q7PJAfriqcdo5BlbijFJFUjOmFl3GyEVtrAFEYSC36f1Udm1u5SmOIPIGEjPku5IfVZWf6K4VjoZkuZaP4t83crC9sfyLXON6cyjJIIfE3fEi4iFOedhSVuUlc+/j31Rzo6qIQl01tkv1yCWWwMQRiYFkNW7eSmYmyyE5aQoTX7E68fzQGCUZzdqCZXrwYRmK9l2lwr1wxf/lPN40vQ6z6OvNvzbFIKDkfPF/Qg9hzHkzVRQNQigPCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjcs4sYV2I5wpUVD7AnUFno7EeP4ed73vu6uZ+osoD0=;
 b=teczhRIYw6ZpJwli1DmOa90zHetLOflQNvJ18BxcOsQeDjiYXY6udFu5KMo67gwlTfJ62joSomM3yR0HWn39mXcwdwL/pcqekPFlgPlxaOjYISmx4J58g+FKWWzLLAMs8oKaKUCIbjnJnw4LWE/O7SOmDonE50Uk1LpQxYLKeXGN0rfsQ4LHMqfkBXpqbJrsKogu8eTBQhr1vF0RMWwWzBDw2OXYAylBEWVb3AQvqR2Ew6CCERFl2d6EhIF1q9NfKZ51d/6NKbwc79XqBzlt8peSFVZuZ0J+HYxSx1PnxQt4gGG5iW/ju3maM2yBRbPqTukQv9ZfTWze0vIqbYLPFg==
Received: from BYAPR12MB3192.namprd12.prod.outlook.com (2603:10b6:a03:139::14)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:07:52 +0000
Received: from BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::1d3d:e561:a8a3:15f3]) by BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::1d3d:e561:a8a3:15f3%5]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 22:07:52 +0000
From: Eugene Huang <eugeneh@nvidia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] Use EGL device extension in display initialization.
Thread-Topic: [PATCH] Use EGL device extension in display initialization.
Thread-Index: AdeKO1v5rK+V8M0rTaC/cxjh3v6Bbg==
Date: Thu, 5 Aug 2021 22:07:52 +0000
Message-ID: <BYAPR12MB319275649A1403C254A9EA43D9F29@BYAPR12MB3192.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ee25004-84ee-4ea3-2b60-08d9585d7844
x-ms-traffictypediagnostic: BY5PR12MB4273:
x-microsoft-antispam-prvs: <BY5PR12MB427353B21017CD716E9590C4D9F29@BY5PR12MB4273.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D5ZEX7DYZBJijV2vXJRRoQS7ZQ/+EiWFoiypnA4Cg6Hioohec9oK9GZLP+WV0vB74J/pxoB7rxR34llik/BWkG+6ShK+9Yas0XhkFDRpJbCf9PDb8YQcjh/C93lPxvzf+2kjyqznCpa8XJzgyh22cca3pdkKfE/FIb+gOK1HsZZSnDLOwSPvBLY/GzvtYSsSjCle6iNAmQdBQza3Yxw+J0K6qJMs9o8nsCI0ij5ZJDVmXkVrVQKXfMU9dzZ75BaIXubFRTJzsPV2gghYwLhsVngeNk5AkKc2WRDTCGr1Y3tvWTWVmxy3yeP3hz7bGjIojnZoO0MujiraHzbL1agp9zLnsxubAp5jQ4ba5xGTAk8kJzWaheXDVPzMlQ6cKlJPoxXX2nW02vyMrMtdcWnC12+Y9Q9A8hIF0JK+ycLUEs9tdUZRciNVyhT+wyY99+mJ4DxUQa9pQ4wJTWDuOJaCN7ykmQ7zbvvl1aI3HwoNYtxO0w0JiKicfPsbQ2FUdCCDU/P3N1tclWBkwQi4Uce2t02bewlB/bGCbiDIyC3+fS3fopGqeM/IH/8fYnq4hpD4JaE3NlL48Q6U0dIzb+TnBSgJGZNgznjG7w/mwUWb35WyskrAr2dJuktu0oSYKY8uKrk6fPXRO2qjIh3mN7IymD9n7m41i/TqfE3Ao65fVV7KNDsLwlUP8z5X4ieVEXChfTV+tL2s9Kh4XREDDHfYP9G+OgVRdngPZoUtiajtjAM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(186003)(122000001)(38100700002)(55016002)(26005)(33656002)(6506007)(66476007)(66556008)(9686003)(5660300002)(52536014)(66446008)(6916009)(38070700005)(71200400001)(7696005)(66946007)(64756008)(76116006)(83380400001)(2906002)(8676002)(316002)(86362001)(478600001)(8936002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nD52jUcNwqjva9cwy+PJDdcvvsmYfiWWzIfgMa+nQ4t4pCVBM6KNXlzlswdd?=
 =?us-ascii?Q?2fOrDBU5DVus4a2530dFXVF0ykyElSVS9lCnnENnXxvZACpJjZFp1qtB3TWv?=
 =?us-ascii?Q?57oFBLpaLlJdraLCGYUFpuf2s/qmN5hmP0fpM0zE89myRPZ0H2eCqCrQV4/4?=
 =?us-ascii?Q?6D3HlcxrHAuXfEnZt+ecm9mjPEAR0f1SUHZ60tKlogOi0pM0l8xR8/eWK9Tf?=
 =?us-ascii?Q?I9dQ7MGAYNXjptt0LFj+dnu74pfRXo2HCXKs7DnvPbime4Z2iP50jz/TCcls?=
 =?us-ascii?Q?PLLc7feWOp9OUfP2tWHDLDOlXwg6+fzQAO/5mZhS8WNOIkOFFhelwHhCjxz/?=
 =?us-ascii?Q?DIy2oUn2zTn8gvIJsdt+opjTL1CFAPpbAMSekITsIbt1kRGJ7iPktp7IG2ZA?=
 =?us-ascii?Q?aEDWrhtuAc880fkUZK1NDzpVwCxpyu/3gReOcuP1L7Hanu0zQKOTOOBHbntD?=
 =?us-ascii?Q?IFrzfU/KYGBezqdablzLzzLcooa6CKD1li9baRgISmJbuzvkpZnmV3uJc3ay?=
 =?us-ascii?Q?KaIn9uCnfr1dH+gyUcq0pVvSPVPWq/Xm5QeFf2c+zVIY9P4vqDBWtGDgISNj?=
 =?us-ascii?Q?RsRgKRHz7HqpdlKGA/RyC49P01vfmHunn6rQMdJuXhRhf+aVhxAeWYBKwg6M?=
 =?us-ascii?Q?HVChHbFjm7WcCjq9FL/61E6jSt4L9Yop8Vjhs4yflA3YxQwQrwX8LDJ1lALo?=
 =?us-ascii?Q?RbxLq8k/Pp7L1ncVB6hpb3I5+OspCcRXyQdbB3OM6dAzDpi5NbDE6F05q+eP?=
 =?us-ascii?Q?0eXbUxfkN1tjQK3WtHmg7Q1raSbE0OzsYJ/T+Ec03+2/8dYTxaspGnbqga5t?=
 =?us-ascii?Q?Lvf07H4vBi+KQ2jo1sm1+SQ57XxXgNoJZgxHW/VN/NkvTvES785kdLInp2tj?=
 =?us-ascii?Q?TJ1kiiw00E5AhGu+jFw6rBckZTtsIJSeErLEkRBs2vGz2LmD02ZErKD+5rlv?=
 =?us-ascii?Q?x7S1BSWv+x8nNDiJ6lvVMy9uYponFX+BPfanREXVDgHP8wgNV2sQ9cimmVs6?=
 =?us-ascii?Q?9gBgc2h/66ik4uPDawH8x76EaEW6R9EMCXvUKLE+meJDvPLALwX986Idti+v?=
 =?us-ascii?Q?wUt+ukEA59U2tziK2CdAtZa3ma1szAaF8p7SJ9VrEeTS49tQVezxZ/qhFPZh?=
 =?us-ascii?Q?Hf6cSGQsR3N4ddF97HY/OTQEVM5SktzoVeEwAZ7PVss0A9Cj23YX02d3XxJr?=
 =?us-ascii?Q?4LDW0ogbpb708ikZjUQyu7R/+P4320oF1g/ngXuiSbMUmo43+ZJHLvioQOZt?=
 =?us-ascii?Q?Z6JF4DfUF3NRc4WelngNhtxA6DWSoq61wPi49xKsHaqVBpF+Xw9in5gUyRKm?=
 =?us-ascii?Q?Gpz60QrBvXeBHJwc+xpWGdTd?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB319275649A1403C254A9EA43D9F29BYAPR12MB3192namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee25004-84ee-4ea3-2b60-08d9585d7844
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 22:07:52.1322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q23cOON6RvZsrNDl9+wOzT7LvhVvipG1gtiXxCuVVtTbVfncs5/hWmya3MiXYFt14oSEROTRvzz8xLCakl6tEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273
Received-SPF: softfail client-ip=2a01:111:f400:7e89::614;
 envelope-from=eugeneh@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Aug 2021 18:27:50 -0400
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

--_000_BYAPR12MB319275649A1403C254A9EA43D9F29BYAPR12MB3192namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch enables running generic EGL devices such as Nvidia's in headless=
 mode. It assumes single device. More work is needed to support multiple de=
vices.



Signed-off-by: Eugene Huang <eugeneh@nvidia.com<mailto:eugeneh@nvidia.com>>

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



--_000_BYAPR12MB319275649A1403C254A9EA43D9F29BYAPR12MB3192namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">This patch enables running generic EGL devices su=
ch as Nvidia&#8217;s in headless mode. It assumes single device. More work =
is needed to support multiple devices.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">Signed-off-by: Eugene Huang &lt;<a href=3D"mailto:eugene=
h@nvidia.com">eugeneh@nvidia.com</a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">ui/egl-helpers.c | 41 ++++++++++++++++++++++++++++++++++=
+++----<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">1 file changed, 37 insertions(+), 4 deletions(-)<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">index 7c530c2825..c11610c083 100644<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">--- a/ui/egl-helpers.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+++ b/ui/egl-helpers.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">@@ -1,6 +1,8 @@<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">/*<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp; * Copyright (C) 2015-2016 Gerd Hoffmann &lt;<a hr=
ef=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp; *<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+ * Copyright (c) 2021, NVIDIA CORPORATION &amp; AFFILIA=
TES. All rights reserved.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+ *<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp; * This library is free software; you can redistri=
bute it and/or<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp; * modify it under the terms of the GNU Lesser Gen=
eral Public<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp; * License as published by the Free Software Found=
ation; either<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">@@ -349,11 +351,26 @@ static EGLDisplay qemu_egl_get_dis=
play(EGLNativeDisplayType native,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLDisplay dpy =3D EGL_NO_DISPL=
AY;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* In practise any EGL 1.5=
 implementation would support the EXT extension */<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">-&nbsp;&nbsp;&nbsp; if (epoxy_has_egl_extension(NULL, &q=
uot;EGL_EXT_platform_base&quot;)) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; if (epoxy_has_egl_extension(NULL, &q=
uot;EGL_EXT_platform_base&quot;)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; e=
poxy_has_egl_extension(NULL, &quot;EGL_EXT_platform_device&quot;)<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; (=
epoxy_has_egl_extension(NULL, &quot;EGL_EXT_device_base&quot;)<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || epoxy_has=
_egl_extension(NULL, &quot;EGL_EXT_device_enumeration&quot;))) {<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PFNEGLG=
ETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =3D<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; (void *) eglGetProcAddress(&quot;eglGetPlatformDisplayEXT&=
quot;);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get=
PlatformDisplayEXT &amp;&amp; platform !=3D 0) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platform, native, NULL);<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; if (platform =3D=3D EGL_PLATFORM_DEVICE_EXT) {<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const int MAX_DEVICES =3D 4;<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGLDeviceEXT eglDevs[MAX_DEVICES];<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGLint numDevices;<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PFNEGLQUERYDEVICESEXTPROC eglQueryDevic=
esEXT =3D<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (PFNEGLQUERYDEV=
ICESEXTPROC)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eglGetProcAddress(&quot;eglQueryDevices=
EXT&quot;);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eglQueryDevicesEXT(MAX_DEVICES, eglDevs=
, &amp;numDevices);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platform,=
 eglDevs[0], 0);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; } else {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dpy =3D getPlatformDisplayEXT(platform,=
 native, NULL);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">@@ -386,6 +403,17 @@ static int qemu_egl_init_dpy(EGLNat=
iveDisplayType dpy,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_ALP=
HA_SIZE, 0,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_NON=
E,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; static const EGLint conf_att_pbuffer=
[] =3D {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_SURFACE_=
TYPE, EGL_PBUFFER_BIT,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_RED_SIZE=
, 8,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_GREEN_SI=
ZE, 8,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_BLUE_SIZ=
E, 8,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_DEPTH_SI=
ZE, 1,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_RENDERAB=
LE_TYPE, EGL_OPENGL_BIT,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EGL_NONE<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLint major, minor;<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLBoolean b;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; EGLint n;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">@@ -411,8 +439,8 @@ static int qemu_egl_init_dpy(EGLNati=
veDisplayType dpy,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b =3D eglChooseConfig(qemu=
_egl_display,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; gles ? conf_att_gles : conf_att_core,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &amp;qemu_egl_config, 1, &amp;n);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles ? conf_=
att_gles : (platform =3D=3D EGL_PLATFORM_DEVICE_EXT ? conf_att_pbuffer : co=
nf_att_core),<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;qemu_eg=
l_config, 1, &amp;n);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; if (b =3D=3D EGL_FALSE || n !=
=3D 1) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_r=
eport(&quot;egl: eglChooseConfig failed (%s mode)&quot;,<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gles=
 ? &quot;gles&quot; : &quot;core&quot;);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">@@ -434,6 +462,11 @@ int qemu_egl_init_dpy_x11(EGLNative=
DisplayType dpy, DisplayGLMode mode)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dp=
y, DisplayGLMode mode)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">{<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; // Try EGL Device Extension<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; if (qemu_egl_init_dpy(dpy, EGL_PLATF=
ORM_DEVICE_EXT, mode) =3D=3D 0) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">+<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">#ifdef EGL_MESA_platform_gbm<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp; return qemu_egl_init_dpy(dpy, E=
GL_PLATFORM_GBM_MESA, mode);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">#else<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">--
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;">2.17.1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR12MB319275649A1403C254A9EA43D9F29BYAPR12MB3192namp_--

