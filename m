Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71404DA022
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:34:24 +0100 (CET)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUA7r-0003fa-VY
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:34:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nUA5Y-0002gd-JL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:32:00 -0400
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:59362 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nUA5W-0002NC-HI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:32:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEyjEe21flJGtn/ezIYeSIWRtsKNc4SHnXL8rmnEFxqcySBKDHAhfghXifBQAtyzP57q/mP+tNx8KWnmy936mhZmU8D+KZCX2KR8FuQga25JBd2xF348vdgrq6+MWiNnSuz+8717QU/vAjhqYsbrNQNSLUZ21nyW9sZO+1g5hMwVf3dwv3Uj+lcu94GU358wvGBdgOqwIP8hyBAljSl36Zi/XtcTEzj72I5EHSGPeJ5detA7EhT1ExkXUaeYUIVDXdQfOI+Ovkssp/JK0Fezh1F+uRD/ESdXWd2rooPKI7UltSIjunHYP6slvVh2c5wESG8S0SYI9vEw4LxARd+B7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW5dSmKgM2IGSO5IYxMbSUxAhxfsg9dy4yz1TEDA110=;
 b=Z9zcB61vphD6vUOm4AJkP0uZAj/eQaljcCThQtR0t7SOwipbMgmdtx1EYMjddUWjqcOl6u9VSwgNwUNd/lGNNt7hxGWHRI/Rz53o5j86CqNK9YrAkxf6fywvnHaTR7qe46QRtmr4cZuALAyQSmbaaezN/v+T4muQnCp2nvCtOnbRl32JLqbId8AHRa5wtLpiBDsoAXRmsZMJR3wnZdZleWtoI6rmj1bige7mSd5oH3YtiF99VBDKxwBoUOf0snL8DO8Bv1Di/pCXR+WATx9QVT4ChF/jQvKp/RJwwJX0r46a/bCBGQSm1VGq7QP3gL0yKmsZkuBMWaRJIbIrRmsIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW5dSmKgM2IGSO5IYxMbSUxAhxfsg9dy4yz1TEDA110=;
 b=Ti7HRuOdseUN0bsXL1ooPU5WKSBnyNKT02hC2//5+8tTmUfsGnv/jdiOaRAGdoTgRQsDU6VUI8UX1XRmqT6BtEb8Rg8aNXVzZ7IoMo/+7H5Y+YHdXBJiyBrSgIZ43jtDUyX7kcbkqsaVAd4rMx61eajIUPRl0hLxYPIf0tglYzk=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by VI1PR0902MB2192.eurprd09.prod.outlook.com (2603:10a6:802:5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 16:26:51 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b%7]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 16:26:51 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 42/48] target/nios2: Implement rdprs, wrprs
