Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C906D402E32
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:11:39 +0200 (CEST)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfZK-0002Ua-S4
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfX7-0000SF-Ap
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:21 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfX5-0003YC-Mk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038159; x=1631642959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t+iVT1wswkShOaYXYBOpKwO/+e2L3YwCn/Noxt3socI=;
 b=zmCvJ1JHkMB2350TQ4E5TO6Wg4e8Vgej4riES7pR5iSuicOXYWeVMaPG
 V0xtOZbvUfzPUJSNhVjcWR9fuzba0o3F61SKHgxTnkyyxL3Hy0OQaLbT+
 Vx126fm9568GOkgO1lBvOJGcO0xmaMUbpfM1KlJ185fR6NdcUorY88dOk Y=;
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifhjkdeGzgKVPKBOwBbM2YQyetjBysL4yhv9ZS4uz9fQ/nnG94vaV0bJmGuZDXIBswNj1gofnHhm3WDp94SYAnWA8t7BO+GJ+F3NbwITKfPKmkElmhjHScBzWWZLsB/hK5L+dxcbrHVmpp/XGbURIqkVptRI1QahfIEaprunh16Js6Xw80uTiA+sg7nBWhbNoeoufDVN1WnJXo0W/Ri7sKotXv1H0SX+ZRl2Bn/MN3L8wZWJ9O6gouWJh7cWdCcx/YHfBOHYoeKcyPDi4VG3v8NampRZx0KEoTu4Hs3Azg6/ZQJDkQ0sdPosrYQk2rmLKutxwDCdjoGzeKvV/8nXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=t+iVT1wswkShOaYXYBOpKwO/+e2L3YwCn/Noxt3socI=;
 b=dBp3myShPQTcVGf9yne74PpG3NUOFLfwmmeSAFe01/a8K0wE5R8IHq+kNcBUhkFoutfc2jLWxL2JMOdJDzaxWQUJqA2nXxeggOY0MxxHTFwlYuR8iUzbimo3gB8Nw+Ctj1EKc1araQmFuIJaQ+grB2y9OLuytoEl303XfbZLNzGK7/QO4jsvNJlgaAuP707WW21AMOymgBDKlFdsJHGQMokIRX9MHJsUW/QlKPQ0gcpYBFF7LE5Wqy7R01zmad3uO+vSAS7h9hPwjCuldtGFX53IK4G6CufR3aDg37FujBXUp5fckrMByzNeChOk8sjdshz0R1F/ZWhSoAIs2HELaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4949.namprd02.prod.outlook.com (2603:10b6:a03:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 18:09:16 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:09:16 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 03/12] target/hexagon: make slot number an unsigned
