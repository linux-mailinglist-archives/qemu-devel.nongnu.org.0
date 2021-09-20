Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F34128F6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:36:58 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRuD-0002jw-JN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mSRVq-0005GS-0X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:11:46 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:62972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mSRVm-0004FJ-ON
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1632175902; x=1632780702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nd+jh5gpyt/AO0v4xiZf9zW1Ckr+pRfrMsehmFlLV8k=;
 b=bXxIf61DfUO9qEv3ovB4lVU3TY2b+8EbgWjWHUefMMdgJTADQ0ut/BiP
 qEyccHwKZLDV5+36dDMXP/c1W1FQDAkMQdVlERruxo7brdF/afyc5XSrg
 fXDxgCRoxcHaFZLxE4NpnNU6gy6rZqQqaoBCdsZsADr4xS4F6F/bFtLcG Q=;
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 22:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRbcnr5uPquNuOJfHt9n+fXmmbrhEueRADFOQm0bdRcLhgg89bzLvaeg3elk9Iir/8Wnjj6WX82I+gEZswBmnUiJ3ffB9SDItpKSO4NpY5bvZW7EjQJQ3nX4F/5h343J8/ymho29RWYaCU2N1W86BC5rfOiT0H2h7ZsNZYmgrv+Lr04I8hJ2k2yLiEIokj8CQXgVOvePrD2cs9xVgo5vGE5GosGVPIAR6TRGwckdw802Yi+W3wKqvB8zHcTSnoRx7c8GEurOqP9VaeJMRMUo1xHiPF8PKxtKE0VDurbOxNzg83siX6ldNcc/UDT9sYe/VERmJjptMcpd+k3yh0jetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Nd+jh5gpyt/AO0v4xiZf9zW1Ckr+pRfrMsehmFlLV8k=;
 b=ZL5Zd3CIvLd1fSGmaoE5VkCt6psCbV2CK9bdFHcb9ZZGYs2rwgKP5up1hmHTrO7cdOQ4qKpGtWuuijErWJq+E7wqYmeDyGr4CPI7b2fJ7PD2Zv+PegL/A2Q0Gis2zJMokLHfjUTxwgMEgHXyyo5991y+ZF+/hBTgVOtYNOx6Hw85clo6Zka95fL1sKSAOhGYt77PXcbgmojXm8AFYoRI44pbx25BCbeCxP0S+Qms86id8hp6qR//sw5eu2irBGoLOZ9/GgGD67vYZupuPI0A+3mBjTF33LKhMz8/vgJOLBY6rZFjHVSJP9mgJzKLHegpyOUJO37eRnYhHYcrKsnT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7373.namprd02.prod.outlook.com (2603:10b6:a03:290::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 22:11:32 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::351d:3400:b3d0:b000%3]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 22:11:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Thread-Topic: [PATCH v3 15/30] Hexagon HVX (target/hexagon) helper overrides -
 vector assign & cmov
Thread-Index: AQHXrmXtadbx0XR5nUWV5n7Pddl4uauteMWAgAABmUA=
Date: Mon, 20 Sep 2021 22:11:30 +0000
Message-ID: <BYAPR02MB48862875A7931672407F7DE5DEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-16-git-send-email-tsimpson@quicinc.com>
 <371cc703-f0ce-552b-fa49-9cea36ce4532@amsat.org>
