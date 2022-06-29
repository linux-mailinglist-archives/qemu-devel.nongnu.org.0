Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7D56058E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:14:31 +0200 (CEST)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aKk-0003Dt-GI
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6aFZ-0005iZ-GB; Wed, 29 Jun 2022 12:09:09 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:5654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8179e10d56=pdel@fb.com>)
 id 1o6aFU-0000kj-O8; Wed, 29 Jun 2022 12:09:09 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25T8O8WN023833;
 Wed, 29 Jun 2022 09:08:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=UtZLYzwnSVOqQ9owqpS8nmnN+mGhGr1kDnc+dzoaUvE=;
 b=Zj+a3bV/CpVemOA6aKkgx/MFHgxEUARgp0fCpmXB8n0gR0dVfy26eQnUleuExJ2SPQ0b
 BWln/0/vdbv9Ay6ISNQXDiGTF8jkVL9mAPmq4zVbdK76DKqG1OLeMZ8eGlb9epgmT13D
 GBTUJbcrCzEUo4hosupRPCXKet19S/YhFN8= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3h00m4su0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jun 2022 09:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzPc+mhzz3qAiTCliLTbdrG+Flz6xWPFp5yeEin8yWzr0zZIR6dWatN8X9JZ0uUtfhAosBkK3OPm9zc7qcHc1Sas67gmbSw8gOxE2/FSQijE7tT0/MmpSvzK7PZEY7Jx9F0WWHgW0enkKJoa8YcFqY1jaoWJ50jAov3SUdZLq9etyd54ritVoi/3zL4ArwpoGIgkoGDGWH9lUYs8+FFTSRj6IwqVAwogIeeKAWK2BFRDJaFqbsyyZ3/nihe93mpwjAcc3H2+RIVU94NxP9J35PXObHQL3zfYCxC4rdt/fqo94ikK81slkMYpEnWsbiT81I/SXjNSMjgdlDyTz0a+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtZLYzwnSVOqQ9owqpS8nmnN+mGhGr1kDnc+dzoaUvE=;
 b=DHurUMYZuJKo1/El8QV5PsvdCczXy0EhbTVwO9EXSTQwUnB+sZ0IHgvJ+Ys7VkUwE5RcIx2VkaLJoH7XvRFOPkZo36TZoAGQGF4NqlvgUTAcWgkefmwo7WzPO0t24UgCX0CAo1X7t5y9F+Em/dIMUBdxBI+p2NKq1UJhDnE2H4QuoAx4OwgBUGFWusWPgcCwPkq0xq8Fe8SnUz8NcyP9GqSsdqsrMWfaO4oJyMFlVnFVXek9h17O+aGNRTWAjl0LYp5LcQi+IE70TUD1EfhUaI5Ra1K4aXYmoXYoAzZ0fvxLf3LEKuJxbdDdVK0oV7i1kqSqn2GgB3Q+miEEVTottQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MN2PR15MB3088.namprd15.prod.outlook.com (2603:10b6:208:f5::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 16:08:46 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 16:08:46 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <peterdelevoryas@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>,
 "cminyard@mvista.com" <cminyard@mvista.com>, "titusr@google.com"
 <titusr@google.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Dan Zhang <zhdaniel@fb.com>
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Thread-Topic: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Thread-Index: AQHYi2l1MJyLzPh9MU2QF3wYBrkl3K1mEQsAgAB9JoA=
Date: Wed, 29 Jun 2022 16:08:46 +0000
Message-ID: <4B7D5739-648D-4A16-B951-DF6AF7E50CEA@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
 <c4c261e9-8f17-578c-8e45-e64ced8e0685@kaod.org>
In-Reply-To: <c4c261e9-8f17-578c-8e45-e64ced8e0685@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0886e470-4e41-4f14-81ad-08da59e9a554
x-ms-traffictypediagnostic: MN2PR15MB3088:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gWZTFru4ogPH6i9HJSDNUQ7c9gOOcqvm04EE2wdXEU/ey2DCcn+acQAv49wH1AuwR+uWrOpxwZeXD28oEsIrbIcJHPP9jFFYA5rE9xfZCR41Oycc6p5GmkEOCilBlic5RZbQfU7RDqa2ofknUGdJrbhcYKSMXgSErfM3LMAQxQTj9ZeuNinpr67zDt35OTi+MMeIlVJGlyt6IKePkoveuVI45K+lLD/rE99rBCghdOOS/uS2++3JPa4KLfhouKlnThu88Ajk+RuZ9ZjcXay2TZtvyxlS788AosFRSpGHql2TutaIlA4DtNy8SXNww6bmdDmEz1vFzg1bHADVCIJjXzf7KEo5r6uRIa47ppn9cATSyxHyk9Po0g1sqxtHdHQ04rTcMlJlJmMckJOx61hkq3x/EO0skfOCa62UnLP9GF7HzlV7MIx1oJYPd+lLSGi3zDJH8ssYt5X6ptY4P8Lrz8yr4RUoLxpMYR10HBuHnQF5bbUM0umh5noXQxd4CmW0pRC1Kj9E2Aeat+Xk+o8MzEfzq9MSpt2VCHVCza0rpKPTFrc0ET2jeT01TL0Elc1Rc5TCQE5APkNJQcguJgx48EFsKLNPBAFovAMGHVVB+HcfzhJFwvIEe9QzQ76SOqU+v+EufLNu+0VTV6gafZE58UnVqYpuebOK6LjIOr9xZXijUU+ITCmqQCkmOmXGlh6vEEm7AeF/LXaDZ+XFuY7ORkSN6G5FCT0toEPI6Palj48RAJJErt8jnqEAmGUyHcelbESVkMk962ePacB/rk9IhLKbSph3SOtixkkzsf55H5nh9h0avuAtcOMNEgOOEgw8T5arY3p3kUW6h99pE4KIFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(41300700001)(53546011)(66946007)(6506007)(122000001)(8676002)(316002)(83380400001)(36756003)(8936002)(71200400001)(66574015)(38100700002)(86362001)(33656002)(2906002)(76116006)(66556008)(6486002)(66446008)(66476007)(186003)(64756008)(4326008)(38070700005)(6512007)(54906003)(6916009)(478600001)(5660300002)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amlKRkkyemprek5vbWlEWlpBRUhTL0J2OFdTWkNSaHZiWWlLN2NGMzVERS8y?=
 =?utf-8?B?OXZ4Tlk0aThUck5jQ1JNVHVHSG9tM1l0cllmVzI1bTF3ZFlVaU41VEs4YkZJ?=
 =?utf-8?B?NkxWNmVYYnBxZWExNFJMVk4vK3l5RkVwbW1CeWgxR0taNXNHQW9yQzVqblZH?=
 =?utf-8?B?YU43VXpzKzliYTc4NjVTS3J2a0xsZHhLdVJOc2tYbXRYVjkySTdPVGJ0NUxI?=
 =?utf-8?B?S0JsL1BTeXVmdlZmWjFxNXMwakdIak1VYjMzUHdmdzk3Y3ptRVp3VWJFdENP?=
 =?utf-8?B?a25TOUF4RDFnZnMzVjkvY2RtYWlqMTYwam5IY2toN0ZXOHpDdURWWkRYRnU2?=
 =?utf-8?B?eStkbHlac1Q0ZDk0L3Irbm1DRW5sbXVERTlScTRleTA2bjJQeURyNlZ5ZFhQ?=
 =?utf-8?B?TVdDRmpOUVd2cExTZFIxTE52RkNwTTJjYXNhOUh2MDNIaGdpVkkrZ2Y2SGp2?=
 =?utf-8?B?SFhVam5YSVJFTEZVT29UdjNKT0grRlp1VDl2OTkrZ2VISXBZczFuQWtXbkd1?=
 =?utf-8?B?RkMxa3R5T2JxTHlhVHNRZ1VDeW9aMEVQV2h5azl5UFMxckRoNzBkQUtDRXhu?=
 =?utf-8?B?QlF2bTMzTGlCUnlwT25BV2hLREtPVjlKU2FTWjRXY0g0SWo1bUVXUmR2dDk5?=
 =?utf-8?B?cVNKdWNkNDd2azBmQkhWRnhmejdxUkw4ZHFUMHBGME5NOWtlMjZlaXBNZG54?=
 =?utf-8?B?N2g0d2U1bEVWRWw2M1l5LzljNnlzQzNJK2JVUHo4K0dFaTlKSUZpTU45Q2Va?=
 =?utf-8?B?WHVMd1ZoYkxuTzdlVWgzdUkzWmNNanpTbnJBUXZ5UHJEYzJ6MHNWYlJ3eTd6?=
 =?utf-8?B?TTNLYzFaZ3QrQ2VaK1AxODE5c0xFQWZTS0JCTEJSTjdFSWFldFZVa3NoV1B1?=
 =?utf-8?B?NWlwYzVjVGlFbHlrMmVCQU93MlgwOHB0bUNRSWZQRUxVdzNsU1EzeVI3N1o4?=
 =?utf-8?B?OHFHV0RHUk9zNWdtakIxNy9ZQU5qQ3FrdWltcUpXek1qTURXL3FvVnNkWkVX?=
 =?utf-8?B?ZitwYmE1bDdVRzV1Z09jdythVUhhSmlMclZSZ2ZSbzAreEd6WXRnaWpWc1l2?=
 =?utf-8?B?VUdOZWZJYUE3TFpramRyUDBvVGVkZjhvbjBRVzZ4dHRDUDZyTVlmSjJCVlA1?=
 =?utf-8?B?UFM5OTRoQXpVbFRBbnhobDRjbWV5R1lkdkd1REl4SHpFK0YzNHhOT3E1V05T?=
 =?utf-8?B?SlgrdVlnS2Q3VDZoSnV2ZVc5WWhvTWFTZVJlZkh3azBZdmVJUDljRENLNDlV?=
 =?utf-8?B?MzBnbUhZdkNBRkNTWXFRNGlXR254R3JJYnF2ZTErd29EZFc3NmlETkF4a1Er?=
 =?utf-8?B?WXE1VUtsVlZqS0s4cklzUitqY25OdXhDL25mM1FaTzBWbno0cG56T2ZGQ25r?=
 =?utf-8?B?T2N0MWJBa0Y5cStEUEVaWmZLOSt0Mlo4dTF4YkFGNk9RQVhRdTVUcDBML29n?=
 =?utf-8?B?eFNOc0d3RTFsa2NMcjQ2ellpdVdPUGdveGVXdUNZcXBRc2tKT2pUZjMzNFJ1?=
 =?utf-8?B?MU9lUUdOMzlUWWRjZ3J0T1grNDM3M0NpbXhVTHdCY1hUM205TWI1ZGYzY25S?=
 =?utf-8?B?L2dqUVdSZVkza09ET213QjVPSUlHNDEzVDVDWkdQZWhuQnY0dTVaUGU0SlR5?=
 =?utf-8?B?UW53U1dZcmZWVDJPQ3VsSTlMN3F6V1N0UnAydFY0WnpHVHJUQ25lUHgvOWFz?=
 =?utf-8?B?c3NPQ0c4Y1JVMWdBSVVVbFdGL3VsTXRsZlNueHZFdjFQR3cxOHRrS1gyRk9P?=
 =?utf-8?B?VEluNU8rMGlJWlR6Qy9zY2ZnRE11OUVZVmdPWXh2alhHWGJJNnAzMHgrcUZF?=
 =?utf-8?B?RUgxendCUzkvNDZIdGI5cktuc09yZHNjcURDT0gydkVyVjdTbitpQlRhRVZj?=
 =?utf-8?B?ekQyOUF4UWF1NmZ2US8xdDBQMlFnY3VEWm12TGRneHVFTHF5QXRDMWt5M1NG?=
 =?utf-8?B?bGpEbUV1U05UQmV6akN1ZVg3TG5yMm0xMjF6ZlMrU2NoSmZUbCszTUd1UC9G?=
 =?utf-8?B?U1ZRV0wzL3NuQXZoaEJ3L3BVRVdLWEV3ZmFtQmpLUW02a0pERUdkbnpWQk15?=
 =?utf-8?B?MWFpajNtU3p2KytBdUJDNTl1NWdCcUQvRzRnK3Zzd202eEFYbGNkZU5GRnhN?=
 =?utf-8?B?UndWYmlPeWtaR0VkZXJRS1o0T0V6WUc3Vkd0VE5aRmJoUWFZVXY2dGNFd0Rs?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F4A346E9921BE46A8E1FD5DF9434797@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0886e470-4e41-4f14-81ad-08da59e9a554
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 16:08:46.2064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSoW/IPg8xkubGvJ8gUDTako3AkXpHSmnZRpl36OUyQ/TSY3dsrkO5mLGNzzYr+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3088
X-Proofpoint-ORIG-GUID: nMbmocxo06cN_vEs9Pb6xLTwlm0r8a1G
X-Proofpoint-GUID: nMbmocxo06cN_vEs9Pb6xLTwlm0r8a1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_17,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8179e10d56=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVuIDI5LCAyMDIyLCBhdCAxOjQwIEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IE9uIDYvMjkvMjIgMDU6MzYsIFBldGVyIERlbGV2b3J5
YXMgd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNv
bT4NCj4gDQo+IFRoaXMgaXMgYWxzbyBhZGRpbmcgYSAiUmVuZXNhcyBJU0w2OTI1OSBEaWdpdGFs
IE11bHRpcGhhc2UgVm9sdGFnZQ0KPiBSZWd1bGF0b3IiIGRldmljZS4gVGhlcmUgc2hvdWxkIGJl
IDIgcGF0Y2hlcy4NCg0KSG1tbW0geWVzIGRlZmluaXRlbHksIEnigJlsbCBmaXggdGhpcy4gT25l
IHBhdGNoIHRvIGFkZCBJQ19ERVZJQ0VfSUQNCnRvIHBtYnVzLCBvbmUgdG8gYWRkIElTTDY5MjU5
IHRvIGlzbF9wbWJ1c192ci5jDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPiANCj4g
DQo+PiAtLS0NCj4+ICBody9pMmMvcG1idXNfZGV2aWNlLmMgICAgICAgICAgICB8ICA1ICsrKysr
DQo+PiAgaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5jICAgICAgICAgfCAzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgaW5jbHVkZS9ody9pMmMvcG1idXNfZGV2aWNlLmggICAg
fCAgMSArDQo+PiAgaW5jbHVkZS9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmggfCAgMSArDQo+PiAg
NCBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQo+PiBkaWZmIC0tZ2l0IGEvaHcvaTJj
L3BtYnVzX2RldmljZS5jIGIvaHcvaTJjL3BtYnVzX2RldmljZS5jDQo+PiBpbmRleCBlZmRkYzM2
ZmQ5Li44MjEzMWZmZjg1IDEwMDY0NA0KPj4gLS0tIGEvaHcvaTJjL3BtYnVzX2RldmljZS5jDQo+
PiArKysgYi9ody9pMmMvcG1idXNfZGV2aWNlLmMNCj4+IEBAIC05ODQsNiArOTg0LDExIEBAIHN0
YXRpYyB1aW50OF90IHBtYnVzX3JlY2VpdmVfYnl0ZShTTUJ1c0RldmljZSAqc21kKQ0KPj4gICAg
ICAgICAgfQ0KPj4gICAgICAgICAgYnJlYWs7DQo+PiAgKyAgICBjYXNlIFBNQlVTX0lDX0RFVklD
RV9JRDoNCj4+ICsgICAgICAgIHBtYnVzX3NlbmQocG1kZXYsIHBtZGV2LT5wYWdlc1tpbmRleF0u
aWNfZGV2aWNlX2lkLA0KPj4gKyAgICAgICAgICAgICAgICAgICBzaXplb2YocG1kZXYtPnBhZ2Vz
W2luZGV4XS5pY19kZXZpY2VfaWQpKTsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gICAg
ICBjYXNlIFBNQlVTX0NMRUFSX0ZBVUxUUzogICAgICAgICAgICAgIC8qIFNlbmQgQnl0ZSAqLw0K
Pj4gICAgICBjYXNlIFBNQlVTX1BBR0VfUExVU19XUklURTogICAgICAgICAgIC8qIEJsb2NrIFdy
aXRlLW9ubHkgKi8NCj4+ICAgICAgY2FzZSBQTUJVU19TVE9SRV9ERUZBVUxUX0FMTDogICAgICAg
ICAvKiBTZW5kIEJ5dGUgKi8NCj4+IGRpZmYgLS1naXQgYS9ody9zZW5zb3IvaXNsX3BtYnVzX3Zy
LmMgYi9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmMNCj4+IGluZGV4IGUxMWUwMjg4ODQuLmIxMmM0
NmFiNmQgMTAwNjQ0DQo+PiAtLS0gYS9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmMNCj4+ICsrKyBi
L2h3L3NlbnNvci9pc2xfcG1idXNfdnIuYw0KPj4gQEAgLTIxOCw2ICsyMTgsMjggQEAgc3RhdGlj
IHZvaWQgaXNsX3BtYnVzX3ZyX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpk
YXRhLA0KPj4gICAgICBrLT5kZXZpY2VfbnVtX3BhZ2VzID0gcGFnZXM7DQo+PiAgfQ0KPj4gICtz
dGF0aWMgdm9pZCBpc2w2OTI1OV9pbml0KE9iamVjdCAqb2JqKQ0KPj4gK3sNCj4+ICsgICAgc3Rh
dGljIGNvbnN0IHVpbnQ4X3QgaWNfZGV2aWNlX2lkW10gPSB7MHgwNCwgMHgwMCwgMHg4MSwgMHhE
MiwgMHg0OX07DQo+PiArICAgIFBNQnVzRGV2aWNlICpwbWRldiA9IFBNQlVTX0RFVklDRShvYmop
Ow0KPj4gKyAgICBpbnQgaTsNCj4+ICsNCj4+ICsgICAgcmFhMjJ4eF9pbml0KG9iaik7DQo+PiAr
ICAgIGZvciAoaSA9IDA7IGkgPCBwbWRldi0+bnVtX3BhZ2VzOyBpKyspIHsNCj4+ICsgICAgICAg
IG1lbWNweShwbWRldi0+cGFnZXNbaV0uaWNfZGV2aWNlX2lkLCBpY19kZXZpY2VfaWQsDQo+PiAr
ICAgICAgICAgICAgICAgc2l6ZW9mKGljX2RldmljZV9pZCkpOw0KPj4gKyAgICB9DQo+PiArfQ0K
Pj4gKw0KPj4gK3N0YXRpYyB2b2lkIGlzbDY5MjU5X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmts
YXNzLCB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsgICAgUmVzZXR0YWJsZUNsYXNzICpyYyA9IFJF
U0VUVEFCTEVfQ0xBU1Moa2xhc3MpOw0KPj4gKyAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0Vf
Q0xBU1Moa2xhc3MpOw0KPj4gKyAgICBkYy0+ZGVzYyA9ICJSZW5lc2FzIElTTDY5MjU5IERpZ2l0
YWwgTXVsdGlwaGFzZSBWb2x0YWdlIFJlZ3VsYXRvciI7DQo+PiArICAgIHJjLT5waGFzZXMuZXhp
dCA9IGlzbF9wbWJ1c192cl9leGl0X3Jlc2V0Ow0KPj4gKyAgICBpc2xfcG1idXNfdnJfY2xhc3Nf
aW5pdChrbGFzcywgZGF0YSwgMik7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyB2b2lkIGlzbDY5
MjYwX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0KPj4gIHsNCj4+
ICAgICAgUmVzZXR0YWJsZUNsYXNzICpyYyA9IFJFU0VUVEFCTEVfQ0xBU1Moa2xhc3MpOw0KPj4g
QEAgLTI0NSw2ICsyNjcsMTQgQEAgc3RhdGljIHZvaWQgcmFhMjI5MDA0X2NsYXNzX2luaXQoT2Jq
ZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0KPj4gICAgICBpc2xfcG1idXNfdnJfY2xhc3Nf
aW5pdChrbGFzcywgZGF0YSwgMik7DQo+PiAgfQ0KPj4gICtzdGF0aWMgY29uc3QgVHlwZUluZm8g
aXNsNjkyNTlfaW5mbyA9IHsNCj4+ICsgICAgLm5hbWUgPSBUWVBFX0lTTDY5MjU5LA0KPj4gKyAg
ICAucGFyZW50ID0gVFlQRV9QTUJVU19ERVZJQ0UsDQo+PiArICAgIC5pbnN0YW5jZV9zaXplID0g
c2l6ZW9mKElTTFN0YXRlKSwNCj4+ICsgICAgLmluc3RhbmNlX2luaXQgPSBpc2w2OTI1OV9pbml0
LA0KPj4gKyAgICAuY2xhc3NfaW5pdCA9IGlzbDY5MjU5X2NsYXNzX2luaXQsDQo+PiArfTsNCj4+
ICsNCj4+ICBzdGF0aWMgY29uc3QgVHlwZUluZm8gaXNsNjkyNjBfaW5mbyA9IHsNCj4+ICAgICAg
Lm5hbWUgPSBUWVBFX0lTTDY5MjYwLA0KPj4gICAgICAucGFyZW50ID0gVFlQRV9QTUJVU19ERVZJ
Q0UsDQo+PiBAQCAtMjcxLDYgKzMwMSw3IEBAIHN0YXRpYyBjb25zdCBUeXBlSW5mbyByYWEyMjgw
MDBfaW5mbyA9IHsNCj4+ICAgIHN0YXRpYyB2b2lkIGlzbF9wbWJ1c192cl9yZWdpc3Rlcl90eXBl
cyh2b2lkKQ0KPj4gIHsNCj4+ICsgICAgdHlwZV9yZWdpc3Rlcl9zdGF0aWMoJmlzbDY5MjU5X2lu
Zm8pOw0KPj4gICAgICB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmaXNsNjkyNjBfaW5mbyk7DQo+PiAg
ICAgIHR5cGVfcmVnaXN0ZXJfc3RhdGljKCZyYWEyMjgwMDBfaW5mbyk7DQo+PiAgICAgIHR5cGVf
cmVnaXN0ZXJfc3RhdGljKCZyYWEyMjkwMDRfaW5mbyk7DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9pMmMvcG1idXNfZGV2aWNlLmggYi9pbmNsdWRlL2h3L2kyYy9wbWJ1c19kZXZpY2UuaA0K
Pj4gaW5kZXggMGY0ZDZiM2ZhZC4uYWVkNzgwOTg0MSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUv
aHcvaTJjL3BtYnVzX2RldmljZS5oDQo+PiArKysgYi9pbmNsdWRlL2h3L2kyYy9wbWJ1c19kZXZp
Y2UuaA0KPj4gQEAgLTQwNyw2ICs0MDcsNyBAQCB0eXBlZGVmIHN0cnVjdCBQTUJ1c1BhZ2Ugew0K
Pj4gICAgICB1aW50MTZfdCBtZnJfbWF4X3RlbXBfMTsgICAgICAgICAgIC8qIFIvVyB3b3JkICov
DQo+PiAgICAgIHVpbnQxNl90IG1mcl9tYXhfdGVtcF8yOyAgICAgICAgICAgLyogUi9XIHdvcmQg
Ki8NCj4+ICAgICAgdWludDE2X3QgbWZyX21heF90ZW1wXzM7ICAgICAgICAgICAvKiBSL1cgd29y
ZCAqLw0KPj4gKyAgICB1aW50OF90IGljX2RldmljZV9pZFsxNl07ICAgICAgICAgIC8qIFJlYWQt
T25seSBibG9jay1yZWFkICovDQo+PiAgfSBQTUJ1c1BhZ2U7DQo+PiAgICAvKiBTdGF0ZSAqLw0K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvc2Vuc29yL2lzbF9wbWJ1c192ci5oIGIvaW5jbHVk
ZS9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmgNCj4+IGluZGV4IDNlNDdmZjdlNDguLmQ1MDFiM2Jj
ODIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2h3L3NlbnNvci9pc2xfcG1idXNfdnIuaA0KPj4g
KysrIGIvaW5jbHVkZS9ody9zZW5zb3IvaXNsX3BtYnVzX3ZyLmgNCj4+IEBAIC0xMiw2ICsxMiw3
IEBADQo+PiAgI2luY2x1ZGUgImh3L2kyYy9wbWJ1c19kZXZpY2UuaCINCj4+ICAjaW5jbHVkZSAi
cW9tL29iamVjdC5oIg0KPj4gICsjZGVmaW5lIFRZUEVfSVNMNjkyNTkgICAiaXNsNjkyNTkiDQo+
PiAgI2RlZmluZSBUWVBFX0lTTDY5MjYwICAgImlzbDY5MjYwIg0KPj4gICNkZWZpbmUgVFlQRV9S
QUEyMjgwMDAgICJyYWEyMjgwMDAiDQo+PiAgI2RlZmluZSBUWVBFX1JBQTIyOTAwNCAgInJhYTIy
OTAwNCINCj4gDQoNCg==

