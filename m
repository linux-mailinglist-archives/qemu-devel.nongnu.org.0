Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD47485394
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:27:36 +0100 (CET)
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56KE-00017o-MY
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n563G-0000Mh-Dw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:10:02 -0500
Received: from mail-eopbgr80055.outbound.protection.outlook.com
 ([40.107.8.55]:14318 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n563D-0000l3-9U
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:10:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ZwLeqBVBLGMZ19LporxIjTVz9Zj1FFFT1byZPoAQduz/n90P2dXlm8R61FAh4SlGWVop/64fHJYISgLp1Rbbe8Je0UoNqaln3t0xPlcDbHx29Ol38eljYNT9Z172jqN1pxa6IvCDHa6fZxDmPnS/qmdbRdmExDsFEMhUezncjmO+r5JHeo141/wzlXIxPrQS1PIHzBaZZAAzN3GxHPc3gomEsOm2AZVT/w6tmd6gOSzqCXLG/nVhq5XMBclb8PxA/9aafOoJ5FU8NqYbDiEuE6m77nhnaRRlIG1XdZ1XaLRFY6gzvSifsKecyJyAUFgk4Sgjet1RhGmIkehRSiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ+/2qu2P3YyROMf5Sk9slM/rsbrlcLnX6ChZ8ochbo=;
 b=Hj+yiXTV5ryjup8PnpozSlsFGLLWM5DWaYIj/DxkyuDOe2ZigcmVQYJLfflFL5SaJbNZnsUEUJ3rDjXt/3uu3oMFETcxskepX6cTqqS5ZIsN6lYq70UnQgSPAjm4jlQumYjkQc/tuAE1KGXhKalry84uHjba62BgtSmw/Fl8MAeBaoO0MFQ/lDrPyuOnzvYLvkpCIgO6PU65829I4q4HVDe2nnauj0XNhi8PJAr2bPxIpWzFtoFSRiSCCR9dPKlUXeGV9sUyTNOfDRa/RaQSwaD2Z7cCZcvQ0nFoyblsg/p1hdzhKE8z5XtFdHWn71Sz28lf6SBrle+A1Q8ZtKLCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ+/2qu2P3YyROMf5Sk9slM/rsbrlcLnX6ChZ8ochbo=;
 b=lX6WFz4m+g0QE+c5pN/MT/QNeYW/36ttpKfvoClNGJKIi/CPKutJO/UjQ4BFEl10ER5jPlT0nPTQ9cnAHQboHtFWooa04xTJyfoNeGl9GgqJK1rEyjqh9rn+2tDaI9oRRFxOCx7I5TeSLr4c1dxvieluWzKAGvK4L3+0YihqFpoVJBS2CssT5aqVQHz1NVZh11btkzzQAGPFUqByiawQe6U9cBvcrbbVczpEF1bluGmIx6DzS7KA2YnZ/My0ns0r1D4YAoYfEfFRjQI15cr5wnBDlL7RcA0G2TA0avNJjwM5h0b7Ubcs7F4DMDwYKeiFGTR94bhKbpaSwu40uNMReQ==
Received: from AS9PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:20b:488::24)
 by VE1PR10MB3055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:107::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 13:09:54 +0000
Received: from VE1EUR01FT038.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::c0) by AS9PR05CA0030.outlook.office365.com
 (2603:10a6:20b:488::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 13:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT038.mail.protection.outlook.com (10.152.3.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Wed, 5 Jan 2022 13:09:54 +0000
Received: from DEMCHDC89YA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 14:09:53 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC89YA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 14:09:53 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) by
 DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) with mapi id 15.01.2375.017; 
 Wed, 5 Jan 2022 14:09:53 +0100
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: RE: [PATCH v2 3/5] RISC-V: 'info gmem' to show hypervisor guest ->
 physical address translations
Thread-Topic: [PATCH v2 3/5] RISC-V: 'info gmem' to show hypervisor guest ->
 physical address translations
Thread-Index: AQHYAYMLQ9aLknYCpk+RV9pkTExpDaxTWfCAgAEFR1A=
Date: Wed, 5 Jan 2022 13:09:53 +0000
Message-ID: <98a40a89c44c4a089ea3bb6dc4f7f29f@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <03cb38fdfab89a6725fa0c7cadad2055d6be48a4.1641309725.git.konrad.schwarz@siemens.com>
 <CAKmqyKNq6ewguvDAH_v=4N5qPQAMgZSJNU8pJRC91X-Sh_WvXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNq6ewguvDAH_v=4N5qPQAMgZSJNU8pJRC91X-Sh_WvXA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-01-05T13:09:52Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=aceb3399-bcd7-45b5-a67e-7001e4b500ea;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [139.21.146.198]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1018-26634.007
