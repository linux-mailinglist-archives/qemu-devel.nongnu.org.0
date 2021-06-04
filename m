Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E239B8AB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 14:04:02 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp8YS-0007S5-Lo
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lp8WW-0005VU-Ka
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:02:02 -0400
Received: from mail-eopbgr30096.outbound.protection.outlook.com
 ([40.107.3.96]:24119 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lp8WT-00049Y-CZ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:02:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1Zc+gyKkUuLsFXB/YLjUfoyj66O04IqAIXGykOr7uMy7KM4JUQXM5M+TQq21x375unT9T+WZp576TuL8/OisKivd24u0xfWIMvpfNuhD+yF5H0VBu0Jny9XDSkrFz6gLdJjqZGN0ydOzGTw3rvAMdLJLPNUjQ29yqyuxRAvEsJI0ojJSvK+TRSmlEyylub2ALUwO74wGqRoE/aARrxmUS0JphDkZUei3Io27XKFbNJxWzczM6ClMqR01SsC6+n7xYvKLG7G+Mvk93yNxnHtCMf2pDFMNQxLkj8xuHfjA1AOdfYPcTHwrlVv2iFIVENeyDcygIGxwhFkSgXWKj657Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLlWOVnA/vCoGqHM5GU8oWXt77pGbcOr83aAkbwUSlU=;
 b=e2Pi0vpnMqe7q+/3QNdXazmS/Rzzr+FeuBW3L0IdaboStGkImfpGL2SPDL5B8etcmjbbQRnOwlf439RclZDMKqgqYiNaQUc8/g1tFd6y9QbDa/Ix+FndfwMSqEX7Qhp6V2EEEk73if1UVfYwiJ/pPK91RMT8zPIB5BPIiqBGkz2OT4duw64PjyAraAD7BG43vYeQhSODo+wM4K9Pf2yVavH3qupfyl9GHbP6EyKsZKwJmwuhxzHSPZERYKZQhoS8uCrJjc1K08FBxJMAA4uSCjR1ZLuCFJSMkoDAmJPLWS4ruUp4nuEYFOKc3+xcEide/1DLN47VOwQt4sukyzDxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLlWOVnA/vCoGqHM5GU8oWXt77pGbcOr83aAkbwUSlU=;
 b=trniST62W+vZ+8GdYOkolDgCGMsqI9yhhezQLyHVd/EVKVrzdF5Y5paGIajTd7Xp8/wvZ447EO2faKxOknEN/a6fh8ECLAJNvnpR8b21ARgzZroOzOSoRhPr0jGBcXYzyYwsLlxdy9PMUIym9UWhKpfrj/CdB/dnQIPXd+5SgRY=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by VI1PR0302MB3310.eurprd03.prod.outlook.com
 (2603:10a6:803:24::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 4 Jun
 2021 12:01:18 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf%6]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 12:01:18 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Vince Del Vecchio
 <Vince.DelVecchio@mediatek.com>, Aleksandar Markovic
 <Aleksandar.Markovic@syrmia.com>
Subject: Re: [Qemu-devel] [PATCH v4 0/3] tests: Reorganize MIPS TCG
 directories and files
Thread-Topic: [Qemu-devel] [PATCH v4 0/3] tests: Reorganize MIPS TCG
 directories and files
Thread-Index: AQHXVIf9i/w3AF4QN0CYE97j/uiv6qsDuxIs
Date: Fri, 4 Jun 2021 12:01:18 +0000
Message-ID: <VI1PR0302MB3486FEFB85B94E559057ECEB9C3B9@VI1PR0302MB3486.eurprd03.prod.outlook.com>
References: <1548343154-8774-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <DM5PR22MB16585EFE36FC0584D37F3724D29A0@DM5PR22MB1658.namprd22.prod.outlook.com>,
 <e5ca03fc-c412-9ad1-0d45-ee36dff9e4ca@amsat.org>
In-Reply-To: <e5ca03fc-c412-9ad1-0d45-ee36dff9e4ca@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [109.245.227.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eccf0bde-6866-45d6-947d-08d927507629
x-ms-traffictypediagnostic: VI1PR0302MB3310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB3310E4D048EE0F7B01CCB1CB9C3B9@VI1PR0302MB3310.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jfpuqj8CPzqs4NkiSWeFN+xnQNhGylXoWz7RdqVDSb9EdIcemqC/UxMx3GJgEyhND2fPlp90leaAaszQdqCKjbc0/y5IUn9KtDbgoGPbtqtbQv53oG/t23L1ECwPOWcWXvJThy6baEeCkMaHFLx1HbQHimDUMFmR4aP3oSxtBupSFdKqqlC17313GpCX1jPzzeGB6uSqbKWCGrcb34PHpFIWu8sa5/shhgktHWJViZyF+UFla0+fxe71aR7sNTyzhp2SxECkwSNLwGc/iXWphW5QXs5WH8cnfGdfbnRJzuQVRf7vNTQD0FRrSx5mf6u4aPN9GU8UifPdiWcx54ZocXLC0x4QK5IIoDiBbjL78x1OHj+/E63p8EDMhgZD8fCt2HfKbdS7ei4DldnhiP8ryeMOv6u2aEk40VP/gKJOUDeHOgCkyPge5e3HI1Kj3gqnUwX6DUnXhv4raPa8+kaqDE79yvL5rrCDc2DR3MMIZcoF9oV7dZ1hB6tPTxaH6dFMfc6ndsHbZFuKCQRbAcl7Ss2u9CMAyIitKuAMKPBk3LokzZUpIL3qUck9LrynrUSVVkIsTR6D9QBj46K9vIFt6nkFdKzwWx0v2VDxwT/fZp4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(346002)(396003)(136003)(376002)(366004)(71200400001)(19627405001)(66476007)(8936002)(6506007)(66556008)(7696005)(186003)(55016002)(2906002)(33656002)(5660300002)(9686003)(66446008)(8676002)(26005)(66946007)(4326008)(38100700002)(122000001)(83380400001)(64756008)(6636002)(76116006)(54906003)(110136005)(478600001)(316002)(86362001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?10DXMz/tiXsLJSQ8458LypKKsNLkNmEWi9ozasYGKWcX9//fyOMZMuENSJ?=
 =?iso-8859-1?Q?F+uxC88GP7uGwb5nv70n+wpUWIJ7FMbOjf5+EIBfv7vbd6LspZWmmYXZCu?=
 =?iso-8859-1?Q?V2Yoy13EhAHWStnTiH4zVS1dwOFRbyVi+uC7fdhO9A7KOVzdx8CjTVjWGz?=
 =?iso-8859-1?Q?utwLdJGp/FZQQY648/wxMNVzwPbM47/CtULO8UImxJmOs+86rlLoU7xwCS?=
 =?iso-8859-1?Q?O7L6eR9KsutApHIc2h9D5AFlROUcT6i3s+j9xOqSbhxiU9Oc4khC2R+hEo?=
 =?iso-8859-1?Q?+sUMTOR+SIA1ZDNGjVe0uqZTmQEaN4VECDwaLOTu/eVBe3yoeK2pBWiAfL?=
 =?iso-8859-1?Q?RNsAoZmqRUlsUkmfVocH3/kz/LcCZeRLv+RQ0T6OV0e0yjTp2LxgswldPI?=
 =?iso-8859-1?Q?dD6Upnk0q1+aQiQQJ1dfvnHoTJJUhUsG5O3tts0vpHQ8M22RiMkKq09Pi+?=
 =?iso-8859-1?Q?2UF1Y3mHZoeLUPHs0OuRiT0/Ps3MNx4M/RwOIlKkTKJ40eZlCd3XKMW0tI?=
 =?iso-8859-1?Q?3k5PUM0EPMLJZVjLdwOU0sAgib5J8/h58bIwPwjt1g6+DB+8JZl2ATMlT3?=
 =?iso-8859-1?Q?FNg/0xmerCh2H4SdFB8lrNON4GK/xD3YWwe94gxVnTyCGgrnKG1jolcn1T?=
 =?iso-8859-1?Q?BT4b8ePsk37+qd+VeEofc6utffYI3PSSBp3RV56S8zr+jxWtuFkEtQlz3K?=
 =?iso-8859-1?Q?Z3af/6NGZ1+xm09v2ZoEXGu8tjarZ5dNlSH5lUQ5R58k1SYnzxtD3PUooy?=
 =?iso-8859-1?Q?Zy8ydq8dJEwYKVCWCNUjIA1NGhX096AAsh1sRFGUGLD+cPVDK03ESH50Ca?=
 =?iso-8859-1?Q?5JrU2/jXP9FwDLvcFh9U7+j1M8yMkCFC6S/t96cp5sCenmsRhyZUYj1Qr6?=
 =?iso-8859-1?Q?DKI+nikUD599HsW9/ssuNgNys1bF1dTwFfiMsLjDwcNAtBv4X9i9VsBeMQ?=
 =?iso-8859-1?Q?TgLSdUOaRZl5nLHF4tcKjJPjdAk5o79FG/7SxhTfl8ID+IxsYdiGfZsbOP?=
 =?iso-8859-1?Q?9fqDjCmxNFWpS5rXuCjcmVPgqpbzTuaobBgIeyup6fU3Ljd1ChWOwxp637?=
 =?iso-8859-1?Q?9YG4wZC043XDuCpwqPKFaZOZD1erTsbZovDAoPCKsP76aBfvoohCQMhJtu?=
 =?iso-8859-1?Q?NKsVvzZ68NRkGRZVzAob8ndX8/2ChWObqelY5Kl8PHQfjWIfwdrEFAUPTI?=
 =?iso-8859-1?Q?yMsdU+0ZGPriR2ktg1BpXZ8FTupKYCDZbEUu/dlxsN0yNu2OGF4wsjHRU/?=
 =?iso-8859-1?Q?nzdCkIca12kc70k66dfh9dPeuV6MXbzPT8WcNfkFv4tMMHZ5jPEZzDFXEV?=
 =?iso-8859-1?Q?cLOfMfFcd3KsNCD4WKshxWkV5crekvW8FG62Nfms4pnGOdUI8LETLvVyu/?=
 =?iso-8859-1?Q?31BZx3SR9s?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB3486FEFB85B94E559057ECEB9C3B9VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccf0bde-6866-45d6-947d-08d927507629
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 12:01:18.0820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeOf5aLs6aeTNMcexhZ0NpURvgX7yW3xR6oAtZmWdkHWEF2B3HOvZkkdviAVEZqMCq5H+JzxR5qsQEYU8JNEJpAH5b++rBzY6gBjfwph2+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3310
Received-SPF: pass client-ip=40.107.3.96;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB3486FEFB85B94E559057ECEB9C3B9VI1PR0302MB3486_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

>>> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>>>
>>> Reorganize MIPS TCG directories and files.
>>>
>>> Directories for DSP tests in system mode are deleted. They
>>> introduce more complexity in test structure compared to the
>>> value they add. Still, these tests may be moved somewhere
>>> else, let's say in a new acceptance test that will boot
>>> "mips64r2" virtual machine.
>>>
>>> All remaining test will are user mode tests, which will
>>> simplify maintenance of mips tcg tests overall.
>>>
>>> The file movement is done using "git mv" command, so "git
>>> blame" will still display the original information, regardless
>>> of the new names and locations of involved files. Also, the
>>> command "git config diff.renames true" was used to keep the
>>> size of movement patches reasonable.

>> From: Aleksandar Rikalo <arikalo@wavecomp.com>
>>
>> I too think that this will simplify the test dirs structure and
>> maintenance. I cannot wait to see these directories populated with
>> new tests for various MIPS ISAs and ASEs.
>>
>> For all patches in this series:
>>
>> Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>

> From: Philippe Mathieu-Daud=E9 <philippe.mathieu.daude@gmail.com>

> Apparently this series was a bit too enthusiastic and removed
> many tests (MIPS64 DSP r1 and r2 for example) which then got
> never reintroduced. What is your plan regarding the "new
> tests" you mentioned?

I have decided not to put any more tests for the time being.

-- Aleksandar R.

--_000_VI1PR0302MB3486FEFB85B94E559057ECEB9C3B9VI1PR0302MB3486_
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
<div>Hi Philippe,</div>
<div><br>
</div>
<div>&gt;&gt;&gt; From: Aleksandar Markovic &lt;amarkovic@wavecomp.com&gt;<=
/div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; Reorganize MIPS TCG directories and files.</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; Directories for DSP tests in system mode are deleted. The=
y</div>
<div>&gt;&gt;&gt; introduce more complexity in test structure compared to t=
he</div>
<div>&gt;&gt;&gt; value they add. Still, these tests may be moved somewhere=
</div>
<div>&gt;&gt;&gt; else, let's say in a new acceptance test that will boot</=
div>
<div>&gt;&gt;&gt; &quot;mips64r2&quot; virtual machine.</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; All remaining test will are user mode tests, which will</=
div>
<div>&gt;&gt;&gt; simplify maintenance of mips tcg tests overall.</div>
<div>&gt;&gt;&gt;</div>
<div>&gt;&gt;&gt; The file movement is done using &quot;git mv&quot; comman=
d, so &quot;git</div>
<div>&gt;&gt;&gt; blame&quot; will still display the original information, =
regardless</div>
<div>&gt;&gt;&gt; of the new names and locations of involved files. Also, t=
he</div>
<div>&gt;&gt;&gt; command &quot;git config diff.renames true&quot; was used=
 to keep the</div>
<div>&gt;&gt;&gt; size of movement patches reasonable.</div>
<div><br>
</div>
<div>&gt;&gt; From: Aleksandar Rikalo &lt;arikalo@wavecomp.com&gt;</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; I too think that this will simplify the test dirs structure a=
nd</div>
<div>&gt;&gt; maintenance. I cannot wait to see these directories populated=
 with</div>
<div>&gt;&gt; new tests for various MIPS ISAs and ASEs.</div>
<div>&gt;&gt; </div>
<div>&gt;&gt; For all patches in this series:</div>
<div>&gt;&gt; </div>
<div>&gt;&gt; Reviewed-by: Aleksandar Rikalo &lt;arikalo@wavecomp.com&gt;</=
div>
<div><br>
</div>
<div>&gt; From: Philippe Mathieu-Daud=E9 &lt;philippe.mathieu.daude@gmail.c=
om&gt;</div>
<div><br>
</div>
<div>&gt; Apparently this series was a bit too enthusiastic and removed</di=
v>
<div>&gt; many tests (MIPS64 DSP r1 and r2 for example) which then got</div=
>
<div>&gt; never reintroduced. What is your plan regarding the &quot;new</di=
v>
<div>&gt; tests&quot; you mentioned?</div>
<div><br>
</div>
<div>I have decided not to put any more tests for the time being.</div>
<div><br>
</div>
<div>-- Aleksandar R.</div>
<span></span>
</body>
</html>

--_000_VI1PR0302MB3486FEFB85B94E559057ECEB9C3B9VI1PR0302MB3486_--

