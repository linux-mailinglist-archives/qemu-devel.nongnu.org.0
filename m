Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E243F94B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 10:56:06 +0200 (CEST)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNgE-0002Y7-0d
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mgNe4-0001pd-TX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:53:55 -0400
Received: from mail-bo1ind01olkn0141.outbound.protection.outlook.com
 ([104.47.101.141]:45409 helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mgNe0-0002xw-H8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:53:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT0gEcrBRiFeFtGjBu+HtfCLJZd2nTsgJ3TSHEyd6QX8v+H2k2FrdIMvW3avdU9awIYrH2oeC9Yq8ok0XaKjMW59Jld2newkEzQbIcunCGDCWNZNEJuVXQ6i9ME4WXGIT3ZLyBR5lwl5dgyWbL8TlzFo6CBuJSuy7pK5lTrxQfdiugwSvu6MEijnwY+dTQ8pRb64ZcHR7ZCDBbi7A5KC4uwHEQHdCfZMwYLVOUpv4fMmEwVouAZC6hBXZia7lKb53C7uPJZzE0T0SRPcLjqOz/E9+ope3WEj3MzQTTQ4JDmZ2vQ2GQRlmwudN5GfIu/ezphG2F142KxzxSRegshF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ntg/P2nTcJlgQ/a17Ofl19HptNZG3I1mVh/C5JQJ6Hg=;
 b=DJGI0VlNVDAqZdqDIEzs7l2G0eU1yQvw9+nKxG++JY9kuufoKC3jX7TfrX5Qn6ts/FZQ+7pfWllsISeAuhQQpNwxWF5A5wENrydBYAkGuWRSdYHCkT6bhJntgUpWltc/WyFmqrM2BoaYwRUittlHmGC7MYtwedoEK5eliNGHcwf6UHtRL04rF26j0CmfyaE+tuASHFUbg6qNOzgpKmYS8NcBKj74CwzPzNrPbZSgxuoanh1h9a/kLMWeGB41T57TmqJetUKluSPELc4wjj+yTyBrn4KnPQs2MkudBl4DqnL7tQ+729y7isqX5BPxa8Owuh82YOnw2ES0XOOzMEK4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntg/P2nTcJlgQ/a17Ofl19HptNZG3I1mVh/C5JQJ6Hg=;
 b=X0wJDG+ELmBBkX/ZWEyELh65EPyOgiBh1uMofmxwaMoSkFabXlzjXJzX44aP2WxfK0eQbPjDbk7EwvUAnR7ELYtN98WacDAeKdXp0SDf2LScg1LL6BPOvYBO44x6JJFxBmqyDRnwDKFlMaIRTAIaTz10qrcZgd5/OgUNL+I4Zp7Ni3oe2K84CLUTUrEbYPRXMIYyX5ChnAnfZzap4Y7PCUBPMrnD9ovZUEt5x74TWhK4uOV/EuunJl98IqDfGNpazMdzUSbdsUxcbNV4d9B6LtbyvG8xdL50nS2AvWcExKckZ6sXaWKIGZxPNRFhBdtqjQ05dYFw8AzvRp0RhWjgyQ==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB7765.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Fri, 29 Oct
 2021 08:53:42 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1dc1:9d95:853f:9a7c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1dc1:9d95:853f:9a7c%9]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 08:53:35 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: Possible reward for fuzzer bug fixes? Secure Open Source Rewards
 Program
Thread-Topic: Possible reward for fuzzer bug fixes? Secure Open Source Rewards
 Program
