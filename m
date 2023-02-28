Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86E6A640B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXA0M-0003ZS-GY; Tue, 28 Feb 2023 19:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.wiltse@live.com>)
 id 1pX8r1-0007Sa-Uw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:53:51 -0500
Received: from mail-bn8nam04olkn2014.outbound.protection.outlook.com
 ([40.92.47.14] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.wiltse@live.com>)
 id 1pX8qz-0008Q3-6G
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:53:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk225K2qG+JGOLoYSR0a/YGOihBxKaQRz67QxWzPJtgQdiFDeWG/odf8SoxyUTLpVOB+x0QRMLGPOGxGUENR9SY5+P0z0z4Uni+bBOITqHszurOclMgN2/tSohD3HK91bgfuyzuHAsOJGoC9/irJ3PUdvwNjmRCNXImbOD3d1y6AX5Kk4pv0UGEji1dO43K4TBitj3G9LGxrP9bpPW7rmaUIMrZWeBcRaPXtcBFxo6wSMPZfMYhdL4Si5uBgqscVSSWkAh/hnlw9woHkWYSZfnBe7zEGBhG8evxlZpFpnRu7CPjBobsW4Ez0Jmh1nbDYltjc8TauAiwxdjnSwteY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBrPeNLBAVs/+8DgvVPvjuo6moOfpQfGdXO7MsTC7Tc=;
 b=B2B1OSlouwYv/SjDNKVBzhTyZU19rcpER55PMf0uJC5juGl3cEGtQ6H3B2Y/9mtmYvpF/04AFXBJzvSVzPgkqDH1l8PkXIJ94m5WEgFlZkVqDLwoufBk6UtGUgM8/vfQ+utuuloO+Keq54dLSqrkhwcr+rpvDyPGYM7WIGcbD2VQp9rwwsMbnMgqoFtRMacV8X/6UPWSDOehFDza1DNufIKOMKM2vdXmPWekdCVAhmPEw1fLpVpXx8rVLiohtzWvdcHNdOR3oioJxXzgrsY+KMipTfFVa/YApfLZI0MMxPmNVjYc1swktHkGhdnYBCJoZRnjtWuej7VMLQJoaDdl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBrPeNLBAVs/+8DgvVPvjuo6moOfpQfGdXO7MsTC7Tc=;
 b=nC2NCB+roZCGlsTBYiC1Fuq3T0S531lFDla5UcRTRkxUvd1OA76TuzADJlyrmO6+oZ//DZQZJvYCbccm2EPkM2EIGhbSlzUPIwxvuJ5qW8c0f9/8h+W+6+2ur2Zg6zXB54tMKqfCeSmFNeiW6RgG4O5nT9aYJLIq7WBxcZp6R4wB6K/HjtW2az5xacG7y9IiEsjysP/nkYytNqnj1u6dMnYzNHRmtruejcAwo42az115PdlId2/AkHIJnQk6CPwVeI2crKrcA+CH2Xn9+Ix6i6ynY+hQYiCJ3hO4rEtJ+m4YXP8zE2HaNzujvjLw3K5krYQpiiM8aA9BWqMgNduvsw==
Received: from SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:211::17)
 by LV2P220MB0872.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:177::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 22:48:42 +0000
