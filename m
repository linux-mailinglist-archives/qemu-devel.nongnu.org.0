Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3E67E328
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 12:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLMqV-00040E-JG; Fri, 27 Jan 2023 06:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pLMqO-0003zM-De
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 06:24:35 -0500
Received: from mail-db3eur04on2052.outbound.protection.outlook.com
 ([40.107.6.52] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pLMqM-0006Ou-Ie
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 06:24:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g54woLN0BgqFfheL+QdkmmjqvWLH5xFz8Df0ex7PriWgXHkxn6RJkE82ghdpGzk1KheKaFZHAYb956bvfgT5NxOUoRNmqJhkr9uYpOzpQCavm1QcKGHRPPGiF2iYGdZ+lH6h4E+riTrIwgUMz3uJVMso/vC6lgsuBuVbtol7THAgiS8Pd8jiTu+DPUR4LMBN7E8hrx50wpaQnTK9bJlgslQUl8fvxqQzlwPiDZaqS1iYHOGEibq2vhrFpYd2HvQ9Y9we+rqX6zeshTUBIgkA6OTN2Ma9g79aLCn0yFVYpIdTseeiwwcS9lloJcbJiJZ9GU4i8Q/ls9ibiedXkudOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqoUyKe0zfUsXHp036GAK2p2Ohnc3jAfLTmr/zXDGiE=;
 b=lBO2mAy917zkFR+uPmN/fpOAoOVUV3XY3XPzJOv2az9TGVI/1EVOdhKJLwNJ0Na5WjUsrhKJXSFvhRAf1eInm9hQDX5dXEsArLZbVW8xWnaPa/bWCAKRQejWkmYEbG2sFKAdK9f905o77SKaOGvyILS9Jzbou6GhHk9JVjGOMu0cLvFBY7DsYJE8TMMTCedF7qyy+kell5dBBPXBw0Ue5lDc4itVKMeuuXsNb5DQP/UzRMGlgRELCFdqgKFlJHUvouyWw6JAkDAzfK301arqCF+X6NHjXryV85ggdW/eWPG9w4LJm5mTEX3I6EtR0EwOWReP3Sp1woZ0GUEgOYs7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=incari.com; dmarc=pass action=none header.from=incari.com;
 dkim=pass header.d=incari.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=incari.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqoUyKe0zfUsXHp036GAK2p2Ohnc3jAfLTmr/zXDGiE=;
 b=el6OT3fHR2ooA4BRl04iSsuId5sNH+et1Q/0FfUmQb6kTqIOjFNNBepOOmc3DpOHJgUguF6Qo6is2R7jM0soDjh01eLUck3FasCV9wXxsDOCSu5JwVQHM2AoWHC1PdKDGkLrPMl0DIs4p2d78Lx95UUQSYgXtaMgM/MKv1TQVwD64VKGEhiaS1m4qst3vF+nRpdZm31sqrDm2ssG3gn7xdBU4C4p6NCXxJHtiaA61XEwM8311ugHxspe/+tWMx6fT20TsxrrD6TWZ1LNh2rPqf7n3/xKP5OJn580c8B2y7OSTSiXJ2GwPpCMCOhnqLm7j4AogQdC7yUMaEu5to0ffg==
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2e::6) by
 BEZP281MB2518.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.20; Fri, 27 Jan 2023 11:19:23 +0000
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e6fc:40e0:3a71:4593]) by BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e6fc:40e0:3a71:4593%4]) with mapi id 15.20.6043.020; Fri, 27 Jan 2023
 11:19:23 +0000
