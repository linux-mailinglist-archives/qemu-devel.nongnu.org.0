Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BF355044
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:42:51 +0200 (CEST)
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTiEU-0006lZ-8n
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7236f1805=Peter.Chubb@data61.csiro.au>)
 id 1lTiBW-00058Y-Ii; Tue, 06 Apr 2021 05:39:46 -0400
Received: from vic-mtaout3.csiro.au ([2405:b000:b00:220::64:39]:58420)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7236f1805=Peter.Chubb@data61.csiro.au>)
 id 1lTiBQ-0003d0-NA; Tue, 06 Apr 2021 05:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=data61.csiro.au; i=@data61.csiro.au; q=dns/txt;
 s=dkim; t=1617701980; x=1649237980;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=a5GcMAXhEGeSgQ0U2cdMMVqU1/DcFHXQEPCQO2pkr9A=;
 b=aGIsmc1PnYo5v4EVgYEIIeNC9wXrWFCV/EbHqRufiIF8mw1EUBh9slDx
 36QZLT51IeuVnO+L8a2TpFmA3YMk6LjDnDnE41Ae8vDQPjLkJm5X57O+W
 uIUs9xe2h2BKxTqi3WLCcuVZWBmOt0Bl/x12RGLwRtzF45z+vZmtRvrbT 8=;
IronPort-SDR: s4lYiWjbRBWvfXoYoaElHZP7a0S+uEcb+s7345wBgV4Lq+f+5NqQ/WuyJxlMLKMKRN/mLbM3vx
 uwzSO1y9v6zA==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?A9a23=3AxlzJkxTXDQDfvWPTrwiDU0sGctpso0fLVj590?=
 =?us-ascii?q?bIulq5Of6K//p/rIE3Y47B3gUTUWZnAg9pCjOzZtb2mXnYPst6Ns3EHJZpLU?=
 =?us-ascii?q?RJNycAbhBcpD8PND0rnZOXrYCo3EIUnNhdl8ni3PFITFJP4YFvf8Xu16zEUB?=
 =?us-ascii?q?1P4LwUmbujwE5TZ2sKw0e368pbPYgJO0Ty6Z746LBi/oQjL8McMho43Jq8tw?=
 =?us-ascii?q?0WQ5HBTev5Rg2p1djqu?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AbDd+Z64VYrV4R8exbAPXwDfXdLJzesId70?=
 =?us-ascii?q?hD6mlaTxtJfsuE0/2/hfhz73PJoRsyeFVlo9CPP6GcXWjRnKQf3aA9NaqvNT?=
 =?us-ascii?q?OIhEKGN4dnhLGN/xTFFzfl/uBQkYdMGpIOa+HYKVh/gYLE7BKjE9AmqePnzI?=
 =?us-ascii?q?mSie3Tz2hgQGhRAskLgjtRMBqREUF9WWB9ZaYRKZz03LsjmxOQPVgRc8SnFj?=
 =?us-ascii?q?0kcoH41rn2vaOjWzBDKz4LgTP+7w+V1A=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+EYAQBDKWxglwCwBSSYiIBxAISUgiF?=
 =?us-ascii?q?agQmDJVFpFYFBCogAA44HnA0DVAsBAQENAiQOAgQBAQMBAoEDg0eBeQIlOBM?=
 =?us-ascii?q?CAwEBDAEBBgEBAQEBBgQCAhABAQEBAQEBAR8GQ4VQAQyDVYEHAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCgQMFfgYBATcBEQE+ICI?=
 =?us-ascii?q?nBA4FgnEBglUDLgEBBKArAosUgTSBAYIEAQEGe4QoGIITCQkBgS+CdoZhg3U?=
 =?us-ascii?q?ngicSgTeCbIRFhjCCSz1RK16BH7tBBwECgwoEiV2TGCKkcZUVi2qSIgyFEQI?=
 =?us-ascii?q?EAgQFAg4BAQaBa4F9HU+DPQlHFwIOjjiCEYFGillzAjYCBgoBAQMJfIoJgTY?=
 =?us-ascii?q?BgQ4BAQ?=
