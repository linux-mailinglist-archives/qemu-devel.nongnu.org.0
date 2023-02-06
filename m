Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536D368C068
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2km-0002AI-BJ; Mon, 06 Feb 2023 09:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pP2kQ-00028X-Nr
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:45:36 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pP2kO-0003OV-RU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:45:34 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316CX8I8016490; Mon, 6 Feb 2023 14:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=I/BxX5QTH6dbyDSTOvLUJKwpXquEU5hN7x+Y8NMu8Rw=;
 b=LSOsA6ybjwDcmzYeCg6MDyk+qzN/x4DWjVD63sBga/+7JBZfSqnkR+jRTGrD/aXFeiCc
 8EnmkaMGPO1ys2F9kaD2BSmyh5uVHQbpo5PZhvQE24YEwzS/b9kL/OFMmU46MbXKtACI
 J91ykWXkttuNZKaEqA3vOBgXwuF8F2PzbOlTMseiNTc9rsFDPpNxRDabPT+yjLwhN3A3
 WTAebDk1NU+pb2c7RbUbHQcGgSlRgiCBgCv83geK10ne2yVMaq5oIihg/YkzuDN1jaxP
 zv2JZRlw2rHKB4dzfd4MVXE0OCfRoG6LvY0bxvFIvYUKMj/YGPAV+LZvGZ8sgCzE53Uf 5A== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhcqxv39s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 14:45:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqSSBHRdYd98hkRpFZ95s3e9nfa3ZX8FL8nL06OmGHz1yk47yCg5rie3/GFpSMKE/414SPrdNC4iU3TXn0Hou7qsAHT5n1aa42m8ygS5avimXPoIJfnKOcAb1vA+aYMSzRdBiLxAFCdmm1iVN30kBvE5MddSo1WidYjbNAB25TKw4AM+MfUIxi/y7czijr+WcvFwNwXSXatC5+5yYu8ozU54tzXzSKlRHijzp6W4FLYVgOVInKemmdVk2dkZqM0xJbQQcaeZxLtK34uV/GmmdubsGIXZIabJpvRx7Xw1HaaGq1/zy3CqzIUKRbranQtW9ag6I0l9kzpJpG87BwrAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/BxX5QTH6dbyDSTOvLUJKwpXquEU5hN7x+Y8NMu8Rw=;
 b=KDv2bhp8PMQEoyy2y+wTjFKY8NRYJBLmu5BOveWGh4aptIqiWHJQjDgZlNP3TmO04YwlP7hVfFbsxpari3Qe88XFQoKRHxOv0XSiwc4EZzLod3KfzgEdQWlwpzUcZA0cybNyBT9Nq5xdO1g19+F9I7DjoHEmMU0pWwa2Arz41GnkTKspymoZntMcQWAfkTWcqCY2D0IvqUHxEv8bkMmTDGKmyCachH+oHbJKoO9ongmyqsX4Fa7eBwtlvHAkYSbFSZxCemP+th3NUXXXojvfDMqd2obq/oh6Y5sqaMDKYY1fTYx4HJyCJWg63GxR4MG3hcSSPFngk7G6Ihvndok0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by SA1PR02MB8622.namprd02.prod.outlook.com (2603:10b6:806:1fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:45:25 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3%4]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 14:45:25 +0000
From: Sid Manning <sidneym@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Mark Burton <mburton@qti.qualcomm.com>, Brian Cain <bcain@quicinc.com>,
 Matheus Bernardino <mathbern@qti.qualcomm.com>
