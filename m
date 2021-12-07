Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A586246BF5E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:32:04 +0100 (CET)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucRn-0000AQ-Gg
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:32:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1mucMT-0003zP-6s; Tue, 07 Dec 2021 10:26:33 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1mucMQ-00062I-0y; Tue, 07 Dec 2021 10:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1638890789; x=1639495589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5WqrdcTMRFP1J544DUeDz/axdJsvJO/xzYVTitXAv2c=;
 b=DhJLPBGalWNuRrow6TDi87Yp3FELDU+L342EGmt6HYJfZWpQOBpVxfUd
 Wm7TbGkOjK0eUxY0EaM+Vo8UL0x7ROndtfFMw3WxKCzPXZigkx3Ihndi6
 wFee8gr+WUX/XRfHxDTl2KCmMFQ0QFMyeBfHWvZ/h72/FSNmCAwSj/W+w w=;
Received: from mail-dm3nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 15:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbuekxhDbWZYIZIohHzxjrkyrgTL+qz6pmlX83adm36VU7NCvZUGBeGZwZ/kFVi6sSOQtwiYgUsN3n68vRCNP3NO0pjIi4Uk/FSxxHAMUeet8+gV88WBg9Bg387I+38oIRp3yJP4q+71z5wng/hnRXsBgPdAxuLC0u8HUX16kIIPAoWK1cMMq489Li6femyPbvEOBV7y0Y4oSoK36JqDEclmNdIdudlZvBkyMhwuv/rlYyNSstUX3y3IeLqPTGSLwwz6Z032g3oNhzgz5qCzqZK/Y8uVXCT+5CdMrgiQkGgU6kiEqrzPKXoRZbxeQWSvXfqn8ohBPwm+ELO4CoUlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WqrdcTMRFP1J544DUeDz/axdJsvJO/xzYVTitXAv2c=;
 b=TzIH9vXlRwaHUdxD+D0wLWC9QorLyEk8b+lx7D9awx8apGzH4x2pTc1XrDItU7CJo82Ft1hOMeb4V2UlbJyW4Vj7mHDQuvAzM8cXMpPmVwcsrIEMmrCySTx/HeSnfM1hd7fNZKXZL9j6vix/NvZaA2z4ANJRpKyQCbGmykOoe5UJ6wIfNEJxpwqtxHel8XVYoyWbdtplV14WSUcZ93r2bjUM6HQv99hL5C8eE3XJY8cY1d3CdAjKudNhxtNEpBCwJXF5V2AL/EkWo/V7OJg7dQZaiM2xK+SsQuSeus8g8lk5+leiBc3THkWObe3xI6+3LUe1KfQKw/z+gUCPMWjYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN4PR0201MB8758.namprd02.prod.outlook.com (2603:10b6:806:1ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 15:26:24 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 15:26:24 +0000
From: Brian Cain <bcain@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Thread-Topic: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Thread-Index: AQHX609h+dHXMtNu0UGpsROrGa0UTqwnFLkAgAAOhvCAAAMfgIAAAD4w
Date: Tue, 7 Dec 2021 15:26:24 +0000
Message-ID: <SN6PR02MB4205D1B02A9D9D37F80EEF0EB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
In-Reply-To: <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08aaa0c4-63f7-4bf1-e4b7-08d9b995ee1f
x-ms-traffictypediagnostic: SN4PR0201MB8758:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB87587D4E9F829FDB8AAC418FB86E9@SN4PR0201MB8758.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qht0Bp7rF6P3KnqFADlajjfSBiGs/BdpwEhU/3+4LKNEEN4AFF6pf+W2Eqka1dsNs8HnNHqQqGTMpFQ5On2AYWmdP7lve+QhM1G1tZv1VOZ0Rhoa/meMBQW0pRwmJ7p9PH8OTEeLb8AHQ9l00iy7hnQI3M7aj+pLvX5J4FLkesNaAeiJTzvQNwCqHqpjyV3B/WAYRPQNJMzkyxCW87vrOi98CD9DttzWjR7+L+DokvnCQoY/BMbwta0sfse0Ovmun8IutPB3SPpBqjNwr4lFKdP84ln/YYAFoaI6JLFPf6LCe+1nnFEjBnBWpHA4/NnY7njoBM279xSdtZKM+6++Z9PqRvlqFnvEw6j9B2vogfdNwvhI7ku8nZ7NIWau2+SPJoheQ8WaaB4VNG8Bey038pnnil2vRrcJELGm6zVJPMRM1y3BFH4mY1J7NnaWyZMHuro8Hsit110J2i1jJVhE5b3CuE5ABoxB9rz66xFbsIdbdkDjDRlm3C31vRPirO72nc87wsvgCEgNaLuE+3ec4pkJ4TXJWZkGbStBpHa/0y+MzQRptcc0LYAPzmzJvBm+pK/W7i27E2goNFKmSHVXXnPi6FEWqfDRaZuJIBOR7tmRo6gaSOneet/QoxyWqNQVcjK9la6XM7nguTTrpkJNgUt1EiWV36yzytqGbJ/yff737FwB/9/dsgF43uQnd+0UIRVtgOlCJZdKnLR4oulaUZ9pnKxsa4bQQhv0Kn6qvWCNRgxFee+5isUq629j/XCWs4/GKyS++0dZtvNIRJW2E6CffmKuFPXOZpWfjXsppfM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(8936002)(6506007)(66476007)(71200400001)(64756008)(66446008)(86362001)(9686003)(186003)(38100700002)(5660300002)(8676002)(33656002)(55016003)(66556008)(6916009)(508600001)(4326008)(26005)(52536014)(38070700005)(7696005)(66946007)(54906003)(83380400001)(316002)(122000001)(2906002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFFjTVo0UThrek9GYUZBZWZrcVNQb0ZwNDlxUnNWTVdMbVRmN0draFlMLzk4?=
 =?utf-8?B?Vit4ckFHSHI1WWJSN3hkZ1ZZRldlQ1IyN1VIOFBDWHpZbi8vNmlUYi9MUDRi?=
 =?utf-8?B?R09rVGMxQ0ttVllJanhmcENXdkZjamY1aW8wTzNZcU5mVkdvem1DMVk2ZnhY?=
 =?utf-8?B?bTNJOWgrUzNmNjZPL2pEOVlpcUNROHcvWURjRjBsY0xCL0thUllrWEhENVpW?=
 =?utf-8?B?cXlDRW0wYllRWklVRHdLZmE2a3dCVDFVWUtOZTRXZWwxZ0dSUWlUaTZ0RkRl?=
 =?utf-8?B?cFNCRGowRVVGZVljUEhBTWJzbk5PN0x6dXg0alFyWi9JR21iMk9zdVhSV2VT?=
 =?utf-8?B?K0xORzZPNTI3dnlkOUlGUUN3WkJYVjdDaFdCK2NiL0lLWjFheWhRQVZyQUtn?=
 =?utf-8?B?cjhEVUxpcUJidFRjVXNyTXBQREZvbk5jMUlOSFdwTUNVMnpGekkwMDQvaGVa?=
 =?utf-8?B?ckR1dXhpZjBoK01Fc2hENVVvdDJoTVY0cERxUE5TNzBSazIrbDFzdjVIZWE3?=
 =?utf-8?B?M0c2OWJKVmUxZFRWeStkVHVYaUo5NlN4Mk1oQklLaWwrTG1uWExwN25wUnh0?=
 =?utf-8?B?REpna1VjK2Vyd05GNytGL0h1d05WSzVNTzVsaFJwbEdnYmJBWk0rYzJWck84?=
 =?utf-8?B?NmgxajlTU3ZBaGZqYTZvZXlhNVJmQ25HS1VneUhGUDhlVmdMdWtwbkpZQmJn?=
 =?utf-8?B?UW1UWUE0ZFN0azZ6Skp3UmF0TUtFbXlyYzc1cW9vZVNPYVBodUdrNXVtaWwr?=
 =?utf-8?B?VmlsYlRKanlPc2hoV0JITHZXZDNGRDc1S2U1c1NTYTVzTWlOU0dZSEtzbEx4?=
 =?utf-8?B?QUxsZDAxWVdid3p2RDZvNFZZdDhRaVhiNC9EL1hkdnRTUTYySURLQy9XTEFo?=
 =?utf-8?B?NlB5V0NTb0RmYUNVS1V2ZnI5MnBZT3dFQ0NIKzJyQ2xvVi9OajBZbmYxemNj?=
 =?utf-8?B?a2huVENiYjNyOHZOaFk4MnRpMk0vN0F2WWFSNFp6NnVjVVVYTXhVbTM0YVZ0?=
 =?utf-8?B?QVpiNUd1Qk9SZVNhYlVINTlWWTBGUjBXeCtsRWRaQ0hBWVJRRFczM2xKOW02?=
 =?utf-8?B?M0YxeHpzUVowcEdScVlha0xKWTQ4NVRTbnBzWkhzT0xVMUZ3VlBrT0w4cjdM?=
 =?utf-8?B?UG1RdlovUDVmQjNHWUdnZ1o3UUNXempteVY0eVB4eUpKNTEzYnlMOVRxZkZq?=
 =?utf-8?B?eGpFczB2RUZqZ2JqeSthTWl1dDJkbmVPQjBWR2xZU2M1WFdKR0tHdWlmc0V1?=
 =?utf-8?B?amJmUjdTMFdrZjVNSThWZUlWcG8xSEdHNXZ0VkQrdTR3eVhqeGpyQTcrVmRJ?=
 =?utf-8?B?dlpXcmUrcFFnZlArVTdUOEFEQVBLUlQwSmtwZFVOM1U4SVpQM0JvV25HQWtl?=
 =?utf-8?B?UjlCcGc2Q1RLako0WWxQWmpYUHVrMm9jWkYxV1RvcWVPR2pTdmJHM1VYdWd3?=
 =?utf-8?B?NHlMVksveW56bGdCNlpHcG9DbE5LUDB2NmNvWStjd2liQkRHOFJ3cGJxV2gz?=
 =?utf-8?B?Nmc1d05KL3RJSTZhWVk2VlhRZ3lCNGkwL3lrQ0tNRU85bnJPelVYTnF1V2o4?=
 =?utf-8?B?U3hEU3IyQlIzVERFdEdiTDM4OUNQaS9RMGpxUzZsVEpNaXZrcWl3aGxQdHdq?=
 =?utf-8?B?dDVCRzhyQmlOaGNmek1UajcxNFFETW5vclZ6ODRHSUpkZXVIOUFjaDRpU2Mz?=
 =?utf-8?B?VWJBcmhzajdwd01YZURFZmd0UHg5dy9HNlJKOUtmdHp1QVVlR3ZBaWdJUGVl?=
 =?utf-8?B?VisrTEFzVnMzYnlpbkFRS1c1bVhyUm1xZGY2eWVUNURvMUIxNVkrdVJSYWpO?=
 =?utf-8?B?clA2SzFuRksydzFWTlVmSjRuZUgzUU1XY1hjK2tlN0VsR2t2VjlKSWpHUzVa?=
 =?utf-8?B?c3RIdVc3Z0xjVFowTWU0TTJkMmhtellKWUxrWUtEOFY2SzZJRFdhbGFtcU9V?=
 =?utf-8?B?cW5DNENPVFBGb29PU2pNY2pma1Z3U0hpNk1wVjBHTXVNNDBDclBTWHJmcjBj?=
 =?utf-8?B?bUFKYlQ0dCtKQms1SUN1TGo1TTFZTFNINzNSck9rdlhKb3pHK3p6c2hBeUEy?=
 =?utf-8?B?Q1gyU1ptQTVSZXZDbDRZcEpBUTN3dy8rOVhFVnk3RHplTzFGNU1HdVRSeEhR?=
 =?utf-8?B?OWRXV1cxZHh5NWE0aDlxcnJ2SG4rbHBDTXpxb0lNcWZqS0picWpLc0Y0N1dC?=
 =?utf-8?Q?DVguf963FJVnGgBvU6UhE+8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aaa0c4-63f7-4bf1-e4b7-08d9b995ee1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 15:26:24.4719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNX+Va7CwT0P9Fyq7PxM0AMa0XcGmbD8IJOKN74/ea3q3iALbhkRkxa6COyrxtsIIa3lG2/jE40EyoAq3OujhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8758
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Sid Manning <sidneym@quicinc.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KLi4uDQo+IE9uIFR1ZSwgNyBEZWMgMjAyMSBhdCAx
NToxOCwgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+IFBldGVyIE1h
eWRlbGwgd3JvdGU6DQo+ID4gPiBJIHdvbid0IHRyeSB0byBwdXQgdGhpcyBpbnRvIDYuMiB1bmxl
c3MgeW91IGhhdmUgYSBjb21tb24gZ3Vlc3QNCj4gPiA+IHRoYXQgcnVucyBpbnRvIHRoaXMgYnVn
Lg0KPiANCj4gPiBJIGtub3cgdGhhdCBRdWFsY29tbSBlbmNvdW50ZXJzIHRoaXMgaXNzdWUgd2l0
aCBpdHMgaHlwZXJ2aXNvcg0KPiAoaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvZ3VueWFoLWh5cGVy
dmlzb3IpLiAgQXBvbG9naWVzIGZvciBub3QgYmVpbmcgZmFtaWxpYXINCj4gLS0gImNvbW1vbiBn
dWVzdCIgbWVhbnMgbXVsdGlwbGUgZ3Vlc3Qgc3lzdGVtcy9PU3MgdGhhdCBlbmNvdW50ZXIgdGhl
DQo+IGlzc3VlPyAgRG9lcyB0aGF0IG1lYW4gdGhhdCBpdCB3b3VsZCBub3Qgc3VmZmljZSB0byBk
ZW1vbnN0cmF0ZSB0aGUgaXNzdWUgZm9yDQo+IHRoZSBvbmUga25vd24gY2FzZT8NCj4gDQo+IEl0
IG1lYW5zICJpZiB5b3Ugc2VlIHRoaXMgd2l0aCBhIExpbnV4LCBCU0QgZXRjIGd1ZXN0IHRoYXQn
cw0KPiBtb3JlIGltcG9ydGFudCB0aGFuIGlmIHlvdSBzZWUgdGhpcyB3aXRoIHNvbWUgb2RkYmFs
bCB0aGluZw0KPiBub2JvZHkgZWxzZSBpcyB1c2luZyBhbmQgd2hvc2UgdXNlcnMgYXJlbid0IGFz
IGxpa2VseSB0byBiZQ0KPiB1c2luZyByZWxlYXNlIHZlcnNpb25zIG9mIFFFTVUgcmF0aGVyIHRo
YW4gbWFpbmxpbmUiLg0KDQpPaywgZ290Y2hhLCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9u
IDopDQoNCj4gVGhlIGJ1ZyBpcyBhIGJ1ZyBpbiBhbnkgY2FzZSBhbmQgd2UnbGwgZml4IGl0LCBp
dCdzIGp1c3QgYQ0KPiBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0IG1lZXRzIHRoZSBiYXIgdG8gZ28g
aW50byA2LjIsIHdoaWNoIGlzDQo+IGhvcGVmdWxseSBnb2luZyB0byBoYXZlIGl0cyBmaW5hbCBS
QyB0YWdnZWQgdG9kYXkuIElmIHRoaXMNCj4gcGF0Y2ggaGFkIGFycml2ZWQgYSB3ZWVrIGFnbyB0
aGVuIHRoZSBiYXIgd291bGQgaGF2ZSBiZWVuDQo+IGxvd2VyIGFuZCBpdCB3b3VsZCBkZWZpbml0
ZWx5IGhhdmUgZ29uZSBpbi4gQXMgaXQgaXMgSSBoYXZlDQo+IHRvIHdlaWdoIHVwIHRoZSBjaGFu
Y2VzIG9mIHRoaXMgY2hhbmdlIGNhdXNpbmcgYSByZWdyZXNzaW9uDQo+IGZvciBlZyBLVk0gcnVu
bmluZyBvbiBlbXVsYXRlZCBRRU1VLg0KDQpJIHVuZGVyc3RhbmQsIGFuZCBpdCBzb3VuZHMgbGlr
ZSB0aGUgcmlnaHQgY2FsbC4NCg0KVGhhbmtzIQ0KLUJyaWFuDQo=

