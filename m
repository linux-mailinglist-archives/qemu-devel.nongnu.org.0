Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B216F892B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 20:59:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv0e6-0005WU-8j; Fri, 05 May 2023 14:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0e0-0005Rt-Ro
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0dy-0004cd-Gm
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:04 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3459Yt4n000511
 for <qemu-devel@nongnu.org>; Fri, 5 May 2023 18:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=fKr0rs7WTWvmsNjntBshFWFHL6AANEKVJJIG6t1NSXw=;
 b=K6JFa75tEgEVf1hm92vgtc5lR2q3KJTm7lBkXANz8YY+xMcT4mOZyR1XyHP2znRPxIaG
 jtWXtd/xMbgTRrur/soPvenSa3lDlYhJy/iuZMV/hjXYycD7Sh+msj4YWoYq+ZBeRyIr
 mb/T7y0B9hbe/+c8ZkKDPYcPSzM9YehqEc3nLNpWOnGLTo/uEh3wIpwB2+IIMRAN99Dr
 kfYHxzQkEbFtMJK4/NqGF4XEd84a/0exnpg/Jp2SaGr23LKJkcOZ/8Ej/UEQW7Y1XMYp
 WUAonQgq98h7rqdGBzxr9vWZqAeKc1nMBl7nus4S15/zLG3OIcrjqNaL1RgQGzq9pYzK cg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qckf72g10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 18:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOIc2oRBTly1zhY7vKYbfWaRlgB1FAs7omJJ6QxPUjYJs++Qh8beWNiqrXSLrCTQv5v8ZJv4YJLHVyhJs/84cRniFpRAXu0Py5ipgE9Vlocj+H9svy83HkCuqlTcPwR8BbAfeE+iyOd1Pe8Ud99SE3zCRImiCtVhTuRgRWn6P7V4s6fD6jzPJQ0nRTH2WbIm9dNKrjCiwfw3/Ei07lU1zaID0bJrlWoNy0MywoZt6Fj6WOQECC5MvZDosJ0End9m1El2CJSTP2Lt8wgGIwjQrVmBoSiDdxNCVkY6RTmPxte8sXiUIOFnlsYKadDd23bYJpwuga24eGVnQ1lSnEyYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKr0rs7WTWvmsNjntBshFWFHL6AANEKVJJIG6t1NSXw=;
 b=AJHKxzXIxFVpAi9J6C1LGnicZQnRhu3pOq/iQ7i3YqN1MFMMvuKmlQzlltQBA/JGRfN6uh7CsSt1Sbmrej4TO9DOY8LNev/jZIe2SaJV52YQS5q8/NJNtLJvWli+XigcjGopn8bGdw4U0Qcym/Z63RWGi3GfEutEZWnM9KZZbuliUdn1VIxivIa+Q4Dk4BKWDx8YVefD4mTIcNZ8vAv6kdNPN14r9+4K89xV0Hn3F9vXDvLq1QGaY7hARNBTrzksFEpKNmQ/Jbt2DMpKvwYW7F6wuqKwzajNXQagOP+2+eOV4KI+sEVVHvz3QZY/4wJLe2QmmrSSKzePxorvbx0zmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN7PR02MB9378.namprd02.prod.outlook.com
 (2603:10b6:806:346::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 18:58:49 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 18:58:49 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH 1/2] Hexagon: list available CPUs with `-cpu help`
Thread-Topic: [PATCH 1/2] Hexagon: list available CPUs with `-cpu help`
Thread-Index: AQHZfrmw8I4X08g300a/7He8lalbx69MCFTg
Date: Fri, 5 May 2023 18:58:49 +0000
Message-ID: <SN4PR0201MB88082D2BA7B1A25A123994EFDE729@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1683225804.git.quic_mathbern@quicinc.com>
 <b946e17c7e17eed9095700b54c5ead36e5d55dfa.1683225804.git.quic_mathbern@quicinc.com>
