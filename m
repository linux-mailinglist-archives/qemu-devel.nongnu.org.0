Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F146F261A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 21:49:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psqYB-0005cU-HB; Sat, 29 Apr 2023 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqY9-0005cL-Tj
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:48:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psqY7-0006sO-Nc
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 15:48:05 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33TJm0S9010253; Sat, 29 Apr 2023 19:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=HuteGA4saGiRxrljX22abL3OEmcQni4vy8Dq9jwy1U8=;
 b=LUMKgzhYC9RZj6Jk8hdNli7t9DdFCgmBSDax56deNSI40GTS57vWzaowvuXwLu3Sx4ET
 L+rrIHarVwBnp/PXVeL2Yi7AchCSZtRaF44fSCOvaQhqi6uPXVYPdQSVFBSih9sdPrUG
 XyRGTUH63YtPj/qvw9cqayJDmSk9IhkN6K4GnZtW4NVkQQMSU90NTvGmBWOGy/GqtxCG
 PjrUDIj0jfFpTOtOMora90hFKkYfQVLYsVIoZWoXRUfrm0hO0s/LkRcRMGS7ZN30q3EM
 gYEIX5itnBdqA45Oe+99rf+Qp1HliQ6W/DxmTsLhKvztXm3foWnLc36ru1um5UF62gxd Fg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8rxp99a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 19:47:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9QmXTC5w7HSimgNDSRl3Y1cppcTB3Y2dU5E9QnoKa7S+yDX4zqbSKXPp45fEnL8q3NG//urQpTZ7IC647MNzI3GRDjUW59LD9ZTMt3EDCoErSNPR3Y6mv4y0QWXPGTBemBuISgGhNNraCYEhJ7fZSxUSukEz9lGqTHmtNA/0yVZXXDo1a+ltb8XV07FvjCIcVp4SJB1KMTworUKnQ509tibCRNtIOHf/zOs9PEJvZa44hHovJhSCjMj4hKjbsHMR5fduBUZlz7YDgpg4xmkc4W4vwvJpmbgw8OcM/biO2qq0ozA2GW7QSUhnrQbVadWqon/pydx9jq5pp+g3LtfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuteGA4saGiRxrljX22abL3OEmcQni4vy8Dq9jwy1U8=;
 b=QgJLH1QtEZprwPHK/dMeKSVXWAzJc1swWU2tuApPK9foaLCNpylyLthHYpXyFZsHZ7R5EPBIqC8UTw/7TSut4niRvU1BrnR3wDB2dM+frhzxCn+hxpAXMykslZ6rqkwqq1Tx5oyFGDEjLtNf9N6NMzs0sarlXh61ooE4X/gxbgEWxMVc0FYWN2zQOt59u3P4CEmqX/5n3x/atTsMKSh2Uhkr6YxpPazwcWqQ6abBFNFceQkMXylwzcMFHb5UG1jBXhg/GezZlgFVhNcQHcKjkf9ARvFVc4gfgy4cvOxP0Z4U3HqsGjD5S78+cdj5pHEk4jwYmnxpfOOVB9bzafxpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA1PR02MB8527.namprd02.prod.outlook.com
 (2603:10b6:806:1fa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.26; Sat, 29 Apr
 2023 19:47:49 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 19:47:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2] target/hexagon: fix = vs. == mishap
Thread-Topic: [PATCH v2] target/hexagon: fix = vs. == mishap
Thread-Index: AQHZehI0/lp26rY7mUa8z/4m9gE98a9CBW4AgACn4+A=
Date: Sat, 29 Apr 2023 19:47:48 +0000
Message-ID: <SN4PR0201MB8808F6544178CC14E187901DDE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230428204411.1400931-1-tsimpson@quicinc.com>
 <CAFEAcA-EG33Ak0S===j8uh0wXEDcNPx7R+GAxF5ad8ptpNZGzQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-EG33Ak0S===j8uh0wXEDcNPx7R+GAxF5ad8ptpNZGzQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA1PR02MB8527:EE_
