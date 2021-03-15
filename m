Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E833A9B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 04:01:37 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLdU7-0007lS-Le
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 23:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdSD-0007Lu-Vv
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 22:59:38 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:60806)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdSB-0007sQ-G3
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 22:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615777175; x=1647313175;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HrtHfeSrk5FrmjLozXtvMdtKXrqBYNZxHwkA3UauDwE=;
 b=BqJf0n8GPEWqsWkR1vNHLrTj+HoCVZMQefegvP41Et0lmECVvQsZGYvZ
 5PbJdYg+Eg53TnVk59h18nauarY9+bTbX2nDUHofEbU0Ig4ANjLK/9kEQ
 XhUySsUehmgLjXJQJaNJkSytrIA+pZ6FBeO8SiwXMUXTePfydCZjjvI8I k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2021 19:59:31 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Mar 2021 19:59:31 -0700
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Mar 2021 19:59:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sun, 14 Mar 2021 19:59:30 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5480.namprd02.prod.outlook.com (2603:10b6:a03:9a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 02:59:23 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 02:59:23 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
Thread-Topic: [PATCH v8 27/35] Hexagon (target/hexagon) TCG for instructions
 with multiple definitions
Thread-Index: AQHW/d3PFfddo1cG80O41eolcsYrP6pYaKqAgCb8gQCABJdtgIAAlaTQ
Date: Mon, 15 Mar 2021 02:59:23 +0000
Message-ID: <BYAPR02MB4886A7EDF00469BA4BD25296DE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
 <d08c59c0-4cc5-0ffd-a1fe-11fe919a3394@linaro.org>
 <BYAPR02MB48866F4E9721399EEE58AE73DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <3f3b07b0-7026-b380-9459-8149fa50400a@linaro.org>
In-Reply-To: <3f3b07b0-7026-b380-9459-8149fa50400a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5ca2eb8-c8d7-4ee7-7668-08d8e75e5668
x-ms-traffictypediagnostic: BYAPR02MB5480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5480762174DAF52F3DD1097FDE6C9@BYAPR02MB5480.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhzGIaIJ8Wswjm5UNANZwlqq9DKC035WeycgC72A2FazkQwuLZsLmUG3CpjEGSLfy4WPmtoOlJBAwQJzsrsvLe3ONYfjhn4WjsQjUEt6i3kEATQCBiKUxZ1yM17nm1F2ylXdtD7JIrgiS7JSZULkEq/sdxwMRRIONVPMCBEwMP1g86TDLSt6DarMRoNiPpBJNDqx1mOOjQS/l/4ebIn6+Ry+iUJX/RsxhZkoEmfv42Y4/5t6ODNXwnRK3VQusMYnW8QMHpbbuy+18kK+XSj/IaokcUW1K8f6s6xq8sf0AfXDVoXFJM8evUGZTQJGfxivEVWJIr+x9sjeV3d0HBRZRlv9V6Kmv8WzeXUxkZ9LDVG7ZEnEq9deCVm7gs01TlgDsL7S7a6WLFaGCMA2RryjFrwCwMjSfXI0WYkbnhpYPiHTqlggTDLseI6dIelwauqLLLE/5CYY3NozkNn5n7lzQ5+JiVns/5H2BnkccbG2nw5U9F/0lWxlcl9SzROn241FgNQrGuiFco06CUiRkHFL6NSdMXGkq9F4lVmKvF/7W1RoU7wRTe8f0Zwlf4LE3HdY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(9686003)(71200400001)(2906002)(52536014)(55016002)(26005)(86362001)(64756008)(66446008)(5660300002)(66556008)(4326008)(7696005)(66476007)(54906003)(478600001)(76116006)(110136005)(107886003)(66946007)(53546011)(6506007)(316002)(33656002)(83380400001)(8936002)(8676002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFNGQWpCdVJiMVR1UGhaeG8zQXhRVks3QjI0OHV4WjNOS2p5TGdJVDdqUU1k?=
 =?utf-8?B?N2xvV1RQV0ViWi81eDlaMTduM2xBTWNNeUpaRk9iZ3Z6QS9SbkFrTlRwRXdi?=
 =?utf-8?B?OWN4UE9uQVRza1I1N3pINkc0RzI3Y1owRURleDZydWhpV1V4K1ZzNnlobVFs?=
 =?utf-8?B?ekhlSG9CZk9JMWRSYTZDL2IvUHFqdE82b0NOZVlJOFRkUjBGdWxncitWaEdx?=
 =?utf-8?B?VndHRGVuNkl6UVVXOTlwRkhOeTFoMkcyMThvT2MrRGdhQm1ja0lpWXptMjFH?=
 =?utf-8?B?cmg5UHRlRGQ5cy9YMUdZYy91RlEvSW9xTjdXVlZCNUkzaEo2SHpSeUdWYnNO?=
 =?utf-8?B?KytrbWJBSFFOeUlObFJUQWRvL1FoRk5hRjc2eFlKY1hQQlEzVURvT1QxRStT?=
 =?utf-8?B?OHFzYUpycWo4QUt2K3lsaXZnc1hSeGRCUzRNZDlqQXVUZHd4WW5jWktYR25v?=
 =?utf-8?B?SEhzaGJDNjZKTDhLRU04b2pESTZWYnloU3l1SEFJMFNyTzhicXVuZU53dmsw?=
 =?utf-8?B?NHpYSEhweTdDTkVEYVRGS2xXWG90ak52bGU2UFBLbGs3Q1JYWmRUS0p4Zlpw?=
 =?utf-8?B?VHkzVDJZbUt4RXRuOXJHd2MxS1BZazNSM3g3WGNVdzBTa0ZRZy8wT3EydFh0?=
 =?utf-8?B?VUVlbU4zbm90NVVZNkRNZVhxNjJUc20yNEoxU1dnVGk2MUx4R1JWWlA0KzNG?=
 =?utf-8?B?RWVINmJIVkljRXlZeFNySlFsS1FibFMwQmFsSjV1QlRtamlnSmduYTd4M1k4?=
 =?utf-8?B?bXpqbUpXeVpwV2UwRitwazZFeGdNTUMxWTV3UkUvWnRvc2pHbi94bGRIUU5V?=
 =?utf-8?B?MXVpSFNvYVlYdXVub2t4a1UxWVNtZ2c5aFBESUJHUGNHeXF2QkFnbFM5aW53?=
 =?utf-8?B?ZHA5M2JHaWRuaU10Wml5V256QUhVb1c0WW5adDJtM1pRZnlBak9DWjlNMWhO?=
 =?utf-8?B?RWRGL3lBOHBYRXZ3elIwNzEzRFM1eFdaOFdGNFNPdlk1Slg5MExwUkRCZC9G?=
 =?utf-8?B?YUdvTjI5Y3l4cEhDTkEyQ2diT0pQa0gwVERsMG0xbU9Ib21vb0R6QmJRSmZ3?=
 =?utf-8?B?VFVlU1ovVjF3TXRpcjk2L0ZMWHZSa3VjMEhKL3RmdHZ6V0sySUZyNUFnN0Va?=
 =?utf-8?B?MjQrdm5BQmJBN1BBNWtySHNDdFhlVmY2NlBJckNHMkxuUlk0VGJtbUFMYVpa?=
 =?utf-8?B?dmN5NzNiNHNBTDVzRm5RdEl1d2ZLeXhiWThNakFGc1ZDVW4rVjhMSVVhZXZF?=
 =?utf-8?B?NGxuL2lGZlY0WnEvN1d4cWpoZFE3UDNFcG4wU0hSTEpLOHJzQklneWMrTkww?=
 =?utf-8?B?ck51NG9rWVhVcm41QkdXSVRzMFpPWi9nN1U3OXk5RVZwbDllbHlyNGxpemNn?=
 =?utf-8?B?WWswM3ZIU0ZlRFA3VVU3MjJ0US85RlF3OEdITXBZbEZCMW9CNXAwanUwVitS?=
 =?utf-8?B?TEViODFBNEtZUVRsZmRDa1pxOHJsZnlEQVVlYkl5d1REM2tTMEQrQ3RRNkt3?=
 =?utf-8?B?UkNCM0ordUFSMVI2bzVXd3NiQ2JrdEJGUjI4UU9tQ2dRVHRTWDByY3JTdjYw?=
 =?utf-8?B?dEpZSWg2Yi92U3ZncVllbzBmK2dHMmU3YjFKRTkrVTBZMHJEYlZ1eCsraTJN?=
 =?utf-8?B?YUs0OWVnb2VtTUdkOGJJZWRBdjBieEhmTmZtOG1ZSm92Vmp2V1hiNEZDTk5o?=
 =?utf-8?B?SytQYmZGY0FVRE1lQThqdi9Wc2tKTU1pZFErRnZHMHd2bjVsTFZCZ3JmNGdq?=
 =?utf-8?Q?CRBH9r2UAHqqjvUeIHezfkw5MIpRjH2Mx31BFzd?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCNhbJldxKyLrfTMJzcFqedgXq1FPpAf8/XVv9EePXgB2DALBFRVAz9OwDsBg1NXTowWPm9ZXhzg4vjPGvStomolNsVj4s0PM39SkU08Yi2h3MIosRjOE1tLYjJ/QOneyL5ZXCTUBs02OxDWgOw7/+9yFgBAZiJ5iwzuf+xNtXn6j6aENSNND7ndUmUd9IREKRHmFSyzpRKKmtVpuCmOO6GkTrGx/1Sb047Mep9gleKDxpkon+kVK4zBPyYk5JNVY1LK0rxptvQSaBIhJ66IQJbMLCSpfuiBSXyPyjeWa8hp/owBEtbfISV0TdHfaMihCu9rIe5dPMpFQAgVoqE1kg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUw55X/IWF0RnLCeavBFOGHxgmZoTEH27rOrX6JS9V0=;
 b=g7p27F+NtEpQz+76pQJcusKMeNGJkl3HDDxkEMi3E8FSu0ERwWnrtE3pfFCHFqzqtVo0O24PTbqT1qt/7uv3Qv4Zi9W95aR2NPNrGJEN06ONDdHcDz8icq3woJ8btCugMFUucI1ZH6rImbaudjuCZwehi74FayIGy04gZMApL0pvJifQTBhShcxuS3q7kTpjdKWySCMhkPavovNnp0KOR6z7w10HxoRuZCmFdqenuBXtqpppOxfAkUmhZx61bDpUUPMNHM+PO7HPCxMCgHKrfpUkFfcMy7dccaaywM3Zamr0BTP7gc3dwL/yFqKD9MXX2CNxf7MPljYidHon+rMtqg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: b5ca2eb8-c8d7-4ee7-7668-08d8e75e5668
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2021 02:59:23.3305 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: LiiP67U27eCW2HoE2mCrHPuesK5C6NAIHpKJbaJ0RNdXZ2eCkcSDrxnlQSjFHg+kxCpoNY2zLfeFkGH8HqBXIA==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5480
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgTWFyY2gg
MTQsIDIwMjEgMTowMiBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsgYWxl
eC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7IEJy
aWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDI3
LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGZvciBpbnN0cnVjdGlvbnMNCj4gd2l0
aCBtdWx0aXBsZSBkZWZpbml0aW9ucw0KPg0KPiBPbiAzLzEzLzIxIDY6NDEgUE0sIFRheWxvciBT
aW1wc29uIHdyb3RlOg0KPiA+Pj4gKyNkZWZpbmUgZkdFTl9UQ0dfTDJfbG9hZHJ1Yl9wcihTSE9S
VENPREUpICAgICAgU0hPUlRDT0RFDQo+ID4+PiArI2RlZmluZSBmR0VOX1RDR19MMl9sb2FkcnVi
X3BpKFNIT1JUQ09ERSkgICAgICBTSE9SVENPREUNCj4gPj4+ICsjZGVmaW5lIGZHRU5fVENHX0wy
X2xvYWRyYl9wcihTSE9SVENPREUpICAgICAgIFNIT1JUQ09ERQ0KPiA+Pj4gKyNkZWZpbmUgZkdF
Tl9UQ0dfTDJfbG9hZHJiX3BpKFNIT1JUQ09ERSkgICAgICAgU0hPUlRDT0RFOw0KPiA+Pj4gKyNk
ZWZpbmUgZkdFTl9UQ0dfTDJfbG9hZHJ1aF9wcihTSE9SVENPREUpICAgICAgU0hPUlRDT0RFDQo+
ID4+PiArI2RlZmluZSBmR0VOX1RDR19MMl9sb2FkcnVoX3BpKFNIT1JUQ09ERSkgICAgICBTSE9S
VENPREU7DQo+ID4+DQo+ID4+IFdoeSBoYXZlIHNvbWUgb2YgdGhlc2UgOyBidXQgbm90IGFsbD8N
Cj4gPg0KPiA+IFRoZSBpbml0aWFsIHNlcmllcyBvbmx5IGhhcyBvdmVycmlkZXMgdGhhdCBhcmUg
cmVxdWlyZWQgZm9yIGNvcnJlY3QgZXhlY3V0aW9uLg0KPg0KPiBUaGlzIGRvZXMgbm90IGFuc3dl
ciB0aGUgcXVlc3Rpb24gcmUgdGhlIHNlbWljb2xvbiBpbmNvbnNpc3RlbmN5Lg0KDQpTb3JyeSwg
bWlzdW5kZXJzdG9vZCB0aGUgcXVlc3Rpb24uICBUaGUgc2VtaSdzIG11c3QndmUgYmVlbiBuZWVk
ZWQgYXQgc29tZSBwb2ludCwgYnV0IHRoZXkncmUgbm90IG5lZWRlZCBub3cuICBJJ2xsIHJlbW92
ZSB0aGVtLg0KDQpUYXlsb3INCg0K

