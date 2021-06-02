Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5A39914D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:18:01 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUVE-0001zL-ES
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loURT-0000wA-NP; Wed, 02 Jun 2021 13:14:07 -0400
Received: from mail-sn1anam02on2136.outbound.protection.outlook.com
 ([40.107.96.136]:15677 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loURQ-0002uq-9L; Wed, 02 Jun 2021 13:14:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM11RiiRC666aTwKc0buDJEwnn69U4uniNrbqA//FWumVrZVjPTrLdf5f94M0Kjb5xD4NgEXnqYvqaNsCGnGWdRUjQdEhOAd9yDsMSGCPFYvS9REcJ6naGAOLk9fW8b1GyBgKgnImpQ9xwcfKmLMeKKoAhqPjzSFb5WQJ+MtDPA4gJD7ot1hq3m8HGP8j/uKmVqdmD8fAVq9KZE9MbLWPUXy3XMxC9QnVpB7FiJBdyPRkfWL3HJiOD4eJd0aY20NS+76X2tIhqWbSh1R4pCtyOGlUMJbK78O7MBeA4pwZwE9gv5212WkujHeXa4cO+N3dJmYhYRUuXiccnpiDWLY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+VxR/MuV0abL3CVgjgzJkSR6/RBnrF+GaujOlmFmOs=;
 b=KIgvtRbtniDw1nc6KrF4unrs1ZPtJ4Po/ErstraMUCYilUvIXcNtIEYHx2NAXOYV398DqnvFUpEFFzYOFbCsZ5DOcvfYOODjy6Rn1vVD6r46m4RGGuTDZrZvNOaRCdMGq2bM+kxHIn9pDbYYhnhJUzarFkfTayWT68j2RGJBjJPJAWMlg/WGdwC6XP8dHG1bCwo7PrGpgWopFfFnIDj8HH1buf8iCz3zolZIhduZoEDIDJL27zBbp71jkjclR4hkEMwTgj/UbNzjoVVUrXY33dtNVofOoaiCV6hxfGbJ1GM3vRXOxB0QybhvJvjHh9r4hXqHcHUBJZTANcvkwtmydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+VxR/MuV0abL3CVgjgzJkSR6/RBnrF+GaujOlmFmOs=;
 b=R+jaSIDupYp2h6Lntl4nC0pOKa7z3EwA+2+Kd+76EX3Z+GB4wPmEXA1+bUm41fNRn8jQtaVLCSIxH/mg1yp7AHCWGNLr+/igf/fW05Yy4ulipmpPcgIrZGzhKU2UEPMvp/EWQQNV6zcaBzYLbiGdfzx5xLq9HQU/B46P2QWvoHCgaD7wBTJU0K4Ke8UzRYCtcZoLsOr+FSRH2DI9sQ4HwbFLrXChxIHZBrLDMZDl50o7KFF2y8mqfmxqxh4hA86Hn+OudF2rA02eWVg4CTIR/MRLoL9sNsHxcoJt9sCAhJUjkcEkRciwk5ao/USrpQ/NrbyB7hS5TqnmMFh3aovXZg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4867.lamprd80.prod.outlook.com (2603:10d6:103:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 17:14:00 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 17:14:00 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH] target/ppc: fix single-step exception regression
Thread-Topic: [PATCH] target/ppc: fix single-step exception regression
Thread-Index: AQHXVxBU9E5hMo8t2EeokhgnMWT6mqr/muoAgADQ5wCAAHQQAIAAFw0A
Date: Wed, 2 Jun 2021 17:13:59 +0000
Message-ID: <CP2PR80MB36689DC84E5FCC34626F29C2DA3D9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210601180237.296402-1-luis.pires@eldorado.org.br>
 <aa0c8f49-38d3-4ca0-89b8-0807cb57558f@linaro.org> <YLdHZuIlK4VEBlWf@yekko>
 <05523c8f-e564-2f61-5a39-eccac11c4f53@linaro.org>
In-Reply-To: <05523c8f-e564-2f61-5a39-eccac11c4f53@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13eb99e9-78df-4744-75cd-08d925e9d032
x-ms-traffictypediagnostic: CP0PR80MB4867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB48675520E2027D4A01108D0EDA3D9@CP0PR80MB4867.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sZOLwtERkLNoIQPq8/Bpa+kzt078cflVuIIB8GiEAA/pTjg41KA0812O2n5OkIy8x5JANngAsHw1IrcbuxskNtt6MhFIfZLqAu9aq41AO2IZ36pgXDiKBke4qYnswapDjNJXFuDa1/h6csA6MVtHRDfnmORgTKlUUOOS5DIEDaWAGziAHmTWq243oy8sLbLPjtmB5eTsv0qMobApgZTdN6x20Nr3MXIY2Icsny7dReeQlgbgCOukdC7ZSdG3GpD5AnwkzOTL0emQi0zYb7b7fzfB+VvkacorZrFy+gN/CVBH8JNfyVr6vqw9VQl89MKneChElOB89bHYSzjf4pfPN3jyux+efz7PpmZHHns2jvCB/qLz/mfix+0/VI2GbmvTmAzWsNm0cgw1TRD/oULq9VNtKNojzAQDPDtyM9SXQaMHTrxh3OuFkQcugW9M7qYuiHR1aKZ5qGcHnTwlPH3wTf253sEVsuFQ+2RAzOBCGhI/aKBmHdiKCSRqC2JotgFYwNq/hoCIe9KS/qIQ0mEeSke0+poDne7OsElpWoZfu+/eic4gT+EBLufVoEi+f6dQAym//OiGbTpI67xs1J3JsmI5+eFQZMPkdr1cOw3nUx2dvjvuDJaxcqZVGbuLS5NoEP0pDv+yExY43RBXqagRI7fOHCTjB8jhA9QkVdMkENvCCEcOpGblR+mcyk6+Bczts5Umc3G+C+drB48zgcGe5RAuyEgW1PuqL31o7nnWzLk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(366004)(346002)(376002)(136003)(55016002)(186003)(478600001)(8676002)(26005)(9686003)(316002)(53546011)(83380400001)(6506007)(2906002)(7696005)(71200400001)(86362001)(66556008)(76116006)(5660300002)(52536014)(4326008)(66476007)(110136005)(66946007)(64756008)(54906003)(122000001)(8936002)(38100700002)(33656002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QmNVT1lteWNWNkdnN1FJNERjcTRoZXpJcmZ5T2dQNjhwcCtYeUNmZWNvQXlm?=
 =?utf-8?B?NmlFYnk2NHVrU3ZCNjY0azV4b0NMZXhONHdnRTdiUGJYd3NzM1g5SEovbno3?=
 =?utf-8?B?S0wzdzhMRFhXYXU3OTJtY1VZQXVQN2tpWTdiZFlocGJOSk91TFk2ZkNOSDl0?=
 =?utf-8?B?dXBVMTU4RkwvaEd0dHE2YUlHWGNqczcyTTA2SFA5eTM4WmZIUmE1MjEyamNy?=
 =?utf-8?B?ZXdleTEwS1R0aFVXN0w2MnRFNGNveGEzMExSUzhrbUUzaElwYlZ5Qjg4QzdE?=
 =?utf-8?B?enJ0a0F1UDZ3c1lHSkJjQlpGWmR0WGx4THZCUjdwWmswQy9DbXpYTTlTb1dr?=
 =?utf-8?B?SFhmd2Q1V2x3bklVMlJRcTNTN0tGS1FjREdDM24zR2d1STVxMGRFemFNRHNC?=
 =?utf-8?B?U0Fud2lRUWxmTUdhNXFkYmd2dTJ3Zm5ySjM0d2c4Smd0MCtYL1A0K1crQjFS?=
 =?utf-8?B?L3FGdU1rMWx6U1lUQnRMazVWZ21ZZ0REcENHMHBGOEg3akduK2lzamN2UlFP?=
 =?utf-8?B?RGsxdElWcHphRmgrV2NxckFTQ0ljZVRpcHRVUWxLSUdvZDRyOUZrWnlDUTU5?=
 =?utf-8?B?WDZodDJ2MUI2Uk9xSVZkRHpndG1wcXhVcUxRb0U0dlNkOEtqRVB1UGtEYnNM?=
 =?utf-8?B?ZTluTm1jMnNWdnhBcmRaS0w2bjBqUWFsQzFHajg2NWdiSi9VSE5SdERBZkEr?=
 =?utf-8?B?dWhLelZIVUhFaHZ2b2FWRk91NGdDYnhtcUpkdHN5Wkd6RitGWktwRWVZNEk4?=
 =?utf-8?B?RFZ2YjJKVHV1Q29VT1F4cElNRkdNSjVYd1FmVUY3aEFOQWhqOHNmdXBqUmJ5?=
 =?utf-8?B?WklDcncxMi9mTUtjM05rY1lLNHhiWWtyRW1qdjduOUY2aWZUY1FnWGpTNVIx?=
 =?utf-8?B?R0YzMTBoZjBDVmdRclIrTWhtR1VLaGs0dlRKUmlFYjZmMVV0V0NGeGdIaDBO?=
 =?utf-8?B?OXF0NWRURTV0cDRwRE1xRmVoYkJvT0xSbEFGNWZNMEJGUDZNKzdySGFXaXkr?=
 =?utf-8?B?Q2RDYXRJZFVsQ1Q1LytKd0lLTXR4VmZ2eThmaGRaTzlMYW8wUmh1ajZkWXg3?=
 =?utf-8?B?ZWhKTENwNlVmYldCWS9SQmxEYkp3YlJ3bnNxNldJNzNVbWhOVmpMOWplM0ls?=
 =?utf-8?B?YWF5eG9aSnp6WkFuYXhLbFV5djRxc3lmREZqRFBCblBFZHBXa3lLb1B3aWtB?=
 =?utf-8?B?UVFKUGFDcVk1TVhOR0dsVjBqS0xmYm11R0JLbThFVm51eVVvUzczMmNBL3lx?=
 =?utf-8?B?c3UzVE1Na2hmM3ZLbWphTWZPMkhKaXlud2tSVStOZERJd0dJSjA3K3dBSjd1?=
 =?utf-8?B?bU1RS2dNWlN4SzYrZHNkWUt4M1o4cGUxM3R4RDJQdjQrU2hpQjNEVkhMNnFG?=
 =?utf-8?B?MlErZDExcCtDQVBNejVjUXZYRHNDaWZBMlZmQlhQT2xzb0UrVmVDTDNHOFI1?=
 =?utf-8?B?S3lqajcxNmQ0NjBhS2x2Qmg1QkdnOURVVjIyQlg1Z3VUREFSci9nZkswclg4?=
 =?utf-8?B?NTFJUjE3c05qVk8zT0VVNWszKzJWYkdWNWhIRWdJMm9wb0tSRnd2eGgwSEFM?=
 =?utf-8?B?dkhuUUFLQmxtcndTVHBxNUJ6R0x1d3c5WERDUnhQUWFNZUplWU9CN1hzcGVy?=
 =?utf-8?B?a2JGQlpXTkxBUS9IZzIwNVpXN0hqYlBYaVdZR0g0cm03SzlWZWYvMDJhemh3?=
 =?utf-8?B?RGNiU0UwdGFMTDBMeVhHa25ma0xDNjVzSThBZHRQRldUUTJRRVlQVm1EcFcw?=
 =?utf-8?Q?R2CFPvuCsOPmTSG4Nc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13eb99e9-78df-4744-75cd-08d925e9d032
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 17:13:59.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJpd/i9ArVuhpMoS3bgDp86hzpv4stRMfa5nCxkfju+WtPUFfPQNAuDYjTffH761rXMbIwyq/mToWyj3EUOBjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4867
Received-SPF: pass client-ip=40.107.96.136;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
Cc: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "groug@kaod.org" <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IE9uIDYvMi8yMSAxOjU1IEFNLCBEYXZpZCBHaWJzb24gd3JvdGU6DQo+ID4gT24gVHVlLCBKdW4g
MDEsIDIwMjEgYXQgMDE6Mjc6MjBQTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+
ID4+IE9uIDYvMS8yMSAxMTowMiBBTSwgTHVpcyBQaXJlcyB3cm90ZToNCj4gPj4+ICsgICAgICAg
ICAgICBpZiAoaXNfam1wID09IERJU0FTX0VYSVQgfHwgaXNfam1wID09IERJU0FTX0NIQUlOKSB7
DQo+ID4+PiArICAgICAgICAgICAgICAgIC8qIFdlIGhhdmUgbm90IHVwZGF0ZWQgbmlwIHlldCwg
c28gZG8gaXQgbm93ICovDQo+ID4+PiArICAgICAgICAgICAgICAgIGdlbl91cGRhdGVfbmlwKGN0
eCwgbmlwKTsNCj4gPj4+ICsgICAgICAgICAgICB9DQo+ID4+DQo+ID4+IFRoaXMgaXMgaW5jb3Jy
ZWN0LiAgQm90aCBFWElUIGFuZCBDSEFJTiAqaGF2ZSogdXBkYXRlZCBuaXAsIGJ1dCB0bw0KPiA+
PiBzb21ldGhpbmcgdGhhdCBpc24ndCB0aGUgbmV4dCBpbnN0cnVjdGlvbi4gIEUuZy4gcmV0dXJu
IGZyb20gaW50ZXJydXB0Lg0KPiA+DQo+ID4gQW55IHRoZW9yaWVzIG9uIHdoYXQncyBhY3R1YWxs
eSBjYXVzaW5nIHRoZSByZWdyZXNzaW9uLCB0aGVuPw0KPiA+DQo+IA0KPiBJIHdvdWxkIGhhdmUg
dGhvdWdodCB0aGUgZmlyc3QgaHVuayB3b3VsZCBoYXZlIHNvbWUgZWZmZWN0LiAgQnV0IG90aGVy
d2lzZSB0aGlzDQo+IGlzIHRoZSBmaXJzdCBJJ3ZlIGhlYXJkIG9mIHRoZSBwcm9ibGVtLiAgRGVz
Y3JpcHRpb24/ICBSZXByb2R1Y3Rpb24gaW5zdHJ1Y3Rpb24/DQoNCldoaWxlIHRyeWluZyB0byBk
ZWJ1ZyBoaXMgaW1wbGVtZW50YXRpb24gZm9yIG9uZSBvZiB0aGUgbmV3IFBvd2VyIElTQSAzLjEg
aW5zdHJ1Y3Rpb25zLCBNYXRoZXVzIChjYydlZCkgaGl0IGEgcHJvYmxlbSB3aGVyZSBoZSdkIGdl
dCBhIFNJR1NFR1Ygd2hlbiB1c2luZyBnZGIgdG8gZGVidWcgYSBwcm9jZXNzIGluc2lkZSBhIGd1
ZXN0IGFmdGVyIGNvbW1pdCA2MDg2Yzc1Lg0KDQpTdGVwcyB0byByZXByb2R1Y2U6DQotIEluc2lk
ZSBhIHBwYzY0IFZNIChydW5uaW5nIHdpdGggcWVtdS1zeXN0ZW0pLCBydW4gZ2RiIHRvIHN0YXJ0
IGRlYnVnZ2luZyBhbnkgcHJvZ3JhbSAoSSB0ZXN0ZWQgd2l0aCAvYmluL2xzLCAvYmluL3RydWUg
YW5kIGFsc28gYSBzaW1wbGUgaGVsbG8gd29ybGQpDQotIFJ1biB0aGUgYmluYXJ5IGZyb20gd2l0
aGluIGdkYiBhbmQgeW91J2xsIGdldCBhIFNJR1NFR1YNClJ1bm5pbmcgdGhlIHNhbWUgcHJvZ3Jh
bSBvdXRzaWRlIGdkYiB3b3JrcyBmaW5lLg0KDQpCeSBsb29raW5nIGF0IDYwODZjNzUsIEkgbm90
aWNlZCB0aGlzIHdhcyBoYXBwZW5pbmcgYmVjYXVzZSB3aGVuIGdlbl9leGNlcHRpb24oKSB3YXMg
Y2FsbGVkIGZyb20gZ2VuX2xvb2t1cF9hbmRfZ290b19wdHIoKSAoZHVlIHRvIENQVV9TSU5HTEVf
U1RFUCB8IENQVV9CUkFOQ0hfU1RFUCksIG5pcCB3YXMgYmVpbmcgcmVzZXQgdG8gY3R4LT5jaWEu
IEJlZm9yZSB0aGF0IGNvbW1pdCB0aGlzIGRpZG4ndCBoYXBwZW4sIGJlY2F1c2UgY3R4LT5leGNl
cHRpb24gIT0gUE9XRVJQQ19FWENQX05PTkUuDQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8g
ZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8v
d3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQoNCg==

