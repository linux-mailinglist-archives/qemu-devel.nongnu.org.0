Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F763FAFF2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 05:10:26 +0200 (CEST)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKXgn-0001bG-CU
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 23:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXfP-0000vE-Gl
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:08:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mKXfN-0004gx-FP
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 23:08:59 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17TEOSva026234; 
 Mon, 30 Aug 2021 03:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=9aT+EttwVhXsl6MmQnTiUjHi7RVFQRdltMb5YCtMR6Q=;
 b=Pr7eUy4SLCFLiggPn8HI90g1LstkOnAeJ/Zz5kfs/xM0qYa/TYS7qLn5I2d51IUOczKG
 yvj5ZwISoST/2gyljXyAwj+n5gS7xNQJePRxUGwlAHl+YK/o4VOzNq6Ms5c25XxvQfdn
 3Giicvk7xx4nMoxwYWoe3vBQqqG0vKFYRLoAqfNu6dVZ1/ww51yxwddn7MShoJlNyW4p
 /2LIGloatbF2KQeqdSFq6RQlBGskrLonuVB8S4iyvk7UenCmg6ZHzuwI+rml6j5/jqp5
 nnRP2yzS9oXC03pQu+gBYAzPsS+DW9f+GN1iDFLvaHVZArRgkw4ijynheqrmSD2UFh2d /w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=9aT+EttwVhXsl6MmQnTiUjHi7RVFQRdltMb5YCtMR6Q=;
 b=X06pRm+ex8Q2uIMDP/dlFEOoxLh0MFf8obkTzGKpH3KNjjsUtjtWQK978rAo4O89wcYn
 ZfFMPazpbIU5yWkLQqlBQDmkxLGJBMHxC/ZhZUtwUJj+SBMAFResJwQge2aPX5BMgs+d
 XMdtlLxsDsH+1+XX25yozl1/A9WgFr1OFKyaIxWWkIvfj19QFv1vRkrSnrGszCJB11ia
 HAt627RuGCeeSI7z3TNIC1+JEr4q1JbbnYyFjwkSVt5rGP/q7v5WMdFHm7rDcFXGcoN0
 KrqfkLJ92hWG313jVozF268kV/cuetYFN4Ayc4U+AKIQ4QUCR8S9eeynPbJQseL5k+f6 og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arbymgea1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:08:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17U35etY038649;
 Mon, 30 Aug 2021 03:08:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 3aqb6b6thn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 03:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eayov/s9dtwP7I9pL0M+r1XzmXTiziM7E45KEvvtARzf++xAiQdbxG8rOWQyASYaRwTiPR/z5L9WyjDAqFbJMCscXXZgo+xZmmuMLAaqtp6NHQ7j8w+Syh7CW8KCOFCvv6ZVtETIEvytQFnC1oPuSWVNENrhFDwgz7ZNss7W4fvRHLrkov5uytkcA1dfhQYAqxQK0M6cVCbun4oCzxN7tFOmBiZwJTQBfRGPujRU+zpA6l9ewr/444HWv1xuPbS/HrURN9L1AuLAgiIZTUEebZTWSKrf/lS7yyWOZOGR8AA2yBWajXpYdL6WQbVAgs7Xq2hqp5LfvRYMD+5ncohRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aT+EttwVhXsl6MmQnTiUjHi7RVFQRdltMb5YCtMR6Q=;
 b=bbpw4k+r2ATwvtf/RJUgGcZNAy+xDY2KH+K1Fe2f/FLiHi2HryPRpd2cxISIeAuTEkLhQs/ij9lkUCwIEUc+lVeNvQlDBn0ch8zLlpAlij0Z+Jqe0nh33BDGi5k3TzDIUrcaONRXzzSI1jDYq7sYM5XqexTlJrad5FbA0KMPrZ5Je0mtmu68wA3Lm8vVoGMHCkYfgqMteiAoJBCLa4TzzA5bBQZQ31UhwOQqDg/OhSL2sepzENl5LyHSfSwDzivLejWao4GxaDsRxCzAV+zImQPBXpkuw0bpAAtSFWXQt4wLhKKSdPMeFmCIFxEfhPMrNy5kFMEJTpKJQHR47hPXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aT+EttwVhXsl6MmQnTiUjHi7RVFQRdltMb5YCtMR6Q=;
 b=ugLxQbrpaw0UJyE+s2Byzx418paKwHnTB3XJtUr10BuI3UGfNFXjLWrE4zR+wAhlac7noj7Uy6ur8eTVpDcIWe4Er8eXXYkPHrLROJWlSrGNbVHvTpbOq/K8ndHZ7U6cah9fQw6a2fvwBTzemukrU7FJzCFuyohepBEjnNzf/IQ=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR1001MB2350.namprd10.prod.outlook.com
 (2603:10b6:301:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 03:08:50 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4457.017; Mon, 30 Aug 2021
 03:08:50 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 06/16] vfio-user: negotiate version with remote
 server
