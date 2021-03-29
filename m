Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22D34D9CF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 23:57:30 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQzt2-00049P-Vh
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 17:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lQzrY-0003cc-BZ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 17:55:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:57427)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lQzrV-0007tS-Oy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 17:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617054953; x=1648590953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gWI8Tc29WicqO7AaMZhb4zeF+h+q4i72sKlm/+rrD/M=;
 b=yy7CNmEMvHtmLllBU602+Qhx3Zf5kVXtH2AYeIpjZZ+XxtFiVCR2d2o4
 PTI8KzNepLQp/wY9LsCxnvUQBQ7f7Q220XbBPHPOVBDBHV3e5CDHz0PvY
 4P5dDLLIjxd4PRlhQKjJgzHPbAU0uXgcA5HFapbIV82MMtbqSZDAhu1sV s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Mar 2021 14:55:50 -0700
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Mar 2021 14:55:49 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 14:55:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 29 Mar 2021 14:55:49 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 21:55:48 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 21:55:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 10/15] Hexagon (target/hexagon) instructions with multiple
 definitions
Thread-Topic: [PATCH 10/15] Hexagon (target/hexagon) instructions with
 multiple definitions
Thread-Index: AQHXISGf2kFaQhbQpUWVzJOb5+25e6qU5HGAgAaKttA=
Date: Mon, 29 Mar 2021 21:55:47 +0000
Message-ID: <BYAPR02MB4886C169EC35ECC4C895B81FDE7E9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-11-git-send-email-tsimpson@quicinc.com>
 <a7ac0015-5e44-28b6-9ee2-a1ce0307354f@linaro.org>
