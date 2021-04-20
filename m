Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553C365F82
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 20:36:14 +0200 (CEST)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvEL-0004xL-1M
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 14:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lYv6C-000316-4l; Tue, 20 Apr 2021 14:27:49 -0400
Received: from mail-eopbgr800108.outbound.protection.outlook.com
 ([40.107.80.108]:13952 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lYv68-0003nt-GN; Tue, 20 Apr 2021 14:27:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drJ89hWSbAm9ZAV0W1D+NElIqhc9pSiEoOKvI7m/Ols5aHpSN0DVEoeYm1b2xcwbY1gFreygtlboOZJi/6sC/N5NGsO2FSh1eeg6/Rb/7NT0ukYXifivmpC+qW1Iw6E/f5KpOZpaIzS77ga4esrhsYeJ8qcRirlDZv1Sl2kLze4IJppMoEaAVD3s073srUzVfKZ0idtg57G1eo51XtZQYRPIM6fU3GFtRO3j/ug+FIhvEMTWCkW9PPSoE6Mds/MUbfqG4otegcN+CvGpQ1Q2vqRUrAguX6iQ5ozmy8oCytLkrYNcICGhGmg0a37jMpZ+R++K4+zPmcrkceK29Qkkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4+bAADtHE6BMMSN/Xb5DWAhQ0uIGFtTy3CstviHa3U=;
 b=V8bZLVwWQ3xLqPNx6f4/WGVBW+Nin8IHAA2c5UPu4xO8ZXocKVsxJXqPdYY+jzB5o4wmWNi4xVbslrmJb1FNOTUSLp2txl/vkUZJW8r4QgovCagu/K3pREbBXwQKoGBzaXDR2OBxh0e/1uWnIu3c3WC5qjipItlhlZCaiEZwy7yeJhi8Z8NvRer7y6bV06PMo/jA6lCGjYl+OQ0+DUrjCvVmeM++parPTIwgbAGqyJpCoGsHgf/MMz9NBxwvr4Im5coztkVA/mGWRMYEtLnJ926r/r4RqGniMwiHToufCZ7HWJ/PqhOFm8HCBJYoyy7EZopIKsRrO8jBnehbUgjYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4+bAADtHE6BMMSN/Xb5DWAhQ0uIGFtTy3CstviHa3U=;
 b=RubQwMdAfSwHSl//j9fpWeRGXNdOVcxnpyyvHVCAMYUzlRLHwEh3mgI2MfoRGxAgTQ8h3HtAYPdjM8rfyTq8T1qNmuJX84n3Ex2X3qeUL+FvlWF0XnncImWV2DafIbKZevPCjjPIYA6wi7LIp0IE39MLCK8RbUULHrls6OGfQMX7mp1wyFs9jPsOvr9i8fl60q7ayZZ/zK0PSL0iDVOo/DtoQdWopQWJTKVWH+caVK4X/asa9h5LqFcSvCkYm4G4nZCqwvc4vKM6d35FIRhx/pCaZWfMyMUzaHjZS3NfvFNs8ImZUvjiAKov8GxCgvakEU3VPRz0fUTrr3TCe6jHBA==
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com (2603:10d6:4:b::11) by
 RO1PR80MB5788.lamprd80.prod.outlook.com (2603:10d6:4:c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21; Tue, 20 Apr 2021 18:27:38 +0000
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf]) by RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf%12]) with mapi id 15.20.4042.024; Tue, 20 Apr
 2021 18:27:38 +0000
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Thread-Topic: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Thread-Index: AQHXNg/KpvodGXAHTEe7WCf/a4WmMw==
Date: Tue, 20 Apr 2021 18:27:38 +0000
Message-ID: <RO1PR80MB561024219A35A26C418CF51BCE489@RO1PR80MB5610.lamprd80.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14d:8084:88a2:39d5:2a6f:42d8:e085]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0bbfdc8-9650-4903-d545-08d90429fa01
x-ms-traffictypediagnostic: RO1PR80MB5788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <RO1PR80MB5788E2E2CB7140BBF52F2A53CE489@RO1PR80MB5788.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a4tj0Fidi2YcSfzTBagon4VSvgJui8rp9jJ9f7yXBntWG3VMKufPTMplOQ5QzIqoQ+cTGt1dYw3ZKM/owedjxT5vTBKyFsw3RAKHFUycKy3PBXG60gn1Qk5O2nOcxZ1C4zwZw2scxrIbK90qbs79XZ3zvLt6dgJnKMDr3q/FG5BLPEIZakdKEn96RtO+mhE66/frCojvHgORtZ+5r9kLySQFL9bmYfSUVsmM32nl3wX2NUZERqqLp98GZQ8iRb3ITGR1ZrL/isvFVPZLLsSDCaXZyYkScfZ4GhP68C0TDhdiu6wnjEEed5LEh94akBmyhy6jDLWuM944j89FxSL+KfB9iyzh+1hJQsnGfdrG+7O8Lm/EWDoAzTrI6HDn6Yayjyu8ouAu8Ecp4jKqGD+5d+o+7/qpZ+GEm24AHR8HsuTXEvK91FfLoR7Lcelze2N0GXkl++268xtFhyfzWDUSeI2EeE2FCH6UrTIqN4f8hgDlbIeXIJIEacWpir1MXDbHpimfg44xOtblK89wFFNoosYaQuQpWkxHfMOqEQSdqlsKLForw3WvB+AOADGdQfqsKfKOGF5gVBAk+xvshblV/k2GzfR2LACbbKyiIryka9M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:RO1PR80MB5610.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(39850400004)(396003)(19627405001)(6916009)(478600001)(5660300002)(2906002)(33656002)(86362001)(8676002)(54906003)(71200400001)(122000001)(55016002)(76116006)(7696005)(6506007)(66946007)(66476007)(64756008)(316002)(66556008)(66446008)(9686003)(8936002)(52536014)(4326008)(186003)(38100700002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?uvqYvJjXw39u6IbedioCEeih/0t6qs870siJ0JDtPQfyvcrCtfMkqJ0ARv?=
 =?iso-8859-1?Q?0eqlS0hqiR/zbSVQgmCrjBXoNWLQ8Hb6X7wkH2qkSb7CSmuKj/HXXJcVSd?=
 =?iso-8859-1?Q?Gqwxv8cJ/1sF2gPZP+2oPPgeAW2eBTxlm9P2GP66ocmuS3niK1cnW+WsYo?=
 =?iso-8859-1?Q?XSk5QVsTkUPOzKyBLza02Gbo1zHTsv11DRRIyvnYPEHl5fxEFbrW+XDast?=
 =?iso-8859-1?Q?K1JbvOuwhMUVoT/KochdQE5Dde3a3Zzmti3G9G2kXnQ9jZOjvfWwJI3yyG?=
 =?iso-8859-1?Q?1sN1AzIq2HnFnkgdFOrZY+pIW5/qu5URN3teGuH8LTB/bCDe1UELOtLu24?=
 =?iso-8859-1?Q?q3hipFIjONp69bzRVgo5SFb71GKuW91RqEJqejYoYqI2lQJsprWbB5wHQN?=
 =?iso-8859-1?Q?gM2CmimUZQnEWzC5hALmWe8+9yrwQtOJoTELW+CJfqzfbCjoBr7QF0cCAP?=
 =?iso-8859-1?Q?DfLKJgMN6sallA9U/LWqNIxgzgJgXShbeFd57ubJ3td7ug6vn6B62uSr6k?=
 =?iso-8859-1?Q?l88NQbg+U3DyVHXLIXoO8vJIc2y6ZhZ/ZgB9cMTlePHh6AR7atwcEnxDUD?=
 =?iso-8859-1?Q?vaoBekUKqLsdbKyda+NhuADMc96Tul+L74HZiEUVfjMJ5oUeupg39CgiWg?=
 =?iso-8859-1?Q?jIy8BBlItztw2JalFtYmXfi8NMfRUH7F9I+4h+ROe/uejzsNMFWo+Q1hkD?=
 =?iso-8859-1?Q?CCL7ifmYGfVJ5XZE8Tlk0q8wcb5jDOOR1Ra4zQeEvhnyWlHjDqj6TX1+Yk?=
 =?iso-8859-1?Q?63PZpy+Xi3BWaVdGnAw3V8D2SYUWCBvO5NRU4JaquziaN4PIkHy+Us9WR6?=
 =?iso-8859-1?Q?md46kvAGH1fc6mg8AbwhSm5kAPZfCNDPmTvx6yEyKQQbmTaNLEvJynPZ8m?=
 =?iso-8859-1?Q?DiZP2JG5Hrjb09127bx5Y3A27WbxZNkGn79DCdY2JAlvScHHl17Aewvji+?=
 =?iso-8859-1?Q?5vkd/ZPPxv/VuM3uGR/3sgAu4ptcqrueeLNECQpjgqH0VpdsozHBY+7Idt?=
 =?iso-8859-1?Q?GwlLlNkR/pLJDT74EMLBkeKJWibO6iiDFurWFLtHGEAlozmvz9N0w9Phqm?=
 =?iso-8859-1?Q?1W0/PIUUeFpYOx1K0Uq2fAre7MkAwXmpTKX7l67AX/PSZEhTns+NaMsatD?=
 =?iso-8859-1?Q?CZSijnFDMZtJrawCN9Tou0KN1/jOfCl1my3baXKamQO+vrSNVl8CrDBJil?=
 =?iso-8859-1?Q?XdXOxQmeti7P7bBmC2+bAfsvGUk1G1aF8+iafLhcLOd5Ke/7VX7bzW6xc2?=
 =?iso-8859-1?Q?W7hHFjmDXb8d4gHM7goWVXS1xOZbxzST9Norj+KarCgG0TGXeli/TT4jp+?=
 =?iso-8859-1?Q?9ViJUm1z/8+kiW8ueHYqZnM3cFilUiTSjv/dyXi9rlz1S1HD0y7nbp5dt+?=
 =?iso-8859-1?Q?HIVVWgfCoi8/WxXktCP8hAjJAYYejMjpxwS7ZzjVgN2S8YUVFCLDGs/C56?=
 =?iso-8859-1?Q?CXFv14LbQffUHA4S?=
Content-Type: multipart/alternative;
 boundary="_000_RO1PR80MB561024219A35A26C418CF51BCE489RO1PR80MB5610lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: RO1PR80MB5610.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bbfdc8-9650-4903-d545-08d90429fa01
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 18:27:38.2970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMLoP/N+lY6AlJTv96i86tgk/NJK0XH0nQeHb//AThGXTKQntR/6JBdFoiOOJ2p7TPeVwJReQo2oW+SaSJe9+WTRz8y2W8yJYeepDT6h94Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RO1PR80MB5788
Received-SPF: pass client-ip=40.107.80.108;
 envelope-from=lucas.araujo@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_RO1PR80MB561024219A35A26C418CF51BCE489RO1PR80MB5610lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________

>> spapr_hcall.c:
>>     function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64_m=
ap_hptes and ppc_hash64_unmap_hptes
>>     function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_hpt=
es and ppc_hash64_tlb_flush_hpte
>>     function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes=
 and ppc_hash64_tlb_flush_hpte
>>     function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hptes
>>     function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
>>     function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap_h=
ptes
>
>h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never
>be called for a KVM guest (KVM will intercept the relevant hcalls
>before they reach qemu).  I think it would make sense to split of a
>TCG only portion of spapr_hcall.c into a new file.  You'll then
>probably need !TCG stubs for those hypercalls, which should trip a
>fatal error (if KVM hasn't handled the calls, there's nothing we can
>do that will salvage the situation).

Besides the aforementioned functions, will all spapr hypercalls beginning w=
ith H_* be intercepted
(and therefore, should trip a fatal error in the KVM-only file) or only a s=
ubset of these functions will
be intercepted? If the latter is there an interval of opcodes that'll be in=
tercepted?

--_000_RO1PR80MB561024219A35A26C418CF51BCE489RO1PR80MB5610lamp_
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
<br>
</div>
<div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
&nbsp;</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&gt;&gt; spapr_hcall.c:<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_enter call ppc_hash64_hpte_page=
_shift_noslb, ppc_hash64_map_hptes and ppc_hash64_unmap_hptes<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function remove_hpte call ppc_hash64_map_h=
ptes, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush_hpte<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_protect call ppc_hash64_map_hpt=
es, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush_hpte<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_read call ppc_hash64_map_hptes =
and ppc_hash64_unmap_hptes<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function rehash_hpte call ppc_hash64_hpte_=
page_shift_noslb<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function rehash_hpt call ppc_hash64_map_hp=
tes and ppc_hash64_unmap_hptes<br>
&gt;<br>
&gt;h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never<br=
>
&gt;be called for a KVM guest (KVM will intercept the relevant hcalls<br>
&gt;before they reach qemu).&nbsp; I think it would make sense to split of =
a<br>
&gt;TCG only portion of spapr_hcall.c into a new file.&nbsp; You'll then<br=
>
&gt;probably need !TCG stubs for those hypercalls, which should trip a<br>
&gt;fatal error (if KVM hasn't handled the calls, there's nothing we can<br=
>
&gt;do that will salvage the situation).<br>
<br>
</div>
<div class=3D"PlainText">Besides the aforementioned functions, will all spa=
pr hypercalls beginning with H_* be intercepted&nbsp;</div>
<div class=3D"PlainText">(and therefore, should trip a fatal error in the K=
VM-only file) or only a subset of these functions will</div>
<div class=3D"PlainText">be intercepted? If the latter is there an interval=
 of opcodes that'll be intercepted?</div>
</span></font></div>
</div>
</body>
</html>

--_000_RO1PR80MB561024219A35A26C418CF51BCE489RO1PR80MB5610lamp_--