In-Reply-To: <b946e17c7e17eed9095700b54c5ead36e5d55dfa.1683225804.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SN7PR02MB9378:EE_
x-ms-office365-filtering-correlation-id: 3cc19d50-e4b4-4ffd-c2a2-08db4d9ac2ed
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: asyuOPpuOFz1kjVaGci62Qb0vdOTzov3QI2CYiI/FzkyF6ql7WP9qqKsHGmrlleLRQtZIGgmcaGRsbafHcQawlaQREb6TToTpwDzdehJgUpB1giHS/sXVZbTLnhxY9yVMBXEO4lqh3UHXAmo5FOuJMPcuWMXjjwgfdcPvICJE0eZY4EsYrCDuOTmR5lZgg6yjLeKYi5KvG2EPtEprvrSXjgmnC2et385Z2UFOfJmUreXoaL3GL1PTEbqIvqYq7lW3tf3S1+XCRiB3G0edizpcE9OHvQ5f2/YYIB1JnQfE0xYdHeLtkERHWG142m0wlnqKT/Jc4kla/8/0L7hW3gJIkNQi4jWZKiAcG+JVHuIIpYXw4x61rWRD0oBnPxhNZvAi7GecQCref77uKNNy5dc2Let/RgwYH3kaBZwpvmtaMRY0XAUtfpee4/7tkhAz39rMBnlmNCkXzz4BqtB/b2VC2EWOL7/6JNxi/Agc482yGhjbgk5SF8vcA1ECy7lyMkDPhAcFzO46Vdh3GkJ7GpgtHqDm/jerkv+V3ZqsAMUjce1uuRb1N1qJ9YXnDY5u1hfnrsjmOBYlxDglbJYf6NcR6riemgrpZItnk0EOUGX0zUEbyhbEouQVDWhLuXP8aesoudjc86PCEyTbXCQyLUYu3QndrWEXIAw6VZDweVPYx8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(66556008)(4326008)(76116006)(66946007)(66476007)(66446008)(64756008)(7696005)(478600001)(316002)(110136005)(33656002)(86362001)(83380400001)(107886003)(6506007)(53546011)(9686003)(26005)(71200400001)(4744005)(8936002)(5660300002)(52536014)(8676002)(41300700001)(2906002)(55016003)(38070700005)(186003)(122000001)(38100700002)(131093003)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uHqvpUeXZ0Q161QwdL2Iay31DXiFysFIpyH98fNWkU3Mm1exdDdxiTq7w3w2?=
 =?us-ascii?Q?ClUmKwoN5O47YJdYiGeti2FFCecBS7CH5aztZCyYQ3AaV1EBHu6PzGC4qhKz?=
 =?us-ascii?Q?NqsfRmqy9mKehoNBqwxzryQPcnnbOf7DUigeaJLrR72lbYKyRapMpSmBFV9h?=
 =?us-ascii?Q?AosPEoUgfJIihSDFoG8AR+MiWT7kXhVB6P/+vgFFZOsnfBjlFGze9afmE3IH?=
 =?us-ascii?Q?DIX065PXOrGgCXDwQ1mnRGklkFK+6qf7FwIAY3KjDW7mZeDAMLoDsGOePOXy?=
 =?us-ascii?Q?tPUAoqq90GyHqPP2075MyNThr0dL8QPLcOcxIbIE8o9JB7aaTfCa+zKFlAMJ?=
 =?us-ascii?Q?nnLQSZKNGwTdd53EzcorMCS6HWKtBR3wu3tw2RF2RzwvJnzKCglFFnamhKYR?=
 =?us-ascii?Q?G0brDvFAftKSIzg4tsCAh/+1L6eV2p49eA/ZW/nf7Yz1BcXqMvgUPfyJb19z?=
 =?us-ascii?Q?Bw5NUxriDisLzM/fNHx6iobVn+GondmuFl4if6cNNmCZIDacK5s5uc8BpDcd?=
 =?us-ascii?Q?J0Q4gJ0nBZBtmY+l4VoXysoT6OyzkGCOPj4XB8CvFAAyjJOiN1sRKqgi3e0j?=
 =?us-ascii?Q?XIeeF03+eoXfhFCS9YnpiPFnnOqhLuxXgAs1RjjjczR/qBjcl9N40ozqydFB?=
 =?us-ascii?Q?fdOzupxNP10eBOBFE1c7TYrnQVD96wr/SZWPUV5bCx+FzUOGGIeaAipDVqxw?=
 =?us-ascii?Q?jFNvYBlNHIgJ6NUSeMmFG6N1xNM+QnOxx0U2MqThKYC6SYMKoTeonvOT++es?=
 =?us-ascii?Q?Sv27ABE9rtJr324oL5TKWMmmqcvZCaM2BScc+GKn09NCl1WOdpKWYWuaVN1D?=
 =?us-ascii?Q?YVs897mFfcDZIJD5/e84u1MSe/f6u9YL1hLUDFLhoV5Km36P4yR8PyPLux/o?=
 =?us-ascii?Q?9olv0ZRjX98Vw/aIl3F8kWgtPzNbPW76CepPWzTdMrVBi+1+nRXHrc/otf2w?=
 =?us-ascii?Q?H8HQH2nnzLWfM0NjmdHiNcYzXIb5Dw5fs+Iypz3O/yrAXE7yVqNz6QxoFKGi?=
 =?us-ascii?Q?qNPTXEomOShK68qSBRzEGgUUNhAk8TuDbEC3suOkKoRHymKrI0bXxssdlqRI?=
 =?us-ascii?Q?YkzTlgfqthBrBd57Owrhbe36+cI12Qwhe2DXQPNuTdbW0dbIDYyLm4spDjCk?=
 =?us-ascii?Q?+3cYfNmcHy38nMyONVpHxJ69kJJj4r/4gs8TU8+yrKPvcEAHCLJHjvaSQUsT?=
 =?us-ascii?Q?ArRxLYFQo6tbOQM5LVu0gdyOSn/CJuL3MbdhCdZ8ZcFnVnxJOwVx3lTf1gF6?=
 =?us-ascii?Q?CSqzTuHuZ5IhEA+/B34nFnvvntxjXpSmWP2oSTLqGHwKFuvr+8ByI9dzFyng?=
 =?us-ascii?Q?s/4gCOQ2PPMZ8bbMySwdjK9Yh2obhHm1fiDMnhowu75AqWUVo3GVXQjFZdQi?=
 =?us-ascii?Q?xW1GA0HLeGSH4TTbJw+0dyg+II47w6JxLl5hn/IVaM/6fD+GnvEMX5ottHDc?=
 =?us-ascii?Q?R9/J4W3nBEsyxEdomxRvxXL+2TlQnr8SBf0XVKzgx9mOK8CVXmCmCyCdF/Up?=
 =?us-ascii?Q?kygegkT7/DOjWHw6WBDSI7NxMmQHR84MP3y5+CGxK69FdmjHdiG6Tqmu0eZL?=
 =?us-ascii?Q?4k8Q+5G5/LU8RHYzgfIsZ3GU/JFdnWkXitzWRau9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jRc/8V2ENDK3DSyL6vG/ooRuLEYWDF8dcHiFbGbBWxVerGVc0iwa822M7DTWoc/J+7WDt2MMCI8e7IoMaa8G1+sSPeuCyxZ996hwcGC7/q04wb/At/U5e5aigJS6ZB2m/D4LikcH+5OtAMUsiMkJ142AfcWpJ7J8GKdCRjPIPn7W4GLkIhsl06p2/pllhw2iJII7swYuy7NnR65SAY7yJ64EGwkt05Ec330pmNuLjTq6qhapR/mH8T99RY6JyeK70LzcQvkr+i7xLFjjd+kM5GnWmBA18UInwF+rj3MlTbdVAenjuZYjEC9plZer95qBt1zVPNUvznyFJjuAR/aoZ4nvcSV3rlPysXhf3U6zTvphqyesvRRnLq/O9+bVB2PWvUq5Jz57wFbctgG5ZWM4GSF/TivnIxja4vECs1mQbgwTui4YSQ7qQtTK39OecqZX3ugfB0do9DgfK6W7PT0rikiEVYn0rWS7ulQAPsykL0Q4KJuBS2CeCQnZH65IzseTk7nj5ZNSiovhUKRxEyp/ZXcqAgub8JoUVZkvEL3H5ENGBk5pzxQtBPqkBwX1Zoz4TV7Ts43kbSPbqG5YX/t4rAPCyFxZdHmJKzxYv5HslCmjghnvW+HlRusEke1s+hS+dxhamk3pDKeHZc04310FiQcnC8ueAoL8RgIGNdbF2pm73ouMdfumogeEXNgOyXdm+u6KGjnsrMUDHdeB4Yc0/goDZUZEH9WvIpSZlMu7BTmF0OGHZ7LRelsjZ+Xw2iQz7GuDQqHadFJ6XQH1Q56Nfw==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc19d50-e4b4-4ffd-c2a2-08db4d9ac2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 18:58:49.3683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rK6Q6ToVbdBw4Hrthu9TjbSGD+uyiNAMTmvHqG11hQu++jJsO8vBg/0v98Ke2mI839GXCRYouTeHbP/Bn/SNOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9378
X-Proofpoint-GUID: gw5Nm6UD4ws9eStok6kubQyJcS_JiIHB
X-Proofpoint-ORIG-GUID: gw5Nm6UD4ws9eStok6kubQyJcS_JiIHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_25,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=511
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050155
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Thursday, May 4, 2023 1:53 PM
> To: qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH 1/2] Hexagon: list available CPUs with `-cpu help`
>=20
> Currently, qemu-hexagon only models the v67 cpu. Nonetheless if we try to
> get this information with `-cpu help`, qemu just exists with an error cod=
e and
> no output. Let's correct that.
>=20
> The code is basically a copy from target/alpha/cpu.h, but we strip the "-
> hexagon-cpu" suffix before printing. This is to avoid confusing situation=
s like
> the following:
>=20
>     $ qemu-hexagon -cpu help
>=20
>     Available CPUs:
>       v67-hexagon-cpu
>=20
>     $ qemu-hexagon -cpu v67-hexagon-cpu ./prog
>=20
>     qemu-hexagon: unable to find CPU model 'v67-hexagon-cpu'
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/cpu.h |  3 +++
>  target/hexagon/cpu.c | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


