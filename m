Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B64405DA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:45:18 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbYk-0002N1-0A
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mgbR0-0007ow-Qu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:37:22 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mgbQy-0002Nx-0w
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635550635; x=1636155435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uameAZyk8Ts45r0WAZfrrBo9f3Z3TUy2xyLjWv1TeZ8=;
 b=QFRl+SUP/ZlQH2Z2F/0rD36vbnZJJjHESlkXGdsSam3kA16IQ/SwD9Oc
 mqYGJSlDItbwvwFM7urmiAZzc2jFgaobr4W5uzIBP5odNaZYkIMvCdOxQ
 sp2V1RPiX4XgOcPIPKzpXA00nFVraG7edRi45jdAsWGVbhOO0AgiTy84D s=;
Received: from mail-dm3nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.47])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 23:37:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFoDcw9dtQZ21JMGNT4QvnpedCLNeh2+mKVL4JXBPfVC2td6fzOYDseo7tUpKW+vStBWJETEeF9cPJM2eagXdZokuP2BcoJCvnBsNgsIosphhcAd6UEtpbxaLM+DSiGNCLV1K821uvcRsFKopnIGwYIQdvIBH6IH33QT19PiblpTByH6L1AqoCBeZwEdP9NvTWBK4bpBxgTskToktqgx7eF51PbGu4y3ANU1zPuwwtcfTrVXUddavf6eTK9EWErPmS9mksi60faVxlO00SahRwLsqHTIm6XKvTPtRKAQdRON6yr02wW8TdkC3/ilYIzmE4YQtJWcL1/5wNMUT8vPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uameAZyk8Ts45r0WAZfrrBo9f3Z3TUy2xyLjWv1TeZ8=;
 b=Hh5MsQR4sLQpyenEtWH6zC3xkUiPG6XxM2pl2GfxlcEmUHKqbC+aWrCuKfbdrlm5hXY4P+YDm9qxLSej5umVPUbBRTUkzXEKUCH0S7v85JXlmRJJlfDCLKZPTiGZOo55RC091I3BRt+OWsMtkbi8EjHZKgCpuNndwYdxsp4t7aMXjXSfD3kSexOxDFiqiawLM3/f+dfCUZQFCKXHkV8hxQ3X0p+GR348b3K2g3pEy18932uzT/fg3Oh71GLLG1PBr4PYIsftAKBZtbrRXe3xDAB0AEfcjF6zPKh2OkQrRIleud/Zkv9J1Kc4z6SELFr7DmLiGv7bN1wLe7ipQinYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN1PR02MB3645.namprd02.prod.outlook.com
 (2603:10b6:802:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Fri, 29 Oct
 2021 23:37:10 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.017; Fri, 29 Oct 2021
 23:37:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 10/30] Hexagon HVX (target/hexagon) instruction utility
 functions
Thread-Topic: [PATCH v4 10/30] Hexagon HVX (target/hexagon) instruction
 utility functions
Thread-Index: AQHXv1GPu5gKiPAloEmhn2uDBWv9ZqvqbdoAgAANGxA=
Date: Fri, 29 Oct 2021 23:37:09 +0000
Message-ID: <SN4PR0201MB8808860C70E88E8E5253635BDE879@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-11-git-send-email-tsimpson@quicinc.com>
 <23d04fd0-82ae-2f7f-95a9-051daf179bbb@linaro.org>
