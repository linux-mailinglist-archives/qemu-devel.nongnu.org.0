Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4EE3F1B60
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:12:25 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGimO-0004Dw-Rd
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mGikG-0001qt-Ti
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:10:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mGikE-0005OE-Mh
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:10:12 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JE67RH028346; Thu, 19 Aug 2021 14:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=s2ub+rfsAFMlIUwZKFqR3yh519G0K8AipGtr/PDJOTg=;
 b=v3thpEkNLDxG4SwCtbEsEqjSq81WRYh8kJAWPA6GkKZO7jH6g0zzGNaedvCkkgX5Iezc
 jUewFVIlkxRfuWWr8cddEbjtQbWhJFjahEuChI5IFpdH9hYBKA7rVbgSxwUxjQefKowd
 g7joWW6ChZxxXnGrMeURjm53gmvDPmc9R7uiInmiqyCY6LVnCYNQWWYu/J0MEDmh1vLh
 VJWgY6hTgp/aaKt1cJacf8YQv0SY8n0hODt/uzQYFWllYIr91/nRIdgYxhL2AGnpxGaa
 8Nh7tQxUOJppRqGBzsPV5HQD/YTqPKXHI2FqvaCt1CNcQ2LW/uMPdUqq2C37Q6Izm30p jw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=s2ub+rfsAFMlIUwZKFqR3yh519G0K8AipGtr/PDJOTg=;
 b=m7FWlZ3zmys6RtGkPZCX5I9CEEn9LJxdpX2afIlJpOeBgS5hw1cqXCzKiro8TDKL9YyZ
 m402UF2Bp/NTPgwpMjwwakvWNwycA5Vr0tY+AmdOdXrlqpZwfZYhjZh82tiN2gPrUGqA
 cO0abbrFAQeCPUc8DtiTzEhhLZltMRlTEgYSR6P3rWFUXSPRIwibI3+m2qkBSiDA0AbA
 mHuEtEA5+yIthkMWBCzgx8Tb/HxGA6Y/Wnrnhngw+Zb4XdWouf4BFGICgWAEewLhZPy2
 zsTM0FuFJGcuRXGxu7U00jVHuKho06bHi2DEzG7L6mBf1lLJH/900YMXAyYKU379g3+S yQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3age7ddghv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 14:10:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17JE77oR011659;
 Thu, 19 Aug 2021 14:10:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3020.oracle.com with ESMTP id 3aeqkyhq39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 14:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdY39/4QogA469G5KZT/Xhlsyr8V9GxfQZoB0YrLflrgyK+gYQNkA2xwDA31YR45YnjUKJB6rDAUuzezkUiwY/tyIaJY6kZe1vQlxd6mp7p7o79aRk4ef9GPFbM1WyF1UOnpQiE2EDH3FqaBCvmBAwUHQKaG1TI38iVeQ8UurlL5+04yN+jnmNKV5NAa6KUrcsvQ33h/FhUjV98JxiN9FSNK09X4e29s7LfIlxYEEkbJUGY7FwqxIykqCiMtCCeI9oBqJNlPzYGvLIt2L02DF1brXXgsSYQ8ueJI39pdGG+QCbaG6l3d8fP/f0Ewlf6zpB0LS/w744D2HzXKZwyolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2ub+rfsAFMlIUwZKFqR3yh519G0K8AipGtr/PDJOTg=;
 b=ZnqeujAnKthE/o82mtwLCuS/r/RTZmZCkllEINwKa50tz03eYJ5MbtpDQ6TF/wJfx4cFO/367yYFjqaptE9VsUf0vmxNmiQnLh43NZknOKxzQ7hQbSVDRg8yYao8u9togcPH6nfAnyleNWwTCIcW6Q5tUAw6IYBTQsCwV2+qQs5u2OBq/s00ekIOZcMCEerD57LSIPlWjZP98rUz7mpPp6InpedFUAXU2UxlWsAsopeb3gi7SDMbQ2Tf1ixZIpKyISQ0/47XdAhgwVR4ON8bqj/AO/GS+WmjOesM4FZD3yvdCyvUMRuJHWCVZKhGIiKw2rjHU+mF8X2uX/moBG3E3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2ub+rfsAFMlIUwZKFqR3yh519G0K8AipGtr/PDJOTg=;
 b=PSbgJ7l5uZBRxHVoTiTMfx9HBNH/lMqO28zEZ+zbIU9HjFHM6pAEpD+kllmpcEHb13xAUsT6p9962DB6kyKyQzO+7pQsdChbbE2gjQ1gQif8xGR7WSpgBaEeUPv1gzBpR75kNt5jhR5fEWiZCJ2gtJwB9LKE0UGTwUhK54mp48s=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1696.namprd10.prod.outlook.com
 (2603:10b6:301:8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Thu, 19 Aug
 2021 14:10:02 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::58c6:846d:3bc3:ba3f%7]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:10:02 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Topic: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Thread-Index: AQHXkr3ElMGqWLWPTUyD8mY3/VudXat5nYUAgAFEzQA=
