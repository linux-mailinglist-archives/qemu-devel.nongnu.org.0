Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F8406FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:38:23 +0200 (CEST)
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOjXh-0006ou-LF
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOjWM-000641-Np
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:36:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOjWK-0003tk-8P
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:36:58 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AE5dim005261; 
 Fri, 10 Sep 2021 16:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2AG1G2fJucTOw2BGm8LD1VdZm0r/sayn1usIH+Fkvww=;
 b=RwHnFrrRrchpFRcAU0G/R3nCujbjwBuLuekK42EHdixIEGNWzSP1gjYit4ibc2jRBNke
 eiGzoNlk0QsZ5gxmqYb8CMIxOX/Lm5Dsu2YOd1GZ2CRi42u4c37daXmoDPiqWjt7Er/F
 wKWyreQ1NvvGxy1d94kIY1I4fXpqSaOp9uJHqKgYXjKV8wtPvgVGvmArpHvQENcnmnZ8
 Hd/dX0mxA2vIfsB0nL+3c7dAy4nDpUQ6eH+c4Lrq6Fza13of67p+Ia65NrcKxMmwSTg7
 Tu92iZOtVeSuhbUDEEWLPfevFzx9lQFfxWjbDWwi6JptmAuxpN76ryMH0I2sz94MeDot ZA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=2AG1G2fJucTOw2BGm8LD1VdZm0r/sayn1usIH+Fkvww=;
 b=NSg2wteGjHYyYcuIjXb1Wg0yTxKGN8V6Q0uL8jtMh9viWkK3f+Lm+0oOjepCrOAuA8GK
 UGPA4ZPUOuJxTgbF+VeeBD8qrbacWDGxAP7bDQTnbYGVUC3cBtcfkgQyb6tuAgfKTRf3
 fe5JJxd902USg1N/6C2CyGYixmaMmXrpXidfOnXeCZniRMqAuaZ0m7RynrQOw2sF/geJ
 HxhIjo5+YySTAyjx8csokMFpymYfXswhpUPVOHUItpID94rY74asSZCA/b8Z0LtRMW60
 c0uxsWGO8A4VvGDlXs6gIIyU0BaRAUsZB5uUBgB9bCHNoWyzhjPMvqbpgvUIZ9HQ2wi8 cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytj5jdsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 16:36:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18AGYwvf072229;
 Fri, 10 Sep 2021 16:36:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3030.oracle.com with ESMTP id 3aytfu4kq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 16:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8Sw3cZriH5gF/fPQ/pJp9sBrR/KRAHQ0pHZIsdU1FON9Y2ZbJZDBeoFpOKMvB5o+m6UAKOg3Au3m7NOdqIBYYoD7bYNqt0gVjbXwObIFrXhuXF+IJ4+im/2pgL7RXND5WlckuuvODjwAlZr5mKXyJ4BaZEUTNRGFoOlCVNKsACHAgUPKTIdUUxrmI4GKnrBYzarlCQVKvCZjiUeYz/g7rxkNyb/hWazpqkT6P2TWbSNo68s3Yrps7ZrDD3s9IGpsiLeEA9ueknB/is7aFzIBY7lFyGE9yGpWl2381HV1jrEMZTI5e1AXME5Mb3mjA1FWoZpup0vxs8vxD+UVGPiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2AG1G2fJucTOw2BGm8LD1VdZm0r/sayn1usIH+Fkvww=;
 b=KY6BNESW+HZ1cTCo64VkHIDroB3boSz2hh8Tj/y6/wqIpuKtsJnQnX6Xr6uCx8J0bDpRi9vnpFKji6XtpFkB60ufZ7NWMGtlSJKSdRjtXwA1XYGyNGyM5mzpYrKchwc8V273hATZ3SNXfn+hk7ePVmnzADA7WwmmTUNbhbYL3dBakLlps1J4lhRDlc3i8DexG2zGiULVCqnEDqFoai1QcJNglVXFCcSty2WKw975HDNgEPuIoxB6L90q6LpPjd7zw4IHfB1co2Gw+kkNl/YLSOQSedLtBUsJBSBTgmXrJztQt8r4tvHJETJlvJH4RtlU1tgl5opE606vxJiX1Evi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AG1G2fJucTOw2BGm8LD1VdZm0r/sayn1usIH+Fkvww=;
 b=dgo3JQQtiEiZDY5AuOJK2vX5mHq6HVZ1yGO66IkCMjNGzQMlDY/TYgQebAz9uFbOk8EBXb4SmnmmIAUmuh8AYeopbfh6xeNsgBAHcYWWVz0Ly0HPKQRIWOKFiwV19nQvYNo+9lMagziKqpdPtqCegmHx5BsRYAAtmwN4y9NBt1E=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3840.namprd10.prod.outlook.com (2603:10b6:208:181::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 16:36:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 16:36:50 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 08/11] vfio-user: handle PCI BAR accesses
