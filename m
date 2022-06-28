Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FA55BF59
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:12:55 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66L8-0006Vu-34
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65U9-0008QD-Pc; Tue, 28 Jun 2022 03:18:09 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:33164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7178e17cfc=pdel@fb.com>)
 id 1o65U7-0002Ii-LW; Tue, 28 Jun 2022 03:18:09 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RNEp8h004478;
 Tue, 28 Jun 2022 00:17:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=o6ihQIlBFXOr+3VOTpSMR4FZv7eW1Ctovsha02Us5uI=;
 b=bt9ilxMOlau6/ea0lb9GV6pXcdhsVM9s6vuEIoezLNPJ4tj1FajPmTCW3r/79I+hZehS
 G3VeTK+dHCDsAMD0pMbnYICXTU+1r13iAIOUjEoqiqzinDKVM8sO9yvWOzrCYzv7bvbx
 xiGWf/WctQKCat6tixKG7qPXI0VRYFvH6sA= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gyp231unw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 00:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcGtK5lxrIlpAYW2STzmNIxnkLF6TArPiv4rPZVmYOfxdfxsfE5pEka0Kd6CYw0QNnTU9RUe71ma2eyGaEXfBFMfS6ZsraXj7q695IhgeST8D/OA2yhoIZWmFsSE6nAR0QA3E8xUmOlnjhfN0xrVU/Zqaazr18B116g3vf/OAknmvtfcb390V9IOW+UBEnbrGfQfmYGrlNRufRrHXm9LgbbSdFfAk4HGHcpKCdMWVwwbX++iXO+ui3XSdXtPVfb+qybaspH/UCFhrvdztqTcEH7qEKUTYWaXasNVNdsi3+EER2VMpGLGqZKq83+5iM0wFFYWmg9K0zpqYZYCgg4YdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6ihQIlBFXOr+3VOTpSMR4FZv7eW1Ctovsha02Us5uI=;
 b=enZYRps9DX3PejGJ5cK6H2yZy0MMS3OIuAElro0R6cEvg3izs0Uy8MSZBnYeFFJDy2NYHu/85Jms9LHjuuhEc9AzIKJOTVAwKMedufZjjMXOLNBZlcyZI1ep05oyfP+q0TJmqJhgDx4gTtp3jmDbd5ZX0TMzhLRpUD+5FCSGOUnYp0fxWAzBJ/rKkgPjotkgOjgSZ4g5cQ3tJppyfKtetPftUSBtb7iViAhfPfudX4fArKsQySIEatdEsoBwRrLcwmvdrUhBMJqUg1Z4fDiKN0XcJg8fxX1qEb0reUceUKZRK92VTABbdVCZTwSM+DLKk+uRJoJ6mGySQTKNwi2hNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN7PR15MB2273.namprd15.prod.outlook.com (2603:10b6:406:8a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:17:55 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:17:55 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 12/14] hw/misc: Add intel-me
Thread-Topic: [PATCH 12/14] hw/misc: Add intel-me
Thread-Index: AQHYinW/ZfSWeqTokUmC6QN0NBvBKa1kZBAAgAAFYgA=
Date: Tue, 28 Jun 2022 07:17:55 +0000
Message-ID: <244C5951-E151-492B-82E3-2C1EF0F27EA9@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com>
 <dc45e17c-a3e8-bc42-e1d5-0b636c1cf55d@kaod.org>
