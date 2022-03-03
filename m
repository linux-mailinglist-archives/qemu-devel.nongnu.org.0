Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BAF4CBAEE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:02:49 +0100 (CET)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiIK-0004e2-SN
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:02:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPiFR-0003bg-HI
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:59:49 -0500
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:13862 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPiFP-0003sM-GG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:59:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EttKu40bX8KTlpnG3mKSNWFggof3l0tB4ao9ki9nIqwVYOfjgka2SbsytsmO1oyjvy4sPx/IqD/9LgFB8aQR/zbdDwrM6yXCKnRnSRhKqC6l5PaEPItJhKfB6/V+QM6AHmvOH5qXTadP/cvgHfCzeZPReS3mSLlE5bCNHaKeTrnEUnrkbuGc+tIPjnSaooMNQ0RiDdAxaV8Vib+HgBQMLPUqtLbl61HPgvjrW6+4Mp9OASqI6g/zdA8bHdI4H2F5LCYMirNG4jpyQQtrNyJJ9h2PTPZejRsoDP7IQDznxZ0TtmMPagMGaEjXoxuAA9wkay5+8mVXCGmuPXNe+JVWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGeAAquf2wlCSl39xh6tFKcvOlL2eBVbqW6SE3/jX5I=;
 b=WEx60oHmOpEZu9Gn13vzUShZFdC0wyrtDMJlGU/3r48QHWjohnEuEDYfo9wAkOICLuRs4O4maev0iC9vE7XRl+5w9s8oRLyBVgFsWThGvPfdPZ7uZS/T59n4zR+m/7iTeBZf8GyP2H7k57P3Fh53XcvATnX3RBaYA7knOeuVDBDXdV8D5EE+ZLXOYuiB0vaw4XDy+ahc4tAApPGUZDc/l0FH5ur0M8KORqco4PrH3wjq7XOUg/x0gUjRJabgV2GctpVoDcVGkaMkGdDhpP1TKOuL84Rl13FMjP+lbzJVYFX2SOwmEeo5mcpXNR53qUB8cUK1jjEnwTa/xxAa23ylhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGeAAquf2wlCSl39xh6tFKcvOlL2eBVbqW6SE3/jX5I=;
 b=Re8TCQMe5//gq1UXLfp0hOA9XrfRZdDszUiZYdh2uQREwKSdK8WVsKkSGU+zkrqFE+FPCYMO9IbMfnGX+tt3M5mdXNQ6lxHeMITTFd1/VWvlIH251Bn8wyiaMNj8N80gAcB9nisyMvFAvQvewR+yN/Tt5w2A/iBZM1tKYyYzcvQ=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by DB8PR09MB3385.eurprd09.prod.outlook.com (2603:10a6:10:10e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 09:54:42 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 09:54:42 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Chris
 Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
Thread-Topic: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
Thread-Index: AQHYKYVniakyDyGrv06bs6a2VaDwIayjYTiAgAoJ/OA=
Date: Thu, 3 Mar 2022 09:54:42 +0000
Message-ID: <PA4PR09MB4880C5A1742F94E4A61124D2EB049@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
 <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
