Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AB6F4A27
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:10:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvNO-0001xd-B0; Tue, 02 May 2023 15:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptvNL-0001xK-1w
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:09:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptvNF-0007bL-E3
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:09:22 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342F5Bka005550; Tue, 2 May 2023 19:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=83miS7tzsoNVPbRkulGn7XMEcuCsr2EuoKPyi0l8WVc=;
 b=K2Y2QXIi0uIvBZksVUp4KZ1L2PQFabjNKwsV97i+eCxSE5ssmL71IFTnxC6ZLqtYujez
 zbFFsGhfbhY41tHxAr2Fmmqz3q0ncQ7RfCzhjNK5gBiRJykFBq+O3Fd1cw1gId9qzOV7
 8pZlim2F0hNY+lbUojMMYIkQYZqjsZNBnCX5P+VjOHH787Qd+THuFI4NNH0bshWXJGGE
 VvcFseSoHVGm9ga1IVz/Day24+cGjxZCO1QpzBmZ5qSduMnZaw7WhCn+AzK+D7NW7MDk
 41zE0Z6UiJ+tsqiIo32bE1CzI7vkY0Lndoz1X+P/QFDUnKdGQcvYvDbLx8vwueJlqxxp 8Q== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb4us8j9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 19:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPj5BxmsrPkLVgB91JRbHF0f3Q+jDSN4PFb3JbUatW0G1aIBVEUzAnpghn6r9/zB48Dl9btLRhA7C7o+nEzwHAr3SGMTbnq6nqFB6klJ+f4LO7LRWMU1rwJPSsdZvpKF9qiGf483wnBmyEcMf8GnS9CNxbAxtCZBXEFIo2X6g6pyvOQ3SpwuRdywgEwvRwTfdLtb/baAdwpVuLxGJWjRrmlspwRJmgOUMZp66TVTbiPATDWn8+o/2s41gUtUaQWatQTdaKiSjIVQUtu95J5u8L5JaDTlNtJ2kpCHWz+bKYTiiPxv7tEM7pmXxrBCAHufiAQFffOvGcVfhrDQAA3EXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83miS7tzsoNVPbRkulGn7XMEcuCsr2EuoKPyi0l8WVc=;
 b=SDDmjcG+LrbuoRhLjsQlYvts6KqTNY85jD2TJ6x2Eg0NRZNimNcFY5DoK5mdKhK2c78hBhrj/aLlFKIQid+TM+59iAt3S1q9WUZ8uhCyQ43tg5ZCKejetIybhOrpKMApFt2+ITKF6//LMgjmM+8RiumNfSCogyxGVEmIBsR9b+HJhoRVZ1ELF+bMH9U1qyhpGcgo8jlnguPa139GJJa5JWAE1yj6PwovqXUv1f+OA6e9MLAqdPpk5iMyYBeWCmUEVQvRcrJ4kNsS7z5Qlx0vuUd4C6TDT4o2ZX+rH6Q5EWQOkNEJfEIRvDXmvybCzfbAXZK7zEkC1sJee1Rxee6KMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB7951.namprd02.prod.outlook.com
 (2603:10b6:408:169::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 19:09:06 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 19:09:06 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 3/9] target/Hexagon: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Thread-Topic: [PATCH 3/9] target/Hexagon: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Thread-Index: AQHZfP4Z5mmN95DGD0GA6Wo75q9u169HFB0wgAAM/ACAADfMIA==
Date: Tue, 2 May 2023 19:09:06 +0000
Message-ID: <SN4PR0201MB8808DC2834CD3B4326743E90DE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-4-richard.henderson@linaro.org>
 <SN4PR0201MB8808A13255BC8104B407C816DE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <31b4d915-b8ab-ec6e-45c4-36089b34fc40@linaro.org>
