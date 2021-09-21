Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7D4413ED8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 03:03:11 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSqfG-0003xB-77
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 21:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.wrona@mail.utoronto.ca>)
 id 1mSpV3-0000va-Hv
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 19:48:33 -0400
Received: from mail-qb1can01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe5c::702]:29844
 helo=CAN01-QB1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominik.wrona@mail.utoronto.ca>)
 id 1mSpV1-0004Hf-JI
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 19:48:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbMvreW84ZQEoa+1Xpd/q4swxguqN4w3HMXZ1REfE1YMyp30scsuaSrCdBVSpG0WlxqvdlAWVmmitcp6Da45f9wgJl2SpaoslaLZyAi16/aWuFpJbz5OXmD8VV0bqFxwIOF81HnlQWjRl/F4tfulpn94I1/9ZmfOxRUoK1iCdKkqEocB+l0RIbkVEwkqfjQB9v7GhfqyGJCw4zbJ+VE1BRtuCiArIY6Wz55KIF2eFG/zsOtwQqoSOsXQP3BQThA9W1+jbJ0nlWmg0Z7xr9uteb3GW7m4voVBPxbAw3O1LMd1iffWta3bOoJbVKa+KbaEd41zRHu6IDZKlfXqOe0MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=x2gSXH1q8br07x7853gGplzFWJUxwfCIvDly18jYlO8=;
 b=kdRG4E//wyPRZk+XtGkfltNOvyMRYJJ6eOd9HsrTmmuZ3hgv2eTUvyglVzNR8fFuhwL+Lw1MEDv2Z/0OkP5vNGizL59c5zHTYMFzmYJwpfbKk+T64A3ysWUExKfB3HhgMbIu4MVbPVw1uAAkb0FZGtvbqqv8W67xnND4/4BcV8yBSwAEi6mFpfsgUPykLqkEC0WyW2TdtShgmKv6XfY3rFO2CgRN3PGs5mHOzUyV1qy9aO1kD0VuGqIQAvgJbtHt5O5eX4TXgoctVq7qOz7a4ckX8MaLOZzegvL5hM2jlAmEPfWgJnYdi56BGDVfNi53SifOIpaCR5VHGOEDjCXIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.utoronto.ca; dmarc=pass action=none
 header.from=mail.utoronto.ca; dkim=pass header.d=mail.utoronto.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.utoronto.ca;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2gSXH1q8br07x7853gGplzFWJUxwfCIvDly18jYlO8=;
 b=lYg9GjtAdvYYySDH1MnhUalsphjyITpXSUF1ywjjJ3xmR0o7bsKjIwetzuswm3+Fx/rCpyiI74Bcse/Vs8rWSm7XlsCLxQ1Oc4TXLoD8VWG24wAzNCQpIRvtzvlCVD3edPAzbEC+FQqMYmJcFY6qN2da5cy6s59MQ8dahm/vmWw=
Received: from YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:57::14)
 by YT3PR01MB5249.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:61::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 23:43:26 +0000
