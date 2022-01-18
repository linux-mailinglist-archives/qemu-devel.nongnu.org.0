Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684674929F1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:57:05 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qr2-0001BP-2G
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n9qMH-0004eC-GL
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:25:18 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:50070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1n9qMF-00018t-3M
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1642519515; x=1643124315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dXYsAl0pgGWZwZ7+mZHr6yErSclCdDvgS4h1yNkJSk0=;
 b=UvhB+VNH6Mkmvt8DsKkPnGHYlJAQnQv5BMfEinRmQkpQ6uV8WKcvxYwA
 QVMvbXoiUDaodhu1QANrSZ47B8S8AeUfLFugGXS3NQImHxZua7NcHiMQu
 zqJtUN7fK/XN6m+AzTJ6TpUV5TnV2tTOjEPjZuefLEwDxIU9TAbiY9iMG g=;
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 15:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVRUP2PS6xDnCKluS1A3+YuW77GklgvAKqQOQugm0FycoLnv3CL+ermp4b18BzklEzixTV9AgEHcEgvdKtQMcwSbETX/HlYpyJHk6UuKCDntzDeFXNqUBA5KTU5cxUlWwN785Ipg7lC611+jDOMXDcvim3evTlH4ZeQQ8zPAyuo6+SXs0/d3rATMacNdJIjJO7lDGLDwbswnepfYFfD46u216rCo4/sQSZxk6rdCopGFyZJaLj0uIFoq4wjlGs9cM3G8LAWeQKBUkmMn2crl45uP3nmZUYg1v/0mPpNQTD4AAMob4ajlTGq2qnsjD5ouEEfbu0TRD5NlZ/9KWAancg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXYsAl0pgGWZwZ7+mZHr6yErSclCdDvgS4h1yNkJSk0=;
 b=Zht2RWg4lvaHfS5wQFQbHvSzQkaZSodT9vSHavdBcSVddTb6XrQY+8MEuSa7l/8llthyqhsSqW/B/MlYmq8NSm9nTUUMOc0Qfgjohaq03wu1g0swrZuj9M2RX9hCP7Kpg0Nbz7nkjCIWIqSvs0QV1muuQUjcjwvCcQKenX9iXvryAlMPiHy2yB5L3n7R0g4fxp2hOuRG1DJ8U03ABjTczYHnvsTAvz9Y3XRF4sS5sLIMjiavVQ/z0wTEkFgyepwZ3QJcXuOIF81N8DCzG7APHjDfKRptGwLm6FEERNYKBuXVYUVjkTH/a3xUZvEVuYQqaq70D68GryR9FHswuItjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM5PR02MB2347.namprd02.prod.outlook.com (2603:10b6:3:5b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 15:25:09 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 15:25:09 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Subject: RE: hexagon container update
Thread-Topic: hexagon container update
Thread-Index: Ade25RCxllT+hUwlRb2vNrqCSUbc9QABASCAAABlCPAADdM14BSgmYTgAIMxX4AAM2sYEA==
Date: Tue, 18 Jan 2022 15:25:09 +0000
Message-ID: <SN6PR02MB420500D2EC8C03861E270E2CB8589@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42059B3D252751BEDBB540C3B8AC9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42050D02581C5FF732732D29B8559@SN6PR02MB4205.namprd02.prod.outlook.com>
 <87o84aa03n.fsf@linaro.org>
In-Reply-To: <87o84aa03n.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2b31938-7627-4a09-abf3-08d9da96b6a4
x-ms-traffictypediagnostic: DM5PR02MB2347:EE_
x-microsoft-antispam-prvs: <DM5PR02MB2347E22A15120391E64C249DB8589@DM5PR02MB2347.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: USCw+S1GVT1aHjxPoZnIxzxPo1Mfcswj18J10CvoysMwwTJh9R0GdOFLnAo4Or+DYYvcg+XkooK7lfPUINqMSod3uwurue4pebgttA8yPm/ixjbligJtl0tfX/GoCYe7VW4QZ0qpPQZzAllNz2JdIO8flHilQbaGtkYfOHQEF4yr5JO8R7GVyeJz5b6mrQQyk61ifTeuamCEmzIzy+O4MVh2iWJ/EKkD8hWOClz9hdFc4sNXFLF11kFvAPYzH6qziUXv4PEqKbuoV25epgg9WsvNPnTt9enRmVcavqaqFCqilZ4zvHecceMGNc0D36zvwknjQbhs/KbgkIoOBlO+LypGxYnWO+xTEK1jcHFi2+ghwV0h0OCU/uz9FczFxxvfQrrJ5ystD7aVjE7XEpeUe5mk4JziaYZhFiKOjZZKy3JUfKkwjxubZBSlJ9b96DmKVIoeqRvfvKtLamwYe8E6RlMnHFe3gzNSFpTSkdqLZbRdKhyukg2JNgbV8GO6W7GC7vngVSPir+398gRU0MQryO/TUdzh6Xno5Jjv9Y9braERzYUUGKtVgKzHX+oYpmJPJ9mC8PV4oxLAryBoPicBYKM2kFHULVQRFQZSM3c1d/GnoRpizTdJKPEcHUcIDliAhGNEFe1OmZnu5g9KVCqsSWNIY+aaxFfLyTfWfh5M8WwWMP76O/NmbboMAadKYc0ELjEoHJPW9yA20fSf8ClcbLnMt4CH0ekz/MIyGgBoTzUiurxhGXR27vP4/lWALk367mu/g+dBJY7ypzksrCDS7/WbxgSb/c8oCSYxNkBtoBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(38100700002)(6916009)(122000001)(55016003)(7696005)(966005)(4326008)(316002)(71200400001)(38070700005)(15650500001)(508600001)(107886003)(7116003)(8936002)(66574015)(83380400001)(2906002)(3480700007)(33656002)(5660300002)(8676002)(86362001)(52536014)(6506007)(26005)(66446008)(64756008)(186003)(66476007)(66946007)(9686003)(76116006)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3MyT3BmMXpCSG9MWTFsUkt2QXplVENvZVo0clpHUWFkcS9FTGZvMkh4VU5E?=
 =?utf-8?B?VTg3cUp3VUYzV0RHY1MrTm9Oc0c0NFJwYlhBd0EwY3QwVy9mSEtYN01ramc2?=
 =?utf-8?B?a1Job3kwSStWWGZSbnBodU5RekZ1dEpGMW81Y2ZyQ1Yza1hMVmpHVDU2VmV2?=
 =?utf-8?B?TE1nczNMLzJ5TWdhbTFSeU15eXRsOWVLeHJtTTZWd25wTHI3L3M0Wmhnb3NB?=
 =?utf-8?B?ejA1VkRkTmNOcXRDTEFZZ09qcG1TakF3aXVId0xiOGxBdVZpMnd2YW1pZWgw?=
 =?utf-8?B?bUVYald0ZGZEa0lLM29nMlJGNlkyTW9zendPV1pzQ0tGU09TdUJJQ2JiN2ho?=
 =?utf-8?B?czBXdjNiNkw0cXFUa05VQWdqemljd29IVStNU0xEQ3RjNXJzamRaTmFPRkVT?=
 =?utf-8?B?K1ZKV2hvZnZkbTdlOGh0OGpXR2hzQ2pRTzJuWTdYaXp2YmxDMkJYTkJWeG1O?=
 =?utf-8?B?ejdxRDJrS1hBVFY3WDA2OHdsaFdqVzZwTVFwQkZMUlZxODVBMngyc25GcXZP?=
 =?utf-8?B?dlhTQ0NiNVppU1ppdSsrOWl4S2oxdHdYdmZmVnNOUG9hSVIrTUFkK1hOeFFG?=
 =?utf-8?B?ZXc1WjUwSnlVK3BpZHpDRGxvYTFWbDdFcFA3bFZuaVhHbVJKcGxDVG13bWdt?=
 =?utf-8?B?c3M5dmRoQ3RmUUFQU1c2TEdUVC9BY1IybkprV005ckQ4b1JMdEtzdUNNSG9l?=
 =?utf-8?B?ejE1Q1lmdm1IWVVLMExaVmMyYWwraWh3Y2g5T3R1U3ViRS9SREFoc2lyUTZq?=
 =?utf-8?B?eVlJRG1Eb2hvdEhLa0tWQ3p0aWVZc1ViV1RFME10Zmo0Smhsb0pFQnlta2Rl?=
 =?utf-8?B?bitTM0wrZGRqaDJtV2hyNlE0WmQ0NStsUThTekc3QTgrOHBrcTZRVXh3cEVt?=
 =?utf-8?B?RUZldzlWMitUOE1wVmI2bmhEM0ZRandXaUZzWFpBZlFsTmJuZ1VXY2xhMWpO?=
 =?utf-8?B?dWpZMGFrbGMyNlpteUdyZzA5STV4bm9oN3FBQ1ZRZ3MzdkIrTUtCMlhHOTJt?=
 =?utf-8?B?ZU5qQzAxTFplWEZOWDlyb1U4V3pGNlYyU1Iya045OXB5LzdNMlFYYWpvRGNM?=
 =?utf-8?B?cnZLOXlpdzcwUWVqa3hELzQ5a1BBRVoxbm1TODBGb2twSEg4dFljZmI3dERV?=
 =?utf-8?B?dXZONllGVnQ3OEZFYkkrM3RLbmcyNWlOMzFtc1I3RTlOeGE0OGs1ejRzemF5?=
 =?utf-8?B?cTJmZWl2STdDVmJSUXlCWjMrRGNTaTg1OU9ZQWs5OHYzazlKc3lrRE9pbGVr?=
 =?utf-8?B?RDZIR2pLY2U3alhucDYwR1NXZ1JJeGpYWkVYV3ZOYnJVZ2xjaVgvMDlwWXVv?=
 =?utf-8?B?YmcxUEYyUGVHdFRvYTFjN1RlTjFmT3FQSXk2aWw0cUpFd2RFT1Q4Q3dhSEEr?=
 =?utf-8?B?VVNTUlJMeGhmbFdQUCsrWi9VS1NnbDBmYW1QUUlsbVVqRjY0eEoyR3lXSWo1?=
 =?utf-8?B?NVFhM2Z1RmRITEhCd3VaNUpoOG5uVWxpU0ZNeWRuVERidHJscXFmQjJoZHFT?=
 =?utf-8?B?S3JyeExzYUl2K0NxcUw4K2hWNy9uOExrODhqQ2ZCZFcrTVRUMnA2K3c5VlI4?=
 =?utf-8?B?TVZxckdqQkxJTjA3M3lLZkxncStCcjZ1bWhGcnY1cmlZcWtHOFFFR3NJNVh4?=
 =?utf-8?B?WklqR3RKTzlCV0JiY2h3Q1NUVEZnOTY2M29Rek5zNmFuWGRCWGdhYzRLWnZN?=
 =?utf-8?B?Q1l4VXVCV05TNjgwS0pJT3dpYU9XZ0RtcHpOTWdqRE9iWW9Jck1jQlp3RElS?=
 =?utf-8?B?Mkw1UzRaa3ZEOVYreVJwd29aR0c4ZlUyL2t6L0ZMbE9Oem9FUUVGb1NtMlpF?=
 =?utf-8?B?eVZ5MzgrNnFTbnJaVUxkdDZXTEF3d3Y5QWVzMUVJaExNNURVbXBwME82ZnR1?=
 =?utf-8?B?ZWZvWGdRNFJLOERtdlFhcmhvMXZHaHNBSWdBN0dMcGFYMEFZeGdXWkl4TmNQ?=
 =?utf-8?B?c2tobE5HYnNOYzFBTjdvdE90NUVpbk45NkdJcnBIRmEzeEo0S0NEeVNZZXR6?=
 =?utf-8?B?R3Rzb1dVd0tuN3UrcHBCU3l5NWppYjBrZkpvT2Q5ZmFqSjJoZHFUUm5VNEVK?=
 =?utf-8?B?dzc1YkJ1TGRLenZzTmlrODhWYWczS2FPaHV1OU9DVmttaE8ycjZ1VW9va0Uy?=
 =?utf-8?B?SVRUbWVaTFlYSXBSZDc5ZG81cVN5V1QwTXlZUVMrUVU2SVlaODIvSlNxMldm?=
 =?utf-8?Q?4K+2lC1wAYHF0A62UKnxNB0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b31938-7627-4a09-abf3-08d9da96b6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 15:25:09.2893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTzp+G25Wq0o82O3GcMAyy0Xz7g/d5uH/f4IJF9BSdDIIto3fXsTtQlIWFGzxy6Tmu2Pt7L0ZxmNw7kWH5dukA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2347
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+DQouLg0KPiBCcmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4g
d3JpdGVzOg0KPiANCi4uLg0KPiA+IFdlIGhhZCBzb21lIGlzc3VlcyB3aXRoIHRoZSBwcmV2aW91
cyBhdHRlbXB0IHRvIHVwZGF0ZSB0aGUgY29udGFpbmVyLg0KPiA+IFRoZSBsaW51eC11c2VyICJz
aWduYWxzIiB0ZXN0IGZhaWxlZC4gUmljaGFyZCBwb2ludGVkIG91dCB0aGF0IHRoZQ0KPiA+IGFy
Y2hpdmUgb2YgdGhlIEMgbGlicmFyeSBoYWQgd2hhdCBsb29rcyBsaWtlIGEgZGVmZWN0IHRoYXQg
d291bGQgY2F1c2UNCj4gPiB0aGUgdGVzdCB0byBmYWlsLg0KPiA+DQo+ID4gaHR0cHM6Ly93d3cu
bWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnODQ5NjM1Lmh0bWwNCj4g
Pg0KPiA+IEknbSBmb2xsb3dpbmcgdXAgbm93IHdpdGggYSB3b3JrYXJvdW5kIC0gdGhlIGF0dGFj
aGVkIHBhdGNoIHJlZmVyZW5jZXMNCj4gPiBhIHRvb2xjaGFpbiB3aGljaCBhdm9pZHMgdGhlIHBy
b2JsZW0gYW5kIHBhc3NlcyB0aGUgc2lnbmFscyB0ZXN0LiBUaGlzDQo+ID4gdG9vbGNoYWluIGlz
IGJhc2VkIG9uIGxsdm0rY2xhbmcgMTMuMC4xLXJjMi4gQlRXLCB0aGUgcmVsZWFzZSBwYWdlIGhh
cw0KPiA+IGEgc2lnbmF0dXJlIHByb3ZpZGVkIGluIGNhc2UgYW55b25lIHdhbnRzIHRvIHZlcmlm
eSB0aGUgZG93bmxvYWQ6DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvdG9vbGNoYWluX2Zv
cl9oZXhhZ29uL3JlbGVhc2VzL3RhZy8xMy4wLjEtcmMyXw0KPiA+DQo+ID4gQ2FuIHdlIHRyeSBh
Z2FpbiB3aXRoIHRoaXMgbmV3IGNvbnRhaW5lciBkZWZpbml0aW9uPw0KPiA+DQo+ID4gLUJyaWFu
DQo+ID4NCj4gPiBbMi4gMDAwMS1VcGRhdGUtSGV4YWdvbi10b29sY2hhaW4tdG8tMTMuMC4xLXJj
Mi5wYXRjaCAtLS0gdGV4dC94LWRpZmY7IDAwMDEtDQo+IFVwZGF0ZS1IZXhhZ29uLXRvb2xjaGFp
bi10by0xMy4wLjEtcmMyLnBhdGNoXS4uLg0KPiANCj4gQ291bGQgeW91IHNlbmQgdGhlIHVwZGF0
ZWQgcGF0Y2ggYWdhaW5zdCB0aGUgY3VycmVudCBtYXN0ZXIgaW4gdGhlIHVzdWFsDQo+IHdheSBw
bGVhc2U/DQoNClNvcnJ5IC0tIEkgc2hvdWxkIGhhdmUgaW5zdGVhZCBhc2tlZCB0aGF0IHRoZSBw
YXRjaCBiZSByZXZpZXdlZC4gIEl0IHdhcyBiYXNlZCBvbiB0aGUgY3VycmVudCBtYXN0ZXIsIHRo
b3VnaC4gIEFuZCBvbmNlIGl0J3MgcmV2aWV3ZWQgSSdsbCBzZW5kIGEgcHVsbCByZXF1ZXN0LCBy
aWdodD8NCg0KPiBUaGF0IHdheSBJIGtub3cgaXQncyBiZWVuIHRlc3RlZCBhbmQgdGhlcmUgaXMg
bGVzcyByaXNrIG9mIG1lIGJvdGNoaW5nDQo+IHVwIGEgZnJhbmtlbiBwYXRjaCBieSBhcHBseWlu
ZyB0byB0aGUgd3JvbmcgYmFzZS4NCj4gDQo+IC0tDQo+IEFsZXggQmVubsOpZQ0K

