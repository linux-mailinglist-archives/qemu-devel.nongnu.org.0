Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEB6EADB6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 17:08:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsLP-0004WN-VM; Fri, 21 Apr 2023 11:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ppsLO-0004RM-J8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:06:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ppsLM-0000c1-Ad
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:06:37 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LDr48K028014; Fri, 21 Apr 2023 15:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=9uN1BJEBjf5tHEzl3w3A0jP5rCmzH1TWLcm8CkGITeE=;
 b=Jtdq1vMkca3qwbIzQer1o5mD2Guzoe71f3924wedX/mRUfWXPOtuCUSCZiY4XP2HkPXS
 5esTb/P1rSNnDkhMDKHmvLbKx14NtCeiul7M0u6QukQMr6spRqwUBq+eI8ozMN+GTxAe
 FdX7MFdvc/aUPx5ftjatxhk5sJNI/MukMZfJMtaWR4Bu0gbxQJgn+7k/+WeQgy+UqPy3
 XIR6Ucv9END4MhqS5OfgHIPvYRquXBT8w0rkcZLkyeQ79gqtzC8KwqeAn0MRDmyLZH0r
 PCHAS+A5/ZjpwNPVu45sh5ID3INYPjXByl6ktMdG6IdRdjRDZcXhXoFKFu0agGZ9ZqA3 VQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3p3f0xgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 15:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkXNdWOHujEyX6OcA93TYJVGzjr0BwBCDn8KOEzgtQ+pv9ijlPo/zn7rjlnPIyfJrAOkynI2y973u87ig5QgTh15hi+fjKN9xxR3uuBDLkXCzhiQAKqvhrsfzzlSH1sB++XnYowhd+vil1nkUpT60U1EzuV9ieEVwIEuYNjTvPOcPo0cC/xBQXkik6KBZSPX50ZKyvXBvnXCyuQpk8UGwVXftPArGsWvkphPmPRycgK4EG0ealSW1EsM43r8NOLZplhUw9E+ffzD02DZAdk/QPE9YQDTcJYDd1HwNyfofjUWjWhFKF+m6skneqdbgC7rUrBKTUO0oHuVVuUeN8OVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uN1BJEBjf5tHEzl3w3A0jP5rCmzH1TWLcm8CkGITeE=;
 b=gRzE9VBrF29scT4oLGjIbmyFgqvBGtZH3zwqiKNOGtdD7VnuOuX9HGkeCi5fhVFVpzBM7RTC1Z6rQCe8kC2f2tkaruOGYjVzTpO/fGHlmeeifDr8JyrX6Rdrzi9q2FRxaIkb75t3Hz8j7PM4jkVKdzh7DLopALHF9wBLFuDLOjERSIupaF+1IifHmN8JpbyW5dYEMwFAgqageTWw9TMmgmb5k3WU/rU5CbQVpcrT+RgjqMy2qx3gePkkMsuJQ4EsbnOSrwdsG9xrqvHa2OIJQvCpzNLZxS4UOuyvWNEtK0zYvZmU5DbKzR+e+N+/1DiPguZA6YdFLMlRnQPWksa93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO1PR02MB8348.namprd02.prod.outlook.com
 (2603:10b6:303:163::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 15:06:28 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 15:06:28 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng"
 <anjo@rev.ng>, "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>
Subject: RE: [PULL 00/11] Hexagon queue
Thread-Topic: [PULL 00/11] Hexagon queue
Thread-Index: AQHZczf0uZG5psQAvEGHMU/5lgArza81bdwAgABv5AA=
Date: Fri, 21 Apr 2023 15:06:28 +0000
Message-ID: <SN4PR0201MB8808BDA7B8D01AE74F0D69C5DE609@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230420032634.105311-1-tsimpson@quicinc.com>
 <dd2f435f-19f6-b325-4594-89fda118eaa7@linaro.org>
In-Reply-To: <dd2f435f-19f6-b325-4594-89fda118eaa7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO1PR02MB8348:EE_
x-ms-office365-filtering-correlation-id: 80d8a76f-1a77-4b24-b021-08db4279fb95
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXtxL1e7dxo2DCy0mkfS/EbVHW0tKYVe+z3wUyGkPAsE3/Stx5LAEz2W7gXvFM8oUZgzZ/KLcYbiYoKIHw4wtzGOgi8guLlQ74WStZY/5E1uFD47nyMSL3E0mleItZvbA7tPPzjYy5IJvOxX8+1FzEQccmo6vJqxBa+nHQHw0eRm0gY6nJ3FoSdeHBzHuRA2YfFH3lim3g4G2wvE4vw+0CBioD7NaiL9W2LUscgSzBxzwg5wTJDxEKIyP5fSS8sSCcAgpk7DX5oeu2jdUdE4XVOy5JBZXxzyKGeUmwoMSWnZwKPRvk0VimKtFZjvuEJDysrHDuYppwLSAP1kbDcEk3+CZhMXgyZjZfPJz6vtpTCgLhyXSdqUu8f2DrqHNzSfAWnQu2U2ommeNSrHsGFbAdFmo4BwQx9VvgPZESB9NAGWp1kqEmlQBsdGCsIDsCGNWNS9xJWdcH3MaIjYcCtYRbQT9lRfQ6+9lA1lz9EYH4qStQbEzezTgOp5tnoVop6hNt3tqqXpTgLRR318EOn0EhWC9CG85l/DMiuWgnQAr0GDy4rgKb9sGr0parzev53pshwl3I6LqAPo1FG2lHq8amxmMVZ5HqimCg2tGutIN3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(186003)(966005)(26005)(66556008)(66476007)(316002)(4326008)(66446008)(55016003)(64756008)(6506007)(83380400001)(53546011)(9686003)(66946007)(76116006)(107886003)(71200400001)(7696005)(33656002)(86362001)(54906003)(110136005)(38070700005)(38100700002)(8676002)(2906002)(52536014)(5660300002)(8936002)(478600001)(41300700001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmY0Y2JuWmRQL0txQXk5OHphSUk3aFljY2U4cHpzU0wvWHNTZ3FGSlZHQmlS?=
 =?utf-8?B?cEQ4ajl2UFdsUlZNNmQ5dHdtc29XTFAxc1Vld3FpNWlENGJKQS9FdTF3LzFO?=
 =?utf-8?B?amVCRFFET3RwWEtwVFFFejJGYUpGQnQ3NjRqVGNJYmNiQVA1dGN2YjZGM2I1?=
 =?utf-8?B?ZkdQd2pzQm02djdDN3BZN2dRNW1MWHRIcHRSM0ZDNHJCdFRHQUxzUjBPTnVY?=
 =?utf-8?B?eVlrSFFIZm1KUHQvWWlLYXlHOEpVV2FyYkJVeU1CQ244QlNQTmlreFRUR240?=
 =?utf-8?B?NHJPUHBMREdDdFZRMzZZdXpVVWNmV3lPanN1cUdxSUU1ay9vTnBpMTZRdkND?=
 =?utf-8?B?T0cvMHlIR2lpaWtuendJS09wM0VEZVlnUDZKeG1JSEZVb3QzbHZhZloyOXlC?=
 =?utf-8?B?SVErVlM4N1dvbWpDUnlVZ2R5Q0pEQzRRckhCVkJsTkR5THZwZTFpSnhOeHRM?=
 =?utf-8?B?NVgvdS9odWdNWUo0a09sQjF6VGI0N3E4K05DTm9ZQ0RKRWRSRytEL1JvM3Jv?=
 =?utf-8?B?Ly9jREc4TTd2Q2FxbFczK3hUOEhjRU95QkY4SjhvU3I0d1RISENzSTNISkpl?=
 =?utf-8?B?Y1pScitueFZ3eUxTc0NxVjJvR3oxNEpkK0paVmo0VjZLLzRqaDdCWGFOaEha?=
 =?utf-8?B?Zmd4MVI4WVhIaG1vemNsSEl5K29xcnF6MmFaemRYRm1VRFBVeFJFQVdld0Vz?=
 =?utf-8?B?cG1Kck5kNDd0ZlZucm9NOWMzK0VFQUVLK216VDZvRWRVVGpDQk5QbXZWWUtU?=
 =?utf-8?B?cXFNaEJ1Qi8rVE8yMldWVTFWSGhKNzc2MVdBbTVJZ2dDWlhWVFBFaHR2ZmxB?=
 =?utf-8?B?Vlg4N1NqeUlkWE1qOGZ1a20vNDBRVGRGVXM3VHlaK05iUDZpNG8rV3BkVmJM?=
 =?utf-8?B?YW1SeWw2Q1puZXAzTHNUek9XbldoblNTWkNzSUdQTDVKUDBMelVwVlpxdVc1?=
 =?utf-8?B?bXJvZ2V4TzZRUHBod0MweEtHUnZWbGhDQmUxQXcvT1F2emV4SGlwLzBCTitZ?=
 =?utf-8?B?K0FnMHRtdElaMVJ6YWMvZ0o2TzYwcEpRbGI0dlRuVDg2QVBHcTd0RGhwT0hw?=
 =?utf-8?B?Y0kzRVdLRjI4czVET3ZURzZVU2QrSC9RNUFwL2ZKK0ljMDVzbzBHVDJxYnV6?=
 =?utf-8?B?b2xXeXJXNWZ2eWVkVGVSVUM3b0JuN0JkYjNiWVk4MHBIdnE5Rkluek0wRlNk?=
 =?utf-8?B?dXNzWWtkTHFpVDN1bWMyeTg1d29BdTYzZVNOZkdWeVltdjgxb1oram1NenR4?=
 =?utf-8?B?d3I4cmhWR0R1UWV5Y0pzSE9QUGxJTXRjZ2RUOWZQSkNtT2NpcVh1SWt4RXZ1?=
 =?utf-8?B?WXBpWHkxdEJ0UUdscStUQmh3M1Jpc0NXZW1tRWlvUXVZRGNjQ09YSzhkd1E4?=
 =?utf-8?B?eFROc0dSdi9oZGhnWG4ydFI0dDlibiswZ29jWWdUbkpNYjFjellNa3FIRjVY?=
 =?utf-8?B?ZnkzZkM4cGhOQlNHejFOZld1ZXlDSVN5UGlpZFA2emlXRVB2Q0kzQkt3c2hs?=
 =?utf-8?B?V1pXZzAvcS9wc2FvclVGeWJ5MHhQRndBWXJLMk4zY2R5bU13Q0V4NXFkUDVN?=
 =?utf-8?B?Rk9wTmlGOGhtMzdtVWFwMHJOcWY5TlFCQ2VXTGxaNHgvSkk3UFJSVlhUcThT?=
 =?utf-8?B?U2kyM0dhT2M3enExanMyZFdYVHZZWnpXSlNlaU9xSWJZb0I5bXgxSnd0UXVr?=
 =?utf-8?B?TXFsYjNDRm1EanZlalh0cVVpblZydVdqZFBNQlVmQXBObkJQWURaaG5NZlRL?=
 =?utf-8?B?a3pVMVV1cVdyaGJtS2l5YWk2MW1ST0tyUGFYaWhWWHFlWCtwQWt2M2VRbmZY?=
 =?utf-8?B?am91VjdCeTdwVzd2YUFZU1h0eTRjTnpxQ1pNd1RKSENlckxWa2RZNEF2K1Rk?=
 =?utf-8?B?RmJ1OHN0RmlBSWdZWHVZR2lXQWI4b2d4bXdQeTdidkJDUnMxL1RIQ1NtUXc2?=
 =?utf-8?B?bGh2MWVEOXJmdHVRQjJDdE54WnAwWGhvYTlQRHREVTBRTGhITlJQekdDQ0Vt?=
 =?utf-8?B?a2tDOWdzVGQyN0R5cDJxWmVsL3lZWlA2dXBXcXlMTmwvOGFSbG5BTnQ5ZERR?=
 =?utf-8?B?NmNHa0pjeDVFbllIY1JNMVdGQkpEaHBtWEZ6aDMwSTQxWFIxVEJESkdhVE5n?=
 =?utf-8?Q?03pV3qYhU3f9NPrK4uKfDiJQd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Bc60zs1Tgp/1KQuGF7jyIo5yxgQ3f8HR6r4o5ktDGsVOjiw0+jygJAIM6ATuDxuyMyvyaQaprIrOOjn/DgmT/MPxUKBWF2O1LEOgp1vz/dg8gPMX7x+HfOmBwIYeXKjjYVlZNBqmsVkZw2GpyjrbTLDP78Bjznmwom1YzFxBfIVS2AfZWT8Z65Dvuyc96WrJT0nkXhGSumDcy58ATJ0yQGKv0gWLdnXDttHN7RAxCYzwWAvS91mneDLNwulUxzhPd2RB8FCqr6rQX0+1eaR9V56BTVks/rKpnPeOjL496vksF9f7zxocc78zGEloHYKVJRPjPnIyv8+Ne4e6uDn2j4pOdWvMkUbZHb6tzlxIERIdpTUs/wHEDOcWSo1z3kZnVbTYl7Za3LSZzdHHkidyNJQ185JG3u6VgVm4rGUfHAxHLVeMWj8Mb/hCBPnXFfZRCDYFtqZ3uHSd68TNaikVHcjhSYTfCIlAl3YkPkR7yZYew1TPNYtja/g+N1sAdXbECbZWB2JVa/KgoykKxq/ANdioJ/j0ONQJLua+FcPDbv7zeP00Min/u9VUOMRlklIU+eWO8tbaMhnF0Yf/6gnNHbXsxPHNwMrout8P+dDYrZOwvW0ROJWbQb33bvqpdvEV7wGJY8C6DJ40lfxSiHD8DwiYtMaU38/2EHsFRBivDvMXDsU9tG0t3Nz9XJ33orp1H/BYKjyRIlVNbnXbXBzsOmCU73U49nZKxK/ARtITjWAz+GLopjpaK4+RCMMRZoMc2W3ZTcXcCHhRxSWGSfJc4NOopaKtJjU4lhJPfVFQ+0F8/wpMfaZijCqW7Lv9Z1aAqf7xKWfrZuP22jHONWqc5w==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d8a76f-1a77-4b24-b021-08db4279fb95
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 15:06:28.2336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYmj9Fek1nIWA57AbiejpxrMtkD5p1SE+ePAkm6S7sKeRhWyov3LXgKeUekx0Q1xfN1Vp6neVO67+jjpNt52bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8348
X-Proofpoint-GUID: LA4i7QydCyiyNEZU9AHOYvOcI8653t8e
X-Proofpoint-ORIG-GUID: LA4i7QydCyiyNEZU9AHOYvOcI8653t8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210131
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
MjEsIDIwMjMgMzoyMSBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgcGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47
IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+
OyBzdGVmYW5oYUByZWRoYXQuY29tOyBhbGVAcmV2Lm5nOw0KPiBhbmpvQHJldi5uZzsgTWFyY28g
TGllYmVsIChRVUlDKSA8cXVpY19tbGllYmVsQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BVTEwgMDAvMTFdIEhleGFnb24gcXVldWUNCj4gDQo+IE9uIDQvMjAvMjMgMDU6MjYsIFRheWxv
ciBTaW1wc29uIHdyb3RlOg0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQN
Cj4gNjBjYTU4NGI4YWYwZGU1MjU2NTZmOTU5OTkxYTQ0MGY4YzE5MWYxMjoNCj4gPiAgICAgICAg
DQo+IEZhaWxzIENJIGpvYiBjbGFuZy11c2VyOg0KPiANCj4gdGFyZ2V0L2hleGFnb24vaWRlZi1n
ZW5lcmF0ZWQtZW1pdHRlci5pbmRlbnRlZC5jOjMyMTc0OjM5OiBlcnJvcjogaW1wbGljaXQNCj4g
Y29udmVyc2lvbiBmcm9tICdpbnQ2NF90JyAoYWthICdsb25nJykgdG8gJ2ludDMyX3QnIChha2Eg
J2ludCcpIGNoYW5nZXMgdmFsdWUgZnJvbQ0KPiAyMTQ3NDgzNjQ4IHRvDQo+IC0yMTQ3NDgzNjQ4
IFstV2Vycm9yLC1XY29uc3RhbnQtY29udmVyc2lvbl0NCj4gDQo+IGludDMyX3QgcWVtdV90bXBf
MyA9ICgoaW50NjRfdCkgMVVMTCkgPDwgKChpbnQ2NF90KSAzMVVMTCk7DQo+ICAgICAgICAgIH5+
fn5+fn5+fn4gICB+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiBo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9qb2JzLzQxNTM1MDIyNzkjTDEx
NDANCg0KTXkgYXBvbG9naWVzLg0KDQpUaGlzIGlzIHRoZSBwYXRjaCBjYXVzaW5nIHRoZSBlcnJv
cg0KICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGRpdGlvbmFsIGluc3RydWN0aW9ucyBo
YW5kbGVkIGJ5IGlkZWYtcGFyc2VyDQpJJ2xsIGhhdmUgdG8gd29yayB3aXRoIHRoZSByZXYubmcg
Z3V5cyB0byBnZXQgaXQgZml4ZWQuDQoNCkZvciBub3csIEknbGwgcmVtb3ZlIHRoaXMgcGF0Y2gg
YW5kIHJlc3VibWl0IHRoZSBwdWxsIHJlcXVlc3QuDQoNClRoYW5rcywNClRheWxvcg0KDQo=

