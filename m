Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321AA51DE47
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:18:39 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1bB-0005S0-Tl
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn1Zs-0004IA-4Y; Fri, 06 May 2022 13:17:16 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:21866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn1Zp-00053Y-Uk; Fri, 06 May 2022 13:17:15 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246GExwP014333;
 Fri, 6 May 2022 10:17:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5pSN1aIhxk6SFrKle4w2qs7mQIgHvjsgxFTepjqoQvY=;
 b=PWDSLTvomG0NWGU1VKuFa7lRO84BoXtBVsebe1QlpfnVFIx3Msiq1e90mzKSXuXUn2rp
 I1GbJZsOAej0+GQ8811jQF7Xz8OxMKzVgc0W2FUhIpwG0pHankclqr1M2EYcJ/8txCVs
 emYhCcpkan8RGDBsevzbumOm1RTAlkhwLbY= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fv03amy56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMaI8kEuKTKHKvcOofGRtsGiZnnAoToquoI5YRZBE97ax+6hCHMe3Cv3MmE2jIc983R2aTIjMup7TlLzAX0XJMv7zPb3CEip4VdNaRL5faFdXvgKzGYVD/F+2SczjWPwfA1tzgoA7EMtykhXoaB4XJ1Ml+7sNtfo9qepisWcIEEBf1csk7HSpMwbjDiFoarWsR3bYbeWsy3ZqWWerdtT1A5IJZ7YRNIQ99qtwXQbjRxYelIEZv0KVINq1ugaERZVK08LYH+IIzVOqlMt4oWUHzCkPmG7w8i9d9r9BZo3v0j4jJxaL1a5Q2tUIqmWrW2BXBX2D12arcrhPP4fLA0V3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL05zmmFqZRx5IH8KwxFeQdZG8gGkzlC/WIisNvGFAs=;
 b=iOE2xdQossAAs/6uV9Ss+SgAYDJCBSbfFm+ao9MGJMst5xZGi+ymM5HFhM40mxj7hrHVdY4FS1mYemIELzZz0K5zqA8LUDEYhk2k1eE/Gb58xuV9Wu58OGXUPqxD5MKNdjxM+KqHxVScJAB/VhUK/p12Zvg91oEWOdFo4WYGccMozzXlOr5zU+ZNwdDlJd4k3Gs9U6KFSlfBNKTMJsHCnJNLkKAh9L2UZWeI4wzEJwCDAb7m7odouSSNl4r+E0He2JrM6s0jY0CEybcWW7JoVAxjASnHm18rJqVDk5+y8AobuQX+kXREwwYS2+QZpxwbvjRQhLj0rrKXl8h5tEFWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MN2PR15MB3646.namprd15.prod.outlook.com (2603:10b6:208:1b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 17:16:56 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 17:16:56 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Klaus Jensen <its@irrelevant.dk>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYX0HIkqOKjoOJ/k+YKhqMRITql60OVaUAgACVbwmAAnvZAIAAtLsA
Date: Fri, 6 May 2022 17:16:56 +0000
Message-ID: <97A49820-76B2-4FAA-95C4-C1A5CD75C9CE@fb.com>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
 <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
In-Reply-To: <97674ac7-17c5-06cf-6bd0-0e7acc37abcc@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75f2b948-a9b1-4e52-744e-08da2f84391a
x-ms-traffictypediagnostic: MN2PR15MB3646:EE_
x-microsoft-antispam-prvs: <MN2PR15MB3646B4414D38D669394C29DCACC59@MN2PR15MB3646.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBrqwpqTQBO7uA3di7BwT039zw8AonCBnLZNDkAXiV82QNi77wOnpA7k1jOMCYAhNP/w0fHwxeOBj8+koxo/OZadwWrngBYDMoU9TSWfeUzueLJPCr+248u/Lv8W3rC0Mo0t8EOJWyloEIRP+9kPtN/wPGdxY4ADmXccOB6q8lN3DB57rgZ4KwNtFEGm41QJvUv49Es6ezzqMMi2nz3fgOc3YcXVnFr/G6CTD3P0Plez/Acf8vusEXcVDVA8PAdEZwIvx1xFCn95Sji4+l7yX6GVNB04bUTS6wlZ8Hv479zQmONJOyvnSBvA/tLb+jQA60zHBBsX/QYPkvKxrywxMOB76MnRha+uIInC3DZiaDpMWrxGZJdDxhee+zvCQv723Zxfyzl+QvJym/g7ImAMkHu5gUy7BPrNwXuILvkCerQx9l7z9p0uUCd8zaBSJ/ul5kueOL+iWjjmTrrOmojcqqU7OXKmkKWgNdWzKgPdvTaUDgh5GLNTY0ttLu/oxDGyv4DbmaO3XwRxTMpCsEbZ11h7Ngr0YTP0yGroYEEQV+8Kv0L1cSz3rX/0uQp0qzTim1thEt0hRpNzW2ES2cr6AHJDACmQPPue9T6dF9yuYpltTlNp4UosJqs1eP2SFte1bVUcS71fpnBHzQfEj2B3iKxq6vWzEpAwB4CN2WT8IxP9SgYwbaaMno/pOR1h0tp/NtmD9s0r53ysHIGRg8+nnCultHMEDso9MALxXiDAOzS1LdDti7iHaFIkF0N88/LP6Kny9nZ7d3pXwvzmxZhM3PcyCV6wwbmNSF+x223wqk2QPcmY3JDMzn2NXkw4o2oCu1Yuup/ksA31l/PZOcteWXW1XbOIeLkTihaHzI7N20w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(109986005)(83380400001)(186003)(6512007)(2616005)(2906002)(53546011)(6506007)(33656002)(36756003)(66574015)(966005)(6486002)(38100700002)(86362001)(508600001)(64756008)(76116006)(71200400001)(4326008)(66476007)(66556008)(66946007)(8676002)(66446008)(8936002)(54906003)(122000001)(5660300002)(316002)(38070700005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGZtdWN3eEw4OFo3SVcwOVU5d2ZRMXYzYXBweElCWGF2b0k5bHpoN1MwNWl2?=
 =?utf-8?B?Y0d6bWdCS2t0NXBINXg3Q1lYUDVCdEkyVHN6R1VjQWxnYXdSZXhPVElUanJR?=
 =?utf-8?B?dEVUckNVSE1MTHR0R1MwRmhST2g1cXYxcGdtYTdES0hhWTBSU1ZQQ1RYZ2xX?=
 =?utf-8?B?NEE2b2c5ZDY0ckhacUtoNUVQcjJrL25NZnFrVzBBaWE2cE41SHYrYjkwd3J1?=
 =?utf-8?B?K0lzL3U1NnlwM0ZMakhja250Si9Nak9aRE9CZWNocjQwL3NJK1FXckttWHc4?=
 =?utf-8?B?M0w1M0pwb0pCZnBBYk9ZYVhsanVidXNWa1pyeFVELy9adlRheGFxTS9hbDJH?=
 =?utf-8?B?NEk1Z1JvK01vM2E2MGFSSXNrVjN1c3JPMXMwSTRZenhYNXNMazBOcHFXREFv?=
 =?utf-8?B?KzlsdW5CME1sYmVuM1Y3WEhmd2I4ZlduQU5OR1lqcGMxT0llZnYxY1lveHZn?=
 =?utf-8?B?MUk5MlM3bVh1S0JEa0IrVmR3UUYvbXg3RHNWOUhtdkZjTnNUaERxL1NvMmF5?=
 =?utf-8?B?N01oZWNPNEE2QjBGYTVwMVRIaFZKZHNiL05rTVY1ZkZSUjA0YnJBQUx2bXla?=
 =?utf-8?B?V3dGdDZ3UkpzeTR3NmtCUE5DNzdJWkVOeStoVkVVOUppblMwalkxTktmc2Fn?=
 =?utf-8?B?VTZVT1B2Y1lhdzA0V01TaWJ5akJiSE5FMGJOT0NvcGl5TnRTQ0Y2NUwwVDR0?=
 =?utf-8?B?VjZSZzArVzVXcys2K2pqa0FqWU16bWJ5Y0xKMzh1aWFhcFk5VG92OTVOL2o3?=
 =?utf-8?B?Um82d2tPekovUE5oRUhJb0VVMndFQzFHdnJKQWozeThFYVJTK3NxdWlpRVl0?=
 =?utf-8?B?c3VmVmVKbFJ3c2NHckFZOE5mZ01ObHlodEdqdlJwL1JOSEd1UDBPV2ZCVHlu?=
 =?utf-8?B?ZFlJL2lOTW0rOTBSaURmcEVnZEQ5MHdWUk5MbUNyNHlvenZ5a0FXcmFBVjky?=
 =?utf-8?B?WWpTU01lYWlMYUQ2UHNxY2ZlWWRzeFFvY1JjcElWWVZzUERMaXE5RnpzT2dU?=
 =?utf-8?B?bFhoeVNBZjcyNTFGdjc1NW55eWJQSkFKaUd0YkRyVG1xNUgvUmNIcVVjRVNB?=
 =?utf-8?B?WnpoTSs1TUc0bGhJUFhYYVhSOW44dEs5dDdpMEF0WUQzR2puSzhmdmU3b1Uv?=
 =?utf-8?B?MEYvY0lQQm5ZQTN1eVRaMk52RTRyUHp5M2JSek00Sk9TRkJ1aWNQWjdPY2ly?=
 =?utf-8?B?VTlOWGVnSVhWdU9vOStQYkhHUmN3emtVS2hSOTJmaE5UdU1tSUlIaUNtQzZ0?=
 =?utf-8?B?dE93TUk5Q1JYbUpXSWFoZGtzNUNCNHFjTXFVUlRJS1VjQ2k2MTVCOWZ1S1g2?=
 =?utf-8?B?N3hkNGVrcTQ0RlBHK0FyekFLeFZ6RExRNmJoZTBvNjRBTmNXWmlIUTZtSTA1?=
 =?utf-8?B?RkQ5V2owalM0OTdXTDN6MmZLeTNiai9BOEVVUWE5Rm5Gd09ocEZybG10YmRJ?=
 =?utf-8?B?OFFKTDR1Q2lzQ2UvRFJPWHFXZmxuMnJITndtQjI1STNwcVAzQ0pqQnVGRVg5?=
 =?utf-8?B?ekFpc2pBd095OEZ5Nzk0VytEdzBycnkxcVRkU3BhM0dpTUhjaklZZnlIUFI0?=
 =?utf-8?B?UGl3S3JvNm5neUVlUytRc0F4aTRiTGtTNGsyZ3BFc2Q2OXRFT3dMRk9QV2dy?=
 =?utf-8?B?QnZ5VkVNQ0lZMmtjYTVWWkU3ZXN5S3U1Z3N6aHI4Y2NKcnV3WXVuTnN6eGhT?=
 =?utf-8?B?UUJJeXk0TjVlTXNaQk14V0sydytLR2RoQlVuMHd5bVFFczZvbUVENFJSS3Fw?=
 =?utf-8?B?b3ZteEU5Y0piUmpydHJWdzlPL0NLbjVSTU1sRENkbmphak44RVlkU25TSnMr?=
 =?utf-8?B?WWFkU3luNWUzeTZzdHFFUWhNRjhlL2xoWHJpZEhEQnFLNHY5bEZsYWlZSGtu?=
 =?utf-8?B?QUVFR0dvZkNJMWQ3MWF3NW4wRlZBRUtaSHljL01oOHdxVHZYOURGM3ZJRjFj?=
 =?utf-8?B?eE9pMEVoYmVTanlOcDZSRXJpQWVzSjJnNUwrc0Q4OVdjMjAvTXcvYy8veWNu?=
 =?utf-8?B?WTVMOWRSTHhjaEsrSGVpeUJpczV0Y0d0VEY4UjUzTDZpWW5UMFhZVndlV1VI?=
 =?utf-8?B?RmdYVDJ2NjBYMGpKVjUrdGxSaWVVdXE0YW1panZtNys5Wi9JREN2M0ZPSHdS?=
 =?utf-8?B?RUdhWm1iVUk1eVY5aS9iT0lyc3hIQm1xMzhFdlNReE9Td1RZK2RPc1l0djBT?=
 =?utf-8?B?Umc0Tk9UVndRRzMwdlo1MFdLdzZtZlc3aHNnSlZUNG1UeHE1NU1wMDJkRm5j?=
 =?utf-8?B?SGRPZmFtNDBueTM4R0kxL2RydUkxZjJHQkF0OWdyVTI1dmZkRnpEZFJEa3E1?=
 =?utf-8?B?SW1SbW9UaVB2aWpYTGpsRnpwU1V1b2RGelRzZ1RkYzVFejVBL0ZNZVpXZXc3?=
 =?utf-8?Q?bXsdwmK1C4y7hig0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66475324B4D9F045B9F9A92C83B9621D@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f2b948-a9b1-4e52-744e-08da2f84391a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 17:16:56.6101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjcLx9LG/enGEtkFSLzoQXL+gsapmQt+ZgKA6DvknV9N5kFM/MFT4I4qtdESc4xy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3646
X-Proofpoint-GUID: 2wxg1F_WGZ69R6fIjf-H7jWS8YkEgVUe
X-Proofpoint-ORIG-GUID: 2wxg1F_WGZ69R6fIjf-H7jWS8YkEgVUe
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_06,2022-05-06_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6125b5e310=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gTWF5IDUsIDIwMjIsIGF0IDExOjMwIFBNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IE9uIDUvNC8yMiAxODozNCwgUGV0ZXIgRGVsZXZvcnlh
cyB3cm90ZToNCj4+PiBPbiBNYXkgNCwgMjAyMiwgYXQgMTI6MzkgQU0sIEPDqWRyaWMgTGUgR29h
dGVyIDxjbGdAa2FvZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IO+7v09uIDUvNC8yMiAwMDo1OSwg
UGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+Pj4gQWRkIHRoZSAnZmJ5MzUtYm1jJyBtYWNoaW5l
IHR5cGUgYmFzZWQgb24gdGhlIGtlcm5lbCBEVFNbMV0gYW5kIHVzZXJzcGFjZQ0KPj4+PiBpMmMg
c2V0dXAgc2NyaXB0c1syXS4gVW5kZWZpbmVkIHZhbHVlcyBhcmUgaW5oZXJpdGVkIGZyb20gdGhl
IEFTVDI2MDAtRVZCLg0KPj4+PiBSZWZlcmVuY2UgaW1hZ2VzIGNhbiBiZSBmb3VuZCBpbiBGYWNl
Ym9vayBPcGVuQk1DIEdpdGh1YiBSZWxlYXNlIGFzc2V0cw0KPj4+PiBhcyAiZmJ5MzUubXRkIi4g
WzNdDQo+Pj4+IFlvdSBjYW4gYm9vdCB0aGUgcmVmZXJlbmNlIGltYWdlcyBhcyBmb2xsb3dzIChm
YnkzNSB1c2VzIGR1YWwtZmxhc2gpOg0KPj4+PiBxZW11LXN5c3RlbS1hcm0gLW1hY2hpbmUgZmJ5
MzUtYm1jIFwNCj4+Pj4gLWRyaXZlIGZpbGU9ZmJ5MzUubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwN
Cj4+Pj4gLWRyaXZlIGZpbGU9ZmJ5MzUubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4+Pj4gLW5v
Z3JhcGhpYw0KPj4+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL29wZW5ibWMtbGlu
dXgvYmxvYi80MTJkNTA1MzI1ODAwNzExN2U5NGIxZTM2MDE1YWVmYzEzMDE0NzRiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stZmJ5MzUuZHRzDQo+Pj4+IFsyXSBodHRwczov
L2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy9ibG9iL2UyMjk0ZmY1ZDMxZGQ2NWMyNDhmZTM5
NmEzODUyODZkNmQ1YzQ2M2QvbWV0YS1mYWNlYm9vay9tZXRhLWZieTM1L3JlY2lwZXMtZmJ5MzUv
cGxhdC11dGlscy9maWxlcy9zZXR1cC1kZXYuc2gNCj4+Pj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNv
bS9mYWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIERl
bGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4+IA0KPj4+IFJldmlld2VkLWJ5OiBDw6lkcmljIExl
IEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPj4gVGhhbmtzIQ0KPiANCj4gQ291bGQgeW91IHBsZWFz
ZSBzZW5kIGEgdjIgd2l0aCBhbiB1cGRhdGUgb2YgdGhlIGRvY3VtZW50YXRpb24gPw0KPiBvciBh
IGZvbGxvdyB1cCA/IG5vIG5lZWQgdG8gcmVzZW5kIHRoZSBmaXJzdCBwYXRjaCB1bmxlc3MgeW91
DQo+IHdhbnQgdG8gY2hhbmdlIHNvbWV0aGluZy4gQSBvbmUtbGluZXIgaW4gOg0KPiANCj4gaHR0
cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9zeXN0ZW0vYXJtL2FzcGVlZC5odG1s
IA0KPiBbIC4uLiBdDQo+IA0KDQpPaCwgeWVhaCBJ4oCZbGwgc2VuZCBhIGZvbGxvdy11cCwgSSBk
b27igJl0IGhhdmUgYW55dGhpbmcgZWxzZSB0byBjaGFuZ2Ugb24gdGhlIGZpcnN0IHBhdGNoIEkg
c3VwcG9zZS4NCg0KPj4gQXMgYSBtYXR0ZXIgb2YgZmFjdCB5ZXMhIEkgdGVzdGVkIGJvb3Rpbmcg
b3VyIE9wZW5CSUMgWmVwaHlyIGtlcm5lbCBsYXN0IHdlZWsgd2l0aCB0aGUgMTAzMCwgdGhhdCB3
b3JrZWQuIEkgYWxzbyB1c2VkIHRoZSBleHBlcmltZW50YWwgaTJjIG11bHRpLW1hc3RlciBwYXRj
aGVzIGZyb20gS2xhdXMgdG8gbWFrZSBhIGkyYy1uZXRkZXYgZGV2aWNlIHRoYXQgY29ubmVjdHMg
dHdvIHNlcGFyYXRlIFFFTVUgaW5zdGFuY2VzIHRocm91Z2ggYSBzb2NrZXQgYW5kIHNlbmRzIHRo
ZWlyIGkyYyBtZXNzYWdlcyBiYWNrIGFuZCBmb3J0aC4gSSB3YXMgYWJsZSB0byB0ZXN0IGEgYmFz
aWMgTUNUUCB0cmFuc2FjdGlvbi4NCj4gDQo+IE5pY2UgISBBbmQgZG8geW91IG5lZWQgYW55dGhp
bmcgc3BlY2lhbCBmcm9tIHRoZSBJMkMgQXNwZWVkIG1vZGVscyA/DQo+IEFwYXJ0IGZyb20gOg0K
PiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvbGlz
dC8/c2VyaWVzPTI5MjkyOCANCg0KTm9wZSwgSSBkb27igJl0IG5lZWQgYW55dGhpbmcgZWxzZSwg
dGhvc2UgZXhhY3QgcGF0Y2hlcyB3ZXJlIHN1ZmZpY2llbnQuIEkgZGlkbuKAmXQgbmVlZCBhbnkg
YWRkaXRpb25hbA0KbW9kaWZpY2F0aW9ucyB0byB0aGUgaTJjIHNlbmRfYXN5bmMgbW9kZWwgS2xh
dXMgbWFkZS4NCg0KTXkgY29kZSB3YXMgbm90IHZlcnkgc29waGlzdGljYXRlZCB0aG91Z2gsIGl0
IGp1c3QgYXNzdW1lcyBBQ0sgZm9yIGV2ZXJ5IGJ5dGUgaW4gYW4gaTJjIG1lc3NhZ2UsDQpidWZm
ZXJzIHRoZW0sIGFuZCB0aGVuIHNlbmRzIHRoZSBpMmMgbWVzc2FnZSBhcyBhIFVEUCBwYWNrZXQu
IFRoZSByZWNlaXZlciBidWZmZXJzIHRoZSBpMmMgbWVzc2FnZQ0KYW5kIGFzeW5jaHJvbm91c2x5
IGRlcXVldWVzIGVhY2ggYnl0ZSB0aHJvdWdoIHNlbmRfYXN5bmMgKGFmdGVyIG1hc3RlcmluZyB0
aGUgYnVzKS4gSeKAmWxsIHBvc3QgdGhlDQpkaWZmIGFzIGFuIFJGQyBzb29uLCBpbiBjYXNlIGl0
IGhlbHBzIHdpdGggZXZhbHVhdGluZyBLbGF1c+KAmXMgY2hhbmdlcy4NCg0KaHR0cHM6Ly9naXRo
dWIuY29tL2ZhY2Vib29rL29wZW5ibWMtcWVtdS9jb21taXQvYzAzNzMwOTg2ZDUyMWNhMmEwNmZk
NDU3MGQyOWYyNDUyZDEzZjhkYQ0KDQpUaGUgcHJvYmxlbSBJIGZvcmVzZWUgaXMgdGhhdCBwZW9w
bGUgYXJlIGludGVyZXN0ZWQgaW4gTkFDSyBlbXVsYXRpb24sIFNtYnVzIEFSUCwgYW5kIGdlbmVy
YWxseSwNCmVtdWxhdGluZyBhbiBpMmMgX2J1c18gd2l0aCBhIG11bHRpY2FzdCBVRFAgc29ja2V0
IGFuZCBub3QgcG9pbnQtdG8tcG9pbnQgaTJjIGRldmljZSBjb25uZWN0aW9ucy4NClRoYXQgd2F5
IHlvdSBjYW4gaGF2ZSBtdWx0aXBsZSBRRU1V4oCZcyBsaXN0ZW4gdG8gYSBzaW5nbGUgbXVsdGlj
YXN0IFVEUCBzb2NrZXQgb3Igc29tZXRoaW5nDQphbmQgZmlsdGVyIG91dCBtZXNzYWdlcyB0aGF0
IGFyZSBkaXJlY3RlZCBhdCBvdGhlciBpMmMgZGV2aWNlcywgc29tZXRoaW5nIGxpa2UgdGhhdC4g
QW5kLCBwcm9iYWJseQ0Kc2VuZCBlYWNoIGJ5dGUgaW5kaXZpZHVhbGx5IGluc3RlYWQgb2YgYnVm
ZmVyaW5nIGFuZCBzZW5kaW5nLiBCdXQsIGJ1ZmZlcmluZyBzdHVmZiB3b3JrcyBmb3INCm15IHB1
cnBvc2VzIGZvciBub3csIHNpbmNlIEnigJltIG1vcmUgaW50ZXJlc3RlZCBpbiBlbmFibGluZyBo
aWdoZXIgbGV2ZWwgTUNUUCB0ZXN0aW5nIHRoYW4NCnNpbXVsYXRpbmcgaTJjIG11bHRpLW1hc3Rl
ciBjb250ZW50aW9uLg0KDQo+PiBJ4oCZbSBob3BpbmcgdG8gaGVscCBob3dldmVyIHBvc3NpYmxl
IHdpdGggbWVyZ2luZyBLbGF1c+KAmXMgY2hhbmdlcywgDQo+IA0KPiBUaGV5IGRvbid0IG5lZWQg
bXVjaCB3b3JrLiBLbGF1cyBkb2Vzbid0IGhhdmUgdGhlIGRhdGFzaGVldCwgc28gd2UNCj4gc2hv
dWxkIGhlbHAgaGltIHdpdGggdGhlIGNoYW5nZXMgcmVxdWlyaW5nIHNvbWUgaW50ZXJuYWwga25v
d2xlZGdlLg0KPiANCj4+IGFuZCB0aGVuIHByb3Bvc2UgdGhlIGkyYy1uZXRkZXYgdGhpbmcgdG9v
Lg0KPiANCj4gSSB3YXMgZ29pbmcgdG8gYXNrIHNpbmNlIEkgZGlkbid0IHNlZSBhbnkgbW9kZWxz
IGZvciBzdWNoIGRldmljZXMuDQo+IA0KPiBJIGhvcGUgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIg
d2l0aCB0aGUgdXNiLW5ldCBkZXZpY2UgYnV0IGl0IG5lZWRzDQo+IGZpeGVzIGZpcnN0Lg0KDQpP
aCBJIHdhc27igJl0IGF3YXJlIGFueW9uZSB3YXMgZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIsIEni
gJlsbCBoYXZlIHRvIGxvb2sgYXQgaG93IHlvdSBkaWQNCnRoYXQuDQoNCj4gDQo+IFRoYW5rcywN
Cj4gDQo+IEMuDQoNCg==