In-Reply-To: <dc45e17c-a3e8-bc42-e1d5-0b636c1cf55d@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9606dbf-5a2d-4149-04da-08da58d65245
x-ms-traffictypediagnostic: BN7PR15MB2273:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nBYds0QH9M8VbR3VGurnSZSG1JIs+MJ0Q87++Y4X7x/rJm8a5S6Zd2iss9TBO89ddNDSTHP2kxDyMLqOH5k/k6Dpg3nBE3Fk5E8CxL0hSWG6eD69Y5/U1S6FDq2Qvsa67Psl4dadkMf8l++FN2yTZ861i/io1PeCXVSTQwMXXEV5zpAIyBSvHP1Dj4ThAA6gf3OCJ7AJt2ZOibMje0q05eluw7XsN/gKf21RnK7UZGctYSit4AWbqBFtvELQISgvXSR/IG6jlqb+k/1pfIyv9OjUkUrXtDMLR3CAN8BZZHsgLAAhQnALhrtt7ZtJzJBQ+REezOlZuMbxltQwQlTZPok+jgA26bmBhpSWX5zV+eV3taoTblwqEXEFliTJ80u4If+lcwkTS59rHM7tMSbYKXZyBEy9CiipBYOWZgkvpxmTJDDE3ZQIwMwBDS75SLbUC3lOIfP0V+e+vbGSsq2rBSUtLSKn5Z1qU48kbOkJpwkpFXUGy3sqkQrCxgfV0GkHg/KieJE+k4RYTC8iRocGGS+PS0+lTPX0aAyXKulmOLsQWw+vUysHiLzCpj5QXdr8nw/7OYbeOkRcC2MnpnSUatNdrRddQaOnvHq4IdPZGXUDWw1LTYiA6cWOEkXUqdnjoSqzH9mzeHub4X3hJrL2UzgZTAvM3Mke1z+biVXni06e1XONl35TRQECM/mOdp2cbNph/k9P6XBO8A1zmzDFFSTFYxfDGyH6p1n//c0HP7Qv3OnjsFMZ4qWY29ETX0b3aUWjaQo53uXGUtGpIPGPRmrAGc+ZivKyD7hbjg0y3t0SFMrfw4KZ3cQ3Iniy/LhJvsRRtENZxq5GVyE9iPTzikS/It3mG1iQaushMeSBYrk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(53546011)(6506007)(122000001)(6512007)(8936002)(66476007)(8676002)(36756003)(109986005)(6486002)(76116006)(4326008)(83380400001)(478600001)(66946007)(66556008)(86362001)(186003)(91956017)(66446008)(64756008)(5660300002)(316002)(2616005)(38070700005)(71200400001)(41300700001)(33656002)(2906002)(54906003)(38100700002)(66574015)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlF4WlhlNUhLNmIreUlra2NlWFlsNDdyckJ4MUVyQ1U3amZXY1lVRWdpTDVy?=
 =?utf-8?B?dEZwVXIzaFU1Mmllcm42UXRkbXpjdGMydzdwampWSXF6NDBJaUZlTXF5L3Q2?=
 =?utf-8?B?UytCbnJSWHFvMFJiR2lwK3lnZTgxdkEvTnhXamlheVBqWFZZb1FZa05iSG10?=
 =?utf-8?B?bHVVNnlEditDWXkzWHl4TVVKMEZvbEZQSjZEVjVSZFQwQ1d6djliN2lGWEN1?=
 =?utf-8?B?Z0VLMXlyRi8vdG1iOFdjaTl4SUd1aHo2RTBvRXh2anplWVowVTRsRVRDY1ZY?=
 =?utf-8?B?V1h4NDlhYkJudE1DblJ3QlNZTjAvRXkzM0RHamxuZTYyY0FjY203TXlNZnVB?=
 =?utf-8?B?cFNhYkQxYkdEbEF3T1hkUmNJQnViS3JSV1E3WjZlUjlNRmNPbmF6U0pqeitH?=
 =?utf-8?B?NWpHMlh6VUg1RkRndzU3VnVqMiszclV2UXJ1ayttTHpHSlQyTUF3dDJOQ3ZR?=
 =?utf-8?B?QkJtTUZTUTE5YXJ5Rkord2tudEJza1l6Vlk0VGxQUzkzR0t1aERUd093MExn?=
 =?utf-8?B?eWhPZnN0am1iK2pabTFiMG5wa0U4OTdOazRxREpIcDJkQi81WXQzUXg0UVdT?=
 =?utf-8?B?VENsbEgzRE9zdHdTczN3alBjZm1iTmtWeGdmWXVpQ0Q0ZVo4V2pxYjBQbXIv?=
 =?utf-8?B?TzNoUjZhZTFHREhNR2tWdFdkSTJiVjlMU1I1Z3dRUzVpclF1bmEyNHpjM1BB?=
 =?utf-8?B?VU5qcmFSSVpoOUpieDlscVhGVXZ0RmlUNlNJUW96UGxQMmEzM2pRY3V6NVRx?=
 =?utf-8?B?Y0kySlZRWHU1T25BL3h0Y0tISWtCSEtyZ1lsU1dRQmZKaEptZHVnU1lUbzlr?=
 =?utf-8?B?YUx0VmhsQTArTFNCOHpGNmRqbS9uM1loZnVYME5vblNrUlFvNCtGZGxVekxz?=
 =?utf-8?B?bVVmOGFSTERPdUxBcFRpbFFOZXJWbTJQL0kzeUdvbjh6NzVEcmJPbk1XWFlS?=
 =?utf-8?B?MnltSkd1K3d6YnZCbUJSVGtzczNUM0QzbWpDN2lac2lTNlJHU3hTK2lNTHlX?=
 =?utf-8?B?NlRpajZ5akVnM051QjF1di9HS2tWMncxK2NmQkp6YW9lZVBUcGVrbE9zSzF0?=
 =?utf-8?B?T2w4bkh0R01YVDV5ZFVXcGViMkN1TFpxOTZUVUpWUlJzb2dIcVJxL0lGcVQ1?=
 =?utf-8?B?WGZvcUVWc2VpcnA2RCtaemRCNGJ4S3hOMHFYcGRxeUlVS3JvelI5cUZWZHZK?=
 =?utf-8?B?K3JvaURwZjhsQkZ4YS9rMnFtUFJWZlY2ZmN1bkxnejJCd25VeTY0d2Y3bmM4?=
 =?utf-8?B?c1R1dDU2TThydnQ4TWJNc09sY3FJNUtWUit3NGFaaFBPN0FPd3RoZUhIQm1E?=
 =?utf-8?B?L0NZaTdGNi9HTndLRDcyVXV0OThXaE1neVlXb05kMHpVeGJsSXNnVEV0UXdl?=
 =?utf-8?B?SmRSbFRKOE1zN0NoQjdrRGtRVFZyNTVFcE5Mc0NQTWhiZnJ1VmlENklVWlVZ?=
 =?utf-8?B?R3NuQUU5bENDMkNYNElFMWpobG81MFBWZi9CUjY4VGd6ZmlvSzdWOHZFQXFn?=
 =?utf-8?B?T3I0dXI5dlpNc2xqRDhoNHhQL1RMT3NxdWtrRmpXVGx1UmpybVMwL3VNbjMw?=
 =?utf-8?B?d24xWXcvc3pJc2JEYlh2c05RMFhuM2tFM1lxWm1NRHhidnRhTERqQ1hHc2dl?=
 =?utf-8?B?Nk1xRDVUVjNQUkpIa004ZndyZGNFblZ3TmcxZVh2ZHhPaDUzbU5wc1lVWFkr?=
 =?utf-8?B?NFBFclVSaCthd3c5STBDeDVaK1owL1Uxb0g4alhnVjRLWW1UNG10S2JEVlB2?=
 =?utf-8?B?SWs4NFB1Z1NGWnhPTzBwUXlVU3FqTTlCOVVpc01uWHZQYVlwVklMNW9PZ2x6?=
 =?utf-8?B?Y2JacC8wTmE1S29WbjJIdkpGQkQxWWlpSWUvaWQrRjBVaWx1VEx2WHpXaVJQ?=
 =?utf-8?B?OVpHYXdtUUU0dXd4Z1dQTGJ5VUhtVjRiOU5mRW5IUmRkajg5dTF5SlhZU0pE?=
 =?utf-8?B?MTV4bjNlUHJBeUwzd1JBRVVUTDVkOWwzWjZtSHk3Nzc5eDBhSFFNeEZZNzUz?=
 =?utf-8?B?MVBqenJNZ2JNRzYyaitoSVIrM0UvZmU5S1FCYWxNcUNSVXhwVFlZMnEvTWhE?=
 =?utf-8?B?ZTdMYUNvR0VYeUpTNUpmTjhLcHZpd3NQSklSVWg2RXpLb2FlaWxZdGdzOUpl?=
 =?utf-8?B?T01HZW9FWTNMbnhCMDZHRnBqek1oSElYUW5WdDFxN1hmWUU0Zi8yS0Vzenlx?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFB95ACE120B274FA7E96DBBD1B3FDFD@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9606dbf-5a2d-4149-04da-08da58d65245
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:17:55.2690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EydSXqx7eSUlCbf7iwdc5Mo9+YCdCxbaFDcUfKUthB5qMV72MxFARyKoykD6ss+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2273
X-Proofpoint-ORIG-GUID: QUCeY9F1Wt-Q3niE1jIjShPH-H3FOz7f
X-Proofpoint-GUID: QUCeY9F1Wt-Q3niE1jIjShPH-H3FOz7f
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7178e17cfc=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gSnVuIDI3LCAyMDIyLCBhdCAxMTo1OCBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiA2LzI4LzIyIDAwOjI3LCBQZXRlciBEZWxldm9y
eWFzIHdyb3RlOg0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+IA0KPiBJbnRybyA/DQoNClllcCwgd2lsbCBkbw0KDQo+IA0KPiBJIHdvdWxkIHJhdGhl
ciBoYXZlIDIgcGF0Y2hlcywgb25lIGZvciB0aGUgc2xhdmUgbW9kZWwgYW5kIG9uZSBhZGRpbmcN
Cj4gYSBkZXZpY2UgdG8gdGhlIG1hY2hpbmUuDQoNCkdvdCBpdCwgSeKAmWxsIHNwbGl0IGl0Lg0K
DQo+IA0KPiBQbGVhc2UgcmVwbGFjZSB0aGUgcHJpbnRmIHdpdGggdHJhY2UgZXZlbnRzLg0KDQpZ
ZWFoIHNvcnJ5IGFib3V0IHRoYXQNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCj4gDQo+PiAt
LS0NCj4+ICBody9hcm0vYXNwZWVkLmMgICAgIHwgICAxICsNCj4+ICBody9taXNjL2ludGVsX21l
LmMgIHwgMTc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAgaHcvbWlzYy9tZXNvbi5idWlsZCB8ICAgMyArLQ0KPj4gIDMgZmlsZXMgY2hhbmdlZCwgMTc5
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcv
bWlzYy9pbnRlbF9tZS5jDQo+PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZC5jIGIvaHcvYXJt
L2FzcGVlZC5jDQo+PiBpbmRleCAyYjljMTYwMGM2Li44OGU5YTQ3ZGMyIDEwMDY0NA0KPj4gLS0t
IGEvaHcvYXJtL2FzcGVlZC5jDQo+PiArKysgYi9ody9hcm0vYXNwZWVkLmMNCj4+IEBAIC0xNDQ3
LDYgKzE0NDcsNyBAQCBzdGF0aWMgdm9pZCBvYnkzNV9jbF9pMmNfaW5pdChBc3BlZWRNYWNoaW5l
U3RhdGUgKmJtYykNCj4+ICAgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzFdLCAidG1w
MTA1IiwgMHg0YSk7DQo+PiAgICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1sxXSwgImFk
bTEyNzIiLCAweDQwKTsNCj4+ICAgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzFdLCAi
dG1wNDIxIiwgMHg0Yyk7DQo+PiArICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1syXSwg
ImludGVsLW1lIiwgMHgxNik7DQo+PiAgICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s0
XSwgImlzbDY5MjU5IiwgMHg3Nik7DQo+PiAgICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGky
Y1s0XSwgImlzbDY5MjU5IiwgMHg2Mik7DQo+PiAgICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxl
KGkyY1s0XSwgImlzbDY5MjU5IiwgMHg2MCk7DQo+PiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9pbnRl
bF9tZS5jIGIvaHcvbWlzYy9pbnRlbF9tZS5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4g
aW5kZXggMDAwMDAwMDAwMC4uZmRjOTE4MGMyNg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIv
aHcvbWlzYy9pbnRlbF9tZS5jDQo+PiBAQCAtMCwwICsxLDE3NiBAQA0KPj4gKy8qDQo+PiArICog
Q29weXJpZ2h0IChjKSBNZXRhIFBsYXRmb3JtcywgSW5jLiBhbmQgYWZmaWxpYXRlcy4gKGh0dHA6
Ly93d3cubWV0YS5jb20pDQo+PiArICoNCj4+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFu
dGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5DQo+PiAr
ICogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0
aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwNCj4+ICsgKiBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCBy
ZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzDQo+PiAr
ICogdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJs
aWNlbnNlLCBhbmQvb3Igc2VsbA0KPj4gKyAqIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0
byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcw0KPj4gKyAqIGZ1cm5pc2hl
ZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQo+PiArICoN
Cj4+ICsgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5v
dGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbg0KPj4gKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRp
YWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLg0KPj4gKyAqDQo+PiArICogVEhFIFNPRlRXQVJF
IElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJF
U1MgT1INCj4+ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBX
QVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwNCj4+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTA0KPj4g
KyAqIFRIRSBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENM
QUlNLCBEQU1BR0VTIE9SIE9USEVSDQo+PiArICogTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFD
VElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwNCj4+ICsg
KiBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9S
IE9USEVSIERFQUxJTkdTIElODQo+PiArICogVEhFIFNPRlRXQVJFLg0KPj4gKyAqLw0KPj4gKw0K
Pj4gKyNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgInFlbXUvbWFpbi1sb29w
LmgiDQo+PiArI2luY2x1ZGUgImh3L2kyYy9pMmMuaCINCj4+ICsNCj4+ICsjZGVmaW5lIFRZUEVf
SU5URUxfTUUgImludGVsLW1lIg0KPj4gK09CSkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKEludGVs
TUVTdGF0ZSwgSU5URUxfTUUpOw0KPj4gKw0KPj4gKyNkZWZpbmUgcHJpbnRmKC4uLikNCj4+ICsN
Cj4+ICtzdHJ1Y3QgSW50ZWxNRVN0YXRlIHsNCj4+ICsgICAgSTJDU2xhdmUgcGFyZW50X29iajsN
Cj4+ICsNCj4+ICsgICAgSTJDQnVzICpidXM7DQo+PiArICAgIFFFTVVCSCAqYmg7DQo+PiArICAg
IGludCByeF9sZW47DQo+PiArICAgIGludCB0eF9sZW47DQo+PiArICAgIGludCB0eF9wb3M7DQo+
PiArICAgIHVpbnQ4X3QgcnhfYnVmWzUxMl07DQo+PiArICAgIHVpbnQ4X3QgdHhfYnVmWzUxMl07
DQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBpbnRlbF9tZV9iaCh2b2lkICpvcGFxdWUp
DQo+PiArew0KPj4gKyAgICBJbnRlbE1FU3RhdGUgKnMgPSBvcGFxdWU7DQo+PiArDQo+PiArICAg
IGFzc2VydChzLT5idXMtPmJoID09IHMtPmJoKTsNCj4+ICsNCj4+ICsgICAgaWYgKHMtPnR4X3Bv
cyA9PSAwKSB7DQo+PiArICAgICAgICBpZiAoaTJjX3N0YXJ0X3NlbmRfYXN5bmMocy0+YnVzLCBz
LT50eF9idWZbcy0+dHhfcG9zKytdKSAhPSAwKSB7DQo+PiArICAgICAgICAgICAgZ290byBkb25l
Ow0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+
PiArICAgIGlmIChzLT50eF9wb3MgPCBzLT50eF9sZW4pIHsNCj4+ICsgICAgICAgIGlmIChpMmNf
c2VuZF9hc3luYyhzLT5idXMsIHMtPnR4X2J1ZltzLT50eF9wb3MrK10pICE9IDApIHsNCj4+ICsg
ICAgICAgICAgICBnb3RvIGRvbmU7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICByZXR1cm47
DQo+PiArICAgIH0NCj4+ICsNCj4+ICtkb25lOg0KPj4gKyAgICBpMmNfZW5kX3RyYW5zZmVyKHMt
PmJ1cyk7DQo+PiArICAgIGkyY19idXNfcmVsZWFzZShzLT5idXMpOw0KPj4gKyAgICBzLT50eF9s
ZW4gPSAwOw0KPj4gKyAgICBzLT50eF9wb3MgPSAwOw0KPj4gKyAgICBtZW1zZXQocy0+dHhfYnVm
LCAwLCBzaXplb2Yocy0+dHhfYnVmKSk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGlu
dGVsX21lX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+
ICsgICAgSW50ZWxNRVN0YXRlICpzID0gSU5URUxfTUUoZGV2KTsNCj4+ICsNCj4+ICsgICAgcy0+
YnVzID0gSTJDX0JVUyhxZGV2X2dldF9wYXJlbnRfYnVzKGRldikpOw0KPj4gKyAgICBzLT5iaCA9
IHFlbXVfYmhfbmV3KGludGVsX21lX2JoLCBzKTsNCj4+ICsgICAgcy0+cnhfbGVuID0gMDsNCj4+
ICsgICAgcy0+dHhfbGVuID0gMDsNCj4+ICsgICAgcy0+dHhfcG9zID0gMDsNCj4+ICsgICAgbWVt
c2V0KHMtPnJ4X2J1ZiwgMCwgc2l6ZW9mKHMtPnJ4X2J1ZikpOw0KPj4gKyAgICBtZW1zZXQocy0+
dHhfYnVmLCAwLCBzaXplb2Yocy0+dHhfYnVmKSk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB1
aW50OF90IGNoZWNrc3VtKGNvbnN0IHVpbnQ4X3QgKnB0ciwgaW50IGxlbikNCj4+ICt7DQo+PiAr
ICAgIGludCBzdW0gPSAwOw0KPj4gKw0KPj4gKyAgICBmb3IgKGludCBpID0gMDsgaSA8IGxlbjsg
aSsrKSB7DQo+PiArICAgICAgICBzdW0gKz0gcHRyW2ldOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIHJldHVybiAyNTYgLSBzdW07DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgaW50ZWxf
bWVfaTJjX2V2ZW50KEkyQ1NsYXZlICppMmMsIGVudW0gaTJjX2V2ZW50IGV2ZW50KQ0KPj4gK3sN
Cj4+ICsgICAgSW50ZWxNRVN0YXRlICpzID0gSU5URUxfTUUoaTJjKTsNCj4+ICsNCj4+ICsgICAg
c3dpdGNoIChldmVudCkgew0KPj4gKyAgICBjYXNlIEkyQ19TVEFSVF9SRUNWOg0KPj4gKyAgICAg
ICAgYnJlYWs7DQo+PiArICAgIGNhc2UgSTJDX1NUQVJUX1NFTkQ6DQo+PiArICAgICAgICBzLT5y
eF9sZW4gPSAwOw0KPj4gKyAgICAgICAgbWVtc2V0KHMtPnJ4X2J1ZiwgMCwgc2l6ZW9mKHMtPnJ4
X2J1ZikpOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIGNhc2UgSTJDX1NUQVJUX1NFTkRf
QVNZTkM6DQo+PiArICAgICAgICBicmVhazsNCj4+ICsgICAgY2FzZSBJMkNfRklOSVNIOg0KPj4g
KyAgICAgICAgcHJpbnRmKCJJbnRlbE1FIHJ4OiBbIik7DQo+PiArICAgICAgICBmb3IgKGludCBp
ID0gMDsgaSA8IHMtPnJ4X2xlbjsgaSsrKSB7DQo+PiArICAgICAgICAgICAgaWYgKGkpIHsNCj4+
ICsgICAgICAgICAgICAgICAgcHJpbnRmKCIsICIpOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICsg
ICAgICAgICAgICBwcmludGYoIjB4JTAyeCIsIHMtPnJ4X2J1ZltpXSk7DQo+PiArICAgICAgICB9
DQo+PiArICAgICAgICBwcmludGYoIl1cbiIpOw0KPj4gKw0KPj4gKyAgICAgICAgcy0+dHhfbGVu
ID0gMTA7DQo+PiArICAgICAgICBzLT50eF9wb3MgPSAwOw0KPj4gKyAgICAgICAgcy0+dHhfYnVm
WzBdID0gcy0+cnhfYnVmWzJdOw0KPj4gKyAgICAgICAgcy0+dHhfYnVmWzFdID0gKChzLT5yeF9i
dWZbMF0gPj4gMikgKyAxKSA8PCAyOw0KPj4gKyAgICAgICAgcy0+dHhfYnVmWzJdID0gMjU2IC0g
cy0+dHhfYnVmWzBdIC0gcy0+dHhfYnVmWzFdOw0KPj4gKyAgICAgICAgcy0+dHhfYnVmWzNdID0g
aTJjLT5hZGRyZXNzOyAvLyByc1NBIHJlc3BvbnNlIFNsYXZlIEFkZHJlc3MNCj4+ICsgICAgICAg
IHMtPnR4X2J1Zls0XSA9IChzLT5yeF9idWZbM10gPj4gMikgPDwgMjsgLy8gc2VxdWVuY2UgbnVt
YmVyDQo+PiArICAgICAgICBzLT50eF9idWZbNV0gPSBzLT5yeF9idWZbNF07IC8vIFNhbWUgY29t
bWFuZCBjb2RlDQo+PiArICAgICAgICBzLT50eF9idWZbNl0gPSAweDAwOyAvLyBPSw0KPj4gKyAg
ICAgICAgcy0+dHhfYnVmWzddID0gMHg1NTsgLy8gTk9fRVJST1INCj4+ICsgICAgICAgIHMtPnR4
X2J1Zls4XSA9IDB4MDA7DQo+PiArICAgICAgICBzLT50eF9idWZbOV0gPSBjaGVja3N1bShzLT50
eF9idWYsIHMtPnR4X2xlbiAtIDEpOw0KPj4gKyAgICAgICAgcy0+dHhfYnVmWzBdID4+PSAxOw0K
Pj4gKyAgICAgICAgaTJjX2J1c19tYXN0ZXIocy0+YnVzLCBzLT5iaCk7DQo+PiArICAgICAgICBi
cmVhazsNCj4+ICsgICAgY2FzZSBJMkNfTkFDSzoNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdWlu
dDhfdCBpbnRlbF9tZV9pMmNfcmVjdihJMkNTbGF2ZSAqaTJjKQ0KPj4gK3sNCj4+ICsgICAgcmV0
dXJuIDB4ZmY7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgaW50ZWxfbWVfaTJjX3NlbmQo
STJDU2xhdmUgKmkyYywgdWludDhfdCBkYXRhKQ0KPj4gK3sNCj4+ICsgICAgSW50ZWxNRVN0YXRl
ICpzID0gSU5URUxfTUUoaTJjKTsNCj4+ICsNCj4+ICsgICAgYXNzZXJ0KHMtPnJ4X2xlbiA8IHNp
emVvZihzLT5yeF9idWYpKTsNCj4+ICsgICAgcy0+cnhfYnVmW3MtPnJ4X2xlbisrXSA9IGRhdGE7
DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBp
bnRlbF9tZV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4+ICt7DQo+
PiArICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFTUyhvYyk7DQo+PiArICAgIEkyQ1Ns
YXZlQ2xhc3MgKmkyYyA9IEkyQ19TTEFWRV9DTEFTUyhvYyk7DQo+PiArDQo+PiArICAgIGRjLT5y
ZWFsaXplID0gaW50ZWxfbWVfcmVhbGl6ZTsNCj4+ICsgICAgaTJjLT5ldmVudCA9IGludGVsX21l
X2kyY19ldmVudDsNCj4+ICsgICAgaTJjLT5yZWN2ID0gaW50ZWxfbWVfaTJjX3JlY3Y7DQo+PiAr
ICAgIGkyYy0+c2VuZCA9IGludGVsX21lX2kyY19zZW5kOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgY29uc3QgVHlwZUluZm8gdHlwZXNbXSA9IHsNCj4+ICsgICAgew0KPj4gKyAgICAgICAgLm5h
bWUgPSBUWVBFX0lOVEVMX01FLA0KPj4gKyAgICAgICAgLnBhcmVudCA9IFRZUEVfSTJDX1NMQVZF
LA0KPj4gKyAgICAgICAgLmluc3RhbmNlX3NpemUgPSBzaXplb2YoSW50ZWxNRVN0YXRlKSwNCj4+
ICsgICAgICAgIC5jbGFzc19pbml0ID0gaW50ZWxfbWVfY2xhc3NfaW5pdCwNCj4+ICsgICAgfSwN
Cj4+ICt9Ow0KPj4gKw0KPj4gK0RFRklORV9UWVBFUyh0eXBlcyk7DQo+PiBkaWZmIC0tZ2l0IGEv
aHcvbWlzYy9tZXNvbi5idWlsZCBiL2h3L21pc2MvbWVzb24uYnVpbGQNCj4+IGluZGV4IDFlZGFk
NDRiNmIuLmEyYzc1ODk0YTMgMTAwNjQ0DQo+PiAtLS0gYS9ody9taXNjL21lc29uLmJ1aWxkDQo+
PiArKysgYi9ody9taXNjL21lc29uLmJ1aWxkDQo+PiBAQCAtMTE4LDcgKzExOCw4IEBAIHNvZnRt
bXVfc3MuYWRkKHdoZW46ICdDT05GSUdfQVNQRUVEX1NPQycsIGlmX3RydWU6IGZpbGVzKA0KPj4g
ICAgJ2FzcGVlZF9zZG1jLmMnLA0KPj4gICAgJ2FzcGVlZF94ZG1hLmMnLA0KPj4gICAgJ2FzcGVl
ZF9wZWNpLmMnLA0KPj4gLSAgJ2ZieTM1X2NwbGQuYycpKQ0KPj4gKyAgJ2ZieTM1X2NwbGQuYycs
DQo+PiArICAnaW50ZWxfbWUuYycpKQ0KPj4gICAgc29mdG1tdV9zcy5hZGQod2hlbjogJ0NPTkZJ
R19NU0YyJywgaWZfdHJ1ZTogZmlsZXMoJ21zZjItc3lzcmVnLmMnKSkNCj4+ICBzb2Z0bW11X3Nz
LmFkZCh3aGVuOiAnQ09ORklHX05SRjUxX1NPQycsIGlmX3RydWU6IGZpbGVzKCducmY1MV9ybmcu
YycpKQ0KPiANCg0K