x-tm-as-result: No-10--19.994100-8.000000
x-tmase-matchedrid: Alur8Cs15mzPhQMrvkSA3i2p/2aKmayLDDw2a573DPfAsQvj68mG0+3G
 9kzqF3HisVBYqUB/OYTC5qeIz1BfLbCSGRqoy6mKM0gfmrwlufp2CEKBxIsfqgTbNAFKnYh99l9
 p8mNlkgmQc9WQFO7fU8Rf0/tVPfcbDTyk3+/4Z9/Vd9ItppuLkCwrJd4fYI9TPwKTD1v8YV5MkO
 X0UoduuYRYHyK7IaoJclLzWaoHvbjzN7QiW6lorXIaXO5SJhtI/0j7XSCRjJA1yhbbA7We0z2SB
 1qSnBxNVz8J52OVy+RSyioNZoigrLf8PrMZNcbjqAz5VCYT1qsRvRG4urLwoYh/ebSxR/HnVapK
 Fepe0T5Nv0sqfBRHqJ4CIKY/Hg3AcmfM3DjaQLHEQdG7H66TyBVBSZtgeh/R
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--19.994100-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1018-26634.007
x-tm-snts-smtp: CF5515ABA2730AA3FEE5EE5B66A26EBB270B1CF5C7655FD7DF71ABEB76C3F6502000:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55338f52-4d41-4a6c-eac7-08d9d04caa7f
X-MS-TrafficTypeDiagnostic: VE1PR10MB3055:EE_
X-Microsoft-Antispam-PRVS: <VE1PR10MB305591A7A8163DCF1582FCC58A4B9@VE1PR10MB3055.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7isJzR17KIjueQUGe329+RUOsEKoPaeAGcXQ0XY7kEK8ygXJs9ncz3oRYdGvsRPyLy2saaEM/NwWqQgpVCj3EDeQ45326LuM/BjFIPzN6b4/EHsCd275F9fcxeLparoTkvPMyuqEP1lSOCuplHbI87nJB9lJvxq6BDHzFiVutABnv7Kfehem9zW1+HkZn64qd/MvXWD4bP6CwsbTGyn582gBkcKOXlu11Rwo/kqnLi9vm4UIzv8ApQH8pwOI/tHAPYw6ZPDAVDNbLXlVhELd85jWLsM+PgOJIgJxIHIpV+k2Dbw2MwruT6Jo4j8Tcefyt2PgSPDannUtKo1SjJGfDb7lHOmtzCWXrrC/+g5E7xlYKi0pcGc+SPxZ0ew+9UtL50GqVgs9oWEimM4mLpsNsKcdHqGgU4MMN2BcHbaxvMaT8dWHyVFpKe2QpJANQC+k3Be9snn/KVIZj03dTDmGKA7SXbZebAuxJ75p2iKJGer/OFjpYAS+icTAfoupF6b20QBh40W5P3uGfg2sepezHi7qf04vrE8gXsteaPArruHKDUaafPFJ4PR/9Gra3/YHudOIXQSJOvEQ1E2UiGOjfyfacpftWdCFJfqOOUrKoSry7xv/EFWNrgGKMJRhSAa/hVKLWi/CuHw1ksP/NTrdGNwEUEd9+DpAoICLfiJn5kylFc6FopPtTNsBAN0yRmaH9uhIjZjKkr7uNAHcQaBKId9e+kwDAiy1P1qo6E6CPA/u4VdqzPSBTCFb7+knhSjSrgW0MKkpfMYd2/9lbEtyWCh9PaTKkHvEqoFbvYc6f4=
X-Forefront-Antispam-Report: CIP:194.138.21.73; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(356005)(36860700001)(316002)(956004)(82960400001)(2616005)(2906002)(8676002)(4326008)(47076005)(53546011)(336012)(5660300002)(36756003)(40460700001)(8936002)(83380400001)(108616005)(24736004)(86362001)(54906003)(508600001)(26005)(186003)(70586007)(82310400004)(81166007)(6916009)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:09:54.5693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55338f52-4d41-4a6c-eac7-08d9d04caa7f
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.73];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT038.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3055
Received-SPF: pass client-ip=40.107.8.55;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGlzdGFpciBGcmFuY2lzIDxh
bGlzdGFpcjIzQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA0LCAyMDIyIDIz
OjAzDQo+IE9uIFdlZCwgSmFuIDUsIDIwMjIgYXQgMTo1NSBBTSBLb25yYWQgU2Nod2Fyeg0KPiA8
a29ucmFkLnNjaHdhcnpAc2llbWVucy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVGhpcyBpcyBhbmFs
b2cgdG8gdGhlIGV4aXN0aW5nICdpbmZvIG1lbScgY29tbWFuZCBhbmQgaXMgaW1wbGVtZW50ZWQN
Cj4gPiB1c2luZyB0aGUgc2FtZSBtYWNoaW5lcnkuDQoNCj4gPiAgaG1wLWNvbW1hbmRzLWluZm8u
aHggICAgICAgICB8ICAxNiArKysrKw0KPiA+ICBpbmNsdWRlL21vbml0b3IvaG1wLXRhcmdldC5o
IHwgICAyICsNCj4gPiAgdGFyZ2V0L3Jpc2N2L21vbml0b3IuYyAgICAgICB8IDEzNSArKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExNyBp
bnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9obXAt
Y29tbWFuZHMtaW5mby5oeCBiL2htcC1jb21tYW5kcy1pbmZvLmh4DQo+ID4gaW5kZXggNDA3YTFk
YTgwMC4uZmE1MTlmMDEyOSAxMDA2NDQNCj4gPiAtLS0gYS9obXAtY29tbWFuZHMtaW5mby5oeA0K
PiA+ICsrKyBiL2htcC1jb21tYW5kcy1pbmZvLmh4DQo+ID4gQEAgLTIzNyw2ICsyMzcsMjIgQEAg
U1JTVA0KPiA+ICAgICAgU2hvdyB0aGUgYWN0aXZlIHZpcnR1YWwgbWVtb3J5IG1hcHBpbmdzLg0K
PiA+ICBFUlNUDQo+ID4NCj4gPiArI2lmIGRlZmluZWQgVEFSR0VUX1JJU0NWDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgLm5hbWUgICAgICAgPSAiZ21lbSIsDQo+ID4gKyAgICAgICAgLmFyZ3Nf
dHlwZSAgPSAiIiwNCj4gPiArICAgICAgICAucGFyYW1zICAgICA9ICIiLA0KPiA+ICsgICAgICAg
IC5oZWxwICAgICAgID0gInNob3cgdGhlIGh5cGVydmlzb3IgZ3Vlc3QncyBwaHlzaWNhbCBhZGRy
ZXNzIg0KPiA+ICsgICAgICAgICAgICAgICAgICAgIiB0cmFuc2xhdGlvbiIsDQo+ID4gKyAgICAg
ICAgLmNtZCAgICAgICAgPSBobXBfaW5mb19nbWVtLA0KPiA+ICsgICAgfSwNCj4gPiArI2VuZGlm
DQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgUklTQy1WIHNwZWNpZmljIGNvbW1hbmRzLiBD
b3VsZCB3ZSBub3QganVzdA0KPiBleHRlbmQgYGluZm8gbWVtYCBpbnN0ZWFkPw0KDQpDb25zaWRl
cmluZyB0aGF0IHRoZSBzaW1pbGFyIGNvbW1hbmRzIGBpbmZvIHRsYicgYW5kIGBpbmZvIG1lbScN
CmFyZSB0YXJnZXQgZGVwZW5kZW50IChpLmUuIHNwZWNpZmljIHRvIEkzODYsIFNINCwgU1BBUkMs
DQpQQ0MsIFhURU5TQSBhbmQgTTY4SywgcmVzcGVjdGl2ZWx5IHRvIEkzODYgYW5kIFJJU0MtViks
DQpJIGhvbmVzdGx5IGRvIG5vdCBzZWUgYSBwcm9ibGVtIGhlcmUuDQoNCk9idmlvdXNseSwgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyBhcmUgZnJlZSB0byBhZGQgdGhlaXIgb3duIGltcGxlbWVudGF0aW9u
DQpvZiB0aGUgYGluZm8gZ21lbScgZnVuY3Rpb25hbGl0eSwgc28gdGhlIGxpc3Qgb2YgYXJjaGl0
ZWN0dXJlcw0Kc3VwcG9ydGluZyB0aGlzIGNvbW1hbmQgbWlnaHQgZ3JvdyBpbiBmdXR1cmUuICBU
aGUgY29tbWFuZCBpdHNlbGYNCmlzIG5vdCBzcGVjaWZpYyB0byBSSVNDLVYuDQoNClBTOiBJIHdp
bGwgYmUgdGFraW5nIHlvdXIgb3RoZXIgcG9pbnRzIHRvIGhlYXJ0IG9uIHRoZSByZS1yb2xsLA0K
SSBqdXN0IHdhbnRlZCB0byBnZXQgdGhpcyBvdXQgb2YgdGhlIHdheSBiZWZvcmUgYXR0ZW1wdGlu
ZyBpdC4NCg0KUmVnYXJkcywNCktvbnJhZA0K

