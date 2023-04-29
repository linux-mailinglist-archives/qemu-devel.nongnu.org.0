Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270A6F2622
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 21:58:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psqgW-0007NK-Lt; Sat, 29 Apr 2023 15:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqgV-0007NB-4v
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:56:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqgT-0008MU-7r
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:56:42 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33TJu99n005635; Sat, 29 Apr 2023 19:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=iMBO1l9Dt3k51K3xEITcNsBH95YfGYNGdxhxXfIOOUs=;
 b=cjp/Mwo+0nG+VzmOh+pI3uqnQ0SD+KRWGHAZthiCCbSH3YT4SCFc0IsDxbTiHU7xD03u
 P+ILve+v7oGQuW1yXI96jYvA8JY1z0+MZjafRQOCO2c/cSWApHhEuR4y+Gi1oaaPM4Yn
 Nxk53E7rQABTkPbG9fgt5l2yTei3c0jXXIAiqWM2PIIXK78+jYSi7cDf5YfI6pt18mBw
 FSS/lE9h2wAsw90ML+AjFxJNXvWdcWSMxbVs/gbGudgwu9ViSUPwttj2ipGJquMplLSO
 Sf0FNSGHTfI183m8xfjo+8BlSkuH48UDgFHe5+/8ii1BnQenOeAQLtJ0V4xxn4//Zbix +A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8ve20yum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 19:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7DMzsMCSZQbVDI7k8WhXezp3r/7yeID7TfRfxipBk+1ffYcSkTUZJJ6bvxH7stoMSfObHPKfZAda01QCPlHZ3zt/gxoaHtiTfKyhyWwaTk3jKVCONzjZawk4NKPW7B54pidTkrDD/nsCfb/e2ewxPbworVdknDoXXoUUzoPGR6IWrkU72/5U/CRyP/CSEEi8SN06MUdrFfRR/OykGKm9bXVTYZgtA/ggACakAYJs8txED9YMxzd8wnnvPkFKSvNwAXzE4XV7LgMytxqNAcGnTaWh2a1flqPVvd9pWXMc7SSiked/YETypAyVeZNXUyhq1JPPxcAD6+JCBTOgabmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMBO1l9Dt3k51K3xEITcNsBH95YfGYNGdxhxXfIOOUs=;
 b=lBS+b1pyqtlyz4aRbleqEjaP6LUcv4qPZ0BLU6sgR4mx+GJ4+6WzW467keHrnsnzyK7hZZX2X2Ua2561GbPYSLiZcHuLqxKo10+0PEVHID0R0i09J6b9OWVqQtKzv8HVjNw370/Y7b96XQIJkZ7MVanb/2NFyRgmFXWfPP3FTe+MtsRYpz5c8Rppw2y7yBti7urKTh1xpo2BH4QcXTyJiiL81G+z0TBzzCtur5iSzgLMewzOZBJGo438u6yK6rSXgVg2AwmmoRReXSTR4tK0cSEaaMeolFaEs+XDMubgBXMbvuzhXYtSc6M2WRX9gnz9Dp0Z5T7sD04DpKttaALfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB8188.namprd02.prod.outlook.com
 (2603:10b6:208:33b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Sat, 29 Apr
 2023 19:56:34 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 19:56:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Thread-Topic: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Thread-Index: AQHZeVld12ZCBRkIvkiottFe26z2L69BQpkAgAFz2AA=
Date: Sat, 29 Apr 2023 19:56:31 +0000
Message-ID: <SN4PR0201MB88084AF677C669CA50E08E12DE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
 <3ee5308b-b25e-813b-4223-78aef99e93de@linaro.org>
In-Reply-To: <3ee5308b-b25e-813b-4223-78aef99e93de@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL3PR02MB8188:EE_
x-ms-office365-filtering-correlation-id: ca5512a5-f264-49fd-7f9f-08db48ebd42e
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5aNMsuLiOyFdez64VBNHll/wnUncGrLJorvCcAB33JeG+qOyKBIB1IIbTb2lDk0h20eB9mEgEnOTS5SawLmzAb+WOWeaUidg8XjdOHUCQXVPvenAe8RWUYSs968h/zN2cuYJlGQI3ix90m5NM1m4+WoAAzU4zgm9sYuQKXdepR4lPDNj37kE0bZ9pHp+Of/20/6G8nFS4cLdzx/Iuy0K0dYAZJn47Bv6NjMVWd8mtmLdhrfLSxn5P+SugBJ4gyZFK0Sicmz4ZqesGYbdXw2jFRg6Ef4LsY80402bDwfGBW+ZZOkKmlFMDpA6/Fn3Gf0HewBblsVlbodHz+mhQT3Pv1SZQSibesx/WtHcOoz2kThXPPyc3MOUyuahVyA1JuPcBfAPLzzhMO1GF1CwanUmxZGWG2X01/bw0laLQyEyuBHFHouh/eXzzmzfD4rpwi1vcB0/NYW01qyxLP//65pQd8Ah7B4Yv1YQFgP8A6Hn8FIhX9pCtADC56dOvZVAZZGYyA6PjzGsGOQn5I0CIobob2+/0MiHI8uF5glJ/DmhLo9SPVJmxJAn3m4bU5bUD0RSc0MOWlqLLGaSPzbpQ48kcP4iWN3GaALtxx93YFIi5P7KZn2iopJvZGMlUbVJRdM4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(83380400001)(186003)(38100700002)(86362001)(33656002)(38070700005)(122000001)(55016003)(7696005)(8936002)(8676002)(316002)(71200400001)(41300700001)(52536014)(5660300002)(110136005)(54906003)(4326008)(64756008)(66446008)(76116006)(478600001)(66556008)(66476007)(66946007)(107886003)(6506007)(2906002)(4744005)(53546011)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3FiUXVIdG44RnUwNHIwYnFRcmF6ZitYUjhRSVNLQ3hmSjVPRGpFWk1xUlM0?=
 =?utf-8?B?dTFDY09GYnRUSDQvQ0QyMDROTmNaUUFSWkx6ZWVKamZBblloTmRsM3FlTEtq?=
 =?utf-8?B?c3lHWjF5R1R0NGpwNm9heUlEM3JQaGpEc3VTOFVraGlZcVlFc25wN2VCL0ZN?=
 =?utf-8?B?S1ZjTzgvbG1GbGtQOFpqZU1UaDJtOXUvVzg5Z1NhWXB6Mm0wQVRsc2dEZDZN?=
 =?utf-8?B?UzJpajFhQkVmMWNINXJ6RkZ2dGhHb1RrczZlMWlrWnB2ZWZSQ3ZZc2l2M240?=
 =?utf-8?B?bnVGbEJqUE50dlNoK2dNUnh5cVJGbjllUHZJSFVmVFpqYloyV1N4OHhDTVBR?=
 =?utf-8?B?TDA4a0xhOFFndnVGUlVXcG9ncS9lQ0RzVGdHVWIxUWhaV2dYdG4vanlPVXIy?=
 =?utf-8?B?NURXNnh1ZWI5S2dxYmM0eHdUR3VadHY1WWJDR1hNQWJZak1Kazl6WlQ3T05K?=
 =?utf-8?B?MXdLU3RwNE9zYko1SjZjUnBPaDVqMUowMlZBU0xXdzduckFmaE05ZUhlVktM?=
 =?utf-8?B?RWFjMEtjZVRFdnJJajlteHU3NThkUk5sNlJnWnBGWmtFVlcwRHJ3SDc5dFBq?=
 =?utf-8?B?cjdtV2hHUFBJc2NRcGxLQWhvenNVbHZNbDdHQURkd0JQbDk1aTJlUEFxSHZG?=
 =?utf-8?B?aWxQSUVlTWxsWUhXSzJnWnJFeDFmdGQvMzNpSkV2UDFmQzRRVi9EbU1IRDJi?=
 =?utf-8?B?OFdsck9PZklHZ0hjRytQaFFQZTFQWDFKVkhGLzRsc3Iya0FwbHQ4Qm1jQlV4?=
 =?utf-8?B?N2g2R2srd1lvS2Fja05hcEF4Q1ZUY0ZwcVZJWVkybGVGMlZxZEhlNHRHMXlI?=
 =?utf-8?B?a01vRkhyZUpWN1JwZlhQanlqaWZDRUV1U3NETHhvRWZjTzZ5cWZKVEhQWktW?=
 =?utf-8?B?aTdFcEh5L0ExN0Vnb2QydGs5NnBzU29UTDhoem16d1F6WmY4MXZOQWo5a3Rj?=
 =?utf-8?B?VUNHQ29Icnh3Q3ZhR3hQWnM0UnRMeTk5dWt5VVpKWVB3RWp4OTNPbEo1MEZv?=
 =?utf-8?B?d2VmZTJDNDFIWnRwSnE0WW5MMjg1ak1ZeldwbmJRTFFoOVA5ci94Y1VjMk8x?=
 =?utf-8?B?ZUpXaTZ3OGlQY2tDTU8zUnBaRWFDakYzRnZDK3NoeXNGZkhhSS93aHhXR0pY?=
 =?utf-8?B?UTdQYnFGZjNjQ1kwcDJSVGx2enp6T1lacHVVWVBtWVJZVlZhak10blQvM2dl?=
 =?utf-8?B?d21UNlBJR05zMWFqWWcrOFZVR3pDNi9mbHJ4QUd5UjZaVGw2TlVKSElwRkFk?=
 =?utf-8?B?Q2I2c1NLQ1I5SDBoSnNSVlNOYjJ2MDhENjhhYmRFNzZWQzIyNndLeHk5ZzVz?=
 =?utf-8?B?Y1drYkpiWlJqYmpJVEdnN0ozSGl1NnZCcVgyTktENVRSN1VNM3hENGhaaHJO?=
 =?utf-8?B?L1lYOEg2THZCNDVaRnpNUDNxbjRXWWpMdks0SW5WL0R4alVvMVlueXBzM1g2?=
 =?utf-8?B?QUpFd1owZXVuNk0yM2kxMUZWaWcvb01WUkQwQ092TFpNdUVWcXZkblpDelBY?=
 =?utf-8?B?UDdhTi9sS0lYcG1QMVNsTTZqbkhaTHU3Y0pRSmNvSTRVaGZ6RWxJcCtqWVJF?=
 =?utf-8?B?N21HY0NhbkNyOTFFNC8xRXJUQlBGWDFsLzJoY0djVU92QlYvK1VSODBPb0d2?=
 =?utf-8?B?a0tNQnQxbC9MSTNyS1I0TkN4YkF5Z2VJblU3ck9pRi9pa3hQRXdTNFQ0aWlr?=
 =?utf-8?B?UVZ1NFVRQUg1RmFpVjUxNHFCUjlkb2dqVFpKTzR1dUNGYS9ERk5vb1pQY0Vy?=
 =?utf-8?B?Ym9laEl0VFZmM2d2M29xKzduK1V0UUs5T3hvalV2aUFUdE84cFF5SjUreE1w?=
 =?utf-8?B?a1hxVTg5ZUlVVysyQTliNjV3YXYxbjBpZEFZam5oZjdTMlpTNlJuMStJd2w2?=
 =?utf-8?B?b1ZrNkVQTVJqeG94WC9TVTg0YUxRMUllK1NsTWo5K3V6cnBIZUJxK0dMNjJn?=
 =?utf-8?B?a3lCNnhtNm81ZFJLeFNWazhWeG81Y1FrU2ZVS1BIV2xXTGx0Wlk0MU1oUzRW?=
 =?utf-8?B?cUZpWVVYNHAzMERwRm8zdzZld2o1eEJUVVowWnFSemhoaVh3R0x1ZVZDd20y?=
 =?utf-8?B?azFrbGswelliYmhPeDc2cHFoRDhSZmgrN3N6bmdmUVdEOC92em9qNUsvZzJl?=
 =?utf-8?B?SmtYa3N1TEM5SDNvMEtJcTcvQlRkQnBkWFlONmZuUXhWMVBoem1McGw2TUZU?=
 =?utf-8?Q?iHMOt7NJ7Hv59iIvUTyQjaodoDTIayLPNkZ6xklevcOM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Wr4c8G2a3C3EWh2XvzgyROXAMBlUMaM2QjB5LGmUvRd1np6cDFNS2trKApKVVtN+jqlnLlUryuEGB4RgmOKUoAoqbN8WiDVuci/9TV76wav9eIVnMdmElThTN0pl5cG9fKbG1AcDaSFsZtwU8BH8KKzlIQODKjXdcXqwPpWJMBRQQAOvVeRb03S7L9stVwV7Z/fAjFqSjKsZXVSh8HwXHlKiLSNNyzMq0XWKiz9qYcj38YyD09ZsIAOyLOsXGr5YvbJ/qNOg1L9UJxW1CX4yBoix/UUrrS7yZeHXCngmkE4oA2324bHEJ4l2TwADydj7pZ6VaHv2ElgbWRZyKRnSoRmCyAUrw4c+Z9efdFJq2OKt+8PFlKg26BMjDAwaE8/svA5xyixzQK7vOKnDkKTOR4Qb8YqyoL3B/WJ0c++1M3qCJws81oKXzGMTgzvGGuMX8g+4bkYSzTOVLvI/4QNCH8oHXu9/DFGXbERlYchmdYN9/s8pMBP9ZTX8Db3LWsm6+CIVP2WGjTOuJbvw9Ya6VwwDcXvhs/nGhqW85TnMBeTbDH8Dsv+aC0yScJQkHCjrR5uGDLj/vVfFtEF549tIZkBbigeoyMaD5RZRi0+jIxysXBL+U1rTH8Gn4k8MoC9jvcz70Uc1o2F9kr/RqbonA0TXXn3H3msRMeGn7SEYJjMSv5uPpLLQhX5UijTE/AQDMguUiYHCHaOQeyhO/1DmLglN7KaXnACuwh4nJU4K72oTyeRPirx47ZS7RsykHmgOWuxSr4uG6BAKyabQNsvOsHpv9dIo4rr+dnyqo5nIyhnvxrIv3OFKdVwIZxFQp/IA
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5512a5-f264-49fd-7f9f-08db48ebd42e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2023 19:56:31.6954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73nIYG5KWFq4tiV3IV0BOxfrhIlab+JtEOHqaURt2hyxU7KxuBuQOOedCxsOyQ8LJxpmVx73pXY3DwDL9xAsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8188
X-Proofpoint-ORIG-GUID: 9hby1M2DhhAEx7t3tLGKOYH_9QtZv5o-
X-Proofpoint-GUID: 9hby1M2DhhAEx7t3tLGKOYH_9QtZv5o-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-29_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=645 impostorscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304290190
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwg
MjgsIDIwMjMgNDo0NSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgYWxl
QHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29tPjsg
TWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzldIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBO
ZXcgYXJjaGl0ZWN0dXJlDQo+IHN1cHBvcnQNCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3Jp
Z2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFu
eSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4g
T24gNC8yNy8yMyAyMzo0MCwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQg
Zm9yIG5ldyBIZXhhZ29uIGFyY2hpdGVjdHVyZSB2ZXJzaW9ucyB2NjgvdjY5L3Y3MS92NzMNCj4g
DQo+IFdoZXJlIGNhbiBvbmUgZmluZCBkb2NzIGZvciB0aGlzPw0KPiBUaGUgbGF0ZXN0IEhleGFn
b24gU0RLIEkgY2FuIGZpbmQgaXMgMy41LCB3aGljaCBzdGlsbCBlbmRzIGF0IHY2Ny4NCg0KSSBn
dWVzcyB0aGUgZm9sa3MgYXQgZGV2ZWxvcGVyLnF1YWxjb21tLmNvbSBhcmUgYmVoaW5kIGluIHB1
Ymxpc2hpbmcgc3BlY3MuICBJJ2xsIHdvcmsgb24gZ2V0dGluZyB0aGVzZS4NCg0KVGhhbmtzLA0K
VGF5bG9yDQoNCg==