Thread-Topic: [PATCH v6 03/12] target/hexagon: make slot number an unsigned
Thread-Index: AQHXfWMgSZZnVHBlM0uHjZdvuBOp7KuXtLHA
Date: Tue, 7 Sep 2021 18:09:16 +0000
Message-ID: <BYAPR02MB4886762EF2D8BA87E9B57AE9DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-4-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-4-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3d93397-2761-4bb2-ac34-08d9722a9b1d
x-ms-traffictypediagnostic: BYAPR02MB4949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB494929F5F58EAB417027F266DED39@BYAPR02MB4949.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Oxxfjd10Qk/7bwRt54FruXDNYjnC9qexblr/wy2HCrUyaikg/c9TTYY7stRONuVDTxBH6+ECXr8OQiC153ai7BLsxbJ03urJsHWgsDx/gZvOAXbthm1JbCu4gWWy6FIuykj7JuUq4LtJ8rExhD0xXJrYw1YJrnrwPGzlQpxc9bbMr3by0GlAsnAV5O145WEtUylUqu84e7nQApfab2nJan0LFn79Mnpu0WKviRc4WR6oxMFqeB0Hd4QHB2qOLVstk6k7R1CP9NiB/gphFRIQ9Qq/2tgIgT8yBnRHc4ZdGysp1TLln8G2Gzz3A8VDpG16nOEl+zjgL+Oy+HWRDixAQoMvszv0M4GhqE8mhUqWi6EQkvGooHZbJzVeUGauGN+Cjk3gcqb9CGfeFUinbWU/RYO9l3H93DQp4eDuxmwPtDg/3dti7dcj95qpWJggQIR0tKPX+KLx6KYZJ9nSSrLEEUCdMQUJGeaZ6NM+vxF2wt4MY4jVvirA/HEErt/XAbrNA+BiQcdHRGnpJ3QkoqALm6r+VeAiEOZQZXAaeOXuShtO+tKmpjjl9oVigauOUGbmdj/DOsppIzAzFr3udyU9BKKHjNvZAMsxrOXD+HCTvVOlnhFPpJY74kNImt8NGjP0W4ytQJKPohlEqiMZZnDqxTTVLnD7LvYJ87ur10xxCj59kaOMA/roGTHuiWbMEM2Zk81vps8l06wpc3r3wupBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(38100700002)(38070700005)(76116006)(6506007)(2906002)(53546011)(4744005)(66476007)(54906003)(66946007)(83380400001)(55016002)(7696005)(66446008)(66556008)(26005)(9686003)(122000001)(8936002)(5660300002)(110136005)(64756008)(316002)(186003)(33656002)(86362001)(4326008)(71200400001)(52536014)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k6VMtkT1v+ONxTYfytokifhqTgaRiFj6La9AQFKOHrcsgo/DJISRwCSPQ5Vn?=
 =?us-ascii?Q?5XOyKm/rWESiLcpaCOScFN+DsXuXkHhZHXLlOaUtI4GFFnLnlczUrnjfiJmd?=
 =?us-ascii?Q?u3MeEYKbKy9Skr0PdadwFiDHl+0iq88XF1BxoV7ub7N+jEpsKWZNPNjDC7/m?=
 =?us-ascii?Q?WpM2EoLjlXcC8f/lTVsseQPsUkhFYtUGaRpNEcJCjgzSJXBR7By7tOj6Y/Xw?=
 =?us-ascii?Q?m5WJQMEbXF//OiuptI1Pgo63EkxRGyle8SeaMlB1ODSpNW7i5XnrwFnucsiT?=
 =?us-ascii?Q?sJMLt3ylonDYdC1SJVzQL/gm2vlvaETHbjZdLXyRlvadJQDZIdGMcKcSq3Eg?=
 =?us-ascii?Q?/kQ6qM3BaLblZOS9mqpISBX6xmiJuCboNK86h45atyO1ZINv6FhTf+gM/f96?=
 =?us-ascii?Q?E0KwDiGpFjOyjzqTNgikH3kIwrF0FkySARmdI7Mvdr7GmbGG29oNz7IOUJIK?=
 =?us-ascii?Q?szzYjvcQ/nPVrCoFH9BnEg6o/pan3a4GQBewqdzMZKLlAZzmK9ii/8TODR0d?=
 =?us-ascii?Q?GkmcYekPUjXmJQf4u1MhKFNZpaorOgntyztuDvNstTOr0WVYRZane/NA2wW/?=
 =?us-ascii?Q?R6dy8IwsutuxwsaXnliyXtsKUjAXsJ5hIqYPUsL2clAkKbD53906mRsz2f4S?=
 =?us-ascii?Q?aJYYmhn18mg+OwhHRhu01xQmQdecGmYpBG45Jr4kzVjacA8tiyGRdMWCJfzR?=
 =?us-ascii?Q?aA26XYmssvhFHqsOrr56qS22OZVGj9mb9foFCx1v9PmXZpsPm2GsBaJakZIL?=
 =?us-ascii?Q?sYRcm9Ldq/VmrfToGBgOORUl7moyWan2g7eD6Kb4A1qQB9BUJ9B/fYxMjMKY?=
 =?us-ascii?Q?r1plQeU8t/+tVV1HGYWbKAtLCMdsxlfRUw8f52AY6/fURa1bpRf26P+Tvynk?=
 =?us-ascii?Q?IvEo4D71rWKYgYpYTt++29X6EegnQqGZpi31FUObZ9PsSl3ZYVVOGJ0u2tFo?=
 =?us-ascii?Q?9npt5/iCdntTiQRKaHyBbeBbFj7WIWaUZZmLFfOR7ZlzFk1twa/NnTl58Gn4?=
 =?us-ascii?Q?P7wUNzimMDGhJkqdfui/1J6Erso3GY4LKKibBkCNsU44s7JfL1p1T0xhM3l5?=
 =?us-ascii?Q?EtN4jww5CkBFRnaJXI5ZP/R7a9RbCjNXxdSIQDTOlhu9BgK+1QKl/1O2Q8d8?=
 =?us-ascii?Q?DiVDIghCbjUD5NPIwUmsHmxRyVIRzHZFEFlOr3aYlRVSdM+OrBpUOpzevWXO?=
 =?us-ascii?Q?52PlMV4y1nqN6P8fexxeERv/j8Q1KVcKpvNFhE+fJR9M/BLxEU4/beZUea4u?=
 =?us-ascii?Q?pMoIKoaEuN97R2VQcdDo/bM1CgjVhbMt6/nwdDdu0V89neTtFuL35WhZt6tG?=
 =?us-ascii?Q?aYuPfGkBKBUDpMUSQCpi6Pep?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d93397-2761-4bb2-ac34-08d9722a9b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:09:16.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imiF8AwUxgffHLl0lqyT4ap20zLTDjMoqOxJBUnpKRuOKu1SXN89PjIphpf6Q+KLHOEyvhqjtru3/OMnfeughw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4949
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Tuesday, July 20, 2021 7:30 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v6 03/12] target/hexagon: make slot number an unsigned
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Could you describe why this is needed?  I presume it has something to do wi=
th the type system in the idef-parser?

