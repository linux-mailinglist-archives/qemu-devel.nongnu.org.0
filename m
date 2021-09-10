Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF24406D4E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:07:30 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhBh-0000GP-9M
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOh9P-0007ze-BQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:05:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mOh9K-0005b9-F9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:05:07 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ADwYoL002721; 
 Fri, 10 Sep 2021 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MIbfcCp70dsWaVUYEOumiv9HkDWzXkZr3JD00QhLXvc=;
 b=UT4HaNngGhF7LDGUAMAdoJVDO/mb3wRDH1yjjpGpSWhy8b8L2s1vdRHpe9vfP2VNrfZR
 SJ2bkfhzCkkku9UX/WZviMTfCfIQe8jei4g6ztSd5XMez7NNN21FGpnwq3waSbiPEa9O
 g57roWeRLvcKiQ4hBYH3YPK7+zuYDwA9b2xlM+arRiQov8vkn0IkoUVcyMI1Dv7Th099
 +aJOM6xAD2ixRabq8sY94TJDPyrxzsHqRa5o35vhkQSNK4sSsud2jSVJzyzK+hMxPwMA
 x0BAPVsTDtlNVjmUqb2rXVXnMp1l8ZXCyQJyF6ajdFvZ+i4F33niNofRHDEfFKJhieZv 4w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MIbfcCp70dsWaVUYEOumiv9HkDWzXkZr3JD00QhLXvc=;
 b=HRcZpi89+TnGtFLCWXZbmB3NRG82TZsGivWtYiecbWwYW/kKeeTDH16yOz0qRpmIkHvq
 g+i9BNal8DMUhW4qY6A2N6Uegzg2KtefhGEDpO2fR5B8Se3L0cBrysF5FjLj3/Yv0wd8
 6eOrRlTC2y36NV8Plmxeq9WuvfB5x04dOz9Dq7kN9TZM2bDQIGzqY4H7nr7q50GqHOAT
 yFJpClGCyVphCDDT2xaFf5nyMgYPJdfdqL5nip91ldrW6HLiCopqao5SSN4aoc2bPGPQ
 NrC6zWBSU4B/AcJgEPQfWiU4hop2saYfRuvQqhXz2g2uLta136Ur/bMHy903ziGKylOp RA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aytx4t025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:04:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18ADkvdo097159;
 Fri, 10 Sep 2021 14:04:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 3aytftxwx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 14:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFbcfkaqQEZtMH+S8RZSlJidvqdkHqEZesIPrLUkWsC+ELW5wErYIpFTtC0oqFqTZtG3md+bF58fcQx6kRPXvBrK3o4+3vxBvTukFjnoK4akM2ET1plgo5wNu8uNskly8YMxbDDFCB6alTVL5MpvP0FAH4+INDGbpxVMzxopfr20pk5ky3NWAzPUCJmAQSt4kNg5la5fX6cQlmXBWpf0U+Aaog4x0aA/ZHm1s08FOpqNgzOApGsFXwRBS0EjNk9YyEn23eSgVbeElX5byN0AhkL2uieohNhPsZckREOLE48Sly67wz6yRm1yBUJ2KHl6rcjwPaeYeIjsxEbIZlnvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MIbfcCp70dsWaVUYEOumiv9HkDWzXkZr3JD00QhLXvc=;
 b=FAlbq3dGHYlpQX8I9XyPAvd/LN5nhJdc2eG2CXqtK/PLzQOawo7tZ2Dib2VKyjzA3FRtOWYHZROrZdc2AO01U9SmtQ7ufL8tZbQoZMSy81mPg0l4cpTlUTw1n/IY6LoB1rKKRRH4mk9iqtVlqJnBZUJlRCl3KOY3tGXpuOJdWLRPq1L6OByiDJ/CiF2xQx5RZ2Oe4+B+PflYzNshgm7woVeB9XcwVXFnFYkzjcNYIFS5JCfjDLNP/7xVifHrSFfTxOM0s0bBpjP2UO87pDAhpC7qQMPjxick/9nU2QB5xbnCOoVyt4Q7iZnsRUKFy8bGp0poXySQrGCvvY0FD4g3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIbfcCp70dsWaVUYEOumiv9HkDWzXkZr3JD00QhLXvc=;
 b=KXX29lpKERX+c1CS8xJuiQ+vVpKcEttVFFPZdoOkZFrk6o6iDCHo0vjT4ThXJgTES5BKERnhadMwZJhCthiyvz3Z6++977Hy+XqHZtiYVWiPRM8H+rZLBbrfLK9Vx8JdlMkrSwT4mKnB2ql4clUkoF7R2hLSYhSs+nnYZl56gc0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5250.namprd10.prod.outlook.com (2603:10b6:208:333::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 14:04:53 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:04:53 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 02/11] vfio-user: define vfio-user object
