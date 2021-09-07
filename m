Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA4402E3F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:16:08 +0200 (CEST)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfdf-0001rj-Bt
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfX1-0000M7-0L
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:15 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:11698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWz-0003U0-Bm
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038153; x=1631642953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HxquAw2t5+HX41GOubJLju45896PW+6zojNKTcq9aOI=;
 b=RlfO6J2sMnyzT8KollNnAUH9Kib4rtsZjuBej/WD/q3MfrEHTaNMsc0u
 ebGrIPHCkbE03mjyYveeGA5bx6Qu0gZHPcHSm4WGQNIVHMlxCFi6yJwq9
 0UE508DV4H1gP8LWlvbir7WEpD0tuIiFYJxGWj5nHatj15pDTL4Mtm0eR s=;
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8MJB4fZ9/9b5ENPfPFaBQi5k3m5wdNu304rtSMzkLScKHC548cWkkaHZbW6KY9Vd/BHjMDsLHKyrcDvO0PkAQ3I9M7brVelH0drjDuCVmfVda6CarNdZE+iOANR9Ggj7HbTgv+iUqgtlMCc1EDegE2croxel+3bLy6UwXvtDUznbzdFnXqvQtiiZOOZnkVweoQ+M5Aq2jKsR82seemMS1f0lJl+4EIPu3iFAjYu4nqsec+9fvb048R7ustqxolLgCEEkb1zqqcONce/NcXQDPPpzwEoaCjB6tc+tBhPbPzIQ7ZNYfSwwLoKlHCLx0hJd2jmd0TNdST6OoMs/MJI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HxquAw2t5+HX41GOubJLju45896PW+6zojNKTcq9aOI=;
 b=DlgDSIXRkNh9NEOA8PBtEhj4K1vkU5sEOIF1/aWJY32ySELLJ2vfh5OK1CAfPJzq5gWdwG6M+ao2m8uSoTwkNNEqf/m/EuqESP/Nfw6tp2z/ZFpVSZMPPJDIHeOw1U1kQQIOETkU+D6tatRQw1vK2INPZCIxS1S9jbhgIVEJnkEa2Fk/5MLGB9FjIhO1Qr983NO3yRcsC+69J+fXrXZsu/GVFnA41G32UI3gUJclOiaQezHhAFgr2ynJvIYTsM4Oi3uhahuURFlJNp14PAbH+oJFUOX7MF5eR7r2BZ7qQikza/LcFrxIQUnxrxCWTQdCskm4GeloNPUCCvMUifKbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 18:09:09 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:09:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 05/12] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v6 05/12] target/hexagon: introduce new helper functions