In-Reply-To: <371cc703-f0ce-552b-fa49-9cea36ce4532@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 527654a2-f5ec-4e66-9924-08d97c839a3e
x-ms-traffictypediagnostic: SJ0PR02MB7373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB73733BF509FB069DCEC55928DEA09@SJ0PR02MB7373.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VEAZhyn9O+vnIqXgnqoY146dYuKK0H4cZdcJ68LLqUxgyVh9xV2uCJIKkZiGHAJ1rp3Rmo1mbOvS5p/gT5RnLi8yXt5xnzrG4O0JgeOQY0CY4Ba2vmONDZlvzAxqaHRbeiYWDJGR89aW0hMzz6itu8m9qzPcd1cu94qPP6SMEsgZN4tA15sru3522+sb4EGWGDhCdlMnTIsjpYv5ZULP83v/nx8Ask9yXrPcXwEfJN7XlzHWOVX6emUytrs6jTovWeLkRZqjYQYPTN/JeS6hSVnpcBqRFzmbowT6qDRrzdmovXSEWt2AJh0aOFW4AVVRHJj11A2be2TfKslAZsmpZE6baDWja8f/9vIYJzOMfg4j3Z61WtedU2mlqcyld8rH9YDoZjOmIbqyJn44dE/QEBfw6NOlQqHetVgJ/lw4qaWa6XUFJKVw6d9jVVOnv2BYuw2kwe9M0+JvgWq6HziZ//arcUAPD6dketuNDzPBpo1eroCPPxr90EVcSs5N7vHexoOFw36Cudz5/Ggdlh37mUICJpz6a48rU4I1xm1ZRMxjQjIfdWQRHKDL/9rhLjYSBgvGUxxy5yIS2KNQoCitBWnu5711lVf5/XjnISj1dfi9eXhIfGFW86LCJ8MCcqmRQasqqF2NukNUGXrARNwVhXfLxE/6QPWHRG6NVljtg9stMfwRGUnGtrdZ+GrNH6r0nHDsin+3wO2qSRDks+vMCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(64756008)(66556008)(66446008)(66946007)(8936002)(66476007)(8676002)(52536014)(26005)(38070700005)(71200400001)(38100700002)(122000001)(86362001)(186003)(76116006)(4326008)(478600001)(6506007)(110136005)(83380400001)(54906003)(2906002)(33656002)(9686003)(53546011)(316002)(5660300002)(55016002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ty9McW05WDRYR0x3YUMzbUxYRC9DUnVpVG1kaDJpa1dha0dicy9SV0hEbjRJ?=
 =?utf-8?B?S3FJMExod1BxdFM2U0V6ZlBtYUVTcTlhbklMQU5JSkx6V0pkenV3a2poQ1J5?=
 =?utf-8?B?MWxRcWFpaEtidVp2VlpiUW1Xc2gzcHdlZy8rSzJXQTJsb3dDRXpJT25laHBV?=
 =?utf-8?B?ZmVEN2I0OUkxOGJYN2FxL2xzQjJiZy9Ya3hxSjhaUzFjRFBFWVhaMWxEeS82?=
 =?utf-8?B?eElGdUE2LzdLaFNVMEV1a3pKaGpibjdweEpCTzBwQVJqNnZLZER4ZUxrZXpv?=
 =?utf-8?B?QkhWeENKaGxWSG1qNHJTUURkaG5wMU14M25nb0xDYjkvKzJMTWlsNStFdUE5?=
 =?utf-8?B?c2t1NmxUcjhWWk5lRTNrTkNXVWtEZk1Yb2dkeUxCVTF6dEVrN3NUVzVDYzl4?=
 =?utf-8?B?NWV0YXd4dS81Y2JJSGVVZFZNV2lJdHNFVnRxVndLSmhDaThaWkRRY2xKNklB?=
 =?utf-8?B?aGsyQmR3RXV4TTBsbHZ3Z3dBMk5ndGFNSFpJNysweDFTL1NFbkhvY1F2Z0Yx?=
 =?utf-8?B?VEFLVEVydm9menNvdmFBMFpRMTE0aUlXaWhTVVVReHU4bGJrVGhhcHB0T1k4?=
 =?utf-8?B?dEFoNnlHRmtxcmh2OVVsNms5VFdrK2tKRGV1aHloTWNicS9uZ1lzYUJ6UDN1?=
 =?utf-8?B?QU01RDRZS0Viajg5SCs1dmR0a0NMb1liT2lYZENkRi9vQTVDajNPUy9XZHkr?=
 =?utf-8?B?cXBiMGVUN0xHbXRzU3VGM3RlbmYxL2s5WEpLUXFOUzU0RnAyUWxBTm0wdDAy?=
 =?utf-8?B?T3BvSWdWWFdGTlVGcXV5aTMxdHppdmI4QUl6NEg4aDhCNWw0UUx0WE42TFdw?=
 =?utf-8?B?Qi82b20veXVQM1pyQTUyU1dsajNLQ1cvemxBTmt2cnNndHJYK0QxazZEN1RV?=
 =?utf-8?B?TTRxR083ZGc5YjlSTUp3ZWs4RlhJTElraE1mNE83TmdpU3A4eUt5bjZLQ2sw?=
 =?utf-8?B?c0NjZWZPOG5JNk1VZWpPRWROVjk4azVDNm5aL3VYNks2VC9UWnBoc3ZSTGNY?=
 =?utf-8?B?TW5uZWhrK0NxOFZndVBwY3FHNVRJcXVCMWlXRTN2Sk16TWdOS3NVWVpQWHhh?=
 =?utf-8?B?NmVQS3U1QU5UN0NIN2EvT3YyUnY4YlB0WnpOYkQva0ZCeWdTVkJIZ0dLR1ZD?=
 =?utf-8?B?U250SmFSOGtvWFR3djRodFAvclZmbnNyMU0wZ3l0djBQTm9ZYTBhZ3NWc1NX?=
 =?utf-8?B?QzNycyt4TEpUeGpNU1YwTTZEVHRpZlFnMm5xVXFZNWFSM3M5UlhQNHZaNkJw?=
 =?utf-8?B?RjhMUENLR1hqcUx4Q09sQmUxZCsvR0dnTEMveTduOFQrYUN3MGUxa2dwUlJo?=
 =?utf-8?B?MzNpYlJWUmV2dGRCZFhOYTlzSzlpbDBUdU9Kdk1VZCtVeElHb3BTR0xUOUhp?=
 =?utf-8?B?SkIzNFZoL0NzWlQ2UzJYL2dWbEV2YWczck5RNUpBODA2K0oxK2lNNjJxZFc5?=
 =?utf-8?B?WFVXMWtWZWF3Wng4cEdIdStqYnZkRGlxK3BWTGV4YVpaQVc4REMyV01YNVpo?=
 =?utf-8?B?Y3R2bko0UHpRWHpFR3Rkc1NTank5TVpHNlpJZmFySzMveHBoUWd2UG51aEQ2?=
 =?utf-8?B?UU9QSnFtMUZXM1VvTFZMbXdranFLSzB3VlV1alpkODd2WDh4NmVlUDQxZHMy?=
 =?utf-8?B?b1NvcnAwemgycVpObHpQemlCZzcweVgwRU9KQW9LNVBJdy9rUWtKWFZCZGFt?=
 =?utf-8?B?Ukh5azZFNkdZVW5kY3NpdTA5MkhQbWFKakRyK2xzZWU1TnVqV3lHMlkwOS9I?=
 =?utf-8?Q?JCsGCZ6Y4RYjd7yCcEJ07hNF7S6KzzFuHqwi3DR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527654a2-f5ec-4e66-9924-08d97c839a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 22:11:30.5587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 805Y9kmm1Y6qudmuEsTFqUUaZHu+/VvLAe4DhQGBdsvS/PyUaDqrfLpfctjX9zFCuk3ghhpAPyuPY4/TM/RK7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7373
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjAs
IDIwMjEgNDo1OSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluIDxi
Y2FpbkBxdWljaW5jLmNvbT47DQo+IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MyAxNS8zMF0gSGV4YWdvbiBIVlggKHRhcmdldC9oZXhhZ29uKSBo
ZWxwZXINCj4gb3ZlcnJpZGVzIC0gdmVjdG9yIGFzc2lnbiAmIGNtb3YNCj4gDQo+IE9uIDkvMjAv
MjEgMjM6MjQsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZ19odnguaCB8IDMxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oDQo+ID4gYi90YXJnZXQvaGV4YWdv
bi9nZW5fdGNnX2h2eC5oIGluZGV4IGViMjk1NjYuLmJjZDUzZDQgMTAwNjQ0DQo+ID4gLS0tIGEv
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaA0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2dfaHZ4LmgNCj4gPiBAQCAtMTI2LDQgKzEyNiwzNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
YXNzZXJ0X3ZoaXN0X3RtcChEaXNhc0NvbnRleHQNCj4gKmN0eCkNCj4gPiAgICAgIH0gd2hpbGUg
KDApDQo+ID4NCj4gPg0KPiA+ICsjZGVmaW5lIGZHRU5fVENHX1Y2X3Zhc3NpZ24oU0hPUlRDT0RF
KSBcDQo+ID4gKyAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBWZFZfb2ZmLCBWdVZfb2ZmLCBc
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZl
Y3RvcikpDQo+ID4gKw0KPiA+ICsvKiBWZWN0b3IgY29uZGl0aW9uYWwgbW92ZSAqLw0KPiA+ICsj
ZGVmaW5lIGZHRU5fVENHX1ZFQ19DTU9WKFBSRUQpIFwNCj4gPiArICAgIGRvIHsgXA0KPiA+ICsg
ICAgICAgIFRDR3YgbHNiID0gdGNnX3RlbXBfbmV3KCk7IFwNCj4gPiArICAgICAgICBUQ0dMYWJl
bCAqZmFsc2VfbGFiZWwgPSBnZW5fbmV3X2xhYmVsKCk7IFwNCj4gPiArICAgICAgICBUQ0dMYWJl
bCAqZW5kX2xhYmVsID0gZ2VuX25ld19sYWJlbCgpOyBcDQo+ID4gKyAgICAgICAgdGNnX2dlbl9h
bmRpX3RsKGxzYiwgUHNWLCAxKTsgXA0KPiA+ICsgICAgICAgIHRjZ19nZW5fYnJjb25kaV90bChU
Q0dfQ09ORF9ORSwgbHNiLCBQUkVELCBmYWxzZV9sYWJlbCk7IFwNCj4gPiArICAgICAgICB0Y2df
dGVtcF9mcmVlKGxzYik7IFwNCj4gPiArICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBW
ZFZfb2ZmLCBWdVZfb2ZmLCBcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
TU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKTsgXA0KPiA+ICsgICAgICAgIHRjZ19nZW5fYnIo
ZW5kX2xhYmVsKTsgXA0KPiA+ICsgICAgICAgIGdlbl9zZXRfbGFiZWwoZmFsc2VfbGFiZWwpOyBc
DQo+ID4gKyAgICAgICAgdGNnX2dlbl9vcmlfdGwoaGV4X3Nsb3RfY2FuY2VsbGVkLCBoZXhfc2xv
dF9jYW5jZWxsZWQsIFwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAxIDw8IGluc24tPnNs
b3QpOyBcDQo+ID4gKyAgICAgICAgZ2VuX3NldF9sYWJlbChlbmRfbGFiZWwpOyBcDQo+ID4gKyAg
ICB9IHdoaWxlICgwKQ0KPiANCj4gV2h5IGEgbWFjcm8gYW5kIG5vdCBhIChldmVudHVhbGx5IGlu
bGluZWQpIGZ1bmN0aW9uPw0KDQpJIG1ha2UgdGhlc2UgbWFjcm9zIHRvIGJlIGNvbnNpc3RlbnQg
YWNyb3NzIHRoZSBkaWZmZXJlbnQgb3ZlcnJpZGVzLiAgVGhpcyBvbmUgY291bGQgZWFzaWx5IGJl
IGEgZnVuY3Rpb24sIGJ1dCBvdGhlcnMgY2Fubm90LiAgRm9yIGV4YW1wbGUsIGZHRU5fVENHX1ZF
Q19DTVBfT1AgY2FuJ3QgLSBzZWUgcGF0Y2ggMjAvMzAuDQoNCkhhdmluZyBzYWlkIHRoYXQsIEkg
Y2FuIGNoYW5nZSBvbmx5IHRoZSBvbmVzIHRoYXQgZG9uJ3QgbmVlZCB0byBiZSBtYWNyb3MgaW50
byBmdW5jdGlvbnMgaWYgdGhhdCBpcyBwcmVmZXJyZWQuDQoNCg0KVGhhbmtzLA0KVGF5bG9yDQoN
Cg0K

