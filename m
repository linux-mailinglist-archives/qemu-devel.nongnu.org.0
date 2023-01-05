Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12565F299
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:27:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTmQ-0005gG-Qv; Thu, 05 Jan 2023 12:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pDTm9-0005eR-M7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:11:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pDTm7-00082g-VW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:11:33 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305CsJRr014334; Thu, 5 Jan 2023 17:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=rAPXDjdFi2wyfKoDkjBASA2hgtN1GJk+FQ8BD89zR44=;
 b=Sd1GOu8leJ6nAPTnqIdAMDCX2AhCL6Rwl9UH+QmnwhKU2EmzTLe5cQ1LL2QmlbNZRGdV
 MT55rAMzktuzjs385rK/y+kw+UqKiEhatDVEwhBbCwXFzcndlDSuChxLx3sJobWImg3O
 wO9Diix3YHNCqrjaAL80o9AXswjn8udAmf8bVmOepV6M+9lpGlwO8ZKePiC5Ajhqbwc6
 M2gUrnqAMzWrw6eFbTzlgm/BndtetW3Qakjm/gh6oetdpnb0VHVwFXnWpcngbRCkpFCw
 YeTzGEHqb3PKKq0xoUnmEi9Mb7x7ewA7RSxnfnS/YSBGnVRh+EUfwoMyVMJ1ViaGYig/ sw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwdckjedt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8QhJ/ujOqWWn03Qat58UQeIkEfm4OytDyT2CApWpDoXnbGS7uMTQj4CYDCzU/JCUbLLIWmafAEFGIDq4nbvHytdV8zHmkdxz8U2PSe1QYOWm2tzpSKCnx2iHjqrEH+FHnN12ZAxqCoqaKzPSUgrRpvL4q9RoqIA8BIJKAgVirr3JULoNl5oWsCSyK5DioA19i+11eFlt/DgJo0k7+JlRDIdXgILD6Vl8c5cTG+bBO7V/6udQZzD/FbDglPW2Zqs9DUah2l+9zDl26tz9sSs8XmG3vFSHsOF5laP3LkTkcwa0J/qlIqjQRiCM3ls2lfQ7K4K6rwcZ4YKI/on/+MD7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAPXDjdFi2wyfKoDkjBASA2hgtN1GJk+FQ8BD89zR44=;
 b=ltA4eLZ0hLxkoKyqmJpVqI8BpiQFNDcOon5exBtYfXL/AgS4BTw/fQDd/m1QiydbibOuyNYle4Mmr0D3QJDFqD6b14/dUO6isCYxJPRqe+exV7W3hNxB+3lbyciTtcqTI84WUOHxtaZsBl1cq19P4gOwEicNcUKOMuP4uVOjWgaW5UxBVymoC+KwqTwchElfJPcFvx/CL9KbBtpMBXrjMPkJNWbG28witrrCC0QK5OQSxA/u8hKrkmRWLgKvoaNPVaLD7N9sWRoXvymHXTH4lL2SUqe5akE8pOGGTrnh2vwVyPjQu3kPxdWOTltdjdV0fYFIFPJbW6QI1iiG6owpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA0PR02MB7259.namprd02.prod.outlook.com (2603:10b6:806:ed::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:11:27 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ee73:33f1:8e40:ce2e]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ee73:33f1:8e40:ce2e%7]) with mapi id 15.20.5944.018; Thu, 5 Jan 2023
 17:11:27 +0000
From: Brian Cain <bcain@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, "Matheus Bernardino
 (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] linux-test.c: Remove unused but set variable
Thread-Topic: [PATCH] linux-test.c: Remove unused but set variable
Thread-Index: AQHZISIaJvyeQLf7FkKoaVe5vNQ13K6QDqTggAAARYA=
Date: Thu, 5 Jan 2023 17:11:27 +0000
Message-ID: <SN6PR02MB4205BA81674DDA83EB28DD5BB8FA9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230105162348.16725-1-tsimpson@quicinc.com>
 <SN6PR02MB4205CB5F2BD8969E399A088AB8FA9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4205CB5F2BD8969E399A088AB8FA9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|SA0PR02MB7259:EE_