Thread-Topic: [PATCH RFC server v2 02/11] vfio-user: define vfio-user object
Thread-Index: AQHXm2a7O3mhTS8Okkmqj/hLgHHeS6uaJcYAgAM9E4A=
Date: Fri, 10 Sep 2021 14:04:53 +0000
Message-ID: <E6C1C362-D681-4DC9-B107-43CBB0D235DA@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <ff8864013462e53eb0bed0aa609b55b21c0b18e0.1630084211.git.jag.raman@oracle.com>
 <YTiuih20Ka5yPPF/@stefanha-x1.localdomain>
In-Reply-To: <YTiuih20Ka5yPPF/@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2b7c28a-ff64-4c9d-a35d-08d97463f6b0
x-ms-traffictypediagnostic: BLAPR10MB5250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR10MB52502774035D9420B71FF2AD90D69@BLAPR10MB5250.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +GYxwgtXS2ppTFXk4bTXbOvk2HMpFv/NUUh/ZDHGEptwCjcfuPpey4W5a2LVp+B1SFJqw9JCLS0waM36PvON9sfGbrpHSCuM1oaWuIsS3+uNhex/s1qeM5V9lot92s/m2J/B2rpq6JbQzbhi6oIkhY3RLnjJa5D2Fnh17uFRq988GjlbMjI6in8kslOnt4pqRyvdIqcOmRCu9i1++T0j7mGr7cer5dJZ2iPT6akM0aofxLsF4sumyLaq8V3NJVQTA5c5RIK0werPL0Q1vPdiIoNHaySewJJckl/XXFVSHiU/V8BgSeGpP5tkb8YsFj59NEL0zNYsrD/SL99g3trENzg/3vWW6yfUvR9z66CBCCmpp7etFDw92FP9gqYITmcPtTIqgzaQgFKgopnVGOUUPRwaBtKG+7m7zI4wCdFGMBDeBr5X7bowNcMKc2M6HA2rhmvOKSCLOSo/K8bmu2CeAwNms6p5lcQFrtxVxaGysPsBceCA8w1EsHB282eqYrZyX5N+lUu4y8U+auRLw5BGbjTYbk9Pgh5W8mNz7kGZiOHp7ht0KcCJDcbgGyk3/CVfv3zyRXGsZplAQMXR3MlxGDmKEaBuFoH0s+N0AmiocfI1Kyf3cJEZ14Vjtf61YekzPYaOeVTwVaxWl8xERcnHtEwVv03i0OtAMPZaODHBoZqDY1cQVJHmmFL8ObvwiqbbXwVbn0vQleXNVueSN+G83uYVx/a4syDWwksOPZPoOk9KVME1Avjbo15kIqO9TA3v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(376002)(39860400002)(36756003)(33656002)(66946007)(38070700005)(2616005)(66476007)(44832011)(6512007)(6916009)(186003)(6506007)(53546011)(83380400001)(478600001)(8676002)(64756008)(66446008)(4326008)(6486002)(66556008)(38100700002)(76116006)(122000001)(8936002)(316002)(54906003)(2906002)(7416002)(71200400001)(86362001)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmNwWWREWExCdkhzM2lKNldRc2IzTFV4VW5zT1UxYW9xUDIvOVJ2SkZCWjRq?=
 =?utf-8?B?ZDNjTVBMNVduM3pVQ1lrU0tOQlFTMFdwY3Q1VFBrOXV2aE5PQkFFU0dDT0lJ?=
 =?utf-8?B?elpqWHlkcjlpYnFUenJudER3WElVemc4eDJvZ1FjaDRrVWx4WjBxOXBWMzBy?=
 =?utf-8?B?UFVyTDJVWi83V0xZVlI1Qlg1cHlvcU42TzNQdXFzOHYrMmYzcUd6OVkvQW5H?=
 =?utf-8?B?dUFhb0l0eXIzZ0dZWTNCSmRRd3V5Vy9OcjVJeExHZU1Gd2NuR290aUc1U3dB?=
 =?utf-8?B?ajNBRDZWQWhma0RuU0dDRkcybzVxTVlUU1JwYUxiU3M1emNNak5pNkdxdGF3?=
 =?utf-8?B?N1lOU3I5V21KRE42UTladzVXOE5hZlpTSW51M0lzekdJemk4Z2RrU3p5dFVy?=
 =?utf-8?B?N1hORW9TdkJJcWxvZ2pSL3lpWlhyZ2hSNTVYVlRZZXZtbmUwM0YxQXFESWI5?=
 =?utf-8?B?cndMbWZRRWF6SCtZdFA4VUV2NG5yWnlDVy82WkpIYUt0cjVOR0F5U29abVJr?=
 =?utf-8?B?SDZWWjhqYnN6ZEU3R0g2VVZibnR3cXZrN0d5Y1RlSFFZMy95WURCYXhaSnUz?=
 =?utf-8?B?NHlTLzNpOWx3dlp0Y1NuK1Z1bk53M2xvZ3FRYjFxdHVjTkhGUlVFU3dxZmRH?=
 =?utf-8?B?UEVGZTNHN2lXUGk5dlkvYUFISk51QndhUTd0cjQ0L3RGQjJGaThpTmVLbWtV?=
 =?utf-8?B?ZHgvb3MxNnVISFppQ1V3VVlGdWlDT3V0MTV0VURuRVI0T0ljMW1RL25qZ2FE?=
 =?utf-8?B?b3Y5TWFRRmFNeGNKTDlHVm4vOFErb2owZHh5L2dxRDRiODIwL3VENTFnVVNN?=
 =?utf-8?B?TFYwMFRhRVQ0dnp2NTM5bmJocEFxeXUwQ3g2Ris2UzBweERSR0JCVWdPVjZq?=
 =?utf-8?B?YXVHK0VTZUhsUGxXNGpEbnhjWlZ6L24xSXY3TkJGSHdnTkRsVDlWbDRxLzA4?=
 =?utf-8?B?dlZmWHQwek5kbEdKeGkrTkxpbE5WRFhibi9uR2lNSjN2V1NGV0dVNkhMZExq?=
 =?utf-8?B?RWpkL1VpN0xZenFuVURUVFRVQVR4c2RoOTRoTjJycXF0YUFzR3JnUzZtdzJv?=
 =?utf-8?B?bDhhOHg0a3VmaTBXdnJHN2hZTSs2Ym93ZGdWN3JSQnJCNzVya0VZdXovTjVq?=
 =?utf-8?B?enVvT0xncnJtWlUydWt4S3hlZnFoZzJYWlE2OFJwUnpzUklsMnREK2dmS0Vn?=
 =?utf-8?B?RVVpWE8zOWR0WmdCT3l6WmxzNk5RMnNNVjZyaTMzOUJDNFR4ZkxuK25QeE5W?=
 =?utf-8?B?eDlBRzlvZzNRazBRSEY0UHFDc1pzeXE5WjFnV0s0Z01FWEFjc3FCQkc3bEt6?=
 =?utf-8?B?aWViOFFMSWIrNm0xSTVJMlZMaVZJbVI1cmNXekZHMUlwY2tCdkJpYWVHeHRQ?=
 =?utf-8?B?TGcvbVhadU94M0lQQStnMlpTYTJxU2g5TnZDM3pmZGtmUWVtOWtSTmlla2p0?=
 =?utf-8?B?NXR3OVVXSFZmM1UzcGtCYWVvVGhsUkw1TTJHcEJ4cDNkR3NVQ3NBMEcwTDU0?=
 =?utf-8?B?K3FoN00xRUJwSlQ3VVRkYWV5ME9iMXFtd2NGT2lpU0tXTWV6Z3dEZjFxbkR0?=
 =?utf-8?B?NmQ0TUNBNUFxeFNSM2szeTlBL0NSNm82VVN1OGlIR0NxcHBSMTZCRVp3VVFn?=
 =?utf-8?B?V05lVmd0SWF4dDI5eUc3dnlObEFrZTN4R1kxQnk0T25qeTZ3bzQ0TXdGRkgx?=
 =?utf-8?B?TzVIVFA2SGU2NHVsdy8xVkk2b2dIMHBZeFpTT3pwYS9XRXhMWWtXVkxmU3dl?=
 =?utf-8?B?OW9xOU54d3RCYzZ0MStZMUh4R1ZiU2NJaUxuR2FMVUtXM05zV3MyWmpidmds?=
 =?utf-8?Q?vlF0YLBacgkqjZdcudc+WzknKZAXJAH4R/JLc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA9DD184A080E4F90C49F6DC90ED770@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b7c28a-ff64-4c9d-a35d-08d97463f6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 14:04:53.7592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cL6MBWHZQUyMqBlxaSBqEhxUeikuFQ6f6Dp7ZPLQcZ+1+sP491iBdSWpMnxA1Fk0abHlvr3aD88GsM7A8KWAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5250
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10102
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100080
X-Proofpoint-ORIG-GUID: B57bQcEQkpBMN3ePw4fZ8t0RvR8SRAJG
X-Proofpoint-GUID: B57bQcEQkpBMN3ePw4fZ8t0RvR8SRAJG
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

