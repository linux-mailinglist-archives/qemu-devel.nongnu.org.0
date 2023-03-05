Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA26AADFE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 04:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYeiF-0002tW-PY; Sat, 04 Mar 2023 22:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.wiltse@live.com>)
 id 1pYeiD-0002tJ-Nl
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 22:07:01 -0500
Received: from mail-sn1nam02olkn2083.outbound.protection.outlook.com
 ([40.92.44.83] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.wiltse@live.com>)
 id 1pYeiB-0006c1-7p
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 22:07:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL1WC6APNxLfiY85Uz3UlKEqK8yozNflyDsQgyXsyogxU+CZ2ibdCCVbqBR7IcdFdZugc1m1B02zlSrAhXH+CKiZdO3HkqjE9l1tiMM4ntoLxqPFex+f3ceVGJgTEaYUfnKeYa7n7PrD15KBQRILPftA7SUMRyULgVDyXLWKVOz5mtyu0+/r401UiAp25Mjy7Pgt2at1jLBJemd4YHFbmE0ZL5xWZQ9emkfVaXhOBpBzma4vAFDLn1EgqBoXgdPvLirPVaeI90xZ0ufiaAxeV/PkYW3r5PkO0+ETTlow7NvRkrfkfp+VBcz5KovpcAk8tRZnxlIWZL4m58Kjyfsyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVyyvmGl9lOwW4KirPL5q258oLsP67UnLbJgjWKVbww=;
 b=ToDkMG7N6sDjVSAguOJFZzFkOnNRQZhfcglZ3OUzml/6Ohq1zvg2NqttbJh+wK8zHfJpMxFoDw2Zu/aencfeEShEFOxofBylDTajdQYrnJzMU4yT72XF4Ys15ejAbcwbxHSD0aUpM7bRUh0t1WqNDcftpNNY+UbJGpSyrD5JhqxQ/M6Be11b0JV6rTc4I01eEdRe+WhkZeB3kiVBBCOLWThlh6yfpSdNfT0/6XKvcDnGQclFHvjf441KWk3RXLywOjasgHgez+qKUiKkXnyARzl2KTqG0bw634ImsUXAJon/bjsERaCwpCir8DXYk27nnrEI7j8sgRWSx5Dgeihj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVyyvmGl9lOwW4KirPL5q258oLsP67UnLbJgjWKVbww=;
 b=R8aq1cyNIAASaiTul6frkjVy5K+pdsAYNDbXDvRf+DMfNsMRaJNs0fQZxBAZkVoy41M64HvkAE+p2Rpd0cxcQtp0QdgXhwhPfrYFdlB01vk/PlQrz/XNYDGavoPfa1KFmMHQ+vaS+jTTxPj1N3Q91pnLmJguIz68xoHOkLPm4RqUdShQjv9ZkQEFOH6F9NK9RMOq2AFrdCwEXT32xUykAH8R7wPpNL/yCsKBFveoV7wmmnEW2xzmTKZ80d/5RCq7t7AqLr8HVaOpf8ylQCpG3gvWKHpkscPPLHQJaar8kmWa0Glnu38a1pdzIwZVVfRWRyLsi9nysgGaRrJ5cdVTkw==
Received: from SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:211::17)
 by DM4P220MB0820.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:6c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22; Sun, 5 Mar 2023 03:01:54 +0000
Received: from SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
 ([fe80::ab1f:3027:25ce:cf03]) by SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
 ([fe80::ab1f:3027:25ce:cf03%6]) with mapi id 15.20.6156.023; Sun, 5 Mar 2023
 03:01:54 +0000
