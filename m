Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3568E145
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:33:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPThm-0006MF-5I; Tue, 07 Feb 2023 14:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pPThi-0006Kz-Vc
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:32:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pPThg-0000VS-DN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:32:34 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Iw53T005848; Tue, 7 Feb 2023 19:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=HhaGfKXOppyRyNi3jZeFxadepnZMcp7fwpD5y7VxrU8=;
 b=pQzPAepEKszB2Zv9lzMLEjVEHmNZleGymGBnuXO3N+K4TeinfbuJrkQRKSvMVFmmUuHW
 v8TXVEi3Cwhs6J2jmni052EKfVlOq0NGefFLHSZf/TSOsKM+J9gGUFGFOniqNA5Hndwa
 hhJNJIxHS4eHiV+pwnnT8jyfSxna3DxiiOBB0AY7GQsBEzOE4rU53o87rzHTkm+Ogx7p
 8MUvx5DRuAwZ/d9Ry4OQe70sPXpc1NMzDIPPGBpc9ZGX2P4fvSnz1qaiieCKWF4BpCGn
 8iCGXGD/W2OpW7ZMNNf3m/uZC5VUzeENbmrxastRKOxfc5f7mo/0tyofUvNIBoj8waGW 0w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkga2t076-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 19:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZQlObNKw77AEqqMhos/1Nclmapj2Nw1BGmNzDwJlkvgb6kSXO5WgDryEOdB9dCLVIvprLv0Lf49YrgR1sD2NN5IS/6e2UZP/xaJIB/vSBWEyUqrUhKWr6TEV3Lm3wnDAXxlu10DuOxiVF4+DH9VFtqfLJXCcbKExml1Y2tJI5Q9Py8NyMFm6rLZ5kXD+3kgCZmg0e18ndMfy7cPi1QvWB7XNd18Ajxdl/puPC+a4A0BoPlGOA2YP2pnw3BnvVIZtr2cVn2BP24su5U5qFc5c1vPu5i+oPUXSWV+jpVeKhx7qDUAZxCGRJErojPTMyDNCa3v/mqIvPsVeW5HCQ6E7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhaGfKXOppyRyNi3jZeFxadepnZMcp7fwpD5y7VxrU8=;
 b=cCf6RMbqN3gwn55OIAWOOtmnpMZvsQbDVCOMaol/gOIq0YBSgKaKp8RxPPQ/03nfIJ2envxwS+SOffPUWHYe+EhUu9CyKlS5QHtLYa8Kc0k4i0XQdooziu+zRFwvntKmTO2QJC16TiSjDrkGpPtBwt1zPFB9OIzRL2NWMEYKU1Cv5WGeRyva9X0Jchvv0Bv11NmhWkUogBZejD5OP1ZpW5VA/DtVUCSAA6l503IwFNp1OH0SuRaRlVg3PPLs5SyzbNTVwM57/zkdJAA72uVmjXRhiGm4nHNH60VMJGylu0W2FgtmFaarZqvj1uRovW7rpl+TW2nRFJdfQ4CpKu670g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by PH0PR02MB7335.namprd02.prod.outlook.com (2603:10b6:510:1b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 19:32:19 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3%4]) with mapi id 15.20.6064.031; Tue, 7 Feb 2023
 19:32:19 +0000
From: Sid Manning <sidneym@quicinc.com>
To: =?utf-8?B?SsO4cmdlbiBIYW5zZW4=?= <Jorgen.Hansen@wdc.com>, Richard
 Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Mark Burton <mburton@qti.qualcomm.com>, Brian Cain <bcain@quicinc.com>,
 Matheus Bernardino <mathbern@qti.qualcomm.com>, Ajay Joshi
 <Ajay.Joshi@wdc.com>
Subject: RE: [PATCH 1/1] accel/tcg: Allow the second page of an instruction to
 be MMIO
Thread-Topic: [PATCH 1/1] accel/tcg: Allow the second page of an instruction
 to be MMIO
Thread-Index: AQHZOmKRB4Ei+j2CH0+o6O8UNVPAm67DleMAgABK1vA=
Date: Tue, 7 Feb 2023 19:32:19 +0000
Message-ID: <BYAPR02MB55095C26855AB76C0DD6787CBEDB9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <20230206193809.1153124-1-richard.henderson@linaro.org>
 <20230206193809.1153124-2-richard.henderson@linaro.org>
 <6d68b400-7aad-d62b-1754-8d80960725b1@wdc.com>
