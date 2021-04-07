Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C73D356FB6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:03:38 +0200 (CEST)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9iS-0002KM-Ep
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lU9eU-0000qL-2j; Wed, 07 Apr 2021 10:59:30 -0400
Received: from mail-eopbgr750134.outbound.protection.outlook.com
 ([40.107.75.134]:9865 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lU9eS-0004bB-Fh; Wed, 07 Apr 2021 10:59:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqlGvLTKpw9zUwvQVaJYwxRPxM5+l0CkFhS8e96Ch4eFpZGXrw7+gqEV1Lyc4cXdE7LECFmmWwzAnGzrbt9cFE/Byv9iegL2xCyK1hB19ZyvmMm9of0b5qWfoJ4RM7HEGGzscIYfpEoLcUjlT6lRRa/grZLxn0FBMBMpANA9kkdf6jDspbkBxhTcLNg1N9synhpb7ifB3Olonx40fID/ly0AjpgtZ9ImUyppO1KZb5lJgda40OgRwbq5LjgDIZ0VIft3JwqFshqgAebZh8smBWiHzbOu+3jnT90wrUhwCmw5FJSZE3D8L3SYpH9189p3/Rw43K6Sx6tYU/30vTWKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSIoLOeX5dgXNEk8B+x4v1+lt+Zb2lewDaqpmOlCAAs=;
 b=ez+JJHkzin6EwxJAu/YWEifu1mH/jJe8ToB9QJCl/u8rUjTFdqa5a8TUZjJhQT/H296IbA+p9u93bEAx3n4aZGNK96+tjb2F+mlIjJHWvLK3aGKOqV59WoRjTcZr3tSo0EFCsJvXyqY2BAuYIkGVosvkSAnlMGKiFgIsEh5iKbruCzTg26Mn1DEoWYMVVmSEDWeuXT4HRFChUZpivcTUXPq1w0rDjKP4PHa+qq+VahvHr6xKv+6r2oiqDz7vloVAiaS3pyhwvS6VuUVaZ3ERneIoFLnhVT1jTmltfM4Lz3HS/1IpPBp5ZqamNDRUSotolFxJ+1QE2N9rpoQkb8lNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSIoLOeX5dgXNEk8B+x4v1+lt+Zb2lewDaqpmOlCAAs=;
 b=BdWnHbm+Axi4/nXaiAJ+PlkZ8iJdFsoUbJ4i4pLzrVWVIZ0KjSKpn1OZWRbD2oepJxNzZFnitt/XpZ50j/ZeQ5+YWJAPNIWKw/mG6CAmL8vTG4Gi873JeMQezXRRx5hT9htvKJl6hI5VksIBdTMzFaFT6N72GRWLNQoNE13ZQeLj4d53Sl9rs8ZrMhxJjxCkXOrdM/PxCNx0GpObJ+gAdTMPtY589bvPuYAy7FNywQ/Y91PzEsvH0ZkYCbhJFxCbhKJr6A9ISe6yCpgxhkVVtvDOSKfuhyOp0B6oZvcec5qIBxVQcpdlDT7e17QXvCBX8O8w4270JJGEvwwU1KmNDg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3522.lamprd80.prod.outlook.com (2603:10d6:102:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 14:59:22 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.3999.034; Wed, 7 Apr 2021
 14:59:22 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH 0/1] Add 64-bit instruction support to decodetree
Thread-Topic: [PATCH 0/1] Add 64-bit instruction support to decodetree
Thread-Index: AdcrvHkb2xVSS4SlSXedqO14n1oGlw==
Date: Wed, 7 Apr 2021 14:59:21 +0000
Message-ID: <CP2PR80MB366838CFCA6672A9167CE74CDA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.188.65.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 655edb07-1120-45c6-2534-08d8f9d5ba38
x-ms-traffictypediagnostic: CP2PR80MB3522:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB3522A6F0974ADCA379A899C1DA759@CP2PR80MB3522.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5o/FFKuyNYQJNC6LROGqfQM7q4dQ8USZOFH1A5kKvEqK0M+sPyptnJ5Ou+BcEos8t6KmUpcDG5rJoI4KcaO2GDZ8ZWVcPztL6W0rEioxcp1g7Ml/x04OPD0AIptmTKzVB0IltyP+GP8N+GSJQG5FUd6MeDA9w8TF8S1LhNccO3f/tgqGgL3vTZxmKv/Mfr+TK5IZI46qIV4CBQTW9BTbgQ6pz5F7BUXkZ/E7+Bmo2OdcN1291PPggBS1i8LxLKlHbGi+fXUG/4ZXwvUwOjmeCZBoMD5I1FoZcHNrhPlRLLMpvG5sNVjKxADB5deCxPKyHCaNUgipelNTkZ4Uh2UomCI2914aDT/mJpDRPbI2ZF6+716pW1BMoXBSkxbi+sDBnQqbn5sanWQ06ksNDZfmKwsgTtl9sN1kfL29UQAvcXJAuUyucbQ7pbftKLlQZpSOpBOr7a+F2n/AUh1zCs2ZFYP4SYHf2JyQV9R+bVDwJFv/MP1ft14xbW87+oNDtTGDwpHHHXTtUldog38QMs4nm3HegrSniol/+buxR0vL3NCELsj8hhPP+WK93uO12P+yFH2hj9HNko+HVgD0AeUyycO/6OTi5iL1MXcwFC4RNOO4zQ4jI+MxC0c/YTPHEAMsF0CPML8AJAKpsTDaVlp1eRCfvghU7iSQOocfuvDyEp8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(39850400004)(346002)(136003)(6916009)(478600001)(52536014)(8936002)(5660300002)(316002)(71200400001)(7696005)(54906003)(2906002)(38100700001)(76116006)(4744005)(64756008)(66946007)(66476007)(26005)(9686003)(33656002)(186003)(8676002)(55016002)(4326008)(107886003)(83380400001)(6506007)(86362001)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?klUfoqZYvfuZYtqxBUNH307muu8GbP3J58AmRuqWA2guCeJwXzeRxG6zwWzW?=
 =?us-ascii?Q?crqLsoFsBvzrvWXbRsoXbLIg7xVFD1efbF1MhWykRsAdcVnNO1ZqIeTrjYnF?=
 =?us-ascii?Q?y06rTYdP1QSvlnLzreuqBZPpl6Oc5TqW0yh1LGzSv9P+fd8vMLQfWHYdbLvq?=
 =?us-ascii?Q?wUQbjoYJNZuCRmBBwGVNgHH1zRQ5TgMDm953dI/85lQvm0T1ekczL6GG8ZkR?=
 =?us-ascii?Q?YNKhvih1JRHf+1cxAwD7s0UL6awUHnPoGSwAY6mX0ozuICW1scrGZ09cQzJ9?=
 =?us-ascii?Q?ZLesJPDUz52MPqXEIz6DQuuY9Vc4G1cddAnJTFHxURMzqiixdJX83dvewYE3?=
 =?us-ascii?Q?edFoXl7nlghWmsjMu1J7/7TN8dKxrPwUcqJghqJvKCxE1esFNY/B/2NeH7Y1?=
 =?us-ascii?Q?SSI/zb9Ronma9MFBr/KrBZsrRswKU/as3c4/C9T3bc4myKqXzwwqwPsSipqf?=
 =?us-ascii?Q?1nLGO9JKJpXUVd3fOigoP0M1ouBAJV2R2/X+3iOZbyPKctXhurpCKoRLghL6?=
 =?us-ascii?Q?oflkbFiI+GTQXqHXF8r8IbDYUmB6jc3rpQ7O+6TxliHi1gs6KEQeDPmnIShy?=
 =?us-ascii?Q?GYo2jmqCS7hSqoe7/5m10gZizOutydnU1C/hfrwWQV7np27xUgnxBudiltOy?=
 =?us-ascii?Q?3CCutwkDKYH1wV0vVJMDqwSJAVQxBC+D3ZGw9a6CRXsq1GNw3pn4QiWuQEPJ?=
 =?us-ascii?Q?aIvez4hLMFKxcjS5ipTI1t9f2tarBff0PsCMbZs5DHaMmxuHKuqTrUyE+/pd?=
 =?us-ascii?Q?EJ1k0Xc1jLFmiV76z+/YcTWb/XSBvpnDp7SjpsCiugfmQNJhsUrIySvLA5rH?=
 =?us-ascii?Q?ygKDA9cVP08ELSEOVCTbwJgDMaaDPlTyzKRCuuK7CLmlTeyA4crk7JEujZjH?=
 =?us-ascii?Q?pwsnHL1WArYesQac4XMs+sNDUdP5SyqNPSgQ3iE3uPr6cDUUKdPAuul7PEcm?=
 =?us-ascii?Q?XgWgWYqKgMAZn9un3ynpJJHG77SbJp/TNMDtJ0CxeyldnKAB9god2Ves2uX+?=
 =?us-ascii?Q?v37msEyBFnoEyrLoTC94TePrJsOpJrjuToUF2F9WHYW06YYiep0+8qRK0XUB?=
 =?us-ascii?Q?tzbNWkOIv4WZvX8Pq+vrWEFC/HV5eoGbVYvb4HEKOPMZ+IrmLIk3VuDjEw8h?=
 =?us-ascii?Q?cQBtLKw9M1PnlzE5QeFE+kLCQ3fG3ztrw1lWVtGIZGP+/D5BVCuuzJ+T2mqm?=
 =?us-ascii?Q?JFis8I6TPaf1PVFpvYuS78LvBR4yrPtlwvgc+DioUj7ufhikOoJLn/92H/xU?=
 =?us-ascii?Q?NvwPwxVISRhUzKE7i1ujCYhchTF7V8p4wrDSrz8lgA07ekVLcsPFTFVh+tu/?=
 =?us-ascii?Q?6PTtNtHdZGGIpg4aomoIJ0Gq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655edb07-1120-45c6-2534-08d8f9d5ba38
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 14:59:21.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVhKNe9dA+yZscz6d/F2y9kWrfbo+v4KYAlcZdJ9gS4aiWhiLyyl93KsimWhp9cnrjnaq8PIp7WdwJOlPC7T7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3522
Received-SPF: pass client-ip=40.107.75.134;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds support for 64-bit instructions to decodetree.py.

It will be necessary to later on use decodetree to implement
the new 64-bit Power ISA 3.1 instructions.

While doing this change, I thought it would also be nice to be
able to specify different sizes for each field in arg structs and
also infer whether to use signed/unsigned data types based on
the field definition. But those would be different changes,
anyway, and I limited myself to using int64_t for the data type
of fields in arg structs when insnwidth =3D=3D 64.

Luis Pires (1):
  decodetree: Add support for 64-bit instructions

 docs/devel/decodetree.rst |  3 ---
 scripts/decodetree.py     | 25 ++++++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

--
2.25.1

