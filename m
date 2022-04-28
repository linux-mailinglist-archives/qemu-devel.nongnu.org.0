Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E7513B53
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 20:18:15 +0200 (CEST)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk8iU-0004FY-5z
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 14:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ulrich.Weigand@de.ibm.com>)
 id 1nk8g3-0002Xo-45; Thu, 28 Apr 2022 14:15:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ulrich.Weigand@de.ibm.com>)
 id 1nk8g1-0004Jm-3L; Thu, 28 Apr 2022 14:15:42 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SHe5mI022262;
 Thu, 28 Apr 2022 18:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pp1;
 bh=AeKw5HsfI3EBWeKQZUyGVu/BY9a6LeWfKcVJdXA3sXM=;
 b=PDtIhwXU24F9AO3jP31LQ2c/+Id9fNv+Iu+ZXDhPWi73lM5fjDnbJJeoMSbjIP3mGSiw
 JDG0znjp76024gaQ2fT0izdNdfQTe2YFHtDx28lfOH6WgQLWU8BZFIbmhrAPVCqze8yr
 OUzc9hjisr/avwEEPJ4ennQVeYXgpSfwR3RWCeDNFpWsvACi4ft100xiU5CSqLKDuTeB
 y/8yBKK73Ly70qonfaTVfWAxoAxAwoe+4abJU8DCdW6zZrhaoh2HQCvzogYDlf8Kg+ds
 tJMc9oSdcC5YH3S6+Yl8HmXQgSe2QW6Jw0LDBkxLHIvEEvkwE3Jarqf3k0GkZyDwTFH9 TA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtdmsjrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 18:15:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+s7u2HjA/N083A9IoO6IFGDD5/7mlxV0HmAfTLmOKb3PAiaUb0laV7xVkLH9Uq0AM5aXnZzziOGKi3g+1suZcy0sEQeqwLArGFa4rO+iu1VNOLgnEp5ijBBBx+i/rZ8dlWDhvoSY+HTXQOLQ+muc1dmyWlH/WQBnGOrCqPoXyam5wXp/zyq4NEnMR7CV6kIBVgqYckwqabuh3dCSIm++TUQbuCIqltp7dLpHNhiXQYnQuMDSA0nZh4ZzlrVCSBJBPl5nuF7sB713eMOZhCMHXoQeQzUVvFhEy6AOv4Dlr178eaK547Z5ufJePuEaivW95XY9jxa79Woev1p212vvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeKw5HsfI3EBWeKQZUyGVu/BY9a6LeWfKcVJdXA3sXM=;
 b=VzYGkpw6txD9jUyNsZO+A5seL7kwneXGWgK3pv6+z1yp7Oz78KIenQ9CxKt0jKsktL3G8F3tjLdY1+x5HBp8KCJhgmAcxRGE3AQkvfmB7tDeMvuQ6znBBRIcS+RR6lAM2+lO3NKaigoydFYmPqpVgPKzmQaYP96EW/VBtdCiZRQXCnkKf6s5vYSlQ2So3J+tnb1wAASQeghAr4oAj+6RRNlXRo/Wu81r8ZCaING3BBNt3NdVauQOjuEDFBqPHxKJe2N64o0pqAq3oTHrcJdLWxV5WMBYwdXIIEiRZ3APz+EG+LVxBC2k9GCcNk8WcVXycjctqlCo4mdF19KjCl/2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.ibm.com; dmarc=pass action=none header.from=de.ibm.com;
 dkim=pass header.d=de.ibm.com; arc=none
