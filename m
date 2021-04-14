Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58935FABF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 20:33:53 +0200 (CEST)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkKm-0007ky-3j
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 14:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lWkFe-0006I8-Ck; Wed, 14 Apr 2021 14:28:34 -0400
Received: from mail-eopbgr750109.outbound.protection.outlook.com
 ([40.107.75.109]:30694 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lWkFc-0007vX-6L; Wed, 14 Apr 2021 14:28:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeNYMlmyOXmPfm8FbsGMCnSplueBGqalsVz8/TGD31E1ucCiJBvPw739sAu32kHlOmq9bdXbNKPCsjnmu3Dtlvp35tC16H5PmNUpDIUzX+Kui9yF3HLwHc9tyeTY09TCkmK00Y5kcsakC8AgB8ChNt+9O432N3oj/2Ai0nAsdfzERURZg+tFlszDcx1yr+tc1phMqKc8zdgSTVgS4jseY1VVVaQ8QONvWAKRaB49LlHr+GuYhRQeAHyFkqnRwUnlzCfqXUxEjED/dCD7YCOsriLKF783UfbMRpu+YYCklPS6Ta22p+E6+JyURudHQuFQXG2PMDCK3kcZGQnkbrdCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H09T9x54o5K7mJlRPRSnGFLOwF74NfMVqkN1gMpp4Us=;
 b=EGxm7ibCfCbNNF/OsNQink99QnUdVhdXwGI1S/EEG7qX3UWyBhOrKZtZ4s/DtUMuRdGZt57ru2ugQZsK0b0uwIevQY4a/8rGABPD+9c2SZzTfrH5FvkVyMlt2ZFyKIuOhLPvh1vRcBMuyl01k62+5gbcfVqx4v6K9qKzTIA7qdI7WyzlUfQ84CqcRGK9kjhHXbsBlImv9o67mWNdmHQHgKB/W2cvnbPy2TOaQaZirX2HtUHA+j4gx0w4jAHA36x6WAriknZWpaSM0ABcXwKf5pbEg/Kjq5PHddFHCs2Q76xgTa7Rxa1XP8kYUrLF5qn0ypP8HBKAPm4xu+HHlxLP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H09T9x54o5K7mJlRPRSnGFLOwF74NfMVqkN1gMpp4Us=;
 b=U73+FvTho0yQ6NsvIcVErvzsqNahsgae9jQQ/G9kH2XzHoXRdwMBnHHyfip729wLnblY4r8ZyLGY0kVDnEZB1lp9uzo5NgYPj7UIQs9ISv9tUoz7c29M03Cq9hExWR7S58I27QZ8GgnoJvjtGLZPPvnIM9s2L2kRPkUsa+Nzpqxu8hwC1MNJNCQyVtNqiZKNud8I02IQvD+fhGT/cj77l0TH6e1Xjugn/kEJGfG3oG3uBfzadUK4S1uChljB7U1ZVVFggjnYfhLXKInk9iK9d3IxISN7J678RhsyHfYpPWaqZQMKbA4/4mS0lWmMHJHCUNl0YNn8vECQfmDXeyD5Qw==
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com (2603:10d6:4:b::11) by
 RO1PR80MB1884.lamprd80.prod.outlook.com (2603:10d6:0:8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Wed, 14 Apr 2021 18:28:26 +0000
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf]) by RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf%12]) with mapi id 15.20.4042.016; Wed, 14 Apr
 2021 18:28:26 +0000
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: target/ppc: sPAPR invalid function calls when compiling without TCG
Thread-Topic: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Thread-Index: AQHXMUYRl/P47H5pv0epfQFb95vx9g==
Date: Wed, 14 Apr 2021 18:28:26 +0000
Message-ID: <RO1PR80MB56100E30B8B94BB4F733FB07CE4E9@RO1PR80MB5610.lamprd80.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [2804:14d:8084:88a2:9651:c205:38d3:3262]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a337ba3-3c6e-4297-7632-08d8ff73185b
x-ms-traffictypediagnostic: RO1PR80MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <RO1PR80MB18840532A9817ED149A72C02CE4E9@RO1PR80MB1884.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DwnT2PIKc3SUmzsGsznZnxuQTq6RkvrWbrdX5wB3j4ZU5OYvz272Vpr1E+p8/4H2o2CIYlyh2xSzW+jO8dvTu6F3c4gh3o3GhgYhAQZ8qvNw4K2DoPjYGm8f1PJ6cPAC2KdzEtQPrLZ+lL3OoDKTURl7Cj8+fAvz2SELtvyk3AQwEKGvJBAFe1/ndPmOKS2Mjmgx4RWkadsUOB3N3ltnz/UYLuYhTKiHpcZ3xJu6DXkCpidLE6bskJFhSQ4yCjic4p99E1uGPX12vrPbzhsVKhFkoXH2qLCgHrPrb1hgPo3HevHteDHWdOTQIEgHa9S0XJmesObN4qBV/+g8Q6X8qpthjBOSmIN8Zoha/lhqfFDlk3uAvjXplGYcFkXEZ6Hgkf12yb9RydtTL9oVsAB+2uZFoJZqd5iOfyF5RyY1S8fLsq8GQc3cJUbyo7XtJ7glYldKdxODW7kb9KVT0OQGx209g98f6kNnW6FxssbmQKNfTodoipqBqahPa1yDjOVzA67BuOoX+3q30zqhnmuy/O6kAHizCT87nqzJ68xqzQVloCcDz12rP0obspLpqSFjoaZhKXWJiWLWBWSIfiRqg9X34DgAV/jLjlbKVRFLt8M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:RO1PR80MB5610.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(136003)(396003)(366004)(376002)(55016002)(71200400001)(76116006)(91956017)(66556008)(7696005)(19627405001)(66446008)(52536014)(64756008)(66946007)(54906003)(8936002)(110136005)(478600001)(2906002)(6506007)(186003)(86362001)(122000001)(316002)(38100700002)(9686003)(66476007)(8676002)(33656002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?n80yyjP6xWiv9I1TeNsJxRzj3fDaKtLMRg55LXzYOYEqpuTfu606CRvQGW?=
 =?iso-8859-1?Q?V8/xLvj6sE5oF+nKY15I5CoFeQjZpV7893VuRuIE+VSgT9e7xyNcleae9b?=
 =?iso-8859-1?Q?opLJcGLGnz3c/srD7P+kW1df49UftvAGo/AceNhzn6Gtv23N5MHNPPln3/?=
 =?iso-8859-1?Q?B9vuTYSS8dvga37n+M4d8MpX2npKaX9jn4J0+Ni67XVzZfO5nPJoUfgla5?=
 =?iso-8859-1?Q?mxkg5FHSFvZ9yrbkJ2SW8xkfLLjhzAyNdVkrqgvspJL7Qf299NDKp01Kuw?=
 =?iso-8859-1?Q?jptbIliQuoJxIoqOf+XS9Xt1UZ5JPKobQC4VuBzjdlsdl6U6phi6ZVRX+Q?=
 =?iso-8859-1?Q?Q6vRHX8QpKDzjbR2187qid7WXdAJQfrnAw8ZdUlLyXZLAiRr/u2QEntpdE?=
 =?iso-8859-1?Q?CXi86Kp9bXZ157WCGQPHcfK+oX7Q9ADbc5izaRyDeH9GKemt0vTpNAmwxR?=
 =?iso-8859-1?Q?xWoBe2ogC/lwdHifauzWDKEgaJ179vrAriDMtsO6LpDSHMxHfAkmn5ITR3?=
 =?iso-8859-1?Q?ruh5OX/JS+ABVHaCRjkN4QZJ6SZ6/ly6oxM1oYVnTK0ZzzlR/OfK266/R3?=
 =?iso-8859-1?Q?4oCvqmZp1kNAbn1X7qMUBcGazoeOZDrmVJzfqy9ctYvuztPPMDULrioxfO?=
 =?iso-8859-1?Q?UlbezEbt8BUeJZh+C0sj5mUtmqjpsICj8S3nnUsjCJsbXUHsgPl999yPmD?=
 =?iso-8859-1?Q?MmhfGiuRVvWWg4s8aRkGgwMjn6eFS8x43tKb90v1L+6lVh2r7952Q9ZQFD?=
 =?iso-8859-1?Q?Qg+eBz60CEWCx/NkLuxaTn0HxVwKxgLjHUxhf4EMhqcUzLELYLmpsr994i?=
 =?iso-8859-1?Q?E4TA784RYir50KaZ03/wJEDH/1zWr5Ue0RpwcgyF0hLj3tIujjjtqjabEA?=
 =?iso-8859-1?Q?tfm60LLFeGEyjl+X+CdDcJ+/2DFIRm0WTjyrzLaw+qN5DutR4Eip4dLzFt?=
 =?iso-8859-1?Q?2VR+LPcKGT6Y6VpKFPI+uAWHOhA2EX3+kIVg9wx/jfacr4HkVYCOnH0dfI?=
 =?iso-8859-1?Q?gvbrRdAGwUDeRszCwe6Ak82QviAcMb0Za9AyEQR+Sq2qzBehWG5Uj7dtsI?=
 =?iso-8859-1?Q?/cA77OVjorCuqOIS334lDyj/2i7ED/O0xgDjR4vQaePX1uMVC/nGoOTF1i?=
 =?iso-8859-1?Q?ZeWjMEWuJGNF0BEzTJCmC/Eu8mqQvcqxZ2jkXAl3OTX1/SpS75GMV18MIX?=
 =?iso-8859-1?Q?rJhTPLx0E32fEP6X1pPY5fKTi+fvE74A15X3r1pnv51PIfqPIPzyDDK0BJ?=
 =?iso-8859-1?Q?V/DjSXuulnB1Gq1uc2VnYSo8LMAYEJKBA4cOdwGbkRLMIQHamnGAKA7Sya?=
 =?iso-8859-1?Q?0Yke+cAOnbFIGRZV6wRH7Mi1O6RQdg3S3a4OaWEl6rv97MdpwfBQPmr0/t?=
 =?iso-8859-1?Q?00z6+wr29rnIm66EhAmLf8dA4N2dIXci1Uuo0gLYXqtVHmhWlatu0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_RO1PR80MB56100E30B8B94BB4F733FB07CE4E9RO1PR80MB5610lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: RO1PR80MB5610.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a337ba3-3c6e-4297-7632-08d8ff73185b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 18:28:26.6015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZkvIXo8cQcKCtH8aDsjVAvRA2g3yt/1HPa8O3cMSY5xXKv+5qjUsre42yumTpgiaOMW2jxSUFKNY3b5pp59hVFGWhYhtgFY5mcs1YrKGyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RO1PR80MB1884
Received-SPF: pass client-ip=40.107.75.109;
 envelope-from=lucas.araujo@eldorado.org.br;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_RO1PR80MB56100E30B8B94BB4F733FB07CE4E9RO1PR80MB5610lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, I have been working on billionai's patch to enable the --disable-tcg op=
tion on PowerPC and one of the problems is that 5 files in hw/ppc use funct=
ions implemented in mmu-hash64.c which is not compiled with --disable-tcg, =
I'd like to know how to correct the spapr function call, should I

  *   change the calls to generic functions that should call the correct fu=
nction based on if kvm is being used or not,
  *   should I just implement said functions independently of mmu-hash64.c =
and always call them,
  *   should I just implement said functions independently of mmu-hash64.c =
and only call it with --disable-tcg option turned on,
  *   find a way to not have said calls when compiling without TCG as they'=
re not necessary,
  *   just create a stub

Here's when each function is called by each .c:
spapr.c:
    function do_lpcr_sync call ppc_store_lpcr

spapr_hcall.c:
    function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64_map_=
hptes and ppc_hash64_unmap_hptes
    function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes =
and ppc_hash64_tlb_flush_hpte
    function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes an=
d ppc_hash64_tlb_flush_hpte
    function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hptes
    function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
    function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap_hpte=
s

spapr_rtas.c:
    function rtas_start_cpu call ppc_store_lpcr
    function rtas_stop_self call ppc_store_lpcr

spapr_spapr_cpu_core.c
    function spapr_reset_vcpu call ppc_store_lpcr
    function spapr_cpu_set_entry_state call ppc_store_lpcr

spapr_caps.c:
    function cap_large_decr_cpu_apply call ppc_store_lpcr
    function cap_hpt_maxpagesize_cpu_apply call ppc_hash64_filter_pagesizes



--_000_RO1PR80MB56100E30B8B94BB4F733FB07CE4E9RO1PR80MB5610lamp_
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
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Hi, I have been working on billionai's patch=
 to enable the --disable-tcg option on PowerPC and one of the problems is t=
hat 5 files in hw/ppc use functions
 implemented in mmu-hash64.c which is not compiled with --disable-tcg, I'd =
like to know how to correct the spapr function call, should I&nbsp;</span><=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ul>
<li><span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, =
Helvetica, sans-serif; font-size: 12pt;">change the calls to generic functi=
ons that should call the correct function based on if kvm is being used or =
not,</span></span></li><li><span><span style=3D"color: rgb(0, 0, 0); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">should I ju=
st implement said functions independently of mmu-hash64.c and always call t=
hem,</span></span></li><li><span><span style=3D"color: rgb(0, 0, 0); font-f=
amily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;"><span style=
=3D"margin:0px"><span style=3D"margin:0px;font-size:12pt">should I just imp=
lement said functions independently of mmu-hash64.c and only
 call it with --disable-tcg option turned on,</span></span><br>
</span></span></li><li><span><span style=3D"color: rgb(0, 0, 0); font-famil=
y: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">find a way to n=
ot have said calls when compiling without TCG as they're not necessary,</sp=
an></span></li><li><span><span style=3D"color: rgb(0, 0, 0); font-family: C=
alibri, Arial, Helvetica, sans-serif; font-size: 12pt;">just create a stub<=
/span><br>
</span></li></ul>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<span style=3D"margin:0px;font-size:12pt">Here's when each function is call=
ed by each .c:</span>
<div style=3D"margin:0px;font-size:12pt">spapr.c:</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function do_lpcr_syn=
c call ppc_store_lpcr</div>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt">spapr_hcall.c:</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function h_enter cal=
l ppc_hash64_hpte_page_shift_noslb, ppc_hash64_map_hptes and ppc_hash64_unm=
ap_hptes</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function remove_hpte=
 call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush=
_hpte</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function h_protect c=
all ppc_hash64_map_hptes, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush_h=
pte</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function h_read call=
 ppc_hash64_map_hptes and ppc_hash64_unmap_hptes</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function rehash_hpte=
 call ppc_hash64_hpte_page_shift_noslb</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function rehash_hpt =
call ppc_hash64_map_hptes and ppc_hash64_unmap_hptes</div>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt">spapr_rtas.c:</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function rtas_start_=
cpu call ppc_store_lpcr</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function rtas_stop_s=
elf call ppc_store_lpcr</div>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt">spapr_spapr_cpu_core.c</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function spapr_reset=
_vcpu call ppc_store_lpcr</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function spapr_cpu_s=
et_entry_state call ppc_store_lpcr</div>
<div style=3D"margin:0px;font-size:12pt"><br>
</div>
<div style=3D"margin:0px;font-size:12pt">spapr_caps.c:</div>
<div style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function cap_large_d=
ecr_cpu_apply call ppc_store_lpcr</div>
<span style=3D"margin:0px;font-size:12pt">&nbsp; &nbsp; function cap_hpt_ma=
xpagesize_cpu_apply call ppc_hash64_filter_pagesizes</span>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_RO1PR80MB56100E30B8B94BB4F733FB07CE4E9RO1PR80MB5610lamp_--

