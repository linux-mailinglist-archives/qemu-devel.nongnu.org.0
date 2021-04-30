Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C821036FB33
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:09:50 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcStx-0007Jm-OA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSo0-0003nX-8c; Fri, 30 Apr 2021 09:03:40 -0400
Received: from mail-eopbgr740131.outbound.protection.outlook.com
 ([40.107.74.131]:47664 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSnx-0007CL-Dm; Fri, 30 Apr 2021 09:03:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bitVbQnATM1GQaDZU/H4GJZWgTH8FndyRVgOF1qoTqMbqFZYC1SWsccagTTBt0qOOSLgrpgl2St5mAg9ASMj29mRzJtNOBxowGyqIzc6e5NujAjH6R/7xV7BZO8uVTxea0kqG6vMDIkoT5AXTNVqj4tlFwXWTp5VfMZ/VKjbZzh6enZPPbW3MlO8l7HpT7i/agR9Z8ZMOfraQwnRB979ExeoWyjoAP1D/xIwcaFQTQxlz4G0zDpnBPbUZ058/N2Irac5eb7RUVi/WWbryuMd5pwgrF1ez1UXcVk4k+bp9Ev0l+HcXydw/tU6wu+DJFZh9ood7ZimqAWek+ddqJMqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym6NRJ5CBR4h9rjdRFb5sgtpVxU56+yypFEAMw/uoig=;
 b=SWz54kvKH+mqJ7kWFvJZLF5VCLVaNAdVMxVqNx7pgSRcfssiORms8UNjhaNkipPe13sdezOkCVPcQoIFZkgxZq+Jbx/0L8ABHiWEfNgGlza88+UZ8nrpjtHQ3/4c3KjX5RKOYUd2hnTO63Bo9Lad7nyv2IXVi29Ua0D2mBjurrcq4eFLS4NCzpBrI/nlFxlabAcXGiT3X+RWr1OwE9HRCMHvZUUhiJArGkTWA6oWda1iIju4XJ31O9RFWaoDHZ9d8hw0TwVoI0d2asYydI+2rFoNT18mkMz6waBDTegoZAQRByrLzf6MkWSg4wqx1YKki3AR8i87B62l+0a+a6mSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym6NRJ5CBR4h9rjdRFb5sgtpVxU56+yypFEAMw/uoig=;
 b=B9mtvJaOu319rG26MEk83ZRDyEq14xQrynB2H5qg5p+otTNqy02RmtCLMYCnSIzLdJtiN7bzDOrbDQ+wGt2BXaaw+wbOkY5QT4+KFwR9qub9Kjicw+IASRNz0/2rKscyIn3+YiWNHg1OFkMekJRpjp/5VS3Za1ZLthmDMvDpXbcFdUFzieQLXiEbHzvETzBMkSpsoy5KaFOElOQZ/yYtuEigix8YMEuDz4QN3fImINmi4ek+1G/rb9lZEoEQcAM9GYTWF7UrY9RS0n25ZWgNlJl7Lyohy/yC3+Nc8F2TY6G4VsZ3+nhHnH3evGDqHzg3prl8p286JKWkdgvpwFfpvA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4705.lamprd80.prod.outlook.com (2603:10d6:102:44::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 13:03:32 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 13:03:32 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 03/30] decodetree: Add support for 64-bit instructions
Thread-Topic: [PATCH v3 03/30] decodetree: Add support for 64-bit instructions
Thread-Index: AQHXPV5afbSR1sIUT0uePmSnMD1amqrNB18w
Date: Fri, 30 Apr 2021 13:03:32 +0000
Message-ID: <CP2PR80MB3668C21CB346C9697FD37D27DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-4-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-4-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6316676f-3067-4f0f-0f28-08d90bd85b8e
x-ms-traffictypediagnostic: CP2PR80MB4705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4705E005F01E51B6280CAD70DA5E9@CP2PR80MB4705.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ta8UpJLAIpJIwQfxiwo2u7iWblOSF/bhZLOE8eJC8FDLenFSecVytsd4oo3SmEe5LEuRy5T3ivyYHfJILlkdlLgcPlZf6vdfJynFlpp4CRkImsnE7DcPTIqwx/L20Q4bHhMHv14hKpzE8zUTYYJFWKUfMG3ENNfdWw0387XPkM46hEy0FOGYU8Kk2B8QtCmS+b63VJt+eehwhdMBs5Raf8J0eUmzbYhVY/dnd+8pgdRtW8jn/ChqdkdfDGWWQ1HwzKe2vhwL2LYz8j1cHqoQqu/CxRP40ZEmWawvDFvqyjVWl3ujaOtEntiwVOxkweKpeglZlNkf4L2WudESXH7UddrVms0zJ0v1uc4rPAVQSGFzuGrXt6SF0dJnYSOeAGl97BVWQ+ao7Jk87b9V5+q5yzrrVeD+eAE4xy2TLhJ8rTMkaaTjm9/oWO+IpAe61PgFK3PXikjd+kPaSL+/PdLxXc4odWPWVIF4UJ+/r4fCxutjLSPDYZ8GRD5TLjby+OkRslCEv4jTjunRm1Y5hWJFkSfHFKmyhiDOsBosqZe4xtMj4Cmxzag3GjtzWzYmmTZ8y8VQsa2s3MsCtbBFgDSVEDhQR4XmvFcFX47Fl+0IxlU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(376002)(136003)(396003)(366004)(66446008)(8676002)(66556008)(478600001)(86362001)(110136005)(186003)(38100700002)(5660300002)(33656002)(9686003)(64756008)(2906002)(4744005)(122000001)(83380400001)(6506007)(71200400001)(7696005)(55016002)(316002)(45080400002)(54906003)(4326008)(52536014)(76116006)(66946007)(8936002)(26005)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlY0WXlVcy9TM0VSdGNuMm9zWXBlb3dLb1VSeHA4cUZBSlpKNWZ2NUJ6ZUVN?=
 =?utf-8?B?aTNsb1FkL21DRXRwK0gyM2U0MjdoV3VsalIvQVlUSU13YytWakkzZTlrUEE0?=
 =?utf-8?B?NzkvWGZpMEhiWWJ6RURZWFUvUS9ZM09ubnhqNzJNZnVBQ1ZWRzJmMjNkTDY1?=
 =?utf-8?B?NFJFbHNWSVVEZ1ZicU0vUUtHN1pxYnMxK3g4TTVISDZleVI4YTZVK1dYSmZM?=
 =?utf-8?B?d0wzLzc1ejVncC9Od2p1U2tFclViQUQ5WW1mb1BtNzdkRS8zTkJKUmt5T1pn?=
 =?utf-8?B?OHBlRU9pQ2RWeWpJZ01PWVZIa2pxak1QdTFBdTJ5Wmk1dit5R0tpOW82MzRr?=
 =?utf-8?B?RWJDczNnaFNsY2Ric3FQYzFBQmJJZUwyZjJVVHZqWnZlZkJrYTh4QmIxUXVQ?=
 =?utf-8?B?R25Cc3B1VFZVTU9nMXQvM2tadVQ1MDJrNkwrYlY4MjgvcCtTa1E1Z29ZMUVQ?=
 =?utf-8?B?a0xqbzNmenZXcnNjMythditkWERnRjZSNUQvQ1ZCL29zZWhzbkxDL2NoS1JL?=
 =?utf-8?B?b0tnRGN5SGxleHNnekRFSFgzWCs1dHJOSURzclFNOHdLb0RsL2NpQ2FZS0g3?=
 =?utf-8?B?dGFGaDgyMDBvV0pRMStBUUVyVVllZ1FsMEpWSHByajEwNDF6cW9wMldPdHZ2?=
 =?utf-8?B?VmtESFhIZk5PZGdlSHNCNmQ0MTB4cWh5bWlTTVlKMnFvVjM2eFlBRlI4N1lF?=
 =?utf-8?B?Q21iRHJ4NkJKODg2YkR5VTBzUkZQZGVvWHN5R3pScWFKS0lPUVJYMmg1WFNE?=
 =?utf-8?B?eUIwd2Q2MVZqVnY5VzhYVnNkUGQ3M1lobThONENTUVJ0KzE4RVk4am5UaDVl?=
 =?utf-8?B?Ny8vSXNhYytmNE91YURGcEtNN1BqWHZOVmpwSGg2d1hSbmF4UWcwMDRCRU5D?=
 =?utf-8?B?YTY4M2xIZmNWVHQ4MkhEemFvNUtGemtlNVFJc3VVUHNNSFVqMmJwdWZYVG5z?=
 =?utf-8?B?TEd5OGl1Q2NRSHZuMWtDWkdId25Oa21oM0FlbSt5eG9DZ2c0cDNWbGIxYlhQ?=
 =?utf-8?B?TE5SM0xnVlNlcEpudmFMcGVaamlyTnZoV1krVDkrYTJIZW5wWDdPSjZXYkhm?=
 =?utf-8?B?TEtndDYxV00zbUYwWm5mek11MEV4SWxJRHBmUGtDZmRTT3lSaWlNRXJwKzBC?=
 =?utf-8?B?eS9oMjQyRzZPaGttWThRcWhXbjhCVTFrMGVzVmV2cUt0ampYVGJLU1UwM2U0?=
 =?utf-8?B?QkxCcnQ0OU9maVNETFJsVUdOMnEwNjd6dWFYS1pBM0R1UDVjdVR4Qy92dTF1?=
 =?utf-8?B?NzZVYUc4aWR4SFZpcDFkUGJZUDlWNFpYVUhiSXZmRVBaNDl0UVRwMjJZN2tn?=
 =?utf-8?B?cmdvY0thWXEwbVpIQTdlREJrc1BSSmZBK2tKZFhFMlF4RjhJcjBjclAvT2pr?=
 =?utf-8?B?ZStrdUlWN1JzaXFTZUlJUUw1RUppd1NGelcvbkhyRUIvcUgwZkdxNjFVOG9u?=
 =?utf-8?B?ZjFvMmtuOHhtQnRnemVIOHpqVWFNNnovdHhaR0RHS2pKMkJLZ0sxamxBM2d3?=
 =?utf-8?B?RGdPaFNick4rZnkvdU5hM0RXMGVXUzF3T1A1YlIvVXE2NGhhZFNteEVKdmpx?=
 =?utf-8?B?ell5TDdqaFozWlZNcXVDam5Dd05YaHJPbU9BVzl5K2F2eC9OWE9OR0NveHVC?=
 =?utf-8?B?TktMNmhzNlc5UDFNMlAyL1Z0cFdCMXh2eXZYTW56T2dJWVE1Qm15MGZLWlR0?=
 =?utf-8?B?RUpMeEtFUUlWTzBndTJ6S3FPYjE1YXZjWk1oS1UyQXRpcDF4MTdjRHF0cEo0?=
 =?utf-8?Q?y6egY3punQ14p7VQ0RprTT/4Jz0HDvLycH/gEng?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6316676f-3067-4f0f-0f28-08d90bd85b8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 13:03:32.5644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fep0DnayavqzQz7FPwyYMrFL5OqgklP35eHK0SdnmC76y4w63cfWo+JfQ55SbJD7cIC7u230Dhxjz5FVkTMJdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4705
Received-SPF: pass client-ip=40.107.74.131;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IEZyb206IEx1aXMgRmVybmFuZG8gRnVqaXRhIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9y
Zy5icj4NCj4gDQo+IEFsbG93ICc2NCcgdG8gYmUgc3BlY2lmaWVkIGZvciB0aGUgaW5zdHJ1Y3Rp
b24gd2lkdGggY29tbWFuZCBsaW5lIHBhcmFtcyBhbmQgdXNlDQo+IHRoZSBhcHByb3ByaWF0ZSBl
eHRyYWN0IGFuZCBkZXBvc2l0IGZ1bmN0aW9ucyBpbiB0aGF0IGNhc2UuDQo+IA0KPiBUaGlzIHdp
bGwgYmUgdXNlZCB0byBpbXBsZW1lbnQgdGhlIG5ldyA2NC1iaXQgUG93ZXIgSVNBIDMuMSBpbnN0
cnVjdGlvbnMuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0Bl
bGRvcmFkby5vcmcuYnI+DQo+IE1lc3NhZ2UtSWQ6DQo+IDxDUDJQUjgwTUIzNjY4RTEyM0UyRUZE
QjBBQ0QzQTQ2RjFEQTc1OUBDUDJQUjgwTUIzNjY4LmxhbXByZDgwDQo+IC5wcm9kLm91dGxvb2su
Y29tPg0KPiBbcnRoOiBEcm9wIHRoZSBjaGFuZ2UgdG8gdGhlIGZpZWxkIHR5cGU7IHVzZSBiaXRv
cF93aWR0aCBpbnN0ZWFkIG9mIHNlcGFyYXRlDQo+IHZhcmlhYmxlcyBmb3IgZXh0cmFjdC9kZXBv
c2l0OyB1c2UgInVsbCIgZm9yIDY0LWJpdCBjb25zdGFudHMuXQ0KPiBTaWduZWQtb2ZmLWJ5OiBS
aWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+
ICBzY3JpcHRzL2RlY29kZXRyZWUucHkgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdl
ZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCg==

