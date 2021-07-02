Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B33B9CEA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:29:49 +0200 (CEST)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDcN-0006OS-6e
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDaH-0004hQ-2h
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:27:33 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:22789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDaD-00007D-Vt
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625210848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEx4acOKuYQvMDSeCOrPLwziLI/4xaHc0zO+c/LC51A=;
 b=HTTp5xY+qsGPxv7p5MUjkxiAmiC9+CVEG341DYdVb4vLw+NQnzyq+bTlJc8Q0CIt98eKBw
 1fTqTaVqyxBZ95lMk0APwx26SQDzLbGV/R4h5Rmlq5RHObYrUhnRKy8ZDJ97sWG97bdR7O
 m69GaeZObcO/UabZGl7oXPjXDGTD+C4=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-NOZWmpicOMOHe6LvCgoQww-1; Fri, 02 Jul 2021 09:27:27 +0200
X-MC-Unique: NOZWmpicOMOHe6LvCgoQww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXRaV9ersDKNKJUcqhEZ1eZ8aMKCuVJAQLhJpuZBUiUgx/uXoVx37s+Ey16WG1Bg2A7pmyJwLjFPiBVVal1+aEkjXqwa5H7ynSIoeMCG3M5fhkA/iWg4/KNQypy2jNWCMlnF4c8Sg6cC1Tbs8VuAC3ilk8CNb81hgrI3JSIMZ9VleWe+3/dng6Mg1szo9JLX34sn2EtnpIwjP5NRce9b3q38PkXJ+5wWag7ZZE98Sm/JoTQs4fngnWydelpGudCUMMP9QlAfGb28VauwTFPT0hQ6h8fTwn+3GAkwCMzkzOzpmyvmOvtD0cP8g7vT63FJ0eOm1HcncOQAhJ48CrqzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEx4acOKuYQvMDSeCOrPLwziLI/4xaHc0zO+c/LC51A=;
 b=CLJa3Xh2Ad/NAHK/ha6TeN21LDlJJ323yxlHnYKc3w3unvpXIeDmtPWuGEN1mkhdAf+IdsFFgGe4WaREOESBG4CIkp/UTUXqUKXjEzaOS7wScASqReEdIrNcv19k0V79Z6Im0xMYotfHShEed7uDWYe89Lh5GRoCA0OigXF5NBjKMgNZFqT7Kl+t+n+1bZFOh5Z8+IRydbOCLeF5WK6w17a5FcbLPscDz2mNmzouJUHkniDkkig2nXLGCLkoaYpCI0ZGPObRf4CchFnNUT7KI4t3oGwn+mL9FrAU9SC9v3oRwX9FHdCAceSUwa0RDB5tzFKv61UQUT5T6MreTTqsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5245.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 07:27:25 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Fri, 2 Jul 2021
 07:27:25 +0000
From: Al Cho <ACho@suse.com>
To: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>, "cohuck@redhat.com"
 <cohuck@redhat.com>, =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?=
 <jose.ziviani@suse.com>, "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [RFC v6 09/13] target/s390x: make helper.c sysemu-only
Thread-Topic: [RFC v6 09/13] target/s390x: make helper.c sysemu-only
Thread-Index: AQHXbPHqeyq3INUZlkybAynTCXv4FqsuEZGAgAE78gA=
Date: Fri, 2 Jul 2021 07:27:25 +0000
Message-ID: <1702e9caf6192b2e9b9c068e4b1ca5ec8ca5beee.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-10-acho@suse.com>
 <a3eb7e42-020a-ed1c-ccd9-07cdd4b5382a@redhat.com>