Received: from MN2PR15MB3149.namprd15.prod.outlook.com (2603:10b6:208:ea::29)
 by SJ0PR15MB4218.namprd15.prod.outlook.com (2603:10b6:a03:2e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 18:15:26 +0000
Received: from MN2PR15MB3149.namprd15.prod.outlook.com
 ([fe80::5496:59e6:bfcc:10ea]) by MN2PR15MB3149.namprd15.prod.outlook.com
 ([fe80::5496:59e6:bfcc:10ea%5]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 18:15:26 +0000
From: Ulrich Weigand <Ulrich.Weigand@de.ibm.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: s390x regression - Re: [PATCH v5 21/26] linux-user/s390x: Implement
 setup_sigtramp
Thread-Topic: s390x regression - Re: [PATCH v5 21/26] linux-user/s390x:
 Implement setup_sigtramp
Thread-Index: AQHYWyvviRDF4SzvPU2A7jUl96qZqQ==
Date: Thu, 28 Apr 2022 18:15:26 +0000
Message-ID: <cc4c1322a26533ca694985a5cf70d0e0aa9cea26.camel@de.ibm.com>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
 <20210929130553.121567-22-richard.henderson@linaro.org>
In-Reply-To: <20210929130553.121567-22-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27c07533-0159-478e-d26c-08da294311b0
x-ms-traffictypediagnostic: SJ0PR15MB4218:EE_
x-microsoft-antispam-prvs: <SJ0PR15MB4218673BD71659A293064FE7ACFD9@SJ0PR15MB4218.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4xAuNmzz+3jgqfT7Io0Mb6bc1PMllzEjo4rEngSYpURenNZ6mEzTsFl78bzCReqGXV7Na5U3Erj8sP3UDZjSENxHw1Hk6yBWS7JqodK4jvhudoCXzcYpt3fPBwEPYJwdzTgMao6SYOqCGHAtG8+mP86DUcsYWbnHoc360yXN1OFGdl46D446pAKL5PvYapRfr+ze5W84Mb1N2zgILjDB5LlgC3SZSwIbQQOq97toWlBz4K+TfsftLplyxPhHNGo6EZG0L12f4JFBLFjrjzUZTziXGMQmfSk6TU7pKApEfqQlINHsb9FPC+qV+xOGixCYOtGuFdge/oZKwlhBc/l07uSAFfHahkO8O81mqd3FAJ3Ui8XKHuWbh7OR3EC9wIVsmEHneNhmsIo2cSwUqxgpc25TKxF2QWVfO2dofBR2lWJckKy7WiZ+iGSC+dmIMBLLIlJ7UNwZYijQUocigB2/RLJbREv8cqmX8ksHbdXFZbkekUQubf/wt6jt/HAW1qEa+tjJvVnhAIiN2ep6rpk70Cx1uyU75c8UIeF72RZHnCGZ+OYJpbIHkoibu/blwHRP988Ok2nopyVk0OI0R+YQxE2FYI7dA6mEPlH3oOifxVwTwNQJviYPjTpSp8L9BIMNPX7r8yPxS3d/3YyKV4iqF8HlMsg3Smh5MFzTKHu2L1NCGqVEp3sS/2OtM/Au6sx14CuY/0eBLiusdZapIqW+QErXNInlkR2QnMP/XhPeEsZFhl6WNUO2DME+x1Lsryff5FjnYyKOIKPPZXfjedtGZiK8CsEFE1KnE+S1pR7vVsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3149.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(6512007)(6506007)(966005)(5660300002)(54906003)(71200400001)(316002)(6486002)(8936002)(508600001)(86362001)(8676002)(91956017)(122000001)(110136005)(2616005)(186003)(76116006)(4326008)(83380400001)(38100700002)(66946007)(38070700005)(64756008)(66556008)(66476007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmtvRUp1bHE2ZzFYTkljaDlCZ1YwYzJHelRDZFR5L2dTckxFU0YxOFRwTXlX?=
 =?utf-8?B?MG1XQVVzSXI2NHZ5bjB3MGtVM0w1b2ttT0dlRHpMaHlnUnlTRGZXdE95ODQy?=
 =?utf-8?B?VjN1VXBzTm1hVVlLOEc3SlV0eWpFM3UzQ3pZRTluRmx1QStETURqQ2tTb3BC?=
 =?utf-8?B?VWpucVRvRUE5N1d0Z0VFNkJ0UU9IQWdDQU8yMUdGVmJhTjRWR3EzWTE5TTVY?=
 =?utf-8?B?MTVRTHZoQnFuT1RuWW9tOW5FRzZXMGNhYW11em0rbzlTQmkrTFZhcXRlTWs4?=
 =?utf-8?B?ZGZCUldDbzdEdjFRZXhaSkVRNnVrYkZJbVVyK2xKUUtBSFBVOGI5cVJWTDdW?=
 =?utf-8?B?U3plZGJGQ3d4SHlDTVVRS2JVUUk0am5RZHovRHIxb3lsdUZHVFhqdVVlYVZD?=
 =?utf-8?B?N1dsRVg3Q0pUUDJHTU9yRG5jZlBLeWh3bGE2LzgrNGRESmQ1clh0dXl3YzNj?=
 =?utf-8?B?SnlTdWgvZlBqdG1RdFc4OC82dGJNaEg1dGNuRWcvSVJYckZIaExBdGw0Uk9P?=
 =?utf-8?B?S1ZiTlhZTDRtcHVGakl5ak9LMGdFSDl4Ly90VzNpNGVrQ09NKzBoK0F4di9P?=
 =?utf-8?B?ZUpGOFZhc2dxeCtkdGhSR0RaN09CTUNzKzJ3VVUwOEVFa2ZLSWRHRXFvTVFv?=
 =?utf-8?B?djNZaUZweTVlczBpZmp3RG4zYnh0Wkx6MXdBWkRWUjJKRTY0cVQvM0Q4STMx?=
 =?utf-8?B?ZEtZMzRSaDRBQUFlL1ppekNOQ2taazRkL2hYSWZZRTh3WGVpOFpmUkM4M2NQ?=
 =?utf-8?B?RzByRlk1YjlvTTErMjB1NzZYWXhpclIvenpVSUxHMWIzWnpncU1vRlBqTkVY?=
 =?utf-8?B?OW1jZnZVOWtFYW9sWE5MdnMrMzRwKzE5aVFwM1ppdlIvQWlqU1ZLR1pIVE9h?=
 =?utf-8?B?T0dFOEZJdDRvTzZtQTM2OHlZbTN2N01CanU5Yks0TDBXZGpEQXVKZ1NhekZq?=
 =?utf-8?B?REdLS0I3UWwyQStGQ2NOQzQ4Rk5zRlBQTTBVVVhvY2pEbGQzWUZCUG1YUUN3?=
 =?utf-8?B?WkhENUljdkhkM3VXcnBpejhqWFVDNmh6ZE0ra0NpTSt6ZTJHWW9wRjNNN2F1?=
 =?utf-8?B?ajJPMVRLRjVZQW12SlYxQ2I3ay9qdzFLcFJwOUhCMGxVaXFhVmprOUpkZkhy?=
 =?utf-8?B?VFh0M2Z4NTNhSHh3b1hBTEY0bEpIcXczR1o3b21iaDFVSmk3bVVaUW5DK2g4?=
 =?utf-8?B?Q25YaE1BV0FYbGdmRVFRditpRGxESGw2OVo2S1BucXVYdytjQmVYN0xFQXNQ?=
 =?utf-8?B?aW5vUUJhd0VKdmlqK1lGeHZHdzhsNXMrZ09BTHF1VVdrQ3pxdFFNL0ZJTUU3?=
 =?utf-8?B?UVhSZ0U0aG1CcWJ2M3FrUHVTV2JMTXpwVjFMbjRJdjc2WEdKM1BaenhaM2JX?=
 =?utf-8?B?WGdSODRGSUYrNDBROWdJVHM0ZndXeUc5dDExNmg0Mm9VTWNuVnV1Y1JUOC95?=
 =?utf-8?B?VFVzbzREMTVWaXdReDhEVjhsYzBNYUhQeTNEellVZnMybGtsQjZ1UTVoeWxu?=
 =?utf-8?B?S0FlWDFBVkg1RnQyK3dFcXE0RFVKNHFteGlDYkFqRVZnODBYSDY3WE1hZ2FD?=
 =?utf-8?B?V05wS29HSnkweHp2cDlreFZsUk1yQlZPTmhOQk9IRFI5M2lEc0U3M2R0bkJS?=
 =?utf-8?B?L0lRSkhJWThQK1ZRU0dCRzRvZ1NQRjJjZjJtSTFXZ1doSXlVMGJkd2JWVTZR?=
 =?utf-8?B?Q3JGN1FZeUhWKys1U0p4OURoSVVpaktvQkRIU0JQN2F5SUxtTDRPb0FvVHkv?=
 =?utf-8?B?bDhxRzVMMTVvbExyMk96M0FSUHVXQ2ROZ0xFR09nZ1B0aFZ3d3llL3o1MFYr?=
 =?utf-8?B?R0FuVU5OTFZCT0U3ZTQ2ei94ZXZOWFJITlczMlk2NlpqVlFKWkVOZm1JSXo5?=
 =?utf-8?B?ZStvUUVva1h6TDFCMmpUNlozYWZkRmdZWm9hQ3Y3ZkFmMEVBZW1MdFBZMFV3?=
 =?utf-8?B?UFdwNld1UkoyaGw2dDRCMk8yTFJZOEJuZ0FSQzRGSkV5bFQ2eGpIVTBlRDYz?=
 =?utf-8?B?eXZPaHdMc0tEVXBSZGp2Vkx5c1pTMzJWRUlvSWQ2WS8xWFRoL2ZkK0poNDdn?=
 =?utf-8?B?YzZvZEQ0aENma3hwSm92dGlqU3VUVFV6bGdablF5Q0p3aDd0NjltYWEzRHo4?=
 =?utf-8?B?VGZMTjVCeU0yZWVvYU12d0orbkZQVHBVdnY4SEM2eURJMGViaktiVk1SSE5v?=
 =?utf-8?B?Qy9uOVpoc1Q5WE4yczNhMDBLTkRackRZcnhveklNMzNKRjRNMEdoa0d5MUZM?=
 =?utf-8?B?RGxoM0ZlZ1JnaDNLWC82Y1lOOEgxUlNPTXlLazNrR1ZseVVNM1RWT2xaNkRI?=
 =?utf-8?B?bGx4TnEwNnRWdUYwSkdhVy9nT01ZNVdCdnRPcUwzNVljaFlDQlNtZmJ6a2JW?=
 =?utf-8?Q?bgbwZevHaD2CX4xw1PzSLzMPVy6iy2WsDE/03p6Zg6uIZ?=
x-ms-exchange-antispam-messagedata-1: 7cGDFU0qtblOut0pB+Yw9q4+VG19tw7LYvs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E8223942C8F294BB59E500A0CD312BC@namprd15.prod.outlook.com>
X-OriginatorOrg: de.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3149.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c07533-0159-478e-d26c-08da294311b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 18:15:26.2538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc6aH5oO9qlfcgz7QxB1D38ESoZOnUlyydYPqyxtkGO6KmvQ3sMrtEuRndphOoScK8lg6/8kqjgfiUn8Auj+ZGIwdJ2j8ly68O1BVRgBuyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4218
X-Proofpoint-GUID: owRIh_Iku4-0yoxwoy0usRxIqOKCTFIw
X-Proofpoint-ORIG-GUID: owRIh_Iku4-0yoxwoy0usRxIqOKCTFIw
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_03,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=624 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280109
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=Ulrich.Weigand@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Ilya Leoshkevich <iii@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+IHdyb3RlOg0K
DQo+Q3JlYXRlIGFuZCByZWNvcmQgdGhlIHR3byBzaWduYWwgdHJhbXBvbGluZXMuDQo+VXNlIHRo
ZW0gd2hlbiB0aGUgZ3Vlc3QgZG9lcyBub3QgdXNlIFNBX1JFU1RPUkVSLg0KDQpUaGlzIHBhdGNo
IGNhdXNlZCBhIHJlZ3Jlc3Npb24gd2hlbiBydW5uaW5nIHRoZSB3YXNtdGltZSBDSSB1bmRlciBx
ZW11Og0KaHR0cHM6Ly9naXRodWIuY29tL2J5dGVjb2RlYWxsaWFuY2Uvd2FzbXRpbWUvcHVsbC80
MDc2DQoNClRoZSBwcm9ibGVtIGlzIHRoYXQgdGhpcyBwYXJ0Og0KDQo+ZGlmZiAtLWdpdCBhL2xp
bnV4LXVzZXIvczM5MHgvc2lnbmFsLmMgYi9saW51eC11c2VyL3MzOTB4L3NpZ25hbC5jDQo+aW5k
ZXggODBmMzQwODZkNy4uNjc2Yjk0ODE0NyAxMDA2NDQNCj4tLS0gYS9saW51eC11c2VyL3MzOTB4
L3NpZ25hbC5jDQo+KysrIGIvbGludXgtdXNlci9zMzkweC9zaWduYWwuYw0KPkBAIC02OCw3ICs2
OCw2IEBAIHR5cGVkZWYgc3RydWN0IHsNCj4gICAgIHRhcmdldF9zaWdyZWdzIHNyZWdzOw0KPiAg
ICAgaW50IHNpZ25vOw0KPiAgICAgdGFyZ2V0X3NpZ3JlZ3NfZXh0IHNyZWdzX2V4dDsNCj4tICAg
IHVpbnQxNl90IHJldGNvZGU7DQo+IH0gc2lnZnJhbWU7DQo+IA0KPiAjZGVmaW5lIFRBUkdFVF9V
Q19WWFJTIDINCj5AQCAtODUsNyArODQsNiBAQCBzdHJ1Y3QgdGFyZ2V0X3Vjb250ZXh0IHsNCj4g
DQo+IHR5cGVkZWYgc3RydWN0IHsNCj4gICAgIHVpbnQ4X3QgY2FsbGVlX3VzZWRfc3RhY2tbX19T
SUdOQUxfRlJBTUVTSVpFXTsNCj4tICAgIHVpbnQxNl90IHJldGNvZGU7DQo+ICAgICBzdHJ1Y3Qg
dGFyZ2V0X3NpZ2luZm8gaW5mbzsNCj4gICAgIHN0cnVjdCB0YXJnZXRfdWNvbnRleHQgdWM7DQo+
IH0gcnRfc2lnZnJhbWU7DQoNCmNoYW5nZXMgdGhlIGxheW91dCBvZiB0aGUgc2lnbmFsIHN0YWNr
IGZyYW1lIHRoYXQgaXMgdmlzaWJsZSBmcm9tIHVzZXINCnNwYWNlLiAgU29tZSB1c2VyIHNwYWNl
IGNvZGUsIGluIHBhcnRpY3VsYXIgdGhlIEdDQyB1bndpbmRlcg0KKHMzOTBfZmFsbGJhY2tfZnJh
bWVfc3RhdGUgaW4gbGliZ2NjKSwgcmVsaWVzIG9uIHRoYXQgbGF5b3V0IGFuZCBubw0KbG9uZ2Vy
IHdvcmtzIGNvcnJlY3RseSBpZiBpdCBpcyBjaGFuZ2VkLg0KDQoNClJldmVydGluZyBqdXN0IHRo
b3NlIHR3byBodW5rcyBhYm92ZSBvbiB0b3Agb2YgUUVNVSA3LjAgbWFrZXMgdGhlDQp3YXNtdGlt
ZSBDSSBwYXNzIGFnYWluLiAgKEFjdHVhbGx5LCBqdXN0IHRoZSBzZWNvbmQgaHVuayBpcyBlbm91
Z2g7IHRoZQ0KZmlyc3QgaHVuayBpcyBub3QgdmlzaWJsZSBzaW5jZSB0aGUgcmVtb3ZlZCB2YXJp
YWJsZSBpcyBhdCB0aGUgdmVyeSB0b3ANCm9mIHRoZSBmcmFtZS4pDQoNCg0KQnllLA0KVWxyaWNo
DQoNCg==