From: Bernhard Kauer <Bernhard.Kauer@incari.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH] target/i386: Change CR4 before CR0 in SVM
Thread-Topic: [PATCH] target/i386: Change CR4 before CR0 in SVM
Thread-Index: AQHZMkD2D9Rz2QC4ckCs0u+01m0DLA==
Date: Fri, 27 Jan 2023 11:19:23 +0000
Message-ID: <BEZP281MB2965ED01827BBE2F7B231C9FE9CC9@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=incari.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2965:EE_|BEZP281MB2518:EE_
x-ms-office365-filtering-correlation-id: f85faed6-f1b6-42ea-9d33-08db005857de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yba4NfimAodqYZl9c7mpRrIVueaVni0vYECHrlIvNxJhbJiMokl58qO3lyJlTviB9H1ZRCKypUkiRKjJOWMTvIVmQDpCE9Lp7BKZMr84h8kKx1so4T64nSfGgY9xgF5bjziE2OBCPYM6scpCqBqV3yK+Tbl/Fy4D5Qig2i1aFswIA7EMbYWywhfYkgkU6HvApYs6rUgiQtm8feGDBWsfd8+gY16+k+b/WTvYlV+2hPdSTBFksrJkgNhwx6ugQK3Um1aZUePOOiFe9tap2mp8wcrrWzB1WG9O+EbrPfPfGtCxZiT91YZ72dz9o23MSDI40NY9X7c+EDYfP6zEuS47hIjwROMKqjAL5yNIy4TTkOf5j2613wg9yODGjkSt06YxJZVbswEVtIn0OfY015nVUE8CGPPQXP/texyVpp9w3BfYgJwchHZzULJHYxQ7e7Vq12HDK2VqsnV+5ovpvYIz+Lrg18MF4snylGgCfsha+BSQHLGT367an5X2N1COk/OHdvcG3Q5gGP5vHglv+txOVMM3VXNODJmmnmSvQqp1EKsvqXTVGkO2RVr9gXgcBdMkPSFjqa7tkJMlkwxgXsPXlBsjYZuwNE8DpL2169FlNgZehagV+yR82LfBH9O9ifGmfFa2riyuWYcLfDr2cqEFc+zRujxfIfu7563c0F750HTlUhkExf0LFM4rnTAo6u97DvTK+v+rwKp4/XPMsQPv3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39840400004)(346002)(396003)(136003)(376002)(451199018)(86362001)(558084003)(64756008)(66476007)(316002)(54906003)(52536014)(8936002)(66556008)(4326008)(8676002)(6916009)(66946007)(76116006)(41300700001)(478600001)(7696005)(186003)(6506007)(71200400001)(4270600006)(66446008)(38070700005)(55016003)(33656002)(5660300002)(19618925003)(122000001)(9686003)(38100700002)(99936003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gbzbJASYo/8pFo8cOpptYqrXfOQLyyx1ls5n0POwyBGt8Q3InpRovfX6XG?=
 =?iso-8859-1?Q?cXx2BjAoPxBUYYTd0cFO2T9p+SfR7RM21k5tua5+XfFX4Grjs3qVl64S/M?=
 =?iso-8859-1?Q?2+hyRTDTDCRzZNH/wfO0h/4eU+U84htbGbSJStqaWRnNiagDCYVSIP2lto?=
 =?iso-8859-1?Q?ZwueG8RIkAh2S36hc3zeOYO2LwPvBzoO2t/DpbOVKnW4hdBLZqgnJH8oKe?=
 =?iso-8859-1?Q?BggBe1L4rFw2k6/zVx9EaPI78gaXs3yvUFWb1f13r0GdiJYRODfITj6SuL?=
 =?iso-8859-1?Q?wixY/WRB4GvVfx7IxyIzD1gtelembLQ2WWPWFJsf5sFk0jZmyk23RkU5TL?=
 =?iso-8859-1?Q?5x8KCncS4X4f9AjEK25f8Xti1qedcT7UWb3lLvFYVItRAIgf/GFcU35ZIw?=
 =?iso-8859-1?Q?XoYfWjV1RQ7/k9BxHxHpZbed013/dxV81hZa+qWGbzWg9xT8bIK4cSaAdA?=
 =?iso-8859-1?Q?iDuKuunAHe4a/8wZMDlWu4ovg4tTBYF+UIf0sr4Fs6Fm1Bu0iY42TcD/Y+?=
 =?iso-8859-1?Q?uRwFPwAO7x4jr05XoDeMgxOhvYaZ5cq1v5/lopLqWEVPXYRxmRIdsVdKLY?=
 =?iso-8859-1?Q?7ZUtzBQc+YattKzQ0fdWlQUcs5qgA3HEkhdjnlDFQAGd47Z1tMao1eUGzZ?=
 =?iso-8859-1?Q?r7LphdPC/VykUo32DOBo+27oR/h/N+0WIVPmb7TdSht//iJDxoBLEYlaQQ?=
 =?iso-8859-1?Q?qilL5Omlb/pRhjBWadY//3bmKpfULfpu6hII8JBF8J0w0HdcKBV1JuagmW?=
 =?iso-8859-1?Q?QLC1Pg6vPJ8g7dmPIlxTEa5zf/xQu77snI8tFz2RxEr5l1or8/e+Q+qHBB?=
 =?iso-8859-1?Q?ALhn5cVgVmAnFSbEk2V7gzNAKJhHe4TwnN1qwc0tZnqW2g8PUnloAYwaRi?=
 =?iso-8859-1?Q?b9hU8BJ7LCGgosSBFtRkqvxMGHvla6sxaqF2bqKTO1UQBCAg8mniuWQTVx?=
 =?iso-8859-1?Q?CPlk75P0iPYvg3/xktqHkGfHjBcBZ6c5K19qFyGG3v16hvSCsQTfVBg4xK?=
 =?iso-8859-1?Q?BHghN93jpkKjGNs7lOEulRGZyY6HA26CgxHEe3tIRJ8UHw5zEgNUvZsOYB?=
 =?iso-8859-1?Q?2mNYdlSJpPey9TlZLCUUyr4r1mps70UH2pX41BMpuJziuIlOoFLBTSG6eE?=
 =?iso-8859-1?Q?S7m85CUBRSzi1+VSHbUnzUPPXc24GPf5y+UrSl085xlgBwLeixLw6dWNKm?=
 =?iso-8859-1?Q?YOVXryQ+TI6B/nASaZaEM3Kz3ixu9t1ishu2DHBfYfrpTUnDIRxHJnRpGe?=
 =?iso-8859-1?Q?r7OMp93UgH6hBAh9bYzp8JJDaHdlycSgP3Ju5DEYLheyVzEDoy5X8G4Zo1?=
 =?iso-8859-1?Q?ip/xvKDEaQdhjMu9BQ1sFKwmX1mbPjIWqDuibI/u5U0rtEnSfefk4w0fcc?=
 =?iso-8859-1?Q?GUf2CF5ZLPM3NYemjF7Fl4Yjl7WhB9hE2dTRdc3HVcze16G5YkJjtw5qEk?=
 =?iso-8859-1?Q?krKxDgVp4ZnHWOSN+lVmt5AMA8ULMa9ziCDYAgX0PBjKo5yIVIlsQZDJSi?=
 =?iso-8859-1?Q?F6rZR+rD+DsQpMsT7uBvm7PpNfdwxZOok8F/8ZC5Xh3V0p8ngjRPwXS1MM?=
 =?iso-8859-1?Q?8fUvnZMygBkZoouG8gFQk8lM60E9HpV/je7ODsmRdVdE9jYH1vtqW8Tmxh?=
 =?iso-8859-1?Q?Jt6r17CJntEcOhWTTzlNORVJ9NFlJcV7YShi3BO4jEomfDSoGLXbKQuVD6?=
 =?iso-8859-1?Q?+/e2CvmQU5vHpEryQmA=3D?=
Content-Type: multipart/mixed;
 boundary="_002_BEZP281MB2965ED01827BBE2F7B231C9FE9CC9BEZP281MB2965DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: incari.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f85faed6-f1b6-42ea-9d33-08db005857de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 11:19:23.3760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a46cb45d-70c3-46b7-b011-a63d6a9c3c2c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QA57xy67ces+kereLBAodgn31MudbnYmJq+JU5dh7ek7Pv04K+M3MnHq17c1CE4gWSJvPsKUh2DH+aPrQ6YMNpK/VME+gHxiwJp04vJh7Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2518
Received-SPF: pass client-ip=40.107.6.52;
 envelope-from=Bernhard.Kauer@incari.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_002_BEZP281MB2965ED01827BBE2F7B231C9FE9CC9BEZP281MB2965DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Resend as attachment as the previous version gots corrupted.=

--_002_BEZP281MB2965ED01827BBE2F7B231C9FE9CC9BEZP281MB2965DEUP_
Content-Type: text/x-patch;
	name="0002-target-i386-Change-CR4-before-CR0-in-SVM.patch"
Content-Description: 0002-target-i386-Change-CR4-before-CR0-in-SVM.patch
Content-Disposition: attachment;
	filename="0002-target-i386-Change-CR4-before-CR0-in-SVM.patch"; size=2352;
	creation-date="Fri, 27 Jan 2023 11:18:22 GMT";
	modification-date="Fri, 27 Jan 2023 11:18:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhYmVhNDFiNDU3YWZmNGMwNGMzYWEzOTdiODg4NDdiNjZhYWZmMWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuaGFyZCBLYXVlciA8YmVybmhhcmQua2F1ZXJAaW5jYXJp
LmNvbT4KRGF0ZTogRnJpLCAyMCBKYW4gMjAyMyAyMTozMzowNCArMDAwMApTdWJqZWN0OiBbUEFU
Q0ggMi8yXSB0YXJnZXQvaTM4NjogQ2hhbmdlIENSNCBiZWZvcmUgQ1IwIGluIFNWTQoKVGhlcmUg
aXMgYSBkZXBlbmRlbmN5IGluIGNwdV94ODZfdXBkYXRlX2NyMCgpIHRvIHRoZSBjdXJyZW50IHZh
bHVlIG9mIENSNAp0byBlbmFibGUgb3IgZGlzYWJsZSBsb25nLW1vZGUuICBUaGlzIHZhbHVlIGlz
IG91dGRhdGVkIHdoZW4gc3dpdGNoaW5nIGludG8Kb3Igb3V0IG9mIFNWTS4gVGhpcyBsZWFkcyB0
byBpbnZhbGlkIENQVSBzdGF0ZSB3aGVuIHJldHVybmluZyBmcm9tIGFuIHVucGFnZWQKVk0gd2hl
biBFRkVSLkxNRSBpcyBzZXQuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBLYXVlciA8YmVybmhh
cmQua2F1ZXJAaW5jYXJpLmNvbT4KLS0tCiB0YXJnZXQvaTM4Ni90Y2cvc3lzZW11L3N2bV9oZWxw
ZXIuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2kzODYvdGNnL3N5c2VtdS9zdm1faGVscGVy
LmMgYi90YXJnZXQvaTM4Ni90Y2cvc3lzZW11L3N2bV9oZWxwZXIuYwppbmRleCAyZDI3NzMxYjYw
Li4yMjlhMjI4MTZlIDEwMDY0NAotLS0gYS90YXJnZXQvaTM4Ni90Y2cvc3lzZW11L3N2bV9oZWxw
ZXIuYworKysgYi90YXJnZXQvaTM4Ni90Y2cvc3lzZW11L3N2bV9oZWxwZXIuYwpAQCAtMzEyLDgg
KzMxMiw4IEBAIHZvaWQgaGVscGVyX3ZtcnVuKENQVVg4NlN0YXRlICplbnYsIGludCBhZmxhZywg
aW50IG5leHRfZWlwX2FkZGVuZCkKICAgICB4ODZfc3RxX3BoeXMoY3MsCiAgICAgICAgICAgICAg
ZW52LT52bV92bWNiICsgb2Zmc2V0b2Yoc3RydWN0IHZtY2IsIGNvbnRyb2wuZXhpdF9pbmZvXzIp
LCAwKTsKIAotICAgIGNwdV94ODZfdXBkYXRlX2NyMChlbnYsIG5ld19jcjApOwogICAgIGNwdV94
ODZfdXBkYXRlX2NyNChlbnYsIG5ld19jcjQpOworICAgIGNwdV94ODZfdXBkYXRlX2NyMChlbnYs
IG5ld19jcjApOwogICAgIGNwdV94ODZfdXBkYXRlX2NyMyhlbnYsIG5ld19jcjMpOwogICAgIGVu
di0+Y3JbMl0gPSB4ODZfbGRxX3BoeXMoY3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGVu
di0+dm1fdm1jYiArIG9mZnNldG9mKHN0cnVjdCB2bWNiLCBzYXZlLmNyMikpOwpAQCAtODEyLDEz
ICs4MTIsMTMgQEAgdm9pZCBkb192bWV4aXQoQ1BVWDg2U3RhdGUgKmVudikKICAgICBlbnYtPmlk
dC5saW1pdCA9IHg4Nl9sZGxfcGh5cyhjcywgZW52LT52bV9oc2F2ZSArIG9mZnNldG9mKHN0cnVj
dCB2bWNiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNhdmUuaWR0ci5saW1pdCkpOwogCisgICAgY3B1X3g4Nl91cGRhdGVfY3I0KGVudiwg
eDg2X2xkcV9waHlzKGNzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVu
di0+dm1faHNhdmUgKyBvZmZzZXRvZihzdHJ1Y3Qgdm1jYiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2F2ZS5jcjQpKSk7CiAg
ICAgY3B1X3g4Nl91cGRhdGVfY3IwKGVudiwgeDg2X2xkcV9waHlzKGNzLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudi0+dm1faHNhdmUgKyBvZmZzZXRvZihzdHJ1Y3Qg
dm1jYiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2F2ZS5jcjApKSB8CiAgICAgICAgICAgICAgICAgICAgICAgIENSMF9QRV9N
QVNLKTsKLSAgICBjcHVfeDg2X3VwZGF0ZV9jcjQoZW52LCB4ODZfbGRxX3BoeXMoY3MsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW52LT52bV9oc2F2ZSArIG9mZnNldG9m
KHN0cnVjdCB2bWNiLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzYXZlLmNyNCkpKTsKICAgICBjcHVfeDg2X3VwZGF0ZV9jcjMo
ZW52LCB4ODZfbGRxX3BoeXMoY3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW52LT52bV9oc2F2ZSArIG9mZnNldG9mKHN0cnVjdCB2bWNiLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYXZlLmNyMykp
KTsKLS0gCjIuMzkuMAoK

--_002_BEZP281MB2965ED01827BBE2F7B231C9FE9CC9BEZP281MB2965DEUP_--