In-Reply-To: <31b4d915-b8ab-ec6e-45c4-36089b34fc40@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB7951:EE_
x-ms-office365-filtering-correlation-id: fdd7318a-9f2c-4b18-e8ef-08db4b40b368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lls6q1HsNUcFZF8GL3xDo8wfl4pXdAYHs1J/C2Zx9l9nor/oWyihlEABMsJex6o7G1Swv/mofFB1IGmAH+zqzT2qNidUX8l4jW3CrGZhkC7/OrpraV5JwSuKi+0ukiYZpficzdeOuhoj+mZApKZibniq8CpWLTlHM8SLJkSoIQ3ZiMMNuYuVmTdNMtg0g3vrcKjYxQvj9uJH2qSlCLZuC+0WrGvnICmBzSlbi1kf4mDqFaMZp3U5xPn6s0iGjAGXBUSng9bQYdCHXrviojLEaszE+uEyt+HwV49yNl0MDTibHrsUIcDwCbNABAJAZVlJhKC1PpVJfA5izv3HPLvC7DwXV1Imr1NvUroNsorvjpmCfHbFTeD47qiErDwNvw/1t9pQGw3nl9vCQTgka+wOPjMem96kxTTwJXCA1W49hctrmV+kKDejzeM/VHa2m8jbYLdLR+1Kq3UF5IVusZpMEeDBJWHLYAWFHoO/nPG9kkeC06uBuZe1V6HHGiuG8iH1LAze/gmQU5Ohj9OHbBBUoQ0t8/TVcsC0fE+AExOWeQYUxVzpiPlg57jmxaQbE12xBMyDS/loD+FkR9CVRruWslQWX4WHBTT6kQ8NHsCQfNR40yb5JerePQ9V1A1dzruP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(186003)(7696005)(71200400001)(83380400001)(53546011)(6506007)(26005)(9686003)(110136005)(33656002)(478600001)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008)(316002)(122000001)(38100700002)(8936002)(8676002)(52536014)(5660300002)(41300700001)(86362001)(2906002)(55016003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajB6ck56MC8yZVdsT3M2d29hdTAwazFQQ3RreXJ0WWlYMjRNRHhDMDBQQ0NM?=
 =?utf-8?B?eFV5OEswd29NSGFQb1lwUW90SjgrN1NhdVljUzh6ZWN1ZkVJMUhDUFcwaytL?=
 =?utf-8?B?VU5Sc1RSUW50TjdhcG5aVHU0MmZ2NC82d2ZGMURyL0txa1VSVU5HMXlob3o2?=
 =?utf-8?B?L2pRVFdDZTB6LzJHYmk4VDd2eWpDTmhwTGR5OXpZNi9DMW5McTQ1SklNY25i?=
 =?utf-8?B?Skx6NnpQelhya3JoanBHZjhSdEdHU3llQ1BrdGtCRGxReUtvRTJQZ3o5REgz?=
 =?utf-8?B?T1pKWHFmbDJaRlRKdGZnVjNJeWJxUnVSc1FZeE1zYXRJRVM1ZnFBdi9xTjNt?=
 =?utf-8?B?YTRaQm9zM0V4cnUyMnQrWGdRSVBrQysyWCtINERKTmhYTlZlSzZIaG9CTDNv?=
 =?utf-8?B?MEpzdkpMYk0wWWV2UmoyT0JUWHdqTC96SDZuMjFOSXhMSk1kRHJVWTExNjZO?=
 =?utf-8?B?ZG15N2Z3aG5xVjRJbGpvMHN4L3hodndTK2s2RlFpc2JKOHVOV1Rod3NNNWth?=
 =?utf-8?B?WEMrbzU4ams0cFY2L0VCcnNtM3Q5VTFGYkhyVDRLQk1LUTUzM1NaZGk5Zjln?=
 =?utf-8?B?TTByYUFGNnRQMnpXNWdqeG4rMzJXZVJWbWpkMlV2OTMwNnM0NFhWYWRBTmJz?=
 =?utf-8?B?NDdxdWFQMEhPVEpJcUxMdFdrRHdyODJqN1VEYjE1UnJUaTJoNjUvL000Ni9I?=
 =?utf-8?B?bStMTExMVGFLV3A0eXhFOW1tbUpETFlqdEdjYXdSVEZUcFUwZStXU2pad0p3?=
 =?utf-8?B?TGNMRmUzYWtWYjBvVHR6Zkk3c3RLbkpGWHlSOWlSREl1b2p0bHVPUjNtS3Nk?=
 =?utf-8?B?aUlQTXMwZDcydi84WVREM3U2UEdFUWtFMzlvUlJZaFZvTGpjQVROSHYvTmNt?=
 =?utf-8?B?eG9hNWFkdHp5SXhITmpXTWFaUHpLZ3FBT0R2SnFvVTBFWHVoN3g4ZUtqN0Fa?=
 =?utf-8?B?NmZYWFpWQlZ4clN2RUtxL0VaS29HbnJPKzM3Y0xXY3BzclFnVGRCdm1WKzV5?=
 =?utf-8?B?VDJTRUV3NVJxMjh4Y1hhMnlNb0o5L2Zmb2JZbXdlZU5BcHF4SHV1SGNNWmtJ?=
 =?utf-8?B?c2x0Ry9SZnl3WXMydTk5SU9FcE1KWFdVcjZET2s0ZjhIM29VTnFINzNSVUEv?=
 =?utf-8?B?WkgwUElySFhDUlRoNlMxdkQzeEUwN25yZVZtWVlZUmprY1ZCZkdvN1JCYnVS?=
 =?utf-8?B?K2ZGU3ptQVpQdFFWSzZlVjg3aXR5WTVsRzRqdks0bjZWUVBVZ2x5Tm9FYUZD?=
 =?utf-8?B?RXh6VncxSElibkZPbU96ZEtqeHhRZ055OElmT01rTEphTUZ4ajFrWitvUmFp?=
 =?utf-8?B?TVZOVXlBOCtaM004VWExdG5jYUxSVlNZSWEzRVlMSjZOVy80Z0FwOUNpVkhj?=
 =?utf-8?B?ZUZjdlR5Qjd0Qm5iSG5hb3RtNG45YXFySHNxc3NvR3dBYlNURHphTnBBYXRp?=
 =?utf-8?B?UFNqcytQTU9WNzdsQjE1RTBpMk1DaWdxVUpXT0NWV3hFVFJEbnVGWDNuSXNI?=
 =?utf-8?B?aXdZZkV6RkdjRGxUVUVDZE1aL25STFFQL2R2NVl2a0l2cklnV0cvNjJxUlJM?=
 =?utf-8?B?MDh1VXFvWWViUUVyVDJ2cGxHZDY0VWVtS3VaUDU3anJQU1NzdnpvbkR5YVZG?=
 =?utf-8?B?R0w4UmZEbkZJSU5DbjUvZ29nMlJQcnZ6OFZlQ1FldzZ4QnFGMTFIZTg3REJF?=
 =?utf-8?B?dUtCcEFaK1diQVlpenQxMlQ5ekhxSUZIaTZzNjUyYUtkak10NXF1NDgySWYz?=
 =?utf-8?B?MmRyakZFM0ZIeUdMMHFUd0EvampJOFNVbC93dXF5UkNHbmN0Z24ycmJOWU9i?=
 =?utf-8?B?YUxBcjlwZGdJT3dtWGJ3UC9Cdjc3SG9WcHc2ZkhnRjdhNGpmbHprdE9hcGxN?=
 =?utf-8?B?WHNRQ204WWQ3THJKMjl4Vkh5d2VteUQ2emUxRm1lK2xGdisxZm9ueTJ6S2hP?=
 =?utf-8?B?Vi95U0sxcjBOcU15U1NYWDc2VWNleFZVVy9FdFViTk5vZjFJMTlud0k1TG1p?=
 =?utf-8?B?V3h1OG42QkZWQzFBeFgzU2lJaXhPdWgxVkhEQVZxaE15UmUwWlRkK1cwME01?=
 =?utf-8?B?akdnZDVVYUZJclpobFlpSGF4bUJ5OU52YVFOUFVIMmF4M3NhNkRrYVlidGpR?=
 =?utf-8?Q?6uh3f2EZH0Qiow4perVuMBHeF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5/p8bREzYk9DealFbvVJepvELjZFVySUw1M2saBlABn+Z/y5wRI5gJwsUhF3/3i1PZ4vKAPSfB5Cox1hMgJ6Qw++YcuBaVLpt1HUSU36gyb6HoMhBEWzJTxeBHnWs1JAwk/02lhkxNek7oFj+mcBahK2vcE/C74OYgjRLiBePR031qHaT9F2Bapbu+4u+qKveWmxyczRBvdA4RZMs7ZN8UkA/rGde1mTyGm42dAZ8BiU6haFEtLIjExZhD5dDBncxKj3f4IoJfy6eAEM2ABwPaapG6MvddPqNmNPP4rQBVJaCMOOWatZQ/r9Mr3xhOFjD6v0CQD7a8I1dr4whNjsF5X5orIbUVQP1veK/5w8RfJvAtqquYomKURbPBd8/OZM/iSGhFmilgBd0hIrTFZx8QQyqa07vUom5afqyWUWsmSlHcEq/bWHjIvvw+iGY7T5C459jEdKaSlD+2eDEAnGXinjp6SVw2uQxbv0Y8+8C4TKTQ5jVEWo5m84SKIUS09FMQcyas7iJhiQcejm5oBxeg6T4Hnsv9kq2JKpska8H97eCq2AsXDp3+DqdslHmHUgHlkHWfbx4PDc9BIZxWU6p+Fkz91vL4769cIE/PJtGl7UiKfuo3jNmaGNnt7/mtJpIUFgSydX7prFZl1hwrQYZy7MTcAFcxzQ+DN/BTNWno368C76KpxOH/BcKoFi/e/KRm1a4kZ4ICICWV/qIJ5ECmtqZzEapMCPUjo7xCFt8ZLuyRvWAkvoGU4Hz87CvKRDT/CVpgMwdBrQjEhiohX7Kt9HQ4QkJKqrBs7HlXDnHHo=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd7318a-9f2c-4b18-e8ef-08db4b40b368
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 19:09:06.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ye/hY9TbEpB6XDAFtsTdt1OeLbA6FWHISUdtE4APZGTfyaIkNzTd0pi/57lGWC1Qqy7xjSHRECjCYksJv2ViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7951
X-Proofpoint-GUID: K8Qj6SlKpVeNYaxnsnel5YotEs2WvqTf
X-Proofpoint-ORIG-GUID: K8Qj6SlKpVeNYaxnsnel5YotEs2WvqTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_10,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020164
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAy
LCAyMDIzIDEwOjQ5IEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzldIHRh
cmdldC9IZXhhZ29uOiBGaW5pc2ggY29udmVyc2lvbiB0bw0KPiB0Y2dfZ2VuX3FlbXVfe2xkLHN0
fV8qDQo+IA0KPiBPbiA1LzIvMjMgMTY6MjcsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+DQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IFR1ZXNk
YXksIE1heSAyLCAyMDIzIDg6NTggQU0NCj4gPj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0K
PiA+PiBDYzogbXJvbG5pa0BnbWFpbC5jb207IGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbTsgVGF5
bG9yIFNpbXBzb24NCj4gPj4gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgYWxlQHJldi5uZzsgYW5q
b0ByZXYubmc7IGxhdXJlbnRAdml2aWVyLmV1Ow0KPiA+PiBwaGlsbWRAbGluYXJvLm9yZzsgamlh
eHVuLnlhbmdAZmx5Z29hdC5jb207IGRhdmlkQHJlZGhhdC5jb207DQo+ID4+IGlpaUBsaW51eC5p
Ym0uY29tOyB0aHV0aEByZWRoYXQuY29tOyBtYXJrLmNhdmUtYXlsYW5kQGlsYW5kZS5jby51azsN
Cj4gPj4gYXRhcjRxZW11QGdtYWlsLmNvbTsgamNtdmJrYmNAZ21haWwuY29tDQo+ID4+IFN1Ympl
Y3Q6IFtQQVRDSCAzLzldIHRhcmdldC9IZXhhZ29uOiBGaW5pc2ggY29udmVyc2lvbiB0bw0KPiA+
PiB0Y2dfZ2VuX3FlbXVfe2xkLHN0fV8qDQo+ID4+DQo+ID4+IENvbnZlcnQgYXdheSBmcm9tIHRo
ZSBvbGQgaW50ZXJmYWNlIHdpdGggdGhlIGltcGxpY2l0IE1lbU9wIGFyZ3VtZW50Lg0KPiA+PiBJ
bXBvcnRhbnRseSwgdGhpcyByZW1vdmVzIHNvbWUgaW5jb3JyZWN0IGNhc3RzIGdlbmVyYXRlZCBi
eQ0KPiA+PiBpZGVmLXBhcnNlcidzIGdlbl9sb2FkKCkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiA+
PiAtLS0NCj4gPj4gICB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgICAgICAg
IHwgMTQgKysrKy0tLS0tDQo+ID4+ICAgdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAg
ICAgICAgICAgICB8ICA4ICsrKy0tLQ0KPiA+PiAgIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2Vy
L3BhcnNlci1oZWxwZXJzLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0NCj4gPj4gICB0YXJnZXQv
aGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKy0tLS0t
LS0tLS0tDQo+ID4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA0MiBkZWxl
dGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5j
IGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgaW5kZXgNCj4gPj4gNTAyYzg1YWUzNS4uMjQ0MDYz
YjFkMiAxMDA2NDQNCj4gPj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMNCj4gPj4gKysr
IGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMNCj4gPj4gQEAgLTMyMCwxNCArMzIwLDE0IEBAIHZv
aWQgZ2VuX3NldF9ieXRlX2k2NChpbnQgTiwgVENHdl9pNjQgcmVzdWx0LA0KPiA+PiBUQ0d2DQo+
ID4+IHNyYykNCj4gPj4NCj4gPj4gICBzdGF0aWMgdm9pZCBnZW5fcmV0dXJuKERpc2FzQ29udGV4
dCAqY3R4LCBUQ0d2X2k2NCBkc3QsIFRDR3Ygc3JjKQ0KPiA+PiBAQCAtDQo+ID4+IDEwMTksNyAr
MTAxOSw3IEBAIHN0YXRpYyB2b2lkIGdlbl92cmVnX2xvYWQoRGlzYXNDb250ZXh0ICpjdHgsDQo+
ID4+IGludHB0cl90IGRzdG9mZiwgVENHdiBzcmMsDQo+ID4+ICAgICAgICAgICB0Y2dfZ2VuX2Fu
ZGlfdGwoc3JjLCBzcmMsIH4oKGludDMyX3Qpc2l6ZW9mKE1NVmVjdG9yKSAtIDEpKTsNCj4gPj4g
ICAgICAgfQ0KPiA+PiAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IHNpemVvZihNTVZlY3Rvcikg
LyA4OyBpKyspIHsNCj4gPj4gLSAgICAgICAgdGNnX2dlbl9xZW11X2xkNjQodG1wLCBzcmMsIGN0
eC0+bWVtX2lkeCk7DQo+ID4+ICsgICAgICAgIHRjZ19nZW5fcWVtdV9sZF9pNjQodG1wLCBzcmMs
IGN0eC0+bWVtX2lkeCwgTU9fVEVVUSk7DQo+ID4+ICAgICAgICAgICB0Y2dfZ2VuX2FkZGlfdGwo
c3JjLCBzcmMsIDgpOw0KPiA+PiAgICAgICAgICAgdGNnX2dlbl9zdF9pNjQodG1wLCBjcHVfZW52
LCBkc3RvZmYgKyBpICogOCk7DQo+ID4NCj4gPiBEaWQgeW91IGludGVuZCB0byBsZWF2ZSB0aGUg
dGNnX2dlbl9zdF9pNjQgYWxvbmUgb3Igc2hvdWxkIHRoYXQgYmUNCj4gY29udmVydGVkIHRvIHRj
Z19nZW5fcWVtdV9zdDY0Lg0KPiA+DQo+ID4gVGhlcmUncyBhIHRjZ19nZW5fc3Q4X2k2NCBpbiB2
ZWNfdG9fcXZlYy4gIERvZXMgdGhhdCBuZWVkIHRvIGJlDQo+IGNvbnZlcnRlZD8NCj4gDQo+IE5v
LCB0aG9zZSBhcmUgaG9zdCBzdG9yZXMgdG8gZW52LCBub3QgZ3Vlc3Qgc3RvcmVzIHRvIGd1ZXN0
IG1lbW9yeS4NCj4gTm90aWNlIHRoZSBsYWNrIG9mICJxZW11IiBpbiB0aGUgZnVuY3Rpb24gbmFt
ZXMuDQo+IA0KPiA+IEknbSBjdXJpb3VzIGlmIHRoZXJlJ3MgYSBiZXR0ZXIgd2F5IHRvIGRvIGEg
dmVjdG9yIGxvYWQgKGUuZy4sIHdpdGgNCj4gdGNnX2dlbl9ndmVjXzxzb21ldGhpbmc+KSB0aGFu
IGEgbG9vcCB0aGF0IGRvZXMgOCBieXRlcyBhdCBhIHRpbWUuDQo+IA0KPiBUaGUgYmVzdCB5b3Ug
Y2FuIGRvIGF0IHRoZSBtb21lbnQgaXMgdGNnX2dlbl9xZW11X2xkX2kxMjguDQo+IEJ1dCB0aGVy
ZSdzIG5vIGd2ZWMgdmFyaWFudCB0byBsb2FkIGFyYml0cmFyeSB2ZWN0b3IgbGVuZ3Rocy4NCg0K
T0ssIHRoYW5rcy4NCg0KQWxzbywNClRlc3RlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0KDQo=