Received: from SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
 ([fe80::ab1f:3027:25ce:cf03]) by SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
 ([fe80::ab1f:3027:25ce:cf03%5]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 22:48:42 +0000
From: Brian Wiltse <brian.wiltse@live.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, Bin Meng
 <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, Yonggang Luo
 <luoyonggang@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, Michael
 Roth <michael.roth@amd.com>, Mauro Matteo Cascella <mcascell@redhat.com>, Yan
 Vugenfirer <yvugenfi@redhat.com>, Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>, Andrey Drobyshev
 <andrey.drobyshev@virtuozzo.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Subject: Re: [PATCH v2 0/2] QGA installer fixes
Thread-Topic: [PATCH v2 0/2] QGA installer fixes
Thread-Index: AQHZRea+gREuxWuabkicHjSNSQpKo67ZRu8AgAk1gQCAAl747Q==
Date: Tue, 28 Feb 2023 22:48:42 +0000
Message-ID: <SN4P220MB079034D6B286760E22D50411EBAC9@SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM>
References: <20230221112157.418648-1-kkostiuk@redhat.com>
 <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
 <CAPMcbCrqgrBkABhtSxCUbroszpPhCCWJ=FXL7AJbSmxN2n-q+Q@mail.gmail.com>
In-Reply-To: <CAPMcbCrqgrBkABhtSxCUbroszpPhCCWJ=FXL7AJbSmxN2n-q+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [5dStz6rUTKvyUK0tWKuN/dwKAJ1lotAyW/6zSSL5Ic6VzOP7hM7i3w==]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4P220MB0790:EE_|LV2P220MB0872:EE_
x-ms-office365-filtering-correlation-id: b1a87e88-9678-4b8c-41a1-08db19ddf10a
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jj+Ng7ImnNNYRkxqpyESA/BxZiWo5F9CXTmhSt5GkF+L8/jBPBdaGOD8cH2bN32WmaVT/ZhFh8iVxpvcWy6fQ+9842hzULaKsT8nxq7klneyA+YE3ikeGf2d5MrV8jeEWiZtwfGY1oWsJ3guZ9/xrGltFnRHdNICfPWNX9sF8Gq6hBadB2kXrep6d+ECSW031Iq7Cb/QeQGuFid5JZCNmnLTXBI0AQvL6oGAWpzI/YjSzljXqtZ7udptWtj4g9pODJuzQf5Glf6nD5lcsrDU6NgHqAqoxJM/ntfaP439hRZDm2KpXpGme+xj3Jo6SoBUrSTHnOAnmRAE+TowjWWShDGmwJ8U5Bke3jpsYwmEK4CioBDPh8DSjCh/RId397tO/4mhRRVKeptqlxpYydFYzurHCkNK82Hk/0HiLp3h6uHu17UtFtV4k1tCUEcZv4ycJWi3+Q33nD8tH+/ci6KPBoLzIHRGt5P+J+6cfcoQf+b3Fg0l+RMW2aPIzfqw5y3ELlHIfak25vW4IwXZawEQDsZwFdz2S1Os0vj1OaUeall/sHn2o2rmQuokneXzKXW+0jMFmhuEnm06a/tiLdIDjFH0WN1lGywZSQTFm2dkPLt2ioK0HAm9WP3xjnJ8BoxNhF5mgXypgJe6DqN7VOc7lkRg+SuxjWUzjhBIW2MaPb6eyGsOlHlYca8RJFtCjMu47j1qw0JySWQZ+rrzDtnmNg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4mPL7ezyIssKzGn/Ues6CzwVzS7d45y8fgDDnwvJp2qo2mU+3zkI9R1A/n?=
 =?iso-8859-1?Q?b1hVKNkBGIoxu+V/qhwXB75f0H1vRTMI25khuhjOu+BcOOleG9qI7bZl1n?=
 =?iso-8859-1?Q?ZbQjsaV7DQYgALMmZnfAtcwP2x50Z1J7VNz8tzyd6OdrzVQcf9OFRpnNSc?=
 =?iso-8859-1?Q?hztYAoDipWHS2c/BuBqwN5q7bnVdoiCv+3529cxinuwZ3Yrijb1suV+OlL?=
 =?iso-8859-1?Q?8qSnchuOY0dki6NzdEQTH3LMFuA35vPOgzakGn/wJ/E6KW0QE8mI4bwRMB?=
 =?iso-8859-1?Q?2IfV9Bi4llJJ7ArCbpDJhlv8s6kutZZnIDnR0wXCHbwj5+n+/IyMQja8Wa?=
 =?iso-8859-1?Q?AzrDdvNhpi8S1Xut1wu0Mv1cSm1unfqEvIIEj587yl22dKHPMczUVLQdMm?=
 =?iso-8859-1?Q?XyjQ/V1c4rIOGYsE2fzy6cspcsCUPr8mOglM6mU1x5iCLbQGirTj+Q+31s?=
 =?iso-8859-1?Q?0nSWVHkjE78j5i+iKhfnbn//A/d9iVM7goBld2+vjcHbcMBGdl6zhFwyMN?=
 =?iso-8859-1?Q?pBZOC1hjJAixe5/K/m4tUnTifV1WUXTlSMPpLrGsJynRc8XE7HXfKod24A?=
 =?iso-8859-1?Q?+7yMeLFGDv26JsFLRlTOxDcyovHNUx4iPEQ2iM+SKdX940coBVNXSwVLUP?=
 =?iso-8859-1?Q?gIAuYuIxIve/Oj83AGjt1eL2BAvSgk1tliIlBF2YKAh+k4Ir/+nNWlAckH?=
 =?iso-8859-1?Q?4mXjFReDWTTaeYbeeOvjkygEF8ycA4+HU48ysHIm2ohGCSQVfgtNzlL0oD?=
 =?iso-8859-1?Q?Di8JOdtK2+eUwsNVkm023vFeMWUZpRd8GJSnCPz90UgCZAwRpzaBrh4eNM?=
 =?iso-8859-1?Q?PR6VCyzsnwjE8aJQ+FFZ1FPkU+LLJWqkt+VE0MtojfK86jfaNXiXdbk+eS?=
 =?iso-8859-1?Q?9IO0NdVZFMkrs6vIBToZ5fHnS/hJ1w5AmAKyLGfV1mN4pfwjuWeiic9+g0?=
 =?iso-8859-1?Q?nerKo8wI0j5w9hucnWlkV46oRh4v6u66fdZBhzupTxYx82tXEZIa56vn3F?=
 =?iso-8859-1?Q?vT2GgaL0zK+1ROFIRrkTiAYTkzBxLYSDwdqPMnXs+iY3eiKXo/GKfhObMM?=
 =?iso-8859-1?Q?XqIzvI2pyCptFm6ytGxOpmG3hMW5e20zgRVirI1hJL4c1bcBovbWBaFYrt?=
 =?iso-8859-1?Q?EK7XDdnNe5GvGyn9MPKAkHO612ev+DfVJTHQLJdsdcXJ29sjyz9uHfcP9k?=
 =?iso-8859-1?Q?eixtrB+l52BoqCGY1UFv9sN2ZBSTxsyL8P8TPxaTRSndUk80nV7yq3JZ2c?=
 =?iso-8859-1?Q?6PjH50hjVQcwOpgnIyZqROnVryodU030NhlE19U7cZz8F0TTTjumnAZ4xh?=
 =?iso-8859-1?Q?SPajjbKQ5+Ne15aa/ZjntIOqFR3RPRYV5mneBT/jhXu87pU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN4P220MB079034D6B286760E22D50411EBAC9SN4P220MB0790NAMP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3458f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a87e88-9678-4b8c-41a1-08db19ddf10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 22:48:42.5192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2P220MB0872
Received-SPF: pass client-ip=40.92.47.14; envelope-from=brian.wiltse@live.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Feb 2023 19:07:33 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_SN4P220MB079034D6B286760E22D50411EBAC9SN4P220MB0790NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Microsoft has a list of best practices for MSI creation which covers custom=
 actions https://learn.microsoft.com/en-us/windows/win32/msi/windows-instal=
ler-best-practices#if-you-use-custom-actions-follow-good-custom-action-prac=
tices, The change to the custom action from an interactive command shell to=
 a silent invocation of rundll32.exe keeps the interactive shell from being=
 easily caught and abused, but this does not fully solve the repair from be=
ing triggered from a non admin user. There is still the potential for abuse=
 indirectly via attacks like the Mitre documented Hijack Execution Flow tec=
hnique - Path Interception by PATH Environment Variable (https://attack.mit=
re.org/techniques/T1574/007/), or even the abuse of potential arbitrary fol=
der creates, file writes and deletes in user-controlled areas such as C:\Pr=
ogramData.

The Change button was removed from "Programs and Features", but the cached =
installer in c:\windows\installer can be leveraged directly to start a priv=
ileged repair with msiexec.exe as a non-administrative user. Ideally, the M=
SI would be compiled with the Privileged property https://learn.microsoft.c=
om/en-us/windows/win32/msi/privileged or AdminUser property https://learn.m=
icrosoft.com/en-us/windows/win32/msi/adminuser or InstallPrivileges=3D"Elev=
ated" https://wixtoolset.org/docs/v3/xsd/wix/package/ or similar privilege =
check that which would help ensure the user has proper privileges to perfor=
m the repair or change action. However, since the QEMU build process levera=
ges WiXL from msitools, many of the WiX property types are not currently su=
pported to leverage as solutions ( i.e. (wixl:1077): GLib-GObject-WARNING *=
*: 17:49:05.477: g_object_set_is_valid_property: object class 'WixlWixPacka=
ge' has no property named 'InstallPrivileges' ). This similar to wixl issue=
 40 https://gitlab.gnome.org/GNOME/msitools/-/issues/40.

I do see that Wixl appears to support the custom action JScriptCall. This m=
ight provide for a facility for a script could be run to check if the user =
has the proper privileges before privileged actions are taken in the repair=
 process, but this is not an ideal solution.

Thanks,
Brian

________________________________
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Sent: Monday, February 27, 2023 2:18 AM
To: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; Daniel P . Berrang=E9 <b=
errange@redhat.com>; Bin Meng <bin.meng@windriver.com>; Stefan Weil <sw@wei=
lnetz.de>; Yonggang Luo <luoyonggang@gmail.com>; Markus Armbruster <armbru@=
redhat.com>; Alex Benn=E9e <alex.bennee@linaro.org>; Peter Maydell <peter.m=
aydell@linaro.org>; Gerd Hoffmann <kraxel@redhat.com>; Michael S. Tsirkin <=
mst@redhat.com>; Thomas Huth <thuth@redhat.com>; Marc-Andr=E9 Lureau <marca=
ndre.lureau@redhat.com>; Michael Roth <michael.roth@amd.com>; Mauro Matteo =
Cascella <mcascell@redhat.com>; Yan Vugenfirer <yvugenfi@redhat.com>; Evgen=
y Iakovlev <eiakovlev@linux.microsoft.com>; Andrey Drobyshev <andrey.drobys=
hev@virtuozzo.com>; Xuzhou Cheng <xuzhou.cheng@windriver.com>; Brian Wiltse=
 <brian.wiltse@live.com>
Subject: Re: [PATCH v2 0/2] QGA installer fixes

ping

On Tue, Feb 21, 2023 at 1:41 PM Philippe Mathieu-Daud=E9 <philmd@linaro.org=
<mailto:philmd@linaro.org>> wrote:
On 21/2/23 12:21, Konstantin Kostiuk wrote:. For example
> resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423
> fixes: CVE-2023-0664
>
> CVE Technical details: The cached installer for QEMU Guest Agent in c:\wi=
ndows\installer
> (https://github.com/qemu/qemu/blob/master/qga/installer/qemu-ga.wxs),
> can be leveraged to begin a repair of the installation without validation
> that the repair is being performed by an administrative user. The MSI rep=
air
> custom action "RegisterCom" and "UnregisterCom" is not set for impersonat=
ion
> which allows for the actions to occur as the SYSTEM account
> (LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages cmd.e=
xe
> to run qemu-ga.exe in line 134 and 142 which causes an interactive comman=
d
> shell to spawn even though the MSI is set to be non-interactive on line 5=
3.
>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05661.htm=
l

Per
https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMNz+=
ao-twH7FDRg@mail.gmail.com/:

Reported-by: Brian Wiltse <brian.wiltse@live.com<mailto:brian.wiltse@live.c=
om>>

> v1 -> v2:
>    Add explanation into commit messages

Thanks, much appreciated!

> Konstantin Kostiuk (2):
>    qga/win32: Remove change action from MSI installer
>    qga/win32: Use rundll for VSS installation
>
>   qga/installer/qemu-ga.wxs | 11 ++++++-----
>   qga/vss-win32/install.cpp |  9 +++++++++
>   qga/vss-win32/qga-vss.def |  2 ++
>   3 files changed, 17 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>


--_000_SN4P220MB079034D6B286760E22D50411EBAC9SN4P220MB0790NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof ContentPasted0 ContentPasted3 ContentPasted6 ContentPasted7 Conte=
ntPasted8 ContentPasted9">
Microsoft has a list of best practices for MSI creation which covers custom=
 actions
<a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/windows-inst=
aller-best-practices#if-you-use-custom-actions-follow-good-custom-action-pr=
actices">
https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-best-=
practices#if-you-use-custom-actions-follow-good-custom-action-practices</a>=
, The change to the custom action from an interactive command shell to a si=
lent invocation of rundll32.exe
 keeps the interactive shell from being easily caught and abused, but this =
does not fully solve the repair from being triggered from a non admin user.=
 There is still the potential for abuse indirectly via attacks like the Mit=
re documented Hijack Execution Flow
 technique - Path Interception by PATH Environment Variable (<a href=3D"htt=
ps://attack.mitre.org/techniques/T1574/007/">https://attack.mitre.org/techn=
iques/T1574/007/</a>), or even the abuse of potential arbitrary folder crea=
tes, file writes and deletes in user-controlled
 areas such as C:\ProgramData.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof ContentPasted1 ContentPasted2 ContentPasted4 ContentPasted5 Conte=
ntPasted11 ContentPasted12">
The Change button was removed from &quot;Programs and Features&quot;, but t=
he cached installer in c:\windows\installer can be leveraged directly to st=
art a privileged repair with msiexec.exe as a non-administrative user. Idea=
lly, the MSI would be compiled with the Privileged
 property <a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/pr=
ivileged">
https://learn.microsoft.com/en-us/windows/win32/msi/privileged</a> or Admin=
User property
<a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/adminuser">h=
ttps://learn.microsoft.com/en-us/windows/win32/msi/adminuser</a> or Install=
Privileges=3D&quot;Elevated&quot;&nbsp;<a href=3D"https://wixtoolset.org/do=
cs/v3/xsd/wix/package/">https://wixtoolset.org/docs/v3/xsd/wix/package/</a>
 or similar privilege check that which would help ensure the user has prope=
r privileges to perform the repair or change action. However, since the QEM=
U build process leverages WiXL from msitools, many of the WiX property type=
s are not currently supported to
 leverage as solutions ( i.e. (wixl:1077): GLib-GObject-WARNING **: 17:49:0=
5.477: g_object_set_is_valid_property: object class 'WixlWixPackage' has no=
 property named 'InstallPrivileges' ). This similar to wixl issue 40
<a href=3D"https://gitlab.gnome.org/GNOME/msitools/-/issues/40">https://git=
lab.gnome.org/GNOME/msitools/-/issues/40</a>.<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I do see that Wixl appears to support the custom action JScriptCall. This m=
ight provide for a facility for a script could be run to check if the user =
has the proper privileges before privileged actions are taken in the repair=
 process, but this is not an ideal
 solution.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Brian<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt;" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Konstantin Kostiuk =
&lt;kkostiuk@redhat.com&gt;<br>
<b>Sent:</b> Monday, February 27, 2023 2:18 AM<br>
<b>To:</b> Philippe Mathieu-Daud=E9 &lt;philmd@linaro.org&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; Daniel P . =
Berrang=E9 &lt;berrange@redhat.com&gt;; Bin Meng &lt;bin.meng@windriver.com=
&gt;; Stefan Weil &lt;sw@weilnetz.de&gt;; Yonggang Luo &lt;luoyonggang@gmai=
l.com&gt;; Markus Armbruster &lt;armbru@redhat.com&gt;; Alex Benn=E9e &lt;a=
lex.bennee@linaro.org&gt;;
 Peter Maydell &lt;peter.maydell@linaro.org&gt;; Gerd Hoffmann &lt;kraxel@r=
edhat.com&gt;; Michael S. Tsirkin &lt;mst@redhat.com&gt;; Thomas Huth &lt;t=
huth@redhat.com&gt;; Marc-Andr=E9 Lureau &lt;marcandre.lureau@redhat.com&gt=
;; Michael Roth &lt;michael.roth@amd.com&gt;; Mauro Matteo Cascella &lt;mca=
scell@redhat.com&gt;;
 Yan Vugenfirer &lt;yvugenfi@redhat.com&gt;; Evgeny Iakovlev &lt;eiakovlev@=
linux.microsoft.com&gt;; Andrey Drobyshev &lt;andrey.drobyshev@virtuozzo.co=
m&gt;; Xuzhou Cheng &lt;xuzhou.cheng@windriver.com&gt;; Brian Wiltse &lt;br=
ian.wiltse@live.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 0/2] QGA installer fixes</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">ping</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue, Feb 21, 2023 at 1:41 PM Phi=
lippe Mathieu-Daud=E9 &lt;<a href=3D"mailto:philmd@linaro.org" data-auth=3D=
"NotApplicable">philmd@linaro.org</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote ContentPasted10" style=3D"margin:0px 0px=
 0px 0.8ex; border-left:1px solid rgb(204,204,204); padding-left:1ex">
On 21/2/23 12:21, Konstantin Kostiuk wrote:. For example<br>
&gt; resolves: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D216=
7423" data-auth=3D"NotApplicable">
https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423</a><br>
&gt; fixes: CVE-2023-0664<br>
&gt; <br>
&gt; CVE Technical details: The cached installer for QEMU Guest Agent in c:=
\windows\installer<br>
&gt; (<a href=3D"https://github.com/qemu/qemu/blob/master/qga/installer/qem=
u-ga.wxs" data-auth=3D"NotApplicable">https://github.com/qemu/qemu/blob/mas=
ter/qga/installer/qemu-ga.wxs</a>),<br>
&gt; can be leveraged to begin a repair of the installation without validat=
ion<br>
&gt; that the repair is being performed by an administrative user. The MSI =
repair<br>
&gt; custom action &quot;RegisterCom&quot; and &quot;UnregisterCom&quot; is=
 not set for impersonation<br>
&gt; which allows for the actions to occur as the SYSTEM account<br>
&gt; (LINE 137 AND 145 of qemu-ga.wxs). The custom action also leverages cm=
d.exe<br>
&gt; to run qemu-ga.exe in line 134 and 142 which causes an interactive com=
mand<br>
&gt; shell to spawn even though the MSI is set to be non-interactive on lin=
e 53.<br>
&gt; <br>
&gt; v1: <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2023-0=
2/msg05661.html" data-auth=3D"NotApplicable">
https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05661.html</a><=
br>
<br>
Per <br>
<a href=3D"https://lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+k=
Z5jB1gfMNz+ao-twH7FDRg@mail.gmail.com/" data-auth=3D"NotApplicable">https:/=
/lore.kernel.org/qemu-devel/CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMNz+ao-twH7=
FDRg@mail.gmail.com/</a>:<br>
<br>
Reported-by: Brian Wiltse &lt;<a href=3D"mailto:brian.wiltse@live.com" data=
-auth=3D"NotApplicable">brian.wiltse@live.com</a>&gt;<br>
<br>
&gt; v1 -&gt; v2:<br>
&gt;&nbsp; &nbsp; Add explanation into commit messages<br>
<br>
Thanks, much appreciated!<br>
<br>
&gt; Konstantin Kostiuk (2):<br>
&gt;&nbsp; &nbsp; qga/win32: Remove change action from MSI installer<br>
&gt;&nbsp; &nbsp; qga/win32: Use rundll for VSS installation<br>
&gt; <br>
&gt;&nbsp; &nbsp;qga/installer/qemu-ga.wxs | 11 ++++++-----<br>
&gt;&nbsp; &nbsp;qga/vss-win32/install.cpp |&nbsp; 9 +++++++++<br>
&gt;&nbsp; &nbsp;qga/vss-win32/qga-vss.def |&nbsp; 2 ++<br>
&gt;&nbsp; &nbsp;3 files changed, 17 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
&gt; <br>
<br>
</blockquote>
</div>
</div>
</body>
</html>

--_000_SN4P220MB079034D6B286760E22D50411EBAC9SN4P220MB0790NAMP_--