Received: from YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ac41:57b7:50:b9bf]) by YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ac41:57b7:50:b9bf%3]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 23:43:26 +0000
From: Dominik Wrona <dominik.wrona@mail.utoronto.ca>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: unknown keycodes `empty+aliases(qwerty)'
Thread-Topic: unknown keycodes `empty+aliases(qwerty)'
Thread-Index: AQHXr0HJ9HaAnE3YQ0+e/qAlDZ/vOg==
Date: Tue, 21 Sep 2021 23:43:26 +0000
Message-ID: <YT2PR01MB579131DF362D8EAD69CD28BADFA19@YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 20399d6a-f460-ad1a-a78c-3267ed12584c
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=mail.utoronto.ca;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96ba370f-dc11-4b95-5e69-08d97d599bb3
x-ms-traffictypediagnostic: YT3PR01MB5249:
x-microsoft-antispam-prvs: <YT3PR01MB5249E2FB66E52387461BC112DFA19@YT3PR01MB5249.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tX+AfdQXKzrYAn8mhjy96A6qMh+9+5wUFt9FRGTRczLeW6y7QjZvOyHSQtsUgMT4v1P+mFHcL04kJMv6fQ15FTAMa3YCYRRCo3InXiSgkVZSCod5lTtJ7nZwGisl8UX07sFX3Ww+8sL7HQP5ZKPYV/+8Xp/NnfrUd0+vpsCPgzUAbqrmxAA4ydCK7sW4edkRpEebH6dgNZfcGIGM4n9V4c/eFQ5wQmLeJRkstRfawAyd+3BmFySND2uT2Qu8oYwouNeQP0FNXHDV9CYStFQZ2DuYRZUQu+mdeDWs8Lr9uFbf8KKYV9aoffJbSHu9b5/GdLVmpjMXA/odJJOU4KzZS2dEDF6hOVyOa6JgFyv219e3f5iSILLk4ev1rRLX7mjDEApY7BqFIKqqU1vqj5GBDSV6/QrRZU9xMPqbVxd7i4b9pgseUWtN4mCpLTjnaEPwq8vfUHyPt8X4nzy7UZ9clysPrvQQ/JjzwiwWs/bsDJ6JOAumskUC6U6I3l9kpV+v8RK/EbkP29mT068v8/1wQ5+Bw38wx+Ul5VkECWf1WgkiVQGftzCp/KusZYbRoBav5cYOa1ymjefoKRho3nEBx4fm/VkS/uDko4ZYceXgSsNLRd4CHrRae5qo8R8mwPVIinOhXHFH6YpEFyA9fjWp1EFBkkHXz0+IXeiV/8FtWDaXi17lWgnyze3/yRbVgjh7xRYqTYTwkAZ7zxNkkp4NdaDmbEFVE89ZHA4kbp7VxlI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(558084003)(6506007)(9686003)(52536014)(86362001)(7696005)(2906002)(33656002)(19627405001)(5660300002)(76116006)(38070700005)(55016002)(8676002)(71200400001)(8936002)(316002)(83380400001)(66556008)(66446008)(66946007)(66476007)(64756008)(38100700002)(6916009)(122000001)(44832011)(508600001)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tUH49P6E7gZa6kNNw/4rczl8Idh8piloTuXjYwanxKESwQs846VZPnLUKS?=
 =?iso-8859-1?Q?+XUAgKNvhnqgkOocSz5K2tziPMO18fadQIkQUO44DpBnzLf+1fFLoed2L5?=
 =?iso-8859-1?Q?LC0tD574y8wKbz8rMjaOsghh5k/qJtxZmxLoUGwuu3lPU4tk2jQ1Pb17w0?=
 =?iso-8859-1?Q?knSH0l164Fck/SnPex8sVrr+cu7faff0mFPwJ5b64dPSMb+XMg1E1KSMtK?=
 =?iso-8859-1?Q?K5UPu8YViS+CHeGLf2RxevTjEqCvO2Le17FJqT2SjvKQqkwtnqpWXuz0Wm?=
 =?iso-8859-1?Q?ogNPhNHPdMAmSnNIdsy8iMnp8jfortvoZLFALle26lENVmwqqTF4G9r+cX?=
 =?iso-8859-1?Q?ywObGJELihL+3PyNpllWDhNNlQ7GRy6dhc+CyTP/UTaFCWtbNDGewGFd9M?=
 =?iso-8859-1?Q?66BKFvI98F4bTNNZKL8VkqeTMNemxO2vyL6Sh01n7iD3ErnS58lgXQSm4Y?=
 =?iso-8859-1?Q?gBQllQmEHTnS0dPVXH9LcEFS+P1pZkW5SonRh8Hy2S/4HYXPOX4+avWIxB?=
 =?iso-8859-1?Q?vAd01+CCH+zwiYuQ/qoaFTGaesJkslnaMO2cUyfaIKACeP/GY7ehabrtkh?=
 =?iso-8859-1?Q?kH0+Joi5JTdUIgcQANHpbxzPd98XkYN+bjMVJCyQoS2TjJc9bme+4qxbp6?=
 =?iso-8859-1?Q?/63f7Jabz3hYPXzSEoSeaEL9WrqNyOL6lICtumJ7/BHUATDerjK0Em+t0m?=
 =?iso-8859-1?Q?wFY1pkSC1gCjPxDWCzTUCMQbxCRL+wOPwDOuR3M74s3PqdNa2lM2MR19X/?=
 =?iso-8859-1?Q?uISc7cK2iV5HqpV6H/eRLrQmLAoJF6wh/2VXIyy4CtNIznxsTqe489dCBr?=
 =?iso-8859-1?Q?hwMD5tJ5fZC+KjFwE8yyz6zkyHkOGNjQL87PtU/vVIujof12mrf9KG7U62?=
 =?iso-8859-1?Q?WhLAkUh9TSoFTq6bp/8PMO7D95LguqvrB8bLop7LeWqtvjNufG0n4Lq1Ud?=
 =?iso-8859-1?Q?rI7YuS4eJQ/aH4kvZAYQ3qhuB7WhgfCuneA2rD0yKSEbwkOXkMC2lHH8zI?=
 =?iso-8859-1?Q?tMwXio17H+wSqY+Hhhay38FydI82lCbRbdl/iiaYXp4WjLTBkVb22dt94X?=
 =?iso-8859-1?Q?4Q0wqlD7cYGBkafYVesxEdoCi5zhtN9C4c14jgeiN4VeXZRuJtPW46w7j5?=
 =?iso-8859-1?Q?uMF4cfGStgXUNdM7O5jYMOtxJGx0+BvX1z7HOjkBdcwTZwNHnIKct9V/hm?=
 =?iso-8859-1?Q?Hq9XLGjifWysHSv2RZVtgxTgiy1uaVeRo+BGlbH1elJXkaLD9GKL/jpyar?=
 =?iso-8859-1?Q?EE4V6Ce2n0HsOlTEMMt8A0lWcmzkhXTrqvNhKzvFfDx9RM/OAltBkLrRup?=
 =?iso-8859-1?Q?4yOe0eZu2Nb/s0JqeR2spOfxpdJqv15LyXRejcy9iDXaWwNAH9cQDOGNyu?=
 =?iso-8859-1?Q?xdF3BIKA8T9OXsSOFcb+FSsKryxMBW+p3I4eYH0D8zzM/ET9qW39Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_YT2PR01MB579131DF362D8EAD69CD28BADFA19YT2PR01MB5791CANP_"