From: Brian Wiltse <brian.wiltse@live.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Konstantin
 Kostiuk <kkostiuk@redhat.com>
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
Thread-Index: AQHZRea+gREuxWuabkicHjSNSQpKo67ZRu8AgAk1gQCAAl747YAChskAgAQoaEw=
Date: Sun, 5 Mar 2023 03:01:54 +0000
Message-ID: <SN4P220MB0790C3A17EE3B8ECAD30BC3FEBB19@SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM>
References: <20230221112157.418648-1-kkostiuk@redhat.com>
 <170a0ba8-d85c-4b31-557a-d85b12b88089@linaro.org>
 <CAPMcbCrqgrBkABhtSxCUbroszpPhCCWJ=FXL7AJbSmxN2n-q+Q@mail.gmail.com>
 <SN4P220MB079034D6B286760E22D50411EBAC9@SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM>
 <20bb422e-746d-e841-5d26-ee93cb1da9ab@linaro.org>
In-Reply-To: <20bb422e-746d-e841-5d26-ee93cb1da9ab@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [BXzucxE/WRrOTv7hlEdmRodYDaU3X9I2aeDozAtk6cLAN4enzTDCAg==]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4P220MB0790:EE_|DM4P220MB0820:EE_
x-ms-office365-filtering-correlation-id: cc75aa1f-e864-4f8c-4e0a-08db1d25f9ca
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZlEvNQwgN76bY5qXJKK883cHg9ALGAs2piOcw67CmWBwizcxQZz+RX4WDzWXkL6uPWS3eTNKOLKeDkehNTxjImKY/gyGc5GDZTbQunME46moCr7WWofpa7C40tyrpO7N9zih0CBMMWOZ+ebA+/bnfqUxLlC4NDlK43Ykqrscie0vDZjfP0RcsRtVTq++yGtEqdgnYbz9oJOoH11eNCHrQeQLEZSH1sZI9enVqEVPRvjtp3LpHI34ZgMWXCjFiCZ+N6/CjHyEMpwQ3/wUsMmfhfa+Vyy4ht4Wz70GQoqGkBzkGnaxuCbOC44TJ9FP2J55sLc7sDJ3us6889kLTxtpKaIOod081xdJeLa7phqxbEXyBW/XOsLPTmkbMch5Ym+8a/yhCRrLpkfo1xI4hq5DI4ddwTwJL4e41YEfknuDJjLIpMUi0F1Mom2IssktfI+mQQe9MP6Hb4Seth2F7oAxTPvS6TcQTTiZ63Ci25beErv6BmR380rIn1FeX3kyNHsWILpDC4NgmxfPSdhIst2rrlCegouLO8iz5er4qRW6kOz9+73ipq2sry4O/VS0fbHX6XVtraSf1rOvHLqt/peWlJCsXdR8TbsfeDWhFhzU4hGEinPDqzXnok3PWeolBj8izcJ6uoi9XqW4zNpD8/VIYATBFuTU1HiA+ia99LYK04pooYJ7QVeXBZcSqNF9gxMbB+/VtWIsgP/PpLsJU3IJpw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yPPf7xrQsg1lti3dRRX61JP/dZttOR0Au6yfl/0yWJajP8nw0oIqsBT65n?=
 =?iso-8859-1?Q?Y1FiuxXr7JRTMrZ1FCqoyhfJdpGmM9Tk4nEnxNvWNVD227EHrcpEhMEo5/?=
 =?iso-8859-1?Q?3hGY09jycIul19xQ1ZQbQea63Zdc0qbghQ6Rjdtk6XjVb0kqd8lRzEXauC?=
 =?iso-8859-1?Q?WbzXXnTowAhfA6OAeU2I7v9bwnHmr4FhmxlUdOEY1+YfJc1siu1npiqGWK?=
 =?iso-8859-1?Q?FPl2slwPi3y7Zi//r7YJ511Y2gUsfqXr1hjOy1FzRXkolvbZqN+h3uX8Q1?=
 =?iso-8859-1?Q?/ilQyusbPNot06EmAvsu4Oi9B17JgyqyYLVDXgFa4v5ld/Lv52is9XDOYE?=
 =?iso-8859-1?Q?aS3yBF1mA34L6CIRFhfA/l5nsxzCsWkQm4OZZ7sLUlkQi/LPOIrEgyLUwC?=
 =?iso-8859-1?Q?bcctea9qVTyDn6kxAUYGH2OtQXO1ZmcH4Z+Aa+Mr2Lhmkbc+/hyCcLZBnH?=
 =?iso-8859-1?Q?254PSgT0gZQMY5NGaiOHZ8hPPuy868sn1oxWFEAxANrRR1evOFKhR+5hY8?=
 =?iso-8859-1?Q?dddIAPb5np/lSYq+JzLcyj3XZ45xq3RlxNSR+ZIOMrHMJ87S+JQcmxMTWT?=
 =?iso-8859-1?Q?zuhmR7ZQUef2diOHnF1Z8Yc5/nzRMRKD6+6szgIop8d3ngOOHVl84Fmymu?=
 =?iso-8859-1?Q?k5wlrII1PWrMQhv087oNQG4dLhva2mFBnKbDsfblVzxheE/rtWlYQasgIS?=
 =?iso-8859-1?Q?yBz2XL4+itzAVFaITeRXpw34upiqH/VF52uPlgffzi3DTwRjglQLGsbNPP?=
 =?iso-8859-1?Q?qpNwUZCUZ7dNzsFm/L1Wc2OyW5p2O4E7Ey8iCCx4EPn3ieZWWq/nAzgy06?=
 =?iso-8859-1?Q?QdqMmBCBytUBWc68K09ZoRb10mDJTRvpHhag5IrPGOgt04tjSiCyqWvsMc?=
 =?iso-8859-1?Q?075i3S8xVRoFLlfO3dOb4Kbe0Q5tNiIgChMTghXbPZ7i8xB2t9BQ+ysY59?=
 =?iso-8859-1?Q?kEGAzvJstF50RV1lHvs0vv70CKOI8o4H29spuruW7uk3R0VWEDHxbgsk3E?=
 =?iso-8859-1?Q?W9SqwZ17fW4tI+9xCDQTy+7HlXMQ6UPYW6tO9C5P+PLy9YqiuQ1jMjE/XB?=
 =?iso-8859-1?Q?k+Xz41n/I4cqQifNbQ7UNe+IPE50i2rzVu+Em4INeFCtlT0OpiGPv5ZUpb?=
 =?iso-8859-1?Q?QM+Sripb7Yq0KtSk2fseU7z+iTeNolm0sGKBetktur2LJsmiYmMDJzTe2b?=
 =?iso-8859-1?Q?nrcK4u8nIPiaKxX1FdxvFSAQzQKpGgwO6FG7dCsqlkl7Dna8R1P7ZLbPC1?=
 =?iso-8859-1?Q?xiJZIRSyosRJnusFw+9j9wyZFC1s5+7LKfJ4gHpGxZGAsZnsd+yoXUGfjP?=
 =?iso-8859-1?Q?/p6juWwS1G46tVAOdDz4sn9AvxDFli2MtqChg7ue1ZfpOwA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN4P220MB0790C3A17EE3B8ECAD30BC3FEBB19SN4P220MB0790NAMP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3458f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4P220MB0790.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cc75aa1f-e864-4f8c-4e0a-08db1d25f9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2023 03:01:54.4212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4P220MB0820