In-Reply-To: <bc2f558f-ae52-34ef-6901-3192f1d2fc45@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9976281f-ef4e-4b92-2380-08d9fcfbd70b
x-ms-traffictypediagnostic: DB8PR09MB3385:EE_
x-microsoft-antispam-prvs: <DB8PR09MB338504078E2245C02CF5E5BAEB049@DB8PR09MB3385.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCG+cT0cNyV+2zxBIFxILvgxClK4aLJoUtBF00FCgD4coTCa9/s3cY/OqvlAX5/ZRg1cQqcXLMgsrwVVwT3M0PAxjz4OL6YcEv48pL3wm/OejUl0p2aD2tSFOJB48u5yXVO3V/74LzJjQyJspatI8F9bHO5lMzOiTmaM96w3QLcbkZPqdVRuNiiQXex4/1LjW9fkSjK6OIr5TWVb+R0Sjqzlh21eg3AVXYROcR213qTyO4XM+rrZnC5kvnXxpQlg186Igo1/kN/e8QrXVp8Xs8P8O7ESM/BW8kWnCqpK+7bQYywgqXx2n1tXRL/raUP2pZuoPyBMw/klHBbNOooOGrUw2xYBFYFA40oQqJPEoPqhnA2KpeySRaNsjPsvWeseTCHmQmUhdkWRIx2QLvQjnBWAQNvUOqf7K33TUuug+yeoueGjbGiImFFi2VkZfkppY7GErugUy+3o5mPc95dE4FJn9m1kEeYGTngEcNe3T3ez2nXn2Upl+0lrgxXRiiA6sDH9UQYeBV3tP/iG4451hhH/rkeaUrQPxBj5vjpK1cUL22Iv9xDrbt6v0dbZOVlXUoH5OSmVVQcI+jZVN4xIIdZPSRoND9p206stbj6JaTroON8vlo3PLSNhmj7QRvLTDM1hzsmQ501yo7/wPxOA6Ihyl+0N+oo3dSB2bYSFZE3NI05Q3MusChObYgBkdhGoJsIYemP8TwnTxa4txc+dew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(396003)(346002)(366004)(39840400004)(136003)(26005)(7696005)(4744005)(186003)(2906002)(9686003)(83380400001)(33656002)(5660300002)(44832011)(8936002)(64756008)(66946007)(66446008)(76116006)(86362001)(8676002)(6506007)(52536014)(66476007)(66556008)(71200400001)(508600001)(38070700005)(38100700002)(110136005)(122000001)(316002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WERTZk5XSGdTcnk4bFBKa2NKRkdKaWFCakZBVHpXbkxPY1dmUC85UTFsS1ZL?=
 =?utf-8?B?Nm84SmJSQkt6alE0MTgwWUhwbUJGNFdaQ3AvNEs2ZHZsd01YaERldC9RbE9G?=
 =?utf-8?B?QTdWSTd4MzR5c2sxRDFhdGNiaVM5dUVZVTJ3YWVoZXRBTmlzdUp4bHRHby9Y?=
 =?utf-8?B?Y2pQL0QvRldWMkU2b0wxMmlQZVdpRXdGdW0rZ0dvaHBqU29qS0xBb3o5VVBm?=
 =?utf-8?B?RWNXWm9TT1g3UFRZRy8zYktkV2FjOTZsTEZKZVc0bGUxN0R4K2lYQTd0WEs3?=
 =?utf-8?B?Q0RpVDljNC9nRE9rZzd4cWNieU5xNnNlbGhqWDM2R2hrMENoM0dTZm5ZeEVI?=
 =?utf-8?B?cTZwb2cyaFZ1allmTkZheGlsRDJQZzN5ZUh2UWp2YklCalZCcXhLemJvVnVS?=
 =?utf-8?B?SHgvVlVHZ2VMYk5jTXBsY2xOVXY4aVdlWGNIZDY1NXhuUURzeWhDYTBRREtl?=
 =?utf-8?B?NFlYNnRueTNEU2ZJa1FKTWJ4cUxqYXlPMHgyaDlSMDdaUkM5dXhxZm1OclI4?=
 =?utf-8?B?OHhHSjBjOTJwZVBPZXAyaVdGelRHckdwZHoyUlFnck5PTW5jY0RLVnBRSGNM?=
 =?utf-8?B?dmRSQ2hocGsyazRmemYwdkJHd0xXREprWFY4NkMrcXZJYmpWcDgrY2dQRkRz?=
 =?utf-8?B?bGZYeHBxam9sV3hCT0hBYmN1d000THkvVlExbHk0QnB4RzJmRnRoQ0xDZU82?=
 =?utf-8?B?YWZFS2M5VFJORE9FNWJ4WGgyR1ljUTloNm9LczJqSS85WUg1VnZ1dDdoWkdC?=
 =?utf-8?B?c2RrZW5WcGFXUUN3NVhqV2tmSU9HMFB3aFY1U1lvWGUxbzl1bHFNM1RvRHNn?=
 =?utf-8?B?MlVkUDRRTEFrc29ZZzJYTFBCODR0dmNveE1Ob2lWd2tuVENOdVdic0NEanFv?=
 =?utf-8?B?SFR6ZVdzUVEvK1l4SGF5S2ZJaGpRWmc0S1FBWU04bWJtbDBPcVQzRTZ2bDVp?=
 =?utf-8?B?czVYYzdxSzlpTkRLdTJsYy9acGlDdE5YeDZOL1E2VUl4SHM5eVNYTjVjZHU3?=
 =?utf-8?B?TFhXLzFFaHNLRjdLYXRWSmQ0SGNLOUEyOWtWTHppS0FTNFdSM0lyV2VhOHV5?=
 =?utf-8?B?cllzajJjTm5uZFllbGFRSzd4blN2WiszcTd0M3NKdFdvaW41Uy9hMFNsQkZt?=
 =?utf-8?B?c00rUHUvUlRqZVR4a2cxNE44SEl4WEVuaFZNdHBjZ2NNYjJtMEV0ZFRGZ3E2?=
 =?utf-8?B?REs5MUVER09GS0ZOZzNYQnEveGVwV3hhdnhUaU9LYjRTMTdlTSs3cWZJRXYr?=
 =?utf-8?B?VGo4YTFUV2p4WkFPQmMxUUkrSVJGckJVNzBNR3ZCUkRMMVhhMjh2RFVsOUFL?=
 =?utf-8?B?Qko0TVpNN0wzUWMrY2pGVzd1SHVpL0hwcTJqVDRuKzRhOXIwV3BKcHkzTHFa?=
 =?utf-8?B?SGtGQzgxWkRRK1ZBOUozbXplWVErenRCMmNMZjNHNU5wRkgvOEcyTFRRZUNV?=
 =?utf-8?B?QlF4WU13cmlZS0taM05mNGVOVW9oUXFzQTFWS3BpdWxiQTh5NDZPZHd1SEhJ?=
 =?utf-8?B?TUo4SW5VVjFrV21HRXdzdXJvS29OUHFJNlltbmhUekJSZGF4ZDRYNGE5WWNo?=
 =?utf-8?B?anhOL0NsK0xHdkdNNS96bzJpMHI5YzR1RXI5Q1N5WXpKb0hYYzNGUVJZbGk4?=
 =?utf-8?B?ajQ5cHh5ZTJrSXFsbDcvZ2xJZFpJRXBFRXVScjFld2ZKdkJJNk1PeGUyOHBT?=
 =?utf-8?B?RmVWNm5VZCtDSENjSU9XMlcrVW9IcTJCcGFHNTZQZG5EWGFrSFBTVllZTFVz?=
 =?utf-8?B?OFgxRE41c0tBaU5VOFAvR3NtS0E4VmZtZkY2S25xVDRYNjN1ZHRuWTlEUS9B?=
 =?utf-8?B?QUlQaFdMSUUyRHZ6bnYyUURHQ2llcXFmWDdEdVJjOUN2QTRiN25VczFTVURN?=
 =?utf-8?B?Vk8rdXcrZlpYYXJBenlFY056R1p5d2xoK2NOR1VaRStPa0JBYTF0TGwrOFY0?=
 =?utf-8?B?TVU1ZGtBWWlPTmlxVTZsNU9vcGhsRC8vaXdYdWhIc2gyNTZMdmNuUVJHOEdo?=
 =?utf-8?B?RVJ3cVFFZ3l2OVBZbHlaUk9COWxDNHZVYUxoUFBwMFJXMCtTRzQwbUNEdm1n?=
 =?utf-8?B?WHZzWm0vRDlpNEpUWjBOVE52YWVVM0VYdENPaFgvOFBydWJKQkluVjZRbGQx?=
 =?utf-8?B?WlVUbEdNREo4UTR5L202K3ZhWVVhc3dJUHphUU9tUFBYVUE0K0VMaHpKdVAw?=
 =?utf-8?B?dW1SQ3l2aUtKYTBEK1BVSTdmdUVNVk16NVZ5a3I4aVNwUmd1L3dNbVhFeUtD?=
 =?utf-8?B?UHZwWnoyT1NDS1hmd0IzR1RMWG5nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9976281f-ef4e-4b92-2380-08d9fcfbd70b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 09:54:42.3833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwCY2e79Ak+iB8hot+7NEDvZ4bMbOkBbdkIT1EAc+B0K6TtqpFmoUgDHNvQnjhJpQVTenDfdRdpYDbWTOqonYredI7D8jehAdUo6JNdEQ/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3385
Received-SPF: pass client-ip=40.107.7.129;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBUaGlzIGxvb2tzIHdyb25nLiAgT2YgY291cnNlLCBzbyBkb2VzIG5pb3MyX2NwdV9zZXRfaXJx
LCBmcm9tIHdoaWNoIHlvdSd2ZSBjcmliYmVkIHRoaXMuDQoNCj4gRm9yIG91ciBwdXJwb3Nlcywg
SSB0aGluayBzaW1wbHkgcmUtdXNpbmcgZW52LT5yZWdzW0NSX0lQRU5ESU5HXSBhcyB0aGUgZXh0
ZXJuYWwgaHcNCj4gcmVxdWVzdCB3b3JkIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4gICBCdXQg
d2UgbmVlZCB0byB1cGRhdGUgUkRDVEwgdG8gY29tcHV0ZSB0aGUNCj4gY29ycmVjdCB2YWx1ZSBm
cm9tIENSX0lQRU5ESU5HICYgQ1JfSUVOQUJMRSwgYW5kIHVwZGF0ZSBXUkNUTCB0byBpZ25vcmUg
d3JpdGVzLg0KDQpTaW5jZSB5b3UndmUgYWxyZWFkeSBmaXhlZCB0aGF0IG9uICIgdGFyZ2V0L25p
b3MyOiBSZXdyaXRlIGludGVycnVwdCBoYW5kbGluZyIgcGF0Y2hzZXQsIEkgZ3Vlc3MgSSdsbCBu
ZWVkIHRvIHJlYmFzZSBvbiBpdCBvbmNlIGl0J3MgbWVyZ2VkLg0KVW50aWwgdGhlbiBmb3IgbXkg
bmV4dCB2ZXJzaW9uIEkgcGxhbiB0byBqdXN0IGtlZXAgdGhhdCB3aXRoIGEgIlRPRE8iIGNvbW1l
bnQuDQoNCj4gPiArICAgIGlmIChjcHUtPnJubWkpIHsNCj4gPiArICAgICAgICByZXR1cm4gIShl
bnYtPnJlZ3NbQ1JfU1RBVFVTXSAmIENSX1NUQVRVU19OTUkpOw0KPiA+ICsgICAgfQ0KDQo+IEkg
dGhpbmsgdGhpcyBzaG91bGQgYmUgYSBzZXBhcmF0ZQ0KPiAgICAgI2RlZmluZSBDUFVfSU5URVJS
VVBUX05NSSAgQ1BVX0lOVEVSUlVQVF9UR1RfRVhUXzANCg0KVGhlIE5NSSBpcyBub3QgYSBzZXBh
cmF0ZSBpbnRlcnJ1cHQgbGluZS4gSXQncyBwYXJ0IG9mIHRoZSBpbnRlcnJ1cHQgc2lkZWJhbmQg
YW5kIGlzIHNldCBqdXN0IGxpa2UgdGhlIFJlcXVlc3RlZC1IYW5kbGVyLUFkZHJlc3Mgb3IgYW55
IG90aGVyIEVJQyBmaWVsZC4NCkNvdWxkIHlvdSBleHBsYWluIHdoeSBOTUkgc2hvdWxkIGJlIHNl
cGFyYXRlPyBXaGF0IG1ha2VzIGl0IGRpZmZlcmVudCBmcm9tIG90aGVyIEVJQyBmaWVsZHM/DQoN
CkFtaXINCg==

