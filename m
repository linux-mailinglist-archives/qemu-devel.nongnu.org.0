Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A15355DF9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:32:40 +0200 (CEST)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTtJP-0007Ic-34
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtII-0006a6-Pw
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:31:31 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:40642)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTtIE-0005Bp-AD
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617744686; x=1649280686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o2hqu4IXKEIYpO8GeqiXUSx3byl0Du7ELb9YHCmMBIU=;
 b=PrY73Hel3Q3gbt8D2tbYNwqW20jLWiDD3yOp827u/5up8i8eoDq/05ML
 HO/leYusau+XOMF7u4QpEPYUi8jGW7kxCVzN33tBgpnMqAcoa8BvIe9R5
 75fgi1F3RPonxV1H9jOhfsbvRAG6dusBrsf5SvtWEixe/J/dO+3VyYhVF E=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Apr 2021 14:31:21 -0700
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 14:31:21 -0700
Received: from nasanexm03c.na.qualcomm.com (10.85.0.106) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 14:31:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 14:31:20 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6964.namprd02.prod.outlook.com (2603:10b6:a03:23a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 21:31:19 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 21:31:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 14/21] Hexagon (target/hexagon) add A5_ACS (vacsh)
Thread-Topic: [PATCH v2 14/21] Hexagon (target/hexagon) add A5_ACS (vacsh)
Thread-Index: AQHXJqqd9fAz1JDY6E+F1sNmTdztqaqn/9qAgAAKsxA=
Date: Tue, 6 Apr 2021 21:31:19 +0000
Message-ID: <BYAPR02MB488680E8175A8E1895146539DE769@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-15-git-send-email-tsimpson@quicinc.com>
 <f442b907-3e48-a452-9f6a-913d15296309@linaro.org>