Thread-Index: AQHXzArv1dfeV8rpYkSsbE5tylBj2KvprMq2
Date: Fri, 29 Oct 2021 08:53:35 +0000
Message-ID: <PN0PR01MB63525F90A1E456E26D536225FC879@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
References: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
In-Reply-To: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8e05ecf3-b698-db0e-9aa7-d4b3a1c36b9a
x-tmn: [A+tRIYLz4CacXcfi/6m4A0DQzpilMAIS]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d32c856a-a7fe-4430-4ce9-08d99ab997e9
x-ms-traffictypediagnostic: PN0PR01MB7765:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LmsEVHPIm/vXcrdtyzzalt2/kYa8jWd0LYzZ/cBie5s6iUj6LQv2fIagBQcOcOcn/diQl25CMF0qyqk2RH0nvDOxj80tiHkdTpzCEyQJJ9pWfy42zbwt5Qaj7PP287V0ZRbHWanmvYULc++ytlWU89jUJQa0cY1MNOnKdBy8pYL6nbPX6vd57z9rgOxCZdtVp/qiFF9j6o/wF+6cOifxr31a6gycqDqzWhpfQ4omMPm4fAmtaItlfp6AJszpusevwycu8WTRHVyQyP3vlB1D5xCDINkZEvRVywnSBwJYgZLSYzoBFcS5FWdgQ7hd5rzzLtk9hrnPqzkopymMvweUd1NPuSNwZgivIvVxoafOynz04rHrQX6KYxe104GwBOo2L4mCgf+EqYQe/gwRzUMccZsaGN7tnn2fgruvfcR5XL2d5X0TfH3HBs+XehTvsjeoCblzDZymdAjt70tiBK1yzOW0UH/yY5R/QpEyjqCWKtcXgng8gtbxf//jSTQ1kwD7fnkRHiLxkKkJsk8mljqaABr5cEbT003uhNCAe3nj3OBjc2uDTCyz+UslTbNzqUcNXsOt2O4tnPGpo9Wt6+LPiOWcJ3TiX0YrC3pEIurRITZlQ9AsMGsHADwTEzyA0vpF
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: MYFC8LUBG1Wfs4au7BfpDcdWb25YMqvM1e24A7TKfpQViDC2tgce19zBBQLiI/Wk9r+cvaQ/+zLIjol/R0nhKEceJm+197jBFmjLhHpTwE84dEuzS7BUCCbU9enqo0JmAmEMBbnnd64B3flk3cE1zfrSW0v4+LDiK+eEoI5HEPQ0sd4AvMnevu2aBlmDRPQZIK/c27PqV97GyRBW0m2z2j41HR3NEzej/id/D8hbCX6/ijDYkxCOaGXYxH6GgEViPqEjBBslePs3mUHP4NxM319OjGubP+Pw8iEttuYBwkQHR0v+m4P91bE+r2CdsnIyqzEAMLvqfbBX1tr6MtjO8K5FwloLneGcn3VZzd9GKmWWjtItMDTonahia7zpX5QPtxd0rxnoj38KeRN3KJPmOkkc3QyEMCHkyET4xdb1PeK8M1cIg5JTy0kd1aqaGdPjazlhD9IAXs1oP79m0KYQyZizUnAdFMOViCRx/XCWh65VE2MNSJyRUF6jKEi9A2KzoP2GIWOLjnN8UcgQeLttZYv9Vs21sH+qMMDAJflHVygHE1keV79Lj5rRfXnVE0HFMXRGA7gyJhbgDpOLFQbXlR4PfEpehhpyRm9VGa2yW70g/Av97UtgG3Tq+Yq0vskz4mdbD45Gb4u0PWdlSbfpzXmF7EbJO/EVV8TmlI8CaeOTu1lb1dH0YPDgdFngC6zD
Content-Type: multipart/alternative;
 boundary="_000_PN0PR01MB63525F90A1E456E26D536225FC879PN0PR01MB6352INDP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d32c856a-a7fe-4430-4ce9-08d99ab997e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 08:53:35.7583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7765
Received-SPF: pass client-ip=104.47.101.141;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-BO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_PN0PR01MB63525F90A1E456E26D536225FC879PN0PR01MB6352INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sounds great. How about mentioning this program on the Security Process web=
 page [1]? Hackers who report vulnerabilities may be interested in fixing b=
ugs.

Just curious. Why didn't those bugs [2] get fixed before disclosure? It see=
ms SD and virtio-9p are maintained now.

[1] https://www.qemu.org/contribute/security-process/
[2] https://bugs.chromium.org/p/oss-fuzz/issues/list?sort=3D-reported&q=3DT=
ype%3DBug-Security%20label%3ADeadline-Exceeded%20qemu&can=3D2

________________________________
From: Alexander Bulekov <alxndr@bu.edu>
Sent: Thursday, October 28, 2021 22:48
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>; Bandan Das <bsd@redhat.com>; Stefa=
n Hajnoczi <stefanha@redhat.com>; Thomas Huth <thuth@redhat.com>; Darren Ke=
nny <darren.kenny@oracle.com>; Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Possible reward for fuzzer bug fixes? Secure Open Source Rewards P=
rogram

Recently a pilot for the Secure Open Source Rewards program was
announced [1]. Currently this program is run by the Linux Foundation and
sponsored by the Google Open Source Security Team.

The page mentions that patches for issues discovered by OSS-Fuzz may be
eligible for rewards. This seems like it could be a good incentive for
fixing fuzzer bugs.

