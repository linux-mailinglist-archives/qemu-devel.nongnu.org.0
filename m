Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77162A09A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:45:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzz5-0001OQ-I1; Tue, 15 Nov 2022 12:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ouzz3-0001Nw-5d
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:44:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ouzz1-0004Ic-9u
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:44:28 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFF098H026301; Tue, 15 Nov 2022 17:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=prMXIN9vU1UgbkKkYoyox5oIEztqhh8n508v/o7EopE=;
 b=SMrkVZOqQOwCvAqIOt2xGsknK7qH+NaJ9n8Bk7LRO2tM+fHVvff6qhGckLTIHnzvbDjd
 m59f3nXFd9LcFYhQGEhTNigO4MJrCb5M6SX3kXL0l4F8jzcuonFo4/Kkl/LhN37YTy+W
 Gau9H63qiZsWNB5ivpMgmd1tYSxsl/a1Oy2uXNfwfxpb1jpisPHywhe9l9qeoexev88K
 /ZiNLE1LK0x5wVpjKExipLOKrqsUnWyW5LwR9HLQVVwcsdVubdYWzJs2ku1TY2UXcKQk
 KO7t/Aw/TQPdVJVSw/40WU0MY6oUJu2/J8pyLhCOCJ/k8JtBjN1+mZvrqRhe7GgBuRXc 1A== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kus8cknf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 17:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoF5AtK+M9o28bnKl6Yvrm6tQv5alzSjE+dy0Tt3XvtWTfzxXCo7AIdsgN85QyTjq8dgVtBuJT1AEXCGFzrHj8MTQUr0hNtT9dSOlDVhO8b5TRl76IRItAKBo+fq4KjaZVaAs9eDruiU23Of+4iDROauPlkwCFw5i7T62YreqDgYg7jV0nVW/6X39HBrS0zT7UWZ2ACJgGh41LU0AwncZQuZPvovGQ1eIZPgXfqe+KQkPHHHWITzg6D67qN1XYMxeJHelTX1qLuPZewOD/1kcLLU8fhbCpHKx8/Txrx3XuSkqF0Rq9DrNpSFo3di0sYszJGbK+ro7nLKE4D6YhfiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prMXIN9vU1UgbkKkYoyox5oIEztqhh8n508v/o7EopE=;
 b=KDDGp1o4gx3vnIpFJYspn902YsIBlJ9PNfSeuk8U64eJdscDutxFpR0EGgI7nVXCEXJ0W0vIx0gfSDN3A3TeRH6b5ZtC81VtpA+x7ssJtbvdsgwsgzgquwWmmdLl+I5nLEp5LrDxS7Ia8Qurdr5NH6ibN3hMXbL/0egMdJ6RpMZp8isjWimFz5BBUfrQrSC4G26PuK134G2RLoRnieuVIZd3b3icrPqMiRbSObF7lO3Xuhi0UntADt3jzwEsWcFNBkaogAqZkDRvJw6vlD2/pP0HbtOq7fuKKvTkmgiE9S/N4KtCxx/t5MsMADzsir6D3DgDnoGF0rBuNGfKzumsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB8002.namprd02.prod.outlook.com
 (2603:10b6:208:359::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 17:44:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 17:44:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>
Subject: RE: [PULL 00/11] Hexagon bug fixes and performance improvement
Thread-Topic: [PULL 00/11] Hexagon bug fixes and performance improvement
Thread-Index: AQHY9WfcwYv7SUoFVkGu3TtRUWjXoK446PeAgAdHS6CAAAorgIAAAnNA
Date: Tue, 15 Nov 2022 17:44:21 +0000
Message-ID: <SN4PR0201MB8808C57A38E108ECA717F17FDE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221111005214.22764-1-tsimpson@quicinc.com>
 <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
 <SN4PR0201MB8808E53696703AA2AA339763DE049@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <CAJSP0QVh0ynmSa5W2FSSR5T+8FRGmnC3kX-1o78qLXoiXn6O0A@mail.gmail.com>
In-Reply-To: <CAJSP0QVh0ynmSa5W2FSSR5T+8FRGmnC3kX-1o78qLXoiXn6O0A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL3PR02MB8002:EE_
x-ms-office365-filtering-correlation-id: 1c2aee0e-2e66-42c7-12e3-08dac731075f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gu9U3xyARxtc9Bc9h8C+rScbGvTNgOwbJdMAUJLRHwCM4O/9mPS5CdKJprEGBcOjJ5FBwWKGOwedCJvjsCvWWDmqScAS2A5V7jNyLEvrzGw1HkwtYJ7Rk8trQvHvxCLyueWGNVWwiLh8qBuEBWR6PdEgj1tfSbDdeTzzmAFCMSJTnAv5U2icPn8j4wEIOJLLf9O3Rqw0GDFr/ZPKABOzRCFPBapggszeQ6t5a6gqPS0h+Y1O9yGZ0m4SH6ckPFA5rCImUsb3r3lLD24/AAee0irCTAuWFn+YkXtFZEGASwy1m9D5SOL9PjB0ueef+kAJse1v0HdA8lezEviB8ZsjwL0xKN3FeP4HY1skcyZsgeSNAyZaWUKyhz9PdfyxkgREZ/j1/CdmLsO/KSTzoqJcE+3lF0PLwUkyyZk/qeCx5f+mT9L1k3eK8xgcUGXX+Egrf/Qf1iK056g4f/GFh1Ro92yL97/W2CCPNk6PfOCn6HpeH2mGOPXDqdg1Z73J2q2lVlEXI0d0PPmcXEPc3Bqono0YvQtP1675d1nmJVIWtwBy8gT1bmEjiaTnK+Ph8jZXucoUEwe3ZE8BkBn/DTdCO+qWxCbuNs3TdNCDxTOMdmNfM36B4ZM/TGWGyFpFDG9zwFfyHUl/mu0j6O/iGYrUlSuesDqPBLWgObKfT+zhzlrrjyJ3gUygzaxIp4UJIACL+Nf4ihqq4up5+3SQDQdNxHEai4bQK3cpm5Q0LHH2JFwggD9Ufy6BC5awWayFY7uKKEoj1uj2zhvokrsuQQMJiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(71200400001)(55016003)(7696005)(6506007)(66946007)(76116006)(478600001)(316002)(53546011)(66556008)(6916009)(54906003)(33656002)(86362001)(186003)(26005)(9686003)(66446008)(8936002)(52536014)(5660300002)(4326008)(8676002)(64756008)(66476007)(38070700005)(38100700002)(122000001)(83380400001)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkFsdEtacGhGeW9jTWFGU2x2UWg2MG9xZkV5Y3d4TERDb2JtbVNxaXRpd3hJ?=
 =?utf-8?B?dGNGeVhYcTMrOVpOMytwUnp6LzlJcVEwVHh2bGJnd2haa0QvTlJhb3g1SEJY?=
 =?utf-8?B?a243akswdTE0amUvZlpLbkE2c3ZyZnVrOURxOVBudkZzd0V6eUt3bkxuY0dr?=
 =?utf-8?B?eEhyMHZJSXdvTmZ6YnFqRVhhUUNscnFVcGN2YnNIc0NrcUYzNzdvdWJOZDht?=
 =?utf-8?B?ZXl2NVNCK0g4VnFrMmlqc1NIWUlOaS83S2EzZDh2cFdxMmFoeGloR2xxUkVI?=
 =?utf-8?B?Q2RjOXo2azBqaHg1MkpyMiticGU3Zm1XaTY0R0JHa0ppVXk4SlhMMWZsU20z?=
 =?utf-8?B?UGc0c3NhVmFsVkVSdXl3ZlJneE5kMVlScVZOTEh0L210czRqWlpuOWtVTS9R?=
 =?utf-8?B?UnJRLzBQcVkvVURYdVZSaHNBdzZhUjZJSW5aVG52dmpuVzRHT09YWTBsQmZu?=
 =?utf-8?B?aExXMnNYVEc5RldwVmw0ZE9XUXk1V1NqWnNZemlNYWVFZ0VQcU9GR3hKZkQ5?=
 =?utf-8?B?dGVxbU4xVDRGdWprMUhBbU1kQ2Nha2hzV2lQc2dOczNXNHA4M2xjVUpUbEwz?=
 =?utf-8?B?VGFIeFNIVTluS2lKd2Nxb3pWVGU2WXVMWlNUN28wSXZTY0lwSlNsSEw5Tmdw?=
 =?utf-8?B?TWJYV0JlZ0hmS2JqVkJVNjFicXEzdjB5OTM4eDB6Q3NNQi9yYy83ZW9WK0NX?=
 =?utf-8?B?WlFOYnBreTJ5MWxoZ0VlWHh0d0tucWJuWEpOTHpCaE9MTUtMaDJkbDRaSEkr?=
 =?utf-8?B?ajExeE54UFRzZEdjbVZwZllEVXVpN3BzUXFCcEtUSFBBeEFJM2pBVHBrZnU1?=
 =?utf-8?B?ekhPclo5SHhJbENkWU8zcGxIam9BMXhWSDN4M2wzcVVYZG1CazZhc3Z5YXda?=
 =?utf-8?B?RmhJSlZPQmpEaUtTTURyTXlhNkdwY1QreUZkQzRtb3diNDgzNHprL0pmZmtR?=
 =?utf-8?B?Z0lrZUpwZEg0SjF2MzdxVktjQTJTMSt5ZDBVMHdyQ0Z4VU8yV1QvTU93Q1BY?=
 =?utf-8?B?MFNEYUV5MjFTZlNmLzU2OEp4RzdZK3I3ZStyTCtGRlowaGxjdlNoK3NKeG9E?=
 =?utf-8?B?KzdmdVVib1hhRmNQSG85U0JIU201QVlZL2IwZDAzV2ZKaUkvTncwUW9qdEh5?=
 =?utf-8?B?anRmeEQ5RldMNHkvM0FzN09HWDdWd3VaNC9reU4wYk92S0djd2gvcHhtRDBQ?=
 =?utf-8?B?TFA2N0lvVGVsa1VzS2p0MUU5Q3NnYXl6Qy9POE03amZEN2JHWlBCbmx0YXRP?=
 =?utf-8?B?dXFJQWc2NUhFSFRSTkhWWDJnelBnUzY1NS83U3ZxNUVBbXhJbklYVzFKNkVE?=
 =?utf-8?B?b0lYTUdMS0tNb1hKVjJWaGdicmo2NTB1V2hqWU1KSXB2bXZaOWYrVkR2NHMw?=
 =?utf-8?B?VmhzV3JBWmpDaUkyeHE1NUhmSlA5bndWaSt6OSs1bHRNOWxFeVU4UjRBbDFG?=
 =?utf-8?B?eUNlRFhESkw3L2thRWVkYXR2Tkp1a2hleU95OERJeG5kckJtNUhkczlXU2J4?=
 =?utf-8?B?d2R6Y3RuQkxUTTFiVjd5a1hwVVhWOEY4Q3hKYzFGWnVQVlk3VFpNUFVibEh4?=
 =?utf-8?B?WVhGQlk3S0lXUWU1ZDl3OUN6SXk0U25nQ0dyM3pCWjMwU0FuOW1QR0FCdVVR?=
 =?utf-8?B?aWN6NTUvOGk0N3E0WXFobjJXUVVub1NrQjBBNDF0WE9nMGZpMG1DOWpUbC9C?=
 =?utf-8?B?TzBrSGdrdFdrS1hmMXZ1UjFOeHJnNjUycE1yVGRiWE9wcTVHeEg1emF6bjMx?=
 =?utf-8?B?enpEajZTUmU5ZHJQYXh5ZXhBRWhIbkhGOGhmalh4MGhJaEt6MEh6NVpiZEM4?=
 =?utf-8?B?dzBGM09Hd0RRRS8vRm82aHNVY3g5MmNmaTFlRm9kbHpKSXp0a3llVnc2eUYr?=
 =?utf-8?B?czg5TVVVYUxTMmx0UEp4WDhDR042R09zRTFrZFN1UXcrbXAzSDdDV2tJYnpy?=
 =?utf-8?B?WjY5L0tqanRYdi9uQ2pNVDdkdzJlUFYxaUI4Y0h0YUZiV3NNMHpGc2lCUUVD?=
 =?utf-8?B?MmFEQVRFQlc1b1JiUEUvT1l0eUNheG56S0txMGpyVitDWWMzMytUYWpuU1Q2?=
 =?utf-8?B?OGpscWZGSWtoNmdBa3NMaEJUc2s0WENpVExNRkVXdHNETngxNzhtZnZteHRP?=
 =?utf-8?Q?fNTvayGDoertYnUV5E2KM2k21?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RM0mFj4yCSPZSnBAWSwdTrYCZgz+ZqXvetqHvau0p+BLTfVWfslNXgTEz7glEFXheAsIy99Oaq0HXpz2KL3iQIEMWUfPEbTlqaCUAjnHYkMbK5lT+Wk5lBoQ1oFMEmAzY539vfaVDz0qbKHJsm4Ty2mdUaH3tLWmaM6jF6QNESC/PkX7Yfd9pMFb2hg+/pKXkSrajWioYHsgC2eix2SPzTV42p6ejCSrM7Lcjkda5GpZ8pAPyXNPLJQV/yHueDTkTj4lDVWoIT5ryLFhMfKcK4hr5eejb9H9O4e05vjaTuPYtF9wjkibIojUt9+BEmKuazmrMtCaZ1UUuBIM8MZTuGr6JQvutQfFPhiK3ExYaWnJlERqGESfk2odUbOIcx+6RgxNLJWyP0VjHfNhnwM59yF0OihloCMdh1xe/K+S2FhtpyrTfNPBZg0oH1X5En1cCjHy0VRhDz1T8NjzGczFuACHVkajw4VpJCn4IEkMnXZRYgu75ToJCVu2u4qrtkxXnA0QkOx4Z6thv+nJcsU743vyCNYDhHH/35KgO/+tGwWeStIda4b/OtHvNza34DZ5DhbNmU0t1TijJsI3+TCx5w4c6Yz1D8lZf9rtPc/mGxDSDXSV2gcuwg75FB6SGSggNd7vbJZ3aXIw2BMVnlKWcz54q8J9ICYzoRNTy5RshDW0UiPNVmrF1L8pOZyr4e4C98IdUTOW9QE4iJZZziWXKOZ4gEN/Hofdy16An3s2n57vzqEB0SBAauRSECVDGfSNBMnz676jfbTBZd/ZgOqePc/iXgY1p9JaLAv+RyBGG+D4wAvdLfp8TKikWPhvMle3Yj5DU8kBMImOgMwegXKqq+wfyghVmlhjQGXb6GRqRy7TrStZ6MnlbEk/HRD66HLOf7Jpjv1HEquoeXRdY/jLYLyBFsUwYLRPTFzF+GQYX0s=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2aee0e-2e66-42c7-12e3-08dac731075f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 17:44:21.7186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WcZOXtTjty9NyPhbtrTKGq7GYTFWtcoEO7aZi1m/i7P0/Jiswj3uTS8MMtvseohqCm2lGNX5N5yCXWz8ttDhww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8002
X-Proofpoint-GUID: EatrwDkhZ6QXktFTfkILef2i6MFX_whZ
X-Proofpoint-ORIG-GUID: EatrwDkhZ6QXktFTfkILef2i6MFX_whZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=729 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150119
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE1LCAyMDIy
IDEwOjUyIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+
IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7
DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IEJyaWFuIENh
aW4NCj4gPGJjYWluQHF1aWNpbmMuY29tPjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8
cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT47IHN0ZWZhbmhhQHJlZGhhdC5jb20NCj4gU3ViamVj
dDogUmU6IFtQVUxMIDAwLzExXSBIZXhhZ29uIGJ1ZyBmaXhlcyBhbmQgcGVyZm9ybWFuY2UgaW1w
cm92ZW1lbnQNCj4gDQo+IE9uIFR1ZSwgMTUgTm92IDIwMjIgYXQgMTE6MTYsIFRheWxvciBTaW1w
c29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBPSy4gIEkgd2Fz
bid0IHN1cmUgaWYgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzIHdvdWxkIGJlIGNvbnNpZGVyZWQg
bmV3DQo+IGZlYXR1cmVzIG9yIG5vdC4NCj4gDQo+IE5vIHByb2JsZW0hIElmIHRoZXJlIGlzIGEg
cGVyZm9ybWFuY2UgcmVncmVzc2lvbiBpbiB0aGUgdXBjb21pbmcgcmVsZWFzZSwNCj4gdGhlbiBm
aXhlcyB3aWxsIGJlIGFjY2VwdGVkLiBGb3IgZXhhbXBsZSwgaWYgUUVNVSA3LjEgd2FzIGZhc3Qg
YnV0IHRoZQ0KPiB1cGNvbWluZyBRRU1VIDcuMiByZWxlYXNlIGlzIGdvaW5nIHRvIGJlIHNsb3cg
dGhlbiBhIHBlcmZvcm1hbmNlIGZpeCB3aWxsDQo+IGJlIGFjY2VwdGVkIHRvIGF2b2lkIGEgcmVn
cmVzc2lvbiBpbiA3LjIuDQo+IA0KPiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgaXQncyBhIGZpeCBm
b3Igc29tZXRoaW5nIHRoYXQgd2FzIGFscmVhZHkgc2xvdyBpbiB0aGUgbGFzdA0KPiByZWxlYXNl
ICg3LjEpLCB0aGVuIGl0J3MgbGVzcyBsaWtlbHkgdG8gYmUgYWNjZXB0ZWQgZHVyaW5nIGZyZWV6
ZS4NCg0KVGhlIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cyBmYWxsIGludG8gdGhpcyBidWNrZXQu
DQoNCj4gDQo+IFRoZXNlIGFyZSBnZW5lcmFsIGd1aWRlbGluZXMgYW5kIG1haW50YWluZXJzIGhh
dmUgYSBzYXkgaW4gd2hhdCBnZXRzDQo+IG1lcmdlZC4gSW4gdGhpcyBjYXNlIEkgbG9va2VkIGF0
IHRoZSBwdWxsIHJlcXVlc3QgYW5kIEkgd2Fzbid0IHN1cmUgaWYgeW91IGhhZA0KPiBkZWNpZGVk
IGJhc2VkIG9uIHRoZXNlIGd1aWRlbGluZXMgb3Igbm90LiBJdCBoZWxwcyB3aGVuIGl0J3MgY2xl
YXIgZnJvbSB0aGUNCj4gY29tbWl0IG1lc3NhZ2UgKG9yIGZyb20gdGhlIGNvbW1pdCBkZXNjcmlw
dGlvbiBpbiBtb3JlIGludm9sdmVkIGNhc2VzKQ0KPiB0aGF0IHRoZSBjb21taXQgZml4ZXMgYSBi
dWcgb3IgaGFzIHNvbWUgb3RoZXIganVzdGlmaWNhdGlvbi4NCg0KSSdtIHRoZSBtYWludGFpbmVy
IGZvciB0aGUgZGlyZWN0b3JpZXMgdG91Y2hlZCBieSB0aGVzZSBwYXRjaGVzICh0YXJnZXQvaGV4
YWdvbiBhbmQgdGVzdHMvdGNnL2hleGFnb24pLCBidXQgSSdsbCBkZWZlciB5b3UgYXMgYSBtb3Jl
IHNlbmlvciBtYWludGFpbmVyIHRvIGRlY2lkZSBub3QgdG8gbWVyZ2UgaWYgaXQgaXMgdG9vIHJp
c2t5IGF0IHRoaXMgc3RhZ2UuDQoNClRheWxvcg0KIA0KDQo=