In-Reply-To: <f442b907-3e48-a452-9f6a-913d15296309@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef5d4e6c-3488-4100-78e9-08d8f9435164
x-ms-traffictypediagnostic: BY5PR02MB6964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB696470048C5F1D154B284034DE769@BY5PR02MB6964.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1usv43b9AQHF5G8BvFx4USfrWFzer0pdONM8p7nmyKImq6WnqtzKdeGhhJ+AAaJlRAoI7Wi4+SYp/cW2UIxf3F+tNQPhHknwSSpN0CTHpZH8xzr/8wGxMd8kjK2pbLBOeolo/QEtEEjRTCs7IOErz1GZtmZobthwBVMcKhG4C2QyFBgJaLnc27BXU2JBip9F9XsIO1AeYBLl9X08eEAIgQxhAA9wU396Q+32m1gUXIFFmYWfPq1lTdAe6PzZjuddm346nQqtY1H29yeeUYrI9sbNBZXFD7lnbw+RBWmZ4CHjglG0N13HW8Vd2qJctExge4fYkZkyJQ9YsKxK/BBxKvjNNCkfIB/sHAvbzYca8FM8/ezVu8qkMVGOLd+MpwAgSD5HToBMg/0ulotF95+bu3Ren/fX9dI+Eble4n9m04MMHzstWhCRRWIObZU+FzauMikK6aC99B1jGjnYio4IAOhe+kyXruWbJdcTQSkacgmyziWCi5tPZJxnUv6Eyik/NC0ifx7SMpvJStAgY8L4yzhLE+GqdIokGN4VIz6GNT1tTeZ76j+r5iUNpNTOxvYarn4yxYHWvLxxZbWBO3+gW5LVu5BlmEyDTTEQFltw5OtUUuTML3qJZmTNbzzrcQCTcxrIsDU2r3zr1AZh/EOTLQIAhtAF5VedaD/2LUq0Uyk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(2906002)(5660300002)(76116006)(7696005)(54906003)(71200400001)(186003)(8676002)(9686003)(64756008)(66556008)(66446008)(66476007)(478600001)(316002)(4744005)(6506007)(55016002)(66946007)(38100700001)(4326008)(8936002)(107886003)(26005)(83380400001)(33656002)(110136005)(53546011)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXpEKzZBcWdNM1NLU0wwdFdVbzVmRWg2K2gwODhpbndNd2ZlKy9ORXZYWUR0?=
 =?utf-8?B?U0JiaEM3OU0vOTdTMlkwN1lxUEFyelc1YjRQMG0yNklDZ2Z1YWl0NjNLa3Y5?=
 =?utf-8?B?S3FjbVF1NjBMMHNkemVVb0R0aStRT2c0bElhT3ROZ1RweFhwMVJEQk1SMGVI?=
 =?utf-8?B?OUh6SmN1Z0VMcng2ajc5eXdKMG1FTFpGMFd6eDltLzlFeG1rdDRCbEI4RmZF?=
 =?utf-8?B?NEprRHVRT0xvblpRSlBWNVdwQXZJZWNqTU9nWVdkZGV5NWQ0b2hDTFhtcThN?=
 =?utf-8?B?bDRCbG9uVi9xa1ZnQnZTWGMrZ0V2MmZqTHh1ajMrQUJNRlZwR2YrR0RaWEFX?=
 =?utf-8?B?K1B3MWtZUEdUQTNwYjVYVWhsa3J4dWRTNUFvNmYyRmN1OFRLNlVPWFhDZWt4?=
 =?utf-8?B?cnNNQStua1I2UW5PZkFmQUhQM3R5NWo0dzd3Y3Y1Vkh1S0U2ZWh6S1FLVkph?=
 =?utf-8?B?d3hUT3ZBOWJ4eC9tVmYrQk95QjVzUUhZTE5WN2xPQktNcG40dmJlbnNoRUJ5?=
 =?utf-8?B?QXloRXR0MmdnVGZ1MzcwYTFQRkpOZU1aZWJYNkVYVCtxUE9EemsySDBrY1Zt?=
 =?utf-8?B?enBUdGp1QzU2MXA5d0NGYVlsUzFUcFU5czVqUlREamlMMC82clR3QjRrYkdE?=
 =?utf-8?B?OXplVDhaQXFQQlJtdXJQb29vYThxd0dHZjFBSVhadnRYQ3NIWjFpK0pmalZT?=
 =?utf-8?B?WWZ2Q2JmRi9idFVIVHl6UGFqdUpOYmdWZ3d4cTZsUDBndFA1U1ZZa1pncCto?=
 =?utf-8?B?bEpGVFo5bnkxaUJzQXFJTXlUVmg2QklvQ2Fjd09QQy80L2EvalZIM1BFTjBw?=
 =?utf-8?B?amhZWHNpQU96OFByblhYZFRvem9tQmdpOUdsaUJ2R2pIVWE1dUpjSjdSOEpy?=
 =?utf-8?B?d2Z5NGczUURlb1ZzNUNzeldRcm9RVVJJb1p0UHJPMVljNlRTSVRuS3E3RkxJ?=
 =?utf-8?B?cGF1WVRzaUh0YWZsZ3pQTVFDTDcwYmRPbEhMbTZpM3Nkcmx1Vk5ydk1KVVNX?=
 =?utf-8?B?MVdTTUFXTWJhWkQ2STNSc08vMy9yUXJKSk8rOFBCTjNIakdzV0JxM3BSdTlw?=
 =?utf-8?B?VlRGVnF1SnhmVVBkbG9Rb29FcUNPcnBYUFdCS0VSMTB0VkFxVldFdnlid0ds?=
 =?utf-8?B?b0tiMFA4cnQ3cVlsK3dsUFBFbkxReHZrWks2WENJMkJIVkM0MSs3QXZKNnBp?=
 =?utf-8?B?U2tabzk3TGZ1U3hiUXYySHRJRHluWklFakpqaWFsUkhLek92UXJvR2dabXNk?=
 =?utf-8?B?VnpPZTdBcUJoNXlKY2o4bkhrcW0ydEphaktMWTErU0tXS3RRUkEzbi9OM29z?=
 =?utf-8?B?UkZTdlVZOGRHaXF1UXZBRVh2WjdkejdrVGFuaWVWQWY0NGxCS3c5dGdQbFBl?=
 =?utf-8?B?OVgxWmxDVklyL05yam9Sbi80YnRCK0lkL0kvNXV2WERZN0VTeklnSFM1SEs3?=
 =?utf-8?B?c05tZktXMTlZc0RSTUl6UWs2Mkc1UkZoUDhPMUtQSHo4Y3ljN0RiQUlpRWU0?=
 =?utf-8?B?eDJibWVYTU1FcDR0R29DVzZIak43dEJwQVVlZDhlZG9JYnE4RWk4TFU3enZh?=
 =?utf-8?B?K0xEVHdsbEF0OVpHbDBqUXFGd3lrWXhQWGtnbnV5ZWdZSkpHVTh2ZWlpWTFq?=
 =?utf-8?B?TkYzZEh1Ny8vOVhISEUrUytReG1ZdU0wb2lCejRWeStucUNUVjQxSUtJTHBN?=
 =?utf-8?B?OUExbm85VjZjbnRZZFBqTytHcGNwRjh5RkNLd29lOXFhbXQxeVFRRHZrVER4?=
 =?utf-8?Q?jQeyJs/az73mGZEJ6+C31WwlbAWdmGrtYzO20fy?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD/2FPFXOGpvR1hMdkKmZQEWmXcVJjcxNle1NWjRD7VIclY1c7Xfkeygs6t2qOTRYdcmJ7IYZYtdWCf/+y6GOdDylRgmWBtf0f+LGBiq5h+VMjiIsSoDzs7PnyBKbPOjDtw5aSHqB3YUHtqbQNew6EB/viae8hjDfcBLKiAOd8MOtug+/n+f9azkc53FYzL/mi+c1k+xLOSdhYwnmwHH0Di8hQAF2W2tF+LKP/AwuB+NxDLHOIXcVedUARQim/tUga9JDcT+5PStJHjm51IoDR4kaNq+qnU48mwcOIOjQVA2WUlJM6aLSLjLPo7OwwDqqTFWfJk6kkO3w05eJb8Ibg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XokTSo+stJPZ1GhuNFfqlSbCHgNg/xpa6F8ywTX24Bk=;
 b=TA5pyU8ypym0c+bBVRb/iUF//bKCCkT5k3/DNKCb9ty1QkFkUKJh1Ky3r2GUmpOe7iY1tFKs9q/qxD9lfsF9fethaX29+TddqUSYwHRE/8EQEbrF0MaKUKgZbv9XZ2YK8bL7SpYUOTkTbTEjPxo/eax1gtQN7oNcxqGUnWCsqaD1O7WpdMsn9o4d/zEZIXtMhP8z7J1gEa+FvgZZbqHmqpg/Fk89lzshYh3BBw3vP7flOOemhO39Ts2liTuYu1l3D2tU53X/y+MzYQXbiyydR/HMxW8wlFPkPmRipGozFyI0DJDNH1EFLloPXcT4wFS45zF/h+A4FS8NBGhpxTY/FA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: ef5d4e6c-3488-4100-78e9-08d8f9435164