x-ms-office365-filtering-correlation-id: 26bb7adb-5930-46d8-9f52-08daef3fe17f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SeTDhIKstWaAHKaD7JPyv67yLmxch8i2S5e6tWbM8aYi2pxABXvW1e4yo1wOv36MfYQoWvdrq0vpk6bAzdRttHRuXlC0O/R1FtldKxI/nwk1IE3R6PWkWWlPwf93hNzz4H2ZfqwYDlKoZsTvdedVkSTkkOajyMBgR9QK1w9QMRwNOHWw/f1wsDhVLQihgxYywK1cHEykqQ34cvdSIDcaGoLdaJ95L9B9jYJbhYQ9uGKwRoNPZfGXMbHeMr40q1nx1+KBoE3uABTa8WAIIQzCWgPl3YLFS7aOjlLn25FyVIzd81QF0TdgNYhgGpCAChNUkIy1Uafa4brfs3rkTI3hTMCvztsVv2OKjks92zn1jQexjxMehH5YsPABSkiFqzojNqlU6IjbTmLeYBGepRvRVKl5Xk1eO1yiAsAbmCdHoyqLxURbsax5aKvEY4QFv+ciIp9Z63urs6w+AHLuAa3vIOyKqNHv68X9I+nepXbHOYKpl43NeeoHydcYPL2+klZxuksVhJ2kYGLjqJFTw19QtNer241bMtkGrQfM1+D8zbGlbH0f8xkz0pUYGK2Fk/J/SUm9kH7qJO63SuzQN7qcMcyfVHedreXQ3QJCe8h89sjuhAlMe1yOOjNV3SZ2xEmz0WeSuO7Q1xVzh1gtdV/+S4+90ie5AXtg0GDGx5F04hDqn6VIxwJg6heN7RmQVIa6zc2TsCkiSzky6lsinY8Z95vmG9mIPtq9irA4ZOZmLLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(52536014)(76116006)(8936002)(5660300002)(316002)(2906002)(54906003)(4326008)(66446008)(64756008)(8676002)(66946007)(41300700001)(66556008)(66476007)(110136005)(478600001)(71200400001)(6506007)(83380400001)(107886003)(53546011)(966005)(33656002)(26005)(2940100002)(186003)(9686003)(7696005)(55016003)(86362001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE9Ud3BUY203a3lMb1NjUnMyWUd2Y1prMkF2UXBBUTBhQUlDbVM2SkhTTGNX?=
 =?utf-8?B?SCtQTk96dWxjRlJCdS9RemY5ZFYrYngyRzBSaHlQeHE5aWtLc000d29SVk44?=
 =?utf-8?B?RTIrdEZGQVh0SXFFc2F0cEpxaHpyZVdmVE9wZmFKbFVjczh3NnBhbURIKzhC?=
 =?utf-8?B?SUZVb20vUHY0M3ZObDdyOFByL3pLYUJYVzFpWFVtckZHbFkxN3VCYkc4eWJS?=
 =?utf-8?B?SWtHTklwSGVUVkgySzFQdUQ0UndNWTVkOFlJTmp4aFlDckdZb3NKVkRzOFBs?=
 =?utf-8?B?RUhwbDYxMlZYSFNoSlNPcWkyS0UrRHZiYlRyYkxEejcvTGh6OVVFU2tpL3ph?=
 =?utf-8?B?U1c4cmdrdE50M0lZU05VRmZqRWRNdzN2aXJBL0ZwM3JIYkdtNHkrSlA2ZTlP?=
 =?utf-8?B?TS82KzRiekR5NHA5cVZsL3FpZzR1RzMzbGY0ZjFuOVFTY082U0d0ZmxZVHlz?=
 =?utf-8?B?T3dRMURnL3NxNS9pTXVaNEJiOWMyNGFueDFEOGVzT0tqakxDcXpWN3EzTVJW?=
 =?utf-8?B?TXBuUm41MTUwRG5TMXFsb1E5dDM4bDUrb2JQMFZwRDZQQUlVUVpCNlFYVWVj?=
 =?utf-8?B?STRMQklqUmxjd0FoUEwwTDhxSnlFc0RXUXhUM2hVamRNZHlTZ3pQb3JlNGdF?=
 =?utf-8?B?STcvNzkvd00wblNHc2VoZzhrbUdLTmxCM0dhN1VDRlk2MFYxUWN2MVFOYmQv?=
 =?utf-8?B?S3l6blk5d3hpUzMyeU02QW5YZVIvSW44MVJoTkpYejRMUDlnVWVPZTRrOVdR?=
 =?utf-8?B?bjVreS9KZUQxYUM5RTZyQ2ZLVmNsYjVaR25hU0tKRUxSanl1VjhSbTlkMVNy?=
 =?utf-8?B?UUNUdlRoS1IrV1ZlRHVaTm1Vc1FNaWp1dnVoNDE3c2JKc1ZpYVZBaXMrQ1Z1?=
 =?utf-8?B?U3AvazVDQWJHaVp4cjJ5c0dqL2wxVFIxUWlBcUR3dE1oZXRmM254UjdUcVM1?=
 =?utf-8?B?OXAzcU1rMXhyNkV5OHFISFBjU24xS1kza2NpbHhCWi9NczRaS0w4WUVqbWdw?=
 =?utf-8?B?UmJkK1BPdmpPaS9PMlRvcWY5bEJtak9lWTgrM1NrUUVzWG8yVUxxSE92bXEr?=
 =?utf-8?B?ZVg1Y0E1dy96T1VnbXZsU1grOXArUmRzY2Fab3BXVm4xSUhNZUdEMk9EWWcy?=
 =?utf-8?B?TTd1KzZQQXJITkozdm9ZNGxqbTluSVJEUkRwUTJDcnhnalNmeDg0cDZ0dGgw?=
 =?utf-8?B?VWZYUXlUb1RjdTlzNGpyZnI4d1R1R0F1QWh4blNNS0U0Y1JCNkZxRkRsZFEw?=
 =?utf-8?B?ZWJpdm5OWEFjaW1sY21VK2tFYlpvMXhUaXFEdFFSY2I5ZExXVmFaakdiOWN3?=
 =?utf-8?B?azJKT2lwcVdzUTBJTThJcmgvdHZ0ditiaWhyY1IxbXA0dnByQStic2JTSG5r?=
 =?utf-8?B?d095TFRsNWY0RjdSMmxNc2pEUXFWb2VSVjBCMGdpZ05ZUFhOaUp0MHM3VlYz?=
 =?utf-8?B?VDdTQjJLalZ6V1FkaEl4TVBMR21ReWx1Q255c3EzSWpYMDFIOGtVM1ROWFRk?=
 =?utf-8?B?VFErY0ZNR0E1U0FNQys2OFVaTHcyeGp2NExEVjdxRHFXNS9sMTFmM280MEx3?=
 =?utf-8?B?bG1TVnY2Y25Ka1cwcks4WUxFOXZHak1FdXJDZFZsMlVZMGpWNHBjUDMwU0dr?=
 =?utf-8?B?MEoxTnJwMjRPUWxOKzRvZUFmWjNVWXpSR1VGSUV0ZWhDbmtFdE1PVzhxUjVU?=
 =?utf-8?B?bTRpZnhCU094WmZ6QTFUT3UxQm01eGRlUWtSamM4Z0t2TVJ3TEY3dVltU1cr?=
 =?utf-8?B?WTF1ZzNkWFpkcm5CQlp3UWxRZ0tXMnJNYmEvUEE0TGVCajFPOFRiODBrUUpK?=
 =?utf-8?B?UDVuZ3RQYzl2SzI4MHduYi9WRjV0NVZWdkdPS0cvbFVveHRSVTMxWFYwenZ2?=
 =?utf-8?B?RStWNW9obTJBZHFoM24xK2ZVK0M2Y25PcDdub0RtWTJVOXpaNURjYnlTcWNo?=
 =?utf-8?B?R0Q1Z3dlT1Y3YzhJSGFUUWw1cC95L2dUMmcyUWw5d254TzRGVmtIb3FOb0Ex?=
 =?utf-8?B?eUUzT0w1QXdWQ1pxZmFVSDd5V0ZsOWhNM0s4Q0luMUN2Yk45aGVVL2d1MDly?=
 =?utf-8?B?NENyTHFmVGJMbWR5WmEwSFV3em5IK1ZHZk1ZSzJZYkhPUGNCK1pPd25MK25O?=
 =?utf-8?Q?DM2exZMhr55XVp5e+P8EhspX2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AiTiAuCrTMTVjo64UlMHN3u3ClHQJci0imcxWrLjjGusqi5wTI6+F16qhb42AVNaq0JyeQqAhZBR3wmzlUz1q0+jLiZEN/zpnd8TCKRiyB1SU+bs8PoVe1i8QuzfvvJltY0g7uGdd2Kx96QTGjNHc8/JzsROn3URBecGHCAmUgp3E6BFqIHw8M0fc5Fnse/3h2jAZsViWbzZIH3hhWrYqxT7C6lveloOO7YVGKNDy/N0K3+P4yPXOWK5uM6jk1iNvMnMaSmmX4Vk6pQoM7Ld2fO8qBmrTo7hDNCY5OYYe44mye1xrZeV9o3JdZsSQ9TR0+F3Fk/QiGkXaB51x3Z4H8J6wZxRDNocxD9AiJp9Lm++e6bWark48EZ6T0GeihJPvvpC2kB9Xj8Aq8ESyGiWnC6MTBYIRN3PcZ71MTb8jLb6ESOcdud1LTnu9qdpyOiVBpiKQjAg50wn2eg2tSEbtBv/70iGZDB722eTCNoVJHHAjtNtMtzZeokGqO1XZBGlyIDKrxQUldZhe+tXd0sz8rk4RyCCZu4/SFwINETbL42seeaj10BRmBapV4Q5bJFyriPqDd/hk9WkHoeRyKkiTHzdV9nHvERzsvQBNPo4A36mOSykZEomkjiLBjmRX2wuHD1qQQrT95Pl96EQ4qsPy5j20cA26fA3e4Rw1hLO9Rf6iW190zDgRSzcd9ZzPEBN5yGvHBp66v0q/JL7vB7Mo/hmbO7SHBeXS8gvsKGQ3ndAzE4J/1AtRG1Jw8C3hMJso5WMEgf67TdTUg5awyq9jJyRJ0iTEP269dew774ibrfCZ0U0BkCSjfbL9h3zFspEhbnOvSWHtNiZTbpw4kqIraBeig6ntH5ifwWPgvTljWE=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bb7adb-5930-46d8-9f52-08daef3fe17f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 17:11:27.1093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ1HuvBGgegG60smTSGb1O+aO9GL95Z0SU4Pp+stsiOUN8D2VTnpCDJ5EQ/POAMwAKCUdVSDWBxMs/6+tay3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7259
X-Proofpoint-GUID: ikSNADeOiq4bL0fL02bxf-RZzGYuHzKh
X-Proofpoint-ORIG-GUID: ikSNADeOiq4bL0fL02bxf-RZzGYuHzKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=651 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050136
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmlhbiBDYWluDQo+IFNlbnQ6
IFRodXJzZGF5LCBKYW51YXJ5IDUsIDIwMjMgMTE6MTAgQU0NCj4gVG86IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gYWxleC5i
ZW5uZWVAbGluYXJvLm9yZw0KPiBDYzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gcGhpbG1kQGxpbmFyby5vcmc7
IGFsZUByZXYubmc7IGFuam9AcmV2Lm5nOyBNYXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxx
dWljX21hdGhiZXJuQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBsaW51eC10
ZXN0LmM6IFJlbW92ZSB1bnVzZWQgYnV0IHNldCB2YXJpYWJsZQ0KPiANCj4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWlj
aW5jLmNvbT4NCj4gPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA1LCAyMDIzIDEwOjI0IEFNDQo+
ID4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgYWxleC5iZW5uZWVAbGluYXJvLm9yZw0KPiA+
IENjOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyByaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnOw0KPiA+IHBoaWxtZEBsaW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBhbmpv
QHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA+IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVy
bmFyZGlubyAoUVVJQykNCj4gPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gPiBTdWJq
ZWN0OiBbUEFUQ0hdIGxpbnV4LXRlc3QuYzogUmVtb3ZlIHVudXNlZCBidXQgc2V0IHZhcmlhYmxl
DQo+ID4NCj4gPiBTb21lIHZlcnNpb25zIG9mIGNsYW5nIHdpbGwgd2FybiBvbiB0aGlzIHdpdGgg
LVdhbGwNCj4gPiBUaGVuLCBpdCB3aWxsIGJlIGFuIGVycm9yIHdpdGggLVdlcnJvcg0KPiANCj4g
VGhpcyBjaGFuZ2UgbGFuZGVkIHdpdGggOTgwNGRjZDI3MTlhNDRkOTA5ODJlNjFkNDY2MjEzZTUy
MmM4NTRlZg0KDQpSYXRoZXI6IHRoZSBlZmZlY3RpdmUgZml4IGZvciB0aGlzIGlzc3VlIGlzIHBy
ZXNlbnQuICBNYXliZSB0aGUgY29udGFpbmVyIHJlZ2lzdHJ5IHdhcyB1cGRhdGVkIGFuZCB5b3Ug
d291bGQgc2VlIHRoaXMgcHJvYmxlbSB3aGVuIGJ1aWxkaW5nIGNvbW1pdHMgb2xkZXIgdGhhbiA5
ODA0ZGNkMjcxOWE0NGQ5MDk4MmU2MWQ0NjYyMTNlNTIyYzg1NGVmICB3aXRoIHRoZSBuZXcgY29u
dGFpbmVyPw0KDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0Lzk4MDRkY2Qy
NzE5YTQ0ZDkwOTgyZTYxZDQ2NjIxMw0KPiBlNTIyYzg1NGVmDQo=

