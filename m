Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F333A71B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:28:02 +0100 (CET)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUX3-0000cC-7w
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLUTE-0008Pg-Te
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:24:04 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLUTA-0003qF-14
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615742639; x=1647278639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m9lnWcocgTVcFjssJlY/G+PsP2YneB7Uyn4Lts09oGI=;
 b=o9a2S/wJfAYQwC8ZvO/nmrVZ7GjykwAffNHzSDNUWZuj0VyYaBAzunMh
 D/y1N4RdG4pRE/yTJJ+iPr9S28ZU0448JJit/j+nv7OrqJBXptVsC94ki
 mS1c77tQZABtm8P4ySnQT/v68+f+wkhFcX/9ZUOuxmgiSX/8eewHMXA3P I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2021 10:23:56 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Mar 2021 10:23:55 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Mar 2021 10:23:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sun, 14 Mar 2021 10:23:17 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4232.namprd02.prod.outlook.com (2603:10b6:a02:f8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 17:23:12 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 17:23:12 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 13/35] Hexagon (target/hexagon) instruction/packet
 decode
Thread-Topic: [PATCH v8 13/35] Hexagon (target/hexagon) instruction/packet
 decode
Thread-Index: AQHW/d3K5HwN5YnRXkOvngwGRn+8CKpYA4kAgCrW7CA=
Date: Sun, 14 Mar 2021 17:23:12 +0000
Message-ID: <BYAPR02MB4886F7E0B50D16DAD77C3335DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-14-git-send-email-tsimpson@quicinc.com>
 <93f02942-fd1b-ddb2-0060-48b6dfdf687b@linaro.org>
