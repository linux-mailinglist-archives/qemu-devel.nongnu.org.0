Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90F4900BA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:14:52 +0100 (CET)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JPv-0000cR-4W
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNh-0006eJ-HW
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:33 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:9442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNf-0003MA-D3
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:33 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GJKdlq007012;
 Sun, 16 Jan 2022 20:12:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=EHnrFjcuJCEm7lKnyuWSiM5iQzfUGnLK3az8ezOt+4o=;
 b=ux4V+4VJxHd3SOCiZBy+G+zO+bJ6bQjOTaVN4WrmO8qDnSlKjxMybn/L8zXy6lMUtDOw
 c1LOKwzgNTmPwgYtxqzGxLhquqZjoaq646jbeMIscVmEEfLzMmRJ6KQEmJqXuwTI709p
 uG806DWmPbp25XRQa7pAWjAAyJLdtac+qYcHXIGA8J5z41GYjaQyzbqqyZB7/98PAaGv
 /vp8vdCr4VKk4hbarczHzraXVCv7K4HndrtDLjShzp8Wgj/x5FJ4EEAMc3M32NqhMcuB
 zQBKjc4Y31HJJP9I/skKUVqQDmEIAH1gW8upAHWlJjrQZHQ2c4LwLessnR86whfdeQOg yA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkufw2heu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSq7HlfXQZQEfZ1H+5ktPzjHfV0B4QDbOkv9kyeavhHMLgD5SA50dQfRvxCWhtHfp+L+MnwmMIeXNGUnxK8fyp9vTio3cGNXXew5bDtI24UHLDsrVrNIdi0Ixz9YZ2FDM9s5XPvyAOXaNaXwnHrFqsPnEZO9dcpoI4n6up8Zqm8JNl8mjd+jRYOtDQu4WzgGnlq/dkEoOfc43B2ZHNgGI08z2kyzO3qJ3mkbDjvA6wk/XEzY1ql6XhKeYj9gd0Vs0nPkAxHPkXn+O2K7+Uhl4mHmdnNY+MI1UMIkxQxLypA2EDZqEPhcp4NypC+1aBHP9nmBqe4BrjWp3uKnLf1ZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHnrFjcuJCEm7lKnyuWSiM5iQzfUGnLK3az8ezOt+4o=;
 b=BzhciLaJWBehPoqXQlaONW75vzfZOQzG5dYHCgcnnqHetI/kceYSrEU0inZV32r0YfKLtjIYYgbip8uExlMdAanNIvnAnNfRksZqE1dwlvhLlPD1HeqSf0o0yLbqntqjMs7R4QpExpiuGilRGAca6FHAaS9TvJXKiejbsUUorsPQ1M6chC/9Q0ZBF+AE5axtdz68Ec7UpLYRLNk6tzmg8VLyEaEsGTcc+siJtISNbCTSGLRME77UJnCEIryfz0whYV7rtxBJoIi10jNdLPjAdZPCfybz4MFDoIgRD7Rs/y2dp7QjO5qTLNzCvNAFGGDSQOaiql4/DedhSLcRetbOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:24 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:24 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 0/6] Clean up error handling in libvhost-user memory mapping
Thread-Topic: [PATCH v3 0/6] Clean up error handling in libvhost-user memory
 mapping