Thread-Index: AQHXfWMdPTRj2AtH3UCS9XzCgRBmC6uXtV1g
Date: Tue, 7 Sep 2021 18:09:09 +0000
Message-ID: <BYAPR02MB4886B5CD2C41A9DAE15E86E8DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-6-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-6-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8227eace-2193-416a-0376-08d9722a96fb
x-ms-traffictypediagnostic: BY5PR02MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6324E9021FCAD0058078E029DED39@BY5PR02MB6324.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scHm3D4aUAWtkD9hJQ/rVGfsV3P6dkXjixJ0JuSxc7udZWdy/hOHr8AhMgg3kKeXHMZoGv18jUG5tFlAa38OXUJBPpy7HKEJcfIEIwyilMP/McTyrX5v45e1kLHk30oznYvuX/gfJ7mYYJVSVeD9bv68CtL6f5PXXNZUq1pITOT5dNrLIoqtRSFTBgq13Ts1CaafoRD7KPi0bq7e53XLaAVy3/2D/3gR+7hdNBwVVfNdPOg0t5q3/1FpZTJIAUb3Ct/SKl8zUErKMt77lwwItkq4iFXcY9NTVUYz1aaEfjfe5wgDpqmWY1VbPUDURQSeSZc45/f2uXtTH/SdOJUuIFtLVMwnp+5BNONPn6s7sJ9EgxOpxSgwx8N+5vOmbNtG2MISQbZ/6t0dG9D80z8UVPwbjTwt04sXr8NOS0ifWaLQIuJENeY5AkU7DQKGrxNi9NtUaWjCZiJ+/f4L9ntgoFAt+3B70VN29CwWu/xPazCDzqhqibrzVV1KVVxZwmQ+CSu9ZmhsGafttr+lOdlBayOmBeVFmLst1cHSGdbvOl3Iep1A5QNJeWpOImJbJ/86WAxc3ifIX0TC0fYWZuhfj7dOi7l77swnkT0G9SybIweDly37V8VD7uFnejKHZ0WDbm+Xnf2qJaxNnycWzWfUOJ7PifYkPgutJrxEtVy76a4mzSsjgYOdApUNahEx3Epa8JirYAUc7prn0dZvV8gBkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(8936002)(4326008)(186003)(66946007)(33656002)(83380400001)(64756008)(122000001)(26005)(55016002)(5660300002)(9686003)(2906002)(316002)(110136005)(508600001)(6506007)(53546011)(54906003)(7696005)(71200400001)(86362001)(8676002)(66446008)(52536014)(38070700005)(66476007)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXJobjBRWGdKMTYxOVV6cVVEMUs3V2I5akU3M0V6Yy85eW4yM2RoaWJpdkRp?=
 =?utf-8?B?L0VEODNZT29NRWhlcUZSK3RPR1M1Vk42ODhWL3hOeFZRY3FRS0RDSkxqTkZW?=
 =?utf-8?B?RjBoYldKMTI4V0pqWVJyZjFid0ZvNWVxMUp6S2Q2Zk1VN291V0FqYnhWM0Vo?=
 =?utf-8?B?bTFMSkJZU1J2RG0wVTJTdWdzdGdFOWRPK3VJODRKS2w0cXdzeFNxMnlOUlJL?=
 =?utf-8?B?VnBSV0FtNTh5dlkxMnplRXpuQS90MjYzWFFhTHg5aUw2K210U0tFOS9neHdr?=
 =?utf-8?B?TGN6cW1wZm1HWmt4L1RBU0NYZU5EQ0lRSytURzJNQWQ4NjFzN2YrYk5hOWk3?=
 =?utf-8?B?Znk2dEpTY1hjYkkvQ3BMQTQxREp5d3d1N3E2djU2V2xHSUZuN1VhdFVkZzND?=
 =?utf-8?B?bnZSSHh1VVhwaUJGcTVsbVF5QVJXV0RFUEpaMjFka0NzRnY1WWpRQ2tiOGQ0?=
 =?utf-8?B?dU1OWTFXQjhEVzFXK0x6MzYwQy9NS2F2RXlpMFJNMCt1cXRmUWMrYmxQY1U3?=
 =?utf-8?B?T3c0bTArUndULy9JRDgwelpiQVZ2TkI4emMvbUVyZmhPbW5HcFpkRERLNUVV?=
 =?utf-8?B?RXR6STZMNFEwRXRzL05KL0hlWmg0YVpCY0Z0TWFQNzFNZk0vL0UzWnhscUdO?=
 =?utf-8?B?MUsxcndQSVEwYk9jUk1oUDhjM2RkQ2xSUm1LWGltUHJxdVE0bTR2NnhDT2FX?=
 =?utf-8?B?NVBjYm9VWDI2alg2ckVrN3dVZW5VZTA2S2pqTVJad3pXNG5TbGtlc0VnMThp?=
 =?utf-8?B?Szhld0RhQVdveGRoYkxNVm0vU3RTWnloWjVRdExyV3dJTFJUT2tmeVhRSHd3?=
 =?utf-8?B?MmVPaFFQR2JMRU0wd2x2cTdETmNsWnhZR2lvamJlUzFyMWRHTFMxQU13WXRn?=
 =?utf-8?B?ZnkwaXp5NkNDZUh3ekRNeTJDamhKU2M0ZEhKZFRmSDFadW5GbEJFMjBEN3la?=
 =?utf-8?B?Mi9MdmwvSW1scnhpdU1KbTFhYzdqOGNaLzRodXJwVEZEQlppeTNEajVQU2Za?=
 =?utf-8?B?Q0dQWlN5eFlJeFp5ajdiOVhzaEk0NXpSeW55K0tkRVBSVGRhUkliQ0lyaW1T?=
 =?utf-8?B?Mk1nb1RNaWpZazBiNytjbkhtNjNVS0p5UFNGTWVQNGU0bWVqOWdXVWtxZUZX?=
 =?utf-8?B?M0Q2QXZvektCNUZoQjZWWWd2Z0FxNFNRVGZWQ3EzWkg1L2VQSlZGVTl0Ri9F?=
 =?utf-8?B?V0ltOEdxOXoraENXVzNNU2MrZnNxUlRTbUFiTWh0bGRkTTRCOXEzbUJCaEpY?=
 =?utf-8?B?MW1zeEtiZzNKVTlpWFNGeTdUS3VZZW14Q0RsMllTWHQ0YjlpNEdGa0VWeG05?=
 =?utf-8?B?NUFaMkVFMU1IcE5icTRlSTlvZkxlOTJIRGdYMndndDUrUER6RTJ2WW82dCtk?=
 =?utf-8?B?aXhmN2VlZFd5U0NsNU5nbW1NQ2JHaXBURFI3Q0Z1ZXFoQUZxL3RYY0h1NEs1?=
 =?utf-8?B?Nmx3UzJ2QnVjQWlGemJmOC91ZWdRUjhxNUtQLzdkM0pPSWRrRnNuazhaVlhF?=
 =?utf-8?B?OWs2ejF1dlg3Y3ZBL2hkOVZFcFgrWENzTlhha3hMblo0V3V0UUVYS2h4bVg0?=
 =?utf-8?B?NlNLcE5EZW1OeGVPdmtPM1Rwc05oZjdyeWdHQ094dTlaekF5ZVRidHA2K3Jp?=
 =?utf-8?B?SWNhcmloQ2M2TTNMMUZ3OC85R29OOERGSkFnenhGOTBkc3IxMG11RTRqb1Mr?=
 =?utf-8?B?Z1FFS2VCOWxDREJzY1J3MHQvL01hR0FXMHRud01Yd090bExnSmZHQk8vY3dt?=
 =?utf-8?Q?PMihTFcYQF5LHChbCa/+DTBhX9je3U3pK2SmJ+8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8227eace-2193-416a-0376-08d9722a96fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:09:09.1584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYFS4kxoMQVOuTTEV95mFzv7u1eKBHbZ0hrtAsSuTR6EJ1PnVJ5wiRkmV85eZmS6BHTSfZUAC8gicxzl/yAdew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6324
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxlc3NhbmRybyBEaSBG
ZWRlcmljbyA8YWxlLnFlbXVAcmV2Lm5nPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDIwLCAyMDIx
IDc6MzAgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogVGF5bG9yIFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5j
b20+OyBiYWJ1c2hAcmV2Lm5nOyBuaXp6b0ByZXYubmc7DQo+IHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc7IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFsZUByZXYubmc+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2NiAwNS8xMl0gdGFyZ2V0L2hleGFnb246IGludHJvZHVjZSBuZXcgaGVscGVyIGZ1
bmN0aW9ucw0KPiANCj4gRnJvbTogTmljY29sw7IgSXp6byA8bml6em9AcmV2Lm5nPg0KPiANCj4g
VGhlc2UgaGVscGVycyB3aWxsIGJlIGVtcGxveWVkIGJ5IHRoZSBpZGVmLXBhcnNlciBnZW5lcmF0
ZWQgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8gRGkgRmVkZXJpY28gPGFs
ZUByZXYubmc+DQo+IFNpZ25lZC1vZmYtYnk6IE5pY2NvbMOyIEl6em8gPG5penpvQHJldi5uZz4N
Cj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMgaW5kZXgNCj4gNWU3ZjQ0NjY1Ny4uYjdlY2E5NGRlNyAxMDA2NDQNCj4gLS0tIGEv
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMNCj4gKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMN
Cj4gLXZvaWQgZ2VuX3N0b3JlMzIoVENHdiB2YWRkciwgVENHdiBzcmMsIGludCB3aWR0aCwgdWlu
dDMyX3Qgc2xvdCkNCj4gK3ZvaWQgZ2VuX3N0b3JlMzIoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3Yg
dmFkZHIsIFRDR3Ygc3JjLCB0Y2dfdGFyZ2V0X2xvbmcNCj4gd2lkdGgsDQo+ICsgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHNsb3QpDQo+ICB7DQo+ICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X3N0
b3JlX2FkZHJbc2xvdF0sIHZhZGRyKTsNCj4gICAgICB0Y2dfZ2VuX21vdmlfdGwoaGV4X3N0b3Jl
X3dpZHRoW3Nsb3RdLCB3aWR0aCk7DQo+ICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X3N0b3JlX3Zh
bDMyW3Nsb3RdLCBzcmMpOw0KPiArICAgIGN0eC0+c3RvcmVfd2lkdGhbc2xvdF0gPSB3aWR0aDsN
Cg0KVGhpcyBpc24ndCBzdHJpY3RseSBhIG5ldyBoZWxwZXIgZnVuY3Rpb24uICBZb3UgYXJlIG1v
dmluZyB0aGUgdXBkYXRlIHRvIHRoZSBEaXNhc0NvbnRleHQgaGVyZSBpbnN0ZWFkIG9mIGRvaW5n
IGl0IGluIHRoZSBmdW5jdGlvbnMgdGhhdCBjYWxsIHRoaXMgb25lLg0KDQo+ICB9DQo+IA0KPiAg
dm9pZCBnZW5fc3RvcmUxKFRDR3ZfZW52IGNwdV9lbnYsIFRDR3YgdmFkZHIsIFRDR3Ygc3JjLCBE
aXNhc0NvbnRleHQNCj4gKmN0eCwNCj4gICAgICAgICAgICAgICAgICB1aW50MzJfdCBzbG90KQ0K
PiAgew0KPiAtICAgIGdlbl9zdG9yZTMyKHZhZGRyLCBzcmMsIDEsIHNsb3QpOw0KPiAtICAgIGN0
eC0+c3RvcmVfd2lkdGhbc2xvdF0gPSAxOw0KDQpIZXJlIGlzIHdoZXJlIHlvdSB0aGUgY29kZSBh
Ym92ZSB3YXMgcHJldmlvdXNseS4gIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGJldHRlciBvciB3
b3JzZSwgYnV0IGl0J3Mgbm90IGEgbmV3IGZ1bmN0aW9uLg0KDQoNCk90aGVyd2lzZQ0KUmV2aWV3
ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0K