In-Reply-To: <6d68b400-7aad-d62b-1754-8d80960725b1@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|PH0PR02MB7335:EE_
x-ms-office365-filtering-correlation-id: 8d27cc39-fdd3-4995-44cc-08db09420742
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tzruDUby3BMMiXHr5PORqEUjPn1uFT3LAxJSridAfXcuxtR7aKdLLZLO5Nqfs3QuIhBrpBRwkZFcu7EfJLmqJvqVCxSllwjT2ApHejJ0/CkUu14LrAPxOHS4AP6eLrFy91NKGi2BtJXcUK19oqy5NWnM8iXmcsNs/kFToW+N9WHLe0+tSBpz1e1qSyWrgsVsOwPJB+K+uPfIo05WjZl0CwjEQxDaH/XPTx5Squ1IODMTPMaCe1RCu0/WhsecNPBy5WjU/egSyxUxO/Fs2qQuKSszupMX72MeMogXdxvRdfgMXqott7Ym3oCb6ljRRKItWReX9/jvLz68ahMLeXxBAuiFuYrE/BnU6QHMwpm7LbdmqVZ9xwIEyg7vNwJlpHaQfOYkhKv1EUEZIALnr8rfkaY05D6uaX2S+QWzg8NSCXSHpa95Ek4f+zbG+RyztsiF2qcwG+Z9T1mnuNdXYEkePZQ/YQ84scO62yqOxJM9fgL/eb8v1qOAuDQ3gsrU4u2EBUFu0Q/CfSLr0GdmgEtdbHGAo6baPp46DkGphxIYwM7lP6aqjOeF0pZK+H1fyM9H8c+xl6FLO/fmR44Xw5LGIbqkPbR5kG/ZuRgn4BOzF/8CRpuD6/rHPgwu+cCStvkQTfTt3/hqyYhtPlpsMYH/lOft8Fq1U0lnyeCu585BGXRRibMPNJDqMnvL7RyUEK+OFhZwog6O+4eOkh3H3dtjww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(76116006)(66946007)(71200400001)(64756008)(66556008)(4326008)(66446008)(66476007)(316002)(54906003)(110136005)(8676002)(83380400001)(55016003)(66574015)(478600001)(7696005)(186003)(9686003)(26005)(53546011)(6506007)(52536014)(5660300002)(41300700001)(8936002)(2906002)(33656002)(38070700005)(86362001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUJjejRGOU9kTi9xUlRJdkVrWUZwSTlTdDdXT1A0NDQyMEY1MDIzYUliYkdM?=
 =?utf-8?B?K1ZxSDZWMDVGWjNlUnN2VUtPdEVqT0pCUHcvOXpaSjdsbHZnKzg3RXFkUGpS?=
 =?utf-8?B?ZCtjZ05lZzM3dEc5dGphK0I3RnhmUVZySnYyM3pQVCsxQjJSU05MVVRjR3FZ?=
 =?utf-8?B?TnV6d1dtak81TW5xVURMbVV4ZlNISkhHeTc3NkQxZ0dzclF2Z2VKWVpEblFR?=
 =?utf-8?B?R3gxamx0eStyUjk4TnQ2aDFGbUIvSGJEZ2ViRW9lN240Y1cyc1hZY3V1eElG?=
 =?utf-8?B?eGVlNGZLNUJseks0K0k1ck9XQkZ6VEdBKzkwLy9ZazNRWGVjQ2R6NG5ZbXli?=
 =?utf-8?B?NGxndFVhNEI3NjFuRnprR0pXbEZGM3lobnUxclZORTh0Tmtqa3VsTVFqN0xz?=
 =?utf-8?B?V25XcmtuYzVPejBSY00yOVBybnQwU2Z4TmxhSWdSakltR0hYYTlPRmFvb0k0?=
 =?utf-8?B?K0xkMUV2bnd4ejdLZWQya2RzbjMxOG1jN2N5ekNtb3UvMk4vb0EyM0Z4RUdy?=
 =?utf-8?B?Sm92NGNsK1R2bis4ZzdjanBialFjcUtsa29NUmMrN0hESkZhc01kMnVMWjRX?=
 =?utf-8?B?WlZLbGpxcnZNelpMM05oazdkVm44SmlhRGFtTVdtSTRzQUFQQzBPeVRDb2RM?=
 =?utf-8?B?d3lHVXVma0RvOEYySFNiWmpoSWR3QnV0ZTJBbi9sTVA3bkowR29DaFFncmhu?=
 =?utf-8?B?MmNQWlFDVDlkV2JvbTNJcHpSdENURWJpR3Faa0ViMGxFSmZJZWQ0Z045MVVQ?=
 =?utf-8?B?VnhvRHBtdVRlNHlucmJFeC80OVk4Z3NEMEs0b0tDNWlzNlVBSHB2YXBnMkZL?=
 =?utf-8?B?M2ZFMHV6YlhLb3dTUVpCQkpvV0drV1VIYXZBbGRiSGlrK2JjbHJ5RU9Jajh2?=
 =?utf-8?B?UXVJTlRxNk5WT3FzYTNBQ0lDUXNQUjZ0TUNjVHc3S2g1UHUwNEU0N3RqK1hQ?=
 =?utf-8?B?QjkrWTlIYlJNZDAyeGV6b1ZWWXVKd0xkeWphamNrQ3BWKy9GVU1qNkEwZ3pJ?=
 =?utf-8?B?bGx0NWUwYW1ub3F3NldGYnFNdkhrQWEzQitIUE1jbyt6Y1hPWUlHRXlXM2VK?=
 =?utf-8?B?NUo5K2Z3NUxQb00vd3lhVTRoQ2hkVHkwZmVXK3FCSThFbXJ4L2xzV3NHajVr?=
 =?utf-8?B?a3ArZ0pZUUEwNnBVR0dGM3pXTGFmVk1udEY1emFLRFJlTm02eVFLanNKOHp0?=
 =?utf-8?B?akdUaXc5QkNEcmdrT28wWGtzeHU2Y3VEUGpQVmRmbWpnaXg1a3NuN2tnd3BK?=
 =?utf-8?B?OUhwN2FXQjI3L1g3L0pQVmRiSWFhRXFLZlprRlVkdUVCd3BkY0V4Y2ZsUmcv?=
 =?utf-8?B?aHZyeFJOU1hXdXlpRGkwZEVrL29PM1RIZHFoYWt2bjd1ZTNOYjNiMWFjckkw?=
 =?utf-8?B?aC84WkpBWlZ0TlRxcHN3d2ZCTFVLaVNqRkE1aUs4UnRHd2xEbTBIYm9KelNj?=
 =?utf-8?B?ZHQydkRsR1BWNHpFWVB5SWJDdE5HZXRzREZUdCtaemtaMElCeUo5dmlUTXJo?=
 =?utf-8?B?QkpXOWdCTXVEd1R0WmNDblZHR0ZqS2hnME8xaU9wK0owQkJIbld1MVZVaU5k?=
 =?utf-8?B?dHFNSkdIZC93VzZDMUlkZGV1M0JJUXRtMktVbXRiamV4eEtOWTFOTUU5eW9D?=
 =?utf-8?B?eWNzK1NUdCtqUzltRngxYVk0K3lVNGF5d05ySk82TG05cndKL0s2MExUSHR2?=
 =?utf-8?B?SzI1Y0dFN1ZOb0xMbzhVbGxFVGYvT3F3RVdiTFRsQkE0RjhzRjRhMGNKcy9I?=
 =?utf-8?B?NU16TG9YWXhyMStuWGNNdlpPYVMrckZRaC9vV21qbWVEYVBHVG5CR0VWK1Zy?=
 =?utf-8?B?RHBwclgxLy96Y29DTCszVjVhc3RvWkJHeFpYTFhWV0Z1Yng0TTRZSmFXbXZK?=
 =?utf-8?B?ekQ4UDJERHdtV2RHZFhyU1QxWUtNdWxuT3YvSFZMeHdjQkV4WkRKc2pQS3FZ?=
 =?utf-8?B?bnQ2RzhGSzhPS3ZRNjJDN2NLVGprRDFrVHpSZDU2RnB6ZUFURTBWN1UrM0Q3?=
 =?utf-8?B?T040UmNKeWZ4K0s1bm0wR1pQOHRtNUR5THpldVMzdVhnb1hzUU50NGlvQWIw?=
 =?utf-8?B?dit6bThOQW1OMWZFNy9FRjVySk9Da0lyWm9INTgrVzJnblh0S1dtT29EaWhw?=
 =?utf-8?Q?DbZirkISCCAN3ZAv8vlMyVVnG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pzqDVi6EE7dWQVQAqxEwjl5h4p8kFOCekmAHduS9AX4f2RsavH41RhspcNbyt13LaF8db8BF32rIYdjOplCdEOXWZo7y6a3Ri9yVwKkpXv2mA51CcrSNlH7r0d87aA8xWSt1rMvkJLvw7v+1MW0lwgK/Sy6ZRDl04OejrgSwTRiF3yKaS5obD+qnqejqLQiJ5A2GAlKwBqmFJ5fYUTJPu9dMS/ZooYw9m/EkdxvGtpKp5zn4b375GtEH2fRoRFb5KwiAw9tzBg9zNf8yBh8vMmA9kJSbU/m0FLdG66pkcG5O3to+0SQeTNJXb7MUsHtsflQ1Z8VOxcrEtgAOSkWwYsung6/3ZyvBJgAyG6qvmy5MMhJDvjXgevmVxlOoBOWVu4JMzL/crHdgOtABHsUObHbc1Sww/dmvIYKg7izQ4encQ8X9mhc8pU3xLKNZl5VEkMiWVsGGhIslh5chWL/be3egUpvxe478JTQl1oC10tvuMBoLENVnmgZf5htF0Sl5rw9mA5x4+Si0mpDL+VBVE5Gv/02zBwuCi2eNvLnBy+uplsGitx1iDspebOnfg5Lw1Q4awJlrMaTByRP3VLKHva/YN32HZx56zdAfRt2JcfjPa++4B/cpWFqFEVkoqbIPaLrgprmQcs28Ow1R4HNCAMFGm7N8gLvSS2xivSfRnpG6l+xa98GjspE9tYjrLR649xjl+3QUAvxIETI7CHOGbkkcpLBGXuzd9n/OeLZUZZT8zoX1p+aYk33MJDY9XGSsIh5HDJfrkZ3BbTMlWzrhjCYWhY7jq2Yu9D6MCgfibfqam7iWPEebeGXBVhVmpgfN
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d27cc39-fdd3-4995-44cc-08db09420742
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 19:32:19.6707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTEFCNQsbrEhaJa9/WhFFzGvb3CB1fhpsaQkUVrViRqtThJdjAT89hRv3+WYC6x5+0KY+qdTDuaT6ZpaBPNZsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7335
X-Proofpoint-GUID: aCLZgMnpDXXiOPTvXemiHaYTt0z9po2g
X-Proofpoint-ORIG-GUID: aCLZgMnpDXXiOPTvXemiHaYTt0z9po2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxlogscore=658 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070172
Received-SPF: pass client-ip=205.220.168.131; envelope-from=sidneym@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSsO4cmdlbiBIYW5zZW4g
PEpvcmdlbi5IYW5zZW5Ad2RjLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgNywgMjAy
MyA5OjAzIEFNDQo+IFRvOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz47IHFlbXUtDQo+IGRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFNpZCBNYW5uaW5nIDxz
aWRuZXltQHF1aWNpbmMuY29tPjsgTWFyayBCdXJ0b24NCj4gPG1idXJ0b25AcXRpLnF1YWxjb21t
LmNvbT47IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsgTWF0aGV1cw0KPiBCZXJuYXJk
aW5vIDxtYXRoYmVybkBxdGkucXVhbGNvbW0uY29tPjsgQWpheSBKb3NoaQ0KPiA8QWpheS5Kb3No
aUB3ZGMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gYWNjZWwvdGNnOiBBbGxvdyB0
aGUgc2Vjb25kIHBhZ2Ugb2YgYW4gaW5zdHJ1Y3Rpb24gdG8NCj4gYmUgTU1JTw0KPiANCj4gV0FS
TklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxl
YXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVu
YWJsZSBtYWNyb3MuDQo+IA0KPiBPbiAyLzYvMjMgMjA6MzgsIFJpY2hhcmQgSGVuZGVyc29uIHdy
b3RlOg0KPiA+IElmIGFuIGluc3RydWN0aW9uIHN0cmFkZGxlcyBhIHBhZ2UgYm91bmRhcnksIGFu
ZCB0aGUgZmlyc3QgcGFnZSB3YXMNCj4gPiByYW0sIGJ1dCB0aGUgc2Vjb25kIHBhZ2Ugd2FzIE1N
SU8sIHdlIHdvdWxkIGFib3J0LiAgSGFuZGxlIHRoaXMgYXMgaWYNCj4gPiBib3RoIHBhZ2VzIGFy
ZSBNTUlPLCBieSBzZXR0aW5nIHRoZSByYW1fYWRkcl90IGZvciB0aGUgZmlyc3QgcGFnZSB0bw0K
PiA+IC0xLg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNp
bmMuY29tPg0KPiA+IFJlcG9ydGVkLWJ5OiBKw7hyZ2VuIEhhbnNlbiA8Sm9yZ2VuLkhhbnNlbkB3
ZGMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPg0KPiA+IC0tLQ0KPiA+ICAgYWNjZWwvdGNnL3RyYW5zbGF0b3Iu
YyB8IDEyICsrKysrKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYWNjZWwvdGNnL3RyYW5z
bGF0b3IuYyBiL2FjY2VsL3RjZy90cmFuc2xhdG9yLmMgaW5kZXgNCj4gPiBlZjUxOTNjNjdlLi4x
Y2Y0MDRjZWQwIDEwMDY0NA0KPiA+IC0tLSBhL2FjY2VsL3RjZy90cmFuc2xhdG9yLmMNCj4gPiAr
KysgYi9hY2NlbC90Y2cvdHJhbnNsYXRvci5jDQo+ID4gQEAgLTE3Niw4ICsxNzYsMTYgQEAgc3Rh
dGljIHZvaWQgKnRyYW5zbGF0b3JfYWNjZXNzKENQVUFyY2hTdGF0ZSAqZW52LA0KPiBEaXNhc0Nv
bnRleHRCYXNlICpkYiwNCj4gPiAgICAgICAgICAgaWYgKGhvc3QgPT0gTlVMTCkgew0KPiA+ICAg
ICAgICAgICAgICAgdGJfcGFnZV9hZGRyX3QgcGh5c19wYWdlID0NCj4gPiAgICAgICAgICAgICAg
ICAgICBnZXRfcGFnZV9hZGRyX2NvZGVfaG9zdHAoZW52LCBiYXNlLCAmZGItPmhvc3RfYWRkclsx
XSk7DQo+ID4gLSAgICAgICAgICAgIC8qIFdlIGNhbm5vdCBoYW5kbGUgTU1JTyBhcyBzZWNvbmQg
cGFnZS4gKi8NCj4gPiAtICAgICAgICAgICAgYXNzZXJ0KHBoeXNfcGFnZSAhPSAtMSk7DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgKiBJZiB0aGUgc2Vjb25k
IHBhZ2UgaXMgTU1JTywgdHJlYXQgYXMgaWYgdGhlIGZpcnN0IHBhZ2UNCj4gPiArICAgICAgICAg
ICAgICogd2FzIE1NSU8gYXMgd2VsbCwgc28gdGhhdCB3ZSBkbyBub3QgY2FjaGUgdGhlIFRCLg0K
PiA+ICsgICAgICAgICAgICAgKi8NCj4gPiArICAgICAgICAgICAgaWYgKHVubGlrZWx5KHBoeXNf
cGFnZSA9PSAtMSkpIHsNCj4gPiArICAgICAgICAgICAgICAgIHRiX3NldF9wYWdlX2FkZHIwKHRi
LCAtMSk7DQo+ID4gKyAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArICAgICAgICAg
ICAgfQ0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgIHRiX3NldF9wYWdlX2FkZHIxKHRiLCBwaHlz
X3BhZ2UpOw0KPiA+ICAgI2lmZGVmIENPTkZJR19VU0VSX09OTFkNCj4gPiAgICAgICAgICAgICAg
IHBhZ2VfcHJvdGVjdChlbmQpOw0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gDQo+IFRoYW5r
cyBhIGxvdCBmb3IgdGhlIHF1aWNrIHR1cm5hcm91bmQuIEkndmUgdmVyaWZpZWQgdGhhdCB0aGUg
cGF0Y2ggcmVzb2x2ZXMNCj4gdGhlIGlzc3VlIHdlIGV4cGVyaWVuY2VkLg0KDQpJIGFsc28gdmVy
aWZpZWQgdGhpcyBwYXRjaCBmaXhlZCBteSBpc3N1ZS4gIFRoYW5rcyENCg==