DQoNCj4gT24gU2VwIDgsIDIwMjEsIGF0IDg6MzcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCAwMTo1
MzoyMVBNIC0wNDAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+IERlZmluZSB2ZmlvLXVz
ZXIgb2JqZWN0IHdoaWNoIGlzIHJlbW90ZSBwcm9jZXNzIHNlcnZlciBmb3IgUUVNVS4gU2V0dXAN
Cj4+IG9iamVjdCBpbml0aWFsaXphdGlvbiBmdW5jdGlvbnMgYW5kIHByb3BlcnRpZXMgbmVjZXNz
YXJ5IHRvIGluc3RhbnRpYXRlDQo+PiB0aGUgb2JqZWN0DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6
IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNp
Z25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+
IC0tLQ0KPj4gcWFwaS9xb20uanNvbiAgICAgICAgICAgICB8ICAyMCArKysrKystDQo+PiBody9y
ZW1vdGUvdmZpby11c2VyLW9iai5jIHwgMTQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgfCAgIDEgKw0K
Pj4gaHcvcmVtb3RlL21lc29uLmJ1aWxkICAgICB8ICAgMSArDQo+PiBody9yZW1vdGUvdHJhY2Ut
ZXZlbnRzICAgIHwgICAzICsNCj4+IDUgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvcmVtb3RlL3ZmaW8tdXNl
ci1vYmouYw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvcWFwaS9xb20uanNvbiBiL3FhcGkvcW9tLmpz
b24NCj4+IGluZGV4IGEyNTYxNmIuLjNlOTQxZWUgMTAwNjQ0DQo+PiAtLS0gYS9xYXBpL3FvbS5q
c29uDQo+PiArKysgYi9xYXBpL3FvbS5qc29uDQo+PiBAQCAtNjg5LDYgKzY4OSwyMCBAQA0KPj4g
ICAnZGF0YSc6IHsgJ2ZkJzogJ3N0cicsICdkZXZpZCc6ICdzdHInIH0gfQ0KPj4gDQo+PiAjIw0K
Pj4gKyMgQFZmaW9Vc2VyUHJvcGVydGllczoNCj4+ICsjDQo+PiArIyBQcm9wZXJ0aWVzIGZvciB2
ZmlvLXVzZXIgb2JqZWN0cy4NCj4+ICsjDQo+PiArIyBAc29ja2V0OiBwYXRoIHRvIGJlIHVzZWQg
YXMgc29ja2V0IGJ5IHRoZSBsaWJ2ZmlvdXNlciBsaWJyYXJ5DQo+PiArIw0KPj4gKyMgQGRldmlk
OiB0aGUgaWQgb2YgdGhlIGRldmljZSB0byBiZSBhc3NvY2lhdGVkIHdpdGggdGhlIGZpbGUgZGVz
Y3JpcHRvcg0KPj4gKyMNCj4+ICsjIFNpbmNlOiA2LjANCj4+ICsjIw0KPj4gK3sgJ3N0cnVjdCc6
ICdWZmlvVXNlclByb3BlcnRpZXMnLA0KPj4gKyAgJ2RhdGEnOiB7ICdzb2NrZXQnOiAnc3RyJywg
J2RldmlkJzogJ3N0cicgfSB9DQo+IA0KPiBQbGVhc2UgdXNlICdTb2NrZXRBZGRyZXNzJyBmb3Ig
c29ja2V0IGluc3RlYWQgb2YgJ3N0cicuIFRoYXQgd2F5IGZpbGUNCj4gZGVzY3JpcHRvciBwYXNz
aW5nIGlzIGVhc3kgdG8gc3VwcG9ydCBhbmQgYWRkaXRpb25hbCBzb2NrZXQgYWRkcmVzcw0KPiBm
YW1pbGllcyBjYW4gYmUgc3VwcG9ydGVkIGluIHRoZSBmdXR1cmUuDQoNCk9LLCB3aWxsIGRvLg0K
DQo+IA0KPj4gKw0KPj4gKyMjDQo+PiAjIEBSbmdQcm9wZXJ0aWVzOg0KPj4gIw0KPj4gIyBQcm9w
ZXJ0aWVzIGZvciBvYmplY3RzIG9mIGNsYXNzZXMgZGVyaXZlZCBmcm9tIHJuZy4NCj4+IEBAIC04
MTIsNyArODI2LDggQEANCj4+ICAgICAndGxzLWNyZWRzLXBzaycsDQo+PiAgICAgJ3Rscy1jcmVk
cy14NTA5JywNCj4+ICAgICAndGxzLWNpcGhlci1zdWl0ZXMnLA0KPj4gLSAgICAneC1yZW1vdGUt
b2JqZWN0Jw0KPj4gKyAgICAneC1yZW1vdGUtb2JqZWN0JywNCj4+ICsgICAgJ3ZmaW8tdXNlcicN
Cj4+ICAgXSB9DQo+PiANCj4+ICMjDQo+PiBAQCAtODY4LDcgKzg4Myw4IEBADQo+PiAgICAgICAn
dGxzLWNyZWRzLXBzayc6ICAgICAgICAgICAgICAnVGxzQ3JlZHNQc2tQcm9wZXJ0aWVzJywNCj4+
ICAgICAgICd0bHMtY3JlZHMteDUwOSc6ICAgICAgICAgICAgICdUbHNDcmVkc1g1MDlQcm9wZXJ0
aWVzJywNCj4+ICAgICAgICd0bHMtY2lwaGVyLXN1aXRlcyc6ICAgICAgICAgICdUbHNDcmVkc1By
b3BlcnRpZXMnLA0KPj4gLSAgICAgICd4LXJlbW90ZS1vYmplY3QnOiAgICAgICAgICAgICdSZW1v
dGVPYmplY3RQcm9wZXJ0aWVzJw0KPj4gKyAgICAgICd4LXJlbW90ZS1vYmplY3QnOiAgICAgICAg
ICAgICdSZW1vdGVPYmplY3RQcm9wZXJ0aWVzJywNCj4+ICsgICAgICAndmZpby11c2VyJzogICAg
ICAgICAgICAgICAgICAnVmZpb1VzZXJQcm9wZXJ0aWVzJw0KPiANCj4gInZmaW8tdXNlciIgZG9l
c24ndCBjb21tdW5pY2F0ZSB3aGV0aGVyIHRoaXMgaXMgYSBjbGllbnQgb3Igc2VydmVyLiBJcw0K
PiAidmZpby11c2VyLXNlcnZlciIgY2xlYXJlcj8NCg0K4oCcdmZpby11c2VyLXNlcnZlcuKAnSBz
b3VuZHMgYmV0dGVyLg0KDQo+IA0KPj4gICB9IH0NCj4+IA0KPj4gIyMNCj4+IGRpZmYgLS1naXQg
YS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAuLjRhMWUyOTcNCj4+IC0t
LSAvZGV2L251bGwNCj4+ICsrKyBiL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmMNCj4+IEBAIC0w
LDAgKzEsMTQ1IEBADQo+PiArLyoqDQo+PiArICogUUVNVSB2ZmlvLXVzZXIgc2VydmVyIG9iamVj
dA0KPj4gKyAqDQo+PiArICogQ29weXJpZ2h0IMKpIDIwMjEgT3JhY2xlIGFuZC9vciBpdHMgYWZm
aWxpYXRlcy4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHUEwtdjIsIHZlcnNpb24gMiBvciBsYXRlci4NCj4+ICsgKg0KPj4g
KyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lg0KPj4g
KyAqDQo+PiArICovDQo+PiArDQo+PiArLyoqDQo+PiArICogVXNhZ2U6IGFkZCBvcHRpb25zOg0K
Pj4gKyAqICAgICAtbWFjaGluZSB4LXJlbW90ZQ0KPj4gKyAqICAgICAtZGV2aWNlIDxQQ0ktZGV2
aWNlPixpZD08cGNpLWRldi1pZD4NCj4+ICsgKiAgICAgLW9iamVjdCB2ZmlvLXVzZXIsaWQ9PGlk
Pixzb2NrZXQ9PHNvY2tldC1wYXRoPixkZXZpZD08cGNpLWRldi1pZD4NCj4gDQo+IEkgc3VnZ2Vz
dCByZW5hbWluZyBkZXZpZD0gdG8gZGV2aWNlPSBvciBwY2ktZGV2aWNlPSAoc2ltaWxhciB0byBk
cml2ZT0NCj4gYW5kIG5ldGRldj0pIGZvciBjb25zaXN0ZW5jeSBhbmQgdG8gYXZvaWQgY29uZnVz
aW9uIHdpdGggUENJIERldmljZSBJRHMuDQoNCk9LLCB3aWxsIGRvLg0KDQo+IA0KPj4gZGlmZiAt
LWdpdCBhL2h3L3JlbW90ZS9tZXNvbi5idWlsZCBiL2h3L3JlbW90ZS9tZXNvbi5idWlsZA0KPj4g
aW5kZXggZmIzNWZiOC4uY2Q0NGRmYyAxMDA2NDQNCj4+IC0tLSBhL2h3L3JlbW90ZS9tZXNvbi5i
dWlsZA0KPj4gKysrIGIvaHcvcmVtb3RlL21lc29uLmJ1aWxkDQo+PiBAQCAtNiw2ICs2LDcgQEAg
cmVtb3RlX3NzLmFkZCh3aGVuOiAnQ09ORklHX01VTFRJUFJPQ0VTUycsIGlmX3RydWU6IGZpbGVz
KCdtZXNzYWdlLmMnKSkNCj4+IHJlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NF
U1MnLCBpZl90cnVlOiBmaWxlcygncmVtb3RlLW9iai5jJykpDQo+PiByZW1vdGVfc3MuYWRkKHdo
ZW46ICdDT05GSUdfTVVMVElQUk9DRVNTJywgaWZfdHJ1ZTogZmlsZXMoJ3Byb3h5LmMnKSkNCj4+
IHJlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NFU1MnLCBpZl90cnVlOiBmaWxl
cygnaW9odWIuYycpKQ0KPj4gK3JlbW90ZV9zcy5hZGQod2hlbjogJ0NPTkZJR19NVUxUSVBST0NF
U1MnLCBpZl90cnVlOiBmaWxlcygndmZpby11c2VyLW9iai5jJykpDQo+IA0KPiBJZiB5b3UgdXNl
IENPTkZJR19WRklPX1VTRVJfU0VSVkVSIHRoZW4gaXQncyBlYXNpZXIgdG8gc2VwYXJhdGUgbXBx
ZW11DQo+IGZyb20gdmZpby11c2VyLiBTaGFyaW5nIENPTkZJR19NVUxUSVBST0NFU1MgY291bGQg
YmVjb21lIG1lc3N5IGxhdGVyLg0KDQpPSywgZ290IGl0Lg0KDQotLQ0KSmFnDQoNCg==

