Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CB6EFC6F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 23:28:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prmgK-0006jf-Q6; Wed, 26 Apr 2023 17:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prmgI-0006jI-DJ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:28:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prmgG-0003Gp-GH
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 17:28:06 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QKnc9U010304; Wed, 26 Apr 2023 21:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=oHnkWTbmGmT6/EbYfsqoFGb0nLjZQTBdg99YTEOXD4s=;
 b=VKPTMiYNGYYRb/6VKkZGHbEcmEh607RS6u2poFhIJDVokegd2ygy4ZYHET00L8Ed40QE
 lMb0wqa/MbgpHwB+JOD/kd9Av5nEZS3Uu/ENRhfHdqen8vbHZjDNUiSkFXyFxxdMTWiy
 LnInAmrWQFB1YpiDUYr75QTH418ybA8m7fuonvL7B9OxSdFgRTPRZ9+BaIMMV3CuT867
 5tr1mv0+SOM2ICj/J5sg8KZkNFpWbaibnBC3ojWunwJl7FocOGvOAK5nhzGfL01de9i7
 EyAZFe8rV1gihOy1s6/vfDO7N9Ry1yjk+Lt//UEA84BT0WJBdu8XzFlfUjY0OWOYsg9c aw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q79eug8vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 21:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUYSn8BgoxGh2pBbb8JlBt0n45ztnLaEaakchmJDOZnoEoJ7XtSoc8WUYoQYHo6u+VQ8/rliallYYzFxX1ZfMx8BlJpohhbnsXs0M99Gx/PDw3fsF3mjrsrZSC0sTWvSJSyep02XBidVBYGB3R1cXIhDvEFZ4wJ7I0fOtM9MYXoN0NS0/wxAMWmcHZo2liMolEs4JdYz3sqMku5tWBYQ39Zbg0HNvYLbcKKPmg3oTsbY/8FU40sAZzrqWgVsB7jb/ZKEoGMtinbudLWc1RYmrTtIeY1SBk+74qPyPhIpP6J5F4l1/8vMYfbh5RedfMsEusAlSer/wVP5gjRkhnCbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHnkWTbmGmT6/EbYfsqoFGb0nLjZQTBdg99YTEOXD4s=;
 b=UAgRykDhiuBuBgNPIm5y0LNGVNxOqqGd+QUWjkylln39REVUejU+4fvasMzwpgS39++QaZ3/gsJbS642AWebZ5kgEd2LGWjsuCGiRVpVIsC7hTW9LA9bLKeEAWFBMGeoaBTs1xxN+/QLAD/3S/2/AwB0ynEJis1qwq92SWR7+3jSwMklNZIVw0XUIEw8YKMUVmu+r8am6wBgD5ouMvDG8uPPmdUYw7rAxyr51ZvphDA6GcXihYtxpkoIzDHplRRe1TZcw7GkeeXoH1teOACS7QRWlmtmlOS3ep/u7phgbulPwHQH3vkijnFDUZCKYonK34gSPDfTzUIshwM0naE0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB8675.namprd02.prod.outlook.com
 (2603:10b6:a03:3ff::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 21:27:59 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Wed, 26 Apr 2023
 21:27:59 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH 08/21] Hexagon (target/hexagon) Clean up pred_written usage
Thread-Topic: [PATCH 08/21] Hexagon (target/hexagon) Clean up pred_written
 usage
Thread-Index: AQHZd9fy4ojcB0J1HEScSe+2FNKisK8+GuUAgAAA9LA=
Date: Wed, 26 Apr 2023 21:27:59 +0000
Message-ID: <SN4PR0201MB8808836FFB4552CC5BB90215DE659@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230426004202.1319250-1-tsimpson@quicinc.com>
 <379e70f9-2d04-dddc-fe5b-d4eee3bde62f@linaro.org>
