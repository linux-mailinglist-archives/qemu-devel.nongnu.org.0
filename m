Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8841F205
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:18:59 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLFS-0003SZ-KJ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mWLCQ-0001FD-VI
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:15:51 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:6020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mWLCJ-0007P2-Ux
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633104943; x=1633709743;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UTdakV/KAAngU5yC7xC707/4F6hO8bs+0Ven5SVlcbY=;
 b=TTSW+/VcF1HnE6bXdnipGyaC1fQ3gFFglBE+RXzaLGUl5XajNcVqE7Y+
 /b6IEPMbJ7+UwCxccoGScHB1J8mx57VIVXRZRaBziaJ+d6K8e71Qrbiop
 XujDQzx7bwUOr+1JqLOhvtshL/5RxlKfL6kv6cqoz496u9pruoDF48V9f Q=;
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 16:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nz2JxatK4Az57mmxeIxy5ELeb8qIf5mXzdGS3JMWlYVp6ZMYuIdCuRMK3EimRvjd6UADssfdHD9FtEaht6BVBDd0RxTKQvzY+D8U9GA2myIfYmnzkoB9e5E1nCkEk1EY8fXQG/QGPnSIosANgTvvtBImOifNgVKkyiBTlSv1hRWBhCruw9JBtohR10I9+wcgVzdslwIghMGyr6ROcC4EsK6u2WA995DSzdZ6kCVk4csUZ7aziv0Y0vzTAbUxs7TkqFaeQQ5sy9r5Ob20Ba5ZPQhRg7gABksbG/yA0ehc/jmAqAK3H52mI00LUaSQv7N+kjnnmf66EaVZnGn3bKkGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTdakV/KAAngU5yC7xC707/4F6hO8bs+0Ven5SVlcbY=;
 b=fph5kKli//VCJjBybsL9ORMJlPVXvi2O95MGQTL34LLRWjHv2lx5OAzqPGgBA9knCpGwEfMGC9nsHOCW2CQPajsyMeeapZ1gdhrLvqErCFrlGy+hARQ8qSTmxW8Ji+B32v1rNZoIynuFmyb2OzLeb4WU8oB0C1Wq6/lNmO/Qu7Izbk9sjmLqFPM7LHL3IDfLin6zwN4XjQO5PF+9WhxwIV/ynKcJd2KsOXFwdOI68JXG4gQptjtSGG9vWObpR0I21E7NR0DThGmOjIQI2XNePYV2xN4PZVeOewTk0ETQ+nsavhaxkDDVslfqbbwai385SiYOormDTSRcdygQVDZf7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7401.namprd02.prod.outlook.com
 (2603:10b6:806:e1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 1 Oct
 2021 16:14:31 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::280a:7736:7222:e289]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::280a:7736:7222:e289%7]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 16:14:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) probe the stores in a packet
 at start of commit
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) probe the stores in a packet
 at start of commit
Thread-Index: AQHXtkB4jgvEseFn4UizJK5upcQf8qu+TPAAgAAC4XA=
Date: Fri, 1 Oct 2021 16:14:31 +0000
Message-ID: <SN4PR0201MB8808381F16740760F83D61DFDEAB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1633036599-7637-1-git-send-email-tsimpson@quicinc.com>
 <ea3a113e-703c-e8b4-1bd9-45ffe79ba6a9@linaro.org>