In-Reply-To: <93f02942-fd1b-ddb2-0060-48b6dfdf687b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fac0fd8-c8e0-4f61-97f5-08d8e70dd88f
x-ms-traffictypediagnostic: BYAPR02MB4232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42328C28B56CBD7228BD47A8DE6D9@BYAPR02MB4232.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V3TqbB6vipSI68y0FK2th7sciaLhfgwHaQdZi/AX/AkEREtFsOvi5JrFp9IuupEAZ+Is/VIpF1dO4OCpRXcpkhu8tlJKjQiLHL7ksne4WTtvFI6SIoj98VfHDO7QONaR4K0WTrA1etNAmQ5PmbHpOW2d1iedUqQ94jOXHMrAY76Zyz0HhDUj1F88rmrcj9978KFY9DoflmIorlyJn8yBolRfgrQ/RHUOS4zjnUanwR/fyM6m2xV9bcAF45CQ5DUzWtNJptImkAt8dCR8wnZL00VqX0ZiYx+qExH8RMOr7RqV/Jais8pkhUqWaifA4P8uB9uOvNlPotkgXmFWbdz2hNqOPgDE0X9yB1Zpz5iYIGpb/w7qCOIEC3euUdg8lLf5F9MlALlaMVpcus0wJ96c4QlPyZMX5UrpGFLP7cVUpBA8Q/8Xgb2/eCIDqXyC8Acy6Lxvl387vtJsGJSB6vzVdcVWVWgasA9MIE3QC4Xn4D7ZfzSXkzRzN0Iz0vN9pOvMrEtPLwIHg45gxkdUkkxKh0M9LJBV/ROJaTLbxZBUDGid14by9pazFb8J+xF6OS9V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(110136005)(2906002)(54906003)(107886003)(7696005)(66446008)(8936002)(53546011)(6506007)(4326008)(66946007)(71200400001)(55016002)(316002)(86362001)(66476007)(66556008)(64756008)(76116006)(186003)(8676002)(9686003)(83380400001)(4744005)(5660300002)(478600001)(33656002)(52536014)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?S0dZOHNHV2pNSFNDdW1md0JhaFNNSGlsVUtRd2l4V1psRTBJUmdyOE5RbGNO?=
 =?utf-8?B?UnZEdG9UQjUzVHNObU9lWEQ3Vi96NFRpZUJPcXppV1ZsVkxiV0JGZXN5YlZ5?=
 =?utf-8?B?b2pRdE9mRXpNOHF4WmZsTXljc1ViazFZVVFjcTRJU1NwcmkwMFpIcDNTVklR?=
 =?utf-8?B?V3hUZTV0WExEYWQzbjNTN2FDKy92RnliZzJDV1J0RUhoYllYczllYTU2cFB2?=
 =?utf-8?B?SUJUSG1KdncrSTFER2dzMERwdFpheGNoOFFpb0JxUkRhdFdRbTI0WGM0UUJ5?=
 =?utf-8?B?cGFCUkFQOTFrTDdsNVFmQ1NMamJLSFFHbjZTVWg3S0IzWmNlZFFGbFQ5S29z?=
 =?utf-8?B?Y21SemRQVFJzcU1iQi93eGE0VGd3TStWa09JT1h6SzhyL2FUU2ExRDg4anJ5?=
 =?utf-8?B?SHZMTlFvREVEd240ZUJ2WTByOVdwZWlLVzFQdFZDMy9oRllhQTJxcWVpVVlD?=
 =?utf-8?B?UGpPLzRuem16Wi9OYnJSRloxVlAxcVg1NzRuUHg1UEZxUG03bkZONi85am1X?=
 =?utf-8?B?VXBTQk05SkpmTUtnNVUwTzB4YVRucEZNM29Od2VxSEVEYUoyNGU2QzlNUlVh?=
 =?utf-8?B?b0F4aTFiY3E2OWNNaG1TR3F0OGI4K2wwOHBxWE5ORDlTVEwwLzRwdlpJbUdY?=
 =?utf-8?B?aXR1UVM5UkhuRjcvNjNwbGNyTGFMTHhuME82SHdjT0g2TTZhakhYelprSmpy?=
 =?utf-8?B?ZDk3MG5KbFV6b3NMR1UxRzhvUFVWYWtIcVAwZnJpNjRYYnRQRGFiTk9PSm95?=
 =?utf-8?B?MFhCYmxEc1hOUm5ucG9lZzQ4VDloSHB6aDdqSG1VaXBpVkFoc09JUUZydUJm?=
 =?utf-8?B?b1lrOUkwNktveVdLeEpzNk5mTzhTTmVLcE9lQit4Tmp2dGdteGM1R09kVEJR?=
 =?utf-8?B?YlNYM0V5bFFJUFUwVENCNzYzMTIyQk5DVHZLZFlyRDlhYlBLL1RDbFh5WnZE?=
 =?utf-8?B?UzlBc0Zpb0t0QnRRMjRCZlYwSndmV1ErbkJjSnNUUWNCRm55WXlETlN6Vndn?=
 =?utf-8?B?Z084eWM4SWlxMk93THlRYXJvVFpHRFdFb0VLZGxyQ3dkNEF2NUoxVC8zcGNr?=
 =?utf-8?B?bURBSVZyRnNiNE9yQzVzT0dKR1JYK0JmSW91bWxkOCtWd0hiNzU5RDFlY1Z3?=
 =?utf-8?B?bkpqbEFWTnV1M3ZFYkwrNFdXNWo3bzVoTm9BcHNWWDY4Ym42emZhOEp3b00v?=
 =?utf-8?B?Nm45MzNic2tyd2Era2VNS2xzcDNJL2pqRktDM1ZpTC85aVMwZWJhZmtIcENE?=
 =?utf-8?B?dUVJSTF6dmpYZFAvdEoxUlVZbkRFREZnZitjSGlxdWdQblNrUTdwMkxTZDFl?=
 =?utf-8?B?QmR4c2F2eVZYL0JPb1ozR3BCWW9FQkJUNmFQUmpFNWZLL0p2bkpLVmVpZlFV?=
 =?utf-8?B?RHFUVllwY0Q1K2hFWDB3NWxSbUR4WWEzZHI3eTBISlFMenpqekxQbDFHUzl2?=
 =?utf-8?B?SDZjWXEvZlJFL1hmUXVYandZbUJKcUx6c1h0QVNSeHlJc2VySkhlTzVwNnFP?=
 =?utf-8?B?TXBRMkZiZ29ibS91MVFGaHk4VDQ4OTU2akkrU0R0aXVvSTRUV054WjV6eDBF?=
 =?utf-8?B?TjdFV0RqZ0ZLWXB2M0N0YlROTllmWlpvTW1HTjFUV3pheG5Ia0dURU1KUklx?=
 =?utf-8?B?NENqUFdOMzYvbW1kN1VKZGRyM0U4SlJqQ0thWjZ6dUVVaTIxVk1ma1FrRERt?=
 =?utf-8?B?aXNxOFQ4cVBvMDIwdTAxeWZXNW5HVng2dm5nY1pRSDNMcVY4ZjBxVENDd3ZF?=
 =?utf-8?Q?/RVkP4oP4/LojV82pF8L1K2HvNTQ+23hM4liXej?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCtvuLMUoOrgP2yw//SKQ50co1Wg78vbsBsMl2z7b7bT5hx4wdG+n2MrtdURAYciei72n3BjJbru9Ww47O3YURnQuIa4AFfsjgFzRyAhhLIgkIvRGovXx/2IoZWewfl5wox1u9ah4ZNA6gYBg1G3xkwX8tcX1EIVoTNOQHtol8Z6pT7Blj5F3UjtMWyjUGtexSiYB/UWJcxAla8L2wQsEoP6J2JVg5Xc7/0m4sGaefqRmee8Sah6BlzkodhKuxIXsNJsvJvOFi/tX9KCxfIOUq1xJxr1vImtMZlnjMP23YZQ/Ol1h79EBfn5WZuR03vsiQLovhdQKvAg4kNqs5laEw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnw+XDVifQHSWHdYJQsqsraehemWO786Hn39CKZV9Mc=;
 b=Ong3aPVISZmjal3vmyrFnAwvn9PKDFqlB/h43kQ+z27d7fhBoqQI2D8tmAVXXD/mvV0bAfyAgKrsIlg7pjaNfkIUsKCugmF774kIN2wx1h7fTaw/Oq6ecB08WZjwnpGsqU/cTblUOFoywoZ8VziIGDJtxIxn64ynzkNO/sUXNx6z1qVfxmbCcucduFvMXjQ9cQ7xJ3zaP1jo5K0tbFQ9lmY0JH5exzzVByA0MVuSVoSLg5CrN/XibzjQcLl6bFxKjpvS289MUvPdDKqBLfNtnmi5U7fVJozovtQPq3FZzTPhEUAfOiHQkhvu4bZY4JsEpGTar/q5BnvUWAeyiiXc0w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 0fac0fd8-c8e0-4f61-97f5-08d8e70dd88f