In-Reply-To: <a7ac0015-5e44-28b6-9ee2-a1ce0307354f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 435169f1-041f-4607-0f9f-08d8f2fd694e
x-ms-traffictypediagnostic: BY5PR02MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB632441F167841C51C43599B9DE7E9@BY5PR02MB6324.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjbO2N0xHPDSpsRFcy7qXzNZHLjME2g9itEPd9A879j++jojITLhKJ7R0ZorBYmwDC0KjW0e7GhiZHTWPNkbMNpOgOW2O3ooCGhTD/CaSuCbFezDBu/5Hn1S4Flu5+y3X2g2mZmratLyFYHMiRaOz+RYieZYt2m7XDrgFfYMxqZBjL4hWpYgqUrTUfFHi/CGTuQQRU+unyVCzW6Ab19nySLm2wNLE4jcUS2MMe3tc7lTikj+syf1OKEvTYO8bq0pP+cFf3HM1s9NSutLfyTCMIRSWiyXq4QwTxw8hr03I2DHllCmQJI8JTnJ/AEfxT5Q3CEkwbk+GOf6nzcAO3mT2v3Vbzp4ocywhrBhLGPIk8BdxoBJgzbXaqtmZEqvPIuCMBlmfEQhKQEtO6iwRavch/nDlg6a/dMKUFesm/CtMtIFU4CzcGvyxddMdPyxzQi3KULpI8AW35h1R6uSNbjcZyHV3aFjwFHT5m1gX6xwkgD6PZsoFvnjPUNxa2wYdm6SreSYxkC+i2VoYKDrH3LP6pRAR8FfroC2ntDvkszXmpakltS+s2lNu5YclHdTS2gauHI04dEX2u9sKot4PocZ8uf/yIpp3QDFibs59TSoQy9RUAXZzrlRhJ0IHVFI/UBwgqwzjXN0RKJF/c8/u5Ub1qhbhGlwDu2q579AzITwi1Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(55016002)(186003)(66574015)(38100700001)(52536014)(26005)(54906003)(66476007)(8936002)(71200400001)(33656002)(64756008)(8676002)(53546011)(66556008)(66446008)(76116006)(9686003)(83380400001)(6506007)(66946007)(478600001)(5660300002)(316002)(107886003)(2906002)(86362001)(4326008)(110136005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V3p4aGlnMmdTd2pRSTFTVVhLaVJxMnNEVTd1eHczMmpsdlZlbzVkMGpNTzBu?=
 =?utf-8?B?a3hEUVpCbjJ6VDR5ckRnWmQ2NkNLQmZ2eDRodWMyVStkWHdCSHJKdVZYQ1o5?=
 =?utf-8?B?aUxPS1RzWlZodHJ6R0hjVU50YVpQd1oyaXE1WkZ2SitINzZiKzJ3NmJVUm9w?=
 =?utf-8?B?Q3FDUDhaUjF6WDZDTDZpY0dyRzYxUm9CT01zVkpsTEpjVy9qb2VJa3NRUkZs?=
 =?utf-8?B?cWs4WElMRXVGSy95UUsrYUw4TWFjYUFLczc4QUVrL3E2bnZtMGJvdVAxdHhN?=
 =?utf-8?B?bm4xUUg5dWRmSGZ3UU1nLzlITGpRaU5tMGZRNEg3VlBXMXhIUGRXR1F3ZUIx?=
 =?utf-8?B?VWcyMTRxMkp0VkxBT0xXdS9jMC8zamoyVnpMZnpjN3RLRmxNRGVGbmt6SlpI?=
 =?utf-8?B?Y05GTHN0amZCa05jL1NFaTU2Q2U3YmZCdVJ4aTA3aEJ5UEdwRW9qTmJjUnlX?=
 =?utf-8?B?SzVHeXIvNnNiNEpRM0pjNHZhK2tGSE51MDNaZlVjM0VhQzExRUFXd0dHcEVp?=
 =?utf-8?B?ZmJ2Q1dZajFjTHJuQmt2UUdYR0dtRjRHMWtsbWZiV0MwZVJNajF2VzdlMG5s?=
 =?utf-8?B?ZHpGR1Fnb05rRWVuU0lZMUpMY2ozR3M2bnhsVDMrbWtqdEhWSFBBQVE3eUlt?=
 =?utf-8?B?WDMzQUdhQ2k2bStWdFFSMkNJMjRGOHBMcWpEY3Nka0wycWZUenltOVNOM243?=
 =?utf-8?B?SHowM0I5UStIbURBQjlNRkYxZkZFMFowS3RyZldvZjRZdXJmdnhyV0x6MnEx?=
 =?utf-8?B?UmxqbHJ1ZUE3NDRiQWtoN0NXUmtQclozdFlNbjk0UExqYUlMNXpaV3NCLzln?=
 =?utf-8?B?aEQ5OXJjREVWS25GaC9DbUE0UWEzZTlLVEx6VzZ4YUdMVy9yYngwWDA0UHZC?=
 =?utf-8?B?NkVWV2VhZFBGQ1NLdURvS3ljdEhDOSt3a0RGZ291MGpVeWR3RDdDb1dVemE3?=
 =?utf-8?B?NVllUWhqQllFOExxU1pLK3h6eXNMcE9LY3VDdWFxaEdEUHU2TmVVZmRaSzlT?=
 =?utf-8?B?a0ZNMUwrekFLQUluUjVsOHlQNUlacGdrRGRjMDZmcUg1Uk1vWlJlb0d3Y1oz?=
 =?utf-8?B?eVhicndSbFhidGtBVGNEWHJXWi8yU2grUzJzMmVWbWpJdGpCVWJrV3NpV1dx?=
 =?utf-8?B?RDRhcXVpdHBtTHU4YVlwZzRtUStIYXBodmZMQmxSRE9memNOSWVtRFVmV0RH?=
 =?utf-8?B?Z3pKUDR6MEJjem91ZnVvOXVVd1JGOVU4eGo3bFN6WnFKWFlPQjZIVUZjNEFY?=
 =?utf-8?B?WHpENUwvb1BRU0s1RHpuaHY0R0hwNG1JaGdKMHZBb1lSTnIxZVk0anpBRzlh?=
 =?utf-8?B?d29HMFhGTWtSclUxMzEyWFJpUVFGZE9CeEJsUzNJK1JYaTF6NmVSK2VSTU5w?=
 =?utf-8?B?Z3k2OFhTemJiby9sRU5zMi9hUjF5cTNTREhRT2xBSXR5WW5vNUJ5UEh2cWFW?=
 =?utf-8?B?OVZSMERteCtrWFVrRXI1MSs2djE2ZjRYeTNIT2syZ1g2Y3kyTlBkU0hDdStU?=
 =?utf-8?B?RmJEMnByZUIwaGFQUnFYanBCSGZBRkZ0RVZwQ3g3UStyb2dUZDlmL1d6ZE4x?=
 =?utf-8?B?T05pajJRS2x2ZWxNNnRKakdjQnBPRHFkcUZveXV4b016WWdnczByQ3pQWWhC?=
 =?utf-8?B?Q2NyZlpUSmFXS2lZbHZFQllJU3B0bmp3b0kwVlpYWC9TRWs0bEVJNmNzN2s2?=
 =?utf-8?B?NVpIR0s1Tkl2elBmT0xYNktHMWlvVDFMZ2IvdTZJUXE0M0ZtcHdISXNZeVZX?=
 =?utf-8?Q?jH4ykljIrhix5LIM/AW3I4Hqp/UPsmImZ/ybWH4?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfCFv2o3znNNPHsdo9jl+S5JZdzv3fwG7PxQhvIQT1QXDOyqz93LhxNlsgmED812cBVllEX0tjrjNR6PuK7r9v3DaWA3nU/IWY3RlM19ybnlEEJvfGZKvaJBTiOLU4v4c96NwXY0TqtGOiDf1xyZzyx3ug4otY7fAR24rJgFBQH/6IGbPhn17Lhqg+B4gmmvHmJ4TXTOk1cTVRQ0iijUv7f6vQ+zx9CAh56qRUnvHZsVaEwFYIJoFOym0p/SFxMPQgZf0JuY2b4TqdxRblrzNGFo2gSZHX6eQGqfpHgPeMBjH1ngzxBXbnfOLhRx9Qor73nsAemdO0DYJz1He797IQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8phNpDsIhTt97Zwzxx1slL56BAZJwPV3QWF8tuJbVQU=;
 b=deSyWdTKRAweZvDNH/1A2hf2SfUov2nkaWfpEN4c0UczkA0usMYhA9nU5t7d16egkf9VWN+XRgyt/0K2U5Fd5uQgPRk02Zxdqxb+DlFedVCtral0xKP5myMDjUWlYEKb4afX1x2GxsZrxyc75afv51DNaMynFqlkp+I4pYOibr3KtfUhahi4S3cz+BU6nBDP0td7E/xf77QGU0unk1glgXlXQiKD/mX9kwrBylBIamtqJ7HF07yv6o2TC2b3pEebvYM3aDAC1jSYNv8guRSLTRLxCgQKPFA5as2sZj1Gl/DAlqWjuuoLMCiowHWkeXql7LF1ZK7LJm6UjADpIWE/gw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 435169f1-041f-4607-0f9f-08d8f2fd694e
x-ms-exchange-crosstenant-originalarrivaltime: 29 Mar 2021 21:55:47.8907 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: z7I1Bj95S4jzUEU8nDOhZwHp6ovYszB5pm9JvjsClZPkEIKNerhRvWUbeSuGyByqZ9Aidu/m+MHfT0RDFY6nDw==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6324
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJj
aCAyNSwgMjAyMSAxMToyNSBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMTAvMTVdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBpbnN0cnVjdGlvbnMgd2l0
aA0KPiBtdWx0aXBsZSBkZWZpbml0aW9ucw0KPg0KPiBPbiAzLzI0LzIxIDg6NTAgUE0sIFRheWxv
ciBTaW1wc29uIHdyb3RlOg0KPiA+IEluc3RydWN0aW9ucyB3aXRoIG11bHRpcGxlIGRlZmluaXRp
b25zIHJlcXVpcmUgc3BlY2lhbCBoYW5kbGluZw0KPiA+IGJlY2F1c2UgdGhlIGdlbmVyYXRvciB3
YW50cyB0byBjcmVhdGUgYSBoZWxwZXIsIGJ1dCBoZWxwZXJzIGNhbg0KPiA+IG9ubHkgcmV0dXJu
IGEgc2luZ2xlIHJlc3VsdC4gIFRoZXJlZm9yZSwgd2UgbXVzdCBvdmVycmlkZSB0aGUNCj4gPiBn
ZW5lcmF0ZWQgY29kZS4NCj4gPg0KPiA+IFRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zIGFyZSBh
ZGRlZA0KPiA+ICAgICAgQTRfYWRkcF9jICAgICAgICBSZGQzMiA9IGFkZChSc3MzMiwgUnR0MzIs
IFB4NCk6Y2FycnkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIEFkZCB3aXRoIGNhcnJ5
DQo+ID4gICAgICBBNF9zdWJwX2MgICAgICAgIFJkZDMyID0gc3ViKFJzczMyLCBSdHQzMiwgUHg0
KTpjYXJyeQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgU3ViIHdpdGggY2FycnkNCj4g
PiAgICAgIEE1X0FDUyAgICAgICAgICAgUnh4MzIsUGU0ID0gdmFjc2goUnNzMzIsIFJ0dDMyKQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgQWRkIGNvbXBhcmUgYW5kIHNlbGVjdCBlbGVt
ZW50cyBvZiB0d28gdmVjdG9ycw0KPiA+ICAgICAgQTZfdm1pbnViX1JkUCAgICBSZGQzMixQZTQg
PSB2bWludWIoUnR0MzIsIFJzczMyKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgVmVj
dG9yIG1pbiBvZiBieXRlcw0KPiA+ICAgICAgRjJfaW52c3FydGEgICAgICBSZDMyLFBlNCA9IHNm
aW52c3FydGEoUnMzMikNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIFNxdWFyZSByb290
IGFwcHJveA0KPiA+ICAgICAgRjJfc2ZyZWNpcGEgICAgICBSZDMyLFBlNCA9IHNmcmVjaXBhKFJz
MzIsIFJ0MzIpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBSZWNyaXBvY2FsIGFwcHJv
eA0KPg0KPiBPbmUgdGhpbmcgYXQgYSB0aW1lLiAgVGhpcyBpcyBubyBsb25nZXIgcG9ydCBicmlu
Zy11cCB3aGVyZSBsYXJnZSBwYXRjaGVzIGFyZQ0KPiB1bmF2b2lkYWJsZS4NCg0KSSBjYW4gZGl2
aWRlIHRoaXMgb25lIHVwIGludG8gc21hbGxlciBwaWVjZXMuICBIb3dldmVyLCBJJ2xsIGFzayBm
b3IgZ2VuZXJhbCBsZW5pZW5jeSBzaW5jZSBJJ20gc3RpbGwgYWRkaW5nIHNjYWxhciBjb3JlIGlu
c3RydWN0aW9ucyB0aGF0IHdlcmUgd2l0aGhlbGQgZnJvbSB0aGUgb3JpZ2luYWwgc2VyaWVzIGlu
IG9yZGVyIHRvIHJlZHVjZSB0aGUgaW5pdGlhbCByZXZpZXcgYnVyZGVuLg0KDQpUaGFua3MsDQpU
YXlsb3INCg0KDQo=