Received-SPF: pass client-ip=40.92.44.83; envelope-from=brian.wiltse@live.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_SN4P220MB0790C3A17EE3B8ECAD30BC3FEBB19SN4P220MB0790NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I think this patch is sufficient to remediate the priv ledge escalation via=
 the repair and catching the VSS com registration boxes that were being inv=
oked frivolously.


Long term the repair function not validating if the user has admin should b=
e addressed as well since their is still a potential for abuse. I dont see =
any other easy privledge elevation vulns at the moment other then an potent=
ial arbitrary file create where the creation of C:\programdata\qemu\qemu-ga=
.pid could be potentially be redirected via symbolic links to another file,=
 but I have not been able to find time to fully prove that out. If we could=
 get wixl support for the user privilege checks this would close abuse via =
the installer repair.


Thanks,

Brian

________________________________
From: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
Sent: Thursday, March 2, 2023 5:06 AM
To: Brian Wiltse <brian.wiltse@live.com>; Konstantin Kostiuk <kkostiuk@redh=
at.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; Daniel P . Berrang=E9 <b=
errange@redhat.com>; Bin Meng <bin.meng@windriver.com>; Stefan Weil <sw@wei=
lnetz.de>; Yonggang Luo <luoyonggang@gmail.com>; Markus Armbruster <armbru@=
redhat.com>; Alex Benn=E9e <alex.bennee@linaro.org>; Peter Maydell <peter.m=
aydell@linaro.org>; Gerd Hoffmann <kraxel@redhat.com>; Michael S. Tsirkin <=
mst@redhat.com>; Thomas Huth <thuth@redhat.com>; Marc-Andr=E9 Lureau <marca=
ndre.lureau@redhat.com>; Michael Roth <michael.roth@amd.com>; Mauro Matteo =
Cascella <mcascell@redhat.com>; Yan Vugenfirer <yvugenfi@redhat.com>; Evgen=
y Iakovlev <eiakovlev@linux.microsoft.com>; Andrey Drobyshev <andrey.drobys=
hev@virtuozzo.com>; Xuzhou Cheng <xuzhou.cheng@windriver.com>
Subject: Re: [PATCH v2 0/2] QGA installer fixes

