Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0BC3B20AD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:56:38 +0200 (CEST)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw83A-0000RJ-5B
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw80r-0008Aa-N4
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:54:13 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:64370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw80p-0004IX-W0
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 14:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624474451; x=1625079251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pPSJFMQHP9EIAUfvr02OpYH4DX3v0E4SW7shddCBGVE=;
 b=0pPeMQAJgK4k9/aHMmaAlenQSYO10PF0lY1Jo32WGSOjAemTdbCDt5OV
 xE07BRBNMJGXHOv/XjYGVeeEYqQyk5DgJqdMhiIfIIc1fL1tQT513olYD
 vc0WKU+g+pPE4B/Y09xG2dnyyvq/no/hySILqtgsiJFSxECviOY7wfKAq 4=;
IronPort-SDR: kcW5P0rkNPoBVArP8r42GZ50FhcYB5vHd7i4HHJ6rMDZV2azt7GOfEZXVJjXXpFzciae86NX76
 zk9ljb/013ZPy61lQJXOsxqnuPzmD3BZ0b3nseMI2RDCDBoGUyUUZ7shjAVhXLg6QFP8/N4LGj
 PUlgdidxHSHbRjyZJEIrTYYrIcO+IGeoDv44fEs4/uS8uI8kTJhQdqmwI/MDJNuFjTfNN0yheZ
 f3NDnuv/Lbs8vIeRk47WGZ/DdQUgb6CHsyIR2QHefRsD6q/vtvK6XoVePDrKRxgfgv6j5Pv6Nl
 jMI=
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 18:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDcxxxFOqj5ZJTiBnLeXT/9k6qW3S4RsjNMyWDmqRFogz36UzpPqectOgqpXzwjxnq3RGXzXtdq45w+nkp46MYBk84MdSWCKGzZ/1RS4VgnEi9e+36WQCieQIKaR+RtPqPeQTNdvrWv5rjz/o8iwnf4/rSpmJlyOrE+37O6LWq2V6eIs92N9653beuuw4hDUNNbdgcFUiE20v+9jKxrrw63Dzn6thDnQ8XzqwRUG2IaNwXBmUaIxTEQvdTvwbmn3wzHHK3lqJztzsGSeogs9hWmlMw/FIyjqJTjJzztYumwMTvGUoHDeMnzG2l7qluASZr/O/AaQe8+81S77PrpLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5SY7Ltldl9r/RSI2t4dmN/dtqR092qkev7Hx4jT/AQ=;
 b=cJ5kQMVVwmN60qHNR075syhtqGo82f4IxC1Av+s7r5ZLCHT+Z+naqVsho3zVZV6+rH9uq9eYZK4NHU7j6/zveZeS+tB3pDgOTDEKoyfuQNTpjy0RSRrrWFSftPqm/DgXR4f5nH249J33xxqpCb77p6Sf5XWm1vFHxeD2zozcPD5qxowVk6zrVSfhmtdVahoo+Q6Krw9wTdGsjtaIeHuX0ykdV+rrvhg0v+bRWvn1AHpD3gmx+kAfN/64TEJEDEzSI66RK3SQQbBFr1I5vylMfc/M/1te9yCA3SWgjBmDSLHvtv45XUqMPpUoIyhAGOyqJ1gcCbzAP42ik/KtAwprSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7231.namprd02.prod.outlook.com (2603:10b6:a03:299::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 18:54:08 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 18:54:08 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 07/14] target/hexagon: expose next PC in DisasContext