A couple notes:
 * The program also rewards contributions besides fuzzer-bug fixes.
   Check out the page for full details.
 * It seems that QEMU would qualify for this program. The page mentions
   that the project should have a greater than 0.6 OpenSSF Criticality
   Score [2]. This score factors in statistics collected from github
   (sic!). QEMU's score is currently 0.81078
 * Not limited to individual contributors. Vendors can also qualify for
   rewards.
 * Work completed before Oct 1, 2021 does not qualify.
 * Individuals in some sanctioned countries are not eligible.
 * The process seems to be:
    1. Send a fix upstream
    2. Get it accepted
    3. Fill out a form to apply for a reward

Any thoughts about this? Should this be something we document/advertise
somewhere, so developers are aware of this opportunity?

[1] https://sos.dev/
[2] https://github.com/ossf/criticality_score

-Alex

--_000_PN0PR01MB63525F90A1E456E26D536225FC879PN0PR01MB6352INDP_
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
: 12pt; color: rgb(0, 0, 0);">
Sounds great. How about mentioning this program on the Security Process web=
 page [1]? Hackers who report vulnerabilities may be interested in fixing b=
ugs.
<div><br>
</div>
<div>Just curious. Why didn't those bugs [2] get fixed before disclosure? I=
t seems SD and virtio-9p are maintained now.</div>
<div><br>
</div>
<div>[1] https://www.qemu.org/contribute/security-process/</div>
<span>[2] <a href=3D"https://bugs.chromium.org/p/oss-fuzz/issues/list?sort=
=3D-reported&amp;q=3DType%3DBug-Security%20label%3ADeadline-Exceeded%20qemu=
&amp;can=3D2" id=3D"LPlnk757974">
https://bugs.chromium.org/p/oss-fuzz/issues/list?sort=3D-reported&amp;q=3DT=
ype%3DBug-Security%20label%3ADeadline-Exceeded%20qemu&amp;can=3D2</a></span=
><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Bulekov &lt=
;alxndr@bu.edu&gt;<br>
<b>Sent:</b> Thursday, October 28, 2021 22:48<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Paolo Bonzini &lt;pbonzini@redhat.com&gt;; Bandan Das &lt;bsd@re=
dhat.com&gt;; Stefan Hajnoczi &lt;stefanha@redhat.com&gt;; Thomas Huth &lt;=
thuth@redhat.com&gt;; Darren Kenny &lt;darren.kenny@oracle.com&gt;; Qiuhao =
Li &lt;Qiuhao.Li@outlook.com&gt;<br>
<b>Subject:</b> Possible reward for fuzzer bug fixes? Secure Open Source Re=
wards Program</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Recently a pilot for the Secure Open Source Reward=
s program was<br>
announced [1]. Currently this program is run by the Linux Foundation and<br=
>
sponsored by the Google Open Source Security Team.<br>
<br>
The page mentions that patches for issues discovered by OSS-Fuzz may be<br>
eligible for rewards. This seems like it could be a good incentive for<br>
fixing fuzzer bugs.<br>
<br>
A couple notes:<br>
&nbsp;* The program also rewards contributions besides fuzzer-bug fixes.<br=
>
&nbsp;&nbsp; Check out the page for full details.<br>
&nbsp;* It seems that QEMU would qualify for this program. The page mention=
s<br>
&nbsp;&nbsp; that the project should have a greater than 0.6 OpenSSF Critic=
ality<br>
&nbsp;&nbsp; Score [2]. This score factors in statistics collected from git=
hub<br>
&nbsp;&nbsp; (sic!). QEMU's score is currently 0.81078<br>
&nbsp;* Not limited to individual contributors. Vendors can also qualify fo=
r<br>
&nbsp;&nbsp; rewards.<br>
&nbsp;* Work completed before Oct 1, 2021 does not qualify.<br>
&nbsp;* Individuals in some sanctioned countries are not eligible.<br>
&nbsp;* The process seems to be:<br>
&nbsp;&nbsp;&nbsp; 1. Send a fix upstream<br>
&nbsp;&nbsp;&nbsp; 2. Get it accepted<br>
&nbsp;&nbsp;&nbsp; 3. Fill out a form to apply for a reward<br>
<br>
Any thoughts about this? Should this be something we document/advertise<br>
somewhere, so developers are aware of this opportunity?<br>
<br>
[1] <a href=3D"https://sos.dev/">https://sos.dev/</a><br>
[2] <a href=3D"https://github.com/ossf/criticality_score">https://github.co=
m/ossf/criticality_score</a><br>
<br>
-Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN0PR01MB63525F90A1E456E26D536225FC879PN0PR01MB6352INDP_--