Subject: RE: accel/tcg/translator.c question about translator_access
Thread-Topic: accel/tcg/translator.c question about translator_access
Thread-Index: Adk12mr35efZdwCASCS67YKvoZGk0gAJftuAAHk1q1A=
Date: Mon, 6 Feb 2023 14:45:25 +0000
Message-ID: <BYAPR02MB550900A29FE1EE136EBDF534BEDA9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <BYAPR02MB55094EC2D6BD8354B3313894BED19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <1d6b1894-9c45-2d70-abde-9c10c1b3b93f@linaro.org>
In-Reply-To: <1d6b1894-9c45-2d70-abde-9c10c1b3b93f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|SA1PR02MB8622:EE_
x-ms-office365-filtering-correlation-id: a5fd5e61-b869-42ab-fee1-08db0850c87b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcfvlpyxRKrpBdcf1lsnk0XaCrpLb5FZR/QeLvKTIJ7R/zqsOyOMqriFdIcFOax+CuLs/8uDkinzbGVwDBM2vziLozUv/X6kQ7/QRPPWRAakIISVNmXw7ADAd2QgsIkz0KgcEVei8Quu00tW8VI4qOa2zbxjHec98zoX4qjHR4IHXRv3USmQNJB7E6HXy5/R/3aPelCmPklLb82Hw6BRcxNKQKBNuACPXZLlpooWCfGRFBwvyjoQlj5WmZKQIaK670URuYrAs+UqcmI0mB8EvRlQxbHAJ/wAo+LDA2GmGH6P4dupCJNiXcIq/trMxRDZa6sSd9GuKfVLTzd7fEmAe4dUrcNEFhNI8PqMvxJEH0P4J/U3alUm0NIYbgXiiLGB3PnJk61yumtolYKWKRU0vGVreGtudq8Gz0/6W/oVAkRnWJ1sDpDCcPzjIeQB7M+K2rG0ifReX4/rStmFdWTKLF6Wi4iwvPU8h0QadMu54BVBfAQDRQIGNArgHvSjTQzrLPOg2+LLHkUDEHtx7nhLR7jRsuifEES9UEz/dqZrNwSg/ZS2ePh1AQYH/ZQfsCkd0gzsjxxf1NCW7Z8aFPX0Gus5ilIbGkxddqkTdPlKmAElRfrLNKzD5GEaa8ta7Mqf0EB1IrvQC31EAsWDUK4Em+/lT4v2EXGOLuSop1YdZ2adCcfuuSXc9CiPtQVedyNMBrsu98OQze35LLk/THMhxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(38070700005)(478600001)(122000001)(38100700002)(33656002)(186003)(6506007)(107886003)(26005)(53546011)(9686003)(86362001)(4326008)(76116006)(66946007)(66556008)(83380400001)(8676002)(66476007)(64756008)(110136005)(316002)(54906003)(7696005)(2906002)(66446008)(5660300002)(8936002)(52536014)(71200400001)(55016003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFpqVUhSa0RUYUp4UFU3TUpnNnZIeVpkMjA3bjIvS3ZvZEV1V1J6cjd5RVI5?=
 =?utf-8?B?dWxNTFNuYThvZ0crQlRuOHZ1ZUdCUVA0M2QyNU8wK2xRTFpBMTR1MkQyVzlY?=
 =?utf-8?B?Wk1TWC91OU55cVphQjRaZjBvZ0EzdEE2bGFnT0RGTVpBV1ZEcDlYbXFQN2RJ?=
 =?utf-8?B?aTBSR2M0c1VIUjZoekRjWWoyaEg5cDZxSkpBZ0tmNmJDcGx0a0JjNkxQVVg4?=
 =?utf-8?B?UlVjay9VeHFTR1J3TDFHVW11YlRaNTBiVFBCUEoyN0djUzRqSHNKR0MzeHd2?=
 =?utf-8?B?eWRpRmYxaWc1TEdMRUhQeTVoeEE1S1hFUmZKVENHUUNXSEtzSklSeXRIT2lk?=
 =?utf-8?B?UDFyZlI5ODZZWlBqbnE0MkZBb0ovVXoyQlNLWEx1bThPRXlmMXNaWEVqVTZD?=
 =?utf-8?B?NCtPUWZFSmQ5SnJ5SjFZR2x2R2NOMVhYT0xFL0Z4Q0NTRmVGT0x6SVRoK2d1?=
 =?utf-8?B?U3hocmJxczc0d2R1RzFDTWtoRHYya1Q2WSthSUN1RGNjZUttUVVobHArcnJ2?=
 =?utf-8?B?dnJoME4zOENCMW1CQy94WTY1R0Rpc2ZuSVRET3diQnZnRlBwN0xkVENYRmJE?=
 =?utf-8?B?WDZMZXFZZTZRWGFvelpGTWRYbDNDK3AwT3lJb1JHT09FVnMvSitoV2gzdEI1?=
 =?utf-8?B?MDROd1pTYUJDSS93MUZvVm45cnJpUG9MK2gzNDdtYStwY1VEc3ZKOEN4UjN1?=
 =?utf-8?B?Q25udGJkTHlXN2JjdFZ6bkxjUUpWeFNXVDJ5QjM2dDI2bndLN0JlL1JpYzBr?=
 =?utf-8?B?SXlkeHhHMm9wNytrOU50b2ZYVVNYK3gzUk8wVzIwQmtPREVwTVlhd3N0dExz?=
 =?utf-8?B?VkFaMHFnWVM2OWw1SWxraTR6U2syRjJiSHFwbUNFNHYzUGRzWm5YWWY1S2Nx?=
 =?utf-8?B?MTNUcWtDTGgwK3JxKzRRcytrbmRrMXJRaHRBd2F4YWxQSG40VUczQ1hDcFVa?=
 =?utf-8?B?cDBRZDQ4ak4rTm9iU2daSjlGMmtMalNsQWFXSVRGSVZPeHZqKzdYM29oTmFN?=
 =?utf-8?B?ak45KzQ1V0tPREtqR24zWDU2RXRuRmV4NGFRdHFJc3pxWnZtUU51ZVh0TTBZ?=
 =?utf-8?B?eXFuS2lxODVZU2J1TVZyb09KbWNUaGRlZnY4NWNlNFB1VnJkclU3OWJtV3NP?=
 =?utf-8?B?dFphMWk0bGhZNld5OEM0VExuRHVwZTc3TGhqSVNUWTV5azYrMjBPaHBCTTNM?=
 =?utf-8?B?WEFtL2t3ekV2ZVNQRHVQb1pZL0Nyak1KcU9zYUhFclk0WHBpTERMRDVMUGNl?=
 =?utf-8?B?YXFhR0RhQlIzcVNObkljYVlkKzBCcTl5enROTFp5YlM4T3hvbjUyb0xpUjJi?=
 =?utf-8?B?NVcwS1F6dVJqb2pEdjhQc3UvRVlZVkdiQmducXdLRDFlVzRxaHB3RlpuSmxy?=
 =?utf-8?B?N3lBVTQyNWV5YXBKMUUvV04yNFh2L2I4QmVOQVFhT0pmZ1ZsSzZMK1VhaEIz?=
 =?utf-8?B?b2ZRSzVIZzl0K1l6eW1zTXhPQ3dTSHdmU3RsTzJ5M3YrL3Z0WjVUeTBEMGJt?=
 =?utf-8?B?VDhHdTJsenBmRkZqcWt6TnkzNUwwL2ZvT05EeWNoOEI3anBmY2hNcTNkTkRt?=
 =?utf-8?B?UWhIWEtJOUY4RzF5ZEsxZTNUTXdrVkxnRG53elZBdjNHN2FyVEh5ek5iWU1n?=
 =?utf-8?B?dExUandzd2EzUHpBMFBKakdvMy85dEpnQVhmV2RTMzVNN2Uxb3p0MUw0Rktt?=
 =?utf-8?B?L3Vzbk9ibklTRTdzRml3UUx5QzU2YU5WUUtoMTgvNFNEV2xsL25kYmZmQXpz?=
 =?utf-8?B?aFA1Y0FRdEJpTG03cEdmTlY0Y1NPVEg3alBWYXBaTmtpd2NoTm9PSU5KYkhV?=
 =?utf-8?B?RTlORTg2c2NHdFRGN3paeEorM2d0VlorQXdKUlQ2ZEFGSThKVXpnVEI3SnZO?=
 =?utf-8?B?WnJsdXZoRnFqRGMraWtTK3VKMlVyOHNuR2ZqOWlmYjBhM0tOSVIxQ0xCKytr?=
 =?utf-8?B?b1ZtcUo5b1BSTnhWZ0NsT1FaQVRRMmhTN0NxWUdIcm9hVjgrUVQxaTlvOUxV?=
 =?utf-8?B?TlpmOEM1eU4wZHVjMTZJRmFYVjFsWVkzY1dJUnRuU1pnZnJkU3NaTmlOR1Ns?=
 =?utf-8?B?L2RnUDRUTkJYVTY4KzVwclRYY0t4UFR0S3M1ejY3ZllZc05IcEx6eGpoMGpR?=
 =?utf-8?Q?KhzxjfjdovwiONG4XRy9xJVvB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nsLBuh9w01jXW1ZcWKfpWhqD6s1+RyrFDnmF6OYUcTp0Sa+nNbIvQG5wBNx0YAtCePix1lMcSjuUcolY0GHeHhEI9+c71/Fs3Z9TLCPTt21WeyrldJ0tp6rNiOxpZzYxXgcebLtD1pRnqo3MwnJocvlmvxkgx7akiWBKFG3lYAvF7V+YOFcoMsCKaJzKZADDUKg3hB3vs+JlAxB2ztTMhwvKyzhJCc6JyPgkfKkJ/OOJwnHW7Se6jbVPvLBe5tm5BUb33sBm1n9QKIHg/mwbvuixwV+XVFCf8Sn2njEpbzbPMif+OPS0yBiVUC6B0DuwQaT/jEq7xiGd0Po+Nj4pq+O3iq6qzDaGKF5mo6T7WwOHVvFogjpEjiltICQDzM2Vv+IAvapNHM6slc3u2SjMPWfXY2hx/rXndxaj+gRdyh76QVux8jC5GIxw+bESGmIjwteQ7wOVzLHpZosmzRG29YZbTfaiSipk+ZJzdyjp5Q36vOMFBJ8PQdd6RuqOYK36VdGqMY5QPuY6O7pqHm0pet426M/9dNQLOTcEMLtujQfG/QuI3+GFa0OVWEvL8ymmwjN4AmGf+dszDDUioFCg7TIYBTJx0PGTlu3cVkhMnRk8SNYavPrWbcZw5ZE3UgRs6urDGEUOCN6hTImlPWfQB2YV8Q/jnL2rgKMekiiTVogS2w8xSfEIxGPzdNK6xf+Yj9+3a9+cNJjST2EBRr9dV7CDmNdse4JjyZOzwP1mQYtmkeaaYPI53BEYgZJ4JSmkWPX/VJFdGjsjewSH8vhwXEYDTlzxxHbzFus8xUq/QLA=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fd5e61-b869-42ab-fee1-08db0850c87b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 14:45:25.6876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJG5oCKDYYcclpbP8ltfFTpX/58RykZAjPlIRWMxSdc68n3c9ykyXdn/gh6qY1Lx694nFscBu4ez/aFn8ts1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8622
X-Proofpoint-ORIG-GUID: 1tAuB49_V_9xuAa1aSXIofLV2FDo40yW
X-Proofpoint-GUID: 1tAuB49_V_9xuAa1aSXIofLV2FDo40yW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=646 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060126
Received-SPF: pass client-ip=205.220.180.131; envelope-from=sidneym@quicinc.com;
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVh
cnkgMzEsIDIwMjMgMTE6NDYgUE0NCj4gVG86IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBNYXJrIEJ1cnRvbiA8bWJ1cnRvbkBx
dGkucXVhbGNvbW0uY29tPjsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+OyBNYXRo
ZXVzIEJlcm5hcmRpbm8NCj4gPG1hdGhiZXJuQHF0aS5xdWFsY29tbS5jb20+DQo+IFN1YmplY3Q6
IFJlOiBhY2NlbC90Y2cvdHJhbnNsYXRvci5jIHF1ZXN0aW9uIGFib3V0IHRyYW5zbGF0b3JfYWNj
ZXNzDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMs
IGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IE9uIDEvMzEvMjMgMTc6MDYsIFNpZCBN
YW5uaW5nIHdyb3RlOg0KPiA+IFRoZXJlIGlzIGFuIGFzc2VydCBpbiB0cmFuc2xhdG9yX2FjY2Vz
cyB0aGF0IEkgaGl0IHdoaWxlIHJ1bm5pbmcgb24gYQ0KPiA+IHZlcnNpb24gb2YgUUVNVSBpbnRl
Z3JhdGVkIGludG8gYSBWaXJ0dWFsIFBsYXRmb3JtLg0KPiA+DQo+ID4gU2luY2UgdGhpcyBmdW5j
dGlvbiBjYW4gcmV0dXJuIG51bGwgYW55d2F5IEkgdHJpZWQgdGhlIGZvbGxvd2luZyBleHBlcmlt
ZW50Og0KPiAuLi4NCj4gPiAtICAgICAgICAgICAgYXNzZXJ0KHBoeXNfcGFnZSAhPSAtMSk7DQo+
ID4gKyAgICAgICAgICAgIGlmKHBoeXNfcGFnZSA9PSAtMSkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gLi4uDQo+ID4gd2hpY2ggYXZv
aWRlZCB0aGUgaXNzdWUgYW5kIHRoZSB0ZXN0IHJhbiB0byBjb21wbGV0aW9uLiAgV2hhdCBpcyB0
aGlzIGFzc2VydA0KPiB0cnlpbmcgdG8gY2F0Y2g/DQo+IA0KPiANCj4gT25lIGhhbGYgb2YgdGhl
IGluc3RydWN0aW9uIGluIHJhbSBhbmQgdGhlIG90aGVyIGhhbGYgb2YgdGhlIGluc3RydWN0aW9u
IGluDQo+IG1taW8uDQo+IA0KPiBJZiB0aGUgZW50aXJlIGluc3RydWN0aW9uIGlzIGluIG1taW8s
IHRoZW4gd2UgY29ycmVjdGx5IHRyYW5zbGF0ZSwgYnV0IGRvIG5vdA0KPiBjYWNoZSB0aGUgcmVz
dWx0IChzaW5jZSB0aGUgaW8gY2FuIHByb2R1Y2UgZGlmZmVyZW50IHJlc3VsdHMgb24gZXZlcnkg
YWNjZXNzKS4NCj4gQnV0IGlmIHdlIGhhdmUgc3RhcnRlZCBjYWNoaW5nIHRoZSByZXN1bHQsIGJl
Y2F1c2Ugd2Ugc3RhcnQgaW4gcmFtLCB0aGVuIHdlDQo+IHdpbGwgaW5jb3JyZWN0bHkgY2FjaGUg
dGhlIG1taW8gYWNjZXNzLg0KPiANCj4gVGhpcyByZWFsbHkgc2hvdWxkIG5ldmVyIGhhcHBlbi4g
IEhvdyBkaWQgaXQgb2NjdXI/DQoNClRoaXMgbWlnaHQgYmUgYSBzeW5jaHJvbml6YXRpb24gcHJv
YmxlbSB3aXRoIFN5c3RlbS1DLCBhIHBhY2tldCBpcyBzdHJhZGRsaW5nIGEgcGFnZSBib3VuZGFy
eS4gIFNvZnR3YXJlIHJ1bm5pbmcgb24gdGhlIEFSTSBpcyBkaXNwYXRjaGluZyBjb2RlIHRvIHJ1
biBvbiB0aGUgRFNQLiAgSSBoYXZlIG9ubHkgc2VlbiB0aGlzIHdoZW4gdGhlIGNvcmVzIGFyZSBp
bnRlcmFjdGluZyBpbiB0aGlzIHdheS4NCg0KUFM6IFNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXNw
b25zZSwgSSB3YXMgdW5leHBlY3RlZGx5IG91dCBvZiB0aGUgb2ZmaWNlIGxhc3Qgd2VlayBkdWUg
dG8gYW4gaWNlIHN0b3JtIGFuZCBwb3dlciBvdXRhZ2UuDQoNCj4gDQo+IA0KPiByfg0K