In-Reply-To: <379e70f9-2d04-dddc-fe5b-d4eee3bde62f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB8675:EE_
x-ms-office365-filtering-correlation-id: 9c1b089f-776e-4f79-d66e-08db469d1c0b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BDOUseq5m2WvI+GWzjQomj8PkizkarEpz/juSd9jRPG9V6Uf/xnf0PgG8VDkxMDEmR1+RtzeEYtbVOM9c9EBvmQ3nsB8aVe/7SOw+TvFlQhMg1QyYZH8SQYu/mvOtdjhAhNcmJGFit8Eng0oRd9nNlAe3nx7S8TCMNl88IDUHTWWCA3lMJLO/efdnBOkfE6p5SFrKpiVtJBtgBNbGxVnnURbLFG/R81UykLYZHp2a6mF1QLjre85xBzmBOw5pxK4uD+LZ85fEsZHW5j6oRTUM0Egk2VKpuBVATD4+m3MFNrNp5veBBP7st/UdXyHIXl6lyxuRb2cB4pQmFQkuKkBEIxN9QfxRl6w+PzC7ePoeKEX3ygOMP5efKV3qk7SGnc8k31GvFm9nFHYwtAurQqC4obymHMin25LsXhOOGMh7gWN3v2HPYI3F+VeQXnIdhdjMw2XipOXyigj9j9zTuH9MVWMzqy3PXv6AS2XuA7j0ufee57WbfN91k7cnbw7q3LwmKafyliGrlyWUA+oULA8MMVc5BTfrVv2PHFfF/NyhdH9X+wu6dEsk7X+2AyuYKFbYqRvtWhosNwk9PP838hQdgwue4CKCSjrbGbnT68QGmSDRJhLBYUFkK+s4DW4hLUN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(122000001)(38100700002)(38070700005)(76116006)(66946007)(110136005)(54906003)(55016003)(86362001)(4326008)(33656002)(186003)(26005)(9686003)(83380400001)(52536014)(7696005)(6506007)(107886003)(41300700001)(8676002)(53546011)(2906002)(5660300002)(71200400001)(8936002)(316002)(66476007)(64756008)(66446008)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3J4eFpBWnlNdCs3VHFGclNJZGViaTZPeTVnSXVYTnlIS2VKckphZlJhWFp3?=
 =?utf-8?B?M0tVVzlDaXVBMUREY2t1d0Y1Lys3ZXhrcXZzVTNFYTN5Qkp2YzJPMUxndDV0?=
 =?utf-8?B?Yzg5WjhzZTdEOTZWMTZVem9qSTJkNmNVVHNqamZ4RnY4T09FaWRzdjdnbTJm?=
 =?utf-8?B?eGR4WGZKSjRjYWREZFc1TysvMFZDeGxTVW5OLzNYcnF1WStRN0RsZjMzZGlm?=
 =?utf-8?B?WHhlMFRQRVYzR3BkdHhhVndkSElnL3hSb1JWZzZ1dFhLMWVYZEk1Tnc0ZlZ1?=
 =?utf-8?B?b1RmZ2lTVVE0ck9LRmJ6TFpGdXNpY1I2Z0FEbW9OMkVsNnB1SjduYWd0R25x?=
 =?utf-8?B?ZFdYcEh6cllrVndrbmF1aTQyT1JmOSt2QklZMHdySytYKzRqb1FVOWxvanRo?=
 =?utf-8?B?QSt4bERjbmx3a0M3bW1CZEJnbzZqK2tFcDkyR3ZFaldtVnNyWFRkcEdTcURZ?=
 =?utf-8?B?VkdXM2d3WWVURDZLQUttK0k4LzRQTTdFTVMzYmpZeVNmdUsrQ29PT3NVZGhM?=
 =?utf-8?B?YXlRSzZvZXgwZWkxUWo4TTJyZXNnVDBxbCs2YXBKbjI4bXR4aDM1WENvL0di?=
 =?utf-8?B?WVVaQnZaMkdKUm9RQUtweFhnM1BwbDVGODRPdSs3NnRpUWx5dDBZUUhkRmh4?=
 =?utf-8?B?V3BvWFdwcUlIdjVvdU5UMktHZWtvSk4wVDZuM0hGS3prZ291cVUzTUNiLzM4?=
 =?utf-8?B?eXZzMitTZm04eFViUUVQQUhsS2s1NmRKdkJ5ZzZDZExxVFlLVExGM2J0MUJz?=
 =?utf-8?B?eGQ5QmRzSHJPYlBidDFYeXV3V3pSVFlpS2pFTmJYUFpsOU1DZGl5U1ltMWNZ?=
 =?utf-8?B?bEV2VzQ4WWhUc25tQkVSYUkzdVFUTWQvWTJOcU5KOFE4MHNFbTNMWmh3VDhP?=
 =?utf-8?B?b1hOeWt6dHl1QjRIV2NudGNNVzV2YkUxNE9UdE1oS3IwUnRUcks0UUlINGpw?=
 =?utf-8?B?YWdHZjFxbjhENkFteXMwbFZJNkxWZEVHSXRjamJaSGFCWDVtL3FYbTVxTFU1?=
 =?utf-8?B?dE5uS2orYUFIS09admZLbnpKeXE4dGgzdEZzamRETW5mMEpiUlJUK3Y3dUlx?=
 =?utf-8?B?YW11R3FFbzlZQjB4V1B2ZjBIOVFvcUNsNVlpdmlhUGthSGFtWDN0NlkraU9B?=
 =?utf-8?B?RDZ5YlhNUzI4UGNGNGV5NE4zQUw0TGFGNlY5b3ZXdUYrQnI4NGx5MkIvb1pJ?=
 =?utf-8?B?SmZwdzBCS2NxWTlmdGFpZjAxMHJHQUZpRHpDMkhJZExUb0lWd3J3czB1RVV1?=
 =?utf-8?B?dUtKbkVYOHJEd0Q4Nld2OU54Y0xzSHNpOXRmTGw4SWZPbmN0dFJSTEpvSVd3?=
 =?utf-8?B?WEVBek95VlZwQk1keTVyaVFqL3RLSmRLUjlVZFhFamhYWEo2N2l1UCtzNkhH?=
 =?utf-8?B?UUV6cXZmTThZLzlucFpiN21RV0FCbFlQTUxjQ1RZSEo0R1RQYyt4QlJDclMz?=
 =?utf-8?B?bzRtbllOOE5VcVBON0cvNkhULzlGRWM1L2JZUHJKU0xSbUQ4N2RRWnJHbXky?=
 =?utf-8?B?L3NNYnlEc1d1KzlUZ2ZIeGJFWTJUVEV0QWVqQ3NnMGh6d0VZTEhEcWNBOWNv?=
 =?utf-8?B?RTZXdjhSOE5jUjJJbE11NEI1RVU4cDJxM2NLVGRxL05CSFVmV05UNllSYVUz?=
 =?utf-8?B?R3ZGTzNRN2MzVDgrL0xPSTV1Ky8zbEdSR25JYUhjNEF4Z1M5MmtwWkpsMnRN?=
 =?utf-8?B?R1I5UnhRRm5vak1DV1hEb1R0UzA1QU9xOHlNZWprbDAwSTZ3MHRVUHhRbHp1?=
 =?utf-8?B?VG9MalowaTdEVlVJelpzbG54VkN4U1Q4cmFBQmd0aGlZUjMyc2ZKWGtYRjFn?=
 =?utf-8?B?WlpDZTNUNEd0eG9ESmxsL3hzaTNHeUN6UE1sMS9yVlhMOWJLeEdyalYreFlE?=
 =?utf-8?B?ek9RNDQwdldBanErRlRiaE9mVEtaTzdNdUFlYmw0ZEVVUkhvTlYvY21nbCtk?=
 =?utf-8?B?dVN5c1JHcGZXQjMzZWJuVTl6eU1WZkQ3QWZRRWU3VzJlaHAwRmsrUVlRWWFw?=
 =?utf-8?B?NUF1aVV2bUtmWUlzZGJHMFdvcDd1Zlh6a1praFRwTU9kQldFU1lxNmJpM0FC?=
 =?utf-8?B?T1hZT0FybDhYcS9iS1Vpc3czdTRLdHU0WkFRNFhwaVlsUUdwNkRUZFNUU0NH?=
 =?utf-8?Q?aKUCOtbgcGPiWc/NLz3yvpyrc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TFjNyzvWKVFX9OrmlefnUqDTZ5EnVBNuynhDgq/NsX4bp4UYo15NViV8HqW/ODUOWcD3H2Aw3o7CrvPaEjfdECejyf5l+pUhbZg0aM9UFKK1ytIP8kcAc5jcXzSvIG1Kr9I39ZryZpaC0NOqhb17fhHAsV6hfgt6IjKzWjp0XG0EhY8unL6J1sN+D6tvoyX2gRA2UIns8REW5KVmTSJ83DXKisrzk4HoSswii/sUUjYRm+FkGHh6VHKmtG414nVc3ZPGvyu+G+q/wNXUrhEOiNjBbivyjraVV4PIfFJOng6njWb4fab8s3ncG9wbNdi1mfYjp/PM/eu2cwtuFIk/n4hmKq1rv2O8dTA1r5unWqXWN0NizCBZ5/ehVOBa6AQ2MakL7ak6nbhq5W1MgtZQnyqzB18l/jLlfWWa0hZsIr9FhlC/IM5jUQTs9VlCbn3GQHNkf69sjqj96RGefOgl9KuzGUVnLxzUS4Vt9/d+C+IYd++QwWRcn5sbQf6S5xCvwlQZVmOVDIbOQtl1B/pT4/86WbbcE5r64SxQw7pC8xtpfxzPaMHDxHa9O/CuaacgV/Cwip7WSspkzurUPQoEGNacLJwMztDyy0bL+V7XzIOYWBay9jRAkZiSLpr1ZHfb5FwK7wk8ab4DlaljcxvCqiOUTXRcj52Opy1pSChOPxY2unuAIPZPZo3CDl/e0yULIeP870IN8OT8PLKkK0hIef0IoFx9q2RStaLZpHASCVNjX5l/D0/Dij9FNi/QOI2Nbz72fcaX+AEp0/36er1KPUJlY4V+rLdONwA70ag6OiJ4gFwQCq9gfgAs40twfpOP
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1b089f-776e-4f79-d66e-08db469d1c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 21:27:59.6885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0rhqv7NV0gLAEvG21CKq8X8nPDdrfliWPTRIxIbjJQQnEzrPVnxaZTc8jwk6enqUYuY1fhiPnevgNGzUS56nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8675
X-Proofpoint-GUID: JnzxS4ChC3FLWy2rqk0c29RAK_RSREBf
X-Proofpoint-ORIG-GUID: JnzxS4ChC3FLWy2rqk0c29RAK_RSREBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=497 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260185
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
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXBy
aWwgMjYsIDIwMjMgNDoyMyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsg
YWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8yMV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24p
IENsZWFuIHVwDQo+IHByZWRfd3JpdHRlbiB1c2FnZQ0KPiANCj4gT24gNC8yNi8yMyAwMTo0Miwg
VGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gT25seSBlbmRsb29wIGluc3RydWN0aW9ucyB3aWxs
IGNvbmRpdGlvbmFsbHkgd3JpdGUgdG8gYSBwcmVkaWNhdGUuDQo+ID4gV2hlbiB0aGVyZSBpcyBh
biBlbmRsb29wIGluc3RydWN0aW9uLCB3ZSBwcmVsb2FkIHRoZSB2YWx1ZXMgaW50bw0KPiA+IG5l
d19wcmVkX3ZhbHVlLg0KPiA+DQo+ID4gVGhlIG9ubHkgcGxhY2UgcHJlZF93cml0dGVuIGlzIG5l
ZWRlZCBpcyB3aGVuIEhFWF9ERUJVRyBpcyBvbi4NCj4gPg0KPiA+IFdlIHJlbW92ZSB0aGUgbGFz
dCB1c2Ugb2YgY2hlY2tfZm9yX2F0dHJpYi4gIEhvd2V2ZXIsIG5ldyB1c2VzIHdpbGwgYmUNCj4g
PiBpbnRyb2R1Y2VkIGxhdGVyIGluIHRoaXMgc2VyaWVzLCBzbyB3ZSBjaGFuZ2UgaXQgdG8gInN0
YXRpYyBpbmxpbmUiLg0KPiANCj4gVGhpcyBpcyBpbnN1ZmZpY2llbnQgLS0gY2xhbmcgd2lsbCB3
YXJuIGFib3V0IHVudXNlZCBpbmxpbmUgZnVuY3Rpb25zIHdpdGhpbiB0aGUNCj4gbWFpbiBDIGZp
bGUgKGFzIG9wcG9zZWQgdG8gI2luY2x1ZGVkKS4NCj4gDQo+IFVzZSBfX2F0dHJpYnV0ZV9fKCh1
bnVzZWQpKSBpbnN0ZWFkLCBhbmQgcmVtb3ZlIGl0IHdoZW4gaXQgZ2FpbnMgbmV3DQo+IHVuY29u
ZGl0aW9uYWwgdXNlcy4NCg0KSXMgaXQgT0sgdG8gdXNlIHRoZSBhdHRyaWJ1dGUgaXRzZWxmIG9y
IGlzIEdfR05VQ19VTlVTRUQgcHJlZmVycmVkPw0KDQoNCj4gT3RoZXJ3aXNlLA0KPiBSZXZpZXdl
ZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoN
ClRoYW5rcywNClRheWxvcg0K