Thread-Index: AQHYC1huy31Z8KbM3UOALQuSYiQOfQ==
Date: Mon, 17 Jan 2022 04:12:24 +0000
Message-ID: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c38c7ba8-5387-4e70-8079-08d9d96f90c6
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB80181C2CAD92E5AF9D4285BCEA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8dyMIvb8olEf/YUmFJ5YCFihYSlxIEVD99VVWVNbYAUrADLVieApCYRT0EoM5rUXZ087I2ysmYZs1+OrqPtgb6yQ4xLaQCOAHVREHH0LF3UUsDbH7K2dwvLqp8bJsQsKRVKtE7YuN2DAlvWijaJxsXWa+DcsLUHDxoK581QsrkRKIOwNy9ZWVqOxTHU/uhrXoWwAIckkQj+EI3fiBPEbN+wFZ1oeAXzd9QP48agkfgra3OICtPac5v4orAmAf351vddXqIMLWLZOOdoEf2HvcfnBLgCS0HQESba5lrtCCKiHzlefskFzvHxGEuuLKh0Q8aU1dGROubDLuXbJvZ0YDHkksw9lX6w2jUSWBsDwQIXudwu1x0Et1f0J6z2EFO7KBbF/FVVXX97AAKB9s5nw+32ozrsZRe1wSEbbHgC2cT4x0/7h29ds01W+BlR5+V08R9zz6V0DvBqevdTnTpp+6U++z9lm3Z6mU8HjaVWXkwIObhiLiGKNd+YaQDNYgb1VESIqHrmHBLxlVgpAxceOsDpX8VKc1P84Ujz4wFsgtFRc2/aApq5bhoZlKax1gxUDetmFTZbyV42OlS38IXXfLbWcJpJyDwhYmLOQOQ1mmqUnV9wsgByr9X6B1Y8HsB5RZuiJO01qfWaWzU9bbCrYviX8xW3Qb1JtuU5KDYB4vHpiLKfwIJ/FkBQrxysTkE6iLl9BNO98CwsmdE8yi8HhNA0wheqBuP5fTs8VOM4bEQBqw8+EPoyFjOdR56RjZuGngj6ASwrrptZjzvx0imxDCLYUU/L/wICnEfBOU9+OWni+3PX5Y3Ofnq4/oH7UCltQeIqjyMFj8juEwI4qnxQdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(966005)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3djMlkrMFpSZitkUWRIaGNPK0RjcWVEQzZmZXFMMmV4dVIyMHZqZ0lDbHNr?=
 =?utf-8?B?WEdqL0hzU0F4ZzUwQlMvNWRlNEh3NG5JbnF1TkdBQUhCTWFucTlwUFU0N0Zl?=
 =?utf-8?B?VnhIY09GREcxcmRuV0RjMmVnUVJ4MXNRWXVLTy84OTZJSjVIV3UzaUhyQk9y?=
 =?utf-8?B?ZjFaNjE0ak9yckJWbm90YjdPSGdCUTYvRmNvZFROK0hrRm5UaUtjejg0dnB0?=
 =?utf-8?B?TlJjVklKUzZVYkdMVU1EcXYxQ0lVbXE5blE2YXc1SjVmV29sUWt2RGprZ2NC?=
 =?utf-8?B?MnpXV1g5Q0doa3VuQnR6UXlIWTdmMzcvNVc1M2xwODNvRFU1QkMycEdnYllH?=
 =?utf-8?B?ZFk3TmJPZUlmbFE4a1p0djlVMkZvR2FESXRDMWh1NnpMR1pjVXdmd0FoMU83?=
 =?utf-8?B?L3NhWEN3S2x6TFlGejBZR2RlZjlmMU50OGtWL0t5SG93bHk4R3hQWHMxZmhD?=
 =?utf-8?B?ZHZBbEM3dU94WDU0UVMyVWNiR3FTemowZzRmWE81RkdOdnN5WGFWR1FGd3Vo?=
 =?utf-8?B?QUFJUnlnZWRERW9sMThweGpPYXJPOHBzNjZDc2xNcWNtRTBJK0RkcWF2ZkZq?=
 =?utf-8?B?REtaN2I5T2hvRXp4QmtjVGtOQlRJcXpVN28vT2IyeTZtODVBdUxiaU0rM0Zv?=
 =?utf-8?B?c2dIamtlVHdUR1NKR3BHMWdZRE9PNEZ3aC9xUTZVVlpKSWhseDlBaTdtNE0z?=
 =?utf-8?B?VDgxR2JxR1IrYzljWnNsRDEvZGFRRnNzSmhaSzk4dUdRSG1BT2xoNldqNWxa?=
 =?utf-8?B?bGtYaEkvK3NHVEhaTG90c1hjRVI1VGdINE81Y01aMTcwNUdIRGE2S012UGVI?=
 =?utf-8?B?VEtlRUR4NTVVSCtKVVNuZ0NlaTVCcXJ5WGRGRXlmWmFhNDk3TnVBVnllWkc5?=
 =?utf-8?B?SkRxdVVFMkFJRUYzdlA1bERkWFNJeHdiejFNZ1hlYXhIbXlLZWF1VlM2MElx?=
 =?utf-8?B?VFV1VWpGYUxUbGN6Z3o2aFR5R3laaUE4SXB1VG1JVFc3SjM2VSt3UGhmekV5?=
 =?utf-8?B?aHpBcS9LT29sWjZyYk1uelZLNUNzTERzc1I1OU5uSGExdHhiMm9iK1FhSjRj?=
 =?utf-8?B?MWlVOEdHa1l4SG1LdnRJcUFySzMvdktKbDRsd2g4OWxiNTdaWVJFbWJ6YWZi?=
 =?utf-8?B?WmhxMy8vZmVXYjhiUkZibjZqZW5sZ21hQXVQU01KZUFhL2tGanRkNk1RUC9o?=
 =?utf-8?B?VkpSWGZXMjgvdkR0ZUpqWWxzVG9UdWVqYWl5TXR4YTRzdkN0MG9CT0RjNXlj?=
 =?utf-8?B?Y2dpdGg1WHh3M09oNXBBbGtUOTZYbVo3c2JpRHRNNnVoc0RQS0ljcnl5OHN4?=
 =?utf-8?B?RXZNWmtvT2V2N2F2eUdGb2RYempTR1NiUVFpMWhCV1hINGdHU21TVjBGTzZX?=
 =?utf-8?B?OHlxZjUwNG9tcjVKUVd4UVV1SlVGQU5lOTZjVStZZkJLNTJMRk9jRCtvRjVV?=
 =?utf-8?B?VHRjWEdQQUtOck9LZG4ycXdVQ1ZVN1k1dHFyd1JSMTBoQVlPSG8vUTJmRWFI?=
 =?utf-8?B?NGRGTGQ5c1p2OXZ6a0wyZ3Z5clpUTlR3T3hVRFp0VWk0STBmMG1CQ2liKy9T?=
 =?utf-8?B?OGh0OGtOVmkxQWRwRXpEV0FLT0l1QzErVDBDa1R6SWNXS1VwZDgrL0E1KzE3?=
 =?utf-8?B?TXphcU5GVi9GM3BVVC9IbURtekdJdjV0WFFKbksrM2F3N2dmcmVTZmFEZFVm?=
 =?utf-8?B?Y2NTUWNPVHVKRGJaS04zT1p5eDV6WVBiS0ZYdUxScGdMaFNOYnk1eWNVT292?=
 =?utf-8?B?d09ZV3kvSGhRQjdzV1NBWGpQRmtpWXVieFIzODNvYjNZd1VqS1cvQ1V0d1ph?=
 =?utf-8?B?aGZScDFqdnloWU0vT3pwL3lMazdsRDZNa2ZWL2d0bFNjaCt1d0RjRnlUZ09w?=
 =?utf-8?B?UkpMcDZCWCtPK1o4emJocEdET3R4MmV1U2FBZWJ5RUE5bXlvMWpITHFnUFJn?=
 =?utf-8?B?c2JwdmZTRDJNa2Y4RjFrMnVlbkNlRmFNRzhXTE9MMlNkVStLYkJydERra3d2?=
 =?utf-8?B?ZDdhSGxkSVdqWUV5Z0FRbDRpV0hORE1UL01UUW9YbzJQQzJ5WEg0ODNDN3pQ?=
 =?utf-8?B?azVRQXdEc3Q5dWExSmhIWThGS0d1b2ZQV2xxYjVuZ1J0UEtkY296NGxzNUV1?=
 =?utf-8?B?cGUzUllZU2FJRVkyWVZFZlRUZWVWbFVxaHhUWmoxSVh3WGptbUhFcER4K3lL?=
 =?utf-8?B?UGRqYytpOXBweVFhQXdrSzgyLzVmUGptOWNQMFk0WTZuUkxZYUJWSVZVZ2tl?=
 =?utf-8?Q?uoYjffWsr6gGqHoRz5u0vdxdquF0SA4JcEa7IvK/Rs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78CCD3212068C44280CB60C7B274A87D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38c7ba8-5387-4e70-8079-08d9d96f90c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:24.2379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fw/KimsLQpBnnMx/5BUkMQQ3JvwWE+DPFftbTyCnwHaQSzlep022w7hX40U+Ad8/BZg7Y5gJc/BsBM9Pt29vBPaC+FXhq5UTOfSDUxKUziw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-GUID: JtlEXFEy8dZMjX_TQMhMcTkBsjtC4MzP