X-IPAS-Result: =?us-ascii?q?A+EYAQBDKWxglwCwBSSYiIBxAISUgiFagQmDJVFpFYFBC?=
 =?us-ascii?q?ogAA44HnA0DVAsBAQENAiQOAgQBAQMBAoEDg0eBeQIlOBMCAwEBDAEBBgEBA?=
 =?us-ascii?q?QEBBgQCAhABAQEBAQEBAR8GQ4VQAQyDVYEHAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQUCgQMFfgYBATcBEQE+ICInBA4FgnEBglUDL?=
 =?us-ascii?q?gEBBKArAosUgTSBAYIEAQEGe4QoGIITCQkBgS+CdoZhg3UngicSgTeCbIRFh?=
 =?us-ascii?q?jCCSz1RK16BH7tBBwECgwoEiV2TGCKkcZUVi2qSIgyFEQIEAgQFAg4BAQaBa?=
 =?us-ascii?q?4F9HU+DPQlHFwIOjjiCEYFGillzAjYCBgoBAQMJfIoJgTYBgQ4BAQ?=
Received: from exch1-mel.nexus.csiro.au ([IPv6:2405:b000:302:71::85:121])
 by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 06 Apr 2021 19:39:25 +1000
Received: from exch2-mel.nexus.csiro.au (2405:b000:302:71::85:122) by
 exch1-mel.nexus.csiro.au (2405:b000:302:71::85:121) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 19:39:25 +1000
Received: from exedge2.csiro.au (150.229.64.34) by exch2-mel.nexus.csiro.au
 (138.194.85.122) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 19:39:25 +1000
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (104.47.71.173)
 by exedge2.csiro.au (150.229.64.34) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 19:39:25 +1000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5eu3i15Ae17sMN4CmNA1ziERMUylEzVV9kB77Kfw5ZbiEkJHLL7OPg8QCWlQw2KJalfvv7sCtKQlGTd80APEl0+Lnrn2FnvoJwAWDHKpArmGyWNeudgPOUvti+eM8ALyLB7n3vFmeLnCBzvsV3gSc5P3ZxBhSW+bDpVYCqRxNXM9qEg8p54CTLd6IAK2ykjEy6z42SP6kppT+YuMrgERBmMd54EaMQOEAr+lT7knW9d6oimrwNOKijGKgKgEv8/69iImSxSNveOOnVLTCtolE3BSEpVndTLaBnkMk3H2aVkwxsOPzLkuHDVzRecxEr3HKYUh2IHm0iDiYAhinOG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVNRvxbYrRDbdf/NFh7HxSO8uQk7snaFlmrl5FyXInI=;
 b=DlUFArRQS/IoRgKkPYL0zB9IHxwZZfotYvaE8d8yCeqMeHVj5tzePSBK+7qEW27yGkNPscngpRSFULbAT3wydcF4BHYa0GXSiJio3WWHNOws4eaLbvKmjQ7xTWGS6Wr6OMVoNM65e6CTyX56Z70fipTcQIjAo5CmDWAfdI2OjCJzeDQS3V4SxD5uWgVCD2jT60KCXWJ29PLAEC67pdEQdRjEjp2gyxubi89p0ZnAecWDfKW747IFU4J6YNOcq5CN39yQYdlQUhb4JdSGktcegyV8P4flScgwDK66sId4rU9M/Je6Gnq+9XYndIw+h8D1M99xhz286WvtdxoaXq9DZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=data61.csiro.au; dmarc=pass action=none
 header.from=data61.csiro.au; dkim=pass header.d=data61.csiro.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector1-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVNRvxbYrRDbdf/NFh7HxSO8uQk7snaFlmrl5FyXInI=;
 b=ox6S4poYnm0itBVr0GApkZGr2EQ3WvI26vvAG+DY+/n8fxDyDXjyCrTSk+WkA+RrSS0WOwuG4bZtLyOcbJIAjso5yJLz3x4sm5OzVsNlWfXu+xauxSjrFktGRx6K49OpoksHwbArX0e78Af932c1NCUiOuhzDVxhLHA4EGGKDW8=
