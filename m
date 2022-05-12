Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1B524235
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 03:46:11 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noxu6-0002XK-Hs
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 21:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1noxsx-0001j2-IH; Wed, 11 May 2022 21:44:59 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:30058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1noxsr-00067z-US; Wed, 11 May 2022 21:44:59 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BMwXVo001486;
 Wed, 11 May 2022 18:44:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=55luovkMWvrgyntlVQQVqR0bvpexauk6U84qBt1D2Ck=;
 b=JddLZrYtP6wcRckc1jXse2yMaCBBTk9y0qMZ+nV2WfNsDy2wOoz3JHa3N0LMq7wkgP/o
 5FLmksu1eFsgSUKs8ahFCgMPQBigFcNjiC7oS8YDSDRXVNB7weIkPLZ5G0SCRGxu1hgB
 qvCpMGNwSJZUjJ3ngYKO/q4VgqZLDqSZX7Q= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fymp4p811-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 18:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vayej/C644Di42TXCejIAdWHPygTSXoviSRKMQp/Pj7NQpgAIs4hSwlvtW66JBsgLIVWnZgPLGnHMmXMR2n9L1le0xsdjjKL8opvzfzT5tPemlUpGGIVXVIveEryOMITIYd0RR1DdYGwCrm0O7hAY+a8snLw3b8LzRBV65jPQtKBfrd1s6H3deRHUaLfRjoraxOS3EV9RfhXAbzOramPrlOSPP55vfJC6/xVgphTfMypfoY1krw2H8VQ07KjmWdo6DjXZ+b3XVC3orRT3kmhOon2lFsY+J3yzxmzHYRSsZc+YR7/zzxd8XtBMybMFyzDngli3jW6AjxP6Df+4AG7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55luovkMWvrgyntlVQQVqR0bvpexauk6U84qBt1D2Ck=;
 b=fGx43tpDlBWoPRiCyrfr9uD9qHVXH6OMK7DR/DGCqkY+lK6gUltvF4qP+ghcJQWZNp1XwoGqfhROrZUDs19fU8bduroQHZhmJWx6rOBUSq6knVwBnBXedfP4aCSSHWdJ81Wplldv2g1wV8mEM+jLcglO7QDvqvFJwJgTQzqbazNUis78926awQG19tTo4eqMUipNXCAYGTInbsxygG6Y9HdrOL4CIjjctna9RrqEMbybCWATH60U9txZNV0qHPZzG+oLBs3cZZApbnMlLPYUojygRm5PQ8TEQMyOlMsrcXy7hotWukLbz1XM9SaOZaznDRN9rDVCOPMlFLFmBdra7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SA0PR15MB3808.namprd15.prod.outlook.com (2603:10b6:806:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 01:44:39 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 01:44:39 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@fb.com>, Peter Delevoryas
 <pdel@fb.com>
Subject: Re: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Topic: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Index: AQHYZZ5ZWw2cAfFTiUOhGwZ1HOByLq0adpkAgAAB2AA=
Date: Thu, 12 May 2022 01:44:39 +0000
Message-ID: <67A59E7B-9C49-4C6B-900D-F341BFB35C6F@fb.com>
References: <irischenlj@fb.com> <20220512005411.2503971-1-irischenlj@fb.com>
 <B576A90F-3C37-494B-98A8-5EF21F47FB70@fb.com>
In-Reply-To: <B576A90F-3C37-494B-98A8-5EF21F47FB70@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c75bb2d-11f9-44d9-dc6c-08da33b8fa61
x-ms-traffictypediagnostic: SA0PR15MB3808:EE_
x-microsoft-antispam-prvs: <SA0PR15MB380876626190EB02816CD1D5ACCB9@SA0PR15MB3808.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tjx/0fmjlvRWC2AbfbqXRFtXeLQbLlfV5klKzeVpz6EUMleMOr1GC8z2tHbqaKfT33RBA9tPtg5w0L2SJndVdYELj91kvkzOLehVB9YD8sbN3CmPBjFguiHtN0/dFpCwlmaMBnO2mFv3488F8GuUxy42ST+vUpAu4gqLEQ6icY2MD3ENeSTYwvuCbg8okXYKUBeQToyW0oeugg7JK4sM/n75GZPYyErXR42SJU3mMQxNr27196spGiiTts+EFVNX3IgO0fVmAC7ZQiBmKeyRgTFgGPGnaxyboM1GS/g5LvG5nZxjx68p4dfXy1zmf9GuRhNXLwSVVwh2VLn9aCBV9z7D99O+KLQ/DNLWE7YgktMu9PW8yUA56Kuntm0MsTFUOiK5+LEmb0puo/szlA1ejauDIMC90PP6hEDWZEPTQ5xRFlXPbdQ9Itr43UMJbh9V9ISpBK8yBlUqR2FOk3YBeI825D4LzjQRmyuRtrewhdhNwFwdWDSTl0cKY01lXkGNt7dB60Z72HLLpK8uRUILo4XbTBr9GPopu0gh7Gn7CUpkKjejvbG+asxndbRcEQ6dx+nBVaSUCVm2QGk2oCZvXAlSOTz4rFKAwoBL7l1+cVvTOzZAVfXIyzZuX+4OTXSS+vhb+Un9s6/cnrPM46VrMXVTpgYJ+3J+MX58tJSHm+EBhZJKIC5f/97MWvJvfZmdDV+xVlIyw1ytXHNgfMYO8Z0yybMgQKQ//L6VFldvts7Wn7utPMfD82r+9OAvLoyE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(316002)(186003)(54906003)(33656002)(508600001)(5660300002)(36756003)(6512007)(6486002)(8936002)(86362001)(8676002)(76116006)(38100700002)(38070700005)(109986005)(2616005)(2906002)(64756008)(66476007)(66446008)(122000001)(83380400001)(66556008)(71200400001)(66946007)(4326008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzY3endlRUZ5OXgwSlhOeE1NdzZPSDNyRjg1Q2ZrSXFRcjRobjRRRkxRbHp0?=
 =?utf-8?B?cUYyRWpqTEVUdXBhMkJJdStPVmVDYlQxNUFjRHNIT0xudnV2bW4ydHd4Q0tv?=
 =?utf-8?B?ZDhDZ29sbU43VlR1V0tzd2VaVjZaTDVUZm5Ga0swMEE1OVdhOExxZ00rU0h0?=
 =?utf-8?B?NzJqMkFGTDVVL2hQa0FyTXVaSU5wK2RZaHlVZFQ2RHM5eE5tV1VHMGN4bFVu?=
 =?utf-8?B?UXdEempuMVJNb0NSNE0ydDg4dWMxL0lwekpMYm5BZkV3K2FoWFg0azlUMEp4?=
 =?utf-8?B?Qi9SQ01TbEQ2bGM1MC9VeFdDL0dGejQvOWpCUUp2cDJLZ2V5dVFtaSt4Qkx4?=
 =?utf-8?B?ZDNhVXp0M3k0NFQrNlNaaDAwNWQxUVZDQ0JxU1V1ak1KZGREOWpnbGhIcmhl?=
 =?utf-8?B?OFU1aW15c1JGUkhYdDFadVZNcVJja3d5NVE3dWdYU2RqVmovUFRWYzZNa29H?=
 =?utf-8?B?YVZkTXVadG9yUG9EZkdzVHZjbHl5c3d1Sng4NWlRZUpGVSsvNVBkdEU1MWRt?=
 =?utf-8?B?Z081a2lZNzE4UGJsREJLRnpxcmVsY3dBRnluWmt4Q1lGYUVNQ0QveXlSYWpM?=
 =?utf-8?B?ZDRYN2ZNZ29pN285MVJTWlhFT3ZnQkxCLzdwS3ZxRFhxaER2eEJ1Q3JGZldN?=
 =?utf-8?B?bHRyUmpsYVMrdjU2MjUvVFRhS1g0V0pVUDRrei9ScVdCbTVEYXF1ekpIeWtv?=
 =?utf-8?B?MVhXSFM0L1pHelgxVGRwbS96TjVhYVZodWJTTUdlazcxT1NIb3MvVk9Mdk5y?=
 =?utf-8?B?SW0wK2g2bWEvMVVVU1RaQmNya0V2OVg0S3hwZUxwWXRySDJ2UzFLc2psalVP?=
 =?utf-8?B?UlhHYzJNTWNzMElXQXFEb0pQVUlsbFRWYWRQaGZudUg4Tlp3T0xtTjJhNXNW?=
 =?utf-8?B?K3EyYlBzMzRyT3NJd3NUVDRhc21ZVGJpZktkR0d2R3BaSnAzZS8wK24zVGZh?=
 =?utf-8?B?SmZMNXFLRmltcWRQZSs1cXhhVUs1UUpQb0NHRlJ4Slh3RmpveFJFYmpnc3Vr?=
 =?utf-8?B?ak1zSWFtVW1JZVR6cUFobjF5aHVKalVONTdzRUFYYURyVVZvaFRlcFpYb2hi?=
 =?utf-8?B?TGJKT2N1QzZ6VURDK0Z5NEw5R1NpSkpSbTFjT2k2ZnFqRzZFaUpHRHJrdzBv?=
 =?utf-8?B?T3IwSnNKRUtQQ25JbXQxMGd6aW1qenplV0JBVG1GaGlKU3ovZ1N4aklpbmo2?=
 =?utf-8?B?aEZXV2NKU09OVVZJWlpLQnhkZGJkSVo1VXkvV0trSkRqMzRiSVBHQVRIQ3RT?=
 =?utf-8?B?d0FNamVMYisxYlJ1QnZuemtTT1AwWlk1OFRCcWdzK1hwOVRQUWsyYWFON3Rp?=
 =?utf-8?B?bnR3NFVQRzVtMkVSNFhWeG1Wd01pZHc2RXFndCsrRmE0bDFBOWoxb3pKRDJ0?=
 =?utf-8?B?bWhtSTcrL3cwUFhYNUZ3dDZTYnRjWEE3RHkyaXJxSXk3TUp1QmplWSt4bm03?=
 =?utf-8?B?bDhnOHgrSGJLL1VWTTM3TnVxZHppemtWQWhGdThPaFBFSlRua0RTdmdvN1Nq?=
 =?utf-8?B?UWN4V1oxa0xiTkVzMFpPNkhjMjNQUDR6eC9MZ2w0QUZ0eHdnNEJGNmoyVWt2?=
 =?utf-8?B?NEg5b3ZnMlp0amlCMTQrdmdSSjBEalpRZUdINjVnYmdGVHBjVFEyaHlQWUtX?=
 =?utf-8?B?QXNMUkhrRDdsdk5rZ2FDclo5YWE1MGFJaFQxUTJoQzlTWFFuQUZua1VmMFJR?=
 =?utf-8?B?RXBYMjNDSjFxN09NaldRVkFxaFZSWGFjK3N4OGpUampWVEppdHFmelcrZWdJ?=
 =?utf-8?B?RkJSa3lrbi8yWVc0elYyaG1IaDNzWkRSbk9oeGp6ZFNrTFB6SEViZU1RbllQ?=
 =?utf-8?B?ZlRTNkQ1YXRPeVZBb2NFcDRnRDlOdlJ0WWlOdEROcStyUUlhTjBxK2ZobEoy?=
 =?utf-8?B?Z2YwQ2UvaW1SenpVQ09jMXo0TS91NGtSQjNFNjFhZFMxUkF5cE9WSWxNRXdF?=
 =?utf-8?B?L3R1dmJubWlybzlmZG9uM0RRaVlXcEkrZnFJb0p4eHhiTFRTVHBGYm9oRFRU?=
 =?utf-8?B?N2NNRGtOZGI2U21JVDh0S0s1ZzhWeDkvT2h3WHlmN1lHS2NRQU9pSFRlQ0RC?=
 =?utf-8?B?UTBhTzB3d1g5M2Z0clhjWVA4Y1NsU05xMUZXc1Q4UWxMRkRJYnJ6QUV1bE9E?=
 =?utf-8?B?TDRFNUVTcnRhaDNnNTZYbzQ5eEJTdmRpbzl0Kzdwb2xqTTlKZ29BYnlibWpa?=
 =?utf-8?B?czNBZng1Y0Q2VWZnU2E4ZUk0Uy9HWnVzTmRjMjkvbFRMREVHazFnT1ZUL2Nr?=
 =?utf-8?B?WWhaRldiK3dEdUpldVJWWEFYSE0yWml2UVF1a094a09HdWh5b3JjMytnTjJU?=
 =?utf-8?B?dnh2N2tLemhsemF5eVB4SnMzUFhKY0NxcGVIc0wxMDR5NzlXazJDWHFTVHQ4?=
 =?utf-8?Q?wHFKYKK2A+jEMG/I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D3A01DF16C1C14CB4D0B9321616DC80@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c75bb2d-11f9-44d9-dc6c-08da33b8fa61
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 01:44:39.3594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4ad8fWNYy6zbO/t0mVz6XVfoIoxUK7Od8CvTCVPV7Gsav89EGfTkQ2XMSDWkcCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3808
X-Proofpoint-GUID: WWr73vxgY4hhYDakwmzocDsS6iw1Uz91
X-Proofpoint-ORIG-GUID: WWr73vxgY4hhYDakwmzocDsS6iw1Uz91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=613189c29a=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gTWF5IDExLCAyMDIyLCBhdCA2OjM4IFBNLCBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QGZiLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiBNYXkgMTEsIDIwMjIsIGF0IDU6NTQg
UE0sIElyaXMgQ2hlbiA8aXJpc2NoZW5sakBmYi5jb20+IHdyb3RlOg0KPj4gDQo+PiBUaGUgd3Jp
dGVfZW5hYmxlIGxhdGNoIHByb3BlcnR5IGlzIG5vdCBjdXJyZW50bHkgZXhwb3NlZC4NCj4+IFRo
aXMgY29tbWl0IG1ha2VzIGl0IGEgbW9kaWZpYWJsZSBwcm9wZXJ0eSB1c2luZyBnZXQvc2V0IG1l
dGhvZHMuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IElyaXMgQ2hlbiA8aXJpc2NoZW5sakBmYi5j
b20+DQo+PiAtLS0NCj4+IFJhbiAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBvbiB0aGUgcGF0Y2gg
YW5kIGFkZGVkIGEgZGVzY3JpcHRpb24uIEZpeGVkIGNvbW1lbnRzIHJlZ2FyZGluZyBERUZJTkVf
UFJPUF9CT09MLg0KPj4gDQo+PiBody9ibG9jay9tMjVwODAuYyB8IDIgKysNCj4+IHRlc3RzL3F0
ZXN0L2FzcGVlZF9zbWMtdGVzdC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDIg
ZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcv
YmxvY2svbTI1cDgwLmMgYi9ody9ibG9jay9tMjVwODAuYw0KPj4gaW5kZXggNDMwZDEyOThhOC4u
MDE5YmViNWI3OCAxMDA2NDQNCj4+IC0tLSBhL2h3L2Jsb2NrL20yNXA4MC5jDQo+PiArKysgYi9o
dy9ibG9jay9tMjVwODAuYw0KPj4gQEAgLTM1LDYgKzM1LDcgQEANCj4+ICNpbmNsdWRlICJxYXBp
L2Vycm9yLmgiDQo+PiAjaW5jbHVkZSAidHJhY2UuaCINCj4+ICNpbmNsdWRlICJxb20vb2JqZWN0
LmgiDQo+PiArI2luY2x1ZGUgInFhcGkvdmlzaXRvci5oIg0KPiANCj4gSSB0aGluayB5b3UgbWln
aHQgYmUgYWJsZSB0byByZW1vdmUg4oCcI2luY2x1ZGUgcWFwaS92aXNpdG9yLmgiIG5vdyB0aGF0
IHlvdeKAmXJlIHVzaW5nIERFRklORV9QUk9QX0JPT0wuDQo+IA0KPj4gDQo+PiAvKiBGaWVsZHMg
Zm9yIEZsYXNoUGFydEluZm8tPmZsYWdzICovDQo+PiANCj4+IEBAIC0xNTU4LDYgKzE1NTksNyBA
QCBzdGF0aWMgaW50IG0yNXA4MF9wcmVfc2F2ZSh2b2lkICpvcGFxdWUpDQo+PiANCj4+IHN0YXRp
YyBQcm9wZXJ0eSBtMjVwODBfcHJvcGVydGllc1tdID0gew0KPj4gLyogVGhpcyBpcyBkZWZhdWx0
IHZhbHVlIGZvciBNaWNyb24gZmxhc2ggKi8NCj4+ICsgREVGSU5FX1BST1BfQk9PTCgid3JpdGUt
ZW5hYmxlIiwgRmxhc2gsIHdyaXRlX2VuYWJsZSwgZmFsc2UpLA0KPj4gREVGSU5FX1BST1BfVUlO
VDMyKCJub252b2xhdGlsZS1jZmciLCBGbGFzaCwgbm9udm9sYXRpbGVfY2ZnLCAweDhGRkYpLA0K
Pj4gREVGSU5FX1BST1BfVUlOVDgoInNwYW5zaW9uLWNyMW52IiwgRmxhc2gsIHNwYW5zaW9uX2Ny
MW52LCAweDApLA0KPj4gREVGSU5FX1BST1BfVUlOVDgoInNwYW5zaW9uLWNyMm52IiwgRmxhc2gs
IHNwYW5zaW9uX2NyMm52LCAweDgpLA0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2FzcGVl
ZF9zbWMtdGVzdC5jIGIvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0LmMNCj4+IGluZGV4IDg3
YjQwYTBlZjEuLmZjYzE1NmJjMDAgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9xdGVzdC9hc3BlZWRf
c21jLXRlc3QuYw0KPj4gKysrIGIvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0LmMNCj4+IEBA
IC0yNiw2ICsyNiw3IEBADQo+PiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPj4gI2luY2x1ZGUg
InFlbXUvYnN3YXAuaCINCj4+ICNpbmNsdWRlICJsaWJxdGVzdC1zaW5nbGUuaCINCj4+ICsjaW5j
bHVkZSAicWVtdS9iaXRvcHMuaCINCj4+IA0KPj4gLyoNCj4+ICogQVNQRUVEIFNQSSBDb250cm9s
bGVyIHJlZ2lzdGVycw0KPj4gQEAgLTQwLDYgKzQxLDcgQEANCj4+ICNkZWZpbmUgQ1RSTF9GUkVB
RE1PREUgMHgxDQo+PiAjZGVmaW5lIENUUkxfV1JJVEVNT0RFIDB4Mg0KPj4gI2RlZmluZSBDVFJM
X1VTRVJNT0RFIDB4Mw0KPj4gKyNkZWZpbmUgU1JfV0VMIEJJVCgxKQ0KPj4gDQo+PiAjZGVmaW5l
IEFTUEVFRF9GTUNfQkFTRSAweDFFNjIwMDAwDQo+PiAjZGVmaW5lIEFTUEVFRF9GTEFTSF9CQVNF
IDB4MjAwMDAwMDANCj4+IEBAIC00OSw2ICs1MSw3IEBADQo+PiAqLw0KPj4gZW51bSB7DQo+PiBK
RURFQ19SRUFEID0gMHg5ZiwNCj4+ICsgUkRTUiA9IDB4NSwNCj4+IEJVTEtfRVJBU0UgPSAweGM3
LA0KPj4gUkVBRCA9IDB4MDMsDQo+PiBQUCA9IDB4MDIsDQo+PiBAQCAtMzQ4LDYgKzM1MSwyNSBA
QCBzdGF0aWMgdm9pZCB0ZXN0X3dyaXRlX3BhZ2VfbWVtKHZvaWQpDQo+PiBmbGFzaF9yZXNldCgp
Ow0KPj4gfQ0KPj4gDQo+PiArc3RhdGljIHZvaWQgdGVzdF9yZWFkX3N0YXR1c19yZWcodm9pZCkN
Cj4+ICt7DQo+PiArIHVpbnQ4X3QgcjsNCj4+ICsNCj4+ICsgcW1wKCJ7ICdleGVjdXRlJzogJ3Fv
bS1zZXQnLCAnYXJndW1lbnRzJzogIg0KPj4gKyAieydwYXRoJzogJy9tYWNoaW5lL3NvYy9mbWMv
c3NpLjAvY2hpbGRbMF0nLCAncHJvcGVydHknOiAnV0VMJywgJ3ZhbHVlJzogdHJ1ZX19Iik7DQoN
Ck9oLCBhZGRpdGlvbmFsbHk6IEkgZG9u4oCZdCB0aGluayB0aGlzIHRlc3QgcGFzc2VzLCDigJxX
RUzigJ0gbmVlZHMgdG8gYmUgY29udmVydGVkDQp0byDigJx3cml0ZS1lbmFibGXigJ0gaW4gdGhp
cyBxbXAoKSBjYWxsLg0KDQokIFFURVNUX0xPRz0xIC4vYnVpbGQvdGVzdHMvcXRlc3QvYXNwZWVk
X3NtYy10ZXN0IC1wIC9hcm0vYXN0MjQwMC9zbWMvcmVhZF9zdGF0dXNfcmVnDQpbSSAwLjAwMDAw
MF0gT1BFTkVEDQpbUiArMC4xMzk0NzRdIGVuZGlhbm5lc3MNCltTICswLjEzOTUwOV0gT0sgbGl0
dGxlDQp7IlFNUCI6IHsidmVyc2lvbiI6IHsicWVtdSI6IHsibWljcm8iOiA1MCwgIm1pbm9yIjog
MCwgIm1ham9yIjogN30sICJwYWNrYWdlIjogInY3LjAuMC05NDMtZzFlMDhhNTU4ZWUtZGlydHki
fSwgImNhcGFiaWxpdGllcyI6IFsib29iIl19fQ0KeyJleGVjdXRlIjogInFtcF9jYXBhYmlsaXRp
ZXMifQ0KDQp7InJldHVybiI6IHt9fQ0KL2FybS9hc3QyNDAwL3NtYy9yZWFkX3N0YXR1c19yZWc6
IHsiZXhlY3V0ZSI6ICJxb20tc2V0IiwgImFyZ3VtZW50cyI6IHsicGF0aCI6ICIvbWFjaGluZS9z
b2MvZm1jL3NzaS4wL2NoaWxkWzBdIiwgInByb3BlcnR5IjogIldFTCIsICJ2YWx1ZSI6IHRydWV9
fQ0KDQp7ImVycm9yIjogeyJjbGFzcyI6ICJHZW5lcmljRXJyb3IiLCAiZGVzYyI6ICJQcm9wZXJ0
eSAnbjI1cTI1NmEuV0VMJyBub3QgZm91bmQifX0NCltSICswLjE0MTg0Nl0gcmVhZGwgMHgxZTYy
MDAwMA0KW1MgKzAuMTQxODY5XSBPSyAweDAwMDAwMDAwMDAwMDAwMDINCltSICswLjE0MTkzNl0g
d3JpdGVsIDB4MWU2MjAwMDAgMHgxMDAwMg0KW1MgKzAuMTQxOTQ2XSBPSw0KW1IgKzAuMTQxOTc3
XSByZWFkbCAweDFlNjIwMDEwDQpbUyArMC4xNDE5ODRdIE9LIDB4MDAwMDAwMDAwMDAwMDAwNA0K
W1IgKzAuMTQyMDA5XSB3cml0ZWwgMHgxZTYyMDAxMCAweDcNCltTICswLjE0MjAxOF0gT0sNCltS
ICswLjE0MjA0M10gd3JpdGVsIDB4MWU2MjAwMTAgMHgzDQpbUyArMC4xNDIwNDddIE9LDQpbUiAr
MC4xNDIwNjhdIHdyaXRlYiAweDIwMDAwMDAwIDB4NQ0KW1MgKzAuMTQyMDc4XSBPSw0KW1IgKzAu
MTQyMTE3XSByZWFkYiAweDIwMDAwMDAwDQpbUyArMC4xNDIxMjVdIE9LIDB4MDAwMDAwMDAwMDAw
MDAwMA0KW1IgKzAuMTQyMTQ5XSByZWFkbCAweDFlNjIwMDEwDQpbUyArMC4xNDIxNTZdIE9LIDB4
MDAwMDAwMDAwMDAwMDAwMw0KW1IgKzAuMTQyMTgwXSB3cml0ZWwgMHgxZTYyMDAxMCAweDcNCltT
ICswLjE0MjE4N10gT0sNCioqDQpFUlJPUjouLi90ZXN0cy9xdGVzdC9hc3BlZWRfc21jLXRlc3Qu
YzozNjg6dGVzdF9yZWFkX3N0YXR1c19yZWc6IGFzc2VydGlvbiBmYWlsZWQgKHIgJiBTUl9XRUwg
PT0gU1JfV0VMKTogKDB4MDAwMDAwMDAgPT0gMHgwMDAwMDAwMikNCltJICswLjI5MTgyM10gQ0xP
U0VEDQpBYm9ydGVkIChjb3JlIGR1bXBlZCkNCg0KPj4gKw0KPj4gKw0KPj4gKyBzcGlfY29uZihD
T05GX0VOQUJMRV9XMCk7DQo+PiArIHNwaV9jdHJsX3N0YXJ0X3VzZXIoKTsNCj4+ICsgd3JpdGVi
KEFTUEVFRF9GTEFTSF9CQVNFLCBSRFNSKTsNCj4+ICsgciA9IHJlYWRiKEFTUEVFRF9GTEFTSF9C
QVNFKTsNCj4+ICsgc3BpX2N0cmxfc3RvcF91c2VyKCk7DQo+PiArDQo+PiArIGdfYXNzZXJ0X2Nt
cGhleChyICYgU1JfV0VMLCA9PSwgU1JfV0VMKTsNCj4+ICsNCj4+ICsgZmxhc2hfcmVzZXQoKTsN
Cj4+ICt9DQo+PiArDQo+PiBzdGF0aWMgY2hhciB0bXBfcGF0aFtdID0gIi90bXAvcXRlc3QubTI1
cDgwLlhYWFhYWCI7DQo+PiANCj4+IGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4+
IEBAIC0zNzMsNiArMzk1LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPj4g
cXRlc3RfYWRkX2Z1bmMoIi9hc3QyNDAwL3NtYy93cml0ZV9wYWdlIiwgdGVzdF93cml0ZV9wYWdl
KTsNCj4+IHF0ZXN0X2FkZF9mdW5jKCIvYXN0MjQwMC9zbWMvcmVhZF9wYWdlX21lbSIsIHRlc3Rf
cmVhZF9wYWdlX21lbSk7DQo+PiBxdGVzdF9hZGRfZnVuYygiL2FzdDI0MDAvc21jL3dyaXRlX3Bh
Z2VfbWVtIiwgdGVzdF93cml0ZV9wYWdlX21lbSk7DQo+PiArIHF0ZXN0X2FkZF9mdW5jKCIvYXN0
MjQwMC9zbWMvcmVhZF9zdGF0dXNfcmVnIiwgdGVzdF9yZWFkX3N0YXR1c19yZWcpOw0KPj4gDQo+
PiByZXQgPSBnX3Rlc3RfcnVuKCk7DQo+PiANCj4+IC0tIA0KPj4gMi4zMC4yDQoNCg==

