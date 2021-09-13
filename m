Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA0409A9E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:26:27 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpis-0004Rs-Mg
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPpf2-0003Yj-3Q; Mon, 13 Sep 2021 13:22:29 -0400
Received: from mail-eopbgr790115.outbound.protection.outlook.com
 ([40.107.79.115]:3120 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mPpex-0008GQ-Eo; Mon, 13 Sep 2021 13:22:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEKqsgjdL38zR8YyuWVgBr74RYbGcRTPn2OAiptmSTwVfD8mUIbClGopA2bctZNIAbQ8PzGqniXcwVozwSzkqgqvvFIwYc2MBmMD9vq6byH3cYDc5N9QHxwnHSwvn9OdWK053Vpm3zi9jE37F36B1HHh69Qv8D3qG4f1Ay8e8saJc6fx7sGt0RK3aegVrW7IjNa/bKajF2u2F7dyg9lmq9bLTb6nSiRx3Lm7CUXcXwBF2Bo26/RyT8sufsl77ysomBgvy9nt8fa5I7vZvtCWteMkoXtXO3tHUaY04f310fGHmbLKxtRTJ18oCTQEs93CAZSnYQrtAEddoGeCZehgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=K7LiyBoeP5ez7y5pDXNJLRd9s+WUSLdQKBa0ef/Ayr4=;
 b=Kyp915nm25sr3yjByBbN5DRsJXMOTnEDQ18w9+eGj0P4yr6shBIx4K1QxGD4OaDRt31GUonp128p6IGyRxMYr1J+35IcVyr0WmaZHalgNfIj0tsfJGNZ8mWkzutTrf45/H5QBL7JJvbKKv3g7RVZEXN0NVW+cznCTaMrm7Zoq2TKhHTf5KDEYnfyGYoAQvYdLaAruWCcU2p8Go96gQTo3ExYa0epkHu/Vu+GfPyKS6O91ZL725fpJfY0yhF9NyJ76exLt2vBNpGYwUjokaxuHYINaREzXPoF7hpSeEUUIPVbijSI2aRrCUNwPDyZYJZzF6ll7yJtCy8NewdzsoJlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7LiyBoeP5ez7y5pDXNJLRd9s+WUSLdQKBa0ef/Ayr4=;
 b=ZmR+8KemdQOUiQ5ouXb21YCJNR1xHcnWh+AcyfVt0qJQH/ykP+H0LVbv84OH1oALhZBC9ZYgdql2O2uW4LAaveVC6nWp2YFlRDq/t8u0QmlU/wZg2hXBXvJ6etgKpL2jdPoQwtzs6crX032mbRmEsznvmKl5p9lOKbmSir5Qjru8hIXmDifAB//92Y3bwrfvJht1KZJrripYkv2DDLWcYKX2gtN5t+bu+atEM+LzT3SQdWhTQRX2e0j4aQlxaD+i+4jqs2XQ69pw1cVjQruqsYoJnj+XLKdOj2hv9qdrZmJKhA9zqEKdukCaPbcHyH7HRDlg83Rppsw+hk/85/LYOA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3874.lamprd80.prod.outlook.com (2603:10d6:102:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 17:22:17 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 17:22:17 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXqL/IrKhTikHh6UKSrVNP5YfTCKuiMi+AgAADiLA=
Date: Mon, 13 Sep 2021 17:22:16 +0000
Message-ID: <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210913162758.3806730-1-clg@kaod.org>
 <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
In-Reply-To: <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14e25062-6326-44ae-61e5-08d976db090c
x-ms-traffictypediagnostic: CP2PR80MB3874:
x-microsoft-antispam-prvs: <CP2PR80MB3874F7B4AE115A3518F59728DAD99@CP2PR80MB3874.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+dox5yiit00+WTsbtCv+S3+wg4gEacJVc8+2VCntIQnpEHxLBfnLajDEjYuN92sMuCsbp6gBLUILriY+ETnrODKq/zFXeFa/VTPU6la54ZU0e5PzTHFFcaCaUvWj47y4A44Ap+OKVgnL863WEzJciN3nJ9ewQ5ti7VLv8EfLoMfzEqgEakmVkj1YGPiEQWzk8Rfu/lrjuojgPTCvIa4sBd5tDfM87ErOVLV7CQ5RrPNr+Lw5CWJihSwJimUFfpc4DFSyJgTutB6jtsGz+TyODxlflD6qAx4RK9OKwCxZ4Bt/KSGf28VLqGsABByLzwBVe3WjgTZosY9WC1gYyhz95kf3QR6W7QqP20G52RT+sk1xDpt6E+hpRTghJZZ5R+uxA6ZKWxrr/9flJDhZ3rsJItMXRSjAGZDa5k4lwI2OjseH9D/NlMwvO7kxsbVh2kR5qtieDhw/5RqcCxxzaHHi7nE3upEgB/H8TbkrT5DZPxc3pNvWNVRojFYovIMSsL/sjiIyuxkKIPxrkI3YTRrErg3l2MXm3kargCHWSj88hN5bxT60NiPwZGME0YJuBLUiQy1URxi2z2FPBzcluPLViPZPxhSSxuMcfQBLQdcLtGKgrc1SeycWmQEzjj2B2xQqyEg8Yfc4DGNDMG5XsNue2jFOiiM/Jdtkwr5VIknA8x7k06m147am2kh+66f6+JnI68N25DO5NdcbY27VSmOhPxv0QjOAmzcY4nfXkuN5x2wYSxR/rzLOziQMJRRbUwpcsKLHoQsvVXjHnJcUcjXvorABkpZcofW3pg2QXsZXeQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(366004)(376002)(346002)(136003)(396003)(478600001)(55236004)(4326008)(7696005)(186003)(26005)(4744005)(52536014)(8936002)(6506007)(71200400001)(66556008)(5660300002)(2906002)(54906003)(9686003)(38100700002)(122000001)(8676002)(64756008)(66946007)(316002)(38070700005)(76116006)(66476007)(110136005)(55016002)(86362001)(33656002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEhIa3U0bHMxZ3pDVFdKVGsxc2VmdG9qS2JmQU5IK0FJUUp6OUtHNUh6dlBw?=
 =?utf-8?B?LzZPanJPbS8rd1orTng4K0U0QnVkOXhVNEticWdCYzc0U0YyTlVRMDhkb1lq?=
 =?utf-8?B?bUcyc0dBVHRtNUIxRzRwcUZMaGd1a2NpRkllUE84bTlMdlpqdXFPRGhwaDBt?=
 =?utf-8?B?RzhDemlTVTZpN0hOTHhlUVBmWUdxdlFSWU5Kc2l6L3J1T3p2VVk5cmVvZ2wx?=
 =?utf-8?B?L1RabDZNL0c0Y2cyZkE4T1FPMFJYQ01tdGpEcU5aait0SkJtckd2dy8zaVRC?=
 =?utf-8?B?VXJYSks5VDdNS3dudmJWWDlZR1cxelNYSzdGSnVVV0dUYUhPR1ZmMTJQNFln?=
 =?utf-8?B?N0VKMmROTG9TUUEzUVFZSUFrcjdHZlpIeFlDZ1pXdlgvZnhDems5ZU5wVEVN?=
 =?utf-8?B?NDUzcjJueW5adDFPQ3U1NTFTaHh2dXNuZ2loV2pyeE5lVXQ3dXNJRGxQcjkx?=
 =?utf-8?B?dGNiME5rd1N3Ymwrai9vK0Y2WWJPMGhqZEpDRHhTbWxKV2xSTnJhT2MzbDFx?=
 =?utf-8?B?QmtwblE3dmVQNWF5UFFvaWNtQ1d5VEd3WHZHTFR1TVVBM1Q3VTdaUmoxcURK?=
 =?utf-8?B?R201YjlYWHNsMTBzSjZNN2UxdmRicWF1aXVLeDRjdTh2ZlJWa1BKN0F0TzZ1?=
 =?utf-8?B?emxhZ1JwSkNDV1ZHdXBpVElhTmxQdDdFRjNGMkNWUkVSL1FDLzIzRXpQSVhH?=
 =?utf-8?B?KzJxeWVDTUxjd04wZ25PbVlqWG1tRk9LMWZVTnNtMEVVM3FxUUZCSm43MFBn?=
 =?utf-8?B?dzNyd3VPQnBqbXkrbFJxMXdkMkE5a0pFNnYrSmQweEpsd1VnKzNoVUxCeVVG?=
 =?utf-8?B?cE40dGlpMWo4K1VMVHlKUG5LSmxYelBBYzRjRXRmWGtjaFFMdFVzOTkxTzJa?=
 =?utf-8?B?TDl1RXBQSEJTTnJ0SytYRXBkM2hQek1UcTdqM0JyN0xWeVNsa2lWWnIvblFW?=
 =?utf-8?B?NENMdlNockJsMlVnY0NHRmcvZDdRMk1LUUowOFBxNmtZUkhiaXdkTlh1WXhw?=
 =?utf-8?B?TjE2azhZL0xvRk5nQld2ZnFZNzduRnUxL29sNFpWRERlcCtXSjlOb3RjaExn?=
 =?utf-8?B?THh3NjIrR2E1S202VWpvVVBvNlArY0JWYmlmcEZveitzZzczeW5OSXFjQ0xr?=
 =?utf-8?B?QXpJYk5sMVJLUmViNnFSQmJSV1VCaXdOY3Faa0E1ODk1WHZjNHR4N1BDb1BX?=
 =?utf-8?B?VENtc1FHbFRPb2V4UFlVU0p2WktTV0tsU1oyaWR4dlVPQUZ0NGFRaTZNZVV1?=
 =?utf-8?B?cFEwdWplaXRvN3ZzRGFZWm41b2tnSTVGaHIyUHNFR0l4Wmpta0RnMGdtalFG?=
 =?utf-8?B?alNkSUdnVHpUellNbExBSmk0SGxkUEFjRHB4Q3I2M1pld3ptMXo2QzVNVFU1?=
 =?utf-8?B?YldnaVd5dUxPYXRoQTEwOCsvVVlYNEFHeG0wVlRWUUpjTGVpQ0ZmMVJVZjhv?=
 =?utf-8?B?N3Z0RmJKRk5ndHhPbERFRXZBd2dxUnFOUy9QRHhsdFhoK1hpVXZCaElCV1kr?=
 =?utf-8?B?a2RRZlNURk1VQkRJYWJmWVlnTExLUThBVXBYQmlySjFUOVVONis3T1Uvb0l3?=
 =?utf-8?B?UHo3UlJ4T3B5WGlPTVM3YjNoaDRWZmtiRXFYd3k0eWdsQlEyYUUydWs5TVhM?=
 =?utf-8?B?NzNmZStoeXVkQmNkTTBQdGd1Ky9FRzZ5VzJvckQxMUptUmViMjJIVHFSQUdO?=
 =?utf-8?B?RUxNMDhrSXgwclFNN2M2b1ZmSUdrMDVxYURtUjBkK3paNUx5VWl2OFdwT21E?=
 =?utf-8?Q?+JY/tO79WDYgOPXleM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e25062-6326-44ae-61e5-08d976db090c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 17:22:16.9098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Woasa+PLu6ihvUF0xcXE9Kew7r8H0ntovoA2kRdGFZdux/HMnTi6jGRsNnlujS3FW4MKJzD3rOtTs6UivlQlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3874
Received-SPF: pass client-ip=40.107.79.115;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+ICAgICAgYm9vbCBuZWdhdGl2ZTsNCj4gPg0KPiA+ICAgICAgLyogVHJ1bmNhdGUgdmFsdWUg
dG8gZGVjcl93aWR0aCBhbmQgc2lnbiBleHRlbmQgZm9yIHNpbXBsaWNpdHkgKi8NCj4gPiAtICAg
IHZhbHVlICY9ICgoMVVMTCA8PCBucl9iaXRzKSAtIDEpOw0KPiA+ICsgICAgdmFsdWUgJj0gTUFL
RV82NEJJVF9NQVNLKDAsIG5yX2JpdHMpOw0KPiANCj4gV2hhdCBhYm91dDoNCj4gDQo+ICAgICAg
ICB2YWx1ZSA9IGV4dHJhY3Q2NCh2YWx1ZSwgMCwgbnJfYml0cyk7DQo+ICAgICAgICBpZiAodmFs
dWUgIT0gc2V4dHJhY3Q2NCh2YWx1ZSwgMCwgbnJfYml0cykpIHsgLi4uDQoNCk9yOg0KICAgIHZh
bHVlID0gZXh0cmFjdDY0KHZhbHVlLCAwLCBucl9iaXRzKTsNCiAgICB2YWx1ZSA9ICgodGFyZ2V0
X2xvbmcpdmFsdWUgPDwgKDY0IC0gbnJfYml0cykpID4+ICg2NCAtIG5yX2JpdHMpOw0KDQpBbHNv
IGF2b2lkaW5nIHRoZSBwcm9ibGVtIHdpdGggYW4gaW52YWxpZCA2NC1iaXQgc2hpZnQgd2l0aDoN
Cj4gPiAgICAgICAgICB2YWx1ZSB8PSAoMHhGRkZGRkZGRlVMTCA8PCBucl9iaXRzKTsNCg0KLS0N
Ckx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2Fs
IC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRt
bD4NCg==

