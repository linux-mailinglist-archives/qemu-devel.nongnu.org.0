Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810A409AB3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:33:22 +0200 (CEST)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPppZ-0001Wd-EY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPpll-00088u-C9; Mon, 13 Sep 2021 13:29:25 -0400
Received: from mail-eopbgr820107.outbound.protection.outlook.com
 ([40.107.82.107]:33312 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPplj-0004fQ-2z; Mon, 13 Sep 2021 13:29:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEBiHM2AGdQdKy1BTxCObkoaxLOdmIpnzZtN5gBqjAMtxzYu0Xx8Bi9nC+fWzwpYY0jy8BMUfmuJ+oaE2GISGm0ocuyT81VFgyG10lQAjKwqJcOwcThvaGC8G5WZgSXtar8htk+0WdlO8lNYcc+40FAPGAyVN05oE+PSNabKGBjxngASwb4xFlc1Vy4eu7X1qlKTSNUdGT9/ag+39LJOSakKUvBVKhTc74yaR+W/otbur1mTySE8gxNvCMPYBKYZUpEBaafFGxAQMh1nLLWkxJ9Nv8UWwcQe4YJXGKFb1nEcJIEdnt3eePqb0s4Bx2HKtbjVSko1GyU4EDxKtaQhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+qq4JUcJd+oopokLb1Ujc1usjT3Viqr2yIid2u5vquk=;
 b=WfrMrO/vwT2sRUEXmZfS/pttyPWwhZIvbt0sVvQl5yCFq09lmyw4TqZRD8pt8aIEStpZEeviH0/uZiCHN8ObNAV2FrSj6Sitq/DdmV/A2Q7Nm73ERz7Q7BJm4HRkXkogdKueRMqB9ohIL5KlN5a4e+IEc1FZ5eENoOoJMWTqXgFCGP4UWQEcOMAEpwv/fubwq6seW4WFfWWOrob18MfdIyTq0mUVGP2sStunMjbF2wUmLyLsFUXwCI+DiYTqjWW5/+z7dun7MH+w9kUCwAX+ME7FT4ijj+C/rSDfFvwAwkVMmcczk+M+/qpuemgDJdC4d0BoLE6CSdbMUPogJ/I4Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qq4JUcJd+oopokLb1Ujc1usjT3Viqr2yIid2u5vquk=;
 b=BG65uRUB0+iWMHAcabngzzk1zhWPjrzzgBpHyJZe9ASfIxMOf/Y6lQQuJ0DpDu1M1l4h2rRVxCcrOfrOBh8c7QflBkcUIm4qw/MqDCU5OYOl7fw397+jCurHwlB5MohbVDH6m2u1ySKR2VfCCnbAKQ9zDrzLgleJIxocMs2EGmirNuoCxUgvjErFG0g3uctijm26QNvnC0ahF8OoxsZbKp+JAWFTGZMiziRQkn50aaQbyV//wxysxTxDEuNtKvvl1G4zu4/M+T/eDoXxa5HBng8ss5bLZoRNFIhGtNPbwVyinobdVRiXAY73rqnOREpOtRZzd0h4d8W78oX33ct+SA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5652.lamprd80.prod.outlook.com (2603:10d6:102:9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 17:29:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 17:29:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXqL/IrKhTikHh6UKSrVNP5YfTCKuiMi+AgAADiLCAAAGXkA==
Date: Mon, 13 Sep 2021 17:29:17 +0000
Message-ID: <CP2PR80MB3668565CE360D6FB1E098461DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210913162758.3806730-1-clg@kaod.org>
 <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
 <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
In-Reply-To: <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c1ee664-1950-464f-a8c7-08d976dc038f
x-ms-traffictypediagnostic: CP2PR80MB5652:
x-microsoft-antispam-prvs: <CP2PR80MB5652295757BBC3BE671F3B5CDAD99@CP2PR80MB5652.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUyKCRc+53EEVdPIvoJ/B5DODViUWXPX93ionDwmfaJv+d8A886F9H56/2j1RJwtZr2MG7b01bCBetIS4kIOgCOwjqhb8RvPds8jd2/SuFFVg7Tk7VO7d5jL3y/TxAfL6uWyA3Dlc04E/DO8L1COtsGAPWBdDlUh1LZMAs5XW1AUdQOQb5j9c+E3TWUvKsZ09clora0Vpr+vYSMSNtyBBz+VCkYHZ4w/bCUuPEtCgvn3FJBErNorC9z3hKICJLKn10JVXsZKF/YRcuJ2PIKlm56X/9KSOoj6yyPhhjPGm3PZ3sIItVFy645SOFD+cB72BZz6ylwjxQrIa2u8N2fYrw/YaTdfGZSyI48/JcJ2Nkw1ARaE0qOu5AuyGI/QueA3YnhdgJrq2V3iallbsWS6bedDAd0hTGjqEYIIyxed2CS2vccH9r03Bk1AIlJCn2Oc4I68u5/rXWzIV90sf7LTpE27yVWfa8VKxRmP9et8UK3bwEhZbo9/AbBEiQIm1j7lakhiIQREqTBU9rVlsjOxAjMZMzuUeXlh+L6hQkxpbPGGQnp4KH0GLroDgUeT1r8Gu89SK/EnOvo20TM0OghO7tdWEhzdu1JJVosTrJj1lPmjqX45Q6ZgGVKcrRtDza8jiChwWJEu7sYxxAkiQfbf582mRjwoPW8KzEH/u9O/6Ct9D80ecD7LukfbK3RGNQSyhduYbIa+Cd91ePgvEuRddU9U63AlOimYna0JSwxitfKvv1M0qT1jghRdox2uo7t4oc3WRwT7AHGPRqK3tLyVl8x/yhEfZb7kev4+3b46/VI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(346002)(376002)(136003)(396003)(55016002)(9686003)(2940100002)(110136005)(316002)(66946007)(4326008)(2906002)(558084003)(5660300002)(54906003)(71200400001)(6506007)(52536014)(7696005)(26005)(55236004)(186003)(478600001)(38100700002)(8936002)(76116006)(122000001)(64756008)(66476007)(8676002)(66446008)(66556008)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEFST3JBN2NRZnlRL1FrdlhseVQ1blRDTHNTZ1lJS1NWTGhhSzJhWEFvNDB0?=
 =?utf-8?B?WTZqN0xGUU5GT2ZIR0t5MWMrMUF6ejVqSXpTVmxYWC9yLzl6L0pUS24yejRD?=
 =?utf-8?B?dmJjMENXOTFYZEZvbHZXRjZJWFp2ZkkyZm9jem1zV1F4UVBTbEVLK0dtN2dZ?=
 =?utf-8?B?bTdnK2F3b0ladjMwSUN6QTFRc3phdzhCdUdweWlDR2RGVXE5NzBaUk5SVGpY?=
 =?utf-8?B?d3UyK3BoUTYrdGJyMmVseEZpaHZnaDRXUkY3SVlMa21wcUdYZzBIdDNtVmRE?=
 =?utf-8?B?Q0FmUS84QTBwOE52Qk1CNVdiM2lLYVZIbFQ4dS85UURMem5xMXNwU2xyN3E1?=
 =?utf-8?B?ZUxIQkdabS9wZWM5aHRzeVJUSlVRWHdGSFlTR2l4S3Y2MmZnTWRaV3VkYmg0?=
 =?utf-8?B?bFNTM3NHck5EMzdHL1pZSW5haW1MY21ITnBiN0pUZy9TUTZsT2NRTmF0UTls?=
 =?utf-8?B?ZDVuMllvSC9ISitUM2ZjM2FjR3hBU0IrcUVOdmZ0SDRZTHlJTVZqbFhTcDhK?=
 =?utf-8?B?Z2dydE9RSE05dWhvckJJb3JoT2ZMTDMwVEZCeC9Sc2pUZnhDdnhvZ3FGYkNO?=
 =?utf-8?B?enFmbEg1Y0dyRFJHR0RwNm1vQUV0REIwUDZ4OFVzMGVqM1Rib005M2ZzYklm?=
 =?utf-8?B?NmJTQmlvc2pmT1FqSUZ1MHd4WWZuRHR2VzMxM0hqZjFLN1RPS0xzKzNpMEQr?=
 =?utf-8?B?cEFhdFFZQm9rTzcraVpzRTY5dXkyKzlCYU5KVFFlSXBkSlVLcFAyOGEzMFNt?=
 =?utf-8?B?TFJUYkhwaEdXL1VFbmRIdHhERFZHU0ZCRTlxVzdEQWplRWtGcHVJc1o0Y0VT?=
 =?utf-8?B?UnczemhYOW1Rald5dG1yNFNJcjYrTkJwYk16Kzh2TWcrQmp0OUw2aFZyODZm?=
 =?utf-8?B?N0ZLd3VnRFRJWElWS1RUS2ZXUmVqWHdaZitZYnZ0YUMwN2t0ejJNaTcveldP?=
 =?utf-8?B?R2p3SVRmUGk2c1FjUkhHL05oUWxwaUdzT01wK1RyK0pJaU1YMFErbFhNZDJy?=
 =?utf-8?B?SkJUZDhFZHZFOU11SzltK2RUT3Z2SG1mdXArRm1VdUp5SlNZUENwbVZINzQ2?=
 =?utf-8?B?ZS9hRkxuRklWcXRlMG1PR2YvZ3FPTTh3bUN2Mk9QQVhrRzZUTTBHajNGNkhX?=
 =?utf-8?B?OHEwU3NYTnd0VWZIZ21hcnhES3hJRTlJeDU5Yi9MNHhqYm9hbjVPc2N5UlVm?=
 =?utf-8?B?TElROWwvRGsxRUtzK3hvM25XNVBvUzFrYTF1QmZHQ2pxdkdRMzRIWUxsT1BQ?=
 =?utf-8?B?dm5iSlVpUG9EN0dtWndGRTBsdU02ODdYRFBER0FJZkxVN2RNR1VBUllVR0dQ?=
 =?utf-8?B?cVRjeGJYUTJGS2RvNzRwVzI1STZxMEhhYmt3cTRKVGVmTlFRTDRPSllQT2xT?=
 =?utf-8?B?MHJmaUZzbnNJcjYybEh2Z2R1YXJmRjJjN3dMb051OE56Sk5VTjJHR3l4aEta?=
 =?utf-8?B?d2xtVVlFRURNYkozRlJSRmVoQTUvVkNheCtMUVI1STYyNUR2ZmovVXQwdmwx?=
 =?utf-8?B?VHNPSGlJeHM1M1FITEJkY1plakx3RW54NUduY1JneFpudFluZEtxeTE5VXdo?=
 =?utf-8?B?OXowMmhiUUYzNEJJcXFabzk2ZElpUENlaThtVFRFRXZuSjhIKzlHL3ZEbUNC?=
 =?utf-8?B?VTB4dVltcU9iWHJndU5YcE5HL1hnOVVaMXE0ZnJuMHQ3R1pYdFdRMFJWTVBU?=
 =?utf-8?B?bjhpSzlCRTg0UHg5TzFPUm5WQ0F6WjZiTXBzTWJhK0NJaW9ZVDFTVmgwK2Yr?=
 =?utf-8?Q?u9bJuiNDhNj8/LYzVY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1ee664-1950-464f-a8c7-08d976dc038f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 17:29:17.2266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OB1m73SRnmjdQewjUFEAlpuVtwMA0j7xNIr2g+mV2DpJ9Zr99ukPTHG1WXzvktx2DatzYdR9Lgqnrioy2XBhHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5652
Received-SPF: pass client-ip=40.107.82.107;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAgICAgdmFsdWUgPSBleHRyYWN0NjQodmFsdWUsIDAsIG5yX2JpdHMpOw0KPiAgICAgdmFsdWUg
PSAoKHRhcmdldF9sb25nKXZhbHVlIDw8ICg2NCAtIG5yX2JpdHMpKSA+PiAoNjQgLSBucl9iaXRz
KTsNCg0KT29wcywgc29ycnkuIDY0IG1pZ2h0IG5vdCBiZSBjb3JyZWN0IGhlcmUuIEl0IHdvdWxk
IGRlcGVuZCBvbiB0aGUgdGFyZ2V0IGJlaW5nIGVpdGhlciAzMiBvciA2NC4NCg0KLS0NCkx1aXMg
UGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

