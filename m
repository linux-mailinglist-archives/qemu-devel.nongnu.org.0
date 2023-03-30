Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B76CFE2E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:24:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phnZ8-0002n9-9X; Thu, 30 Mar 2023 04:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jychena@ambarella.com>)
 id 1phnZ6-0002mc-34
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:23:24 -0400
Received: from mx0a-00622301.pphosted.com ([205.220.163.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jychena@ambarella.com>)
 id 1phnZ4-0004O4-40
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:23:23 -0400
Received: from pps.filterd (m0241924.ppops.net [127.0.0.1])
 by mx0a-00622301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32U6HmZ2018660
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 01:23:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version;
 s=com20210415pp; bh=HUSdeVUfFAnMYM/xcXJ/Z8ELjV5gTDa2X7roAo7uQ58=;
 b=ErV7CqSvvVEZekd/eQxDMggzBU6wm67CD4Ag31GIGeg0Vj/nPFuJOCSmFdgpunV7SVWZ
 ueEoabtnm+N8PTkD3S1jgEh7nctZYKEZx2114HlI4L1W/fvTQPbaBR8J7bop/wWAIPtY
 YD0QS0gABD30JL21BwlGpQ29K6MRNdvXxv/Gsh3XXSHAclTDQCpfFPMQiV3sFGsuKb5g
 UlgOITI3NhnsBNJymyM6XbrLVy+2dgG87vbNMVxxhxea39L/ok1p8USfkCLoNURfspHu
 Z6Pijrz3fpOYvhyeOe4kBePBWnp6hM2phSLwkGT52ckv+0D22wPFzpyWyL8YgNtfqSXC 9g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 3phwxh2cdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 01:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqm7Lxo62GtA9V6ZvSi+TAReIcuB+YkE4lo3ecDPoKjTp6VYHRcrleXmGkywSuEn+M42c7TQr3p7yitpNChNFnJK95B0PLfZZojDyYW/JInEPlakcCqDh5+cCy8+YHL2MGGE0VoccQ4aVR27MXcvtxXwhOMaoEX/uJ3mhYENqT+iwbM+HLacj+Z4N8NEtIC3w7e/lZKCkxMRCkIGMjGKDfTJI6pzUMLt3VHUP+MdtVOuwIpy0n/oWJIriy8G8G7iZh9wjTrexa3ido5bFLBENor2cNXEF+mi0Dg19PcAaCqXAX50U8KQynVOSkixnOYWvr/jO4fjZhkFSSSvhAprCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7t2ASLeLWCIqU116ywwQqqBxglFnB1dFfD6cAFdT/I=;
 b=AremvCm8VW4MIQuW+J6rAcnxOCB1nFjwgyuR0kTb0J7RYg4QYHjCQyKzMu54/ayPaJE0XEiRsVuqVCpTyLWmwMjde3gwgdgC6GBGgbiLQa5aXAZ8KDxvtLzE+7Wqqntuxn/NxzJkGwDpR+wUnD5J0fzRzp1CSYkMqzrZwVMYCT9HWG1/ekPHkaWNmTqruEtEITu/9uHbGRcjWAmgn2LHVd6XVCEGxtopAuhUH/qNSJdeBQ6kf/ivjmH+ziznDxgnx1y8JVUzK4vMXdROVO/eRgyFHYnsWEazG2Ayk0Dr+iNA7ISmEmExMAuJsx5p8/VqOFwYAKf912BquuAHObJogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ambarella.com; dmarc=pass action=none
 header.from=ambarella.com; dkim=pass header.d=ambarella.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7t2ASLeLWCIqU116ywwQqqBxglFnB1dFfD6cAFdT/I=;
 b=ZGhh8E7t+79I7KP80T3y2/QM1QWN9hWKLAgnvWT8rD/MFCOHNkqog6NamGTeQZkO47QAjEDnVBi9+6/M3ZKY4HZ5wIqduWphk1llDYWzyHH7V9rNlY3KMmMoLOWIwJj6rqGkViCd3i0pNlcQt+pTkBtUbrOD1UAMukxibneaqOQGwEEJXs1wYbpsg6ahwMR8FCGZL42i+wYOYVH027pSYOO5t1aRiY2yxfrhYadXgcoG2bDbKtvqQjziPcb1CjZT/drlJyuGJ59cqnAVdnSzexZQd1ich8ms0fvMSBjutMRe7D5hTW6UQIuYC7TknHQ5ql8aidyylc6jxCQLsGSq9Q==
Received: from PH0PR19MB5473.namprd19.prod.outlook.com (2603:10b6:510:fc::6)
 by SN7PR19MB7471.namprd19.prod.outlook.com (2603:10b6:806:32a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 08:23:13 +0000
Received: from PH0PR19MB5473.namprd19.prod.outlook.com
 ([fe80::c97d:aeeb:a6d:6146]) by PH0PR19MB5473.namprd19.prod.outlook.com
 ([fe80::c97d:aeeb:a6d:6146%7]) with mapi id 15.20.6086.019; Thu, 30 Mar 2023
 08:23:13 +0000
From: "Joe (Jun-Yan) Chen" <jychena@ambarella.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: QEMU's slow dnf makecache process
Thread-Topic: QEMU's slow dnf makecache process
Thread-Index: AQHZYt66EhMBdM7xzEC9IOYUvNOT7Q==
Date: Thu, 30 Mar 2023 08:23:13 +0000
Message-ID: <PH0PR19MB5473482BF830D24CCE5FEE19BE8E9@PH0PR19MB5473.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5473:EE_|SN7PR19MB7471:EE_
x-ms-office365-filtering-correlation-id: 716d0261-ac93-4a84-65b6-08db30f80113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V9bvv38WTz5/0C62MksHj2r7tFD26ux5ubPDt1DJSwlBOrU7kd5N/6GCWecTkHSLi03spslhxOm8vAm9/gBQa68ZsIY9z0L3tCOcuTuQZTH6vXY9NgyzBtpBp4ewdHUjNBebyqvrXTqX8fPcc7rQFl3OnhDERl7eoRR0oKitTpU5yfzblKGyXsqHPcQluPgjnm/pKOoXJg6+/m7WXMlnponuz+E4qV9rvYAAusl4ErGggg1g32PlhgcJUf3Y9b4IVfmuxLN1FfinQp32gwjDubwnfXgV/DoSaSP+um0ufM2wlUC23gyQ6xeiqg22z6XwfXzsNV28JDjnOq/C5Jjj9tV9LicA9g+81DtPNUkKOHLSXUPIcIh9G63OwCv+sIjoWIrHSp/55VbBGLmcPb91p/7J41Z9By3XyQmBNnLhi6TL1kvNVRWz6gDenQu87bo/R7pyEH2XTURpN4ui9z3dyI7cCJ4eqaZDOfgj8jYLH0un7KO7vGp06OuoZCi8N8++u4zlXfYLMV5xb8HrnVDq8vFuNBkOT7UmwhF/JjJilOPk7Uh6BiUs5QiRgs3PhdQkF0KfSVZ9Idimm/62QkEd+qj4Bo4mwn68XpNxIKLHhxdamaib4EQwCbMveV6Pqbol
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR19MB5473.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39850400004)(396003)(136003)(451199021)(33656002)(478600001)(6506007)(7696005)(26005)(19627405001)(9686003)(8676002)(66556008)(66476007)(91956017)(64756008)(76116006)(6916009)(66446008)(316002)(86362001)(71200400001)(186003)(66946007)(38070700005)(41300700001)(38100700002)(55016003)(8936002)(5660300002)(83380400001)(52536014)(122000001)(4744005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?s3TxWCMynijHsy6jcd9lyXXvhEUTej5Ou7fwaBUQlLZAxJmSOdr+vtqSHe?=
 =?iso-8859-1?Q?tAKpPWrnrcz9jgkD5EE8PHnzP9JninhhStUETYPdv9Ua4R/GPdBGiWxrBj?=
 =?iso-8859-1?Q?RCF87AlHLt3Y2xxIR+UNVgY7sn2cKN0lGPF8DZhCGxTwqSLzblyo15rnGz?=
 =?iso-8859-1?Q?cqutxUc6MecUyfyMzL3Lf7DCpvbHvtM0LdUBOWHDuh1zjLjqPw9pT/uyVv?=
 =?iso-8859-1?Q?jTqcY+72i07wSiNMMGVcI45pwFi2fxUyTgIf4o97eWhUA9em+ZxWWS7jEb?=
 =?iso-8859-1?Q?OhMTgOIbvQ6xQOMmwf4e7aHYXh8u8Py8Ahk0P0rgzaQ894z/vuwRq6ujVM?=
 =?iso-8859-1?Q?hle6lN0imVTn0iYRCYtMPgo3yxkgddPlKJW/Dx/Jn6dbHiNT5OLi4qgOc1?=
 =?iso-8859-1?Q?L8F37/GBb951okFzEVZEIu029W6ocriiG8DKmIY3U5w6t9Z8bdPG20iMij?=
 =?iso-8859-1?Q?IRvD107qdl5ODP4SJUQYUdr+85LGW7r0AvyPjWwoadeRn4BlOpfWL3jSj6?=
 =?iso-8859-1?Q?DK06tW3OoxfeW6Dlx9FHtXvD0RoDjkzliOtWjhXzFXuWVrciQ1Ux/fqq7b?=
 =?iso-8859-1?Q?3vXeCUwzfWLXK3bSKP3Q0K7XUMh3dZ+dNmD0kaY3/pcAajJnsRCbQSWNUa?=
 =?iso-8859-1?Q?v1eOpIq5gS4UFRndGOGfDpNZl4xcu3dMQkQnI308fdC18TErsS7+hdOd0/?=
 =?iso-8859-1?Q?O7IZx83wH7hULUWflLDy8mxhCsHt5H0QEXGH+b0u4m+tybGJMHbeaVbVqm?=
 =?iso-8859-1?Q?bRHG8q8/fvd8taio/FNU6KwPCfWrXmmxP0Q0u0yHx9KhRrbCZ9b07nOYWO?=
 =?iso-8859-1?Q?s6mFoxv2vqeu6+SqOC0O/Q6c2xN1oPx0Qzn9EkDDjKAGkF86Lrre0L0Dm3?=
 =?iso-8859-1?Q?jGryfTvm2EQMFePtbINMU94NUH37b+fLXbquekl/VogFNIzpsboDwHQcSY?=
 =?iso-8859-1?Q?qvZlePg5pNbC9yKClcDe5L29nV5yZhtT+2vVSJB+Gj+8w5RCUm5lQWh3A6?=
 =?iso-8859-1?Q?F5AtwNkLYu6qs+4/GaM2GJMTboWLnSe4tfN9IUc380lIDheCDJfQtr62mp?=
 =?iso-8859-1?Q?WkxFCRMtgU2zkCNTIQh6N418G1Y6paFM1OBUB56l9e+OAhJkNcSK387ifJ?=
 =?iso-8859-1?Q?WS5nxK0nZ0bM8CNI9oaH0iQAt8CML8zuEre7FtzIc9MK/ST5nIcINC8iOr?=
 =?iso-8859-1?Q?XaNhUZJlHSgMR2CKFXtPnmya4Q4vr/Kpi4zTZiXIpUJiUxnWLkqiUUkjPj?=
 =?iso-8859-1?Q?h6GaDjk3Bs88cy6ZsPHKnS4DAlt7CrBN6y2N0Hrx++nUodv2SuPL1ckL37?=
 =?iso-8859-1?Q?hJVPg1FXq0e/N39NO9LbnBXhcViq+BO1ww+YIdUDvr9VxO6GkclvqcIjmU?=
 =?iso-8859-1?Q?W3t/Sh8OiVNdANLAJm4u+7NX3GiyNkrd6ylpFr4++mYaKzqub1kRDVBNEj?=
 =?iso-8859-1?Q?jqdesm/l5b80LcAmnfjI9BmI/x+cr+nWrezUGDPyx+6dLlC8G0PghBIsIu?=
 =?iso-8859-1?Q?763uN4NUKapt4U8AEulKNWSEhBcNm54jdZR0HN18Q4N4dWz1MxKnP2UjXx?=
 =?iso-8859-1?Q?ZECyAP4PMhfOZDjtGS2bepRx3z8j2sSILUNBkyaNud4s3WeYOvXKjc/Srg?=
 =?iso-8859-1?Q?KNGyx9ee5Ir7BsppFmeNQa11DXgtUa7Cm2?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR19MB5473482BF830D24CCE5FEE19BE8E9PH0PR19MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: ambarella.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5473.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716d0261-ac93-4a84-65b6-08db30f80113
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 08:23:13.0503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3ccd3c8d-5f7c-4eb4-ae6f-32d8c106402c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Q8I7JrJKuK+CVGlluHQaLtCQXVT5zQ550FQmw8hygt1md3ckeuGGYQ2MLBIrCrS1Sv3x85KinTZTD3Zr4oRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7471
X-Proofpoint-ORIG-GUID: aoY7XlFisQ1nFTV1XskkF3GIguP3qKut
X-Proofpoint-GUID: aoY7XlFisQ1nFTV1XskkF3GIguP3qKut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_04,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=339 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300067
Received-SPF: pass client-ip=205.220.163.205;
 envelope-from=jychena@ambarella.com; helo=mx0a-00622301.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_PH0PR19MB5473482BF830D24CCE5FEE19BE8E9PH0PR19MB5473namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dear QEMU development Team,

I am using qemu(aarch64, TCG) on X86 server as Kojibuilder(buildfarm), howe=
ver I found that whenever QEMU download something in new buildroot, it will=
 costs a lot of time in "$dnf makecache" process,(last 7minutes after metad=
ata had been downloaded). I tested that the netio and diskio are not the bo=
ttleneck, but the CPU usage is always 100% during this period, and I strace=
d this process(dnf makecache), there's lots of "read()" "write()" "map()" f=
unctions had been called.

Is there any method to speed up the process of "$dnf makecache" after the m=
etadata has been downloaded?

Or am I missing something?

I am looking forward your expertise.

Joe

**********************************************************************
This email and attachments contain Ambarella Proprietary and/or Confidentia=
l Information and is intended solely for the use of the individual(s) to wh=
om it is addressed. Any unauthorized review, use, disclosure, distribute, c=
opy, or print is prohibited. If you are not an intended recipient, please c=
ontact the sender by reply email and destroy all copies of the original mes=
sage. Thank you.

--_000_PH0PR19MB5473482BF830D24CCE5FEE19BE8E9PH0PR19MB5473namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="iso-8859-1"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
Dear QEMU development Team,</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
I am using qemu(aarch64, TCG) on X86 server as Kojibuilder(buildfarm), howe=
ver I found that whenever QEMU download something in new buildroot,
<u><b>it will costs a lot of time in &quot;$dnf makecache&quot; process,(la=
st 7minutes after metadata had been downloaded)</b></u>. I tested that the =
netio and diskio are not the bottleneck, but the CPU usage is always 100% d=
uring this period, and I straced this process(dnf
 makecache), there's lots of &quot;read()&quot; &quot;write()&quot; &quot;m=
ap()&quot; functions had been called.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
Is there any method to speed up the process of &quot;$dnf makecache&quot; a=
fter the metadata has been downloaded?
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
Or am I missing something?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
I am looking forward your expertise.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; -=
-darkreader-inline-color: #ffffff; --darkreader-inline-bgcolor: #16191a; co=
lor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" data-darkreader-i=
nline-color=3D"" data-darkreader-inline-bgcolor=3D"" class=3D"elementToProo=
f">
Joe<br>
</div>

<HR>This email and attachments contain Ambarella Proprietary and/or Confide=
ntial Information and is intended solely for the use of the individual(s) t=
o whom it is addressed. Any unauthorized review, use, disclosure, distribut=
e, copy, or print is prohibited. If you are not an intended recipient, plea=
se contact the sender by reply email and destroy all copies of the original=
 message. Thank you.<BR>
</body>
</html>

--_000_PH0PR19MB5473482BF830D24CCE5FEE19BE8E9PH0PR19MB5473namp_--

