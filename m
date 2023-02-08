Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A86D68F8D8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr4x-00079s-H9; Wed, 08 Feb 2023 15:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPr4v-00079k-M1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:30:05 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPr4t-0004WB-GB
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:30:05 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318AZeWj012383; Wed, 8 Feb 2023 20:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=DaiOuitTQz1Rqe+CYwUAwodAJ0V2jg8+X1J/1HEoSy8=;
 b=N4MqbPNWdjMLpHsjoDJHD+m9/qW8P49q4KG2wtsdsbWiUtU2OUhjVBXp8GXpIiALhnkZ
 gqiB7hqGmDTCc0KEBkpNahetkI7tCZYm8BWH9xym4nwhLt0jhrNDMBuYw8kmu//1XpAy
 YO3nHCI3ktU8TMyXKkIbyP8fcubQlx7nSmyUmNZEYhO6+mVS1Ux2Ked0Rj0haa+eR+mc
 c7syivcFG6B8BPAzJJWPUEK6zrr+T7NzxvVoFwS1hRTVBJtiGOpEw2MCMfpF5Ohae2hR
 c59qLv5+erMoWPL8O2MYkfXTs9OEcWHfhjQg2qyIxfw1aCr9R8wXfWLKQwbN5dH39AeV 0w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkk2d4y6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 20:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXqhctA/LfWcL60X5CvU7y97gE0c7NVhUPF6HS8/zR6HqMmMud6Ez1el+H28/nynp5itZuRyh4RlPKuZ90JCcBkikLe5q5JDKSTIuLgZDqDvEkv4t35gs6mbo9ftkf1i5UIiU7XyQFTRSOiCyOO3n+eafgBoe0HKGxFNa+lC2bNma+1XNlIhkJ85F1nkR66inxb/6gVhaFO5jR3qfLdYYiDN6BG2xGkBjnwutXI0Bhmv+Av0z6msyXP5290iALLYr1GiZlkwhJLKLB3iXZ13gvju9Jk3dCCOjCDTp251cWeQWhZoowHAKe5Zbaby5VyWPVu9N8ssRhWDHW91w1ZEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaiOuitTQz1Rqe+CYwUAwodAJ0V2jg8+X1J/1HEoSy8=;
 b=C4q5uOVdL3BDhcwzSsJzwmULuPkROHe4NCxcD7P71t+wdKoUqXpBe1t0pBOYcYcZ9cIKRmL42ISpd1rMSshp6uuLZyw8Q0P/Czi5IV98NxZRsjbP5WngW36bXwH4QQsDAXgR2Rq3PgCoVj6vsEO7ibsV9xdRGghE3jnWwAaxjECaW4jDviQTVqb3nzVgPVitfINGs95ZFvasqg2ZqhSwoseCO02z8pNO8oBtRiA2AzK+s4ByAVv1WqiBjA34JM9EMiQl68X46JsUvQdMG9FkTEtwAyP6aqdypJkMh9qUyqPo/iKVP6iZqJjznAOAYol2Y9WCWBzXniderHM9K/yrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB8020.namprd02.prod.outlook.com
 (2603:10b6:208:35b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 20:29:57 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 20:29:57 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Thread-Topic: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Thread-Index: AQHZNcdUby6Dyhx/rUqgp8E2nf+XW67FDVKAgAAoFdCAAFKM8A==
Date: Wed, 8 Feb 2023 20:29:57 +0000
Message-ID: <SN4PR0201MB8808A5D08FFD2439C338EFD5DED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-11-tsimpson@quicinc.com>
 <591bba23-012c-84d4-b9b7-69f355da9a93@rev.ng>
 <SN4PR0201MB8808D841E660E90F4C1C965FDED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808D841E660E90F4C1C965FDED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL3PR02MB8020:EE_
x-ms-office365-filtering-correlation-id: 3a7576db-4d60-44fd-0e1e-08db0a133ea2
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Do3F2rFqL2AhWIZgyMhdIjdJ7kUcyVdMZhebJFgKzxQpdfMxRd6e69cbcNzUhrCtT2WxMZ4pl5/nNm8WFoOvVCw2mQJ4G9lCpbwCG1yJKwnLf+nCKYcXPBe+P7zQ0J4oUGCqnmtEjwEVqFklNSwsLGnc8i+LKoBVJ5gDf25vOaXPqB2cK9lNCV/rQ13mEvEPGSo0r8TEFOpJpn+Y3swhY9ovafZ0QP/3hTQOL+gB/wKqaSL+dV2RFRbwFEUHi9R7pdRWTHW0sSbhvbmKuEGaT7DXFg8G9quYzrXmsNMJTEeDj4XG1rNyHM7h1SMZhKr8w8Dn+T0RFhu2XzKh5w+YQG0z/4Gic53Ji6BpdPqfKg3XOJnqXfVE0d87WokSWaPiY7GH29h2P7j6KNT8VJUyOVQjc4nlJqUtqwrrwx1Oh7sLX+3B+mmXjnNP0bviI6kPVxw1VXVnUtEdWcW997j4O8pD3E3o3dLHhuCLN9YftNOkPthczc1hT4wRhUjQok6fTXw5ZKgx9S6I8rBZ5wnPsUtMGWr1ERiOu/vtGuJDprK3FUO3GvYaXqG9lXiO7IBO+58LWYCnnaRQeI8rURF7mZq+Sj3h2L4T6kfcfJIFYccqo1HwZ1yR4wbEbssgkAk1t9ovqOxECUuJIpV6Q2Qs02WgPrjGzzy218bjtkq0TiB5iEnfEhQ9IsYSQGa3v0g+e8sv94NFw7scu44s6oyUTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199018)(83380400001)(2906002)(86362001)(52536014)(8936002)(33656002)(5660300002)(66556008)(4326008)(66476007)(76116006)(66946007)(64756008)(8676002)(55016003)(41300700001)(66446008)(110136005)(38070700005)(316002)(54906003)(107886003)(7696005)(71200400001)(38100700002)(2940100002)(122000001)(6506007)(53546011)(478600001)(26005)(9686003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RStJdDVTQWpBTy85T3BOL1JiVEZORmgyd3IvQnpEUlhWbGVNampLNWczSjNr?=
 =?utf-8?B?MlJjTzZLelh4dDdBeDBZT2F5THREWjA4ZTdoUjRsaWV2SU1JS1RPa2RuUGZQ?=
 =?utf-8?B?S3VBOUVJdjRwSzA4WStTUU80b3BGM0hPdzZuRVVZOFUxT1BDc1lrTmxZV3Np?=
 =?utf-8?B?VVUrdngrR1pzRHZueDhjZUJoV0tIK3dsOTBlMnRuMnplbm9TMFFHL1ZTVVpJ?=
 =?utf-8?B?NnlCYkZCZ1U0b0J1Uld6V0ljeGFLNDNyVHRkcEQwWWpFTGVWYWloMWx6QWEy?=
 =?utf-8?B?eGo3NTZUT0ptZzVvaHlnRTFrbnk5YnNKZEtkUnJGZS9xQkRlS0YreFJTRmFj?=
 =?utf-8?B?L0tIZEJyZW5RblRKbEdWSWF3T2N3dTJwSGEvMjlhenlFVlJjTXNWbHYxU2t4?=
 =?utf-8?B?VVZpOVgvUllWVHNwTnllY3U1T2NERHpUVWJEQzNiaXJOK1NJNjlDbCtVYWhE?=
 =?utf-8?B?L2ltOHVJUDRaeDZIQUpSNVhUTmZOR2VROEZDNXB6REJlY1k1Q1dFaHVvWFQ3?=
 =?utf-8?B?Q2dRWVFJdjJWY2N2UGFGb0xhODZNNlNBZ0srQ2FQVTdrYVU1ZVZJUmE3dkcw?=
 =?utf-8?B?QmFlUHUxWi9UTXBDeEV5YVhOblpvc0lQSUREbXBaR3JoREY1UHBqQkw4Vllw?=
 =?utf-8?B?QWM1dVVKUDFyTEp6N0FMR29CakZHT0Z1azh2L3VwUmJ1ckZOdGpSdFhrVDB2?=
 =?utf-8?B?dXlKR29XUGJ0bXF1SWhTRlcrZUY2VjlPbVBrWi9QTzZadzBLVVN6bGhBTTFL?=
 =?utf-8?B?eHlWc0JzU2h3TlovaHhnZnlrdjVMbjQ2ek1sL3dnQW9qZDh6Q2hySFZtRFhP?=
 =?utf-8?B?aE1sek9xV29WdDcvNllZdjJNdVNNRWUyazNsanBuSkFnek8xQnpoNE5UUUdV?=
 =?utf-8?B?QUM1NXFidGc5UWFLOHVwWk4xVVJmcjY4V250d21TR3pUaW1HRCtwY3VWZmRU?=
 =?utf-8?B?djU2bkxTMy9BMUs5MEg2ckE5Z3JjTms0cGFwaG9MMDhXR0xzbFJVdHV4cjU2?=
 =?utf-8?B?L1pIVSt1eEhUMTR1Tm8rQlZiZk1lSjY1ZFhPSGJMNC9ZTnhzK1p6ZzAxWng1?=
 =?utf-8?B?aHhHeEdtK1A2aGk3VFdpd0lLTWY0VlBNaHA1V1lxOVJZZlkxVXk0dVVLSlAr?=
 =?utf-8?B?S3JwR1V2cTJoQ1B1QVZPR3dyb3JiYnBGTDhmbXY0ajdMT1lqRFJsRnFSY1Rv?=
 =?utf-8?B?THhCbWFqb3N2b1RJYUEyWlpVaWlmUmpaM0JuL2sxTEVoZG1KRWErT25Bd3l3?=
 =?utf-8?B?WE5VMzRqUEVsbTdPSm8vOXBCdEV0OWVQMDRPSjFXOWU0UjM2SldwSVMyZVh2?=
 =?utf-8?B?NSt4cERVN204QXRLczZ0UlpxaVVhVmh6S1V3WmtRZFBTek5wT0RPSTNsWThL?=
 =?utf-8?B?WWxDUDhPRGZPNjN4bFRBSGkxemlKNFJIYndRWjZsZWFFa0t5azFaOGlyRnRk?=
 =?utf-8?B?a3V4cFdUc0JxNjdaQUpjenBtbWw0MTQ4ZFowcFVQZ09JdTJFa0FRTlhKWFFY?=
 =?utf-8?B?dE44ckoxQUZLYUp4M0pxZVZtTHpNOHhDWVZyZ2ZFZVFZa2I0Z3EzbDRWZmti?=
 =?utf-8?B?TjRCN3VyZzV3THBpeWwrN0dabUF4U0ZrbU1pVGM0VUlmbFM0TUgyaXlLaWlj?=
 =?utf-8?B?bjI2S3FPWUlIYy93YmJneFJDSVFpaE51dHJnSDBNekt5eExvTmlzSTlhNmZP?=
 =?utf-8?B?YytobEZjWEhQTTdlMWREQzF3VjZ5TjZDWXBMdXAzbndQV2Q5Ky9IWXZzbVZP?=
 =?utf-8?B?Z0xONWFqY2ZqV1lIWlBzM2IyUHJ6RTVyYnhraVVTektqRUtTdTA0RE4xVXU1?=
 =?utf-8?B?M3crZGtxY003ZTFleHdkSlNRNC8weWtxQmtkQU5hVnlyU3dscEZVUTdsOEZV?=
 =?utf-8?B?OGhHY2dFNytEVFBtT1hQa05RMUNPdWpmeGdEdytUeHc3clN5N0VTc1NBY3dt?=
 =?utf-8?B?QTJzenNFc1Rkb1ZuaU8rOEd3dkZzWHRIU3ptYkFJakRjUWRTUk5JRldTTVpK?=
 =?utf-8?B?dzc0YlJZamU5Y1JIWld0akczd2h0clVSWThvcFBqREtldTlhUFJmbGczU0NQ?=
 =?utf-8?B?M1k3WjVrSTVLblYwcmxRa21KeDE4dDdXdTdOMGRRZkgvZjVKV3FzMlJsTlY4?=
 =?utf-8?Q?OgIFkfx06MPnwo4oBi7bQgGJn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7VgYcvk5OdwyiRNx40V06fhxYj+/CZq8ED06rj2GhqBHrSWCoNldxGcSdhtYw6EO5Sc8F15Icl4c823A1RiHVV3gVoo5K3VZQs6KOvxboxKUyEZ6Ll9tYKOQN+sA9ZE5h8++3i/MJw2LHKd2f7U+qBNUZcAeiM/xsUsMBTDs1uc3sU+9UXI4Atfq8Jo8REGN/NFI+xrecclaxb2yUljp8k7kk6r8A1Hc39S853JjzJbQlO/P9obaC4ttejIqCqHH+fU1uqJ/Fr2QJvnzkRL7vQkuB4ZJRYrwE5hMv51fbIBdZtpl9h0aESaZlZr1zX55Yslo/H0RpJ3uh4BkAiKHQV5pTnM58rZZND247LmEr8osqsm6zx8STptHMZ9P9hMSI2HtNOPwzst3+DKD5emWtuePI9s4lm3EgyrW2fvDiUFewfqcpI3cfSLmidd2Z+fnewB0U+upXJobka7fvw6wfmLHvkOgXmkt+CFs3a14hHfeRdlpqSelQqSkgJDSVkeZ0mIZ73ci06p/MIJgQxcHWj2QstfGvEODmYj/6+tOc3HXf1JnIEXdZ0D1SZX23HxSmxl+l9wM1pdTbvvL1Z25wXA0cAvKW0T0JsNeuRJGmLErEBQt/uFVbrf22bxJviIrzn1tLgzB7XvShfGffY2wvfqv13GHlQt4rMX+Ypk67PxBeCireJLxhRPkGulR8sV42Ra++bJKdHl8wyVC66GTtAWMjqkzdYHn76f5Ho6VNLtqsSbTMkVATv7pSK0dWMgRUp1yEQ8fhWeBY9PBO+k86y2jj2lGJyb5beM4cNQB2uUW2gxFh3OLSdw+txeBv/xN
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7576db-4d60-44fd-0e1e-08db0a133ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 20:29:57.4052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SrWTOIOzTIvL7isLE2IkNHGOSjIamyVVvBtaTzBsrS5wcBjq35Y3E/xla3igYw8n1XCmVSNS9ath0O17ddBjdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8020
X-Proofpoint-GUID: BmqTwJ_c8oyY7oyG2rajiMb9C51GpHWP
X-Proofpoint-ORIG-GUID: BmqTwJ_c8oyY7oyG2rajiMb9C51GpHWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=897 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080174
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSA4LCAyMDIzIDk6MTkgQU0NCj4gVG86IGFuam9A
cmV2Lm5nOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc7IHBoaWxtZEBsaW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxi
Y2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0
aGJlcm5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMTAvMTRdIEhleGFn
b24gKHRlc3RzL3RjZy9oZXhhZ29uKSBFbmFibGUgSFZYIHRlc3RzDQo+IA0KPiANCj4gDQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBBbnRvbiBKb2hhbnNzb24gPGFu
am9AcmV2Lm5nPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgOCwgMjAyMyA2OjU0IEFN
DQo+ID4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiA+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBwaGls
bWRAbGluYXJvLm9yZzsgYWxlQHJldi5uZzsgQnJpYW4NCj4gQ2Fpbg0KPiA+IDxiY2FpbkBxdWlj
aW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPiA8cXVpY19tYXRoYmVybkBx
dWljaW5jLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEwLzE0XSBIZXhhZ29uICh0
ZXN0cy90Y2cvaGV4YWdvbikgRW5hYmxlIEhWWA0KPiB0ZXN0cw0KPiA+DQo+ID4gV0FSTklORzog
VGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJl
DQo+IHdhcnkNCj4gPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5h
YmxlIG1hY3Jvcy4NCj4gPg0KPiA+IE9uIDEvMzEvMjMgMjM6NTYsIFRheWxvciBTaW1wc29uIHdy
b3RlOg0KPiA+ID4gK0hFWF9URVNUUyArPSBodnhfaGlzdG9ncmFtDQo+ID4gPg0KPiA+ID4gICBI
RVhfVEVTVFMgKz0gdGVzdF9hYnMNCj4gPiA+ICAgSEVYX1RFU1RTICs9IHRlc3RfYml0Y250DQo+
ID4gPiBAQCAtNzgsMyArODIsMTAgQEAgVEVTVFMgKz0gJChIRVhfVEVTVFMpDQo+ID4gPiAgIHVz
cjogdXNyLmMNCj4gPiA+ICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAtbXY2N3QgLU8yIC1Xbm8taW5s
aW5lLWFzbQ0KPiA+ID4gLVduby1leHBhbnNpb24tdG8tZGVmaW5lZCAkPCAtbyAkQCAkKExERkxB
R1MpDQo+ID4gPg0KPiA+ID4gK3NjYXR0ZXJfZ2F0aGVyOiBDRkxBR1MgKz0gLW1odngNCj4gPiA+
ICt2ZWN0b3JfYWRkX2ludDogQ0ZMQUdTICs9IC1taHZ4IC1mdmVjdG9yaXplDQo+ID4gPiAraHZ4
X21pc2M6IENGTEFHUyArPSAtbWh2eA0KPiA+ID4gK2h2eF9oaXN0b2dyYW06IENGTEFHUyArPSAt
bWh2eCAtV25vLWdudS1mb2xkaW5nLWNvbnN0YW50DQo+ID4gPiArDQo+ID4gPiAraHZ4X2hpc3Rv
Z3JhbTogaHZ4X2hpc3RvZ3JhbS5jIGh2eF9oaXN0b2dyYW1fcm93LlMNCj4gPiA+ICsgICAgICQo
Q0MpICQoQ0ZMQUdTKSAkKENST1NTX0NDX0dVRVNUX0NGTEFHUykgJF4gLW8gJEANCj4gPg0KPiA+
IEkgYW0gbm90IGFibGUgdG8gcnVuIGNoZWNrLXRjZyBsb2NhbGx5LCBodnhfaGlzdG9ncmFtIGZh
aWxzIGR1ZSB0byBtaXNzaW5nIGxkLQ0KPiA+IG11c2wtaGV4YWdvbg0KPiA+DQo+ID4gICAgICBU
RVNUICAgIGh2eF9oaXN0b2dyYW0gb24gaGV4YWdvbg0KPiA+ICAgIHFlbXUtaGV4YWdvbjogQ291
bGQgbm90IG9wZW4gJy9saWIvbGQtbXVzbC1oZXhhZ29uLnNvLjEnOiBObyBzdWNoIGZpbGUNCj4g
b3INCj4gPiBkaXJlY3RvcnkNCj4gPg0KPiA+IC0tDQo+ID4gQW50b24gSm9oYW5zc29uLA0KPiA+
IHJldi5uZyBMYWJzIFNybC4NCj4gDQo+IFN0cmFuZ2UuICBUaGVzZSBhcmUgc3VwcG9zZWQgdG8g
YnVpbGQgc3RhdGljYWxseS4gIEknbGwgaW52ZXN0aWdhdGUuDQoNCkkgbmVlZCB0byBhZGQgJChM
REZMQUdTKSB0byB0aGUgYnVpbGQgY29tbWFuZC4NCi0tIGEvdGVzdHMvdGNnL2hleGFnb24vTWFr
ZWZpbGUudGFyZ2V0DQorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQNCkBA
IC04OCw0ICs4OCw0IEBAIGh2eF9taXNjOiBDRkxBR1MgKz0gLW1odngNCiBodnhfaGlzdG9ncmFt
OiBDRkxBR1MgKz0gLW1odnggLVduby1nbnUtZm9sZGluZy1jb25zdGFudA0KIA0KIGh2eF9oaXN0
b2dyYW06IGh2eF9oaXN0b2dyYW0uYyBodnhfaGlzdG9ncmFtX3Jvdy5TDQotICAgICAgICQoQ0Mp
ICQoQ0ZMQUdTKSAkKENST1NTX0NDX0dVRVNUX0NGTEFHUykgJF4gLW8gJEANCisgICAgICAgJChD
QykgJChDRkxBR1MpICQoQ1JPU1NfQ0NfR1VFU1RfQ0ZMQUdTKSAkXiAtbyAkQCAkKExERkxBR1Mp
DQoNCg0KSSdsbCBpbmNsdWRlIHRoaXMgY2hhbmdlIGluIHRoZSBuZXh0IHJldiBvZiB0aGUgcGF0
Y2ggc2VyaWVzLg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