Date: Thu, 19 Aug 2021 14:10:02 +0000
Message-ID: <0AF46308-56CD-4715-A18F-BE74F0C98101@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
 <20210818124732.2fcc6180.alex.williamson@redhat.com>
In-Reply-To: <20210818124732.2fcc6180.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a3799a6-0b27-4ea4-f57c-08d9631b09cc
x-ms-traffictypediagnostic: MWHPR10MB1696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1696E84DB8415B66229A35E9B6C09@MWHPR10MB1696.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XhetMwtq8OjEvXQqrGMPVChnUOzCuYY3Xb9CxSosCAVlzunXQwPEe323yZYy7F2z2WB8Fq1qtfOdxLY/V9qEtTnlkzDRKOwLdvHt2ZprtPwjcB55m7CWRuU0HmrSJhL/kXuoIbNaP0EQx4Q0/sfAKeWzXQvrZ+ko2el1hZk+XZr8TebRCj49JvdGRq7j45MHSMyo0SkL5Y5ZMjhzdAPbnqS5TWb3BmTqyBMECtRFEC3rej6DaAJ7Yw43dTMqMUshzVmhvi/5Jr22a3WGLHQNFmDoHA8A4kY0uJ7BtgfIkIFnnjCgtiDX5Sd7cy1AWuIvYC/lEpS3WXwb4qrNBf3N8HV+/l+TCw0gBJya0DLPaAkkwq0Aub31o2HWKX4rzyiAOBYXReF/E6gBtDv6hDb3Jc5UxZMF/jbIe0g72Lvz5FywWCoUr+sVth0DEsf9ByMMRlyui/dsDnSsq+BIK+Z6iMxkIBdcVMItD+d3vE33EGIxuCQOSUTNhXauoVb+HvS8ZYmrvp0xVoFvtC6F55/0RE5n+ki3EflmqGQQY+nDkRFCQ8jBU8sTbiiSdp4vuu0KN2QGqT692xEyebsTcJlYS2oKc9Ey+R2m1F6yJMj2ooCYXVesQtHGcuEePnuI1NxEtTOOLQ5/j6ZDYimwEU7wu0m6rdK+pndGx/qtoSrfLW3hKMfCZDJc60phZZwbiNuPhtwe8fdxp0nNFAk93R3DPNBydPY9lyPSxplrQznrkCE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(91956017)(6506007)(2906002)(6512007)(6916009)(2616005)(54906003)(76116006)(5660300002)(86362001)(36756003)(64756008)(66946007)(38070700005)(33656002)(508600001)(122000001)(66476007)(66446008)(66556008)(4326008)(38100700002)(8676002)(26005)(8936002)(71200400001)(316002)(186003)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGpBQXFZRTlCdTNsRndBVmhtTC9mRWprYiszUVdvWVJoRUhBL2F0aE1DNTJj?=
 =?utf-8?B?MlF1cDlhN0RGeCtsYzIyZ2YwRjJXdm5NZFpQQ3U0WStuOGF0RHFoc0JwaXVl?=
 =?utf-8?B?cERqRnlPKzNMR2hjRkwxRzFLNW1Jd2hBWmhGbUdaQTlpVWNScTlqZ1Q2UTNx?=
 =?utf-8?B?UldkYURyU1ZOVWE3dkppRHpFK1RJL1B2amRUdFpMdS9oeFI2RTBKMWhFSWlr?=
 =?utf-8?B?NWdaSkZQaHUyQ0VsTE1NRTVXQUx6Z3FoZ25LcGcvWTdJY2FOMEJtaGtZc2VH?=
 =?utf-8?B?VlJOV21HbUlKSFVydGt5QzJYbWI3Q1E1WXVkSFVIYUNRT0x0aU16Si9kQnh5?=
 =?utf-8?B?KzFoRHV0T0x5MFBqSkU3SkpsT3N4YVlocVlrVWJ0b2wxek5ET1ZCMUpRUll5?=
 =?utf-8?B?ZFZuSGNtNEJsZFplekFmYXlGQndTSXdBcDlHcHRHb1ZxdzVVUWJvRTVwUjVu?=
 =?utf-8?B?b3ZlbTRIWFZuK1g3dXBNTENXWTVWSDh2UGMzWXVBcFBZenR4ZG85QXBXZkdH?=
 =?utf-8?B?cjVJeW5CSjQ4K2toald4SjBPRS81bDhOYWVoT2JsRXFGeDgrNlJlamQxRUVq?=
 =?utf-8?B?SWU0V3V5K1JsZ3RUWkx4VFRqbHU4R1BKU2YzMGhZZXhiQ1JiQXd3d3M3WXVF?=
 =?utf-8?B?Z3cyT1o0SS9uYkxIeEg5dWZLQ1c1TGVBaUZ6Q0pCTnBrTVFPRmZUajJzek5E?=
 =?utf-8?B?MjFJaDNoaTRWck5NZGFWRk5vbWI4MnZuVzdsa1ZCYWtQUUMxL2ZDazlHc0xV?=
 =?utf-8?B?S01JWkdsT01oS3lYLzA1QUFiS084MzJYRnpVNmE5QkhXMHNFNTRpQUdMNDRY?=
 =?utf-8?B?V2Rsbmc0dW9BL1dVMlovT3Y5TE9FWFBBOGxxOUtCcURKZU1acXJLY1VYcm9K?=
 =?utf-8?B?WDdtaEVIaUhGZUFCdFZGYWdVaCtFcnFDQkx1SmR5WG5xUnhpMEZLaHdWTWVW?=
 =?utf-8?B?RldrN2JEM0ppam1CbkZkR29mejFsWmg2eFZmYWhtOTdLdDFLblB3K3V3bHBv?=
 =?utf-8?B?dzJ5K3pwb2JFYUJsVW1nTlBVSjVsaHVxVjJRR1NDNmxjbDM0YUwzcU9najlQ?=
 =?utf-8?B?dXNKTzYyYjlEMFJUZEFGSkZKa0U5VCthQW1qQjZCT3pBbEZnYmFwZS9XVGIr?=
 =?utf-8?B?Q1A1QlFRYkZDZVZNK3FCZnNzRXY0cmNLcDVPQi9ocWUrcHRXZkRHODVYazcr?=
 =?utf-8?B?Nzl4Y3Nka3NVTDRrUnJEN1F6eVc5L25pclNrLzJQM0xhYjVzTGNDenZ3bmlE?=
 =?utf-8?B?VU54ZUFFOWFlYllmc2R1MEt1ZDZQYm5mSTQ4UmhtYXJRWnRaa1FnT1hJcWxr?=
 =?utf-8?B?V2NEL3Q1ME0xeHl6cWxadW5Dd2hnQzU1cm9oZ1lXMFowMVdyTW14cHplaEk0?=
 =?utf-8?B?b0tnVnI1YTlndHpBT0RQTk0wcG5ORXp6UEMxVEpZZ3dTVHkzMFc5VUdseVBy?=
 =?utf-8?B?Nk9aVmNoQUtNYWQ3U0pLY0VHS25SbzRBZmJodXV2MlFNcHlhS0N2QWJtWkxX?=
 =?utf-8?B?ZFgyYXRYL202dlNVczZheEtwNzNTNEFPMFN2NTdKbW1xNGhUM1RCOU4xWG85?=
 =?utf-8?B?M0I3R2hTb2RoK251YXhqTm83MDF4WEdFcC8wM2RNcmZCTHBod1U0VVc3U1FZ?=
 =?utf-8?B?cGRRbWhIT3IxSm0vRnBneGF0T0tLR0t1TnhkWkxiKzV1TTNJTUxDald3YkNJ?=
 =?utf-8?B?WHRyVDl5SlVKTFp0SXRQUmdFbGgvUFhKNHB3V016V2cvYjlXYWd5RlNYTXlN?=
 =?utf-8?Q?T8w31Pe61tgVWDlwIOfVRWMQDcmYya72FEWd9Tk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE2ACF431BE1EF48B566400766BF8ABE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3799a6-0b27-4ea4-f57c-08d9631b09cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 14:10:02.8010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hN3IdLDxbRF3OYgMyqbzvdf/p4dWgwByqsnN29zpFHN0P8AOmBNQcYUcvW1OaDTV2GZW7ktXvnV1jr4wxJi61+csezhol5L9g7F3NAsaMbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1696
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10080
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190083
X-Proofpoint-GUID: 0C7VzypmQMKBphtPm9b8x_B7-ZmBWBQ-
X-Proofpoint-ORIG-GUID: 0C7VzypmQMKBphtPm9b8x_B7-ZmBWBQ-
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDE4LCAyMDIxLCBhdCAyOjQ3IFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMTYgQXVnIDIwMjEg
MDk6NDI6MzcgLTA3MDANCj4gRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xl
LmNvbT4gd3JvdGU6DQo+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vbWVzb24uYnVpbGQgYi9o
dy92ZmlvL21lc29uLmJ1aWxkDQo+PiBpbmRleCBkYTlhZjI5N2EwLi43MzliMzBiZTczIDEwMDY0
NA0KPj4gLS0tIGEvaHcvdmZpby9tZXNvbi5idWlsZA0KPj4gKysrIGIvaHcvdmZpby9tZXNvbi5i
dWlsZA0KPj4gQEAgLTgsNiArOCw3IEBAIHZmaW9fc3MuYWRkKHdoZW46ICdDT05GSUdfVkZJT19Q
Q0knLCBpZl90cnVlOiBmaWxlcygNCj4+ICAgJ2Rpc3BsYXkuYycsDQo+PiAgICdwY2ktcXVpcmtz
LmMnLA0KPj4gICAncGNpLmMnLA0KPj4gKyAgJ3VzZXIuYycsDQo+PiApKQ0KPj4gdmZpb19zcy5h
ZGQod2hlbjogJ0NPTkZJR19WRklPX0NDVycsIGlmX3RydWU6IGZpbGVzKCdjY3cuYycpKQ0KPj4g
dmZpb19zcy5hZGQod2hlbjogJ0NPTkZJR19WRklPX1BMQVRGT1JNJywgaWZfdHJ1ZTogZmlsZXMo
J3BsYXRmb3JtLmMnKSkNCj4gDQo+IFdvdWxkbid0IGl0IG1ha2Ugc2Vuc2UgdG8gYmUgYWJsZSB0
byBjb25maWd1cmUgUUVNVSB3aXRoIGFueQ0KPiBjb21iaW5hdGlvbiBvZiB2ZmlvLXBjaSBhbmQv
b3IgdmZpby11c2VyLXBjaSBzdXBwb3J0IHJhdGhlciB0aGFuDQo+IHN0YXRpY2FsbHkgdHlpbmcg
dmZpby11c2VyLXBjaSB0byB2ZmlvLXBjaT8gIE5vdCB0byBtZW50aW9uIHRoYXQgZG9pbmcNCj4g
c28gd291bGQgaGVscCB0byBtb3JlIGZvcm1hbGx5IGRlZmluZSB0aGUgaW50ZXJmYWNlIG9wZXJh
dGlvbnMgYmV0d2Vlbg0KPiBrZXJuZWwgYW5kIHVzZXIgb3B0aW9ucywgZm9yIGV4YW1wbGUgZmV3
ZXIgdGVzdHMgb2YgdmJhc2VkZXYtPnByb3h5IGFuZA0KPiBwZXJoYXBzIG1vcmUgYWJzdHJhY3Rp
b24gdGhyb3VnaCBvcHMgc3RydWN0dXJlcy4gIFRoYW5rcywNCj4gDQoNCglXZSBjYW4gY2VydGFp
bmx5IGFkZCBhbm90aGVyIGNvbmZpZyBvcHRpb24gZm9yIHZmaW8tdXNlci4NCg0KCUFzIGZhciBh
cyBhbiBvcHMgdmVjdG9yIHZzIHZiYXNlZGV2LT5wcm94eSB0ZXN0cywgaXTigJlzIGENCm1hdHRl
ciBwZXJzb25hbCBwcmVmZXJlbmNlLiAgSSBwcmVmZXIgdGhlIGNoYW5nZXMgaW5saW5lIHdoZW4g
dGhleQ0KYXJlIHRoaXMgc21hbGwsIGJ1dCB3ZSBjYW4gbWFrZSBhIHZlY3RvciBpZiB0aGF04oCZ
cyB3aGF0IHlvdSB3YW50Lg0KDQoJCQkJCQkJSkoNCg0K

