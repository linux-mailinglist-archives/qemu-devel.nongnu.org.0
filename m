Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261A3EB71B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 16:53:47 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYZ8-0005qb-4Q
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 10:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mEYXW-00059i-HS
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:52:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mEYXT-00038I-Su
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 10:52:06 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DElBrt026182; Fri, 13 Aug 2021 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8bGTlhOIAgyFKgnU8KTFN/Ek3kow310oASZpb43Tx4s=;
 b=Hvj1ZakbUIxeZj6zhciWvY4AqHhc75WO5UO6E4eW3paVrc+PqLWrTzTJy4b+rxKE862y
 +Xer2m7b366A6pusyENzcMlHHv0hkb0RfYMmyr9rhBp4y8APGPZjjnX3No3mP8WcBIQi
 THjkC/p3xOxyGL5jdPo+oXS7U9uSkvkpHtRqFAtClXbq9ZxG552Nb0J1i8u7PkWuyrdf
 n9tEXfBMbONMohXe8LAf1TLIlFlO+WpG0HMLgUyIonIG7T43Yxdczm8ZS1TrlT8Z/FHe
 6YeYYUWAug1c+2L/OwWPOg5wBV1T5aARW2PznGpZldue3Ay64swhUcFuKEnc0I/mECzA KA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=8bGTlhOIAgyFKgnU8KTFN/Ek3kow310oASZpb43Tx4s=;
 b=CjzpVzpt/GBUtfhdvhYU8PIoHlpw/MMv3xDEkKsLrLf5mjr3xbUAem8cpcJb3Nn1nxRN
 ybIhwmqw5ojWO8Svq/Lhtg461tQTM5e7WdfVhC4OfAP1y9405ezXllNk6g8w0vJST1ME
 51vkE7e0G/3qhcyG/VY+uYsZ1nZecuf8gmQAYTqrMKOH3CZDFoA0060/nC1mAWJAzNg6
 IZEBsqdRxT6S0SFWMcUgvBqNMNaT/PFNzV4N9HiyIZKsDZwuMNEXxNeCmgA3AHPt8dpL
 lEHKVm8g+y6ecXtlgMirEJodZ2YUpt+xZm9K45MaF+1uTUzQTy65EQ2DfGwNZu0EBHCg jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3acw9p3kfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 14:51:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17DEkXKT155815;
 Fri, 13 Aug 2021 14:51:55 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by aserp3020.oracle.com with ESMTP id 3accre5rx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 14:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eErqmVbhVL6zExkJKSaDSdEu/aV0tvT+nu/vzw3yEx43Tz5TsyH62XJJ0mr4CoL3MT7qN/WPQDMSWST0j/Ev/n+/Bx2QaW3yZwMLjS5kLTQwZ/QnNVGzt5tJb9foqtD/pYu9+wx6rlgZpGkrEbwS3JA+l8m9KqGCUJxCLmvSlONWSXX08dfT0YJsbGXhHQfW+m0xgaE8ThwZIp6hRCr4ZaSdVQvc0nGaVzBS1MlAAn26zuR6k4mnoyiTwPPdqMtwPZKqvgBKNqRDWRz5hbSMVAU/rn/capLEnBfJBgi32xgF0zGOTJmTZCsvGPV554U9n3Dav/aXeSTSYBLEVrGHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bGTlhOIAgyFKgnU8KTFN/Ek3kow310oASZpb43Tx4s=;
 b=Jhv0XVCyWzL8zpchcI+++kyJ00FA/FSUewHKb1cbdqktQieX/lQ5dI1JGQdczdkrMeBMpHNW30uoRa/ERQ9H+ihwze3F+WE0JG4uPwPr+veGIUCBxs+v9D7wBfuNnGTIjjZxHF+O3nvmnIlmNsHCpDVhQnw82EjxXKY8bhuR+7iAi4NP2LZkIkE+SjY1K2oA5KUjqorgZALmUFOHXFX3vaTof91VNRDrGYM0vVvteYdEObW/OyYjOK0QYh9QoSJ3C3paJ0VZSjfUVUXwr3DFcdATYt4BDOUVW9PeJ1XUo4kRw27oYcRexMPk4GSA9H056uE5Sk77+yS4B7+d3kLo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bGTlhOIAgyFKgnU8KTFN/Ek3kow310oASZpb43Tx4s=;
 b=j7e/i3Zm0H3C84xuf/q4+DZ56AbbyPvIRZlK3HAfa01cMc+M6cbanwYFb9gYDYqtICuhs+TWLZzNCF2RxEWfyGiiVUMRdiqQsNWkQugGqvyQP/E9oCeRqW37yzp43h5+47lD7SMoc9R2ilosnscXkopWII7+NK1x329dZsXeOfc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4303.namprd10.prod.outlook.com (2603:10b6:208:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 14:51:53 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 14:51:53 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXfNdw2N4yWTsRC0+3F6zuyiCsmatL6kKAgCXBjoA=
Date: Fri, 13 Aug 2021 14:51:53 +0000
Message-ID: <81025189-1561-47E6-9E72-2E670ECC28F7@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
 <CH0PR02MB7898528462CB5A47FE31F0E48BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
In-Reply-To: <CH0PR02MB7898528462CB5A47FE31F0E48BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1caba23-be1d-45ad-00e9-08d95e69e3c5
x-ms-traffictypediagnostic: MN2PR10MB4303:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB4303DB96BF274C79B98533ED90FA9@MN2PR10MB4303.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t6SD1IYi66pQXfLKqRP3x056Yw79+oizb0f3zWnL6Ut5GWx8Dk5wmKiBQPiaSNn2aimTAFE+x9xCNNlCTm0IcreNZxIJ89eINcZrYh0wvpfEc1ILe/JL2zyAbsbMDIrRAq386ItPQ6Ze/s//DJgfdaS1KoUwzADwWkx6IrndxqdKNj+B8Htlt7BCyHAAqwUWGH2ngW5HR7qkr8sjWsnbxOgA4hvimM4p+tEvguShCX+HGzmHgBNuGzynJ+THo8vdZcnQ8l0c8hA8sfAEVPLf7epDXpEJAJj4DPMzKBzm0ED9McWaNQTDbhI1M478kaMid0Psr7t//6HbGAckobx9y34YX0ctid2ZwBw1hWUWXYD1zpNc8MnSqLIhc/nENbSoyMO+igxG+WRTXcnqNYVMFgcPdKvsvJBUHMTYCs4dx6E1lmKb77N95gF7JleDAnWieC5HYkewqXBMxowG7QkYwWaXGYb5NgFHss/mmcBJQSIvg3pGKJ7WBCeoGRXtqGbNyCFo027Jq7gmM/DNsxpsEfhkpp2jkZ9AOLFhHQI9egrvUZp80ZRHwSVAn+TGsQfR+Gp2IJF2Gl2RduJZ75OPDeP1noMaBWP9el1YhzXVLeB3hEk8CHcumtbtRowuYCcXfVw4obaBaQlWcCpZTrJJxcRAhcvV+t0qefx5STfOxb7n2SSaOhagXDXrg/40KlOMyFuSH8nOZG59QtnIRgsQ7zpHHPjHIdEFpqNY3KhxcouPFqRUsu4erDK7+tw9BbH7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(36756003)(66556008)(38100700002)(66446008)(64756008)(478600001)(86362001)(66476007)(66946007)(53546011)(8676002)(6512007)(83380400001)(6486002)(6506007)(71200400001)(186003)(8936002)(76116006)(5660300002)(33656002)(54906003)(91956017)(296002)(316002)(38070700005)(2906002)(2616005)(4326008)(44832011)(6916009)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y21acXRCVFVYdHdTSDl6b1ZVNjB2dVprazRwMmZ2MXRNc1E3N1pZOWVxK1BT?=
 =?utf-8?B?eWhNYlFONVRDTkM3MGpBSTdjVFdJK0dVZWYxUlRGMFVZQVJoS0VtSzZLSG5v?=
 =?utf-8?B?dVZ0S1NtYkwvMWlvL3NybkNhQjJVZmdxQm1HbVE5alJlaE9yU21wNVIrRWFv?=
 =?utf-8?B?dVB0ajdZa29kR1JDUDk5SExVRzZzQTNDcTBrV3RoTnZvM1p4Vll3MmI3bDQy?=
 =?utf-8?B?M21tU2dNUEN6cjhtNlNSUG1ZaWRqaHVaU1JTb0ltSWVFM01pQ0FFNE1WT2I2?=
 =?utf-8?B?NUVONUdpM2VBb0FFQnF6b21BVmZwRFRiSldqVTI3Uk14MDJTZmlsb3RIcXhT?=
 =?utf-8?B?U1pnclJEVm05bThaN1FyZkhSZDVnY1FBbEFxeFI1aGpoUDR4alN5bDErWGl3?=
 =?utf-8?B?REZzNHN0c3BaZlVzcEdESWpLWkhLVGlYcUQzZWxMQnl6SXBSSHo4aHFKMk5p?=
 =?utf-8?B?bVhta0hqcDArU0p1TlJRVTc5TmFEQTFNSWdBK2EySUhuOXN0bUE5czRva29q?=
 =?utf-8?B?WHZ0VGRlK3kyUmpDSkJJeHRFdlZQU0V1dmtEam4xaHkyNkdCYzFzQy9CSWY0?=
 =?utf-8?B?bFR5Nk9PSzhqMUxRbzhFUWIyMmxlQ09RYjlsVjBPTnJmV29yRzd2K3REQXBQ?=
 =?utf-8?B?NDRuRzYzcU1Ucm02N2NzdFhsRjUvY0ZEdk1JM3FVODhNbjRQeVUyQVJoL1Vy?=
 =?utf-8?B?d2hQRk5FYzNXaG81bWFzN3FJZ0RqdTJmdXdQYUdRNVV6YmRFVHhQYVdoMC84?=
 =?utf-8?B?eG1oaTNxbkdFelhlV2paeW4yOEh2eURVeVBCZk13WUxTdU9waGlSU3Fzbm1C?=
 =?utf-8?B?MlFRZVhzYXVaOFE4dW51a0xLc291RkdBQ08yanVZOUhTSm5VTCswKzRjK2d0?=
 =?utf-8?B?emtlbnBnd0YrRG5mak1CUFBQbUpGWEM4ZFZ1TTFrTWt5c0lZWFUyczl2dDhQ?=
 =?utf-8?B?SkFXdUdKcDk5WjlvZFV4WGVsNFNXSjJuQXFuVDQ3WWxpZWgza0l3Q0FFcFNW?=
 =?utf-8?B?S0xIUFRMc3c5SFBqWkFwejZMblNGaFBmR0tkOGdDcWVsUGsvMkVXaEFKZnZp?=
 =?utf-8?B?aFRJbW52Lys5QjR1NkVHc2Q2K0M0eHdlZjdqbndQVW0ydGpWWHo0c29CUmlL?=
 =?utf-8?B?R1V5R1N3MlgvMjJGNW5MalpxdWEwQ0JJMUViS3BiRFRhV3p5b1E4ck4zb2Vl?=
 =?utf-8?B?VVpqSzNmaGFsSVI4S0F1NUxzbkhXWTIzQlNLYW9leDY4R2d6UTV0TjVvZHJq?=
 =?utf-8?B?LzBUc0NTWmRsd2xESFdMelNYSGRtbW9LWHR5MFhmaDNrRlFpSGRZRmxDTXBJ?=
 =?utf-8?B?RmVUd3NadHZzKzh4UndRNi9TZ2lpenBBckNOSGFOcENKME96c3pBYU9BanQw?=
 =?utf-8?B?eVlDM0ZhL1FoSXNpS2pBeU4yb0lPU2JVRnZJd09FM0c4VU1YNVRLQmdtZ1lK?=
 =?utf-8?B?aXRwVHM5bXE4R3VYbUZYM0RyZEQxRUgzZDFSdVpFbWR5OFNlSUtsUFE2SDBB?=
 =?utf-8?B?NE8zVFcxYWhKRGZYTTZRSXprcVdLT0xXWXdJUnBQTXF6eW1qSjhmNjZtVHp3?=
 =?utf-8?B?a29wd1BWQVhLT25GdTFXMmMrdlh5d1paTWlmeHl1b3dzc1ZhbXpyQmpsbDV4?=
 =?utf-8?B?aHpTNDVabUR0Wkh3QTJzWDk0Z1JjU2ZXSHBIVjFlUnZNczdhb094bTYrY3hJ?=
 =?utf-8?B?OGNPYUV0ODY3OWJKcG0zbnlENTR1cnZNK09hRW5IdjIyb0gvSG9YdUdEYlNl?=
 =?utf-8?B?N0hTcExwWWZEZjlFVXltcE1Jb1pwbndSNXc2UzhZbFdpV0FOazVWWWRrZ29u?=
 =?utf-8?Q?uash6grWoHNAeGu5HzfOhY7veCv0N0KcVAbHY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FBE687AFCB7924F920A8D11050AB6C5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1caba23-be1d-45ad-00e9-08d95e69e3c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 14:51:53.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bo+EW3qvSn536w2gDE7BcbMTSxE2tSgvdPotV7rcaI3ScGXWw8oMOtz4qPVqmTbZlON0gg0G7LETG64tOWUWdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4303
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10075
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130088
X-Proofpoint-GUID: mdUmyUrzMOe_FgmsFQu_p9ljpJPmFZwW
X-Proofpoint-ORIG-GUID: mdUmyUrzMOe_FgmsFQu_p9ljpJPmFZwW
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDIwLCAyMDIxLCBhdCAxMDoxNyBBTSwgVGhhbm9zIE1ha2F0b3MgPHRoYW5v
cy5tYWthdG9zQG51dGFuaXguY29tPiB3cm90ZToNCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPj4gRnJvbTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29t
Pg0KPj4gU2VudDogMTkgSnVseSAyMDIxIDIxOjAwDQo+PiBUbzogcWVtdS1kZXZlbEBub25nbnUu
b3JnDQo+PiBDYzogc3RlZmFuaGFAcmVkaGF0LmNvbTsgYWxleC53aWxsaWFtc29uQHJlZGhhdC5j
b207DQo+PiBlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbTsgSm9obiBMZXZvbiA8am9obi5sZXZv
bkBudXRhbml4LmNvbT47DQo+PiBqb2huLmcuam9obnNvbkBvcmFjbGUuY29tOyBUaGFub3MgTWFr
YXRvcw0KPj4gPHRoYW5vcy5tYWthdG9zQG51dGFuaXguY29tPjsgU3dhcG5pbCBJbmdsZQ0KPj4g
PHN3YXBuaWwuaW5nbGVAbnV0YW5peC5jb20+OyBqYWcucmFtYW5Ab3JhY2xlLmNvbQ0KPj4gU3Vi
amVjdDogW1BBVENIIFJGQyBzZXJ2ZXIgMDUvMTFdIHZmaW8tdXNlcjogcnVuIHZmaW8tdXNlciBj
b250ZXh0DQo+PiANCj4+IFNldHVwIGEgc2VwYXJhdGUgdGhyZWFkIHRvIHJ1biB0aGUgdmZpby11
c2VyIGNvbnRleHQuIFRoZSB0aHJlYWQgYWN0cyBhcw0KPj4gdGhlIG1haW4gbG9vcCBmb3IgdGhl
IGRldmljZS4NCj4gDQo+IEluIHlvdXIgInZmaW8tdXNlcjogaW5zdGFudGlhdGUgdmZpby11c2Vy
IGNvbnRleHQiIHBhdGNoIHlvdSBjcmVhdGUgdGhlIHZmdSBjb250ZXh0IGluIGJsb2NraW5nLW1v
ZGUsIHNvIHRoZSBvbmx5IHdheSB0byBydW4gZGV2aWNlIGVtdWxhdGlvbiBpcyBpbiBhIHNlcGFy
YXRlIHRocmVhZC4NCj4gV2VyZSB5b3UgZ29pbmcgdG8gY3JlYXRlIGEgc2VwYXJhdGUgdGhyZWFk
IGFueXdheT8gWW91IGNhbiBydW4gZGV2aWNlIGVtdWxhdGlvbiBpbiBwb2xsaW5nIG1vZGUgdGhl
cmVmb3JlIHlvdSBjYW4gYXZvaWQgY3JlYXRpbmcgYSBzZXBhcmF0ZSB0aHJlYWQsIHRodXMgc2F2
aW5nIHJlc291cmNlcy4gRG8gcGxhbiB0byBkbyB0aGF0IGluIHRoZSBmdXR1cmU/DQoNClRoYW5r
cyBmb3IgdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBCbG9ja2luZyBhbmQgTm9uLUJsb2NraW5n
IG1vZGUuDQoNCknigJlkIGxpa2UgdG8gZXhwbGFpbiB3aHkgd2UgYXJlIHVzaW5nIGEgc2VwYXJh
dGUgdGhyZWFkIHByZXNlbnRseSBhbmQNCmNoZWNrIHdpdGggeW91IGlmIGl04oCZcyBwb3NzaWJs
ZSB0byBwb2xsIG9uIG11bHRpcGxlIHZmdSBjb250ZXh0cyBhdCB0aGUNCnNhbWUgdGltZSAoc2lt
aWxhciB0byBzZWxlY3QvcG9sbCBmb3IgZmRzKS4NCg0KQ29uY2VybmluZyBteSB1bmRlcnN0YW5k
aW5nIG9uIGhvdyBkZXZpY2VzIGFyZSBleGVjdXRlZCBpbiBRRU1VLA0KUUVNVSBpbml0aWFsaXpl
cyB0aGUgZGV2aWNlIGluc3RhbmNlIC0gd2hlcmUgdGhlIGRldmljZSByZWdpc3RlcnMNCmNhbGxi
YWNrcyBmb3IgQkFSIGFuZCBjb25maWcgc3BhY2UgYWNjZXNzZXMuIFRoZSBkZXZpY2UgaXMgdGhl
bg0Kc3Vic2VxdWVudGx5IGRyaXZlbiBieSB0aGVzZSBjYWxsYmFja3MgLSB3aGVuZXZlciB0aGUg
dmNwdSB0aHJlYWQgdHJpZXMNCnRvIGFjY2VzcyB0aGUgQkFSIGFkZHJlc3NlcyBvciBwbGFjZXMg
YSBjb25maWcgc3BhY2UgYWNjZXNzIHRvIHRoZSBQQ0kNCmJ1cywgdGhlIHZjcHUgZXhpdHMgdG8g
UUVNVSB3aGljaCBoYW5kbGVzIHRoZXNlIGFjY2Vzc2VzLiBBcyBzdWNoLCB0aGUNCmRldmljZSBp
cyBkcml2ZW4gYnkgdGhlIHZjcHUgdGhyZWFkLiBTaW5jZSB0aGVyZSBhcmUgbm8gdmNwdSB0aHJl
YWRzIGluIHRoZQ0KcmVtb3RlIHByb2Nlc3MsIHdlIGNyZWF0ZWQgYSBzZXBhcmF0ZSB0aHJlYWQg
YXMgYSByZXBsYWNlbWVudC4gQXMgeW91DQpjYW4gc2VlIGFscmVhZHksIHRoaXMgdGhyZWFkIGJs
b2NrcyBvbiB2ZnVfcnVuX2N0eCgpIHdoaWNoIEkgYmVsaWV2ZSBwb2xscw0Kb24gdGhlIHNvY2tl
dCBmb3IgbWVzc2FnZXMgZnJvbSBjbGllbnQuDQoNCklmIHRoZXJlIGlzIGEgd2F5IHRvIHJ1biBt
dWx0aXBsZSB2ZnUgY29udGV4dHMgYXQgdGhlIHNhbWUgdGltZSwgdGhhdCB3b3VsZA0KaGVscCB3
aXRoIGNvbnNlcnZpbmcgdGhyZWFkcyBvbiB0aGUgaG9zdCBDUFUuIEZvciBleGFtcGxlLCBpZiB0
aGVyZeKAmXMgYQ0Kd2F5IHRvIGFkZCB2ZnUgY29udGV4dHMgdG8gYSBsaXN0IG9mIGNvbnRleHRz
IHRoYXQgZXhwZWN0IG1lc3NhZ2VzIGZyb20NCmNsaWVudCwgdGhhdCBjb3VsZCBiZSBhIGdvb2Qg
aWRlYS4gQWx0ZXJuYXRpdmVseSwgdGhpcyBRRU1VIHNlcnZlciBjb3VsZA0KYWxzbyBpbXBsZW1l
bnQgYSBzaW1pbGFyIG1lY2hhbmlzbSB0byBncm91cCBhbGwgbm9uLWJsb2NraW5nIHZmdQ0KY29u
dGV4dHMgdG8ganVzdCBhIHNpbmdsZSB0aHJlYWQsIGluc3RlYWQgb2YgaGF2aW5nIHNlcGFyYXRl
IHRocmVhZHMgZm9yDQplYWNoIGNvbnRleHQuDQoNCi0tDQpKYWcNCg0KPiANCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFj
bGUuY29tPg0KPj4gLS0tDQo+PiBody9yZW1vdGUvdmZpby11c2VyLW9iai5jIHwgNDQNCj4+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAxIGZpbGUgY2hh
bmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvcmVtb3RlL3Zm
aW8tdXNlci1vYmouYyBiL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4+IGluZGV4IGUzNjI3
MDkuLjZhMmQwZjUgMTAwNjQ0DQo+PiAtLS0gYS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+
PiArKysgYi9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+PiBAQCAtMzUsNiArMzUsNyBAQA0K
Pj4gI2luY2x1ZGUgInRyYWNlLmgiDQo+PiAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRlLmgiDQo+
PiAjaW5jbHVkZSAicWVtdS9ub3RpZnkuaCINCj4+ICsjaW5jbHVkZSAicWVtdS90aHJlYWQuaCIN
Cj4+ICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+PiAjaW5jbHVkZSAic3lzZW11L3N5c2VtdS5o
Ig0KPj4gI2luY2x1ZGUgImh3L3FkZXYtY29yZS5oIg0KPj4gQEAgLTY2LDYgKzY3LDggQEAgc3Ry
dWN0IFZmdU9iamVjdCB7DQo+PiAgICAgdmZ1X2N0eF90ICp2ZnVfY3R4Ow0KPj4gDQo+PiAgICAg
UENJRGV2aWNlICpwY2lfZGV2Ow0KPj4gKw0KPj4gKyAgICBRZW11VGhyZWFkIHZmdV9jdHhfdGhy
ZWFkOw0KPj4gfTsNCj4+IA0KPj4gc3RhdGljIHZvaWQgdmZ1X29iamVjdF9zZXRfc29ja2V0KE9i
amVjdCAqb2JqLCBjb25zdCBjaGFyICpzdHIsIEVycm9yICoqZXJycCkNCj4+IEBAIC05MCw2ICs5
Myw0NCBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpZChPYmplY3QgKm9iaiwgY29u
c3QNCj4+IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gICAgIHRyYWNlX3ZmdV9wcm9wKCJk
ZXZpZCIsIHN0cik7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCAqdmZ1X29iamVjdF9jdHhf
cnVuKHZvaWQgKm9wYXF1ZSkNCj4+ICt7DQo+PiArICAgIFZmdU9iamVjdCAqbyA9IG9wYXF1ZTsN
Cj4+ICsgICAgaW50IHJldDsNCj4+ICsNCj4+ICsgICAgcmV0ID0gdmZ1X3JlYWxpemVfY3R4KG8t
PnZmdV9jdHgpOw0KPj4gKyAgICBpZiAocmV0IDwgMCkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0
ZygmZXJyb3JfYWJvcnQsICJ2ZnU6IEZhaWxlZCB0byByZWFsaXplIGRldmljZSAlcy0gJXMiLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICBvLT5kZXZpZCwgc3RyZXJyb3IoZXJybm8pKTsNCj4+ICsg
ICAgICAgIHJldHVybiBOVUxMOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldCA9IHZmdV9h
dHRhY2hfY3R4KG8tPnZmdV9jdHgpOw0KPj4gKyAgICBpZiAocmV0IDwgMCkgew0KPj4gKyAgICAg
ICAgZXJyb3Jfc2V0ZygmZXJyb3JfYWJvcnQsDQo+PiArICAgICAgICAgICAgICAgICAgICJ2ZnU6
IEZhaWxlZCB0byBhdHRhY2ggZGV2aWNlICVzIHRvIGNvbnRleHQgLSAlcyIsDQo+PiArICAgICAg
ICAgICAgICAgICAgIG8tPmRldmlkLCBzdHJlcnJvcihlcnJubykpOw0KPj4gKyAgICAgICAgcmV0
dXJuIE5VTEw7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgZG8gew0KPj4gKyAgICAgICAgcmV0
ID0gdmZ1X3J1bl9jdHgoby0+dmZ1X2N0eCk7DQo+PiArICAgICAgICBpZiAocmV0IDwgMCkgew0K
Pj4gKyAgICAgICAgICAgIGlmIChlcnJubyA9PSBFSU5UUikgew0KPj4gKyAgICAgICAgICAgICAg
ICByZXQgPSAwOw0KPj4gKyAgICAgICAgICAgIH0gZWxzZSBpZiAoZXJybm8gPT0gRU5PVENPTk4p
IHsNCj4+ICsgICAgICAgICAgICAgICAgb2JqZWN0X3VucGFyZW50KE9CSkVDVChvKSk7DQo+PiAr
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAgIH0gZWxzZSB7DQo+PiArICAg
ICAgICAgICAgICAgIGVycm9yX3NldGcoJmVycm9yX2Fib3J0LCAidmZ1OiBGYWlsZWQgdG8gcnVu
IGRldmljZSAlcyAtICVzIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBvLT5kZXZp
ZCwgc3RyZXJyb3IoZXJybm8pKTsNCj4+ICsgICAgICAgICAgICB9DQo+PiArICAgICAgICB9DQo+
PiArICAgIH0gd2hpbGUgKHJldCA9PSAwKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIE5VTEw7DQo+
PiArfQ0KPj4gKw0KPj4gc3RhdGljIHZvaWQgdmZ1X29iamVjdF9tYWNoaW5lX2RvbmUoTm90aWZp
ZXIgKm5vdGlmaWVyLCB2b2lkICpkYXRhKQ0KPj4gew0KPj4gICAgIFZmdU9iamVjdCAqbyA9IGNv
bnRhaW5lcl9vZihub3RpZmllciwgVmZ1T2JqZWN0LCBtYWNoaW5lX2RvbmUpOw0KPj4gQEAgLTEy
NSw2ICsxNjYsOSBAQCBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X21hY2hpbmVfZG9uZShOb3RpZmll
cg0KPj4gKm5vdGlmaWVyLCB2b2lkICpkYXRhKQ0KPj4gICAgICAgICAgICAgICAgICAgIHBjaV9n
ZXRfd29yZChvLT5wY2lfZGV2LT5jb25maWcgKyBQQ0lfREVWSUNFX0lEKSwNCj4+ICAgICAgICAg
ICAgICAgICAgICBwY2lfZ2V0X3dvcmQoby0+cGNpX2Rldi0+Y29uZmlnICsNCj4+IFBDSV9TVUJT
WVNURU1fVkVORE9SX0lEKSwNCj4+ICAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3dvcmQoby0+
cGNpX2Rldi0+Y29uZmlnICsgUENJX1NVQlNZU1RFTV9JRCkpOw0KPj4gKw0KPj4gKyAgICBxZW11
X3RocmVhZF9jcmVhdGUoJm8tPnZmdV9jdHhfdGhyZWFkLCAiVkZVIGN0eCBydW5uZXIiLA0KPj4g
dmZ1X29iamVjdF9jdHhfcnVuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbywgUUVNVV9U
SFJFQURfSk9JTkFCTEUpOw0KPj4gfQ0KPj4gDQo+PiBzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2lu
aXQoT2JqZWN0ICpvYmopDQo+PiAtLQ0KPj4gMS44LjMuMQ0KPiANCg0K