x-ms-office365-filtering-correlation-id: 73d7aaf2-cace-45d6-3415-08db48ea9c84
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /nxGuGcPN/TmE54Nwr1/Og6/IhQdbUC0rEb2UFYQAC0BEXU05yZSiOpiK+xnC9XKDqLWcK/zWokfziWMlUfKCphsDNUPXf0Idn1ldUwn90XeUqXr1dAHqgJxHpCRequdC3d/EZqDpGIMKy/KYh35P0/xNQO3WxU5NB0mAHyI+sU0lv361AMtbIFbm4vrlXd5wvlG7QuXkyt29u5lQG+RqP0eQGREfc4zcKjSnh8bjDo3ia4guX8qUlEKZrI1d16t0UXzYsq3lm+LpOcicxOV6EGcyljKb5PjH7Idk7bNcKnCPnz6xheNgzfZHeMHvmWMZhdvmNCZpsHMesbe+RM3RqTcfEPC4s9EH87gaCaSAbrFyy7Gytvv2AQyH7SbbKbhbduPCAd+RAe39EZOK9QzVTYuowWEZtYAERIn8zL1oKdv+Iv6rEeUTx16xI0OtL5skT0V5kBWvM7IIydS94h2lB1zAMuT1JQsKXGbUTALf4/6y4jWPJ+sL37GbbSpBjx5PH5dCpgQ02AR/bMHtZMei0EmYGUmfLccoMXr+5JALMvHpPWEZcZ2vWoISfLKBMDi+dvG59xg2fjqxB0Tdkr6TTAIELFNitMHbRvoymcbBzc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(316002)(9686003)(6506007)(53546011)(55016003)(8936002)(8676002)(38070700005)(33656002)(5660300002)(86362001)(52536014)(64756008)(478600001)(66446008)(66476007)(54906003)(66556008)(66946007)(76116006)(186003)(83380400001)(41300700001)(38100700002)(2906002)(122000001)(4326008)(7696005)(107886003)(71200400001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGsyMEZCT1NvOUZiMml0WUpYZUpiWHN4TG9SSTA5RzJXRG1IYzdKUGIrZDZi?=
 =?utf-8?B?SEVlQnpGUkozVGxDeDl1TjlkeG9vcXBvZDl0eld2clJIK2J2Z0xtSWdwSjlB?=
 =?utf-8?B?dVh1UFRxS01CUWY1YjNSTjBmSmw5bFlPa1VBR3UrYTZYRHIyWDhuTkpxNmVV?=
 =?utf-8?B?UUkwYUUvV2gvZE9qL2h3T1Bhb3ZCb2kvaFlrakJ3Z3ZzeDBFelpxajluTTdB?=
 =?utf-8?B?aUlBbm16cFRWMW1WWHZKcHovTFhpaUtVSmhPV3BnZzBoczN6ektScThDNU5H?=
 =?utf-8?B?N01xbWc4TlMvc2txTHFzdVNSWWh3Q1d2L1Y3L1Y5cUlCS29GV05nODdtNGkx?=
 =?utf-8?B?ZW10MHJpYnB4ZE5FbHpuazZ1ZnI3Vks2cy9Ic1FYNERsMWxZTnZuQXBCYVBu?=
 =?utf-8?B?c21ybEpNUlRHaDAxbnpaRHZMbjhVQ2k4ZHBlTG5mRkV5VG5hUkJqcDFHb1dr?=
 =?utf-8?B?RUpqRjZGS2Y1bkFkQWQ0R2Q2SUNjM2lvOEZVcmlHbVhvbExNdTY0b3dNQmhL?=
 =?utf-8?B?YUJKeG1xMHNIWkFwU0l4UXp0SXZUU3VWNDM4S0hLU3M3dUpIZE15RHhYOU5x?=
 =?utf-8?B?SGFUTU5qekY0dmVDU2dTMXVndVFlQ0FVZTZkb3RwbUJqbHBXYWxZRjBkMkVp?=
 =?utf-8?B?SWI4ZFNBOHF3Tm1Dby9hVEVSMXN0aXlDNVVNUVlBQzhtS2hDSjdnczRzYmNY?=
 =?utf-8?B?cFR4eXJIZERKd0RxRERBckV5NDMyQnBQck9haDNBbW51OURPUlFGeDQ0MlR5?=
 =?utf-8?B?ZmdWZjlOcjZROWpLOFlBbm1BQi95b3FhZVZuSUh6UVJKbVQyNkNiZ1ZQaDR2?=
 =?utf-8?B?UTRtUmR2WmFyUmlxdXZyRmFFNk5PY3dkRkRuYm5QU3Y1M1N0bHlVeHZ5Tk01?=
 =?utf-8?B?MDY5RmlvSHZRRHhlaGtDZm9veTZMNCt1bVVBV2t5YVBVUGZTeG9Ud3c5eTBX?=
 =?utf-8?B?NGtNdWMxcHRhYkRyTkEwTEpBUDh5eE5ybElMdWgvd1pnNUhrclhUMTQ0b3pj?=
 =?utf-8?B?aDBxWjlhSjh0aWFEdlFRZzc0V05TaGxHVkNnN3NnRTlJT0hFSmtXUjBib0NS?=
 =?utf-8?B?bWFRYTRRRTVYazdtdDJHRHdpMi9mSmJWdnEySkdjK3JvWGwwd05qK1VjQTda?=
 =?utf-8?B?SG1oVlRkRE90eXhRZXd1R3VnaG96YjA5T2tWVzVzR1Y3ZHVJQzk5NFZtendF?=
 =?utf-8?B?RXl4V3R0VG1TUnRNTHpSVmIwQ2tkY1pIMFNGZDlpVm5TNkFvTmtyV2FMNmFM?=
 =?utf-8?B?RW1MY0JWeVBCNVROcWg5cXE4dEIyblJ3VktvcGYyQ01Zb0pkSlh1ZnNWVnAx?=
 =?utf-8?B?OGNDRXlTK2FOczB6bG1teDd2a2pzUWhsbjhuTzEvSTkyb09UKzNERnFrQ1cz?=
 =?utf-8?B?YVV2V0Mwb2EwbzlCcmJwMTE2ekhwQnJCMFRld0hwME9xQ1NYd1UzbGkrRnZm?=
 =?utf-8?B?K2RrczMxMlRVdDdoNGZmQ1F4RzlsMFJxdGFXVUVnaDc4NFhZVjBOaENpZG1Z?=
 =?utf-8?B?OG56LzQ0R3NIdzlxNnR3WmZjU1g2WnNOazdzclMyRG5MWVVIOTQ1aWdoZTRh?=
 =?utf-8?B?VXBGOEtCa0RWNVhQeGk1RElvQ0pqSFNsb3ZocTdYMm1kYUZZaGt5N3JKME9M?=
 =?utf-8?B?OGV3NmJtYTZaeFRoSGFvZWhBM0hoWlR0WlFkb2M4dmEyaVU1K25DRnJUclJu?=
 =?utf-8?B?cHVocVFKTHJiQ3h5bGFVNnN6Ri9WSm10cTV1bmFXRWE1cjZudDFQSEp1MHow?=
 =?utf-8?B?eWNkdzU2eEJ3NkZNdWdwSTBTRXlmUERlcitlNk96endmb2k4K0ttS1RzNklD?=
 =?utf-8?B?SkJkM3NlQU1zVjMyOHc2U0EyMEZVSnRvMDFqczB5MUtuTnVrczdIcGQvMDh4?=
 =?utf-8?B?RGtwVmhJR3hsc09QOXo0cHZlYkFpUDhKT0k2Y2J5RktySG5pV2RQMUVPRzkz?=
 =?utf-8?B?UHZ0R0dIZ01oZytOY2drLzJ1WXVHajFNYmxUYm4zZ1I5eFNFMFZibmZicDY4?=
 =?utf-8?B?T2RUQi9QWlZDSXFlUDc2aEViU2ZuVTBLWTZqcG1XMGlKenRxVHNOZjg4R1lz?=
 =?utf-8?B?dWdwV1VLTjN6Wk9JWjl3T2VHNDB6RkZSZ2tRbEx3SlhsQkZBVkdMVVlaRVVp?=
 =?utf-8?B?bm8rTFFpam1wd3Y4eWZ0Nk9lV3IvRytaMFZ3TCtsNFdsSXJTcGdDSFc4d015?=
 =?utf-8?Q?v82+gceRIquUlTymc2KVaLuRyn6XMY+aFLvQv6dY80O/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6/FEffUSW8LP1sYdNd02f7FIBR5NbwkprHlFfnL5H6SZvZLSZtzQshQAoE+aoK3PMF+gCGtWAZOkxvphkp+wOJZH6gh7NhEWHUKROwW2K7XgwQ+F9GKar3OvqXBhJtlObXw/gWNTTtDvbcNGqnq0VtUtMf/n//eJSSGAJtj0XnhRBMClV3GLytKOKi3lz9EVqyUYMSY/2OC5p3gEmSL/XE1kmpxQ5La+4M33yoYhKSRNN06OwUudqij8vCflW3riPPi/vmuUsTbVLtafj3/NqN0qGFrDzWgTd+w8I5wDWuKUfFQ+vNId5rDcBQouSeqjPuy8YzegRoxF03rtaVa5uLpG3XtHqbkGZgQSkLeFzlBUNGxOl8dojqIqnwVbgMFFDIFNUjomUtbgeoaIBrbcgHTiGsC9R6nsGfDctJN/qEDbe5YczrUk2J1KwcUNNsCcuGV2p0s2FBNfykwMex1ORHsh22unbZxyFbGkkMRQ3KMfMn+vNyP66oW9w1Yb+Gv7y+V8xhEVq3zoOo9Cg+RyU4zaBwA/Qx9p2rwjZhf7Nm2dHvKbpVaXdueornlRSV5qWrkCZkFcO4IoQ6ppfXskxHJvney2XelB6jSNnTasYsS7Q1qzN8WAQBzAeDi4uZU6q3HvJ50ieC6EKT1LOA5zE7KP8JvYqfYeksPoI1znfp13eox0EHHP8Kz6g0Y5HRSfBGnuyheEW7Zrcdq6qln9lNUD1f/+AWicOjYwwXHSf2XFBhGeFQ5I8ABsHciMNWwtQK12VhGIV8h3aiiFSYvxUtyJqf1Cv6yvI/rJHSntRROzVZ69tduP6TTivvyuW6Z3iMNdZB7B9bHGjQ6brGi2EA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d7aaf2-cace-45d6-3415-08db48ea9c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2023 19:47:48.8215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8iZvu71hDeK/u4yWUWdaNw8iNvK2/nDxYcspJ422noqj5KL6Q7W1/MbGkb0CdOEYLTP4FE5dypz8ISbgb4zFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8527
X-Proofpoint-GUID: XSXYQPwB8FSDCwO5mYy9rPublPB4acyL
X-Proofpoint-ORIG-GUID: XSXYQPwB8FSDCwO5mYy9rPublPB4acyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-29_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290188
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgQXByaWwgMjksIDIw
MjMgNDoyNyBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0K
PiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBwYm9uemluaUByZWRoYXQuY29tOw0KPiByaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOyBwaGlsbWRAbGluYXJvLm9yZzsgYWxlQHJldi5uZzsN
Cj4gYW5qb0ByZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsgTWF0aGV1cyBC
ZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2Ml0gdGFyZ2V0L2hleGFnb246IGZpeCA9IHZzLiA9PSBtaXNoYXANCj4g
DQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNv
bW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRv
IG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gT24gRnJpLCAyOCBBcHIgMjAyMyBhdCAyMTo0NSwg
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+DQo+ID4NCj4gPiAqKioqIENo
YW5nZXMgaW4gdjIgKioqKg0KPiA+IEZpeCB5eWFzc2VydCdzIGZvciBzaWduIGFuZCB6ZXJvIGV4
dGVuZHMNCj4gPg0KPiA+IENvdmVyaXR5IHJlcG9ydHMgYSBwYXJhbWV0ZXIgdGhhdCBpcyAic2V0
IGJ1dCBuZXZlciB1c2VkIi4gIFRoaXMgaXMNCj4gPiBjYXVzZWQgYnkgYW4gYXNzaWdubWVudCBv
cGVyYXRvciBiZWluZyB1c2VkIGluc3RlYWQgb2YgZXF1YWxpdHkuDQo+IA0KPiBUaGUgY29tbWl0
IG1lc3NhZ2Ugc2F5cyBpdCdzIGZpeGluZyB5eWFzc2VydHMsIGJ1dCB0aGUgbmV3IGNoYW5nZWQg
Y29kZQ0KPiBkb2Vzbid0IHNlZW0gdG8gYmUgZml4aW5nIHl5YXNzZXJ0cz8NCg0KSGkgUGV0ZXIs
DQoNClNlZSBiZWxvdyAuLi4NCg0KVGF5bG9yDQoNCj4gDQo+ID4gQ28tYXV0aG9yZWQtYnk6IFRh
eWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRh
eWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGFyZ2V0
L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYyB8IDIgKy0NCj4gPiAgdGFyZ2V0
L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIueSAgICB8IDQgKystLQ0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jDQo+
ID4gYi90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jDQo+ID4gaW5k
ZXggODY1MTFlZmI2Mi4uMGEwMWVjMzliNyAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvaGV4YWdv
bi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jDQo+ID4gKysrIGIvdGFyZ2V0L2hleGFnb24v
aWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYw0KPiA+IEBAIC0xMTIzLDcgKzExMjMsNyBAQCBI
ZXhWYWx1ZSBnZW5fZXh0ZW5kX29wKENvbnRleHQgKmMsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgSGV4VmFsdWUgKnZhbHVlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEhleFNp
Z25lZG5lc3Mgc2lnbmVkbmVzcykgIHsNCj4gPiAtICAgIHVuc2lnbmVkIGJpdF93aWR0aCA9IChk
c3Rfd2lkdGggPSA2NCkgPyA2NCA6IDMyOw0KPiA+ICsgICAgdW5zaWduZWQgYml0X3dpZHRoID0g
KGRzdF93aWR0aCA9PSA2NCkgPyA2NCA6IDMyOw0KPiA+ICAgICAgSGV4VmFsdWUgdmFsdWVfbSA9
ICp2YWx1ZTsNCj4gPiAgICAgIEhleFZhbHVlIHNyY193aWR0aF9tID0gKnNyY193aWR0aDsNCj4g
Pg0KDQpOb3QgdGhhdCBiZWZvcmUgUGFvbG8ncyBjaGFuZ2UsIGJpdF93aWR0aCB3b3VsZCBhbHdh
eXMgYmUgc2V0IHRvIDY0LiAgQWZ0ZXIgdGhlIGNoYW5nZSwgaXQgd2lsbCBiZSBlaXRoZXIgNjQg
b3IgMzIuDQoNClRoZSB5eWFzc2VydCBpbiBxdWVzdGlvbiBkb2Vzbid0IHNob3cgdXAgaW4gdGhl
IGRpZmYuICBJdCdzIGp1c3QgYmVsb3cgdGhlIGNvZGUgYWJvdmUNCiAgICB5eWFzc2VydChjLCBs
b2NwLCB2YWx1ZV9tLmJpdF93aWR0aCA8PSBiaXRfd2lkdGggJiYNCiAgICAgICAgICAgICAgICAg
ICAgICBzcmNfd2lkdGhfbS5iaXRfd2lkdGggPD0gYml0X3dpZHRoLA0KICAgICAgICAgICAgICAg
ICAgICAgICJFeHRlbmRpbmcgdG8gYSBzaXplIHNtYWxsZXIgdGhhbiB0aGUgY3VycmVudCBzaXpl
Ig0KICAgICAgICAgICAgICAgICAgICAgICIgbWFrZXMgbm8gc2Vuc2UiKTsNClRoZXJlIGFyZSBz
b21lIGNhc2VzIHdoZXJlIHRoZSBzZW1hbnRpY3MgY29kZSBiZWluZyBwYXJzZWQgcGFzc2VzIDMz
IGFzIHRoZSBkc3Rfd2lkdGggYW5kIGEgNjQtYml0IHZhbHVlIGFyZ3VtZW50LiAgU28sIHRoZSBh
c3NlcnQgZmFpbHMuDQoNClRvIGZpeCB0aGUgcHJvYmxlbSwgd2UgcGFzcyBkc3Rfd2lkdGggYXMg
NjQgZm9yIHRoZSBTWFQgKHNpZ24gZXh0ZW5kKSBhbmQgWlhUICh6ZXJvIGV4dGVuZCkgcHJvZHVj
dGlvbnMgYmVsb3cuDQoNCkFmdGVyIHRoaXMgY2hhbmdlLCBhbGwgY2FsbCBzaXRlcyBwYXNzIDY0
IGFzIHRoZSB2YWx1ZSBvZiB0aGF0IGFyZ3VtZW50LiAgU28sIHdlIGNvdWxkIGdvIGV2ZW4gZnVy
dGhlciBhbmQgcmVtb3ZlIHRoYXQgcGFyYW1ldGVyIGFuZCBhbHdheXMgc2V0IGJpdF93aWR0aCB0
byA2NC4gIEFsZXNzYW5kcm8gYW5kIEFudG9uIGFyZSBtb3JlIGZhbWlsaWFyIHdpdGggdGhpcyBj
b2RlIHRoYW4gSSBhbSwgc28gSSdsbCB3YWl0IGZvciB0aGVtIHRvIHdlaWdoIGluLg0KDQoNCg0K
PiA+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55
DQo+ID4gYi90YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55DQo+ID4gaW5k
ZXggNTQ0NGZkNDc0OS4uMjU2MWYwZWJiMCAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvaGV4YWdv
bi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55DQo+ID4gKysrIGIvdGFyZ2V0L2hleGFnb24vaWRl
Zi1wYXJzZXIvaWRlZi1wYXJzZXIueQ0KPiA+IEBAIC02ODUsNyArNjg1LDcgQEAgcnZhbHVlIDog
RkFJTA0KPiA+ICAgICAgICAgICAgICAgeXlhc3NlcnQoYywgJkAxLCAkNS50eXBlID09IElNTUVE
SUFURSAmJg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgJDUuaW1tLnR5cGUgPT0gVkFMVUUs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAiU1hUIGV4cGVjdHMgaW1tZWRpYXRlIHZhbHVl
c1xuIik7DQo+ID4gLSAgICAgICAgICAgICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAxLCAmJDMs
ICQ1LmltbS52YWx1ZSwgJiQ3LCBTSUdORUQpOw0KPiA+ICsgICAgICAgICAgICAgJCQgPSBnZW5f
ZXh0ZW5kX29wKGMsICZAMSwgJiQzLCA2NCwgJiQ3LCBTSUdORUQpOw0KPiA+ICAgICAgICAgICB9
DQo+ID4gICAgICAgICB8IFpYVCAnKCcgcnZhbHVlICcsJyBJTU0gJywnIHJ2YWx1ZSAnKScNCj4g
PiAgICAgICAgICAgew0KPiA+IEBAIC02OTMsNyArNjkzLDcgQEAgcnZhbHVlIDogRkFJTA0KPiA+
ICAgICAgICAgICAgICAgeXlhc3NlcnQoYywgJkAxLCAkNS50eXBlID09IElNTUVESUFURSAmJg0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgJDUuaW1tLnR5cGUgPT0gVkFMVUUsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAiWlhUIGV4cGVjdHMgaW1tZWRpYXRlIHZhbHVlc1xuIik7DQo+
ID4gLSAgICAgICAgICAgICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAxLCAmJDMsICQ1LmltbS52
YWx1ZSwgJiQ3LCBVTlNJR05FRCk7DQo+ID4gKyAgICAgICAgICAgICAkJCA9IGdlbl9leHRlbmRf
b3AoYywgJkAxLCAmJDMsIDY0LCAmJDcsIFVOU0lHTkVEKTsNCj4gPiAgICAgICAgICAgfQ0KPiA+
ICAgICAgICAgfCAnKCcgcnZhbHVlICcpJw0KPiA+ICAgICAgICAgICB7DQo+ID4gLS0NCj4gPiAy
LjI1LjENCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==