X-Proofpoint-ORIG-GUID: JtlEXFEy8dZMjX_TQMhMcTkBsjtC4MzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGV5IFN0ZWZhbiwgTWFyYy1BbmRyZSwgTVNULCBEYXZpZCAtDQoNCkFzIHByb21pc2VkIGhlcmUg
aXMgYSBzZXJpZXMgY2xlYW5pbmcgdXAgZXJyb3IgaGFuZGxpbmcgaW4gdGhlDQpsaWJ2aG9zdC11
c2VyIG1lbW9yeSBtYXBwaW5nIHBhdGguIE1vc3Qgb2YgdGhlc2UgY2xlYW51cHMgYXJlDQpzdHJh
aWdodGZvcndhcmQgYW5kIGhhdmUgYmVlbiBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCBp
biB0aHJlYWRzDQpbMV0gYW5kIFsyXS4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Fl
bXUtZGV2ZWwvMjAyMTEwMTgxNDMzMTkuR0ExMTAwNkByYXBoYWVsLWRlYmlhbi1kZXYvDQpbMl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC85MzkxZjUwMC03MGJlLTI2Y2YtYmNm
Yy01OTFkM2VlODRkNGVAcmVkaGF0LmNvbS8NCg0KQ2hhbmdlcyBzaW5jZSBWMToNCiAqIENoZWNr
cyBmb3IgYSBzaW5nbGUgZmQgdnVfYWRkX21lbV9yZWcgYW5kIHZ1X3JlbV9tZW1fcmVnIHJldHVy
biBmYWxzZQ0KICAgaW5zdGVhZCBvZiB0cnVlLg0KICogQ2hlY2sgZm9yIG92ZXItcnVubmluZyBt
YXggcmFtIHNsb3RzIGluIHZ1X2FkZF9tZW1fcmVnIHJldHVybnMgZmFsc2UNCiAgIGluc3RlYWQg
b2YgdHJ1ZS4NCiAqIHZ1X3JlbV9tZW1fcmVnIHVubWFwcyBhbGwgbWF0Y2hpbmcgcmVnaW9ucy4N
CiAqIERlY3JpbWVudCBpdGVyYXRvciB2YXJpYWJsZSB3aGVuIGxvb3BpbmcgdGhyb3VnaCByZWdp
b25zIGluDQogICB2dV9yZW1fbWVtX3JlZyB0byBlbnN1cmUgbWF0Y2hpbmcgcmVnaW9ucyBhcmVu
4oCZdCBtaXNzZWQuDQoNCkNoYW5nZXMgc2luY2UgVjI6DQogKiBGaXhlZCBGRCBsZWFrcyBvbiBh
bGwgaW5wdXQgdmFsaWRhdGlvbiBmYWlsdXJlcw0KICogQWRkZWQgY29tbWVudCBEYXZpZCBzdWdn
ZXN0ZWQgdG8gZXhwbGFpbiByZW1vdmluZyBkdXBsaWNhdGUgcmVnaW9ucw0KICogQWRkZWQgRGF2
aWTigJlzIHBhdGNoIHRvIGNsb3NlIG1lc3NhZ2UgRkRzIG9uIFZIT1NUX1VTRVJfUkVNX01FTV9S
RUcNCiAqIEV4cGFuZGVkIGNvbW1pdCBtZXNzYWdlIGZvciBwYXRjaGVzIGNoZWNraW5nIEZEIG51
bWJlcnMNCiAqIEZpeGVkIHZtc2ctPnNpemUgPD0gc2l6ZW9mKHZtc2ctPnBheWxvYWQubWVtcmVn
KSB2YWxpZGF0aW9uIGNoZWNrDQogKiBJbXByb3ZlZCBlcnJvciBtZXNzYWdlIHdoZW4gYSBiYWNr
ZW5kIGhhcyBubyBmcmVlIHNsb3RzDQogKiBJbXByb3ZlZCBlcnJvciBtZXNzYWdlcyB3aGVuIHRo
ZSBiYWNrZW5kIHJlY2VpdmVzIGludmFsaWQgdm1zZy0+ZmRfbnVtDQogICBhbmQvb3Igdm1lZy0+
c2l6ZQ0KDQpEcm9wcGVkIFItYiB0YWdzIGR1ZSB0byBub24tdHJpdmlhbCBjaGFuZ2VzLg0KDQpU
aGFua3MsDQpSYXBoYWVsDQoNCkRhdmlkIEhpbGRlbmJyYW5kICgyKToNCiAgbGlidmhvc3QtdXNl
cjogU2ltcGxpZnkgVkhPU1RfVVNFUl9SRU1fTUVNX1JFRw0KICBsaWJ2aG9zdC11c2VyOiBmaXgg
VkhPU1RfVVNFUl9SRU1fTUVNX1JFRyBub3QgY2xvc2luZyB0aGUgZmQNCg0KUmFwaGFlbCBOb3J3
aXR6ICg0KToNCiAgbGlidmhvc3QtdXNlcjogQWRkIHZ1X3JlbV9tZW1fcmVnIGlucHV0IHZhbGlk
YXRpb24NCiAgbGlidmhvc3QtdXNlcjogQWRkIHZ1X2FkZF9tZW1fcmVnIGlucHV0IHZhbGlkYXRp
b24NCiAgbGlidmhvc3QtdXNlcjogcHJldmVudCBvdmVyLXJ1bm5pbmcgbWF4IFJBTSBzbG90cw0K
ICBsaWJ2aG9zdC11c2VyOiBoYW5kbGUgcmVtb3ZhbCBvZiBpZGVudGljYWwgcmVnaW9ucw0KDQog
c3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmMgfCA3NiArKysrKysrKysr
KysrKysrKystLS0tLQ0KIHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5o
IHwgIDIgKw0KIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pDQoNCi0tIA0KMi4yMC4xDQo=