In-Reply-To: <23d04fd0-82ae-2f7f-95a9-051daf179bbb@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 680b1ddc-8c16-4637-2dd5-08d99b3506d1
x-ms-traffictypediagnostic: SN1PR02MB3645:
x-microsoft-antispam-prvs: <SN1PR02MB36454723AA1CA2FF0F5C72C2DE879@SN1PR02MB3645.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DC01cfBa6J1kpP71+tr3msKXvggKGh5ouG0gwLSaCSJsbzRanveRr66ouMlQWvp+d5IdYzhSLZsx9cPwyj636MqhYriLUd/S7mAcI1EFm+CsCrlztoKMWi0B6c3pLZvqiP4EVhKw/Uupy23dnltC2HszjECU9t2tLJY9PI5DPsOrnxsnULvYyXXnWZp9JIdwC82PsTrPjtGE4grzDnD7Q8tLLs9VwzqYN/OJ02IBp4nuJfhEQWQ3AWuPt38HmZuUsb9S+MjAxSHWuPEpm72apkvsMSvK8ZoDcVyzZBB1NrKw+1IyqUYen2EIY/lA/IPU5mOhsZs5kN9iAfTkkabRJ5T2m0VbHg0metLW46aipgl1uXYisgx6z2PjR0c203ycaFEao2yWzkmeE3+rpTqzPfSKJh/oAHqaz75zSDkfxSJ9+wplGPibxtzFThHhDH/HV9wLbw+UGiMS0MuMn0pyzdxVQp23sZIr1NZJ2TopdmffgNkTwpyyCDii2BtNzG4SBWWI/JAlLK/A+D0d+owApVUAirXun91iOYaGX2q2YlL6r2N5k6AuGoIVurYP0Q42X/cGAsSxyOe+je7P5ycQwU1LO7vQHf532SVAJbqEIhq7YMPR9DniSt8zntSsAbK8kMgGhDtlLHJyf5Ak0roTXwJYMGo5HY9v8Jw0opDug9AjfV65MKoJwkrc5xk5gdoomL5FZCirN6O/vs6ewgCHPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(316002)(71200400001)(64756008)(53546011)(83380400001)(66946007)(66556008)(2906002)(7696005)(66446008)(55016002)(26005)(54906003)(8936002)(52536014)(110136005)(186003)(508600001)(38100700002)(8676002)(107886003)(5660300002)(66476007)(9686003)(4326008)(38070700005)(86362001)(122000001)(76116006)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVZ1cWpMSGpFWGEyTVJranhkaGIxQ0dZZUQ2U1Mwak5zd2dTb3plUi9OSzht?=
 =?utf-8?B?MjJrQm9kZUIza3FBdkRQMzBPR3ZMb3ZRZ2FGRzlpOHdoU3dPR3hyYThrdTVY?=
 =?utf-8?B?VFY0OGdRbEpZK3ZURU51QUFFeW9tZ0pORGxEM3lyK2NyVWJYZW1lNVVJcWpw?=
 =?utf-8?B?VldUTzMwTzBuWjRGWm93QXhyMThidVNsQVdIRlBDckh0N01GZkR0c2lTRE1u?=
 =?utf-8?B?bVVIOE5tbjlJQWMwMFY0SmY2cXhJWlB0ZHlJbGNOR3dBUXpNNjE0aEQvMmRP?=
 =?utf-8?B?K2NMT2Q1RitLd1VUMU5ab1lyT1IvVGw5M0VhYkI2V1J0NUZrS3pzakwwYlIv?=
 =?utf-8?B?dVhZMG9sUUJkZDV5cFc3ajN6MTJPRjZzcmhCU2duUnI4aEpHWExXSER4WTlv?=
 =?utf-8?B?UmpZSDJyNWMrTEd1QU4xZFZxNnAxV0pCM3RmZHAyU3RqTy9aUFdVTk96eGRI?=
 =?utf-8?B?aFJMWTcycTZ6czVsOUIva1EyRDMvWllPTzhlOXZVTy9YSTFsUGdLZVhTSUtt?=
 =?utf-8?B?UlhYSVEzeHgrbk9USWtxbng5T0pDMk5Ndlp1SmVuNHgveVZXeUlUck02THY5?=
 =?utf-8?B?d1dmU1lwOTJSZTg4UCtrcmRKNEE5VmRQWDdENjNOWnJTenZSdE9yYWZYaU12?=
 =?utf-8?B?NTBFd1BPTURpYy9TeGpnQzN0bGNJYTFaOHhPSlltZjRvMytzbkRLZnB0L1NG?=
 =?utf-8?B?Z21PUWtCZ3BuMDRMcGhueFZOL0tpL20zRTh5cGdkSTlXWXJwOTg1bDg2Z1hp?=
 =?utf-8?B?WXc5YkRmWmU1dHpaZW1YZjB2dllDMW5hRk5hMXVvZzRNT1grN2k4UmhiQTdq?=
 =?utf-8?B?ZzZSS1h2NCtFOEREWTJSWS9mMmNBVUs0OUpYZ2FzWEJwZlNLZmZYeG4vbmhK?=
 =?utf-8?B?d2kra1pNWG1IK2ZSbzJ5VUR4U0RYNDNTTjJnTTBzNUM5SW1pS0phV1hqMFQ2?=
 =?utf-8?B?SjBSV0UxUDVJREJZcEk3cUNSVmZqWlVIL1p3a081aWdGU2V1YWdDOEM0NG5u?=
 =?utf-8?B?WTJsdVNRV3A5ZUthNW82cGFVa2ZIMGtVMEViaXVpakM4aVJrUnBSVVphTnZm?=
 =?utf-8?B?UkpMZXdzU0Y5d2svWGlRbzBCZW9uN3gvbHZjb1cwYjFXQno1WkQxS3d5SDlM?=
 =?utf-8?B?NGR2L2pBWmZKYjJ6QjlCNGlMLzUzZTY0aWU5MlM3QWhhTUNWZWhUSnFCVXdL?=
 =?utf-8?B?N3o4TVg4alJVYVU5RGdKWTF4LzkzZmowWlQ3RHV5QmphMktIME84aGJmWmJH?=
 =?utf-8?B?NzdoRWZFcVAyUEZUeTlialkwRlhYZDNkZVd3NERTMGRsZzNWZ3dDc3pTSlV2?=
 =?utf-8?B?R1NLZUNKQU1UMnV1cEJIck5PdWJaUnlwRTg0ZmVwaVJMakJBeFhlaTJDdXBE?=
 =?utf-8?B?eTNRQUVlelk4SHdQNGZaWUszMzhrR0d1cDB2U1JMcDZQaFpMaUVYT3ltT2ZJ?=
 =?utf-8?B?aWJ1RTRqMDdXNGhqZ0tNemw0dW85SVNVZDdQSTJ5eVZDU3JXWkJ6ZWxVQzBS?=
 =?utf-8?B?NVFLbE9TWFdteTRpUUFybDh6aHVTQWYrRjN0VllSaUlPZHZDcWtJV3FnVDdI?=
 =?utf-8?B?YUN4QjZwOWVUM0hoYWMxanY4dG9WQktnTjNNbGdaM0UyeU13aEFPSUJwZ2JC?=
 =?utf-8?B?ZU5TRzJQZkdXblZ2ZDNiL2E1YkNsTGlKSlhCZlJXelFoZlRJWmFEVUVjYWEr?=
 =?utf-8?B?NXgxK1JzZTFaRzRJcDBVQXptOXR6dFZLd3h4djljUnROaHFIVThxMElseHlo?=
 =?utf-8?B?ZGlyVnh3Y0tESk5RZmlRSzNFcVlUTVFja1pYdlNHVnYxRFZFVGR2blhzVXJ2?=
 =?utf-8?B?VHozWjA0NkZVVVdRakV6eFhLQ1E2V0FlOUQycVF4dHhGWUxCZ0ZDbVN5M0g2?=
 =?utf-8?B?U2c1Vk5xd1RGNXJGVk5IQ1c5clpESXFZQ1QzZEhGblBJclUvUmp0SjE1WU8w?=
 =?utf-8?B?T0dvcDRpUnlwclUzYXpLR3ZCSkoyY1ZGZVhmcXhUMkFHcnpaTFY1SEpITm9W?=
 =?utf-8?B?VG0xR3crWHhIejRROEg5QUVUbkRUdStmSUh4OWhHYTNVWXYyNE9tRnJaQUll?=
 =?utf-8?B?SFBtOFU4QTVERytoamtweDN2czI3RWpvZkZkaWJ1Y1Y2MkZUcWdOYWhBOWNM?=
 =?utf-8?B?anN2RWtBVU5Gb1NENXhPUHAvd04rbUM3NHJzaDkxcHJINVAzeVZQTE04aXk1?=
 =?utf-8?Q?ysYpzuomouwmXLhAjSfAJTo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680b1ddc-8c16-4637-2dd5-08d99b3506d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 23:37:09.8683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8y1Vq/y70XHfkuQ3aH6RX4KvZY2IRkeuAvqfCyKzWylShYbZYaOFEbpN9oQ5Xj7SJIhsyKESlXw6Bo/Or3zRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3645
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
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIg
MjksIDIwMjEgMTo1MyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBmNGJ1Z0BhbXNhdC5vcmc7IGFsZUBy
ZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDEwLzMwXSBIZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pIGluc3RydWN0aW9uDQo+
IHV0aWxpdHkgZnVuY3Rpb25zDQo+IA0KPiBPbiAxMC8xMi8yMSAzOjEwIEFNLCBUYXlsb3IgU2lt
cHNvbiB3cm90ZToNCj4gPiArdm9pZCBtZW1fdmVjdG9yX3NjYXR0ZXJfaW5pdChDUFVIZXhhZ29u
U3RhdGUgKmVudiwgaW50IHNsb3QsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dGFyZ2V0X3Vsb25nIGJhc2VfdmFkZHIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IGxlbmd0aCwgaW50IGVsZW1lbnRfc2l6ZSkgew0KPiA+ICsgICAgaW50IGk7DQo+ID4g
Kw0KPiA+ICsgICAgZm9yIChpID0gMDsgaSA8IHNpemVvZihNTVZlY3Rvcik7IGkrKykgew0KPiA+
ICsgICAgICAgIGVudi0+dnRjbV9sb2cuZGF0YS51YltpXSA9IDA7DQo+ID4gKyAgICB9DQo+ID4g
KyAgICBiaXRtYXBfemVybyhlbnYtPnZ0Y21fbG9nLm1hc2ssIE1BWF9WRUNfU0laRV9CWVRFUyk7
DQo+ID4gKw0KPiA+ICsgICAgZW52LT52dGNtX3BlbmRpbmcgPSB0cnVlOw0KPiA+ICsgICAgZW52
LT52dGNtX2xvZy5vcCA9IGZhbHNlOw0KPiA+ICsgICAgZW52LT52dGNtX2xvZy5vcF9zaXplID0g
MDsNCj4gPiArICAgIGVudi0+dnRjbV9sb2cuc2l6ZSA9IHNpemVvZihNTVZlY3Rvcik7DQo+IA0K
PiBJbml0IHJlYWxseSB3YW50cyBzaXplICE9IDAgaGVyZT8gIEJlY2F1c2UgaXQncyBub3QgdGhh
dCB3YXkgZm9yIGdhdGhlci4uLg0KDQpUaGUgdnRjbV9sb2cuc2l6ZSBpcyBvbmx5IHVzZWQgZHVy
aW5nIHBhY2tldCBjb21taXQgd2hlbiB0aGVyZSBpcyBhIHNjYXR0ZXIuICBJdCdzIG5vdCB1c2Vk
IGZvciBnYXRoZXIuDQoNClNpbmNlIGl0J3MgYWx3YXlzIHNpemVvZihNTVZlY3RvciksIEkgd2ls
bCByZW1vdmUgaXQgYW5kIHJlcGxhY2UgYWxsIHRoZSB1c2VzIHdpdGggdGhlIGNvbnN0YW50IHZh
bHVlLg0KDQpBbHNvLCBvcCBhbmQgb3Bfc2l6ZSBhcmUgb25seSB1c2VkIGZvciBzY2F0dGVyLCBz
byBJJ2xsIHJlbW92ZSB0aGUgaW5pdGlhbGl6YXRpb24gZnJvbSBtZW1fdmVjdG9yX2dhdGhlcl9p
bml0Lg0KDQo+IA0KPiBPdGhlcndpc2UgaXQgbG9va3MgbGlrZSB5b3Ugd2FudA0KPiANCj4gICAg
ICBtZW1zZXQoJmVudi0+dnRjbV9sb2csIDAsIHNpemVvZihlbnYtPnZ0Y21fbG9nKSk7DQoNCkFj
dHVhbGx5LCB0aGlzIGluaXRpYWxpemF0aW9uIGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgdmFs
dWVzIHdpbGwgYmUgb3ZlcndyaXR0ZW4gYnkgdGhlIGluc3RydWN0aW9uLiAgU28sIEknbGwgcmVt
b3ZlIGl0Lg0KDQo+IA0KPiBMaWtld2lzZSBtZW1zZXQgb2YgdnRjbV9sb2csIHdpdGggYSBzZWNv
bmQgbWVtc2V0IGZvciB0bXBfVnJlZ3NbMF0uDQoNCkRpdHRvLg0KDQoNClRoYW5rcyBhIHRvbiBm
b3IgdGhlIHJldmlld3MhICBUaGlzIGlzIHRoZSBsYXN0IGZlZWRiYWNrIHRvIGJlIGFkZHJlc3Nl
ZCBvbiB0aGlzIHNlcmllcy4gIEknbGwgc2VuZCB2NSBvdXQgdG9uaWdodCBmb3IgeW91ciByZXZp
ZXcuDQoNClRoYW5rcywNClRheWxvcg0K

