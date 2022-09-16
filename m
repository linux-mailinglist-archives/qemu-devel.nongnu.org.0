Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBC5BA3AA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 03:00:53 +0200 (CEST)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYziu-00014W-8z
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 21:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oYzhL-00086G-70
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 20:59:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:61824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oYzhI-0001NH-C6
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 20:59:13 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G0x5C9018558;
 Fri, 16 Sep 2022 00:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=/FWRs7c51/eTsBs09evrgMyYZ0psviirUWQJ7H5NbD0=;
 b=UOyoZIpVFxRw126uVL2lTl2zPFUt/UirAtCT72TWdC2S2wxUh31LNrk7hQy6y80I1BFd
 TlnIKLWOUbWDGhYKaSZ4ohbBKynjy4RxvUcvUPCo8ijynNNvDkSP/ltCSVSYwDWz60Zv
 r0n+JmQ+bz186C05RfTkQpqSj0+6DwRPaNMLgAfYWmXA3YHws9hMG09j0J1qzrFExaOS
 MtFYdumypBzgehsk2FgUr2NecrZZ3MDEU84zXBD6j7ztszuOTgoXkwEy/ezPNbIrg++r
 WPKX/ZH0sxFShDrKdI0o2ukOj8ZYgnH+wnVPMS1T5s6Lc1E9mZdC8+VBSDObMka4f0jz hg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm90sguyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 00:59:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5BwV8LsevEebvbWmpR7zko2afbdFq+yCzCn+fqMv/1dcag8fDSjWzY5XOE2AChKQ9/vFWPj2qESWt96NEIQj0krm2Ayz2jQ59h4DUMKkj1Gpz7VTIS1Qp/bK5izvLP9Vb04OVH9zQseCFxayJ4Ncl80wpgmuMDuvi7K4YyBF1EKAbzfIdoGJ97Nql6G2FvGBMRT9aZ7VpFyGwkMMk2z6IWMQ0AKlamu0FQaB0PxelLKCkLQZ8VvKD7NVDT//itZ/K7zUxTQZEfksKitRAT3474u499w/rGdKZr6CO0DEtVp/CLAY3IvwkV8pj7FXuMptR5tbsWE6zRHnK6wqXusdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FWRs7c51/eTsBs09evrgMyYZ0psviirUWQJ7H5NbD0=;
 b=hJ67YI5M7vBXCxheBTMBMVOe3KyFiomWdoA/ISSv/mh4g0nBSAK5sMaeC1d5qHuTWtuz+WUwH2iFbniX2263yP1KEdB56uiLyYGxEs/qjP597Xxs0TT9Fxi8oWLZ5mVSc1GBgAI/5t5rRf1zhPAe6qfBylDU6AFVfySP9pTyZKH4Fse2zG7lrmdbvt47oL42BopNYBXMmQx6qGnJGSg4FOqgVuxsXh0V8ljxZi7Q5APKAzkwkLwekzk6LHhwtQs6rovM0JWIJOxwZCJ+EXcvikhuoXTaCPxeWCjlt2RifOfDD+Qi3X5gOfQgGD57mpwgOVjiiDaYvF+EOTEhDPPqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by MN2PR02MB6845.namprd02.prod.outlook.com (2603:10b6:208:1db::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 00:59:02 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::882:84ef:5353:3c33]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::882:84ef:5353:3c33%6]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 00:59:02 +0000
From: Brian Cain <bcain@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: RE: [RFC PATCH v2] gdbstub: only send stop-reply packets when allowed
 to
Thread-Topic: [RFC PATCH v2] gdbstub: only send stop-reply packets when
 allowed to
Thread-Index: AQHYt+VHtK7Xsiq0wE2jPUko8G5F7a3JEoOAgBhLdaA=
Date: Fri, 16 Sep 2022 00:59:02 +0000
Message-ID: <SN6PR02MB4205789F605DBB66A4A6E178B8489@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
 <7d14967366c0e3640f47a15e80d1cc911413cadb.1661946575.git.quic_mathbern@quicinc.com>
