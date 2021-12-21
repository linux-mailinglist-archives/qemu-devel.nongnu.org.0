Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B897A47C70A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 19:53:55 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzkGo-00016u-SM
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 13:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzkEU-0008B4-Im
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 13:51:30 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:25598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzkEQ-0006Qr-2i
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 13:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640112685; x=1640717485;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WS9+LOia5U8561MIvAKHKOJbpO68UGVcj2llsga0QDE=;
 b=h++0Lc0Px8sW534W5BhX284qLVsNi6BjDQ+93X9aYvDn+NgIwhj5dRbR
 MRwop/Qiv7uuqeQDPHYMIaOrmcrQnoRWh/HTFCbwVt30ybC5bi+CYr21K
 3RN43Fjaz5cUIhGYlkFgcdmsPLo3mcQsDhEci8tD4HkAkjx61pfBj4g6B o=;
Received: from mail-bn1nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 18:51:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7Pq5YnoEjqoA5hR1YAWWXPcb+pBERxC7gWjTzzXOvuVSdbw7JPqXySd8eyxZeu23qitzp0f/eCL66FM2x4Ke/pGNDC4CETNUM4NWZOj770ZHus6wuA1WCeYAgt+vOe4t1f2Y/ABVjuMpe5xs6usx6hOCq2btSgGm3DleBdXEQmnprlVVSWWG+IWnqWlEUVvt3Bz6j9JShgr3Cv0nL1Aa7GmylYQQ/xfkBzQEqWoE8p5aP7ADuGuleCs13gAFMDhyamOezOLYjUxHYAb+RGH6JB/ky+ge5u0rM68sJKjVx5ZsnlNdsSeNsnw7O/yVJpecITrrVhwtAhkP2O2VRhEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS9+LOia5U8561MIvAKHKOJbpO68UGVcj2llsga0QDE=;
 b=RTFcMT/YGaRaIWG/yDVujlXS0Rhb6ZoJ+ZbzT3IX7MlzRrhxpE688WXBwBGPzc4CZsYGRExSJbZj6o9RDZo51YVfkAqF9IS3Bz/IlCkWTrrAWptKQ4oWJSTQuGO5P8yhpFAZh8a649hJvd0hEIEvJz9BrNaVS7mez/XGk3dgMNvBTqwoXrseftxbzXr8xHmqasNresqYE/h2jgaNcSYGw7jyqL2er71Ud/YnB7QExhR3R6Q5lQUcb2YdVsgSn7ZgFzyQnZuE8dCDIoWT98f3hpOlU5b/1/fzKf3Z00jvtcGRdrFzMAbOsFllQfInSeJBTANYLfNPY1OeddMULqWVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB5518.namprd02.prod.outlook.com
 (2603:10b6:805:eb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 18:51:19 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 18:51:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 05/13] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v7 05/13] target/hexagon: introduce new helper functions