MIME-Version: 1.0
X-OriginatorOrg: mail.utoronto.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB5791.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ba370f-dc11-4b95-5e69-08d97d599bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 23:43:26.6216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78aac226-2f03-4b4d-9037-b46d56c55210
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3f04DWpguqRe0tbc5Q8WxsoUZnU8zYa4E1n3o8pNscQj70dmA5tl1IRl1rl3lvoVdVLXAdwEVNldMb6fwCVuTqHGZ12HerRpSR6I/p0n2bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5249
Received-SPF: pass client-ip=2a01:111:f400:fe5c::702;
 envelope-from=dominik.wrona@mail.utoronto.ca;
 helo=CAN01-QB1-obe.outbound.protection.outlook.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Sep 2021 21:01:37 -0400
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

--_000_YT2PR01MB579131DF362D8EAD69CD28BADFA19YT2PR01MB5791CANP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

MacOS Mojave Macbook Air, running a VM via ssh-ing into a linux kernel 4.15=
.
My 'e' acts as delete, t as w, y as q, u as d in the login screen.

Unfortunate.



--_000_YT2PR01MB579131DF362D8EAD69CD28BADFA19YT2PR01MB5791CANP_
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
: 12pt; color: rgb(0, 0, 0);">
MacOS Mojave Macbook Air, running a VM via ssh-ing into a linux kernel 4.15=
.&nbsp;<br>
My 'e' acts as delete, t as w, y as q, u as d in the login screen.&nbsp;<br=
>
<br>
Unfortunate.&nbsp;<br>
<br>
<br>
</div>
</body>
</html>

--_000_YT2PR01MB579131DF362D8EAD69CD28BADFA19YT2PR01MB5791CANP_--