Thread-Topic: [PATCH RFC server v2 08/11] vfio-user: handle PCI BAR accesses
Thread-Index: AQHXm2a+KjZc8W7ybkeiNPf4DtkrVaubZE4AgAIo/4A=
Date: Fri, 10 Sep 2021 16:36:49 +0000
Message-ID: <DFED603A-4BD6-4128-9DD5-5BEC07C92C4A@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <8dde83642333cbe5e616a619507697dcfd315a10.1630084211.git.jag.raman@oracle.com>
 <YTm5vhhceiHHl0IN@stefanha-x1.localdomain>
In-Reply-To: <YTm5vhhceiHHl0IN@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9612606-202d-47e1-4d55-08d974793054
x-ms-traffictypediagnostic: MN2PR10MB3840:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB3840CC7646CAD9209AEE719390D69@MN2PR10MB3840.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ltDZRN1KuH6BlmGTobz2+Z7DTVKaOXH8wAdUhmyWStSOOHf7C+kFKBsq3xtqQSdH+MFRMa++Aru/qIGzq2H0RuaZLaIykIPW/zekQqd+xVhJPPFij2xR0WE0/fquVqMrI3IsCdBmoaPrSwfn/85v41cuhLio1lbyfEGiDT89eZV07QjxpimQ/05U489gCUUZQh5zgCp54Ta+QOaBG7xC1Kofl3pHqzBuUMR/UyI9AauBblaiiqutAqNFMTHOGal3qDrDwDvaPvNO70TO5Ww8mhq7dhXNIYcP1Mfy+tCa6pa+nzDNkaeOr1xsIkQ/W/34fG7pZHvMO3ulaYPuqbUIFTX2R30yajKQEfY3Qay6Kw4XZHfz8FYzqQBVPTNdc0PqJs+pS/CjDZjlAc1XSEJaKR8y416S7/9k4zk7gR2LMbPaYyFjra17BzMpq7mSc4L9RsTlFYRAVY2vqxjpFJ6muMjvR5XxEBd8VA8GfRj6OqLY8rjn2OUhhz2WyndinCW32+Eq7RjK5OYVl3pawm1rWMaIDFn8PFYVZgL8PeqbeW0xoqNmFGtBlz5ZWfz6xRXp7r4fhVSQUbCjeVjwgff2douMOWIeqXOKZGKGHTI74PfwIrXyMBzcqENrCQzuvoPexJmfLV/qYylOGi+J5dqjtGWe292IyC5qYcKDWNYGLPnorfvS04z3aoGNAkXQiddJEShOKAUPwCTIfo9I9FFVru8USVKMbS6fowpLZyWbsXZOwZvD2Yy+MlR2jo24iydp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(122000001)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(66946007)(7416002)(33656002)(71200400001)(38070700005)(508600001)(83380400001)(54906003)(316002)(6916009)(4326008)(2906002)(44832011)(86362001)(36756003)(5660300002)(6512007)(6506007)(53546011)(186003)(8936002)(2616005)(6486002)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0hkcGFWMTAvdW5jTWxOYjlJczlMUXZhNC8yYkt0YzQ1UHZUQks0WDhDZURk?=
 =?utf-8?B?cG5oWWg1aDVseitQM1NZZ2lqTnJyZ2JFNjRnWTRveWRORFdHYW9YbGJUTG1t?=
 =?utf-8?B?NXBYNkF1eVo4NmhBdDdYYmZJNkhWbkROM1EzemZrUWVMdSs3RzgrUkZ3c0FW?=
 =?utf-8?B?dmZVaXEwTkw3YTVOMWE0M1ZCU0Y4QitPeWVZcmpsMnBpanBUcHVZdUJreVJi?=
 =?utf-8?B?K25GZ2F5N1pid1pnaWRydzRDTWc3UW5xNTRTME1zZW5xOXhHZ0wzbk9MVGda?=
 =?utf-8?B?cHhzMXlHSWswejRieHRFcUJmTDZIdTlHejRoNktrNWZydDNadFNBTFBpRDBH?=
 =?utf-8?B?WHRQRlNEbFVyVHFWeXpVRFB6UEZIbGpzOEM1dC92NUt2dVJ5OGJKT1hyaTJJ?=
 =?utf-8?B?VnQ2NFdWQ0hYQVNlZnBzeU1mOU9RcFdQTkZyWXNKbEhRaFNTdU93TjVtZWRk?=
 =?utf-8?B?YXVEUXVEMEYyYy9LT2thTS90WU0vSWZRcVkremZwSEhCYkVGaE5rY0xQTUdj?=
 =?utf-8?B?WGQ1eTN2UVhNSFZpSGNaTkk0Y08rZ0szNXRaWjdDWVcrQTd4MUV1SytTZ1Rs?=
 =?utf-8?B?bTVIMVJYeXRNdXEweXc4RDJFUnc4YTRDR0VDMGpwNDlBZGdJbFVNMzgzM2JS?=
 =?utf-8?B?THBiNkNxbWs4WW9rSjBNU3hSbk95V2d1aENycHJWOTJPeVdRNHMrK3UvbjV4?=
 =?utf-8?B?bnJ5bklsL250ZkhwQlMxMXFFQ1BheHg4T2hCSW1SZzV0QkJxdCtUdThwVGhF?=
 =?utf-8?B?aENVdkRDWGpsUG1abXp0Q0Ruc0JlSUNDekZIREJTVFYwSFErZVBvRWdRWCt4?=
 =?utf-8?B?V2w4Z3JCcHZGTUJVbTUrbTFVUE1FM3NTZlJJWVNqV2hncC8vR05IRy9rR1d5?=
 =?utf-8?B?ZlN5YUdaN0ZkOFk3c1hFMTRxS3cwaFhSNU9lWmZUR0ZodmFna3RtQjFqMGRT?=
 =?utf-8?B?RW5PaFFtWklWaHRDT1BpNlkreVdaZjNFU2R4TTc4OVlTWTBKb1g0VGUwTGRP?=
 =?utf-8?B?MHdpT1VaOWlnZ0VJV2xCTCsvNWgvbFU3YVozZXhMT0lrVHZJdzMwRU1VVTY4?=
 =?utf-8?B?bUNvNUZSOE1SV29WSG9rM0pTWTN3ekh2cStQaVhsRGhURzBCRG94VFBFTXBn?=
 =?utf-8?B?WTVkVWYvTEpTelR4MnVDY1lUZzY1ZHdYYjhvdFNQc0huM3kxYXBGRTNFMTB1?=
 =?utf-8?B?TzVCSGNOVXh5WlRPZGltdzlvbXdqVlVBSFo1SXIwTnplNkVsVDhGM09GNmdq?=
 =?utf-8?B?RmpZSXpPM3E1STFTWjJUNk5Sd3FtTWQyYzFCbW12NWx1Uy9udTdac2s1d0p1?=
 =?utf-8?B?NFFDQU9xcUtvM2hkODh3SzJvM1RJcXozaHRIYXI5ZEZ2WG5KL29Dc1I3Q3Vr?=
 =?utf-8?B?QmIwdXhaVUVOa0FtLzNxRzlGek9UeXMxUTlFczBjSEF1eXBNUldxZkZqQTJH?=
 =?utf-8?B?d3kxVmZ2bnhKeGlheW95QVM4ejY0WXlOenJ4UWxQYk5KUVFoUk96cnhuNzZS?=
 =?utf-8?B?TlhiTHFnUDJzWkE1b1FEbEViOXBiOGR1ejc1U2ZXTTF0a0Ewdm9ob0dROGlt?=
 =?utf-8?B?d2xSRnZXdm0xbTd0MFUvcTdncmtyaVptQ00xbUFpVkIyNGMreW5DeWN3NGNl?=
 =?utf-8?B?d2VtQXk4YkhLeFUxN0dlRUtXRWNwT3ZqUUJ2MHRrd05ka0lpQ21FUG05Q2Mw?=
 =?utf-8?B?YVZ3TGxTQ2pFb0NYVUo2dzJRVVo5R04vSXd4eUdVbm1jQ0FDZjhpbXpaUjlE?=
 =?utf-8?B?d0RiNUVpTDNzSW51MzMwQlhaaUpzNVd3LzhTUDdoalJ5UkRqV0R0Tk1RWlpj?=
 =?utf-8?Q?nId3v2X257xCXHItnTQFuFwhUcFD72Nbt63Fc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8B14CA32EC42640A78AE6A42E37F6B3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9612606-202d-47e1-4d55-08d974793054
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 16:36:49.7573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDNRnQ3ix+EKDGdZKPvdzDhjRrQZZ3Mkl3yS6JdwgWQkIWnR0TKNaHMi+zZ89tyD/50L7LC+vkEFZkvXXgS6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3840
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10103
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100096
X-Proofpoint-GUID: fqKTgZC5QflKpMgKCR9HNGz45fdklbUa
X-Proofpoint-ORIG-GUID: fqKTgZC5QflKpMgKCR9HNGz45fdklbUa
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDksIDIwMjEsIGF0IDM6MzcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCAwMTo1
MzoyN1BNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+ICsvKioNCj4+ICsgKiBW
RlVfT0JKRUNUX0JBUl9IQU5ETEVSIC0gbWFjcm8gZm9yIGRlZmluaW5nIGhhbmRsZXJzIGZvciBQ
Q0kgQkFScy4NCj4+ICsgKg0KPj4gKyAqIFRvIGNyZWF0ZSBoYW5kbGVyIGZvciBCQVIgbnVtYmVy
IDIsIFZGVV9PQkpFQ1RfQkFSX0hBTkRMRVIoMikgd291bGQNCj4+ICsgKiBkZWZpbmUgdmZ1X29i
amVjdF9iYXIyX2hhbmRsZXINCj4+ICsgKi8NCj4+ICsjZGVmaW5lIFZGVV9PQkpFQ1RfQkFSX0hB
TkRMRVIoQkFSX05PKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
Pj4gKyAgICBzdGF0aWMgc3NpemVfdCB2ZnVfb2JqZWN0X2JhciMjQkFSX05PIyNfaGFuZGxlcih2
ZnVfY3R4X3QgKnZmdV9jdHgsICAgICAgICBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNoYXIgKiBjb25zdCBidWYsIHNpemVfdCBjb3VudCwgICAgICAgIFwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9mZl90IG9mZnNl
dCwgY29uc3QgYm9vbCBpc193cml0ZSkgICAgXA0KPj4gKyAgICB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+PiArICAgICAgICBWZnVPYmplY3QgKm8gPSB2ZnVfZ2V0X3ByaXZhdGUodmZ1X2N0eCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgIGh3YWRkciBhZGRyID0g
KGh3YWRkcikocGNpX2dldF9sb25nKG8tPnBjaV9kZXYtPmNvbmZpZyArICAgICAgICAgICAgICAg
XA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0JB
U0VfQUREUkVTU18wICsgICAgICAgICAgICAgICBcDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoNCAqIEJBUl9OTykpICsgb2Zmc2V0KTsgICAgICAgICAg
IFwNCj4gDQo+IERvZXMgdGhpcyBoYW5kbGUgNjQtYml0IEJBUnM/DQoNCkl0IHByZXNlbnRseSBv
bmx5IGhhbmRsZXMgMzItYml0IEJBUnMuIFdl4oCZbGwgYWRkIHN1cHBvcnQgZm9yIDY0LWJpdCBC
QVJzIGluIHRoZSBuZXh0IHJldg0Kb2YgdGhpcyBzZXJpZXMuDQoNCj4gDQo+PiArLyoqDQo+PiAr
ICogdmZ1X29iamVjdF9yZWdpc3Rlcl9iYXJzIC0gSWRlbnRpZnkgYWN0aXZlIEJBUiByZWdpb25z
IG9mIHBkZXYgYW5kIHNldHVwDQo+PiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAgY2Fs
bGJhY2tzIHRvIGhhbmRsZSByZWFkL3dyaXRlIGFjY2Vzc2VzDQo+PiArICovDQo+PiArc3RhdGlj
IHZvaWQgdmZ1X29iamVjdF9yZWdpc3Rlcl9iYXJzKHZmdV9jdHhfdCAqdmZ1X2N0eCwgUENJRGV2
aWNlICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgdWludDMyX3Qgb3JpZ192YWwsIG5ld192YWw7DQo+
PiArICAgIGludCBpLCBzaXplOw0KPj4gKw0KPj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgUENJX05V
TV9SRUdJT05TOyBpKyspIHsNCj4+ICsgICAgICAgIG9yaWdfdmFsID0gcGNpX2RlZmF1bHRfcmVh
ZF9jb25maWcocGRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUENJX0JBU0VfQUREUkVTU18wICsgKDQgKiBpKSwgNCk7DQo+IA0KPiBTYW1lIHF1ZXN0
aW9uIGFzIGluIGFuIGVhcmxpZXIgcGF0Y2g6IHNob3VsZCB3ZSBjYWxsIHBkZXYtPnJlYWRfY29u
ZmlnKCk/DQoNClN1cmUsIHdpbGwgZG8uDQoNCi0tDQpKYWcNCg0K