In-Reply-To: <ea3a113e-703c-e8b4-1bd9-45ffe79ba6a9@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f94f160-2acb-42d8-d14d-08d984f68d05
x-ms-traffictypediagnostic: SA0PR02MB7401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB7401EFFF86534C20013289B5DEAB9@SA0PR02MB7401.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ylZIJpjnJd3zt2GsMRt23RUv8F2OskambKUJCEZ2X7l3PCmU1WRnEB20bd/u+9Yw8fKO3PXev1XcF7HL/mFEWmGkfdKt431zqWk8Sw84rqf2ROcJjMA+s3BJQJEuHoZ/3AGolUUPZE4FgBZ3jBn6sONwrcgndMXvkCS2vO8LgmaZ/hLvdD9elHRCAhto0b6ISHvsl+FY8iOHrOT0NfWnBRi8dxaPGMCx1mx/S4m0WUIvABRXLNH7RqMM0EJXhk7ujPjOzvsy6rI6tMRQge3fDtBw6VnubKguHFyt4zCGjZPJPy9wQ4QySvgmekFRaVf0Xrq3frNVdwN7fsk8t+r5xPp7Fj9vv6MU8/34EkidY1q4IVDJZDdubV8C3iTGUG+a82mFvRwSSHLzzEQx/okVoTf+Ukd272UdZF6aM3FE7WQMU6Qb4/RbA4fgPiSxyyhxZsB67Fkftw5TQ1rxYBlN36AoLoqcEId21HlKJ382AM+1N0WChtuOuo9l2/1B9l0C79DXqytz1/8rg7kW6jzSCJ3VFShrm1vHv9fDLqaOn0YMvXIwe8VjAlj9jAcWJ5PtcaL/eazUSwvKlQtW7w7TADpuLuVf6JezGQiQeNsxb0sY+/GwRYndCJEKtOXRu9x/ujBkShrprU8PaAzFfCWe3FRfa4hIZtArIcmXM3u6ybGnryf32y+6GXmiEMfET9ltUR9TLJhvh3oKsUzyxLHnqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(2906002)(66556008)(8676002)(6506007)(38070700005)(186003)(53546011)(66446008)(55016002)(38100700002)(8936002)(26005)(4326008)(110136005)(508600001)(64756008)(54906003)(33656002)(71200400001)(76116006)(9686003)(66946007)(86362001)(52536014)(107886003)(316002)(5660300002)(7696005)(122000001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mzl0L2dGNVFSRTNicFEzanRRejI2U1RoZjRqM09IR3VOM3BFZHVmVDA1ODUv?=
 =?utf-8?B?ZnR2aFFGWCtiUUczZytTeUw5VG93T1ZiTFVJTUs2QkRZNnRaT21tWVgrMTR1?=
 =?utf-8?B?MEd0UFpGaE1Neis1S0swT2RHMkdlSTUxcFhHa3hwYUhZTTJVc3c3SVJsc1pk?=
 =?utf-8?B?aFdIRXRVT3hWcTgzS2t1UEg0eGJsSkx3RDk3N2RTM2dUZnhvU3NnUFRPYjB6?=
 =?utf-8?B?ZTVsQU1vVkQ4cU9sUWlCSmZNV0hmL1JDZ21RQisyVEtzSFFlWHZkdXZuSVJB?=
 =?utf-8?B?M0VCcjczWWxpeDk2YXN6ZGx0QlRaRytISitkaVlnZnFRSGFVYlVOdHRMdWU5?=
 =?utf-8?B?SkZ5TVlCditnWGRsNGozMzJ2US9RSGpsOUkrK0JOdlYrZlAzOVAxcFdwTHdM?=
 =?utf-8?B?MmZycEZHUUFEV0VUUGU3UXJXTm5YV1RqV2ZManV5OXo3MmthOFJpeDRiVXl6?=
 =?utf-8?B?RUphOHlwSVI1YTk4WndwbzV0anROQXoveHduaWI4WVR0ZTRmT2NIZWgxcUJw?=
 =?utf-8?B?dGZKUnRWVnFtOTJpcFZnYzlML1JjREMzeUtTQktwMzNiSnBFWDNpdkdQK2M2?=
 =?utf-8?B?NEtsOHlpWktEeG8xT3pGanlrb0htTnZUcjRJVDlwdjJQM0oyT2RBa3BlZDRj?=
 =?utf-8?B?RndVVUlpM0pMcGd2YkZZdDExNzEvZzdCQThQWWEvc2F1aEFIaEtOUjdRSXVl?=
 =?utf-8?B?TWh4TWFsZmU1SGRwVTJicVNOamVEUktqbCszcU1zbldQM1FuODNhZmZGQVdz?=
 =?utf-8?B?alkyQ2ZyT1c3NStlcnI5QkxiZTRwZklmdkpSVytJcDZaVVJvTlNhR2loMUtu?=
 =?utf-8?B?cnhRV1Y3RVFNVHBQQ1pBTUxCV1M2N2VsVWQ0YVZUZUdXWkJ2cmozRTdPZytS?=
 =?utf-8?B?a1R0cWFCRTlVWGFyRlNKK092UFhzdVMzWHlYa2dlcmxuOHNjN3FyNXR6T05N?=
 =?utf-8?B?S2tQV1ppNENvZEZxOGtJWWVhNmx4RTJOek5ERm1kVlFjajgrbnVYYldCWC9h?=
 =?utf-8?B?WWl2cXFJRHVFMCtYbUFUQXJ1M2FIM1RzL1FuMnBMM3J2cDNVbkx0bmxPb1RG?=
 =?utf-8?B?c1dva2pLYmQ0L1VOR20yUDM2eXlpcjNOWEVkM2RHZUZvcDF2bG9Bb2xvMVZG?=
 =?utf-8?B?WWpETlFFaEJyVFZZZitzdnVSQUlWK1ZTL2xRVEVVdzg4SlczRjZiRmNBdmQ3?=
 =?utf-8?B?bHEydHBVQS9TNGtDSGVML2RtZGw4K0duR0MybUs1VGYzOEp4RUJrSVJ0b25a?=
 =?utf-8?B?L1JtUWZjVWlQbEd6UUhGUURjRkF0RVNhSXVyUkE4SVd4S2h3VC82V1JUbmd1?=
 =?utf-8?B?akludnFQbFRRWENpb2xTSmZmV2lqdnl0eEljMFA2TDc1OUtRWWMxU2R0RDlL?=
 =?utf-8?B?NnovM1BjMStTZlFhTlpyeU9KQjRhclcvcDhkMWxHVDZUMEFTaldUUHBqdk5G?=
 =?utf-8?B?bk1JdGdkdnpmZU93bVloUkRhWW5qT1F4M3hLOTZ4OUJZNWcwejB4TEs1VGZt?=
 =?utf-8?B?dndidXdBampUdlMxSWNsZkFvQ283SUdmMzVNQ1UzVzFBQklLUkVIS3NHcG8v?=
 =?utf-8?B?WTFqWUE2cVFiMG9wZ0JNaEloYzNPaCsyc1JFWm5LWTRDYWJwZ21HSkFhdmc1?=
 =?utf-8?B?Y0pzem1lbUxWWlBsakRiRFcxRTNlU3NqV3NUdmJNSEhoa3RWSDhsdWNMZzdF?=
 =?utf-8?B?Z3cxejJLdmxXcmJ5NWxCZ0hvYVlpKytXQXNIcFlwejJTSjMxYUxPcG03VkRM?=
 =?utf-8?Q?ptDYZHtkahjtj+Fhhm6qNQyq3mcklhAMqi/LeHD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94f160-2acb-42d8-d14d-08d984f68d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 16:14:31.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKaAYRKjIXNO260wLQ27lHVrfuNiRANvtE0y29m4TU/EGSY9FgzKQzgyujpFI2/482sBPF7iCpEOiCxAmepPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7401
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2Jl
ciAxLCAyMDIxIDEwOjU1IEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGY0YnVnQGFtc2F0Lm9yZzsgYWxl
QHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBwcm9iZSB0aGUgc3RvcmVzIGluIGEN
Cj4gcGFja2V0IGF0IHN0YXJ0IG9mIGNvbW1pdA0KPiANCj4gT24gOS8zMC8yMSA1OjE2IFBNLCBU
YXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiArICAgIH0gZWxzZSBpZiAoaGFzX3N0b3JlX3MwICYm
IGhhc19zdG9yZV9zMSkgew0KPiA+ICsgICAgICAgIFRDR3YgbWVtX2lkeCA9IHRjZ19jb25zdF90
bChjdHgtPm1lbV9pZHgpOw0KPiA+ICsgICAgICAgIGdlbl9oZWxwZXJfcHJvYmVfcGt0X3NjYWxh
cl9zdG9yZV9zMChjcHVfZW52LCBtZW1faWR4KTsNCj4gPiArICAgICAgICB0Y2dfdGVtcF9mcmVl
KG1lbV9pZHgpOw0KPiA+ICsgICAgfQ0KPiANCj4gU28gd2UncmUgYXNzdW1pbmcgdGhhdCB0aGUg
czEgc3RvcmUgaGFwcGVucyBmaXJzdD8NCj4gSWYgc28sIHlvdSBjb3VsZCBleHBhbmQgdGhlIGNv
bW1lbnQgYWJvdmUuDQoNClllcywgdGhlcmUncyBhIGNvbW1lbnQgaW4gcHJvY2Vzc19zdG9yZV9s
b2cgKHdpdGggYSB0eXBvIGZpeGVkIGhlcmUpLg0KICAgIC8qDQogICAgICogIFdoZW4gYSBwYWNr
ZXQgaGFzIHR3byBzdG9yZXMsIHRoZSBoYXJkd2FyZSBwcm9jZXNzZXMNCiAgICAgKiAgc2xvdCAx
IGFuZCB0aGVuIHNsb3QgMC4gIFRoaXMgd2lsbCBiZSBpbXBvcnRhbnQgd2hlbg0KICAgICAqICB0
aGUgbWVtb3J5IGFjY2Vzc2VzIG92ZXJsYXAuDQogICAgICovDQpJJ2xsIGZpeCB0aGUgdHlwbyBh
bmQgZXhwYW5kIHRoZSBjb21tZW50IGluIHRoZSBhYm92ZSBjb2RlLg0KDQpBbHNvLCB0ZXN0cy90
Y2cvaGV4YWdvbi9kdWFsX3N0b3Jlcy5jIHRlc3RzIGZvciB0aGlzIGJlaGF2aW9yLg0KDQo+IE90
aGVyd2lzZSwgaXQgbG9va3MgZ29vZC4NCj4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KDQpUaGFua3MhDQoNCg0K

