Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA45A82CB
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:13:23 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQL9-0002YY-VQ
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1oTPto-0002Rd-Sx
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:45:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:58212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mburton@qti.qualcomm.com>)
 id 1oTPtl-0002ms-4E
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:45:03 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VFGOHC032584;
 Wed, 31 Aug 2022 15:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=UPf1lABNQs7cJi7x9C/bgzu4uVuchFDkzOq4I1qAKE4=;
 b=GBBd7SkcUAT/elLzxioOQ87gB9ma4xCCFyF4X1rfgEvwL6bFp6ZrkC9C7JOb4c38fj49
 lSt2UTlJOqY6NIIxtmUV5Wq1cMXP3pXdcsu/TCuuIR4xxSIfgYkQah+fsnXDfEb+8ZBz
 4I7CB4l6vOljpvfU3Rn9ZvPe1HihIpjCxCkFgJf5UK8hvilF+Y60XCxCKlr2KaPyCP1L
 78qANJy+Ky4V4HXtrhY/4daey5rfPwICEaNtq6ZrlL3Bp8zp+eXiLCzArQWOu6aLaFMq
 /Z9nAUQz//PfUpPb9dgYxFheXZMKZqfb37xKS01WdgE9jWg60IYr8xlXaPLGfcUZTiyL AQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9mwg3te8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 15:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q88tDTqWgi+0IdW8BouJAexTMdu2uWBjlhRM6rtxgX4M4/qR0lld3AiISkAu8kYA25+b0z+z0x0R6YdYWs6zMV0uwHvwNkzlK3EtusqfUBG6RR8qsiAQdNfYvRqVHRuOPxZOGtN9uAdUJIAgswwEvhrrw9Rfx31k2sI8TLZRh3Ad2ajjkwogs0jGQ2nK8drGlujgzDdagJql+Bg6WIDVKFxG449+gWOkukpBNhmkkHWOKWg8CAK+gIatXtfiW/hGACi4+GsAST4yOOnWjdI5SisM9fgE4gBMOfbgyR8d7ixALS+xQbZ/Knqlmw9z+KNsalKkBqzwLrju02CIMLvWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPf1lABNQs7cJi7x9C/bgzu4uVuchFDkzOq4I1qAKE4=;
 b=leCdVOECDYMKZr8cdmd4bcuIbwBbOdF85GOdlAJoQmBM4csGR4+YHNnXAVxO5d8AH64gHCPn0YyTi616g7ukTfSh7v+lhRLmHBHIR22zslcx2JDaicV6hva0B+GcO13a7NRvoh8G5gDFeRXc1zDFN+lhIl93lNX4+Z2qlQOkuPXEADGTBU+uXneQFfQBmrLJ2ETM5HsXg4670hGSKOhSjzFdXagWiXbrzUPmfjFoTW0ga8lwrWemAmarXhhgtvgCirowAVMPMI74San/t2onCErmKfarAl7sZYDxz6jSP52yO5jPHgh+Dwmz+H+H5uJVPbz/E0uSuhCfsTJc6uZLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 (2603:10b6:301:78::26) by DM6PR02MB4138.namprd02.prod.outlook.com
 (2603:10b6:5:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 15:44:14 +0000
Received: from MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::25bc:f9ea:3d39:540d]) by MWHPR0201MB3609.namprd02.prod.outlook.com
 ([fe80::25bc:f9ea:3d39:540d%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 15:44:14 +0000
From: Mark Burton <mburton@qti.qualcomm.com>
To: =?Windows-1252?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Bill Mills <bill.mills@linaro.org>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, Edgar
 E.Iglesias <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?Windows-1252?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Luc Michel <luc@lmichel.fr>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Alessandro Di Federico <ale@rev.ng>, ff <ff@shokubai.tech>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Thread-Topic: Any interest in a QEMU emulation BoF at KVM Forum?
Thread-Index: AQHYvU0lU1jL0t1JXUOT+x+wVCfve63JJUtR
Date: Wed, 31 Aug 2022 15:44:14 +0000
Message-ID: <MWHPR0201MB360986F251B942516E1ED0F38F789@MWHPR0201MB3609.namprd02.prod.outlook.com>
References: <87a67kphih.fsf@linaro.org>
In-Reply-To: <87a67kphih.fsf@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9511c9b7-a737-455e-3597-08da8b67a7f8
x-ms-traffictypediagnostic: DM6PR02MB4138:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 98E0Sp3Fn7T2+wWu6nFUQYmECzzawVQVMmSU1mKSnwDYCgH1Ku3NmF9tX0RxjiHKiBPwReddFx0YShtFUZOMAaCFXtMawK3DUgYX7ABpS+6Q8HSRSjMLXkz3Qn/GdlaFw65nEj5LR3T6pUNZ82ZvqDwSG0xQp7+PR2DUDgpxXCbMAIXtwGEmVhsmFVB2wGtr+Eut3xlGIzRxbFEpvJbE/hmzTaJSXLsltdGEr4Ej7OdNeFQl+/Ty1L/TXJHiAfbqD3lomJ1BD1GthZDzveArO6wCVeLpulQ4roiHU93m8upf6JbbESy3l+p7fRR8sfbPnTHEuGBE0/ziH781SuwrcB0VdRCluNaGKPxMl5SvNpVKyh0uzrK5BV5mxtiYtMMm+hPrVPyHqQCsDckwE5ScotvdiNsTmmIkmNOP+lgih4agT1fn5+9TI4quSAxQAj68QeF9KwXgK1LTSuuCBixgyIMgDsVceCN7xUV/VsPm+41I9kZAqeBI2KkGAZjjp1d4jmurbiP46iPZLQiSCUiR2jejxnSr4wL+vhlpO77t6pZNQL+ZRv/WhcA89jGUoNt4e1EtcOQISTD9SE/DGtCpiOSvVhFR5Q5gFHE7Z9XJfAoomkUgazevBtq3PjoBgNIZoa/mEGJIlgiytn1mZ1nsW0W5RBYOWutw2IeBPoyECdsWKtlfkIItIEZi44NhSMuZOnzj9w/FaY6CzuXIDI17TKIiQCyz5tQyaDXKf8wmVunjqf0gBWJYZJ7/78sP0WxpL7qWJEuRNzLLyf3tHKEzJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3609.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(41300700001)(33656002)(7416002)(5660300002)(8936002)(186003)(52536014)(55016003)(83380400001)(86362001)(2906002)(7696005)(26005)(9686003)(6506007)(53546011)(66574015)(71200400001)(122000001)(316002)(478600001)(66556008)(110136005)(66476007)(54906003)(66446008)(64756008)(38100700002)(38070700005)(76116006)(91956017)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Naylqfob7nvXqg7pMPPY37gVXLcF9oB/UGbGu8ECBl442/9GoW7DWtAE?=
 =?Windows-1252?Q?YrpNiYx48JdYdZ5lqo8SaSFDb+zC/PUGDgprD5TNo8ghnNEz4eyYjj8G?=
 =?Windows-1252?Q?EGz9plThMRvH/NI6C56qGVWbtTGBIYrXynst9Sn+PMmCOeroKg9vBOeN?=
 =?Windows-1252?Q?DmiHfi3BwNkgMrcfjsov/Gfw5/8OF/gjz9AI0FSb+iu/IHNWYN5U9dl6?=
 =?Windows-1252?Q?BlAH+05wvdv2hEi5wtyFkLWp3zp5yy3jkDds27sCqgNdNOZJX+kQBpcu?=
 =?Windows-1252?Q?1/LojbKATLUuTZ/GS+R4jZ6YAtu5CUhB0fK6+hpwe0v2fSpx4tYOVRre?=
 =?Windows-1252?Q?OeVWGzSeg6kU/AzQzM8qPTPEfP8PxiTRGPIPU9wPPyZHQfo6scu/6ELI?=
 =?Windows-1252?Q?UryLy3TFYGtv6thlkvy4uYqiuucFYSpfogGFHjUONQhrVm178YX+DKbI?=
 =?Windows-1252?Q?ue6FxhdQGdwHxIpUt97o0bBr5CLkeJjUwH9Q4gZw0WcztYPkOsgtyqWG?=
 =?Windows-1252?Q?s+WuVECjZYyuWlf/MspROtY7ssLeBwpeJAhxYJ3KxHIrADapC9yvsprV?=
 =?Windows-1252?Q?2w2KoQAcmeGHAjwIHPUwLxNCzyTq9C7CXdBUhZhDc4CHGC9tCQbKAkzD?=
 =?Windows-1252?Q?cLYs9pAR7xnOBR02hDvFF2wAY7GWiwlHDumAcG9t5fWbpPZL8WNk01Do?=
 =?Windows-1252?Q?szfQdpONvZpkBqdU9yRAWiihkraD9GjhmTNRBHiXk9FzuIa5kaRUxa8w?=
 =?Windows-1252?Q?/0hLvXZJePAFR85jJwx8nCKidm0IiCxVo1uMtPf7NbnrfsuZnNz89328?=
 =?Windows-1252?Q?XUvMndSOB7dfThsEazSgRZ++QXcyOoXp7Dplnv+pHOBEXTlC76I4VF3E?=
 =?Windows-1252?Q?gxaobxyaKkn1MU90H6I6kwng+nKc4rpx41KNuzbxRwoXd//5CJT/uTFs?=
 =?Windows-1252?Q?QjHu4tJ/NQaQ9yWU7KQJJhf2vIViDVnBydmxHqC6gVPgQziQOU41pHf/?=
 =?Windows-1252?Q?ceyEDpIHPk5vvkDtVAUuFH/2TBnvz8OzGttdeZzKUmB3+68V6cYTcVta?=
 =?Windows-1252?Q?UnhJnUNev4nO0gaLFQRAyy8slo3aShohzL8icfOddJH9YtQypIqRJi6j?=
 =?Windows-1252?Q?17u0+GTfquwUxUFG0oBgdd52KErc9txJiLyllJQ9KmkXe0TeSCS9BRwQ?=
 =?Windows-1252?Q?LZLBdVuyDyhKfZ1hKw82BLQs5jWJFWohkEEuxV7Jy6yi3F4YEyY4+ecv?=
 =?Windows-1252?Q?ogADlDRgB0vSkRisUGEBpqq3KuEHlmDgLdAj+rGZrMXoUqqPH4EFz9OE?=
 =?Windows-1252?Q?p6XrRd1Y1ok2DpaA28mf9ZwsixNk0JFKMNwon4rnW0RvFdcjS5JEMYw/?=
 =?Windows-1252?Q?QXMwdlba8kdRDzEDqskaC+8cySltHL4n7SP9NSGH0rdd3CfHAC3G/D/e?=
 =?Windows-1252?Q?sJH/0/q4idnU3gqzbYtWxKsikXdbNAd7m6A+tB8jN61PyizWNFCi2Gxh?=
 =?Windows-1252?Q?NTWCdTOCwDIh+c880LAcG6a9FnUrk1dREpTNx5aldeNICulG/cCFYgnL?=
 =?Windows-1252?Q?St/3rwEX8fR8JUffOnG09tzzm5L9CoPXooDvOjioRzpneue+XMKCKs4L?=
 =?Windows-1252?Q?jaUnqxH4L4NWIesfd0fzl6E1VINykFZQETgfn8p7xBSXTQ7DfelYI5vx?=
 =?Windows-1252?Q?HJ6932bFUvBpbyXTVHqRPF77196wseJpFDktL6YylzyVNAIIQGk14tb7?=
 =?Windows-1252?Q?6u5/UFvteiaahSiiZUk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR0201MB360986F251B942516E1ED0F38F789MWHPR0201MB3609_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3609.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9511c9b7-a737-455e-3597-08da8b67a7f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 15:44:14.1831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rg3Qswf1MqTOfynTb0GhhsFkRaGxl/0rLugWZAdUzZv9845oivhrS4OwodZXswgb0/cR+L6t1t/0Ht9h+6U9hwgfQ7rDILjADRWbHfWcJeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4138
X-Proofpoint-ORIG-GUID: t-Tb5af9oT7ZKFgtY9_5MlCGF13ZinkP
X-Proofpoint-GUID: t-Tb5af9oT7ZKFgtY9_5MlCGF13ZinkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_09,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=672 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208310077
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mburton@qti.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:56:37 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_MWHPR0201MB360986F251B942516E1ED0F38F789MWHPR0201MB3609_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I am VERY interested in these topics from a Qualcomm perspective. I=92ll be=
 there from Tuesday morning,  I think a =93BoF=94 would be very helpful =85
Cheers
Mark.



On 31/08/2022, 17:20, "Alex Benn=E9e" <alex.bennee@linaro.org> wrote:

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi,

Given our slowly growing range of TCG emulations and the evident
interest in keeping up with modern processor architectures is it worth
having an emulation focused BoF at the up-coming KVM Forum?

Some potential topics for discussion I could think of might include:

 * Progress towards heterogeneous vCPU emulation

 We've been making slow progress in removing assumptions from the
 various front-ends about their global nature and adding accel:TCG
 abstractions and support for the translator loop. We can already have
 CPUs from the same architecture family in a model. What else do we need
 to do so we can have those funky ARM+RiscV+Tricore heterogeneous
 models? Is it library or something else?

 * External Device Models

 I know this is a contentious topic given the potential for GPL
 end-runs. However there are also good arguments for enabling the
 testing of open source designs without having forcing the
 implementation of a separate C model to test software. For example if
 we hypothetically modelled a Pi Pico would it make sense to model the
 PIO in C if we could just compile the Verilog for it into a SystemC
 model? Would a plethora of closed device models be the inevitable
 consequence of such an approach? Would it matter if we just
 concentrated on supporting useful open source solutions?

 * Dynamic Machine Models

 While we try and avoid modelling bespoke virtual HW in QEMU
 (virt/goldfish not withstanding ;-) there is obviously a desire in the
 EDA space to allow such experimentation. Is this something we can
 provide so aspiring HW engineers can experiment with system
 architectures without having to form QEMU and learn QOM. There have
 been suggestions about consuming device trees or maybe translating to
 QMP calls and adding support for wiring devices together. Given the
 number of forks that exist is this something that could be better
 supported upstream without degenerating into messy hacks?

 * A sense of time

 Currently we have the fairly limited support for -icount in QEMU. At
 the same time we have no desire to start expanding frontends with
 the details cost models required for a more realistic sense of time to
 be presented. One suggestion is to expand the TCG plugin interface to
 allow for the plugin to control time allowing as much or little logic
 to be pushed there as we like and freeing up frontends from ever having
 to consider it.

Are any of these topics of interest? Are there any other emulation
topics people would like to discuss?

--
Alex Benn=E9e

--_000_MWHPR0201MB360986F251B942516E1ED0F38F789MWHPR0201MB3609_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I am VERY interested in these topics from a Qualcomm perspective. I=
=92ll be there from Tuesday morning, &nbsp;I think a =93BoF=94 would be ver=
y helpful =85<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Cheers<br>
Mark.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">On 31/08/2022, 17:20, &quot;Alex Benn=E9e&quot; &lt;alex.bennee@l=
inaro.org&gt; wrote:<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt"><span style=3D"font-siz=
e:11.0pt">WARNING: This email originated from outside of Qualcomm. Please b=
e wary of any links or attachments, and do not enable macros.<br>
<br>
Hi,<br>
<br>
Given our slowly growing range of TCG emulations and the evident<br>
interest in keeping up with modern processor architectures is it worth<br>
having an emulation focused BoF at the up-coming KVM Forum?<br>
<br>
Some potential topics for discussion I could think of might include:<br>
<br>
&nbsp;* Progress towards heterogeneous vCPU emulation<br>
<br>
&nbsp;We've been making slow progress in removing assumptions from the<br>
&nbsp;various front-ends about their global nature and adding accel:TCG<br>
&nbsp;abstractions and support for the translator loop. We can already have=
<br>
&nbsp;CPUs from the same architecture family in a model. What else do we ne=
ed<br>
&nbsp;to do so we can have those funky ARM+RiscV+Tricore heterogeneous<br>
&nbsp;models? Is it library or something else?<br>
<br>
&nbsp;* External Device Models<br>
<br>
&nbsp;I know this is a contentious topic given the potential for GPL<br>
&nbsp;end-runs. However there are also good arguments for enabling the<br>
&nbsp;testing of open source designs without having forcing the<br>
&nbsp;implementation of a separate C model to test software. For example if=
<br>
&nbsp;we hypothetically modelled a Pi Pico would it make sense to model the=
<br>
&nbsp;PIO in C if we could just compile the Verilog for it into a SystemC<b=
r>
&nbsp;model? Would a plethora of closed device models be the inevitable<br>
&nbsp;consequence of such an approach? Would it matter if we just<br>
&nbsp;concentrated on supporting useful open source solutions?<br>
<br>
&nbsp;* Dynamic Machine Models<br>
<br>
&nbsp;While we try and avoid modelling bespoke virtual HW in QEMU<br>
&nbsp;(virt/goldfish not withstanding ;-) there is obviously a desire in th=
e<br>
&nbsp;EDA space to allow such experimentation. Is this something we can<br>
&nbsp;provide so aspiring HW engineers can experiment with system<br>
&nbsp;architectures without having to form QEMU and learn QOM. There have<b=
r>
&nbsp;been suggestions about consuming device trees or maybe translating to=
<br>
&nbsp;QMP calls and adding support for wiring devices together. Given the<b=
r>
&nbsp;number of forks that exist is this something that could be better<br>
&nbsp;supported upstream without degenerating into messy hacks?<br>
<br>
&nbsp;* A sense of time<br>
<br>
&nbsp;Currently we have the fairly limited support for -icount in QEMU. At<=
br>
&nbsp;the same time we have no desire to start expanding frontends with<br>
&nbsp;the details cost models required for a more realistic sense of time t=
o<br>
&nbsp;be presented. One suggestion is to expand the TCG plugin interface to=
<br>
&nbsp;allow for the plugin to control time allowing as much or little logic=
<br>
&nbsp;to be pushed there as we like and freeing up frontends from ever havi=
ng<br>
&nbsp;to consider it.<br>
<br>
Are any of these topics of interest? Are there any other emulation<br>
topics people would like to discuss?<br>
<br>
--<br>
Alex Benn=E9e<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_MWHPR0201MB360986F251B942516E1ED0F38F789MWHPR0201MB3609_--

