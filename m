Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF02300F42
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:52:22 +0100 (CET)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Lt-0008O7-2n
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34KG-0007qE-0r
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:50:40 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10921)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34KD-0006He-76
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611352237; x=1642888237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hNkImJNqVMHOj+n/eiXUOKdsE6IxIsPYMszHXKngOGE=;
 b=IoOGGwTd6SdAmKK4rOnxIU7FtpHuXPeIwWK4ebzgHwlDMQtJlxb4TS1x
 bvy4JzBb61RJoiq+W2TkR7paV0T/3aY35I1ExThXrRTMSj965NW6N8gP6
 PhvYJLz3UE0rQ/fTx6riKmyEsanJEhwUDnk0ctMQXmgmqKASbG1GCvyL6 0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jan 2021 13:50:34 -0800
X-QCInternal: smtphost
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jan 2021 13:50:33 -0800
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 13:50:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 22 Jan 2021 13:50:33 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6755.namprd02.prod.outlook.com (2603:10b6:a03:205::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 21:50:31 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 21:50:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
Thread-Topic: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
Thread-Index: AQHW7tx+HFkFXWWG0E6MnT+UzSc146o0HR+AgAAF3xA=
Date: Fri, 22 Jan 2021 21:50:31 +0000
Message-ID: <BYAPR02MB4886E0356F7845E71C92D87FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-8-git-send-email-tsimpson@quicinc.com>
 <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
In-Reply-To: <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b60e5d1-ab5c-40fe-cce8-08d8bf1fbd70
x-ms-traffictypediagnostic: BY5PR02MB6755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB675574156069ABD89FEEE756DEA09@BY5PR02MB6755.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Gb2VP5QInbdtPaT9PQsRBXaCYxt9pXaQ3K9tquwwn0h4plyKVUxh7yan1QAgyAZ1oD6Mv3Cy+9Y5phV9q4/DxKVSFAYryuyVDqFheF+P//waf6AWglRwsFrIIKd0+uNO+ndwZAxHGxXzDxtrHCz+Y5COrGfJRTrTlOSNMYdp/hH+WIHUQK5m13Nta1L6lieXUHyvNR/RnjW5itEVYtaYGE4vlRmbP9rkxc+IwE42OePPTUfkLsXqJn5SKoDW5Pdq8CQue3GFW/Ir1+Qay/vV5499B1pKzQNvnSGS4h7oFjJPpBPhgiPegcOHLvPddCYI5U5gg1YnwiukcyjkNXLJePczjEge0BSOiAAHQMIEHWkyeKyTjwSR8//NwZA5PZei65Cy5WC/kwh3Qo8liPE2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(66446008)(107886003)(52536014)(4326008)(83380400001)(66556008)(66946007)(8676002)(64756008)(5660300002)(9686003)(55016002)(76116006)(71200400001)(66476007)(478600001)(53546011)(316002)(8936002)(186003)(2906002)(110136005)(86362001)(6506007)(33656002)(26005)(7696005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUcvL2JGREkwMTNzdGhzNU1IUkgrbUxiaFVFQWMyZ3V1cVUzSFl5K1lGSnlQ?=
 =?utf-8?B?WlBRZC9kSk83NHJRc2NWajh4UG4wM3pFWGJlRUwxWmh6d3U0TFpmWXh0SFlY?=
 =?utf-8?B?eklLR1dJeHBkSTRWV1V4aXJpMG9IVGFETmE5QnJCaGNPT0JaTFFyUW1ya2cz?=
 =?utf-8?B?M3lsVDBNQWE2Nkgva1BHYnZMOElxQ3ZGd0FUOXB3OGRucHpaQlJsOTZINTk1?=
 =?utf-8?B?SjI4UFhxOWJrbVhuZTV2Y1NGZHFUWTIvWlh1MlBkaHJnTUJxWUJFZklRdHha?=
 =?utf-8?B?RTdWWkJPTXh1Mnovb21jeHY4ckFvNE83TGNPUzNFdy95VVFYT3ozOFJXYWRq?=
 =?utf-8?B?WUF1eEMzYlRzWHpYTUhtcVZCQ2NwWEIvaUYzVlNoTEZjMTdab2NOTFpXTTNk?=
 =?utf-8?B?NGRlUUdLSlJYMTlsdHpUSTNmOWVWdDFPOGZtNHMvaHNDUE9iS2wwK0w3MlpV?=
 =?utf-8?B?NFBhM2tXdzdISFgwbzkyaUcvK3pyUE1ieDBIdkxmZXBEVjUxOWx3QWhKalR1?=
 =?utf-8?B?MTJicHhhVjJ6aEQ0QXhwQlVwdE1taCtVZ2h3MXFycDhOQVpoZFNpdHpSakNl?=
 =?utf-8?B?UWVXVHJRTWZoMDVEZ0h6SW5LaUxSNk5oSml6ejZwRVJDYXlkUXJUMjhkejNW?=
 =?utf-8?B?dUNLZTF1NjBTVE1xWjArdWZVUHRmSHVXeHNuYjVRQURmdm9zVmNaUW9Uc2dm?=
 =?utf-8?B?SXcrY0pySWZrZ2FOdy8yUHQ1V2JKM0ZVTDZnQkpnbW05b3hRQm1iL0x0UHBS?=
 =?utf-8?B?cWtFM1dsVklyUTQvUkMrSWdZcEtHb09QeW1MRFdDM3AyVUxjWXpJTVVCcEc3?=
 =?utf-8?B?MStOdUZxalkzbEZhRnhJekJrTUFpUmxMOUZYRFhKMlNla0tiSkhLelJHSjVi?=
 =?utf-8?B?ek8vTmR3c2xqUS8yeWhud05DT0ovZ1ExWkFKRzdYTjBDZ29wNW1NaENaemRS?=
 =?utf-8?B?dVNEMDYvL0EzMjNnYjg2SEVKSnlCclFlam13UTdTbmtQSTYwOWFRbjU1dDVO?=
 =?utf-8?B?d3RmejlmRW4wTjIrcXJObzJSYlpYMENTc3VML1VPbHFGT2gyYlpvQkVCMGpO?=
 =?utf-8?B?d2xDbTJuWkZCNGJZN1FBQmNmTDlvZU5WTHBCYjJzK01kUWhKQUk2UEdrRDNS?=
 =?utf-8?B?U3E3TzhVZ1pmV0crSU1nV0JKM1pjNzlhRi9uRlNBU2k4WW1XUDFIdTB0SXVv?=
 =?utf-8?B?MWFpOHZIUVFNWnNLNmJFMUJDV0lmcFNjL1FjWDNoZHY4anZTbTF4SFlYdDln?=
 =?utf-8?B?RzlOa0dnVWF0bFJaK3BnWlJvWGd4Wk9DSXJSalpFMC9yU2dBU2llN0I3ekJj?=
 =?utf-8?Q?uYKhmiStMpw3s=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dpa9dhccp1p4BKVuZNs4B8MymTojAqq1mmO70e7PKqzROBoU+iQmH8bQtG9QxQzgo6wcHnST8wco39dwvJkz6C9LmAKvknnqmVF825ceJRBuoChRJQBxBLlAEp5O9T8vOqwlWRCzpJrE3z++uiG2Qp4tHG0tnRUYG/c0BjpdySEQGJGlMgr9Y24wkKlwPltBez5WNBqEpZDtcl69YYFW151cKQibcDmzWTYuYVP7rBdl30Dg7gv62PFCl1xJqkgNcS7KdP6Tn8zf5QyHb5PFD2vaT9LNCvEkBh7QSC36cEsqU49ms/BeS4SGgur5AOaGEX6FFGVOhoyCG2e20s1qKw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7gZsqyMO6OShYhnjr/nbhQZqW+BEIJh8N6nQxvP+VE=;
 b=a5isdw2y8tx74lRjljM6yvax8HCGVDliQJfTEQvmwKM6jvSP2tqtX3+Bv8muMAMGrQH2Qh1UvLXipjStsVRbJMpfE1U2KFL3DIGiMOtaOJKSI6aAREl8gFxExBSM1zEUaZzFd/r772Pum0A3wAff6qMkMqhPJ4FDBE9B9yJNLGmRENyPQ5I/oYw6L5GPGfZnRWnw47Kfwx5IPBDKdd/I+2aAufjGWMJKKU62ctWZzUzKshOTTsse26sVpLz8uHoGgtCNvUvWu32/ZwcRYce47tFt+YXIisiUjGFb1iq9uCdSJuEX6i5y7Q+4p69TaYq7K1hT2cVAHtXqUO7TSNQd0Q==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7gZsqyMO6OShYhnjr/nbhQZqW+BEIJh8N6nQxvP+VE=;
 b=ru0a8W1qLsE0ABBqpd87Fvfl2/coyxkF/Os7C7R3sEhflNuMG6+PAaR20cFU9p+0mhAjlbKjV3UxeSw313tmpfbXam6UOuhSm/qQY1ncw9u43YGKxrVWgTWLE7w+p4JVjvDAZfR8E4ju9suEO/JTjcKpzVGqYd1bGVijzfJDrsg=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 1b60e5d1-ab5c-40fe-cce8-08d8bf1fbd70
x-ms-exchange-crosstenant-originalarrivaltime: 22 Jan 2021 21:50:31.4313 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: LlTURSXWPZasxsNHjlUOEcnNjoLIBGik1n9dwJ97S+vfSXo8ERjr9g6gaeHoBHPiLUcbqJKmB7aafEBZrBL4Hg==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6755
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDIyLCAy
MDIxIDI6MzAgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZzsgYWxleC5iZW5uZWVAbGluYXJvLm9yZzsNCj4gbGF1cmVudEB2aXZpZXIuZXU7IGFsZUByZXYu
bmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY3IDA3LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgc2NhbGFyIGNvcmUgaGVscGVycw0K
Pg0KPiBIaSBUYXlsb3IsDQo+DQo+IE9uIDEvMjAvMjEgNDoyOCBBTSwgVGF5bG9yIFNpbXBzb24g
d3JvdGU6DQo+ID4gVGhlIG1ham9yaXR5IG9mIGhlbHBlcnMgYXJlIGdlbmVyYXRlZC4gIERlZmlu
ZSB0aGUgaGVscGVyIGZ1bmN0aW9ucw0KPiBuZWVkZWQNCj4gPiB0aGVuIGluY2x1ZGUgdGhlIGdl
bmVyYXRlZCBmaWxlDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4gIHRhcmdldC9oZXhhZ29uL2hlbHBlci5o
ICAgIHwgICA4NSArKysrDQo+ID4gIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIHwgMTA2Ng0K
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDExNTEgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
dGFyZ2V0L2hleGFnb24vaGVscGVyLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5jDQo+IC4uLg0KPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jDQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi41MTg2ZGQxDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jDQo+ID4gQEAgLTAsMCAr
MSwxMDY2IEBADQo+ID4gKy8qDQo+DQo+IEknbSBnZXR0aW5nOg0KPg0KPiBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gLi4vdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmM6MjM6DQo+IC4uL3RhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5jOiBJbiBmdW5jdGlvbiDigJhsb2dfcmVnX3dyaXRlX3BhaXLigJk6
DQo+IC4uL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jOjc0OjE5OiBlcnJvcjogZm9ybWF0IOKA
mCVsZOKAmSBleHBlY3RzDQo+IGFyZ3VtZW50IG9mIHR5cGUg4oCYbG9uZyBpbnTigJksIGJ1dCBh
cmd1bWVudCA0IGhhcyB0eXBlIOKAmGludDY0X3TigJkge2FrYQ0KPiDigJhsb25nIGxvbmcgaW50
4oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KPiAgICA3NCB8ICAgICBIRVhfREVCVUdfTE9HKCJsb2df
cmVnX3dyaXRlX3BhaXJbJWQ6JWRdID0gJWxkXG4iLCBybnVtICsgMSwNCj4gcm51bSwgdmFsKTsN
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fg0KPiAgICAgICAgfn5+DQo+ICAgICAgIHwNCj4gICAgICAgIHwNCj4gICAgICAgfA0K
PiAgICAgICAgaW50NjRfdCB7YWthIGxvbmcgbG9uZyBpbnR9DQo+IC4uL3RhcmdldC9oZXhhZ29u
L2ludGVybmFsLmg6Mjg6MjI6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8NCj4g4oCYSEVY
X0RFQlVHX0xPR+KAmQ0KPiAgICAyOCB8ICAgICAgICAgICAgIHFlbXVfbG9nKF9fVkFfQVJHU19f
KTsgXA0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+DQo+IC4uL3Rh
cmdldC9oZXhhZ29uL29wX2hlbHBlci5jOjc0OjUwOiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIGRl
ZmluZWQgaGVyZQ0KPiAgICA3NCB8ICAgICBIRVhfREVCVUdfTE9HKCJsb2dfcmVnX3dyaXRlX3Bh
aXJbJWQ6JWRdID0gJWxkXG4iLCBybnVtICsgMSwNCj4gcm51bSwgdmFsKTsNCj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+Xg0KPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxvbmcgaW50DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAlbGxkDQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi90YXJnZXQvaGV4YWdv
bi9vcF9oZWxwZXIuYzoyMzoNCj4gLi4vdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmM6IEluIGZ1
bmN0aW9uIOKAmGxvZ19zdG9yZTY04oCZOg0KPiAuLi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIu
YzoxMDk6MTk6IGVycm9yOiBmb3JtYXQg4oCYJWxk4oCZIGV4cGVjdHMNCj4gYXJndW1lbnQgb2Yg
dHlwZSDigJhsb25nIGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg4oCYaW50NjRfdOKA
mSB7YWthDQo+IOKAmGxvbmcgbG9uZyBpbnTigJl9IFstV2Vycm9yPWZvcm1hdD1dDQo+ICAgMTA5
IHwgICAgIEhFWF9ERUJVR19MT0coImxvZ19zdG9yZSVkKDB4IiBUQVJHRVRfRk1UX2x4ICIsICVs
ZA0KPiBbMHglbHhdKVxuIiwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+DQo+ICAgMTEwIHwgICAgICAgICAgICAgICAgICAgIHdpZHRoLCBhZGRyLCB2YWwsIHZh
bCk7DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn4NCj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludDY0X3Qge2FrYSBsb25nIGxvbmcgaW50fQ0KPiAu
Li90YXJnZXQvaGV4YWdvbi9pbnRlcm5hbC5oOjI4OjIyOiBub3RlOiBpbiBkZWZpbml0aW9uIG9m
IG1hY3JvDQo+IOKAmEhFWF9ERUJVR19MT0figJkNCj4gICAgMjggfCAgICAgICAgICAgICBxZW11
X2xvZyhfX1ZBX0FSR1NfXyk7IFwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fg0KPiAuLi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYzoxMDk6MTk6IGVycm9yOiBm
b3JtYXQg4oCYJWx44oCZIGV4cGVjdHMNCj4gYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIHVuc2ln
bmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg4oCYaW50NjRfdOKAmQ0KPiB7YWth
IOKAmGxvbmcgbG9uZyBpbnTigJl9IFstV2Vycm9yPWZvcm1hdD1dDQo+ICAgMTA5IHwgICAgIEhF
WF9ERUJVR19MT0coImxvZ19zdG9yZSVkKDB4IiBUQVJHRVRfRk1UX2x4ICIsICVsZA0KPiBbMHgl
bHhdKVxuIiwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+DQo+
ICAgMTEwIHwgICAgICAgICAgICAgICAgICAgIHdpZHRoLCBhZGRyLCB2YWwsIHZhbCk7DQo+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fg0KPiAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludDY0X3Qge2FrYSBsb25nIGxvbmcgaW50
fQ0KPiAuLi90YXJnZXQvaGV4YWdvbi9pbnRlcm5hbC5oOjI4OjIyOiBub3RlOiBpbiBkZWZpbml0
aW9uIG9mIG1hY3JvDQo+IOKAmEhFWF9ERUJVR19MT0figJkNCj4gICAgMjggfCAgICAgICAgICAg
ICBxZW11X2xvZyhfX1ZBX0FSR1NfXyk7IFwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fg0KPiAuLi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYzogSW4gZnVuY3Rp
b24g4oCYcHJpbnRfc3RvcmXigJk6DQo+IC4uL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jOjIw
MToyNzogZXJyb3I6IGZvcm1hdCDigJglbHXigJkgZXhwZWN0cw0KPiBhcmd1bWVudCBvZiB0eXBl
IOKAmGxvbmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJndW1lbnQgMyBoYXMgdHlwZSDigJh1aW50
NjRfdOKAmQ0KPiB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJl9IFstV2Vycm9yPWZv
cm1hdD1dDQo+ICAgMjAxIHwgICAgICAgICAgICAgSEVYX0RFQlVHX0xPRygiXHRtZW1kWzB4IiBU
QVJHRVRfRk1UX2x4ICJdID0gJWx1DQo+ICgweCUwMTZseClcbiIsDQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fg0KPiAgIDIwMiB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZW52LT5tZW1fbG9nX3N0b3Jlc1tzbG90XS52YSwNCj4gICAyMDMgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGVudi0+bWVtX2xvZ19zdG9yZXNbc2xvdF0uZGF0YTY0LA0K
PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4NCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3Qge2FrYQ0KPiBsb25nIGxvbmcgdW5zaWdu
ZWQgaW50fQ0KPiAuLi90YXJnZXQvaGV4YWdvbi9pbnRlcm5hbC5oOjI4OjIyOiBub3RlOiBpbiBk
ZWZpbml0aW9uIG9mIG1hY3JvDQo+IOKAmEhFWF9ERUJVR19MT0figJkNCj4gICAgMjggfCAgICAg
ICAgICAgICBxZW11X2xvZyhfX1ZBX0FSR1NfXyk7IFwNCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fg0KPiAuLi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYzoyMDE6
Mjc6IGVycm9yOiBmb3JtYXQg4oCYJWx44oCZIGV4cGVjdHMNCj4gYXJndW1lbnQgb2YgdHlwZSDi
gJhsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg4oCYdWludDY0
X3TigJkNCj4ge2FrYSDigJhsb25nIGxvbmcgdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3Jt
YXQ9XQ0KPiAgIDIwMSB8ICAgICAgICAgICAgIEhFWF9ERUJVR19MT0coIlx0bWVtZFsweCIgVEFS
R0VUX0ZNVF9seCAiXSA9ICVsdQ0KPiAoMHglMDE2bHgpXG4iLA0KPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4NCj4gLi4uLi4uDQo+ICAgMjA0IHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbnYtPm1lbV9sb2dfc3RvcmVzW3Nsb3RdLmRhdGE2NCk7DQo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCB7YWthDQo+IGxvbmcgbG9uZyB1bnNpZ25l
ZCBpbnR9DQo+IC4uL3RhcmdldC9oZXhhZ29uL2ludGVybmFsLmg6Mjg6MjI6IG5vdGU6IGluIGRl
ZmluaXRpb24gb2YgbWFjcm8NCj4g4oCYSEVYX0RFQlVHX0xPR+KAmQ0KPiAgICAyOCB8ICAgICAg
ICAgICAgIHFlbXVfbG9nKF9fVkFfQVJHU19fKTsgXA0KPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+DQoNClN0cmFuZ2UsIEkgZG9uJ3Qgc2VlIHRob3NlIGVycm9ycy4g
IEkgdGVzdGVkIGl0IG9uIFVidW50dSAxNiB3aXRoIGdjYyA0LjggYW5kIDUuNSBhbmQgVWJ1bnR1
IDIwIHdpdGggZ2NjIDkuMy4gIENvdWxkIHlvdSB0ZWxsIG1lIG1vcmUgYWJvdXQgdGhlIHN5c3Rl
bSB5b3UgYXJlIGJ1aWxkaW5nIG9uPw0KDQpBbGwgb2YgdGhvc2UgSEVYX0RFQlVHX0xPRyBjYWxs
cyBzaG91bGQgYmUgI2lmZGVmJ2VkIG91dC4gIERpZCB5b3UgY2hhbmdlIHRoZSBkZWZpbml0aW9u
IG9mIEhFWF9ERUJVRyBpbiBpbnRlcm5hbC5oPyAgRXZlbiB3aGVuIEkgc2V0IEhFWF9ERUJVRyB0
byAxLCBJIGRvbid0IHNlZSB0aGVzZSBlcnJvcnMuDQoNClRoYW5rcywNClRheWxvcg0KDQo=

