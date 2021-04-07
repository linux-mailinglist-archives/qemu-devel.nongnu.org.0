Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C33577B9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:30:27 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUGgs-00076x-Nh
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lUGeo-0006aF-Ot; Wed, 07 Apr 2021 18:28:18 -0400
Received: from mail-dm3nam07on2106.outbound.protection.outlook.com
 ([40.107.95.106]:54528 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lUGem-0006Wj-Mf; Wed, 07 Apr 2021 18:28:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAc3xK4o9kAjY8glYTLAp1CZ3o3DupkhXk9WTNDppZqWE/X90gbYq9duPEB3sc/YUgBWqH5mj5POYUB88PU+OIzSqI4BC0axEzDvW5ohmL1LboCh/oK/3f/PZXpG11XupCDe/LrAPO8U0gLBVo1JXN76oQ0irEPwsA5vtx0J4oReX1HJiwFTPnelT20Lx9nFu9MfHc5vVXiFoYmogU/7uSitz7FSdAUEOncwSL8Dxu9vHAVynuMlOgGLb9HgRCMYuo7BtpmT/rV12uKLQbYHYOMavD0xEQZwel1/SX1CO45EI3ayn6dV0w4kMsmUL92njMueVNVTBt0j82xCssXydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho1qWr4BQ9ebYeaOh8SKg+Nty5Hrw0LpyicVcZuXMCU=;
 b=ARMqahfKR3oMQ2xjnrUeK4ULlqn+IYI1UeUbn2oihp394G3A0ZMlMzog7oMN8CMS025G1IOMxzgJndlO8760ToJo3XGrVf7c4QLYxkhBEa/Hsj+dYuX4GIxxL693WDsUTMESv0YQcGowHE/thw2+JpYjNB3+CMXCmwu+wmAuMuSzizBc5BRI4vz4T7M+U2uO2SdfyOf3C7NWMDyUZfauI322KG1qSzVUMmJN1YH1iuvhPbozCx8ItpIpN7O1xnMoiSOFQPt+2KcPSJGVjdrzZXaY6gB0RWJ8+xVV3IViTiTN5mDfInD2lzmywXrxWnFDGSJ7lyTHpqQl9mPuVo1hIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho1qWr4BQ9ebYeaOh8SKg+Nty5Hrw0LpyicVcZuXMCU=;
 b=KCZCoJycWPqdldIeaA7BeaHMejnBExaOSQfjAeK3ryK+sJBgTQq0Z3L1yrecrx0qvFpR+akZSX404xJy3o5ng75wIVdZIE0opWAg0CHmcdX9TJrq0Iz7q13g7t8+00LQZhnLuGjUoxDmlxE1zTsCtzr5YfTdvZh/Omon6RB8Tanlidz56jZtyvqujy4JWvG4+BtcVgAqpxX2TjV+28hRqMfGhB+fa0dz7f169B5CKcU0PVrohtQFlfbl6eJGH6d8LYk2wP+3aueYDTdX/Dyku+m0gmqjLeTOu3wiBcGvBajPb8CIG35jpkuT1MuZhSpdEsxZVkS+Xt0O+T5G1yQZUA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5923.lamprd80.prod.outlook.com (2603:10d6:102:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 22:13:08 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.3999.034; Wed, 7 Apr 2021
 22:13:08 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/1] Add 64-bit instruction support to decodetree
Thread-Topic: [PATCH v2 0/1] Add 64-bit instruction support to decodetree
Thread-Index: Adcr+mW2wEBYT08pSOC0e2/vaIbbyA==
Date: Wed, 7 Apr 2021 22:13:08 +0000
Message-ID: <CP2PR80MB366898F1A3E338C451A6EC0EDA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.188.65.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e550436d-1d30-4465-78da-08d8fa125361
x-ms-traffictypediagnostic: CP2PR80MB5923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB5923319391FDF1E52F8CCA34DA759@CP2PR80MB5923.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0RAXgr8p6505TmVg7OiXXvWH+hdm/Hh15r6V1VQ2Mzh2g6fKMIR1t6YlESn2TAuL8MBkhbsFi4BHVB3GkRvuPg0GLTNz3DSeg92oQgDocfKnt7pZrZXMI0eDQXxS+1CQtqaGJ6KqWUJzgGWR7D39pUNda26CunPMTSB8rI9AS5rKh0WOOQTfCwkVqx+p05loIcnFUpmX+JCLMUsIeoahGDn3/sXVCFTTG0QFXQklFJJ6uPqE0iu/pQZc9TJPZ9+Sx+OgJaFl1JPmWBKdFgQQ0kH3+8GaSG1EpvF9xbPUdlSbMaa4WbhJr54U8IgImO1pWuM/bNS0VUEBFW8Ouir0nrAsn0A4lfy3HrWsVq3kvfFo7lCOrAIu/BajuWdyMAEHlTdnuH2hfkM7XBGR5yJ6yL37Mhmp5yQ/AnVSAxEEZfjJtx0JY2COTuDcGK87NAAjJ/XNfMteSJQjPoXf1hjZNhGlzvh3zuydLb8BDojaDi2uVWDU42+GvTs78QNnA5P2Lv5Kxtl4/Jbv7n4axLTjfzSDC4FQ540MFIAFNcPB0sQ7/hH6BrP+szBtFE6BAzM6AuZeC+nF4aUkicJDzzMzwByekIrt3ezEVgBOJtSk0s0OmbdtJ8fGPtN/cm9jbr7lEgES7yiW3mGOrbpc1Ckx9x5CvEpLSNIHnYCA1V4nhT0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(376002)(39850400004)(9686003)(107886003)(316002)(5660300002)(26005)(55016002)(33656002)(54906003)(186003)(478600001)(4326008)(8676002)(38100700001)(71200400001)(6916009)(8936002)(83380400001)(6506007)(86362001)(52536014)(7696005)(64756008)(66556008)(66446008)(76116006)(66476007)(66946007)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?naZKUVz9O69U0d23iXUrKe3seK93Mx0ro/7/7yoMYo1n19scbF6d9ThMaR7g?=
 =?us-ascii?Q?hxjlUaqtLz/s7L89bOZkKxe4ALzi7sz/7Z3PEMUh1kBKrt+hKHlTSTG+v+n4?=
 =?us-ascii?Q?bLr/KQZnzcJZx5fd/9bnZ/HLVJsRm+U4emfyaKAE3W5ND8nYCB/DbMwGnarB?=
 =?us-ascii?Q?y8oEIytB8cyMXGf1+QAl5CUqK6sGvh8Gh7H3P/qdFylCI2gK8I6iCodI1wY9?=
 =?us-ascii?Q?wZSFllBdiO3rDfB+MXG8JpziS0jlGnNzazDhmt+jgQSERA+gbDTeIYEA6Bhl?=
 =?us-ascii?Q?Pxh5G5UDHwetTlAdhDm9XljCuLlCqMvyURGMcOj3Ag0s5pI9Lnr+v9xukolJ?=
 =?us-ascii?Q?8zR0hAiY3HIi98sC0atZ6Pgs7dAYg/RoGoyzpk3j1FuwJJ0Gsv0DdhndD6LQ?=
 =?us-ascii?Q?R5TuudxqL6W2YnFaAdXXaPRyJnB0txkEzvk0R10UcEh7hc9QHZL59LuDdnfa?=
 =?us-ascii?Q?0sp4BwnAsHrANqkX5sGkyGH9zvFXjklMKotFv352xYcdUR/XIYx5pX6cw3O/?=
 =?us-ascii?Q?SP+wZ0AG7K7gqBi/Cg0t7eTJnp3fiD18XTNG8mZQGE+JRMXXATbpCALEO+8e?=
 =?us-ascii?Q?qbett0BoxICxzbG6LiSumBB1/N2Oalssam0J9G5oNTcNr/PzsygMU6KTRdLT?=
 =?us-ascii?Q?IHuWU5TTA3gvBWJuHfbfPqJIwXFqA/WK60aLeeMkaOwoXw1GcRbzsgIdWm6e?=
 =?us-ascii?Q?Sh4pW8P/+EYU0oGmihexOFeaBA00+nixr+bmKSVzn9Cbg+C/ghDbMTY29uPN?=
 =?us-ascii?Q?hivur49CTGK5ww5n2tBP+Q7djkiXDKRKANVgLgpS8g06B+QKZrbfoncj7b6n?=
 =?us-ascii?Q?PcV6U8eLWCNU5Vw3N8uCz/+7CZf8Qt8ZS6O+nbGK+7WXbP/6z0lXBtrGg8pC?=
 =?us-ascii?Q?HAzcMqY1XOG/R2RKk2kExfiMmtufHOqymXPBTWyVPZ9KfoKrXd4+2ML6d9e6?=
 =?us-ascii?Q?A/sgznI7/qz5ccGQtdD92y7vvGeOCxmAHVPqzJqldBfTH2a1EQNMSpBEOW4v?=
 =?us-ascii?Q?MK1g11w1Pamrz99xM0BiKWqwy8ck5d67solYdVEKAb/LpLnFB15JWzWH+wLy?=
 =?us-ascii?Q?zkoIg+J5HfM1sltAFHIo9p1rPygBxm9ArpY6T9A9p01EsSkbfT2BTwXMM9/Y?=
 =?us-ascii?Q?8JbXIJzVFEJF7wn3Fiw/k4tNSN1HzGCYefyDu+oSxyBAS/a7ObH+HguzmbQP?=
 =?us-ascii?Q?sVJv0NlpRY4POaTKl1BhfnfTEWBPhC/Dgb115rf6+/6NWJ6ClKpjq/mL5M6v?=
 =?us-ascii?Q?4vw24dgxS4/Cn7FIOZlqnhg6wUUPbvdjyTYYryWASgNE82clhL8Pmetww7MM?=
 =?us-ascii?Q?CYsYJwNis0HkUfz6tKvpw42W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e550436d-1d30-4465-78da-08d8fa125361
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 22:13:08.7488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7se7QuCRLHCyTQqQJw8lQeO5/Xp3YXg/Q0IZGl2TZdaKoXGfjgtd4eusepTNM7r4O74dFsQVa2lV2tvCUfWYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5923
Received-SPF: pass client-ip=40.107.95.106;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds support for 64-bit instructions to decodetree.py.

It will be necessary to later on use decodetree to implement the new 64-bit=
 Power ISA 3.1 instructions.

While doing this change, I thought it would also be nice to be able to spec=
ify different sizes for each field in arg structs and also infer whether to=
 use signed/unsigned data types based on the field definition. But those wo=
uld be different changes, anyway, and I limited myself to using int64_t for=
 the data type of fields in arg structs when insnwidth =3D=3D 64.

v2:
- Added information about the field data types used in arg structs


Luis Pires (1):
  decodetree: Add support for 64-bit instructions

 docs/devel/decodetree.rst |  5 +++--
 scripts/decodetree.py     | 25 ++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 7 deletions(-)

--=20
2.25.1