In-Reply-To: <7d14967366c0e3640f47a15e80d1cc911413cadb.1661946575.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|MN2PR02MB6845:EE_
x-ms-office365-filtering-correlation-id: 42d56391-3729-4eb2-f0d8-08da977ea55a
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GZ3lMg2lnf9Xd8ljgB8Sy0K3GoRG/O/i0vQP4Lt+5/N9k383MEIDHo+4STJT2vpxYYVlZPukPnYxBESjqCm1dAah6052zkPbXZAT1xuxp+LoMphTyCqdR5QMMJ5+B3y9IeS1JQb3qnrJeMBTFUv4mPxp67CTUg+ercct0jXitlV3sb//pnUPmjSlRwZRNz6AdJqpldrGvXvz35F0zT9O0k7rSeVlLlcDydRK77cmTQy6wiBf5LYBO0GKW8NrQGOFM/5oPQ6J6hmGyRYvj5mgK2JLiotrhoFkNXkXX0paK4C3Qno2JXTNyG36CoCJ7QOLt0syHS7CneWDYgKrYE5a5wA/N8oLd0D1X19lp9cHKzvpsnv3HEcfSdnYVHVt9I5MogzUz4UAVFv8l9YVqxemPEQ6Fvwg2rxIJzX6eiYN4dVEC531LaM3bU7DQohfLB49O/8YtqmlffT7Ky4qfmpPe5G8jDt+3+nobeDf5JZ04FvlaCzxnEK6f6qHQYwfK5m+aljty8w240nOj0Sli8INlQ2zpd6fjeYjAaeNenfE1NQDsGwYMk/BUcHxbEts/tAL8MO4W29KHGoepmrykzmPdWFCQnASMo7QqFcKIt1UIwCECb3vO5I10Rs2MMLAh5Jbr71exhei6Q/ud7lEYSxslLglmuNwOcGVPnIwjqsVzHrsRKUWi1WrBJYR7b/ORM5Cis/0gCRnaUj6ikwATqttq+xWuafLgxp0sgkmZWREYz6whM1Wylmduvi4kHqV8dN3YW71X6QUA0sxrHU0ASkyfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(478600001)(8676002)(64756008)(66446008)(4326008)(66946007)(76116006)(66476007)(66556008)(54906003)(316002)(110136005)(7696005)(122000001)(38100700002)(8936002)(2906002)(4744005)(9686003)(83380400001)(186003)(41300700001)(6506007)(52536014)(5660300002)(33656002)(71200400001)(55016003)(86362001)(38070700005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U+VDlhdmh+OzeyRA4DTlZF6cc85zzvUoGdm2xpzFYMjTQIQB90pKprZLbWKg?=
 =?us-ascii?Q?po6V1FwBN41Jb+pYLtK3/+YdqCtfiXXS+IollTGqflktGIX7nQ4cmg6qMuaw?=
 =?us-ascii?Q?5S7tCssCYsEq6cPZG2FpOv0xo3vriD9yIAeYo0E+sAfcGB0f8wsagM5isPlE?=
 =?us-ascii?Q?2lILv7S4d0hbm38n+uVqUu6h28dEIZju4YUOodlrIs5HlmR+RhBhpU2ztkhY?=
 =?us-ascii?Q?zBfxU2t8SJ72bFGX/Zhw0XLIbq31MvwgzoAIAEi2MCwrjqvGZqBZCtvMJmZG?=
 =?us-ascii?Q?DIxMMM5afSfDjFyXmL/eqbArENorSFDsM1ir4pb3qwv5dljfCwqM6Y7NO+mu?=
 =?us-ascii?Q?WtNNJ/w8z2t/XvsIBkiLul7ctI7ugKCgcZuqtBEUHGm/e9NdOGwDJrLYJXYU?=
 =?us-ascii?Q?6XpkLCUMI0+WPoFJ7d5WcyZaGvatVWv7YwRYZztP4VPf3hVWHxYpXxmLl7fo?=
 =?us-ascii?Q?uxrAqFGxmJ2iKXYKPPYjAGNJCe0Lhkm0crkmZR0DVFIyfRpWbhEArbFGxL0U?=
 =?us-ascii?Q?BM0sRWfbvwqNbLZHCfS24jzKleugrVpnXCIVo0ZYLf6VI1ORdtVYuaIxOK8V?=
 =?us-ascii?Q?JyGm5WVPTmQ+wK4hu2/3rTvqksoMjE/7Bhw5HMKsrUDIw+N1vK9RxIEESCqw?=
 =?us-ascii?Q?FqNrnIqqsd+zfzVefEOfWepyVkznU4tjouIG9R7iAisSU2TcPe0FBP43V8g5?=
 =?us-ascii?Q?BjCom+Y2RTrfk5rwjJ6At1Mcx/pX+33VJdo3Zrhpmj4g05o4oFTsm1LAVN4w?=
 =?us-ascii?Q?Qu1MKl0srL9XadHGM+qbegxRgSsN+cLhpYaXARefq2ng7VaZ3h67uTVLOw47?=
 =?us-ascii?Q?8YLvazvYdqd7Ut1jFttz91zqKQCwxrO6bT4NR/Iy38IE8HdGJkDDJaXHmrJX?=
 =?us-ascii?Q?oteF/imc7oIO+JnU4gqJ/ZUowdgY2R/gvlqBd5tEMdYVfw8aTrOGJkabKJN3?=
 =?us-ascii?Q?DbXc3Bc8iGqyULRsVzeMOmX9V447/fDfmZUMOHfFKhSTax2Vl4Ub7vRcJZfX?=
 =?us-ascii?Q?WFiGIbG0PxaB3hTQ+dt5WIK4yXI1Xpk1BJfxUtF95BJ5RGDlbNRKxZjPDOwi?=
 =?us-ascii?Q?oGxw+m1eRB6k0fhhGY2z4u3YXCV4cgd4vZ8uGq18Ou2fsw97fw+AC9LZHV6+?=
 =?us-ascii?Q?8m7t+HfNF1/NRKLArkjDrb9D0paTs+Yv1aMXtnfaOnIraCumxPyn5KHJc3f2?=
 =?us-ascii?Q?ThB1Wa0OlCUJhTtN3xP2H/mUrGePvVT3KdvAsqtwzUjlrZv8ffcgw42CoEDP?=
 =?us-ascii?Q?77uiaVjasQ47+cHrNhygsKZW2g26F1RL17EVpcux09ZnzvT5hyXbGN9yAwa9?=
 =?us-ascii?Q?rZ83EXhMFyOgAXlXH39AhpWIvylBREeQkA4HrR2bVJPB+PECvE3IoOJgN8vI?=
 =?us-ascii?Q?a2RW0Vc9yyO6BnmQ1meD90NdaKdeYxV0KiXoLaiobcsM7Y1n2iYf2V/V3Ty+?=
 =?us-ascii?Q?S5roOxlN0yKHHOyLnCgzsYSITEDjIcx/OAxZSpqM/XcZzB/u3v5Axls9Q08p?=
 =?us-ascii?Q?+Eqh3SZA6pRCmp8gqbpjb//lI6Ebeq25xkoVTjSNSelJdKYNg22XG9EdWmuF?=
 =?us-ascii?Q?Qi8huwsVf75Z/XBRdHwJCIXXJj4cxDyyDR4pzF6o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d56391-3729-4eb2-f0d8-08da977ea55a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 00:59:02.1751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rr3EGJTMCT0zFNKrj6SIp/V+N9TfkgSJiSlSwsojSzAbw5/kmHEGSNzMHMCEHiytL/8T98NCx6SFy4Xt5Pry0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6845
X-Proofpoint-GUID: SomxGoldsDNfUhkhY5933RiuWtdRtCo_
X-Proofpoint-ORIG-GUID: SomxGoldsDNfUhkhY5933RiuWtdRtCo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=500 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160005
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+bcain=3Dquicinc.com@nongnu.org>
> On Behalf Of Matheus Tavares Bernardino
...
> On Wed, 24 Aug 2022 at 14:51, Matheus Tavares Bernardino
> <quic_mathbern@quicinc.com> wrote:
> >
> > Instead, let's change gdb_set_stop_cpu() to send stop messages only as =
a
> > response to a previous GDB command, also making sure to check that the
> > command accepts such a reply.
> >
> > Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> > ---
>=20
> Gentle ping :)

Alex, Peter - any thoughts on this change?