Received: from ME2PR01MB5203.ausprd01.prod.outlook.com (2603:10c6:220:4e::23)
 by ME2PR01MB4739.ausprd01.prod.outlook.com (2603:10c6:220:47::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 09:39:24 +0000
Received: from ME2PR01MB5203.ausprd01.prod.outlook.com
 ([fe80::25dc:cdee:1a4c:9d28]) by ME2PR01MB5203.ausprd01.prod.outlook.com
 ([fe80::25dc:cdee:1a4c:9d28%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 09:39:24 +0000
From: "Chubb, Peter (Data61, Eveleigh)" <Peter.Chubb@data61.csiro.au>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Remove myself as i.mx31 maintainer
Thread-Topic: Remove myself as i.mx31 maintainer
Thread-Index: AQHXKsi6W7HM95MBvECragpH6OMSsA==
Date: Tue, 6 Apr 2021 09:39:24 +0000
Message-ID: <84v98zkb09.wl-Peter.Chubb@data61.csiro.au>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (Goj?) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=data61.csiro.au; 
x-originating-ip: [49.3.72.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4844477-8816-465c-8969-08d8f8dfdcf8
x-ms-traffictypediagnostic: ME2PR01MB4739:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <ME2PR01MB47391393F82D98AA5C4AA6C1BB769@ME2PR01MB4739.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xqZLiYlZAI9agI28iJ+I0+ES8JbajNglesjeripXY5R4+rZDocr0QAo/Ak0/bfldr1odUKyQ/2rkh4+7kX+oK9o7Fnx4E0jV9g4GLxvsJVpUKkYER/eSG1oMncLi7NadR6+LEWKFci13ONmFSN0o+hGSIuERRXeov3dVZy93HLsJtanjDOC4xk/wgPDyQ1QF/CxFkA7siTMXGwP3ki8paiWr86M5LAy2qAYWF/upVyQvS7HTYo9T0/MJEKg8W+rsXYwIS7R5FQVcEfbsKzztXu9kP0Rr3bDOQM/UbUaFXTJW0XJFiPbldqLDHbvWyBPCSOqrSyIPBbap6ctE+nhrS2yviHesUWD0LXpSco/yOEgJl6oobn2wKxBJWtOR4JrwKJE4vc6HKJ6gyHIpW7+nbnfHxnNPsbXaalU39n035W9+KtVcPLv129jAFh52ZIS4IiSh2KFxiksckfBv6ukwHh813mzC1xOqw8JPmghkv9izQD1+pVp1P9zZwo0b+/htFGfvhnISJnrMXOjzOoJxLtD8LdJTc4XAWmUIu1P/fbsaDtenFA+cAouzmBxdnm4fSZUmLXd+qymRC+xYbuT+TGxAmXqKDyFrq0HVwfxNSSB0MGim9MpP+JoAM55Ee3iQJqBwx6cN9ex73SPguEBFG9OZ9nr/RpbjibE3gXbxSVjSKBjiepA9/To9OSon8K6qxDxe/frIwn87OCwUAJfwAZOV081E0fCIjlXNa7qpxV3BnDjI2P3mkHHX8Z//nXHi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ME2PR01MB5203.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(66946007)(6486002)(54906003)(76116006)(966005)(4744005)(6916009)(91956017)(478600001)(66446008)(66476007)(66556008)(83380400001)(64756008)(26005)(38100700001)(71200400001)(2616005)(186003)(4326008)(86362001)(316002)(6506007)(2906002)(6512007)(5660300002)(8676002)(8936002)(450100002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?O050FKI0cYiaJXogsvrG2OO87A2rmtU7wldPNJ7VCOlUIODdDa6ATMaEaosR?=
 =?us-ascii?Q?r8ckcMeAdXJYI5B3vKN6HT6wRMOoN5ALRmHCJsL0PtS+qp3CbfTEms+fwLjf?=
 =?us-ascii?Q?tt6f4d68FeuUB8+Sf4xqlxB7DK1pHBr92nbi7APRBedhKUe/pQjR+iIujchh?=
 =?us-ascii?Q?YuvHMRF8z2Tn5hn9aL8vsqlOm8uhD7w4G7lQz+8EUmOqSEUirRInUbasU4uJ?=
 =?us-ascii?Q?vBNG6L0oPdT6Dt8R0h8+v2MkYiSP1skM8Qgty8fWrOARO7dRUvGzaqSpoPZ7?=
 =?us-ascii?Q?gsGg5CXFPoHRimJpnjh8RQ4BcnIHkz7YuBTyn82fsW/5oajd/WX6b1cvUj3+?=
 =?us-ascii?Q?H3+B6hz3oft6SbP1rmtTG1hy0hRu9d0DXx+0IOOhbiwkG8FCnGx+pns6aNRZ?=
 =?us-ascii?Q?D4uqHUQESumiUBs6gcE6a/Z2t/uAkBOgPBS5JWNSCsSFcG5hJq4uVfdiwAnG?=
 =?us-ascii?Q?V5yIEKH33394ytmSppNjNhFbc6olVYF5I/se0V9Fqwpx20Gcfc3XQXC/PlsU?=
 =?us-ascii?Q?RQ9mwRcNivohTP/CBTCr7Lod/c80/Ty6Tteblmubf3lSDp8igJnvUd6/MaJk?=
 =?us-ascii?Q?O4LSUagGo3dAXw/blBawFG0Y6FKahxvvWs7ivuL83CzzpjmOJqjZRygc9BlE?=
 =?us-ascii?Q?njEY214NHniqHlic7REs3UpUaR2IdblHG3ZgqezuZs/6t072RJ+H6wCrMTbB?=
 =?us-ascii?Q?MAqaZhqkfY7OY7ouoM8UXxlNgwGBMD+EaYxzP5ze3qdk2ktAi1xAJsS1cs/e?=
 =?us-ascii?Q?TmvA3OxieYD/vtbm57EZ2nLL5281T0/EoYSPtLDg2ZZTgJcX0urMqm/1vAET?=
 =?us-ascii?Q?ZGHb8cqkpDiW0Omj07cAWHsVdNdRq5gkF5KykW8kWegmKyEXukkDLFgR2Kng?=
 =?us-ascii?Q?ido1xYBfMEQuP0Own8roe5GPZNQ2jq4kyRfcjwYdifX3HGUuWazOXN8/Ntbp?=
 =?us-ascii?Q?p5R2+2AQYiFGS+4sO2hxavI8r15PU3EsORnIMX3Wn4aRV5Xfd+ObApSOEarO?=
 =?us-ascii?Q?HQakbrhM3UHJ84f7WiJGvijBHGWqzk87rHyFmqq4fFg9gIBkLiZk09yCwx1Y?=
 =?us-ascii?Q?DXmO8lpmBs51WvFieSDJfgygGgSA0iFDvnPgyk+8zjdrm2Ao4ofTPcYt/l27?=
 =?us-ascii?Q?eAbCXN7UH71xf05crUehOdHGc4Iz0K26V8msky82wFBDJmr6wteOhKs1HyQb?=
 =?us-ascii?Q?8bFAAB8Ft0q0A/lC0mGI7u1nwLAvdqZCEfcEyQACR6E1MP+cxYr3XFPCK/td?=
 =?us-ascii?Q?7Cc8woDnKsaQZ6tByrDy3oGH6tdL0suYObMLVdu/7ipqMMPPyoFrlvFz/Lam?=
 =?us-ascii?Q?tkgeEjEfInWWEMrZid02xa1F?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <53ED526DB5BDA048B6473BF7F1F8501D@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME2PR01MB5203.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4844477-8816-465c-8969-08d8f8dfdcf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 09:39:24.0896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOjA0FnNMhQjtxA4EGnaBV2QwD58pmRor8OvbkrDspyaO2wJchtDI6Sd4vcaSvNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB4739
X-OriginatorOrg: data61.csiro.au
Received-SPF: pass client-ip=2405:b000:b00:220::64:39;
 envelope-from=prvs=7236f1805=Peter.Chubb@data61.csiro.au;
 helo=vic-MTAout3.csiro.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Chubb, Peter \(Data61, Eveleigh\)" <Peter.Chubb@data61.csiro.au>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Remove Peter Chubb as i/MX31 maintainer.

I'm leaving my current job and will no longer have access to the
hardware to test or maintain this port.

Signed-off-by: Peter Chubb <peter.chubb@data61.csiro.au>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c..58f342108e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -688,7 +688,6 @@ F: include/hw/misc/imx25_ccm.h
 F: include/hw/watchdog/wdt_imx2.h
=20
 i.MX31 (kzm)
-M: Peter Chubb <peter.chubb@nicta.com.au>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
--=20
2.30.0


--=20
Dr Peter Chubb         Tel: +61 2 9490 5852      http://ts.data61.csiro.au/
Trustworthy Systems Group                           Data61 (formerly NICTA)=