Thread-Index: AQHX8yS8d+0zBDNHnk+YfXywBOdpBqw9UIGw
Date: Tue, 21 Dec 2021 18:51:19 +0000
Message-ID: <SN4PR0201MB88089078C1A26216552A03B7DE7C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-6-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-6-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfd60f05-8923-466f-1634-08d9c4b2e023
x-ms-traffictypediagnostic: SN6PR02MB5518:EE_
x-microsoft-antispam-prvs: <SN6PR02MB55185BF3C9B39B0086470770DE7C9@SN6PR02MB5518.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16NYUEdhpmo0TAGE56zso7UfxOuSyHbqmkd6/t70hbtmzX1biBuNey4jzll2M5SyL+8pJRMLCe+VWGYUNgLaEafKlB1NTU7QSqrJJHNn2joyMsrutPqO2cBFdq3P5ToE1dqFXk7rGPMud2Kq2NvUNVm4yUJ2BFDgOUb7bY1xJmyzxA4tWVAIJCYez/f0uKzXd1QFS7+H0Zlvd1Ui0Y1CnGjG+d7PfTTe0YECqQzTZ3RDRAzDcL/+5NSHkvnoJ50SSwyUiEcZ4AWThLUQu7+Xia9NzSXMgw4xtsSEJDvdqm09a8b2PhSLQUgZBy/f1otUU31m8ULz2cdaZmXuPIPwiiP2syAPBNAKB1OvccovNg+2dz8LijdkIC/IxyDu+62TtJAiq7JnxjZ4xoa+ZLOkQ/cGM+qKGLANOkZfRwJd1vbXsEn3bdTHf/VPXU6CE8Aky1eJuH2hk/0aGWhebpe7Sgn4V7c+T26YoDgDIPrypENP2jbj7N9+nJXP0OakvyuIUyygMmgqWJq5JX0j8BvDue86/FMqK6LkV5qFRVDPZHaBqara1qBdpXq8dVM2CziDnaDVqXnS4YoRE67xMto4PpeYjONAh59AFWTbGO0GjhrNt+xxJtAGpBQx9ixOeDa5leDE5vQ5x53zi2NJC0zXUW5pVRHCBGi6+VAWpq1R6RIyayKUm1gX/vBzR0GBTm7R+oBFLQ4yGYwQNWWuu5xaiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(54906003)(38070700005)(110136005)(8676002)(53546011)(9686003)(6506007)(186003)(38100700002)(8936002)(7696005)(66946007)(64756008)(76116006)(71200400001)(66476007)(66556008)(66446008)(52536014)(26005)(122000001)(4326008)(55016003)(316002)(33656002)(2906002)(508600001)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZklyczY5bTI4NUpPUUNKKzFrN0tveWh1UERTdGZRMUM1M3JMLzVnMWtqbVUv?=
 =?utf-8?B?Y0pGRUVzT3UvYWZrN0pLZ0VrS0F3MlJjU1BzbTcyYzlISHA1Z0U3dit3b3VV?=
 =?utf-8?B?N2E1ZHIvVDdLaHpYaGp1a3Jlb0FERU1abHI5REpQeGlJc1VaK0FnKzRYcjA4?=
 =?utf-8?B?cFJtR3VHOFduMDBramlNOEY0dWVKVVRFeVlNK0pkN1pheVp2a001dnkxNFo0?=
 =?utf-8?B?S1RhdnQxS3F6OTV1L0o0dkVHUWNrUVgrK0FZakpSMkdITGpaOVQwVGk4N1lW?=
 =?utf-8?B?aWtvU0pJRU5aZ2hEVGgwYTUrTkQ5L01JVWVOVndaRE5CalplbmZnRW5hYmFQ?=
 =?utf-8?B?ZGI4VjJUMHZWVURGZVRBMlNnanM0S0xoc3JRVnR1SHE2SmpjM0NnWU4raHJ6?=
 =?utf-8?B?Qzc4TEExMjYzLzhVaThEaFo5OEtUNkNrSVdqNWRVTTV5eDhCd0NFR0lGdFZV?=
 =?utf-8?B?RUI1ZWhOVWUwQVBoU3lMRHQ3V2ZpV1F6RWpZUFF3UWNDSjdkejZQMU9Qc3Y1?=
 =?utf-8?B?ZVE1MkZJaDZxTVIrSnFNb0w0cnJzTkRtODVmSzFpakR5TXRHd2wxdDJ1R1Vk?=
 =?utf-8?B?b2ZzQVZrRFFEVDI3aFhDL3JRQWo2dlpncVovSXZ0dTVvVGk3TG5ZV0RBMGNp?=
 =?utf-8?B?RjdKUzhBdDcxdzk5bXN1dkNOd3Vjc0JlNWRpSk1DdFJ1MFVpK1UwUWJYdjhv?=
 =?utf-8?B?YndxNDc5UGxnUHNpRDc4c1puQ1Q3eVJMTVg5dGZNR3ByK3NJRlhpUEhYVTZW?=
 =?utf-8?B?UmgvemVrYlNtYWN4RnBDamZwdGZ3WE5qTUt1Y3NXcXZpZHF4V0FXNFJ4YmN4?=
 =?utf-8?B?WGJZaC9RUDhiMFpBdnRmRlV5VDU4a29BUncrekEwMk1ZWU50QUxmdnQ2bmp3?=
 =?utf-8?B?eWRjT3ZVTkZuM3ROVXE5eTV3TUFXbUVvWFl2bzdNL3NFWFhOemNGWkI2bVRi?=
 =?utf-8?B?Mlp0K1VCVVZlaVVFb0p3bGhTVnZZcmwwSkF2RVFTS3dRSnZUd2JSckZNUGRT?=
 =?utf-8?B?WWo1TkVMMnlNZ05ha0d0ZFlrM0hobTBxejB0LzY1UVMyVTgwNlNXaUFQK1ZG?=
 =?utf-8?B?VG0vNlB1QWpLSUJQQ1R0T0lac2puSjI1Qi9zejk0YVhWdmtnNWFYRmVuWFdO?=
 =?utf-8?B?SWN1L2pNbjltR3MrTlVVdGZxallsOEVrMW5JS3JRNlBoYjFPMXFCaVA3TzdH?=
 =?utf-8?B?NTkzalRyakp3VkFYUVVDZGZwbE9XV0lZcVRYdDk1K0RFN3pUWFRYaW9WaXlz?=
 =?utf-8?B?UUdpdGxjQW5VUHFTUGJLbzdHaXpBcXFqN0xuYUNtR2VmMCtiQjhtWHdhMklv?=
 =?utf-8?B?RmZTVUszV3RkbzVtSXZpT1cwWmVlYTBRU3VpV2lHaHMwcmF3NjBDRkkvTGxB?=
 =?utf-8?B?VWJjdWFRanJmY3ozaGIySTN2YUhIcE1mcFl1UDlZVHM3RGNXOGZjTEY1OGNZ?=
 =?utf-8?B?bXgzUE1ZR29xVVJmclZCWHJsNHcvNDNaODAwQU5LemUwK25OaTJyRFVYaFFB?=
 =?utf-8?B?YWM0em5MSWJ0dWpZVm50aDJuaTJJZ2N3UkVyNDRTQUdISG11b1NIQTVveWsx?=
 =?utf-8?B?K2tDc3NIRE5HeWxpTHVZa0ZPMTVEZDV4QkJFWDFFR2dDOUJaRVNvUnUrMW1y?=
 =?utf-8?B?R3N3c3dsSThaek51dGExZ3ZsbzFhcnpVdnROSmwwTC9nL3FMUTZUNlc2bkFF?=
 =?utf-8?B?L1lROHkrbDhuSHVtdEZ5SFdRQ0dkRU5WNGRTMHB4Q29NUU10V3cyR2ZHVjdh?=
 =?utf-8?B?Q3VCdDhGM3lFc2dmbWdXYzhHR21pc0RjN05ZbEV1K2k3VTJmOVAzZWFTVTVT?=
 =?utf-8?B?cllXLzNvWHJqeDNyYWtaSlhSOGFYcllvZHdFUHM4UTIrcCs3dXF5WU9TS0hO?=
 =?utf-8?B?L3VuUFFuQk03REFuMmgvbzFDMWpSZGdGbmFKcEhLei9ZU2g4VFBBdDFVRzlj?=
 =?utf-8?B?dUdZaDBkcUJOV3QwUE5SVm8xZjY2UjBmMTJ1Vmt0UWdZajRmSCtWNnh1cHVn?=
 =?utf-8?B?RDBaSnBQc1dTSG1vMUx4WEVqdG9VdCsxL2hCV3E0SlJseEZVTEdkMHF0YVIw?=
 =?utf-8?B?YjJPcEtNSGFzbDhLUmdBcnozQjF6ZG5TTTZGb3dVYU0vNG5SRUV3UXBuV25J?=
 =?utf-8?B?UllVSnhzdHZkV3Y1K2VLR2p0SkxqZ3BsZ1dBZ0lqd1VJSGsvZVBTcTBMVXZ3?=
 =?utf-8?Q?6Oekuobv7La5ltKwPDzk2RE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd60f05-8923-466f-1634-08d9c4b2e023
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 18:51:19.2160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNufTDUiIWHB1d7NBFuITKOKcWo2saiC/UziAFOoVT0Hl9WCEDgIbcq2zrOXiYRNBAb1+8SqNbt3MlSYYcGCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5518
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxNywgMjAyMSAyOjAxIEFN
DQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNp
bmMuY29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOw0KPiByaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAwNS8xM10gdGFyZ2V0L2hleGFnb246
IGludHJvZHVjZSBuZXcgaGVscGVyIGZ1bmN0aW9ucw0KPiANCj4gRnJvbTogTmljY29sw7IgSXp6
byA8bml6em9AcmV2Lm5nPg0KPiANCj4gVGhlc2UgaGVscGVycyB3aWxsIGJlIGVtcGxveWVkIGJ5
IHRoZSBpZGVmLXBhcnNlciBnZW5lcmF0ZWQgY29kZS4NCj4gIkhlbHBlciIgY2FuIGhlcmUgbWVh
biB0d28gdGhpbmdzLCBhIGhlbHBlciBpbiB0aGUgUUVNVSBzZW5zZSBhZGRlZCB0bw0KPiBgaGVs
cGVyLmhgIGFuZCBgb3BfaGVscGVyLmNgLCBidXQgYWxzbyBoZWxwZXIgZnVuY3Rpb25zIHByb3Zp
ZGluZyBhIG1hbnVhbA0KPiBUQ0cgaW1wbGVtZW50YXRpb24gb2YgYSBjZXJ0YWluIGZlYXR1cmVz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5u
Zz4NCj4gU2lnbmVkLW9mZi1ieTogTmljY29sw7IgSXp6byA8bml6em9AcmV2Lm5nPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPg0KPiAtLS0NCj4gIHRhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTY2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5oICAgIHwgIDE2ICsrKy0NCj4g
IHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgIHwgICAyICsNCj4gIHRhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oICAgIHwgICA5ICsrDQo+ICB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyB8ICAxMCAr
KysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTk1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4
YWdvbi9nZW5wdHIuYyBpbmRleA0KPiBhZTc5OGU5MjFlLi40NGExZWM5Y2NmIDEwMDY0NA0KPiAr
dm9pZCBnZW5fc2F0dV9pNjRfb3ZmbChUQ0d2IG92ZmwsIFRDR3ZfaTY0IGRlc3QsIFRDR3ZfaTY0
IHNvdXJjZSwgaW50DQo+ICt3aWR0aCkgew0KPiArICAgIGdlbl9zYXRfaTY0KGRlc3QsIHNvdXJj
ZSwgd2lkdGgpOw0KDQpTaG91bGQgYmUgZ2VuX3NhdHVfaTY0ICh1bnNpZ25lZCkNCg0KDQo+ICsg
ICAgVENHdl9pNjQgb3ZmbF82NCA9IHRjZ190ZW1wX25ld19pNjQoKTsNCj4gKyAgICB0Y2dfZ2Vu
X3NldGNvbmRfaTY0KFRDR19DT05EX05FLCBvdmZsXzY0LCBkZXN0LCBzb3VyY2UpOw0KPiArICAg
IHRjZ19nZW5fdHJ1bmNfaTY0X3RsKG92ZmwsIG92ZmxfNjQpOw0KPiArICAgIHRjZ190ZW1wX2Zy
ZWVfaTY0KG92ZmxfNjQpOw0KPiArfQ0KDQo=