Hi Brian, Konstantin,

On 28/2/23 23:48, Brian Wiltse wrote:
> Microsoft has a list of best practices for MSI creation which covers
> custom actions
> https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-bes=
t-practices#if-you-use-custom-actions-follow-good-custom-action-practices <=
https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-best-=
practices#if-you-use-custom-actions-follow-good-custom-action-practices>, T=
he change to the custom action from an interactive command shell to a silen=
t invocation of rundll32.exe keeps the interactive shell from being easily =
caught and abused, but this does not fully solve the repair from being trig=
gered from a non admin user. There is still the potential for abuse indirec=
tly via attacks like the Mitre documented Hijack Execution Flow technique -=
 Path Interception by PATH Environment Variable (https://attack.mitre.org/t=
echniques/T1574/007/ <https://attack.mitre.org/techniques/T1574/007/>), or =
even the abuse of potential arbitrary folder creates, file writes and delet=
es in user-controlled areas such as C:\ProgramData.
>
> The Change button was removed from "Programs and Features", but the
> cached installer in c:\windows\installer can be leveraged directly to
> start a privileged repair with msiexec.exe as a non-administrative user.
> Ideally, the MSI would be compiled with the Privileged property
> https://learn.microsoft.com/en-us/windows/win32/msi/privileged
> <https://learn.microsoft.com/en-us/windows/win32/msi/privileged> or
> AdminUser property
> https://learn.microsoft.com/en-us/windows/win32/msi/adminuser
> <https://learn.microsoft.com/en-us/windows/win32/msi/adminuser> or
> InstallPrivileges=3D"Elevated"
> https://wixtoolset.org/docs/v3/xsd/wix/package/
> <https://wixtoolset.org/docs/v3/xsd/wix/package/> or similar privilege
> check that which would help ensure the user has proper privileges to
> perform the repair or change action. However, since the QEMU build
> process leverages WiXL from msitools, many of the WiX property types are
> not currently supported to leverage as solutions ( i.e. (wixl:1077):
> GLib-GObject-WARNING **: 17:49:05.477: g_object_set_is_valid_property:
> object class 'WixlWixPackage' has no property named 'InstallPrivileges'
> ). This similar to wixl issue 40
> https://gitlab.gnome.org/GNOME/msitools/-/issues/40
> <https://gitlab.gnome.org/GNOME/msitools/-/issues/40>.
>
> I do see that Wixl appears to support the custom action JScriptCall.
> This might provide for a facility for a script could be run to check if
> the user has the proper privileges before privileged actions are taken
> in the repair process, but this is not an ideal solution.

Does that mean this patchset is, although "not ideal", sufficient
to fix CVE-2023-0664? Or does this need more work?
(IOW, do we feel happy enough and want to merge this and forget about it?)

Konstantin, you use "Fixes: CVE-2023-0664" in two different patches.
I'm worried a downstream distrib only pick one and feel safe. Maybe
use something like "Fixes: CVE-2023-0664 (part 1 of 2)".

--_000_SN4P220MB0790C3A17EE3B8ECAD30BC3FEBB19SN4P220MB0790NAMP_
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
ntToProof">
</div>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;" class=3D"elementToProof">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;">Hello,</span></font></font></=
font></p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;">
</p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;">I think this patch is suffici=
ent to remediate the priv ledge escalation via
 the repair and catching the VSS com registration boxes that were being inv=
oked frivolously.</span></font></font></font></p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;" class=3D"elementToProof">
<br>
</p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;" class=3D"elementToProof">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;">Long term the repair function=
 not validating if the user has admin should
 be addressed as well since their is still a potential for abuse. I dont se=
e any other easy privledge elevation vulns at the moment other then an pote=
ntial arbitrary file create where the creation of C:\programdata\qemu\qemu-=
ga.pid could be potentially be redirected
 via symbolic links to another file, but I have not been able to find time =
to fully prove that out. If we could get wixl support for the user privileg=
e checks this would close abuse via the installer repair.</span></font></fo=
nt></font></p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;" class=3D"elementToProof">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;"><br>
</span></font></font></font></p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;" class=3D"elementToProof">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;">Thanks,</span></font></font><=
/font></p>
<p style=3D"line-height: 100%; margin-bottom: 0in; background: transparent =
none repeat scroll 0% 0%;">
<font style=3D"" color=3D"#000000"><font face=3D"Calibri, Helvetica, sans-s=
erif"><font style=3D"font-size:12pt" size=3D"3"><span style=3D"background: =
rgb(255, 255, 255) none repeat scroll 0% 0%;">Brian</span></font></font></f=
ont></p>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=3D"eleme=
ntToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size: 11pt;" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Philippe Mathieu-Da=
ud=E9 &lt;philmd@linaro.org&gt;<br>
<b>Sent:</b> Thursday, March 2, 2023 5:06 AM<br>
<b>To:</b> Brian Wiltse &lt;brian.wiltse@live.com&gt;; Konstantin Kostiuk &=
lt;kkostiuk@redhat.com&gt;<br>
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
m&gt;; Xuzhou Cheng &lt;xuzhou.cheng@windriver.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 0/2] QGA installer fixes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Brian, Konstantin,<br>
<br>
On 28/2/23 23:48, Brian Wiltse wrote:<br>
&gt; Microsoft has a list of best practices for MSI creation which covers <=
br>
&gt; custom actions <br>
&gt; <a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/windows=
-installer-best-practices#if-you-use-custom-actions-follow-good-custom-acti=
on-practices" data-auth=3D"NotApplicable">
https://learn.microsoft.com/en-us/windows/win32/msi/windows-installer-best-=
practices#if-you-use-custom-actions-follow-good-custom-action-practices</a>=
 &lt;<a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/windows=
