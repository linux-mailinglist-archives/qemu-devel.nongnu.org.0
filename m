Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD156589A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:28:24 +0200 (CEST)
Received: from localhost ([::1]:47750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N3n-0000fx-BJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1o8L6I-0002SY-A2
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:22:51 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com
 ([40.107.6.111]:32768 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1o8L6E-0000WH-MZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:22:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtH98k3kxoCBhLDvcn5jBuiw9D2opKpBh6rdDK4q2e4lFlACS4sSHqi7J32zI9hCRPSpJeVFZkmyWT4X4pnEbaX6YVIrP3K5bNzNOUu7EwOUnGCCRKHXP4rt7+ClfdKbba7L/6BthppLnN6VUxDOfzZzQY3BtkMusSoePZlT4rc4Fmr9mNyN7GZDB5l+/BjYQTDjjCYx9KKrdLmAnnUp2e7wVEaQuMN7YsHvU4uUskr13FU3Sj04As6hIq9du9w6dLgLF88WtXG0P/Ozc09HCQFe1zyxdbDtnseiDt9NTw4vfb7ZU+Pl3y6NVz7mB5boCzmMty8B8DtMj9Ox2fuXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o41r1PgL/zUORP9EgDl6eU6I2MqgOaAKDT3gRsZeWk=;
 b=mVfqOYvofahQLPloRbJMXJcOlx792z7zRpN/aW+cE8l/r0m6EA9+YwuKhhBoMoqpJdnpYldEpeKB6VpFtLjWo52nSPjU20Tm5lx+JuwBNorRwLrypMHFZfdLt4Y/qAAKloAVG3Bcx4vXfCJt06AN5iFOs2KL+P74qoOCPy0lq012LkMq6WYa9DICyTiNNMPGQzctWIt2klnPmopxCtdk+/k2d2TRe4PqbuuYS68K4y0ilX/BrnhrefISv04iU0i2J5VgTbahyzQAZIpw7kj2HXQT2yeHv/uSQTX0gvyzJ5NNrB6y9J71i60tRZpJ+OM4UlYUPLW1KOWPtCcomMW0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o41r1PgL/zUORP9EgDl6eU6I2MqgOaAKDT3gRsZeWk=;
 b=Syo6xO1e3ER5SGAl3SMrBGSMTI12wU33btPVtGPc0Jynfnmm66B9OFs1txeb/iAs2zATYWrldoi0TiC2owa9sTn8uyYIG70kSxEcI9wZXc7dzzmcko+8ynzvH79snetSZBEcAcOekgqXJ2CE/yF+nYsPrq7Hr60bsw2LYXHNTKw=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VE1PR03MB6046.eurprd03.prod.outlook.com (2603:10a6:803:110::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 12:22:42 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::bcaa:7ab0:a9d7:5aa9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::bcaa:7ab0:a9d7:5aa9%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:22:42 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: "thuth@redhat.com" <thuth@redhat.com>
CC: "cfontana@suse.de" <cfontana@suse.de>, "berrange@redhat.com"
 <berrange@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, Djordje
 Todorovic <Djordje.Todorovic@syrmia.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: What to do with the nanomips disassembler (was: [PATCH] disas: Remove
 libvixl disassembler)
Thread-Topic: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
Thread-Index: AQHYj5+3dcS61XJ34kKia7znnDCxWA==
Date: Mon, 4 Jul 2022 12:22:42 +0000
Message-ID: <VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9@VE1PR03MB6045.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d27dcb54-3da1-e08a-321f-1fee2b83cc21
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 961181da-6f21-4f83-d5eb-08da5db7e4a8
x-ms-traffictypediagnostic: VE1PR03MB6046:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h6rCxNorzZ3s/4gvYgnohGeVmdej87Y9uQS8BPYeb9pC+v70CrwBPoh8SXR3FRQ93Q0uybFrmcHknyzm9XdoBb7Z2H63NCZ2AB6gJ2onnEDVUjHEseqfAQqRcLmobH60e5kpO91xLj74wYPKb7GhJmPLWmjOmUBsmGZUdNwadYUTNaheoSJpA9CXrjvAmUtOWUhwwVnPoVUkF3EsyA7uTn6/bFcsj9F/d6mQFPytmz25WgqxdUQhNvH7N3tcX5VBx1Qv5hiZglBZ9EGNyKpOl2OyVBkIyugs7OYQV0su7TRcUzBYJFc7rWdfEFp9aWuTAXbtZkkDUqhOrTvJJ3yuqEHrNx+VWEbR4kdwCSCysnKgOl6hwlbpdz6cvQOc1BINx0g512vpb2XScUd7Bx9/sUCh2MZXZ3/fu3Pk2KEFLGLqXigsLzyspkRni9qpYa4pcUk51TkGa6SaP1x+kSoMO8jxpyd6AXXN0oy0ZHYDxDlG72vAlChdcsbVrSZUGneizfvQ3WAblcg+7Ea+VKMUw4qoi8E6171iJ4Vqj18rQfQe9gkWlBxSlh4i/U1GLVdMi6n32HRXMM2JhqYJIRLvpbnCC9c93GysrQc9BnIzCsY9uViZH1YCDGoF1z3hJYkFo6zdFbBxLA2wNOpufiYWTnrdBsCumRFXIjZxv9GzoTS/VcHGo+V5tWKRU51s+AibMhSrmpWlp8zHW7pRrJ4YeUO1QAjfKA6FQ1ERZhhg8c1FYXpFIQvt5bgnoU1zz7/tHTnIJFrc5gOutZeHwsBtSGlt6AfX3bRpBQj2nZQU4h/YWfhUKuGaLQ6MOnKuwBCU0tcjSnM7SWNk3Bw10glntJEqg5stfVDgxzRwdY77BGM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(39830400003)(376002)(8676002)(66556008)(66446008)(64756008)(4326008)(66946007)(66476007)(2906002)(55016003)(52536014)(5660300002)(76116006)(71200400001)(8936002)(316002)(19627405001)(966005)(6916009)(54906003)(478600001)(33656002)(38100700002)(41300700001)(122000001)(166002)(38070700005)(6506007)(53546011)(7696005)(9686003)(86362001)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kwOnY6PIbjJkytNYMh8IOVKJPjnnfY88mHrvOc+q+Zv3Eayn+eTDu9rWrV?=
 =?iso-8859-1?Q?4rGL3iqzikA0DA0/lu46bBlVtLQK8AkRgB90vPED+NU7rWj4EJyt7b41Iu?=
 =?iso-8859-1?Q?OArw0uCvgmUibQ+vHz5oJjqvaB2Zox00lZRwA1wvLbDEVDgSHBgKX/xj9q?=
 =?iso-8859-1?Q?H8YZVu9fk1ZULL4aawf/n7Rlqp1cp2y6/u7fYwK4Kog6t+ie6/oLKdM2hS?=
 =?iso-8859-1?Q?GauJraUxfYPNvVhSxGJDlr9Kuu2kQI/iawpkhY9kQKoh1TFzP6Mx9XgT7D?=
 =?iso-8859-1?Q?kue8baz5jctBf4mwGU0NijQxRhQXdvrIiyRJBmh4T96GPBpoSYrbGYRQKy?=
 =?iso-8859-1?Q?jm5zC8ISCaXrvq/V2pGP5060KP4LXDehZVaam/vD/5Y/Zsn0ieQN7Y1Po2?=
 =?iso-8859-1?Q?NLOY46B1XZTB/Yr6xWNgmfPw5SqEVHmrzk5R6UbXn5Qv0JScvjlcME2aWb?=
 =?iso-8859-1?Q?z+oddfFgdF0vNKMzPF4skKXcDxYhYYiNv+F4jdIZSiSJEyPG/BK0kgQphR?=
 =?iso-8859-1?Q?dBu9SRYnq/86020hZ9mS+RjDNZJDlw6xPMOTAi8JNTpawSTabA0pqqRbYr?=
 =?iso-8859-1?Q?7kkaWfFDvceMgV8L7itCjFSO15lxv8rwX0Ev153m6Y/SYF3N5NlbQJq5L+?=
 =?iso-8859-1?Q?o0XGHpLMcg2rD/M3V69E5a/YBAQ4oHZSmyDKl4dhb6kkkLpnKJOdeoY3On?=
 =?iso-8859-1?Q?eQJ+dfpTlmRQPqJA6gK0T49KdgF1x0sA+uwkTG51cvozgvkS3MlAhlPh/O?=
 =?iso-8859-1?Q?sekHdOlYgg92mQBV5J5lu700gK2KHhbqt++EMaJIEfC5mkouWsff1/eGdn?=
 =?iso-8859-1?Q?WGz+Zbtgp8L83eksCbPFKkBreT4gbB9uIiVqtF4zJMUB6JPi58Yixjb4FB?=
 =?iso-8859-1?Q?d2zpx30uos72ctt0Kqg678NoK/v7TYvu5WVkoQb9yHxb6+/lwpcH+ZsA4Y?=
 =?iso-8859-1?Q?7hVUrnT/p2ByuohMfurA4dgki8JmN07ErP+H+bG856BsM1XmZGaHv9sIIs?=
 =?iso-8859-1?Q?bPRmAkMaT3cRMe24sbuw4FAgvPErRm4XmiqHUqPwrpb3ilDlcxsMC9ZrZg?=
 =?iso-8859-1?Q?pa7v5o6WS+uF5vUqvvc5rFGpwV9cEyI5nZfml+2T9VGEqVAqezK9cecTJZ?=
 =?iso-8859-1?Q?CEvVJPOERQJU8mQt3pcRfshoxF14i2d45B4h3i/JNDVk0liwx/adWb0pp/?=
 =?iso-8859-1?Q?KDlD8ph+LLjdojuvJrKaQjIZ8hTcHXB8/vABVeQ+9OUc625QbZat3Bl2NJ?=
 =?iso-8859-1?Q?RQuB6yTazTS0QF9GzY8YXWvPoFbtJC33TILxyK8kKhlWKDreMNuRkSgLGE?=
 =?iso-8859-1?Q?w2oKTqfYRgtiy3jz2u/kwPSZMj0lt4qSwmoOP6NnlyyNxCXvvAkWEtpURm?=
 =?iso-8859-1?Q?Y4N1TBz4NCD47WYgcw/6undf1z0Xn8FQTWGWHAXPYR0BlMdAIpY2mo2TsM?=
 =?iso-8859-1?Q?6zc8q/UfkHJVmduLk+6iw3zS2E9Dt2Slz9yaO0/0f5ovhrZTDKeSFNhTHq?=
 =?iso-8859-1?Q?XPlPIZ6kuzrNp4wZelm0rQ2bGhl07DGDCH2QZ5tVwfhhbrccFGO9ZC1oS0?=
 =?iso-8859-1?Q?XaTwzj26ts8v+k2wizn/sgtx1aFg5T53SePksb5pGqTRJPajvCipJpJsyo?=
 =?iso-8859-1?Q?RBsMP5Dp0Ir+xnedPSfsTkAKrZ8uBPf9tLghqzR3j3INwsb+nxEWSu+w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961181da-6f21-4f83-d5eb-08da5db7e4a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 12:22:42.2546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1MCoCXqz7Tc0p+gk5oA5C8ZDoYy2B/Wz4JbCncUsYX8kjuSNfpFlyzILpQLMSH/i15Mbj0n4IOViJb/w7Nxs22RUEdWtMFzkDzSZ8msZgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB6046
Received-SPF: pass client-ip=40.107.6.111;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Jul 2022 10:25:19 -0400
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

--_000_VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9VE1PR03MB6045eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

FYI: Copying the conversation.

=3D=3D=3D=3D

On 09/06/2022 18.31, Vince Del Vecchio wrote:

On Thu, Jun 9, 2022 at 10:34AM, Thomas Huth wrote:


On 09/06/2022 16.15, Claudio Fontana wrote:


On 6/9/22 13:27, Claudio Fontana wrote:


On 6/9/22 10:57, Daniel P. Berrang=E9 wrote:


On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:


On 08/06/2022 17.51, Paolo Bonzini wrote:


On 6/3/22 19:35, Thomas Huth wrote:


On 03/06/2022 19.26, Claudio Fontana wrote:


[...]


maybe something we can now drop if there are no more C++ users?


I thought about that, too, but we still have disas/nanomips.cpp
left and the Windows-related files in qga/vss-win32/* .


That is pure C++ so it does not need the extra complication of
"detect whether the C and C++ compiler are ABI-compatible"
(typically due to different libasan/libtsan implementation between
gcc and clang).  So it's really just nanoMIPS that's left.


Ok, so the next theoretical question is: If we get rid of the
nanomips.cpp file or convert it to plain C, would we then simplify
the code in configure again (and forbid C++ for the main QEMU
code), or would we rather keep the current settings in case we want
to re-introduce more C++ code again in the future?



It doesn't feel very compelling to have just 1 source file that's
C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
file - perhaps it originated from another project that was C++ based
?

The code itself doesn't look like it especially needs to be using
C++. There's just 1 class there and every method is associated
with that class, and external entry point from the rest of QEMU is
just one boring method. Feels like it could easily have been done in
C.

Personally I'd prefer it to be converted to C, and if we want to add
any C++ in future it should be justified & debated on its merits,
rather than as an artifact of any historical artifacts such as the
code in configure happening to still exist.


I'll take a look at it, maybe I can turn it to C fairly quickly.


It seems to be generated code, getting the original authors involved in the
thread.


Not sure whether the original mips folks are still around ... but the folks
from MediaTek recently expressed their interest in nanoMIPS:



https://lore.kernel.org/qemu-devel/20220504110403.613168-8-stefan.pejic@syr=
mia.com/

Maybe they could help with the nanoMIPS disassembler?

I know it's likely a lot of work, but the best solution would maybe be to a=
dd
nanoMIPS support to capstone instead, then other projects could benefit fro=
m
the support in this library, too...

If I googled that right, there is a LLVM implementation of nanoMIPS availab=
le
here:



https://github.com/milos1397/nanomips-outliner/tree/master/llvm/lib/Target/=
Mips

... so maybe that could be used as input for capstone (which is based on ll=
vm)?

  Thomas


Yes, we are working on an LLVM port for nanoMIPS.  It's functionally comple=
te
and pretty usable, although we're still tuning performance.  The more offic=
ial
location is https://github.com/MediaTek-Labs/llvm-project.

However, for now we're still using the binutils assembler; there's no encod=
ing
information in the current LLVM description.  We have tentative plans to wo=
rk
on encoding and integrated-as later this year.  Correct me if I'm wrong, bu=
t I
would assume that, before that's available, it's not feasible to use capsto=
ne?


I'm also not very familiar with the way capstone translated the information=
 from LLVM into its disassembler source files, but I guess you're right - t=
his likely cannot work yet.

Regardless, I think we can look at converting the existing disassembler fro=
m
C++ to C.  That would address the current concern, right?


Right - if it's not too much of a hassle that would be great!

 Thomas


Hi everyone, I am interested in taking on this task.


Milica






--_000_VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9VE1PR03MB6045eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<pre style=3D"margin:0em"><pre style=3D"margin:0em"><span style=3D"color:rg=
b(29, 28, 29);font-family:Slack-Lato, Slack-Fractions, appleLogo, sans-seri=
f;font-size:15px;font-variant-ligatures:common-ligatures;orphans:2;text-ali=
gn:left;widows:2;background-color:rgb(255, 255, 255);display:inline !import=
ant">FYI: Copying the conversation.<br><br>=3D=3D=3D=3D</span></pre><br>On =
09/06/2022 18.31, Vince Del Vecchio wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On Thu, Jun 9, 2022 at 10:34AM, Thomas Huth wrote=
:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 09/06/2022 16.15, Claudio Fontana wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 6/9/22 13:27, Claudio Fontana wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 6/9/22 10:57, Daniel P. Berrang=E9 wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas =
Huth wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 08/06/2022 17.51, Paolo Bonzini wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 6/3/22 19:35, Thomas Huth wrote:=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">On 03/06/2022 19.26, Claudio Fontana wrote:=0A=
</pre>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
</blockquote>
<pre style=3D"margin:0em">[...]=0A=
</pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">maybe something we can now drop if there are no m=
ore C++ users?=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">I thought about that, too, but we still have disa=
s/nanomips.cpp=0A=
left and the Windows-related files in qga/vss-win32/* .=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">That is pure C++ so it does not need the extra co=
mplication of=0A=
&quot;detect whether the C and C++ compiler are ABI-compatible&quot;=0A=
(typically due to different libasan/libtsan implementation between=0A=
gcc and clang).&nbsp; So it's really just nanoMIPS that's left.=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">Ok, so the next theoretical question is: If we ge=
t rid of the=0A=
nanomips.cpp file or convert it to plain C, would we then simplify=0A=
the code in configure again (and forbid C++ for the main QEMU=0A=
code), or would we rather keep the current settings in case we want=0A=
to re-introduce more C++ code again in the future?=0A=
=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">It doesn't feel very compelling to have just 1 so=
urce file that's=0A=
C++ in QEMU. I'm curious how we ended up with this nanomips.cpp=0A=
file - perhaps it originated from another project that was C++ based=0A=
?=0A=
=0A=
The code itself doesn't look like it especially needs to be using=0A=
C++. There's just 1 class there and every method is associated=0A=
with that class, and external entry point from the rest of QEMU is=0A=
just one boring method. Feels like it could easily have been done in=0A=
C.=0A=
=0A=
Personally I'd prefer it to be converted to C, and if we want to add=0A=
any C++ in future it should be justified &amp; debated on its merits,=0A=
rather than as an artifact of any historical artifacts such as the=0A=
code in configure happening to still exist.=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">I'll take a look at it, maybe I can turn it to C =
fairly quickly.=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">It seems to be generated code, getting the origin=
al authors involved in the =0A=
thread.=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">Not sure whether the original mips folks are stil=
l around ... but the folks =0A=
from MediaTek recently expressed their interest in nanoMIPS:=0A=
=0A=
</pre>
<tt></tt><tt><a rel=3D"nofollow" href=3D"https://lore.kernel.org/qemu-devel=
/20220504110403.613168-8-stefan.pejic@syrmia.com/">https://lore.kernel.org/=
qemu-devel/20220504110403.613168-8-stefan.pejic@syrmia.com/</a></tt>
<pre style=3D"margin:0em">Maybe they could help with the nanoMIPS disassemb=
ler?=0A=
=0A=
I know it's likely a lot of work, but the best solution would maybe be to a=
dd =0A=
nanoMIPS support to capstone instead, then other projects could benefit fro=
m =0A=
the support in this library, too...=0A=
=0A=
If I googled that right, there is a LLVM implementation of nanoMIPS availab=
le =0A=
here:=0A=
=0A=
</pre>
<tt></tt><tt><a rel=3D"nofollow" href=3D"https://github.com/milos1397/nanom=
ips-outliner/tree/master/llvm/lib/Target/Mips">https://github.com/milos1397=
/nanomips-outliner/tree/master/llvm/lib/Target/Mips</a></tt>
<pre style=3D"margin:0em">... so maybe that could be used as input for caps=
tone (which is based on llvm)?=0A=
=0A=
&nbsp; Thomas=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">Yes, we are working on an LLVM port for nanoMIPS.=
 &nbsp;It's functionally complete =0A=
and pretty usable, although we're still tuning performance. &nbsp;The more =
official =0A=
location is <a rel=3D"nofollow" href=3D"https://github.com/MediaTek-Labs/ll=
vm-project">https://github.com/MediaTek-Labs/llvm-project</a>.=0A=
=0A=
However, for now we're still using the binutils assembler; there's no encod=
ing =0A=
information in the current LLVM description. &nbsp;We have tentative plans =
to work =0A=
on encoding and integrated-as later this year. &nbsp;Correct me if I'm wron=
g, but I =0A=
would assume that, before that's available, it's not feasible to use capsto=
ne?=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em"></pre>
<tt>I'm also not very familiar with the way capstone translated the informa=
tion </tt>
<tt>from LLVM into its disassembler source files, but I guess you're right =
- </tt>
<tt>this likely cannot work yet. </tt>
<pre style=3D"margin:0em"></pre>
<blockquote style=3D"border-left:#5555EE solid 0.2em;margin:0em;padding-lef=
t:0.85em">
<pre style=3D"margin:0em">Regardless, I think we can look at converting the=
 existing disassembler from =0A=
C++ to C. &nbsp;That would address the current concern, right?=0A=
</pre>
</blockquote>
<pre style=3D"margin:0em">Right - if it's not too much of a hassle that wou=
ld be great!=0A=
=0A=
&nbsp;Thomas<br><br><div tabindex=3D"-1" class=3D"x_fEEQb x_BeMje x_TiApU x=
_allowTextSelection"><div><div><div><p><span class=3D"x_elementToProof" sty=
le=3D"color:#1D1C1D;font-size:15px;font-family:Slack-Lato,Slack-Fractions,a=
ppleLogo,sans-serif;text-align:left;text-indent:0;background-color:white;wi=
dows:2;font-variant-ligatures:common-ligatures;orphans:2">Hi everyone, I am=
 interested in taking on this task.</span></p><p><br></p><p class=3D"x_elem=
entToProof"><span style=3D"color:#1D1C1D;font-size:15px;font-family:Slack-L=
ato,Slack-Fractions,appleLogo,sans-serif;text-align:left;text-indent:0;back=
ground-color:white;widows:2;font-variant-ligatures:common-ligatures;orphans=
:2">Milica</span></p></div></div></div></div>=0A=
=0A=
</pre>
<br>
</div>
</body>
</html>

--_000_VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9VE1PR03MB6045eurp_--