x-ms-exchange-crosstenant-originalarrivaltime: 14 Mar 2021 17:23:12.5766 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: og9klMMbHTr0oaljKsfeANqgejPXVtlh5dxpdj2HgLpQfWEQj2xpiQBgn7PW5OazchhskBRt842FI6VMpdJFjQ==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4232
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgMTI6MzIgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQHJlZGhhdC5jb207
IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxhdXJlbnRAdml2aWVyLmV1Ow0KPiBhbGVAcmV2Lm5n
OyBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
OCAxMy8zNV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGluc3RydWN0aW9uL3BhY2tldA0KPiBk
ZWNvZGUNCj4NCj4gT24gMi83LzIxIDk6NDYgUE0sIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+
ICsjZGVmaW5lIERFQ09ERV9NQVBQRURfUkVHKFJFR05PLCBOQU1FKSBcDQo+ID4gKyAgICBpbnNu
LT5yZWdub1tSRUdOT10gPSBERUNPREVfUkVHSVNURVJfIyNOQU1FW2luc24tDQo+ID5yZWdub1tS
RUdOT11dOw0KPg0KPiBUaGUgbWFjcm8gYXJndW1lbnQgaXMgbm90IGEgcmVnbm8sIGJ1dCBhbiBv
cGVyYW5kIG51bWJlci4NCg0KT0sNCg0KPiBQbGVhc2UgaGF2ZSBhbm90aGVyIGxvb2sgdGhyb3Vn
aCBhbmQgdXNlIGJvb2wgYXMgcmVhc29uYWJsZS4NCg0KT0sNCg==