Thread-Topic: [PATCH v5 07/14] target/hexagon: expose next PC in DisasContext
Thread-Index: AQHXZO7Ebyk1CPoGmEK4YOADZkHBmKsh9ztQ
Date: Wed, 23 Jun 2021 18:54:08 +0000
Message-ID: <BYAPR02MB488629938462D68661A5EFB1DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-8-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-8-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6556e4b-6b62-4298-1ef3-08d936784815
x-ms-traffictypediagnostic: SJ0PR02MB7231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7231BF17974C53E5625B4600DE089@SJ0PR02MB7231.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: amccitiupHi6nx4nQ214i/lZf0qmDKWVDHlTa0m+ySSqfPbF3nnueGG1rij5ihMXikvCwoJO912NLiJ6xW8rO//x2gEbI1m+e3X0uMAOPhuWB6ATzRXlCtPlZxITpKy1E/vqmGE+ULq1cNOR0Fs4aseljxFQylufBvxY52Hh8lbvUrTmAdUETJ4zDPaFt0XRnySBS7czf+ZKRF6cmz3pJSfsddKqfU4xFL7dUEcM7dysP54njcEYth1qwALqQnjTM95Wk+2Ip9QdJeuo74ZcJAKZXRF0nELf46lGj1woX2YAIbpT2pwJpKcBQrNkbR42wRDdJ9nzOdfQmCUYC32GZ1DkvBs3woA+cBlXP+JdnjW77/xQtVend1Uhx1QtpuYpD7UxeQST2YWjy1h2ovgf18cIzRryk5+pYLiDThI2WEF156DNJ4IAzpdNBVhf129bP+yYF0uo0d/TvzT61+UoWZcrEudT/9QAGgKOyRPiur3kc1xeAnaxdDvSSe9aNKbszFL3JYlk91GNOfm2SqR3rxXfcB8ZRK2PRRDzBcBpIEMOlPFqQCWkXvG8hZlrCOyq3cocFVMVgq7mSdDlPO9ugecRiH1g+7D6sJqzeYOojYHirRnLZp/7tiyvC8xXi305vufh4GKoQaro2E7GqGlLXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(316002)(76116006)(66476007)(54906003)(4326008)(66556008)(64756008)(66446008)(66946007)(7696005)(110136005)(71200400001)(4744005)(2906002)(38100700002)(122000001)(5660300002)(478600001)(86362001)(52536014)(186003)(55016002)(9686003)(83380400001)(26005)(8676002)(33656002)(53546011)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nrZntFSclVhL3zcJ4QvBPgDMlvu3VPB9qcZosS9eycdLT7auQAw6ev8IRYNv?=
 =?us-ascii?Q?C/MT467tTL42Dy551IPOfHJUkGYVWGD67wxPDrEVrIyKZTbhM7Lbnt3BMMw5?=
 =?us-ascii?Q?sP3cIHkTwdU4lZPZIHZ8H0lPWkWnwI60gszm3dQu2a1fA2OVEpeZBvq7RNSD?=
 =?us-ascii?Q?UJI6+DT9Mp0IyTQJ/SP4dBTZWQYT7mruV/ig9+y9VP/At19dxsCmy+Qs40Wu?=
 =?us-ascii?Q?knMWxRKQWe9aWuOzL7UfcS9zZZJj+6cTtTck8WE0eNWY5+PitprYrDglXc+X?=
 =?us-ascii?Q?IC+HhtoFembMd+/y8Y6uM9gE35T1gOw00lnEAN12kdSeQv2k/62ZhfQkmffU?=
 =?us-ascii?Q?4Wz8+BZqEZgKYrGaThRAbeAtMKRICAIFsWu1E7rvid5JzOa7Lfn+iAopVuld?=
 =?us-ascii?Q?k/l5xaXQNR6wR8x++6xTRNG5W9LaoVQnsPXlzXSh1+Hz+/ilwllOUoQJRdMG?=
 =?us-ascii?Q?ZV2s1ua5/zH6z+r5/WfmWCAbOntMx5iX5H39sPBC1Ndi0VtzaRXY71jEI7o2?=
 =?us-ascii?Q?ztTTpQ+VO0MRZD/qjjanKThwgLBFNrlnI78TQtaFVbkxw8hR+8EHfLQXa6sM?=
 =?us-ascii?Q?1gyEKXXkvKxw0SzTF/6OAiNd6tf+STWoRyybIYQU0K9zekiU7Jgbnz3i6TJO?=
 =?us-ascii?Q?iuRqwAVUlD4AMpZuwwjisIC9O4ZVAaTo7iyHsJMF2nhdf0IwM8M9IhhI4PiH?=
 =?us-ascii?Q?2N2tcGIpTohwN9fCt4qYiIa93tEXh5gfkuSmkdVEPqTHxPJD3mIB82Sjdls/?=
 =?us-ascii?Q?I+90ic8drEWqzhwborQwIv66Vtt9AjaONGqOoi83uUBSdFf7TqIlri3UF13X?=
 =?us-ascii?Q?7pzKdKtYA4dd7ULpV/ZhoGPtE+LqTvaOEVISrYkjxBF+2tFBKMytCoGCN3IA?=
 =?us-ascii?Q?htPgE+wdrbS7F4PyPE4Ki7s667PU1Zoc1dsSLd5aqOkc6UTRuStaRTZTPV2N?=
 =?us-ascii?Q?XJh1DOMbgaUEHPsp2W6dzfNaTJrvsgiVn4vRijwZPPPZ74i+B4sR5ccCxNVG?=
 =?us-ascii?Q?cACPEV5U6HzOwMzgJ8S/MLzGBxhA+Pz6OZ7bhuFv0hZMvXcaBpFs263vJl5B?=
 =?us-ascii?Q?jt57brAKMWI8nu64fhh/f4Ygn8bFE+LvnmErRfgygFo2uvsiZD63vkDYEiI3?=
 =?us-ascii?Q?5/+mMtIsFFWkpKONyFSwazGF6HCxPPTXKfyfwwZlLsco7+TqkwvP3i/fTrcF?=
 =?us-ascii?Q?xkZhiJVS0XNT8OT4q5MG2dnW4QE9PLeyYg3N8mS8/zu8k9FtlM5TYYLt91Kt?=
 =?us-ascii?Q?DtmfpJ030H8xr0zeWKdbOBvkz6IcIWPt/Aj7ebUoalih3cpN7XrSn5EZwWZI?=
 =?us-ascii?Q?qAF5vML00c5z47NGI9z7OStg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6556e4b-6b62-4298-1ef3-08d936784815
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 18:54:08.1615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUxiBqBVSc208S3MxZ3JSmSpPl2eGsqHA7C0vlwodGBdgmat6XT+SJssYH6Klm8+DsZVwMbL+4yQW7fp0EmIxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7231
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Saturday, June 19, 2021 3:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v5 07/14] target/hexagon: expose next PC in DisasContext
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/translate.c | 3 ++-
>  target/hexagon/translate.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

