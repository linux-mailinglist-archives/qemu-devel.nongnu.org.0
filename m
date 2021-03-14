Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173B33A218
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 01:42:51 +0100 (CET)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLEqH-0007p8-VL
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 19:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEnO-0006Zf-QW
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:39:50 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:17389)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEnK-0004H8-6t
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615682386; x=1647218386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MIUMSs1BUIWTlweV8YaXA1b+2Jl7u0hVWRGUAdTJOa8=;
 b=X3CAES+UC8gNtUPtiPjERDd8gTdCkGspzbqj2dF6DkkqykybQzV1OPc/
 tKTp+YINUgJ3vX+rZsZqsTFE2WLMNTIU98ENp0fvrqm9mw44XNAYWPUik
 VbKon+T2GKM09HyjWrV8BnmRIF+6lheU62faRiW2xBNuAfQeHU+PCkt7r c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Mar 2021 16:39:42 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 13 Mar 2021 16:39:42 -0800
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:39:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 13 Mar 2021 16:39:41 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4263.namprd02.prod.outlook.com (2603:10b6:a03:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 00:39:40 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 00:39:40 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Topic: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Thread-Index: AQHW/d3cMUb/GhKg1U2DIZ/7+BgFyKpYYS2AgCcvXFA=
Date: Sun, 14 Mar 2021 00:39:40 +0000
Message-ID: <BYAPR02MB488669BE2DBB06AAACD416B3DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <ebb86dcd-d89b-3901-3c59-08c6bfb3ed23@linaro.org>
In-Reply-To: <ebb86dcd-d89b-3901-3c59-08c6bfb3ed23@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f00151e-c251-47f6-1cf4-08d8e681a758
x-ms-traffictypediagnostic: BYAPR02MB4263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4263C6D835928E5EF49152C5DE6D9@BYAPR02MB4263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vBgIha2qT47dnZQAE+iaDh/ymFipM4r679btGYZty65At1YA/nkNuZgtBNe59wlCmCPCdXGk0dvfBSx2KYexy2z/GBpQtabyUodvMbEo+O2cp6a1OPdh40n1saj57kE7zl80plgHPR7GLfQlAGbGO/wIKaf0QsTuLZNWDenBnXfvkAwb4KLeRvtFtZglNkjVLZMmzcdD8AmaVYRvU39Rd0WNQZzHA5A2cxuP47LV+uOlAXnT3NjZbKvEyfCL0ENFmwNRHAeJ4gZ5zMye3cHud/hkGJlDKglHnrXq8ybeuebMgrMTHJ/WaxQLl/m6e2mCBqdqWIbGHtFcmrwOg46m8GY6TQLOfS2d2zHiKcskFlWPujMWSbhSGMm48h4tKvan8ySorqOGx+gi209VOubCJtYnJXFin2XiCGzKfrUkfmoMfgvSy4Y9OM+bguGqOVc3Th6fR2tpy+8ntYbBBfCusPWqhnpUcxCUU+2OUSgMMxkNHRAP1ZoHZwhek/RLRD8lz299K3lZpsTB1rJQZSQ7yGBs6KwQnm65ZRaqSaoCc9k/trmydcor1d++z7pq/TVf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(76116006)(52536014)(55016002)(4326008)(64756008)(66476007)(478600001)(9686003)(66946007)(66446008)(8676002)(316002)(8936002)(66556008)(54906003)(26005)(83380400001)(71200400001)(5660300002)(86362001)(6506007)(53546011)(7696005)(33656002)(186003)(110136005)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dWpjYzlIcWhESGlSeUlqaTk4MlplNWtQT3AzSGlOTDRDRW9wejdVWGVrQzR5?=
 =?utf-8?B?RlAvNE1kRlBYUHlqdk9qZVFGZGVoNWJGQXZRMHhRMFRmYUFUdXBhRElOU29k?=
 =?utf-8?B?bW9LRktkRzU1R2JqUFVSMlg0bTl5SG5hT0Uyb2JySXFnZWltUm0rMmJMSVc4?=
 =?utf-8?B?eGhJZFdpdjAvK3NvdWQ2MVpYMElIeW9QaGVqcjN3V3FXUEZ0VllxSVgzdUpH?=
 =?utf-8?B?ZXRPMDdBT1Fnbm0wWVFza3lHRDdVSXZtYysybTVnajJnRTNxamltUzdLN1Zs?=
 =?utf-8?B?Qm9yektkWXBORnJXYjFPYXdsak5zeFhvVERGbmtaaU1XcU9NczY4dHdzUElk?=
 =?utf-8?B?T01wTW9Ya3NHMVh0VGh4Skxpa1ZPYVNWaVdpZmdTY2drbVVnSERpSVcxa3Rz?=
 =?utf-8?B?YWhkWndhdndSMDh6ZlFaNHN6dEk5ODhMSDQ5eTJvaStjUDhwaWRQZDI5ZmFu?=
 =?utf-8?B?THpaVmFnd1Ztbk1xTUZuak1EWVMwZnJzTWpNWWJqTW5OS3o4bzluN0NnbFhR?=
 =?utf-8?B?TDg1eFYzTmVUdmNoQzhBbGJtNC9ycW03QVA1WHpjY1k0UStNRWJsd0N6QURt?=
 =?utf-8?B?NFJrRTZucTVjZEdDaWNCZ1dYUXJPTE1MZWRvRUNNM0xVcmxwbWxWN21td2tV?=
 =?utf-8?B?ZGhpL2dSL3dCa0Z3ZGl2SWFHUjlPam1mQWE1c2dSVU5adEhEeGc4dXFHSThB?=
 =?utf-8?B?YUhRLzBjRFR5YTR2OFdib05EaExYWWIxYnJ5alpLQ2IrQnplSnk3S2RTVHhY?=
 =?utf-8?B?eGVxVFhNQ0dqMFRuWVh6ekhRVkZ5VkxNUEdWWmZMSEs5RysyR0xaalcxYWZM?=
 =?utf-8?B?OXZRYlFZc1NvWDZKZGVXOHQ3dlJMRGs4TUF5cUxXM21tMlpFdkdFNHYzUUZt?=
 =?utf-8?B?aFJHSDE1OVpzOGNvWk9BZk9GZHZsOGVhUzYyZVhmVmNoTnNlK1k1eG9sVXlr?=
 =?utf-8?B?ZnNzczdocDI2SlB1WlY2aGZCNm9ubmRPQUREYlMzaVB3aXZWOUtEbUpGdFlJ?=
 =?utf-8?B?Y0VzZVB1UVpRemF0ZStHL08zSUZ0QVRuNTZtYVJzUlFDVFpnbVBqS3Y0RDRr?=
 =?utf-8?B?RGpkUEUreDhKVnJjcGxEVUowUy9Mdm5kVS9USmhOV3dSdTNYQWVZbStNVldR?=
 =?utf-8?B?NkZUeTRWWWNBRHM5MmQ5UEhTNzJNRXVDZEo0VkFTNThyUFlncU82cE9rYmhU?=
 =?utf-8?B?UTZla2YzejJTRG4xeXRkRUxiRnlOdFZiK0pkTHM4MFhTVjJBVlVNaU8zWDdG?=
 =?utf-8?B?Yi9SQnMyeG9PK0k3dHNIZkVadmRsL1FPdjhjQlNFNHg1MThPSElyY3Frb0dr?=
 =?utf-8?B?Q1EybEE5bmlHYkYvMVYyUER0a2hxM1RhbjZDcUg3Y01xK1pJdEwydEFDTlVC?=
 =?utf-8?B?UXR3U2N3TEZMdkJHZ3l4bFdIcm1Zb2QyTVhVZWdKWWxpenlBWW9FN1B2WGpP?=
 =?utf-8?B?YXdlN0k5OSt0Z08xMnFla3pKSlRyc2hxWm4rM3ZCMTQzZldlRDlmbll5MTli?=
 =?utf-8?B?WEs0TWh5ckZLMCtLdEVkdXpNalc5ZVBrMHZRK0FhZTc5K2lPTUtjV3hGdXEw?=
 =?utf-8?B?N2NTbE03b0JTdXc0T3Z6OXRaNnZiL0FvQ0NkeURmNHpLU0ZqSEk1M21Fd1pZ?=
 =?utf-8?B?NEsvWW9keXFQTExZRUVtdVdxdGkyNXNsM2hSZWhiNCtQTkpGRzQ4eXp5SDFj?=
 =?utf-8?B?U0V5Skp3U1NvQ2lCNXRQR2l1eFRhRlVIcFNiRmwrWmhtb29sd3RxKzl2WU1l?=
 =?utf-8?Q?OmR4wL4Wd2f+HH5q8ThLLiYqpV21VwU96ZhlaRz?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8cF+5QssIoInwC1tKI4PEcYa0uoUbFvpAQuBfaozAJQd+cQAdus07QiuZx01vbP6Hjk8PWhjRM/DClxxJdc9kiRVWaiIBVnadZYjzQkIInYnkQXNj0Wv9fs8/8boNEvkQRVCyZ4Z4ZGeGCis9ZM/IRFG8kTxzDtaM4Fu/SWXYCY7j1RFOmyZW8SLSZV5xhFrJgOxRek76rmIvE1WEwArKzwv50upc4QQ7VSxHTfDaTRKADoca/JDTKo5AYwG2Oxjpxu4/vbzRqB39VCEFtBOyzupdkprBno/ZC/fMMwcBzfmb3MZDyEnxsp6vkA418s9YEKbFqnq7P90rZC64hJ9Q==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/uDv8RKYGuaRqTwvjQRafUYDh868GRTJXQvVuMBEjc=;
 b=QHpHziJFpNJt0Hsn6iiwQIII3f9bYThyF2+tln5+4WILLJoAXLbDM10CDIbofg7XGAYkIlDyTl3zHRaKKrmi017Y4nbQqkfqD63XsWeA6lP9R29BWVHX8nQG554mYMK+/g0eIurCNkkSlI7upIPApAcXB2FPNbaLS+ZQBg1gZyWQg2yfoKpCuOFDzdSqXfdUb9itsJzQNiYUTrx7cH+sQ2g+ilxngqIz2VHJLnrTTdbPtwLO9xYVwv07J7YqXOlAJc7Csh3f3bbwFH6+XI8YhplTRqk1Dce+IF9F6xnMomRgfhkq22YEleTe4Wy7G3VQC3Sp04O4fFltg5AS4zts2w==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 1f00151e-c251-47f6-1cf4-08d8e681a758
x-ms-exchange-crosstenant-originalarrivaltime: 14 Mar 2021 00:39:40.4105 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: BIu88pu6fD4+F76wfbSsCLHjfsrXjvJWg5fvDxSMcW0xaaNPFpL6d86vbi4D0Jjlxwp/4xuc8D8lMFT8U+A6hw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4263
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
cnkgMTQsIDIwMjEgNjowNyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDI2LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGdlbmVyYXRpb24NCj4NCj4gT24g
Mi83LzIxIDk6NDYgUE0sIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgZ2VuX2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZShpbnQgcm51bSwgVENHdiB2YWwsIGlu
dA0KPiBzbG90KQ0KPg0KPiBEcm9wIGFsbCB0aGUgaW5saW5lIG1hcmt1cC4gIExldCB0aGUgY29t
cGlsZXIgZGVjaWRlLiAgSXQgYWxzbyBtZWFucyB3ZSBnZXQNCj4gbW9yZSBjb25zaXN0ZW50IHdh
cm5pbmdzIGZvciB1bnVzZWQgZnVuY3Rpb25zIGJldHdlZW4gZ2NjIGFuZCBjbGFuZyAoY2xhbmcN
Cj4gd2lsbA0KPiB3YXJuIGZvciB1bnVzZWQgaW5saW5lcyBvdXRzaWRlIGEgaGVhZGVyIGZpbGUs
IGdjYyB3aWxsIG5vdCkuDQo+DQo+IEFsc28sIHF1aXRlIGEgZmV3IG9mIHRoZXNlIGZ1bmN0aW9u
IGFyZSByZWFsbHkgd2F5IHRvbyBiaWcgdG8gd2FudCB0byBpbmxpbmUuDQo+DQo+ID4gK3sNCj4g
PiArICAgIFRDR3Ygb25lID0gdGNnX2NvbnN0X3RsKDEpOw0KPiA+ICsgICAgVENHdiB6ZXJvID0g
dGNnX2NvbnN0X3RsKDApOw0KPiA+ICsgICAgVENHdiBzbG90X21hc2sgPSB0Y2dfdGVtcF9uZXco
KTsNCj4gPiArDQo+ID4gKyAgICB0Y2dfZ2VuX2FuZGlfdGwoc2xvdF9tYXNrLCBoZXhfc2xvdF9j
YW5jZWxsZWQsIDEgPDwgc2xvdCk7DQo+ID4gKyAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NP
TkRfRVEsIGhleF9uZXdfdmFsdWVbcm51bV0sDQo+IHNsb3RfbWFzaywgemVybywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdmFsLCBoZXhfbmV3X3ZhbHVlW3JudW1dKTsNCj4gPiAr
I2lmIEhFWF9ERUJVRw0KPiA+ICsgICAgLyogRG8gdGhpcyBzbyBIRUxQRVIoZGVidWdfY29tbWl0
X2VuZCkgd2lsbCBrbm93ICovDQo+ID4gKyAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRf
RVEsIGhleF9yZWdfd3JpdHRlbltybnVtXSwNCj4gc2xvdF9tYXNrLCB6ZXJvLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIG9uZSwgaGV4X3JlZ193cml0dGVuW3JudW1dKTsNCj4NCj4gVGhp
cyBpcyBhIHZlcnkgY29tcGxpY2F0ZWQgT1IuDQo+DQo+IElmIHlvdSByZWFsbHkgd2FudCBoZXhf
cmVnX3dyaXR0ZW4gPSB7MCwxfSwgdGhlbiBjaGFuZ2UgdG8NCj4NCj4gICAgIHRjZ19nZW5fZXh0
cmFjdF90bChzbG90X21hc2ssIGhleF9zbG90X2NhbmNlbGVkLCBzbG90LCAxKTsNCj4NCj4gb3Ro
ZXJ3aXNlLCBqdXN0IGxldCBoZXhfcmVnX3dyaXR0ZW4gYmUgemVyby9ub24temVybywgYW5kIG9y
IGluIHRoZSBzbG90Lg0KDQpOb3RlIHRoYXQgc2xvdF9tYXNrIGluZGljYXRlcyB0aGF0IHRoZSB2
YWx1ZSBpcyBub3Qgd3JpdHRlbiAoaS5lLiwgc2xvdCB3YXMgY2FuY2VsbGVkKS4gIFNvLCB0aGUg
Y29kZSB3aWxsIGJlDQogICAgdGNnX2dlbl94b3JpX3RsKHNsb3RfbWFzaywgc2xvdF9tYXNrLCAx
IDw8IHNsb3QpOw0KICAgIHRjZ19nZW5fb3JfdGwoaGV4X3JlZ193cml0dGVuW3JudW1dLCBoZXhf
cmVnX3dyaXR0ZW5bcm51bV0sIHNsb3RfbWFzayk7DQoNCg0KPiA+ICtzdGF0aWMgaW5saW5lIHZv
aWQgZ2VuX2xvZ19wcmVkX3dyaXRlKGludCBwbnVtLCBUQ0d2IHZhbCkNCj4gPiArew0KPiA+ICsg
ICAgVENHdiB6ZXJvID0gdGNnX2NvbnN0X3RsKDApOw0KPiA+ICsgICAgVENHdiBiYXNlX3ZhbCA9
IHRjZ190ZW1wX25ldygpOw0KPiA+ICsgICAgVENHdiBhbmRfdmFsID0gdGNnX3RlbXBfbmV3KCk7
DQo+ID4gKyAgICBUQ0d2IHByZWRfd3JpdHRlbiA9IHRjZ190ZW1wX25ldygpOw0KPiA+ICsNCj4g
PiArICAgIC8qIE11bHRpcGxlIHdyaXRlcyB0byB0aGUgc2FtZSBwcmVnIGFyZSBhbmQnZWQgdG9n
ZXRoZXIgKi8NCj4gPiArICAgIHRjZ19nZW5fYW5kaV90bChiYXNlX3ZhbCwgdmFsLCAweGZmKTsN
Cj4NCj4gV2h5IGlzIHRoaXMgaGVyZSwgcmF0aGVyIHRoYW4gYXNzZXJ0aW5nIHRoYXQgd2UgbmV2
ZXIgZ2VuZXJhdGUgYW4gb3V0LW9mLQ0KPiByYW5nZQ0KPiB2YWx1ZT8NCg0KVGhlIGluc3RydWN0
aW9uIHNlbWFudGljcyBhc3N1bWUgdGhlIHZhbHVlcyB3aWxsIGJlIHRydW5jYXRlZCB0byA4IGJp
dHMgd2hlbiB3cml0dGVuLiAgSGVyZSdzIGFuIGV4YW1wbGU6DQogICAgUTZJTlNOKEMyX25vdCwi
UGQ0PW5vdChQczQpIixBVFRSSUJTKEFfQ1JTTE9UMjMpLA0KICAgICJMb2dpY2FsIE5PVCBQcmVk
aWNhdGUiLA0KICAgIHtQZFY9flBzVjt9KQ0KDQpCVFcsIGhvdyBjYW4gSSBnZW5lcmF0ZSBhbiBh
c3NlcnQgdmlhIFRDRz8NCg0KDQo+ID4gKyAgICB0Y2dfZ2VuX2FuZF90bChhbmRfdmFsLCBiYXNl
X3ZhbCwgaGV4X25ld19wcmVkX3ZhbHVlW3BudW1dKTsNCj4gPiArICAgIHRjZ19nZW5fYW5kaV90
bChwcmVkX3dyaXR0ZW4sIGhleF9wcmVkX3dyaXR0ZW4sIDEgPDwgcG51bSk7DQo+ID4gKyAgICB0
Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfTkUsIGhleF9uZXdfcHJlZF92YWx1ZVtwbnVtXSwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcmVkX3dyaXR0ZW4sIHplcm8sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYW5kX3ZhbCwgYmFzZV92YWwpOw0KPiA+ICsgICAgdGNnX2dl
bl9vcmlfdGwoaGV4X3ByZWRfd3JpdHRlbiwgaGV4X3ByZWRfd3JpdHRlbiwgMSA8PCBwbnVtKTsN
Cj4NCj4gRXhjZXB0IGZvciBIRVhfREVCVUcsIHdoeSB3b3VsZCB3ZSBub3Qga25vdyB3aGV0aGVy
IG9yIG5vdCBhIHByZWRpY2F0ZQ0KPiBoYXMgYmVlbg0KPiB3cml0dGVuIHR3aWNlPyAgSXQgc2Vl
bXMgbGlrZSB3ZSBzaG91bGRuJ3QgbmVlZCBoZXhfcHJlZF93cml0dGVuIGZvciB0aGUNCj4gbm9u
LWRlYnVnIGNhc2UuDQoNCkl0J3MgbGVnYWwgdG8gd3JpdGUgdG8gYSBwcmVkaWNhdGUgbW9yZSB0
aGFuIG9uY2UgaW4gdGhlIHNhbWUgcGFja2V0LiAgSW4gdGhpcyBjYXNlLCB3ZSBhbmQgdGhlIHJl
c3VsdHMgdG9nZXRoZXIuICBUaGlzIGlzIGRlc2NyaWJlZCBpbiBTZWN0aW9uIDYuMS4zIG9mIHRo
ZSByZWZlcmVuY2UgbWFudWFsLiAgSSdsbCBiZWVmIHVwIHRoZSBjb21tZW50IHRvIG1ha2UgaXQg
bW9yZSBjbGVhci4NCg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