Thread-Topic: [PATCH v5 42/48] target/nios2: Implement rdprs, wrprs
Thread-Index: AQHYNHJqmbKdBf0HVkCWvXvsJWRXbqzAoWzw
Date: Tue, 15 Mar 2022 16:26:51 +0000
Message-ID: <PA4PR09MB4880462F87600A02A5D58629EB109@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-43-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-43-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00d403e1-2559-46ee-b8d4-08da06a09c55
x-ms-traffictypediagnostic: VI1PR0902MB2192:EE_
x-microsoft-antispam-prvs: <VI1PR0902MB2192DF793CD2BA3E8778F785EB109@VI1PR0902MB2192.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2CC6Ry3B0AufuHdkRymQeoei1Hf16/6yWnYdiJlrOGqAxKEs0hhO7RgQ/m5bS6ivgRfyONPjbEaq7s7Szyfb8B7mj6uN4IefM6Wt2/Zf0RUMANkEAC/BrGnC0kvJW/sbTIobf9HNeGUYZDnnLrfwjYyAKsY5xpkozsDDWLUFWLBOLnHqcf6ngkmRt4ND4uESUayAWiUVrEBNXWBhThlRUZul6RBMqt4trYcK1zR8Li+GPr9YXD1QAqj+1WQM/XCaGiaOe687SfRqdVqlUzmY6kQx/vWEJ1d8wc0i3Gg3q4PjGcQQGPmNicPn2DtZCERXF4M3D+uQVzMBR5q2ZR90po37ViQs9NYXNLgRclTZ/MITB8XKREKA1Y9eXIDr4+xG3JNmmay3Wzbegm2RtY+/CMwICYlAkE2+HC2nfjJj71qPn+rqJd73rcYQOAL1Q2Kz7HB6udI4+iHmeezDHRALckHHpmW1sO0tsY7zRxvn0OskiizA/tUAVJNlUvRz+Q9jZNwGEetsmgiKMo8GX/xdXJlEgwHWA05167Wb1THymuo5ncuig02wKxmj3S+8gJ09J88EHa3KEiaRZuw2SmCt0lTcOAg6D+pUVKmqSAEevnrJgJlTXeEIfrqcp3SI2kyfzlUN7//bh/7IEHYj/VHlymeE5bJ+2DpKBL4C9EWwwSbsutFdYrfZoFp8cnVVjTF4KGlzRc3vR0frxga2xiuVimiFQsI/WltoyYvlNKutWw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(44832011)(38100700002)(86362001)(38070700005)(9686003)(122000001)(186003)(71200400001)(107886003)(26005)(54906003)(508600001)(7696005)(6506007)(64756008)(66476007)(8676002)(4326008)(66446008)(66556008)(5660300002)(8936002)(66946007)(52536014)(55016003)(76116006)(316002)(33656002)(110136005)(17423001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w9jVnZcKKqpsmzYCj7NHvSlWOaRG2zVN4AjkyKul33zueazpUQCkC88y/77O?=
 =?us-ascii?Q?c6Iug/opFC8JjmFHQoS5ZCFEhavxgl7Fxr4YCTXYQPGcrCyoNE4BfWJoDkKD?=
 =?us-ascii?Q?yWQeh2KukVBCDN5Yqvf1bxXQVyTz/BuxPrt31m/zMALfQVUe+8vBVCaTvBnS?=
 =?us-ascii?Q?awLi0K/LSaGkELKMquRS2A3OVPJidiIoeMl8o6Zlo82RhKLEZuixP0yEJJ0x?=
 =?us-ascii?Q?LiNHqMFgKpWBdZABZGTREojANCW0UGZbf5C6Mn6FxbdcpZWYwmwK9F1cK8bS?=
 =?us-ascii?Q?DTFcoCH75CRj2H6dzP9EyAyJ9HFB0oJMi65opqJqiAd4k3c9Hf10JELd1gEy?=
 =?us-ascii?Q?Tda383WG2PdLGp9nlb27llXrPJFXMNpQmuoQyc/WRu3G1ltE0dRPtbhEW7IJ?=
 =?us-ascii?Q?PXLTWV+OX7qy/wBSTgoT/Jz9DJedympADbf4H8P1IGpBwS9iUeSCfGN48pSP?=
 =?us-ascii?Q?G1+CMKhvlOI5/pqsn+PEAeBMJHEP5k90DuNbE/gR9Bu9Yz9oXUbB4j6VctaJ?=
 =?us-ascii?Q?lg2uKYfRI4pog6r6oBs0BrfyPrQRIrGKf45FXiFZ/0mkRLdRdmL8xAa7QsKo?=
 =?us-ascii?Q?5C2nWPdGIFuiYLqs9fpwHSHVgzT5GCoDwts9kCvIc2p1Jhak6aIzZsFzgooD?=
 =?us-ascii?Q?St07BOoy+nOrjt5M9juBTJn3WhgL7rBJ1KCBjcQx3BQur9EEGIEgRAOOc+U6?=
 =?us-ascii?Q?EHbLGHCvM5T95HgqZmCNJX5B7pM15AWpFOjN0fRWcWmDkkOS1EZ6meQmxUiN?=
 =?us-ascii?Q?p2Qu+F3K2NzNoeu8aViWrsrGtXPReAbnyw1FmWBH6rGkqAx8Wt8CucPqE8uu?=
 =?us-ascii?Q?M+oP6ucFprpcTgDuJTu1mfSWzPTPQ2VtfPcZnHaJdPPl2BlFwYyJIqfgEBsL?=
 =?us-ascii?Q?hWa4WZxN331cmHmfT5/ivi2fqyzaeeZpQ0ahzf8L4wmo2dAV+UXpBFB31a2D?=
 =?us-ascii?Q?hua/SB6abv32IJHfQ9xBAJeyuDA4qBftwWCU4OiECNGcOwL3u0ciNumutxSy?=
 =?us-ascii?Q?tr4pKv2SwjXwXjSH/URt+KIof7eRdMSvtLYm5Pzt7lczMrZRjDfVAVcdTh3M?=
 =?us-ascii?Q?vSYoKZ9nNjcc17mL+wEVP1rXncuEa9f09WaM6C5pvM/M7Q4wT5I6737LXSqS?=
 =?us-ascii?Q?j836Ffcd0Vqt88fKE0V1l1R6IhFaVR1XyLBtlaOEn2nRiVIoLYtX58Zl5GY+?=
 =?us-ascii?Q?E0v2XWtnvIUlKOGgrRJlHd13fMm3/SY/yGeY/AjHj3s9/3vupVdK9lRv1VVk?=
 =?us-ascii?Q?Yvde7Ic8SJV5/RwAXGOK6tEEdTKNxP6H0u3Lem2NskuzdAfJe9tYALSqShCO?=
 =?us-ascii?Q?MSEzeYjvUB2z72R6GkotoqlFKo2+wrWMlysKjr4WBc9w8/4PXKEM1XiPhFKW?=
 =?us-ascii?Q?YnhFsIXYQ/Kr4/raRfBSetIuI7nBoSspp2fSHpw62Vaeo3dFpI1vGEIA71wu?=
 =?us-ascii?Q?iomSU/N3mR6bddf6JN4dxBxM2fZhJ0S58AET8qzkrDNNEFp1gjM9tQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d403e1-2559-46ee-b8d4-08da06a09c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 16:26:51.3119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PecWelFDE2Kq2tiC+4i7DcREVdQ8llgM/M/mlG6SDxQzR6AO9r7wPAXsVu1irwpIRt2IrEihv9TFhqnikxrugOeBwlqZwsXs3RyMerRttRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0902MB2192
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Something is wrong when translating rdprs in an interrupt handler when CRS =
is 0x1.
I'm hitting "../tcg/tcg.c:3466: tcg_reg_alloc_mov: Assertion `ts->val_type =
=3D=3D TEMP_VAL_REG' failed."