x-ms-exchange-crosstenant-originalarrivaltime: 06 Apr 2021 21:31:19.5479 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: LjHJDmeeFhYsBxU61W1GRz1yaKU9slh2MCyAHt+0Boqy5uaUsLwRiSThYgQ/VJWzYe70yJVw2re2uckOV9qdrQ==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6964
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA2
LCAyMDIxIDM6NTEgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQHJlZGhhdC5jb207IGFsZUBy
ZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDE0LzIxXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgYWRkIEE1X0FDUw0KPiAodmFj
c2gpDQo+DQo+IE9uIDMvMzEvMjEgODo1MyBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4g
KyNkZWZpbmUgZkdFTl9UQ0dfQTVfQUNTKFNIT1JUQ09ERSkgXA0KPiA+ICsgICAgZG8geyBcDQo+
ID4gKyAgICAgICAgZ2VuX2hlbHBlcl92YWNzaF92YWwoUnh4ViwgY3B1X2VudiwgUnh4ViwgUnNz
ViwgUnR0Vik7IFwNCj4gPiArICAgICAgICBnZW5faGVscGVyX3ZhY3NoX3ByZWQoUGVWLCBjcHVf
ZW52LCBSeHhWLCBSc3NWLCBSdHRWKTsgXA0KPiA+ICsgICAgfSB3aGlsZSAoMCkNCj4NCj4gWW91
J3ZlIG1vZGlmaWVkIFJ4eFYgYmVmb3JlIGl0cyBsYXN0IHVzZS4NCj4gSSB0aGluayBqdXN0IHN3
YXBwaW5nIHRoZSB0d28gbGluZXMgaXMgc3VmZmljaWVudC4NCg0KR29vZCBjYXRjaCEgIEknbGwg
aGF2ZSB0byB3cml0ZSBhIHRlc3QgdGhhdCBleHBvc2VzIHRoaXMuDQo=