Thread-Topic: [PATCH RFC v2 06/16] vfio-user: negotiate version with remote
 server
Thread-Index: AQHXkr3FiXHbxCGMrEqy49bq6mUiZKuC3ICAgAiWugA=
Date: Mon, 30 Aug 2021 03:08:50 +0000
Message-ID: <4F549CE3-D6F2-4A55-A0A6-168F5EBDCE0E@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <a14c2c09f41ddda83cd710516cac8d210ec9db08.1629131628.git.elena.ufimtseva@oracle.com>
 <YSUXVQJwkubjpp9x@stefanha-x1.localdomain>
In-Reply-To: <YSUXVQJwkubjpp9x@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d2f521c-6846-4c91-892d-08d96b637ddc
x-ms-traffictypediagnostic: MWHPR1001MB2350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB23507B7C185ED252B73CF286B6CB9@MWHPR1001MB2350.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UgXGn8MEdNwl1gmHIhTrERp7DcUl5utTIi1R3ema+N25CDNdvmdEd8c7qGdOsv1IQEMdOWBRHqXMKvdjU5w/NujQZyH/yqHKOhM8y0/Z+dLh4TFVcp5aPomrQzIe/w/sxEDCIk87V2dono11RNk3FmXa9sRprkEQvDN/HwZtW5/nnlqkyvg9srIXQ0SF9KfKKY70rh2HMuCzMp8n1g4r+xTK9H2D+hxpgU2NwwvLzzJ71wGn8DkKx3YTv17AaJbZspbkCF1YyogVLZYJqGPFIQU3Ch2mxZyx1WMeTYg5KKFPHuKwMWY4tjjQpE6XzqbkjGFQHaj6B0zXjuY418v4tlPpuGtG9MruCyV079JADVnL5SkD59VVsONvbX36iSJoitnSSD3lmwxGxH8Q4u6QoWDDjv+hZCPiRKJtbsjgl7SemQDkYiTyiHPASIptX5wno5UuZyYuDwUKd5lUkqMFG18I5ki/+sy4fZiC5xNor8kwx1VZXP1oKDjonzAbtiMbMDOtnjOCgZs87hec9ALE2uLlBnE7uUtTc8Mo4i+Gv5fzaBQyd2n3Dm+IDUzOl4GKNTo4qG7tVrJSvhhZF+VKn9D2OTVV0MmmfjvbM3t2rJ3fFgr4TbGCcYKjJCy1jjNPe4Q1O97GltvHAJieWbdEH7i6cmMIFWbphrRpP51IHxipQsp0b4YBVSrxXeYB3IbgaBroR8ocfuoI/TygfPRWNcHaQMRdizwmcBkVYhxtfp2MaQiSJD++h7QuP0GiipC4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(366004)(136003)(86362001)(4326008)(186003)(2906002)(66946007)(76116006)(38100700002)(122000001)(36756003)(66446008)(64756008)(66556008)(66476007)(54906003)(33656002)(53546011)(71200400001)(91956017)(6916009)(8676002)(8936002)(26005)(6486002)(478600001)(6512007)(83380400001)(5660300002)(6506007)(38070700005)(2616005)(316002)(4744005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUl0SXpobVpiTFFwa1QzZ1g0bmFxVW9KeFBoRXhhWStQUlVPNWQ4aXVyV1VS?=
 =?utf-8?B?aU1vTGtOUGlwaHQ2VE5uNGV6bUZWRi92akU2WXZKV1ZpRWFUVUdnZDd0WGVP?=
 =?utf-8?B?V1JFemIzUDU0MWphYytySVhLQlZxN2JBaERqZXE0RWJwVThGaDNqSGY1aEYr?=
 =?utf-8?B?aVk5eWk3U1NteExlU01mdkE3ZEtORjRXS3lPUXM2L1d4NEJiZkZpaUtLa0Iy?=
 =?utf-8?B?Q3RheWFuSnBUNnp3TnhMZEZoQmdaaGVxaFBkYzE0bVRiaWNacGNMRDlVd0dx?=
 =?utf-8?B?NnViTHNYRlUxd2VCRWsxZ0M5WWVGdUV1dlhiT24reFkvV01jbEk2c0VHRFcr?=
 =?utf-8?B?RWlpVHZxQ2NmUHhRbk41OUxiR2lLMXJEWURkVXZWdlJ0ZUwzeTM3WGpocXQ0?=
 =?utf-8?B?dDRNVkJxRWUwMStVYmUxRnh3TW4waEpPQ3E2dVYrS0FZRFhuZ2lNYWtwbUFv?=
 =?utf-8?B?TDY5QUlqbWJZYUxnbnhLbXVmKzcwSU9BN3UraWIwSmtsOVZMaUk3YldHUWRD?=
 =?utf-8?B?RWoyRURCNm5nWndRNzRjN0REbWJsRjloc3pwWjdUdXdtN3Vrb3NoTDAvNXZT?=
 =?utf-8?B?MU8zMExRYkF3djhYbVJ0cmkvbEJyMHluVFJZazA1elJmYytMczV5aDU0d0RF?=
 =?utf-8?B?di94SzFxKzJ0emdTUHAzMzFYYllSc0RIeWdGS2pRYnBjVnZLSGtrd0hNWTBr?=
 =?utf-8?B?SjZ4TFBWMnpjbzUrTUh5MHdPQ211dzNVYm5VUVRqdlk4azBtOG5GWEtIWHoy?=
 =?utf-8?B?dG1jOVJpZVJhbWZIaUZWd0ZJa1NlTEJDczgvL01NTERxMU0zTUQ1cTcvem94?=
 =?utf-8?B?dG1XUFd0Rm8vZ2JQTWl0MFF6Vjl2ODhUWWY2SGdERUgrTktRbzVnei80Mnl2?=
 =?utf-8?B?S0JDTGtlT2RWS25WNjdZTk1ld2hENERHYTVyU2w3cFlya2Zob2ZhTXdOeHE3?=
 =?utf-8?B?SXNwSW5LajRSaXp3YTNLRUdOTlBwVXNqcytiVUZTNkRrK2JxVGk0MXM0ZTJi?=
 =?utf-8?B?TkdveDlqOXg5L3Jkb3d5bk1nOEw3cnRSaEVsd3RSSUpXeklpOHZGdmd3a3Yw?=
 =?utf-8?B?L2I5aGhreGhFbzZTWjVEMkpkU1Fqcmp4QVBsLzhvTllxWHQ3VlBYZklNVllv?=
 =?utf-8?B?S3R3Y2pBaDdMWXRqeHRuU1RURkU3alhBcG5qcHI4N2MrcVBkWkxqTko4bVVr?=
 =?utf-8?B?Q1JDMzlqRWg0N3VQWFIwRzl3cWxseVBkKzdITzZZZzF3UjZDdEJ6RWliaDVS?=
 =?utf-8?B?ZVhOZGdJSEQ0UmszbFRacnFHUU0xNGRHZEc4amZ2SkVuWDJhNHdoM2s3S2Y2?=
 =?utf-8?B?TWVuRHNYMUFjYkJ2VHRWUlFVT05NMGdKSllkYnJIdFZwU2NrSE05bWdZTm1F?=
 =?utf-8?B?ZlF4ZW45UkNLcWJ5RS9jNW9jOXNVZW9WZFB3TWZtM2h4TzFyOWpQRFZCVFpy?=
 =?utf-8?B?U05DVDljbWZYSzVmV1lvM1NRbmUzSjVJdVFEZE9zTDNUazhvdHhnZGxuaWQy?=
 =?utf-8?B?Q081ays1TFRrZnZaaGtWYjlTSXJLMWU5OVNGZEhYZllBMDlLV3MzdXQ0SWgy?=
 =?utf-8?B?Uk5OZU0zUW4rY2tjU1VxUTZWaVRERkVOUjdiT0NWTmtVQjhZQzNTMFdkZ2li?=
 =?utf-8?B?ZEJTSU1zdElXcjJwOGlDcFViMW1FNUlEUUsxd1BiVWFJZjBhLyt1Wkl6MmVv?=
 =?utf-8?B?TkR4WHRwUFZhMkZIUjNIMy82ajFXN2tGRDl4S3MrbEtwcmdlT1FUVWFUV2tS?=
 =?utf-8?Q?1mcuNj4fslRh5+5mWEjqxOWPko1CwFQPcD0qTmO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF3D3F380A7BD54586A640DE47C474A5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2f521c-6846-4c91-892d-08d96b637ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 03:08:50.5146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GAtkGnwYgl68dEodIoLVi1qbG6tXyWk0YncE4LIyuijRx/kl1nXUIv0b+seJiIrqSD5xaygZ2AvKMW4+wjgRUqBDZw9yBqgB49yJQ8G/KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2350
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300018
X-Proofpoint-ORIG-GUID: Y4MVFU98nA89TxoWnB694Ul9w6Rt1mWe
X-Proofpoint-GUID: Y4MVFU98nA89TxoWnB694Ul9w6Rt1mWe
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXVnIDI0LCAyMDIxLCBhdCA4OjU5IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBdWcgMTYsIDIwMjEgYXQgMDk6
NDI6MzlBTSAtMDcwMCwgRWxlbmEgVWZpbXRzZXZhIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2h3
L3ZmaW8vcGNpLmMgYi9ody92ZmlvL3BjaS5jDQo+PiBpbmRleCA3MDA1ZDlmODkxLi5lYWUzM2U3
NDZmIDEwMDY0NA0KPj4gLS0tIGEvaHcvdmZpby9wY2kuYw0KPj4gKysrIGIvaHcvdmZpby9wY2ku
Yw0KPj4gQEAgLTMzOTcsNiArMzM5NywxMiBAQCBzdGF0aWMgdm9pZCB2ZmlvX3VzZXJfcGNpX3Jl
YWxpemUoUENJRGV2aWNlICpwZGV2LCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgIHByb3h5LT5m
bGFncyB8PSBWRklPX1BST1hZX1NFQ1VSRTsNCj4+ICAgICB9DQo+PiANCj4+ICsgICAgdmZpb191
c2VyX3ZhbGlkYXRlX3ZlcnNpb24odmJhc2VkZXYsICZlcnIpOw0KPj4gKyAgICBpZiAoZXJyICE9
IE5VTEwpIHsNCj4+ICsgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnIpOw0KPj4gKyAg
ICAgICAgZ290byBlcnJvcjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgIHZiYXNlZGV2LT5uYW1l
ID0gZ19zdHJkdXBfcHJpbnRmKCJWRklPIHVzZXIgPCVzPiIsIHVkZXYtPnNvY2tfbmFtZSk7DQo+
PiAgICAgdmJhc2VkZXYtPmRldiA9IERFVklDRSh2ZGV2KTsNCj4+ICAgICB2YmFzZWRldi0+ZmQg
PSAtMTsNCj4+IEBAIC0zNDA0LDYgKzM0MTAsOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX3VzZXJfcGNp
X3JlYWxpemUoUENJRGV2aWNlICpwZGV2LCBFcnJvciAqKmVycnApDQo+PiAgICAgdmJhc2VkZXYt
Pm5vX21tYXAgPSBmYWxzZTsNCj4+ICAgICB2YmFzZWRldi0+b3BzID0gJnZmaW9fdXNlcl9wY2lf
b3BzOw0KPj4gDQo+PiArZXJyb3I6DQo+IA0KPiBNaXNzaW5nIHJldHVybiBiZWZvcmUgZXJyb3Ig
bGFiZWw/IFdlIHNob3VsZG4ndCBkaXNjb25uZWN0IGluIHRoZQ0KPiBzdWNjZXNzIGNhc2UuDQo+
IA0KDQoJVGhlIHJldHVybiBlbmRlZCB1cCBpbiBhIGxhdGVyIHBhdGNoLg0KDQoNCg0KPj4gKyAg
ICB2ZmlvX3VzZXJfZGlzY29ubmVjdChwcm94eSk7DQo+PiArICAgIGVycm9yX3ByZXBlbmQoZXJy
cCwgVkZJT19NU0dfUFJFRklYLCB2ZGV2LT52YmFzZWRldi5uYW1lKTsNCj4+IH0NCj4+IA0KPj4g
c3RhdGljIHZvaWQgdmZpb191c2VyX2luc3RhbmNlX2ZpbmFsaXplKE9iamVjdCAqb2JqKQ0KPj4g
ZGlmZiAtLWdpdCBhL2h3L3ZmaW8vdXNlci5jIGIvaHcvdmZpby91c2VyLmMNCj4+IGluZGV4IDJm
Y2M3N2Q5OTcuLmU4OTQ2NGE1NzEgMTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL3VzZXIuYw0KPj4g
KysrIGIvaHcvdmZpby91c2VyLmMNCj4+IEBAIC0yMyw5ICsyMywxNiBAQA0KPj4gI2luY2x1ZGUg
ImlvL2NoYW5uZWwtc29ja2V0LmgiDQo+PiAjaW5jbHVkZSAiaW8vY2hhbm5lbC11dGlsLmgiDQo+
PiAjaW5jbHVkZSAic3lzZW11L2lvdGhyZWFkLmgiDQo+PiArI2luY2x1ZGUgInFhcGkvcW1wL3Fk
aWN0LmgiDQo+PiArI2luY2x1ZGUgInFhcGkvcW1wL3Fqc29uLmgiDQo+PiArI2luY2x1ZGUgInFh
cGkvcW1wL3FudWxsLmgiDQo+PiArI2luY2x1ZGUgInFhcGkvcW1wL3FzdHJpbmcuaCINCj4+ICsj
aW5jbHVkZSAicWFwaS9xbXAvcW51bS5oIg0KPj4gI2luY2x1ZGUgInVzZXIuaCINCj4+IA0KPj4g
c3RhdGljIHVpbnQ2NF90IG1heF94ZmVyX3NpemUgPSBWRklPX1VTRVJfREVGX01BWF9YRkVSOw0K
Pj4gK3N0YXRpYyB1aW50NjRfdCBtYXhfc2VuZF9mZHMgPSBWRklPX1VTRVJfREVGX01BWF9GRFM7
DQo+PiArc3RhdGljIGludCB3YWl0X3RpbWUgPSAxMDAwOyAgIC8qIHdhaXQgMSBzZWMgZm9yIHJl
cGxpZXMgKi8NCj4+IHN0YXRpYyBJT1RocmVhZCAqdmZpb191c2VyX2lvdGhyZWFkOw0KPj4gDQo+
PiBzdGF0aWMgdm9pZCB2ZmlvX3VzZXJfc2h1dGRvd24oVkZJT1Byb3h5ICpwcm94eSk7DQo+PiBA
QCAtMzQsNyArNDEsMTQgQEAgc3RhdGljIHZvaWQgdmZpb191c2VyX3NlbmRfbG9ja2VkKFZGSU9Q
cm94eSAqcHJveHksIFZGSU9Vc2VySGRyICptc2csDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVkZJT1VzZXJGRHMgKmZkcyk7DQo+PiBzdGF0aWMgdm9pZCB2ZmlvX3VzZXJf
c2VuZChWRklPUHJveHkgKnByb3h5LCBWRklPVXNlckhkciAqbXNnLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgVkZJT1VzZXJGRHMgKmZkcyk7DQo+PiArc3RhdGljIHZvaWQgdmZpb191
c2VyX3JlcXVlc3RfbXNnKFZGSU9Vc2VySGRyICpoZHIsIHVpbnQxNl90IGNtZCwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2l6ZSwgdWludDMyX3QgZmxh
Z3MpOw0KPj4gK3N0YXRpYyB2b2lkIHZmaW9fdXNlcl9zZW5kX3JlY3YoVkZJT1Byb3h5ICpwcm94
eSwgVkZJT1VzZXJIZHIgKm1zZywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFZGSU9Vc2VyRkRzICpmZHMsIGludCByc2l6ZSwgaW50IGZsYWdzKTsNCj4+IA0KPj4gKy8qIHZm
aW9fdXNlcl9zZW5kX3JlY3YgZmxhZ3MgKi8NCj4+ICsjZGVmaW5lIE5PV0FJVCAgICAgICAgICAw
eDEgIC8qIGRvIG5vdCB3YWl0IGZvciByZXBseSAqLw0KPj4gKyNkZWZpbmUgTk9JT0xPQ0sgICAg
ICAgIDB4MiAgLyogZG8gbm90IGRyb3AgaW9sb2NrICovDQo+IA0KPiBQbGVhc2UgdXNlICJCUUwi
LCBpdCdzIGEgd2lkZWx5IHVzZWQgdGVybSB3aGlsZSAiaW9sb2NrIiBpc24ndCB1c2VkOg0KPiBz
L0lPTE9DSy9CUUwvDQo+IA0KDQoJT0sNCg0KPj4gDQo+PiAvKg0KPj4gICogRnVuY3Rpb25zIGNh
bGxlZCBieSBtYWluLCBDUFUsIG9yIGlvdGhyZWFkIHRocmVhZHMNCj4+IEBAIC0zMzMsNiArMzQ3
LDc5IEBAIHN0YXRpYyB2b2lkIHZmaW9fdXNlcl9jYih2b2lkICpvcGFxdWUpDQo+PiAgKiBGdW5j
dGlvbnMgY2FsbGVkIGJ5IG1haW4gb3IgQ1BVIHRocmVhZHMNCj4+ICAqLw0KPj4gDQo+PiArc3Rh
dGljIHZvaWQgdmZpb191c2VyX3NlbmRfcmVjdihWRklPUHJveHkgKnByb3h5LCBWRklPVXNlckhk
ciAqbXNnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT1VzZXJGRHMg
KmZkcywgaW50IHJzaXplLCBpbnQgZmxhZ3MpDQo+PiArew0KPj4gKyAgICBWRklPVXNlclJlcGx5
ICpyZXBseTsNCj4+ICsgICAgYm9vbCBpb2xvY2sgPSAwOw0KPj4gKw0KPj4gKyAgICBpZiAobXNn
LT5mbGFncyAmIFZGSU9fVVNFUl9OT19SRVBMWSkgew0KPj4gKyAgICAgICAgZXJyb3JfcHJpbnRm
KCJ2ZmlvX3VzZXJfc2VuZF9yZWN2IG9uIGFzeW5jIG1lc3NhZ2VcbiIpOw0KPj4gKyAgICAgICAg
cmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFdlIG1heSBi
bG9jayBsYXRlciwgc28gdXNlIGEgcGVyLXByb3h5IGxvY2sgYW5kIGxldA0KPj4gKyAgICAgKiB0
aGUgaW90aHJlYWRzIHJ1biB3aGlsZSB3ZSBzbGVlcCB1bmxlc3MgdG9sZCBubyB0bw0KPiANCj4g
cy9uby9ub3QvDQoNCglPSw0KDQoNCj4gDQo+PiAraW50IHZmaW9fdXNlcl92YWxpZGF0ZV92ZXJz
aW9uKFZGSU9EZXZpY2UgKnZiYXNlZGV2LCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAgICBn
X2F1dG9mcmVlIFZGSU9Vc2VyVmVyc2lvbiAqbXNncDsNCj4+ICsgICAgR1N0cmluZyAqY2FwczsN
Cj4+ICsgICAgaW50IHNpemUsIGNhcGxlbjsNCj4+ICsNCj4+ICsgICAgY2FwcyA9IGNhcHNfanNv
bigpOw0KPj4gKyAgICBjYXBsZW4gPSBjYXBzLT5sZW4gKyAxOw0KPj4gKyAgICBzaXplID0gc2l6
ZW9mKCptc2dwKSArIGNhcGxlbjsNCj4+ICsgICAgbXNncCA9IGdfbWFsbG9jMChzaXplKTsNCj4+
ICsNCj4+ICsgICAgdmZpb191c2VyX3JlcXVlc3RfbXNnKCZtc2dwLT5oZHIsIFZGSU9fVVNFUl9W
RVJTSU9OLCBzaXplLCAwKTsNCj4+ICsgICAgbXNncC0+bWFqb3IgPSBWRklPX1VTRVJfTUFKT1Jf
VkVSOw0KPj4gKyAgICBtc2dwLT5taW5vciA9IFZGSU9fVVNFUl9NSU5PUl9WRVI7DQo+PiArICAg
IG1lbWNweSgmbXNncC0+Y2FwYWJpbGl0aWVzLCBjYXBzLT5zdHIsIGNhcGxlbik7DQo+PiArICAg
IGdfc3RyaW5nX2ZyZWUoY2FwcywgdHJ1ZSk7DQo+PiArDQo+PiArICAgIHZmaW9fdXNlcl9zZW5k
X3JlY3YodmJhc2VkZXYtPnByb3h5LCAmbXNncC0+aGRyLCBOVUxMLCAwLCAwKTsNCj4+ICsgICAg
aWYgKG1zZ3AtPmhkci5mbGFncyAmIFZGSU9fVVNFUl9FUlJPUikgew0KPj4gKyAgICAgICAgZXJy
b3Jfc2V0Z19lcnJubyhlcnJwLCBtc2dwLT5oZHIuZXJyb3JfcmVwbHksICJ2ZXJzaW9uIHJlcGx5
Iik7DQo+PiArICAgICAgICByZXR1cm4gLTE7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYg
KG1zZ3AtPm1ham9yICE9IFZGSU9fVVNFUl9NQUpPUl9WRVIgfHwNCj4+ICsgICAgICAgIG1zZ3At
Pm1pbm9yID4gVkZJT19VU0VSX01JTk9SX1ZFUikgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0Zyhl
cnJwLCAiaW5jb21wYXRpYmxlIHNlcnZlciB2ZXJzaW9uIik7DQo+PiArICAgICAgICByZXR1cm4g
LTE7DQo+PiArICAgIH0NCj4+ICsgICAgaWYgKGNhcHNfY2hlY2sobXNncC0+bWlub3IsIChjaGFy
ICopbXNncCArIHNpemVvZigqbXNncCksIGVycnApICE9IDApIHsNCj4gDQo+IFRoZSByZXBseSBp
cyB1bnRydXN0ZWQgc28gd2UgY2Fubm90IHRyZWF0IGl0IGFzIGEgTlVMLXRlcm1pbmF0ZWQgc3Ry
aW5nDQo+IHlldC4gVGhlIGZpbmFsIGJ5dGUgbXNncC0+Y2FwYWJpbGl0aWVzW10gbmVlZHMgdG8g
YmUgY2hlY2tlZCBmaXJzdC4NCj4gDQo+IFBsZWFzZSBiZSBjYXJlZnVsIGFib3V0IGlucHV0IHZh
bGlkYXRpb24sIEkgbWlnaHQgbWlzcyBzb21ldGhpbmcgc28gaXQncw0KPiBiZXN0IGlmIHlvdSBh
dWRpdCB0aGUgcGF0Y2hlcyB0b28uIFFFTVUgbXVzdCBub3QgdHJ1c3QgdGhlIGRldmljZQ0KPiBl
bXVsYXRpb24gcHJvY2VzcyBhbmQgdmljZSB2ZXJzYS4NCj4gDQoNCglUaGlzIG1lc3NhZ2UgaXMg
Y29uc3VtZWQgYnkgdmZpby11c2VyLCBzbyBJIGNhbiBjaGVjayBmb3IgdmFsaWQNCnJlcGxpZXMs
IGJ1dCBmb3IgbW9zdCBtZXNzYWdlcyB0aGlzIGNoZWNraW5nIHdpbGwgaGF2ZSB0byBiZSBkb25l
IGF0IGluDQp0aGUgVkZJTyBjb21tb24gb3IgYnVzLXNwZWNpZmljIGNvZGUsIGFzIHZmaW8tdXNl
ciBkb2Vuc+KAmXQga25vdyB2YWxpZA0KZGF0YSBmcm9tIGludmFsaWQuDQoNCgkJCQkJCQkJSkoN
Cg0KDQo+PiArICAgICAgICByZXR1cm4gLTE7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0
dXJuIDA7DQo+PiArfQ0KPj4gLS0gDQo+PiAyLjI1LjENCg0K

