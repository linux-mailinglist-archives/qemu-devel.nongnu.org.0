Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C832667D85E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 23:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLAiW-0003gu-LK; Thu, 26 Jan 2023 17:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pLAiQ-0003gO-Ga
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 17:27:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pLAiO-00064L-Aa
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 17:27:30 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QMPOXm003311; Thu, 26 Jan 2023 22:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=clDeRfWkT7VkXWe4NfPCXMax27eZ9pVk4831FmEROaY=;
 b=HiRpEASrpsu6clzPqGwlcIAIr6FnVrBh3EN+S7W9v9HV5BfLdtjca7F9fUKE4mdvUjCF
 d/E7OLi+jBdi1H1uAQisy4klvDIA7Qir6tDgwoKGsDEvdfHIf4uU2truouNX0OS/MFZd
 0YrjV5Q+8smL3/mUanEgFhWjXx1d//myYQuzJ4v1XeWmqEHVdiUTm9K+KZ/QTVMlEY43
 9aF8nJ2C9BO8WfQqYI2L3WlskSuxyyEQHi7+Zo4NemEjQdaHP7ZmxBVNYy4+L1mw9Iwz
 236PM75F/qDhlBXnlbg7cTm7aWwHVRuNEjLRx85l5EeNT1HIXpdp4iEgrrrFbGnKGPso uA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb5ynb58j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 22:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1BEeJDeyeMeC2YQOjnKT8gbrz+CQODFwc4JMopMCXVHY77tXOfv5/zflaGeLpIAQvYlv1Hhxd+CipKzXKrHLDdQOw24UpcerfsyLxjHNi5Nae87wF/nsL7F21nfy3kiwbzSrEsfzWBiIdN4CTFYc91Zzt2Mn0qMa443zhfOzPmOaVIOoF91nVrDcJPsBvt2jWi3rQOVaqQkUAxIy0vUz7IjKOgSH0PrEcCoNqUwaL0+drLE5O7mfZ5DfzaWxg3ZpuRfJlBwXFuB5LlrL78OUyfiEbjbpgqr4lxLZBECYoHhHmT+E8FY6DldMVfVXXdVsv66pYBuT+/b9qlLQt+iqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clDeRfWkT7VkXWe4NfPCXMax27eZ9pVk4831FmEROaY=;
 b=Ajm3i5EXEqTUs43uH2/u1yes+0mbt51d/XrO3c5UB2XTDvmvV3afh81aEHixUSGswJSv503QA7im9IIk94lRs6l5iW4YPAfFYbXaqxw1HtJ6wMdL5EQ1Ma1l9SGay9rxinJ5TJuZ3OQOg9TOayV7HMUZ4H8ArWZ0r582ATBAIJ28IOZ2k5ujORpeR1GDXm5MpvkTwE9/sjTPTkoQt/xTC5+Hdb0+Qlc10au+IV5osG+lf0Rshk+81RK7irXHOTkYS3v2F+dmob5IpOdLinWtPRTWUUeYXLxwlzouT7JEUl4Cf47u1jfrKfiYZJijZhITQeWRcGe7K6YRu2+h0AxQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by DM6PR02MB6905.namprd02.prod.outlook.com (2603:10b6:5:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 22:27:21 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 22:27:21 +0000
From: Sid Manning <sidneym@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, Mark Burton
 <mburton@qti.qualcomm.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: RE: ARM: ptw.c:S1_ptw_translate
Thread-Topic: ARM: ptw.c:S1_ptw_translate
Thread-Index: AdkgXLziuM3BStbISnGE/4d6gqc13AAa6raAACPXc6AD7G5WkAAxk4KAAADHTJA=
Date: Thu, 26 Jan 2023 22:27:21 +0000
Message-ID: <BYAPR02MB55097E4A9707464B736A9CC6BECF9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
 <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
 <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <22dbeec0-38e7-21d2-05d7-df60b15a2ff0@linaro.org>
In-Reply-To: <22dbeec0-38e7-21d2-05d7-df60b15a2ff0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|DM6PR02MB6905:EE_
x-ms-office365-filtering-correlation-id: c1e51bea-e7c2-4a25-acc6-08daffec7da9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0COOW8NAYpeg9kDNesmbeMwZQ+TWiBPx2iDCaZsRTOvtWM5JZUn4PsOljGKZa+Zse2WsQ2PlBzm9Pd9iHNJHalVclLFuVRa4i6eYmQBHB94w8L+IhkC46fvgR+PpSaE9FXlHj0fcSLwW7P4yjRcnUt9gFmdJ/JLemOrl5otFugGxeEWKYaEuTvF3WrhST0kHUoVvxAKW+kUsPXxhjuX6hwEWHVI5l8IaEggLOWwjWALQ9+N24B3ssK4221oDmPc4LfJV8fyx0ddUsgPmvlEetMI2jz+SoF2InTEtY2ONicSRSBszorI0ztFI6BYShoBXYQo8vLPNqT6/xK2zCQMk8TjHVEbDpUPrKBOZQdxOwncfzDT4XO9K4nGRfxTL+yLf0kaJX3/3/HMYWHMSOEKqOWEouGAPnjoeYwwc6b0igAQsNe/KjR3h7WcQi6UWxEYVsdt5JZWAxZrrd6rDRwz64YWh7bZrGO6bEyzXQM86K/5SVEI54U1fwpOod6P8JrCpkEG96dYvPTa+HBx3KYZeFZL9dtGCdZH8E1bT87ynoyKFuulBOCHXoBo5hkHDIxN9+NMLcrrCQSGz2dFjgegyS+b40KCafmc6YWv8czOpP+LsiTDACkr0Fh6Vd1lCdoYWgXBAIcIu9tgIVf5UCA5rxE6009gk1/4IMe4BCUTACwk7Xq6fGK2/7p84MjCLt09mBegZLEDq+dkEsiU6zFdc4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(41300700001)(8936002)(66574015)(52536014)(38100700002)(5660300002)(122000001)(2906002)(83380400001)(6506007)(53546011)(86362001)(186003)(26005)(478600001)(9686003)(7696005)(71200400001)(66556008)(64756008)(66476007)(38070700005)(66446008)(66946007)(4326008)(55016003)(76116006)(8676002)(110136005)(316002)(33656002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2tkcVQ3S1p3WkZHanRmejFVT0twbWFIWEVDNHdhd001alJoS3pQRDJlKzkv?=
 =?utf-8?B?VlhrM1I3SlhHdUVuRzBKZWRDVGlzdy9JRHFRWHdsVnNaak4rdmZUVWNBVkp5?=
 =?utf-8?B?aXk1V09vMkdYQUlXQzAwUzdSWFdkT3hHVEFJWStYV3V6WW44elAxd0xoMnZN?=
 =?utf-8?B?WnVlY1lNaTdzb0d6M1J0VnY3SFB3LzQzOEhyemt0d0ZrZElZakJySXRFbkp3?=
 =?utf-8?B?ZzVMV3hKcU5HNjVTNC9pM3VTNDhoL2xVTXMvaHBBSFIvN0NZa3QvVnVMdjhp?=
 =?utf-8?B?WXdyZlNMSEhCQ3V4R2d1OGQ5OGxxWU1ESEQrWVRJeEU5VG15V2w0MnY1QWVt?=
 =?utf-8?B?Mkx5Nmx4NzZoTTVGUUQvM05mOTBEYzVkYXNvNTJWQzE1WG80Z0MxWjRUb3Rs?=
 =?utf-8?B?NTFBWTdRWHQvV0xMWGZkaFpTVWRrOGcrNW1Pb0xxT0EyZE9ISWFmTzJiQWRV?=
 =?utf-8?B?aU9mU1A3bE01QjF2L3NjOFNjUGVMbEJLSk83QUduVXBNbjNoUjVlMmRxRm9C?=
 =?utf-8?B?S3JMcjdWZU1ob0FtRUV5TC8yYktOZ3VmRmdGWjZ6WDJIR2hXR1BjaFZCNGVx?=
 =?utf-8?B?TVlPMmR4bzYxa3pJL21PUEdvVzdaVTF5YWppWGtJMTV6SlplbSt1TWxQV1o1?=
 =?utf-8?B?eHhJdCtyMHF3R1R5YUhTYkIzL0JJZmx3cEsyb3ZwNmw0WDJsaWVHUzRYVTJq?=
 =?utf-8?B?OXRVTzRrMUt0elBVY25QK2t6SS9PL3hSMVRGSVZOSXcwVVNlNEdXSXJPS1pi?=
 =?utf-8?B?RE9zNjhQQ0NlMWxGZ1hyVHFaQVVKQTB3Q2pvNkZEaUR6aWhoT1poQWRSWGow?=
 =?utf-8?B?QjlMcjNBL2pvRTYyQ1ppUHRJY0toK280YzFQSExkOE9ac0hYZGJXUjRMejJx?=
 =?utf-8?B?ME9vQ2h3UGlBWmZwRUEvZGlRM2hHSkVZQVZhU29qcURMZi81ZThwditYY21D?=
 =?utf-8?B?S0J5MEwydG1sZjVqL0syRUJpc3pQZEFkZXVFc2NoQ3A5ek5rdUw4MlhOanhh?=
 =?utf-8?B?UW9qVXRxOGx1djJyVzNYcDhHZldFdXhRbVhFa0xtMWtsWHlOc2RsMnhzZnNj?=
 =?utf-8?B?dEt3dlNXOU12bFJBR0xxbmd5VTFFeTNRYzQ4OTh6ejJqSU5oVHZObFFQSVRs?=
 =?utf-8?B?czJXMkE3ek9RZGQxV09QYS9tNGdnb0NYWW5hSEtvam1xWDRWL203S1d5ajhk?=
 =?utf-8?B?d0FRQkxaa1R3Q2F1MUsxdjZ5bm43SXZHN2pycmlCdFJLOThBNSs3WElEMnow?=
 =?utf-8?B?UkI5L1dZa21meW1uY3djZWxIZGlwcXpkeUtPVW9lV1BHcEhiS1BHV0JWNHVK?=
 =?utf-8?B?eXpZUVdDR0FUazBBOForSkV2ZVZNYWVhaVpoSmdsVWxtTnl4VktSV0l2RVNI?=
 =?utf-8?B?cHlpK0Z1N1RQb2xLeXZ3WU4zRGx3aTdHaU5jdmpFc0UxbGNPUzdDRzFnM2N0?=
 =?utf-8?B?OUxrYmZoNDZSeXBpVTJxdEI4dE5FS0ZuRDBUb002NmJIVnlveVBhQ0RCQWdG?=
 =?utf-8?B?N3lLbnVkdzVzSGhtT2pLNXpKZGEreHNCSURLK3JXTTRlUmJZOC9EN2NmaDZt?=
 =?utf-8?B?T1FkQ3dyb1NXQUdMTW1VaW5aWFl3Z21lVUxaVnNYOENBbjNFSDdvRXNLcUJD?=
 =?utf-8?B?STlCcHNQQlJNVS9kODE2QWdnRmp0WGQ1UWsweXdnb3BpbllUeW9BOTJOWHlE?=
 =?utf-8?B?Qk02R2hnN1ZRb0ZxT3lZbENMTlZCTXFGRGJNZDRJZkVhUEVkSmNRQnBJMlNU?=
 =?utf-8?B?Zm00SnI0VDFncUFiaHVRWTJuS0EvRjFUSU0vLzBQSWdabGxKUDRNOWJ0MUND?=
 =?utf-8?B?eVplU0cxckpvdkx0ZWNvMnpYR0tTWTVvZ3huSm9Ubnk3bzJNK1FuSzhncWd1?=
 =?utf-8?B?am1TRlJzNlZJSjRkMkg4Z2NNazV6WEc1S2lQQ0FuK1RidkxxN00zT29lM1p5?=
 =?utf-8?B?TE40QWpTNmV0VVFQQ0RtRFlMTzd0Mkg3ejhMYlc5Zmg5K1Q1dGxoMVg2RHcz?=
 =?utf-8?B?STEwWkhZYm9YUXdHdkJRRklKZDdlVXZTdnFkTjN4TGdsUFJXU1VCVUczbk1M?=
 =?utf-8?B?UVBEaFhOdnZmcTJGM3JvTDdFRC9aazdzWjB5RW1YcXh3SzNENzhrY2k5aVBW?=
 =?utf-8?Q?vYZzg0uQC68tDEFmmcdYz4r7y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 4DZvOP7DE9qII1EoB4Iv/A/WcSEL/jbP0fsu3Pf6gjC54h2rnT5y4q4JYp3gJOuAqL+7oShzi2thmVjMPKwr7gnw1aUpTuKDpp+BcDitlsVulFm/J+iEGO5T40yfuvMcHR227p/iEvjW/TIz07tzub/q0ORIhhA8e/pghvdWbG2BRbam2/mcrrJaKLU9ZfsdZXsmPUqXNoMric6t9gLQL9LsDUkW8+Ko3OXDib8frR5MzbwxjNIBaucaq9TC1rBj6OdMr9Xz+4+yZsO+qtOYiSKHbujsi3Lzg60FFb/lrekup216JskNP7eo0e0bHEdMFpsV26u4pIUmTT1YMTaqXhybZ0Ac1A8gL/LZ2MyUHkcqIlC7jNsK5EKmaxcskMUkL4CCrtNcAIJhMpwS8XhN//zE40mtoUpEiMo8Xx0M26gtme04mSgUf08tSGMn/JiulBO90NEX1JuKymHu2gi4RV2fDHsCJWTGhNatM0s64URDvSWOIG7fM2mWl8VPijjCRYi+CCEaefenvoupzapDFHgsjhGjXUMUKSBVUQN+XM2/XJ6TvhuhbUTAGB2JY+iubNjwzcUWHhrHeqPRdaOJif07Zv9y51VHGM2eSa5eaNFCElBOTG1ElLLi0Rxt049/53oTeV4u7BHXGEdlo/UYlEjzZglWjbTYTCLT850o0NBgUApZn2kd8X1EOLZcR2Rc4yAc8ZrEx0CHul4cLsHsprx074MUC6e0kx7JNzKTF3SFB04a8TSYJMOjgJwao7oomo5KrG4cB4fqrInt/cbt8nUUtm5vxpznQhtCw3KwGis=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e51bea-e7c2-4a25-acc6-08daffec7da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 22:27:21.1514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEMM6h/k82gVLggdwtntdWRN4BsBLQewkWgqT688yOnVwieiD7k4Q43gCt1VTQKueKDiN8SJdU7kVyL37ZfcXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6905
X-Proofpoint-ORIG-GUID: tYcr5YBMs4GAjBCCL7RAG8MECNoC1ATt
X-Proofpoint-GUID: tYcr5YBMs4GAjBCCL7RAG8MECNoC1ATt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=583 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260210
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDI2LCAyMDIzIDM6NDggUE0NCj4gVG86IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgTWFy
ayBCdXJ0b24gPG1idXJ0b25AcXRpLnF1YWxjb21tLmNvbT47IEFsZXgNCj4gQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IEFSTTogcHR3LmM6UzFfcHR3X3Ry
YW5zbGF0ZQ0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lk
ZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1l
bnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBQbGVhc2UgdHJ5IHRoZSBmb2xs
b3dpbmcuICBJdCdzIGVzc2VudGlhbGx5IHRoZSBzYW1lIGJ1ZyBJIGhhZCBmb3IgbXRlLg0KPiBJ
J3ZlIGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGUgdGVzdGluZyBJIGRpZCB1bmRlciBMaW51eCB3aXRo
IHZpcnR1YWxpemF0aW9uPW9uIHdhcw0KPiBpbnN1ZmZpY2llbnQgLS0gdGhpcyBwYXRoIHdvbid0
IGJlIGV4ZXJjaXNlZCB3aXRob3V0IEtWTSB1bmRlciBUQ0cuDQo+IA0KPiANCj4gZGlmZiAtLWdp
dCBhL3RhcmdldC9hcm0vcHR3LmMgYi90YXJnZXQvYXJtL3B0dy5jIGluZGV4DQo+IDU3ZjM2MTVh
NjYuLjJiMTI1ZmZmNDQgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9hcm0vcHR3LmMNCj4gKysrIGIv
dGFyZ2V0L2FybS9wdHcuYw0KPiBAQCAtMjY2LDcgKzI2Niw3IEBAIHN0YXRpYyBib29sIFMxX3B0
d190cmFuc2xhdGUoQ1BVQVJNU3RhdGUgKmVudiwNCj4gUzFUcmFuc2xhdGUgKnB0dywNCj4gICAg
ICAgICAgIGlmICh1bmxpa2VseShmbGFncyAmIFRMQl9JTlZBTElEX01BU0spKSB7DQo+ICAgICAg
ICAgICAgICAgZ290byBmYWlsOw0KPiAgICAgICAgICAgfQ0KPiAtICAgICAgICBwdHctPm91dF9w
aHlzID0gZnVsbC0+cGh5c19hZGRyOw0KPiArICAgICAgICBwdHctPm91dF9waHlzID0gZnVsbC0+
cGh5c19hZGRyIHwgKGFkZHIgJiB+VEFSR0VUX1BBR0VfTUFTSyk7DQo+ICAgICAgICAgICBwdHct
Pm91dF9ydyA9IGZ1bGwtPnByb3QgJiBQQUdFX1dSSVRFOw0KPiAgICAgICAgICAgcHRlX2F0dHJz
ID0gZnVsbC0+cHRlX2F0dHJzOw0KPiAgICAgICAgICAgcHRlX3NlY3VyZSA9IGZ1bGwtPmF0dHJz
LnNlY3VyZTsNCj4gDQpUaGlzIGNoYW5nZSB3b3JrcyEgIFRoYW5rIHlvdSBmb3IgdGFraW5nIHRo
ZSB0aW1lIHRvIGxvb2sgaW50byBpdC4NCg0KPiANCj4gDQo+IHJ+DQo=