-installer-best-practices#if-you-use-custom-actions-follow-good-custom-acti=
on-practices" data-auth=3D"NotApplicable">https://learn.microsoft.com/en-us=
/windows/win32/msi/windows-installer-best-practices#if-you-use-custom-actio=
ns-follow-good-custom-action-practices</a>&gt;,
 The change to the custom action from an interactive command shell to a sil=
ent invocation of rundll32.exe keeps the interactive shell from being easil=
y caught and abused, but this does not fully solve the repair from being tr=
iggered from a non admin user. There
 is still the potential for abuse indirectly via attacks like the Mitre doc=
umented Hijack Execution Flow technique - Path Interception by PATH Environ=
ment Variable (https://attack.mitre.org/techniques/T1574/007/ &lt;<a href=
=3D"https://attack.mitre.org/techniques/T1574/007/" data-auth=3D"NotApplica=
ble">https://attack.mitre.org/techniques/T1574/007/</a>&gt;),
 or even the abuse of potential arbitrary folder creates, file writes and d=
eletes in user-controlled areas such as C:\ProgramData.<br>
&gt; <br>
&gt; The Change button was removed from &quot;Programs and Features&quot;, =
but the <br>
&gt; cached installer in c:\windows\installer can be leveraged directly to =
<br>
&gt; start a privileged repair with msiexec.exe as a non-administrative use=
r. <br>
&gt; Ideally, the MSI would be compiled with the Privileged property <br>
&gt; <a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/privile=
ged" data-auth=3D"NotApplicable">
https://learn.microsoft.com/en-us/windows/win32/msi/privileged</a> <br>
&gt; &lt;<a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/pri=
vileged" data-auth=3D"NotApplicable">https://learn.microsoft.com/en-us/wind=
ows/win32/msi/privileged</a>&gt; or
<br>
&gt; AdminUser property <br>
&gt; <a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/adminus=
er" data-auth=3D"NotApplicable">
https://learn.microsoft.com/en-us/windows/win32/msi/adminuser</a> <br>
&gt; &lt;<a href=3D"https://learn.microsoft.com/en-us/windows/win32/msi/adm=
inuser" data-auth=3D"NotApplicable">https://learn.microsoft.com/en-us/windo=
ws/win32/msi/adminuser</a>&gt; or
<br>
&gt; InstallPrivileges=3D&quot;Elevated&quot; <br>
&gt; <a href=3D"https://wixtoolset.org/docs/v3/xsd/wix/package/" data-auth=
=3D"NotApplicable">
https://wixtoolset.org/docs/v3/xsd/wix/package/</a> <br>
&gt; &lt;<a href=3D"https://wixtoolset.org/docs/v3/xsd/wix/package/" data-a=
uth=3D"NotApplicable">https://wixtoolset.org/docs/v3/xsd/wix/package/</a>&g=
t; or similar privilege
<br>
&gt; check that which would help ensure the user has proper privileges to <=
br>
&gt; perform the repair or change action. However, since the QEMU build <br=
>
&gt; process leverages WiXL from msitools, many of the WiX property types a=
re <br>
&gt; not currently supported to leverage as solutions ( i.e. (wixl:1077): <=
br>
&gt; GLib-GObject-WARNING **: 17:49:05.477: g_object_set_is_valid_property:=
 <br>
&gt; object class 'WixlWixPackage' has no property named 'InstallPrivileges=
' <br>
&gt; ). This similar to wixl issue 40 <br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/msitools/-/issues/40" data-a=
uth=3D"NotApplicable">
https://gitlab.gnome.org/GNOME/msitools/-/issues/40</a> <br>
&gt; &lt;<a href=3D"https://gitlab.gnome.org/GNOME/msitools/-/issues/40" da=
ta-auth=3D"NotApplicable">https://gitlab.gnome.org/GNOME/msitools/-/issues/=
40</a>&gt;.<br>
&gt; <br>
&gt; I do see that Wixl appears to support the custom action JScriptCall. <=
br>
&gt; This might provide for a facility for a script could be run to check i=
f <br>
&gt; the user has the proper privileges before privileged actions are taken=
 <br>
&gt; in the repair process, but this is not an ideal solution.<br>
<br>
Does that mean this patchset is, although &quot;not ideal&quot;, sufficient=
<br>
to fix CVE-2023-0664? Or does this need more work?<br>
(IOW, do we feel happy enough and want to merge this and forget about it?)<=
br>
<br>
Konstantin, you use &quot;Fixes: CVE-2023-0664&quot; in two different patch=
es.<br>
I'm worried a downstream distrib only pick one and feel safe. Maybe<br>
use something like &quot;Fixes: CVE-2023-0664 (part 1 of 2)&quot;.<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN4P220MB0790C3A17EE3B8ECAD30BC3FEBB19SN4P220MB0790NAMP_--