When stopped on that assertion I can see that :
- ts->val_type  =3D TEMP_VAL_DEAD
- op->opc =3D INDEX_op_mov_i32
- ots->name =3D "pc"
- cpu->ctrl[0] =3D 0x5f9 (that's STATUS so CRS =3D 1)
- pc =3D 0xa2d5c

so, it looks related to an assignment to PC a little after rdprs.

When running with -d in_asm,op_ind,op_opt:
----------------
IN:=20
0x000a2d5c:  ldw	r16,4(et)
0x000a2d60:  rdprs	sp,sp,0
0x000a2d64:  ldw	r4,8(et)
0x000a2d68:  callr	r16

OP before indirect lowering:
 ld_i32 tmp0,env,$0xfffffffffffffff0
 brcond_i32 tmp0,$0x0,lt,$L0              dead: 0

 ---- 000a2d5c
 add_i32 tmp0,et,$0x4                     dead: 2
 qemu_ld_i32 r16,tmp0,leul,0              sync: 0  dead: 1

 ---- 000a2d60
 call rdprs,$0x2,$1,sp,env,$0x1b          sync: 0  dead: 0 2

 ---- 000a2d64
 add_i32 tmp0,et,$0x8                     dead: 1 2
 qemu_ld_i32 r4,tmp0,leul,0               sync: 0  dead: 0 1

 ---- 000a2d68
 and_i32 tmp0,r16,$0x3                    dead: 2
 brcond_i32 tmp0,$0x0,ne,$L1              dead: 0 1
 mov_i32 pc,r16                           sync: 0  dead: 0 1
 mov_i32 ra,$0xa2d6c                      sync: 0  dead: 0 1
 call lookup_tb_ptr,$0x6,$1,tmp7,env      dead: 1
 goto_ptr tmp7                            dead: 0
 set_label $L1
 st_i32 r16,env,$0x2038                   dead: 0
 mov_i32 pc,$0xa2d68                      sync: 0  dead: 0 1
 call raise_exception,$0xa,$0,env,$0x7    dead: 0 1
 set_label $L0
 exit_tb $0x7f1878027e43

OP after optimization and liveness analysis:
 ld_i32 tmp0,env,$0xfffffffffffffff0      pref=3D0xffff
 brcond_i32 tmp0,$0x0,lt,$L0              dead: 0

 ---- 000a2d5c                        =20
 ld_i32 tmp34,crs,$0x60                   pref=3D0xf038
 add_i32 tmp0,tmp34,$0x4                  dead: 2  pref=3D0xff3f
 qemu_ld_i32 tmp26,tmp0,leul,0            dead: 1  pref=3D0xf038
 st_i32 tmp26,crs,$0x40                =20

 ---- 000a2d60                        =20
 call rdprs,$0x2,$1,tmp37,env,$0x1b       dead: 2  pref=3Dnone
 st_i32 tmp37,crs,$0x6c                   dead: 0

 ---- 000a2d64                        =20
 add_i32 tmp0,tmp34,$0x8                  dead: 1 2  pref=3D0xff3f
 qemu_ld_i32 tmp14,tmp0,leul,0            dead: 1  pref=3D0xffff
 st_i32 tmp14,crs,$0x10                   dead: 0

 ---- 000a2d68                        =20
 and_i32 tmp0,tmp26,$0x3                  dead: 1 2  pref=3D0xffff
 brcond_i32 tmp0,$0x0,ne,$L1              dead: 0 1
 mov_i32 pc,tmp26                         sync: 0  dead: 0 1  pref=3D0xffff
 st_i32 $0xa2d6c,crs,$0x7c                dead: 0 1
 call lookup_tb_ptr,$0x6,$1,tmp7,env      dead: 1  pref=3Dnone
 goto_ptr tmp7                            dead: 0
 set_label $L1                         =20
 ld_i32 tmp26,crs,$0x40                   dead: 1  pref=3D0xffff
 st_i32 tmp26,env,$0x2038                 dead: 0
 mov_i32 pc,$0xa2d68                      sync: 0  dead: 0 1  pref=3D0xffff
 call raise_exception,$0xa,$0,env,$0x7    dead: 0 1
 set_label $L0                         =20
 exit_tb $0x7f1878027e43               =20