In-Reply-To: <a3eb7e42-020a-ed1c-ccd9-07cdd4b5382a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b548aa15-1f4b-43ed-bf5a-08d93d2ad721
x-ms-traffictypediagnostic: VI1PR04MB5245:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB52456EDF5C90846ADC9DF9B6A01F9@VI1PR04MB5245.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:161;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VQymgT//DzR/d6aQ9EdvPuMAYnO5ZcZTBK/PTC7Xtd6UjnCUh9Bohakmzb87arA8+8oPcolxpl2WS957yUhx0p5zkvdcv4p5nilpCfV/rAmurJRHpF1ABcYJ0lrAunUXEAYy2cNwuB8hlnET1XP0xvjJTykaYSA7wRsReEjNgv0KolnVj0cAGbell2IIo+ouSfW3HvtkZa35VdssvGxzQcmPQ+fNaIbWST9VeD6ILAMvx2zKmJ5MiN8Rbm7TVyzCsbQx061lRu5tNEkIZUDRe2HKj5W6syksheHNGUbO3NR33eyHDk9GqVQrV/RVbeeLPoYezNLW2f8mHC6SRCYEAFxhc+YIUnUeT19mI3RJu7HCzTqxaHu+9EOJl2sZ3fW/+bFqNAPMs6DlyzkfqvQYMknY4KQuaSt4NAg5A4HwnhxXs/5Uk8KmMuZysC0u8fA3AqSgYT+dvwo5bGsNQ/jTMHeppNo5fjYABAk/CWSqHYqe7Pfk2cMUjwwS0Dw3anT2K9qjhAGcblb60HyD2KwtmH4UqsyTcxaECL74N6dgs/pWSIZT9NLYOSvW2xR2cTSyLB+lenPfxCjIXh7aFjsUe0Lw1wY+JqkOunAI35MbBmWiTycPVVhXlRoNJrfPohBvervtoAh2iAjHNBA6aRbdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(136003)(39850400004)(366004)(83380400001)(71200400001)(36756003)(4744005)(26005)(6512007)(8936002)(6506007)(2616005)(186003)(6486002)(478600001)(4326008)(76116006)(91956017)(86362001)(316002)(2906002)(66946007)(110136005)(38100700002)(5660300002)(66556008)(64756008)(66446008)(54906003)(122000001)(8676002)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTdLV1JsSHJwM2FoQ1RMMS8zc1BwVEFYTll4R1hUZUlrTitac21DUTBOdkUw?=
 =?utf-8?B?WmdPUzdML3BFRCtJc083YytXTkUya3VxbWVQSkVhQi9PVmt6TXJ5SlVlM2cz?=
 =?utf-8?B?Z212b20zaTRRbjlkeWY1cG1zSWpFUm1Qa3MxNzdIeHpKdDBjVjVMU1ZNeCtn?=
 =?utf-8?B?c3ZFcFQ4UUNMc3c4eUk1dmFaV0M2dFFueWlvaGNVV1VORVlQVkJiYlNUQW5U?=
 =?utf-8?B?K1BkbFhKSlhOc0NsanlFc3RFejBHbVVtSi9EQXFQb0NqVGQ5d2p3RWRSTjNK?=
 =?utf-8?B?YzRReldmYm5YV0pDWUVERFJPZWNRZGlCc0Z6Y3VIbHU1V2RzaUhPYjQwRG1z?=
 =?utf-8?B?RnZGT3VUTGpQMG83YWZETFZQTE5MRjQ4MmlzSmV3ZXpFQ1c4ZStPWG5TNzlL?=
 =?utf-8?B?dVdFdVVGbm95Y2ltVWRIVXlaak1vcVAxLytNRFhzK3ZWbkRTTS9MNlpnSEtw?=
 =?utf-8?B?bzQ4NWN4bCtyMFBiTjN0VU9FczJEaW9Dc2VYT2ZGY3ZocFFRYUc2TU1vMVBW?=
 =?utf-8?B?OTY0bU5SRTFDSVlHTnRnN0N0OGdyUzZKNmo0UkZ5dDU5NkErU2U2alFFTXhh?=
 =?utf-8?B?SUZGYW90YUZXTjZuVHlUMXV5Q3BaTW1FWEloeWsrK2lMeVVBS0hCSy96bmpW?=
 =?utf-8?B?Vk1DN1U3US91YlRhRkpNYWgvUUowMTdxek5CaXIwSkwxUXJIRExsUzUzNTlH?=
 =?utf-8?B?OHNFMXhSK3JZd0FZNVEvbDNPNTZRaVJpR3dPV09BTTRwdWVDR2dueGlpdUpa?=
 =?utf-8?B?YWxKTUROeEZhTHFBL01hRnpRUmVoRlBiUi80ODIvNHllYm45Mjh3UHh0clp4?=
 =?utf-8?B?anI0cjFVZ1hVaUpUSWN2WTBSQTZ1QStwMzAwTFA2aVorMmk1QnpFRXdabFV6?=
 =?utf-8?B?Nk9IOHNFY2JxYzVwRVNRU0c0WTV4VlBQeXhBckRXNnhiT2tlT3JLUnREclRI?=
 =?utf-8?B?V3dXZGl3M2VwL29FczZ1T09OcWFJRTRrQVUxMXlMNSt2SjNVamlPenZ1Tks3?=
 =?utf-8?B?VkpLbEg2Z3hNQzdnM2RVU25haE55L3FmY3NTTWo4dXFBZCtwOUloL1l6MnFJ?=
 =?utf-8?B?ZXE1dGpIRHlMek43UXNmeHllMFA1aEM3WlJjdHduVm5UbUZUcTNFbURVeWVJ?=
 =?utf-8?B?ZzJhWU1RRWxEOGVFd3hjOHllR0RXa2Q0eU1YcytxRlZEYUk5ZkJ4UzVpcGRX?=
 =?utf-8?B?T2ZUVkQrZFJZV25GQ1RueVcyTFhCY1l2R3pVYmQrWFJpWmV5S1pJNWFVakdW?=
 =?utf-8?B?dEZCRmdhV3JLeEY4VTJoNW85ODllT0I4RTRST1Fvd21FN2JWMnhtZm1kQ1J5?=
 =?utf-8?B?bHMvbFpSV1E1aXY0SExCN01FblZWeFl0dG9qeHprRjJySHlTT1JYRGl0SGto?=
 =?utf-8?B?YUNhbEdLckd3Q043c0s4Q0Y3VHV3OG5ZMUZXTDdha1l3MGNIQStOdnR0cjln?=
 =?utf-8?B?WXBlcXpLR29XSVRqblBqT3hOaHJ6d0VJWDd1NFFOQVRxZ09xbytNcUJnRVBp?=
 =?utf-8?B?QktIS0d4T0padGNwbVdpcm84dXgyWnB6MVJuWjZmOU1SQXUyMmplUzZHZm9l?=
 =?utf-8?B?aS8wR3duMlU2NkVqSzVNRktReW9IVVZYRTBjTW9QenJmeEJmbUxjMG93Tmtx?=
 =?utf-8?B?QWtLRUNrL0dFV2d5ZVAyVWRkd0dLNnJ6dGx2bStQNGdFRElTd0xISXAwRERN?=
 =?utf-8?B?ajNiRk91bm91TVhGdnBGY0RWTkwzbmtNVmJXbkNtY1ZPL2czekdJTE0xNGR1?=
 =?utf-8?Q?PVP2PBneOsL8Xl49jnchzPoMP25J2FwH5uafKlG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41F60FAF42A6984688B98615714AAEF6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b548aa15-1f4b-43ed-bf5a-08d93d2ad721
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 07:27:25.5370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUyEk0bNsZdDbSPBG2wlMp2vpYLtEDKmq3CXUeyDjKt6fA2+RzLq1+sLMVK5xKya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5245
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDE0OjM2ICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
T24gMjkvMDYvMjAyMSAxNi4xOSwgQ2hvLCBZdS1DaGVuIHdyb3RlOg0KPiA+IE5vdyB0aGF0IHdl
IGhhdmUgbW92ZWQgY3B1LWR1bXAgZnVuY3Rpb25hbGl0eSBvdXQgb2YgaGVscGVyLmMsDQo+ID4g
d2UgY2FuIG1ha2UgdGhlIG1vZHVsZSBzeXNlbXUtb25seS4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDbGF1ZGlvIEZvbnRhbmEgPGNmb250YW5hQHN1c2UuZGU+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hvLCBZdS1DaGVuIDxhY2hvQHN1c2UuY29tPg0KPiA+IEFja2VkLWJ5OiBDb3JuZWxpYSBI
dWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4NCj4gPiAtLS0NCj4gPiDCoCB0YXJnZXQvczM5MHgvaGVs
cGVyLmPCoMKgwqAgfCA5ICstLS0tLS0tLQ0KPiA+IMKgIHRhcmdldC9zMzkweC9tZXNvbi5idWls
ZCB8IDIgKy0NCj4gPiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3MzOTB4L2hlbHBlci5jIGIv
dGFyZ2V0L3MzOTB4L2hlbHBlci5jDQo+ID4gaW5kZXggYzcyZTk5MGY0ZC4uYTRkNDY2NWY2NyAx
MDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvczM5MHgvaGVscGVyLmMNCj4gPiArKysgYi90YXJnZXQv
czM5MHgvaGVscGVyLmMNCj4gPiBAQCAtMSw1ICsxLDUgQEANCj4gPiDCoCAvKg0KPiA+IC0gKsKg
IFMvMzkwIGhlbHBlcnMNCj4gPiArICrCoCBTLzM5MCBoZWxwZXJzIC0gc3lzdGVtdSBvbmx5DQo+
IA0KPiBzL3N5c3RlbXUvc3lzZW11Lw0KPiANCj4gV2l0aCB0aGF0IHR5cG8gZml4ZWQ6DQo+IFJl
dmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gDQoNClRoYXQncyBh
IHN0dXBpZCBtaXN0YWtlLCBpdCBzaG91bGQgYmUgZml4ZWQgdGhpcyB2ZXJzaW9uLg0KV2lsbCBm
aXggaXQuDQoNClRoYW5rcywNCiAgICAgIEFMDQo=


