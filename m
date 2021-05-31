Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C139675F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:46:56 +0200 (CEST)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnm07-0006Am-Iv
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lnlw5-0005Jj-Cc; Mon, 31 May 2021 13:42:45 -0400
Received: from mail-eopbgr800117.outbound.protection.outlook.com
 ([40.107.80.117]:54000 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lnlw1-0002HE-SJ; Mon, 31 May 2021 13:42:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ob76G3uXEYcD/KCe/vywMLc8g4HqJW0qCOEoXzhF96eqW2IaDVouMtbkadQ3shFxFaMtkqQjwcfRtaSTmLoN5Kt9R8mom+CudCLUFXoPLuYxX1qFxlUr6Kv8V2Qz28xTnFJkhaLtHWxCYOGy6hRBdGhKRjQMhoceUeRZFK28QBMu9mLgBIXwkOacoz+9FnUIf+ehYcsTQOfss2b7+VOp6WinnFuWPamKF2jmp8ExWTTWA4x3gSnuqeGLeBeiRqf38sSnnz0XXGtsJewtSLyatw+epSizg5Gh5Ms1r+6rJrNZYKhGhNR+gpQxV2+5RnB4Ltl1dBmQCq1rmxBkAXwVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/dXWe2AhfQk9fxZ0pDcy5sl5UdWeTn0hURKveYaArs=;
 b=VfW8fghMMf3s6TRIsyM7+70/BwiWEZHJptG6Gg8HKwgrXt+L3YO4LINBiuPhzonXC3PEw6yho5zjZTi5v3B/iknngD7l2r6jo6pQZRlEGGNFwdyNCVKeeby8CuHCRmXYSUDg1CKlNVRKZVVM0RNQnyjcADyEjxOIfOaJ9F318XRU5L1dt+oRYCgg+VODOY1FS4Dk//qg5DmRkjoUw7J5z0C+f5T9qp7KxiK86BKkgxPKWJ7Tc420XkEpYlcKsCIkdQOQnen7e9pVaV+Qievt0FE111XkY6lSeUIJMr0Ug59bvOFx4Rx1wpLE8ot99yGT2uKzQHHQM/Fl6Sqj64ejmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/dXWe2AhfQk9fxZ0pDcy5sl5UdWeTn0hURKveYaArs=;
 b=QIenzjqjIsFwEiwzN8BHleB85OqHZT+4ZFNiQTyRgbcyxccVh2MCMOKEDsScQbBqt2SK3aTMOUyRoVjAv8phjsGibiq41K3TvdTffnk15Xb7NWKhyvQYEFT719+LKAP9sTLkVLMVBQ/066fSUBxtF5e9TF6gpHKX/HasxOoPVeBkBythwLcy0dkhx3bniyUbqBm6XD83vShG2sMw1od9twY6yJYzeXPWwbkvr4dF5tCnWV+K/Y9ZGX9Hj02xzvZA3Qb8MM+tDgNo+7u7UhPSUnaHYcz9vNzKTEq7DgBiRjYXUJPGjZXlhwN3GQn9ImV0uLQTTqVhMDYcx6HJvOrVxA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1841.lamprd80.prod.outlook.com (2603:10d6:101:7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Mon, 31 May
 2021 17:42:37 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 17:42:37 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 3/4] target/ppc: removed GEN_OPCODE decision tree
Thread-Topic: [PATCH v3 3/4] target/ppc: removed GEN_OPCODE decision tree
Thread-Index: AQHXVi1OSCr3V5xP8UaxdGEzpdBY0Kr92smA
Date: Mon, 31 May 2021 17:42:37 +0000
Message-ID: <CP2PR80MB36685E37AB945E5BA83510B2DA3F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
 <20210531145629.21300-4-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210531145629.21300-4-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 734431ce-4da6-4ac6-f21b-08d9245b7b2b
x-ms-traffictypediagnostic: CP2PR80MB1841:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB1841338B79F80116CFC17414DA3F9@CP2PR80MB1841.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TQVNwQTAT2/9b0kUdf3cCR2bNfC5HF0dGEFXTLLlnDcHZEihoYa62zzVAmRjkHL9Z/dCXu8N8+hfVBbYuSWzOTqfDzkXr5gzJ3ARWRAQ7flY7tzULq3IUaSdczM/TVTb7hZ6NHdBN5Rv2cUZ8ie66zxlqeR0TZINjibeC+wyLlvzrR1txE1A/TVGh2hqyyhIn8Q3jmekyOeWyhtK0BBCjQNaBAg4UmBsmLxZb69uvZDoCpA+9uRI/1+RpPMtoUYXF8Vl9XSHO5z0UBuRKvk8aI3wd0jaO3foab+cH3L27LQU2aVhZPcIjP2aIJHnHcmDvVQMVGOb9hvEpmFxGPdMyKULdDRmHO+Qu3leCtjfNAp7diuZokT/XDuJSz8eXxp85nWjOYgmJ/m0AIqiPTuLFwlkS4Abr52Azs6eC6j366MypUZY24RHuX5Hmg0qnaZ/CkoONhneoOFL+GkX3AwRtYsJiq/5bhb9bklq0xwyUUzaXP9rlHlJM7ptPwz+VDqIzCd6X1vcKAQ8q3iLfQEEneVIPTz9pjp8KYGuU/e546y91ADCEY5PGBLkCVnux5ULjMNGoDZ2IXNERUjPnES6iz6f2yO4g0FlAHUK2uMNAzZ+gNgXHMS23EMk6z/tpfvpVJ5GDj2Cn7LLUf2xPFRVS97XIBcytynhMnk46aG9r596+Lh66iYGSWr8FVzS3QOduuuOQ2DrinuRYI7GvZhqs4e0es8FieRdkHlD7qlhvN0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(39840400004)(136003)(64756008)(5660300002)(76116006)(2906002)(9686003)(4744005)(66446008)(7696005)(66946007)(66556008)(4326008)(55016002)(6506007)(66476007)(52536014)(86362001)(8936002)(316002)(8676002)(71200400001)(54906003)(38100700002)(33656002)(26005)(110136005)(478600001)(186003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eF0trPFMq0GCyvefajmYXg5k11q4ERl2k3CCVPgUH1+iAEYJM79V1zx4S4cT?=
 =?us-ascii?Q?mr1LzWd/2IzDoXNpXquvf21e0tH+IUIY62k5gJTJfhWtIW88g5CUf9Y+UPKK?=
 =?us-ascii?Q?fBrdbdYomQDx+NOvPLDj7tBun9wg5wdrTmfLcAVDfdffuHoqViAQwqwEGA6q?=
 =?us-ascii?Q?/zZxnfFciILYVJWHjEwmvb3jPoJ+T5otcqDuSOeUI+khSrda8oSVumv2Fl+N?=
 =?us-ascii?Q?/XBx2DBEs+VLP6pdw++EcQ0YmTJvYj0gVnyRugOfWUJawBkfFwzDxbV89wHr?=
 =?us-ascii?Q?3Lz1FSwMrzTyqeyoXY3SdrnmoayqCDJbWUXO+bRsbAB/77RPo9dQh7bXU8U9?=
 =?us-ascii?Q?Fs7EZWCiOiXv9z5OT4ax868+uNi8p/9U9ELZ7oLHBD5n6C5pYnKYvV5jRyKd?=
 =?us-ascii?Q?MN74h7jFm2CNRfsnNxcinMEpg8id7QJNWCdLELgBsbFh0l+ijosgjak2brOW?=
 =?us-ascii?Q?hiG8B3N2duMkkxO2fheEN1Ru3K1ycSmMSDwG+952dErpl+u4qiRyGXl+04AA?=
 =?us-ascii?Q?LxAWirPx0/KK4qXRyGFmmMLITets0dBYQZC7E+zLauyTgNcpUaw3SMhH7Uz4?=
 =?us-ascii?Q?5HQdt28MM1pYzmActQNR9zy7/RdQYbf/VlUXPaktoKWQ4gGk5IYl1xrhqjgN?=
 =?us-ascii?Q?qXQTEsezdMuJQNHDRAaepgq44gmDhLci57QD4IX3OaphnTntMiwE9mg5rMcz?=
 =?us-ascii?Q?txbdT787+WIIS+BnZdhM2NO+bTDmOt2kJJJ6hyloOwLCa/DSnOa+VBSlqEiJ?=
 =?us-ascii?Q?Pt/vuDSBS7n2idx0LVvm+sg0M6HULSSDnS9xuzjUZs3fSNt4Y+mprXuVBT3R?=
 =?us-ascii?Q?AemDhqN9YroE+4UNXCiOMXzQOQ9YqJKt6bX0Fvj5AyhYeQYawx4vH7HYxQX7?=
 =?us-ascii?Q?pxHAeGG7tdQaICkEUAkZdk8Ypu5kK7RYpdiEDZpMPL9Wh1VlgiifLnaREt68?=
 =?us-ascii?Q?aVnh+YyAO+RARfE7O2jZk49u3FRZFSw7XI915tGbUkAUsXha+jGjk5DOKafY?=
 =?us-ascii?Q?DWTxTpBkBv2Lyrgmzs24nUksIt14Gyh6pxIfJxB/R9N5ul6v+k4R+ERmVxz+?=
 =?us-ascii?Q?U8w3qpoH1V6vmSpv5yLm5j94dfRT2PIeZQhSqVHQ2yJqUTk7jg7BcDcmvo/O?=
 =?us-ascii?Q?91jSnTPh/UYeRg0FFgvPiBW0PlAFO81gJMZ/GbF9zKYkycHGkNlwA6v8ZP5h?=
 =?us-ascii?Q?QQz2rSsbinMWmtqLhc+ihO7wzYIwvifb+LNUY8K5rhtpYkHZalesj6wMox0D?=
 =?us-ascii?Q?bk5AhJJxc3Sq0KTO52Muz84u/C9H+DvkZcqrCgDy7puaP5SLV5vgEjXjiusC?=
 =?us-ascii?Q?Nso=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734431ce-4da6-4ac6-f21b-08d9245b7b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 17:42:37.4218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31w7wMGhbnvsD/fWA1DJ+I/FzU+6XNGRIjc+0Mde81KKe8/34oONWOjy26Qzs/bHiikG4BNmJcPYzgjhW99rTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1841
Received-SPF: pass client-ip=40.107.80.117;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>      .opc1 =3D op1,                                                      =
        \
> @@ -1353,7 +1352,6 @@ typedef struct opcode_t {
>          .type =3D _typ,                                                 =
        \
>          .type2 =3D _typ2,                                               =
        \
>          .handler =3D &gen_##name,                                       =
        \
> -        .oname =3D stringify(name),                                     =
        \
>      },                                                                  =
      \
>      .oname =3D stringify(name),                                         =
        \
>  }

I guess you could remove oname from opcode_t too, now that it's not being u=
sed anywhere.

--
Luis Pires
Instituto de Pesquisas ELDORADO=20
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


