Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3D629EC4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:18:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouycR-0006V9-DY; Tue, 15 Nov 2022 11:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ouycF-0006TT-Io
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:16:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ouycD-0007Fu-Mj
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:16:51 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFD9J86000410; Tue, 15 Nov 2022 16:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=sllV+0SLvTmjdjC/63vimOjJ2nqSetpFJmDjXMIfKTE=;
 b=k6JSktp2yiVPZU01PJWmwDFFp57Aps5a+q99HynsRqljZSybxU/mxUDyaB5LQNsgEPzT
 QNcptlvODukl9xoKcn3MfAkVUzzax7FcA8MxG3E5tY3PHFlhVKYxdD9iILZqmiD41fQL
 9Jw4u3CNdohl+z8xhwmiP5zL4CAApl/WlkfuUs6d3GDW1kw5vAajKaIiLpAdsEuQyp/0
 yKUoBvyifHNwYtL3cLhclQL4w0Q9ULmk8+y+nYRHlO41PyQTSnz9FK/ewGcqAvaH2MKG
 wRKo81EA11GNbJvfi0cDcbSZtFBRW/H+YhFlcieq9F6XIvb59KnKqTYF5X9lty61Bs9+ sQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kv33ej1v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 16:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apyGLX0BYRpJnz36BP9FuN1HvCiPB/6j+iTg52r8c06jbI5/EdbpXzkih1seU1U9BuUYk7z/r5yexUTf/SVdvcsmZubHrxuDetnBR8EPblm4qLLHTgnAC8ZvzYrJQa4tNh6pa5x59JcfC4VK9sKfIiuAtWXyqgNpHd+3NVAgjI6+8xKcUgfWfQTyZx5LSj4zKfFAtdWMqSXYXOINTCZltGqWPcr2yCKJRwjPFeIsxZOTdrgZILKEEE6c5Ccd0Rsqi5YzKCPO3krMy/sL47MtrICNcXZ1Hxj4qbXaL+3U8TmHZkZJdHmaYRx4JpYwodhFhVL+/U8x+o0micY3kSDQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sllV+0SLvTmjdjC/63vimOjJ2nqSetpFJmDjXMIfKTE=;
 b=VJhIoVtq9XKdtdEmctRAO6QVVmMjzT/4aqutoEio6YCIv6vsrQ+0P1Dg3995Ttft7GCDpNRHov7Bfvr0oKjtU4B2aSGJLMNOFNGGJ3FtrrifCZ3AoIsDX/+pYd8BhQFvO1V38x/Gi6ehe5Wgev+L8Y3df+JTyi/41TuMpV9Yotxwn2wyx11rQVVqEX8EUYmVvEe+xK2ZZFrs4i5Q6pJqFKJlRujRbGQfCh34EQ4DGVXcZo2IGiGSlLiiey48e4LqrkRtvtBo3tqLw4S4BEDM9f+hUXR1m9LVFS20yIWZdoFWZZJ8iBvsaj1ss2AaQO47WFbWOYI8/kIO9XBLdrAAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA2PR02MB7690.namprd02.prod.outlook.com
 (2603:10b6:806:134::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 16:16:36 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 16:16:36 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>
Subject: RE: [PULL 00/11] Hexagon bug fixes and performance improvement
Thread-Topic: [PULL 00/11] Hexagon bug fixes and performance improvement
Thread-Index: AQHY9WfcwYv7SUoFVkGu3TtRUWjXoK446PeAgAdHS6A=
Date: Tue, 15 Nov 2022 16:16:36 +0000
Message-ID: <SN4PR0201MB8808E53696703AA2AA339763DE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221111005214.22764-1-tsimpson@quicinc.com>
 <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
In-Reply-To: <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA2PR02MB7690:EE_
x-ms-office365-filtering-correlation-id: 33fcc915-118c-4898-22c5-08dac724c4e8
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dL5P7xbmxrRyMAh2VIaNh1V+BI1CE7yp/AGn3h+ehyNO9Ogy7MzMAcx85eysDxxuPvg0g6uTi0g5nyHhDNDyJZaBW8cgU2OmPO6ZJyPnC6Q9v8fQW/vhML6tfb6EYx42he3bF+JJteQiRE0GU7EFytuvM/Onjq6wdl2TEZ2qPa44Ut9Hi/Hbcmea16WUCR1ZX0OYuohBHVUqdCv5T6MIcfySuA9x6wAz7PQYTGbhcOSE2shyUJ6AAjhUCKrcnWr4smG+S8fBuc5FcmjmFcSCCnhhVx1/w92AZA+klykmPfqFJvJNBRUe9akvalBWfKxp07pr1dWjZQocAiBPE/YYCZx0NcRE3X4+70hmDLmLGdMScZtML8kLNXefX6G6THsWO+tfI4iE2wt28L7gmpz3PbLiP6drhD+YgOEHJSMGZaPkl6PsLfaVWu9s7Bu3Yxs/nODbC3RJD8+SepKnAHuWTkc61LySqcPPgPxui6XWTThAUrlHOrZhIiTp/PVqIo+dRg2Tu5G7W9p4Qs1aA8kfNpilDlOZmla8OxDi0drIQ+c6nYZACM63+Rmv8+JM7qszAOlPARgPOBTXSQz0Hviy2JDd/LXcV39NUgvnG2iImPv2cDA5Y8T71IyLP7N0O89mhLMJASATft2/RBJbMWmXA/6/MViCqOTxuoO22dSAoPmOch4QCjqetzyDT03SchAmJHFvA3WVHDYtmwrNOAH2S1aNwAlkYzaeM6DO1P3teu8gswSBiRT+2mFHi2UD6xhd8V8GDTIuyiQ2glN5+V4w3DCGaXyUEqqlpiFb3H1eVxg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199015)(86362001)(33656002)(2906002)(38100700002)(122000001)(4744005)(8936002)(52536014)(83380400001)(38070700005)(478600001)(186003)(6916009)(54906003)(316002)(5660300002)(55016003)(966005)(66446008)(53546011)(64756008)(76116006)(66946007)(41300700001)(4326008)(8676002)(66556008)(26005)(7696005)(9686003)(6506007)(66476007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFBmUlF1K1JGRFI4L1BBRjUwRkFSTUtKZ29zY0NuL1pFY3dyblBuWlBCeVdv?=
 =?utf-8?B?aUU3bE84RW1EQ1JmT3VCZ3MrdDRPbVpnRFNwUjg0NzlrdEdVUEE4TGhneC9u?=
 =?utf-8?B?ZnVURko0bDA0WTF2RzJnN1FpR0NWd2ovOHdzWkptT0dhdG1UeEU1OXF3eGpl?=
 =?utf-8?B?cHp4Uys4ZU1wVThHbWI0bndlTUFYb1ZkdjZuRS9IeDRUYWVzMFY5M2EyS3ZX?=
 =?utf-8?B?MTVkRlhYNEk0cTUvNjhtQ3d4eDBYckd3c0VBVEJJSStNNkQyMkY3dktscXNy?=
 =?utf-8?B?VzlRL1hTeU55ZUhCSDRYR2NNMGZBZUdYcWZadVVzVGdDLzNPMTFrc05UVHlp?=
 =?utf-8?B?YTh3WTJwYmJhMzJoeUx3Z0RwRmYzRWNVYlI4VmhuZkZaRnZqK0ZtbG5MaW1X?=
 =?utf-8?B?bjBtbXk5djRxMGVxRGZYKzlBcE0vRmE0cTZLRjAyaGpkNUg3VkxQVW9QbUtT?=
 =?utf-8?B?V2tteTRxWUZlaUcvYmxKaTVFaHlpNzRkTDByR1JsZkFGQksvRE1KelJZbmp6?=
 =?utf-8?B?NHRHaHIybXNYY0VkYzBMUXhwMDl4K3RlL1NrODBHRjEvY3A0dG5IdkdKY3lW?=
 =?utf-8?B?OUlCTmxib2o4TEFrR2tYTkRjQlJhSVpqRWU0NW0rTjJxZ1RRdllGZXhrQlVj?=
 =?utf-8?B?eHpyVWYrT1ZsQ0d1VkFBL2JRNlRxYTV0RUVNVkM0MHJHRm1vS3lZQStXVnBq?=
 =?utf-8?B?MDcvTW1uckl1ME9RbDdsaVlXWm96WXk5d3lzQXpSWXNJZ3hYZktNNitmaU1n?=
 =?utf-8?B?cEdEN2JuNUQ4T2J2dUJZdS9sMmdsYmZLcWRuVitoME4yT2hRd2F3dElrMjhD?=
 =?utf-8?B?dkVjb1p5NW91U1Njd1UrM1J2NUNBUGFHa3NsT0U2QlBHditycG5YdXZwRHRX?=
 =?utf-8?B?Z1A1VVpNRFVOb0o2eWsvRGVoOXExUGlEeTZ4ck4xdWJGRm9XaU0vYmVCZkRt?=
 =?utf-8?B?ZmhpU2MvcDkyQ2xZV1VDa1dZNmdXaWFaL0c1bWp4VTNqeENDa2RKdlY0eXBo?=
 =?utf-8?B?eHhzYlEvQ3BXZWJ4WUVKdTd5bnlHZU5JTHQwT2E1SzljZDNRL0kzWGpybm1y?=
 =?utf-8?B?MkplWTBIYzZRbisyOGd4V0U4K1ErUnF3MjNlNTdxTTVhaHB0WnNFcW1KSHd3?=
 =?utf-8?B?aStmcXZUSFpleEw0aEoyWHJsZlhURTRXc0FOVG42Kzg4VHVjQ0U2TEgyWVl4?=
 =?utf-8?B?ZUVIT0xHaGg5ZU9xTEk5d3VCbTdjdkVuaXhSUm5NOEpnd1lUMGsxL081alJQ?=
 =?utf-8?B?dy9OV0ZyRWhlSENGYUFHcGJxYXd0cE5kVVJQUGVpM2NFblpDazFUM2pYZ0M5?=
 =?utf-8?B?TTR2NCthcU1YNmNTQ2xXV3hyU1RXRHNLYmJ5M2xuZTBxcFFtMm1lb2xIL0lP?=
 =?utf-8?B?VzJQcUhnRnJyaUxlbWFqVm1uemxwSkpsRlN2YTJuanN6Ym94czdsUHNRRFZO?=
 =?utf-8?B?bThqanRmZStocSsxUk1tU3Era2JRNWowTFdRaTNvKy9UaHk1WlM3ckh4WmJw?=
 =?utf-8?B?WnMrWHRQSHNWN2d3eW5tQ3ovalZ5MG5CNWc4QW9Db3A1RXZ0VmVJSjNzR3R2?=
 =?utf-8?B?dk45Z3dSN2tuTFFkR1BDWmpGRWRVZkEvMnp4bmFLRGxRUWwyc00xOEpGNmFK?=
 =?utf-8?B?cGpWQ0FvN21ORk5ORlN3TjZ4M3BsZUNScHNxNVdUMjAvQ3AwdnpvRk95VnBx?=
 =?utf-8?B?ajZSbEpBd0JLTTd0eG1rZGh1a2lIRmcrMFZqQ2ZUVXRPS1h4LzAzc01PeHZV?=
 =?utf-8?B?bkhuUUMyRkM0bDc1dXIyRnhYZ09ESWFwMFhTTk8yZXdPcTgxVmM5M3lnVXNu?=
 =?utf-8?B?cWp2T1ptRjJmV25pZTBFTVUza0xGNE5uUDY4NzN6b1BQYXBjenh5b2ltaWVQ?=
 =?utf-8?B?QVMyajdhUStTeHgyZm13L2IyTCtmWlN0STJNZ2dCdlNrcDQ3dWdQT1BWWml4?=
 =?utf-8?B?NG53emRQa3A4NXUzTDYvbmJjaE5IQUIzaU9yQVNBNndjOFdBSUpDdGd2MVMv?=
 =?utf-8?B?bUIzRkRLTGw1ZTRKTlV6cElRMEFqcWw3OUtpc3I4YmFBS2ZNZ1pjb0k4ZjZS?=
 =?utf-8?B?R3dET3Facmt2OGVFRFBuK2IwRVJ0YVJvamErTmJyN0xXamFQUjVsdkZ1Uk5t?=
 =?utf-8?Q?XZ4awk6rywnOl3FWSjHW8PtqW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: a+qoTTC+BqafBI4BKXDj6kKjMvTriJOcFbbM9tvlCtGrhHSzmY/H/6VCCt8V1J10L3Q5r7WZdvivCwILHDT7qLNwj3wWlA9d32/o51S2z40Kd7zMQpXGxNOK8DGRkkLcLEo2plgBldwa82RdewKgQFYbxNLuxu6EI6seIiCZjfV+5H1JXiFbE4ygtYuSq9RWhdsOkQmjEM8hteUR5pNSqIt/OqeCErhAsKJnIV+B0IF5LS8dLSHACrasRdt1bzu92K8p/2/o+/1PiRlEn6ajNE41H9a6n//RIwa6JPlHhRG7iCNlEqUbnSURwuC68QaRczpooOAQIKowIB5wea7MdXzmHIdVWRMFFeC2UdoKdJEogDxB8lKasJymdh6Yzj0oAAL8X7s/q2ZkAY9Wsb8Sw7rVG4tS1LTZGD2lmKtp/jIx3X20AtXwxuKJrA/YVs+mw/tyjY2QK4COy/XwLTwgRayEN/oYMCNW2aqmzGXzjQwdnqEiGqtPf5s4X8o5nPAu0dY/XLagZAzBzP0jhq6cOZdt5tgqqpiEdfchR3YBnrzGE326nqaVr+7YUsHgTqmgxQGxX4F3Pz/yk0cUDSH7hHtGzJCQMLXPyuiF3OJHM1+Gl4ne1o2d+AfkX/Xral8h7gfZ07dY9981pHxAj3fKh7mEzoidtJmRmYaaEEdVTtzGRRvdMitSwXjptAM5RDj8uKqQPj3EbBmII79vH6IsMTBM46Py6SbTPM0cE33BQV0QHZFeoU4eY1J0ipjXngXCYuwKzxjFNt6diDlnxXW8X/QE5aATh9l1cTNxggFl2vSH5MuSyNSnLqT4506LwRTBAhnY2Xz1wItRPWDTJJPmw7eUP464WBrgvT0J1XHKKXJt2/DiAIEclVFZMPHWHssyoh5wn1k5X754RnJwFhCCuEtahmhmXBinvqYt76BtjyE=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fcc915-118c-4898-22c5-08dac724c4e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 16:16:36.2487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0wo1KKcMisytg4tABzyvwSqSqd54ufIloP0osIZQEABVuwhtWneuaBxorG1UrclovhGnuAz33S4galF9VxNUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7690
X-Proofpoint-GUID: R_rhurxfG-z6fw8S6NRLhSTNTF1yEgeh
X-Proofpoint-ORIG-GUID: R_rhurxfG-z6fw8S6NRLhSTNTF1yEgeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=797 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150110
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

T0suICBJIHdhc24ndCBzdXJlIGlmIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cyB3b3VsZCBiZSBj
b25zaWRlcmVkIG5ldyBmZWF0dXJlcyBvciBub3QuDQoNClRheWxvcg0KDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBnbWFp
bC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMCwgMjAyMiA3OjA3IFBNDQo+IFRv
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+IENjOiBxZW11LWRldmVs
QG5vbmdudS5vcmc7IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IHBoaWxtZEBsaW5h
cm8ub3JnOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1
aWNpbmMuY29tPjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBx
dWljaW5jLmNvbT47IHN0ZWZhbmhhQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQVUxMIDAw
LzExXSBIZXhhZ29uIGJ1ZyBmaXhlcyBhbmQgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQNCj4gDQo+
IEhpIFRheWxvciwNCj4gUUVNVSBpcyBmcm96ZW4gZm9yIHRoZSA3LjIgcmVsZWFzZSBjeWNsZS4g
T25seSBidWcgZml4ZXMgY2FuIGJlIG1lcmdlZCBhcyB0aGUNCj4gdHJlZSBpcyBiZWluZyBzdGFi
aWxpemVkLiBZb3UgY2FuIGZpbmQgdGhlIHJlbGVhc2Ugc2NoZWR1bGUNCj4gaGVyZToNCj4gaHR0
cHM6Ly93aWtpLnFlbXUub3JnL1BsYW5uaW5nLzcuMg0KPiANCj4gUGxlYXNlIHJlc2VuZCB3aXRo
IG9ubHkgdGhlIGJ1ZyBmaXhlcyBuZWVkZWQgZm9yIHRoZSA3LjIgcmVsZWFzZS4gVGhhbmtzIQ0K
PiANCj4gU3RlZmFuDQo=

