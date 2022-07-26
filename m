Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF4581958
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:06:54 +0200 (CEST)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOxJ-0001D0-4G
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oGOrB-0003yO-9t
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:00:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:47596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oGOr4-0006WF-KX
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:00:32 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QCe7C6028292;
 Tue, 26 Jul 2022 18:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=tlg8Nr/U3V/tp4WuNrva6OrxncWhXmBjbppi3SfGkjo=;
 b=FX50CL2+W48T7r3pZ0HWjT6FNU3EpUZE5rxaIzqHfh/FBzyEVBVKAsrcwiibLCiiZeYk
 m6b7XDGr3EnEPc767gqmTSeUxgcMFHK/IZHGT1JJhC8WOXVkYjgxzAnZ6WqM51XGejYR
 a0/lNiTlFr12ov5SVouXZWfCI5ALY3/JM6r/3tUwvtc3cbZVQbDB9LebS9digJ2ER/GY
 BIoDS7yxbExRjMW1qEW+zDKLwXicjoOd9Z4cOF8EYaPZOfXIfCKahwQRtYsGwJn0P3oI
 /4i6KOEyMGubtMZ+wuF5RTwouFBE2ivu+P78L26QE7P52bhGePvmrIThlhs5ejtdTGA1 9w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hhuvkbf3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 18:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZXoI2lWHttViEU+vQGj72ogxpxPPhyPZI7Ki7UQouDqtodmHHWIykZHqSJog0uiQseMhbM6wkX/bUYKP8XESTn1qRHswcY4h+JS1ze9q1mRiMKeO7O/zUwEli5gBe0heJsSlEgxWCgKwK7TBYD4Xknsa4B9Xg+c7cnZPzK8de/4TwWCezj8uZGhrXd7c4XKfhG9ZRpigR65pXDiQjo1bGM04Cyfjc2a81rQGKJc1uKW/gLqKur6fSMUb6XkjStVP23i2bikuL+QrvB9gYc9JCkxDoCYgiEsCcdndlk/y25Z0/RXKVbVNpGTS7MkZ1qQWkh2oRmZHKysmb4Sk5Ahmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlg8Nr/U3V/tp4WuNrva6OrxncWhXmBjbppi3SfGkjo=;
 b=K7mSuVFVUSDf0pCpYUxfq0RUwkvl4AM5y4C72ynwKHAe0fkAdEO7nVFbbnqcyyVxashyr4kz9iIl0eV3XIUXZOxLxpPuXpkEg88hpDcSi6oKNsPH7WNxsnUPlwaZyck1f+auyTa3RYP+mFB5OpLdTXgpmWe1A+j1px+7JzSLl7m2RId83OnXvOh7fjUGMuf6nW3bBlGx6gxGR4rsAI/PcMj3o4zHwx5Oput03/NniQhPt23EB6s2wt73d/MT+y3md4gpXQrEym9T4C+8UOSvU0Mj+O/ZLp42W+gBDyZlJgTIQ4W1F7c4qQ2Sxo99tLEplImsjOawNPp0EPwAV7t/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com (20.183.98.108) by
 CY4PR02MB2552.namprd02.prod.outlook.com (10.173.42.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.23; Tue, 26 Jul 2022 18:00:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 18:00:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: RE: hexagon docker test failure
Thread-Topic: hexagon docker test failure
Thread-Index: AQHYoQ6Qz9fI2hkxuUiIQ0meshai/a2Q2/4wgAAP6wCAAALUwA==
Date: Tue, 26 Jul 2022 18:00:15 +0000
Message-ID: <SN4PR0201MB88082B3DC160E3D4F40729B9DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
 <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
In-Reply-To: <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07a7c8bf-4e66-4dcf-5ae3-08da6f30b172
x-ms-traffictypediagnostic: CY4PR02MB2552:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5+yVkUfHxL+4fEISNZiLN6a4782eliojpp5kszObGCim3oE8uyphnMQB0QwooclYW54+DoV5Ji/yUYtCNoC/hEe1EE/LmF4vZrFwDx+lkf07jZAA5j7LNowyxkHP3mLtd2jMLIOm58Jif4xAoAzT/yeO58Mnb9jWT9LAQ0YpNteDAqsJm+UyK0A4yAYSOOtDeZd8Z9gF7zdQx1QL2GxGFjrDbeEN89pjnTTtgSRJ/EejZsVWX5rEKMn5Rnf3uiE0UZjqBmMJNxxtAGj/piDhtXCGXsJYFjNrvhrs9Yi7YnB1+b342T1waV/JjfPOFQ13l3hJDxXbInAwMcq/C/Zw7NzTGjOpi7LQ8eSc+Y/XQsQdTq9S6jyU76P0H6Gp2sILjTK94SEbgSUCO0hVPt1WNZeoGS5URno1wK95q4A+60+OrIkl3UfLn3m1Pv2xD7+lEL9KOGKAoFvzRxpx4hjLW6/SH5IZVN5d1sBFeWx6NZgNaKPoJaASISI4DiMyYXMkdVbmZYQYlZrXvVPXAc4NtNdhe5EFTI48+gjjPtzTR8V6u0f+ENOqL3otE+A3BGFBAOUKqxjEv3hvKcvpizUlY06T6FsG7hhsYZjYm0QqiSH+0CQnqORRKkkyEjtHVcOaajCrUYyC0K1mwXOWgth5QFIcTi1mnqJZjmSSGhpIwmfMao5WvbC4FY5xOGn3U+RmDyAct8sCkQWLHxOqG8NlmW7LIRaoQN1sptU9OZfGOraJCNDdbKlWe7gA18sy/+mPgs/azZtjDFOthtsG6/u9RIm29pzRPt09czyJJnUGFnycYYEaK9M6Y702VZtKvah2L8Cx6D5YGeiwwzw82g7LA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(6506007)(26005)(83380400001)(41300700001)(478600001)(966005)(71200400001)(53546011)(6916009)(122000001)(316002)(186003)(38100700002)(76116006)(8676002)(64756008)(66446008)(33656002)(55016003)(66476007)(66946007)(4326008)(66556008)(8936002)(52536014)(5660300002)(7696005)(9686003)(3480700007)(86362001)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1JkeGZybUJEWHFPWXZ5SWpDR1BHZEE1TmZXYTJzc3NXUUlLampnUW45SGNz?=
 =?utf-8?B?WFpKU0Y3Q1R1RkhGWGVCYk5lbkFWaml3RHl3djhYbmIxeEpFSlRUT3dDN1Ji?=
 =?utf-8?B?S2dDVUhTOTVuSzF0UEFvaXJYSnhXZStMSHFiTmQ4Ti9HREF0QitJbTBXRlNk?=
 =?utf-8?B?U0hiamFHVXhTWUZuNFRDYjNnUlVFQzBxS2N2czBWSW1iL2RrWFhCVFMxSFNS?=
 =?utf-8?B?MlNtZ281WkdKVUFCa0ZITHZVaHJrMzdmS3d3dm1FcWl2NVMvdTJhWXoxcDR4?=
 =?utf-8?B?ZkpRMWVNM0o2N1BkczlMSVZjdG1GSWd2ZDAyUDFNT1Q2RnUwYS9ablpOZGIx?=
 =?utf-8?B?SEZFcmhWaUNsazUvNHBuNlFadGo2eW1lSWlIZlZrMitxaVhpMU00Vm1ZaHNk?=
 =?utf-8?B?TlA2akhqV2dLeG5pMDgrbUNRMEN0Uzloekk1M1JjVkdOU2NzOEhSWUdFd1Jx?=
 =?utf-8?B?ZEtvU1pYdm1rcnd6RExRN3pVU1BScCtCTEVURks5aStETWNCQ05LZDJ6cGJp?=
 =?utf-8?B?dURSK2dPR1hLWEtwT1pESlRQeWpyeFl1QWVIT0k1OUZ0VFBYNkUvR1lBZkpM?=
 =?utf-8?B?cVMrcGpUU09hVnJiYlNqbmg4R3NVamNMZ0h2QmdXQ3RGeG96ekFRaTJoUlJ0?=
 =?utf-8?B?TFdNbkJDMW1uMmVKNlVTUlRwS2U4cEs5aGtraG9iempGT3pibkFUUFM3Q0Q5?=
 =?utf-8?B?TE5GNjl3TE95NDgwRERveHp0WStrcFNUSXZsWVFVQXJoYTIvVHdybS93Y1V1?=
 =?utf-8?B?dWw0ZW5YOVhPLytNZkFuS2ZteEgvQXNpMlVSVE5LVFpSTENzcU0xZ2JxRVhS?=
 =?utf-8?B?L1RxaGV6ckttb0xVeUlwT2NHWnhNN1JLZnljczh1enh6OTZQRVlBN2RpRFBC?=
 =?utf-8?B?M0UxOGJWbnhJcUNWcmVGT3o4dy8wb3E0VUFkSk5jTjFIbThEVWVoWUR3WUMx?=
 =?utf-8?B?MjRKNjlHYmUyV2UydTl4M1k0SDF3b29VVndkcE5HY1FoNHNxVmNhWHV5QVNJ?=
 =?utf-8?B?d1lnb3dwY3FKbHozMzc1c3BDZTBpV3J2SlpIOTNUTzE5UWRNY29obFZEKzhZ?=
 =?utf-8?B?a2F4WENOWVBpZ2Jkcm82aUxPcGlJQjZGMkhHcWtaeUkzVHJTR1gzeXAzeTRW?=
 =?utf-8?B?MlpOUElxTzB3ck1LM3ZZNks4WUVHelRhVWMrVUtCcmUyc3hVWVVhMDZtL082?=
 =?utf-8?B?L3hPelg3bUFoVVZIQ2pKcXVkNXM2THRuRTUzeUtFbERvcEswWkx0blpSM0p0?=
 =?utf-8?B?bVdROXNSQzVjdVBoMjZQNEgvV0F4bkdIZmdJOHV6cmg0SXI5MFJKZFd6TFl3?=
 =?utf-8?B?RTkxTktmenpPMjYrNTJMUGlrb0kzdXZjakxyb1NvTVlqRHhyZGZtQWVSRnNi?=
 =?utf-8?B?VEJPRkJ6aGIzeGRkZDVDYjU5Ni9UaHBUOTBhMVk2SVRYRnd6YmlPc1IxQXRn?=
 =?utf-8?B?c0hTVnAwRjg1eUI1Z3ZZSnlXL1VtNXVFM2k1WWpwd0xoZnVJT3Z3ZzVZeGNZ?=
 =?utf-8?B?N2JLcG1RVFo3RzRud2l3ZnFLeG1oeTRBc3ZpM096Z1h5ZG5OYTVib1JHSVNE?=
 =?utf-8?B?Z25iNmdMQk42S0F5clJBZFIrV1crL2ljQThQVzdGNVJrZ05oRHBKMlFydlJB?=
 =?utf-8?B?U0tjOXJrRVNlVndHVi9HbkUwQ0R1WkRVUnVqYk1EY21TRm1GTzFPQituWlJu?=
 =?utf-8?B?VExTdktic1VMSEV2OGhIQVQzeEdKby92ZlpYa3g5UjgzVkZYNlBCWGs5SERI?=
 =?utf-8?B?VklIMU5KSnNqdkFTdFJLb3JVNHBSS0lndy9BQ01rT1hxRHRxd1ZhZEQ1d3Jy?=
 =?utf-8?B?MjFTbFgvcnArWEdXZE1ZTFpPd01vY09jaVI2L0drdFhvblNGanpXWHRPeFVh?=
 =?utf-8?B?c2xlYVJWL0VIc09ZdnQrcU9EK292aE1lRTRZTzNXamdpM1gxME1vN1NhdDdD?=
 =?utf-8?B?MFByZitQVlVoVk5lMlJLQ3hZOUE1cjdFZnM1R2NqQjkvWDk5SHcvZ2JCZzkr?=
 =?utf-8?B?V040NWwyWFN5NnpjVzZpamRvV1Jpd21yZTdNcmRVeGE5Ylc5R1hpaUtaTXpJ?=
 =?utf-8?B?eDNFdGVSbVlnVEk4V292UEtFMWdFWU1hQktzQmFWNVlBRUdudlVPVkkvNGFY?=
 =?utf-8?Q?gqbH6DeF9WXLh/DH0gFTbgiZL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a7c8bf-4e66-4dcf-5ae3-08da6f30b172
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 18:00:15.2365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q76GTi3SZtNwLHh3Xa0i7N5Byl0iZdDNGJvmy1m9xVONneDTrwKpks25zIkU88yzr3Yw/PE1czM72oxdcbTGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2552
X-Proofpoint-GUID: ZqM21WPBpXUaTBerP3EAxX1gV71v28JT
X-Proofpoint-ORIG-GUID: ZqM21WPBpXUaTBerP3EAxX1gV71v28JT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkg
MjYsIDIwMjIgMTE6NDIgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3ViamVj
dDogUmU6IGhleGFnb24gZG9ja2VyIHRlc3QgZmFpbHVyZQ0KPiANCj4gT24gNy8yNi8yMiAxMDoy
MywgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjYsIDIwMjIgMTA6NDEgQU0NCj4g
Pj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPj4gQ2M6IHFl
bXUtZGV2ZWwgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gPj4gU3ViamVjdDogaGV4YWdvbiBk
b2NrZXIgdGVzdCBmYWlsdXJlDQo+ID4+DQo+ID4+IEhpIFRheWxvciwNCj4gPj4NCj4gPj4gT25l
IG9mIHlvdXIgcmVjZW50IGhleGFnb24gdGVzdHN1aXRlIGNoYW5nZXMgaXMgaW5jb21wYXRpYmxl
IHdpdGggdGhlDQo+ID4+IGRvY2tlciBpbWFnZSB0aGF0IHdlJ3JlIHVzaW5nOg0KPiA+Pg0KPiA+
PiB0ZXN0cy90Y2cvaGV4YWdvbi9tdWx0aV9yZXN1bHQuYzo3OToxNjogZXJyb3I6IGludmFsaWQg
aW5zdHJ1Y3Rpb24NCj4gPj4NCj4gPj4gICAgIGFzbSB2b2xhdGlsZSgiJTAscDAgPSB2bWludWIo
JTIsICUzKVxuXHQiDQo+ID4+DQo+ID4+ICAgICAgICAgICAgICAgICAgXg0KPiA+Pg0KPiA+PiA8
aW5saW5lIGFzbT46MToyOiBub3RlOiBpbnN0YW50aWF0ZWQgaW50byBhc3NlbWJseSBoZXJlDQo+
ID4+DQo+ID4+ICAgICAgICAgICByMzoyLHAwID0gdm1pbnViKHIxOjAsIHIzOjIpDQo+ID4+DQo+
ID4+ICAgICAgICAgICBeDQo+ID4+DQo+ID4+IDEgZXJyb3IgZ2VuZXJhdGVkLg0KPiA+Pg0KPiA+
Pg0KPiA+PiBDYW4gd2UgdHJ5IGFnYWluIHRvIHVwZGF0ZSBkZWJpYW4taGV4YWdvbi1jcm9zcz8g
IEkgcmVjYWxsIHRoYXQgbGFzdA0KPiA+PiB0aW1lIHRoZXJlIHdhcyBhIGNvbXBpbGVyIGJ1ZyB0
aGF0IHByZXZlbnRlZCBmb3J3YXJkIHByb2dyZXNzLg0KPiA+PiBQZXJoYXBzIHRoYXQgaGFzIGJl
ZW4gZml4ZWQgaW4gdGhlIGludGVyaW0/DQo+ID4+DQo+ID4+IEknbSB3aWxsaW5nIHRvIGFjY2Vw
dCBzdWNoIGFuIHVwZGF0ZSBpbiB0aGUgbmV4dCB3ZWVrIGJlZm9yZSByYzEsIGJ1dA0KPiA+PiBp
ZiB3ZSBjYW4ndCBtYW5hZ2UgdGhhdCB3ZSdsbCBuZWVkIHRvIGRpc2FibGUgdGhlIGZhaWxpbmcg
dGVzdChzPykuDQo+ID4+IFRoYW5rcyBpbiBhZHZhbmNlLA0KPiA+Pg0KPiA+Pg0KPiA+PiByfg0K
PiA+DQo+ID4gSGkgUmljaGFyZCwNCj4gPg0KPiA+IFNvbWUgb2YgdGhlIHRlc3RzIHJlcXVpcmUg
dGhlIC1tdjY3IGZsYWcgdG8gYmUgcGFzc2VkIHRvIHRoZSBjb21waWxlcg0KPiBiZWNhdXNlIHRo
ZXkgaGF2ZSBpbnN0cnVjdGlvbnMgdGhhdCBhcmUgbmV3IGluIHY2Ny4NCj4gPg0KPiA+IFRoaXMg
cGF0Y2gNCj4gPiBjb21taXQgY2QzNjJkZWZiYmQwOWNiYmMwOGIzYmI0NjUxNDE1NDI4ODdiOGNl
Zg0KPiA+IEF1dGhvcjogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gPiBE
YXRlOiAgIEZyaSBNYXkgMjcgMTY6MzU6NDggMjAyMiArMDEwMA0KPiA+DQo+ID4gICAgICB0ZXN0
cy90Y2c6IG1lcmdlIGNvbmZpZ3VyZS5zaCBiYWNrIGludG8gbWFpbiBjb25maWd1cmUgc2NyaXB0
DQo+ID4NCj4gPiBNb3ZlZCB0aGlzIGxpbmUgZnJvbSB0ZXN0cy90Y2cvY29uZmlndXJlLnNoIHRv
IHRoZSBtYWluIGNvbmZpZ3VyZQ0KPiA+IHNjcmlwdA0KPiA+IDogJHtjcm9zc19jY19jZmxhZ3Nf
aGV4YWdvbj0iLW12NjcgLU8yIC1zdGF0aWMifQ0KPiA+DQo+ID4NCj4gPiBIb3dldmVyLCB0aG9z
ZSBmbGFncyBhcmVuJ3QgYWN0dWFsbHkgcGFzc2VkIHRvIHRoZSBjb21waWxlciBhbnkgbW9yZSAt
IGF0DQo+IGxlYXN0IGJ5IGRlZmF1bHQuDQo+ID4NCj4gPiBUaGUgZ2l0bGFiIGJ1aWxkZXIgaXMg
cGFzc2luZw0KPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2pvYnMv
Mjc3MTUyODA2Ng0KPiA+IFNvLCB0aGVyZSBtdXN0IGJlIHNvbWV0aGluZyBpbiAkTUFLRV9DSEVD
S19BUkdTDQo+ID4NCj4gPiBJIHVzZSB0aGUgZm9sbG93aW5nIHdoZW4gSSBydW4NCj4gPiBtYWtl
IEVYVFJBX0NGTEFHUz0nLW12NjcgLU8yJyBjaGVjay10Y2cNCj4gPg0KPiA+DQo+ID4gU28sIHdl
IHByb2JhYmx5IGRvbid0IG5lZWQgYSBuZXcgZG9ja2VyIGltYWdlLiAgRG8gb3RoZXIgdGFyZ2V0
cyBoYXZlDQo+IHRoZWlyIGNyb3NzX2NjX2NmbGFncz8gIFBsZWFzZSBhZHZpc2UuDQo+IA0KPiBP
b29oLCB0aGF0J3MgZWFzeS4gIEp1c3QgbW9kaWZ5IENGTEFHUyBpbg0KPiB0ZXN0cy90Y2cvaGV4
YWdvbi9NYWtlZmlsZS50YXJnZXQuDQo+IA0KPiBJJ3ZlIGp1c3QgdGVzdGVkDQo+IA0KPiAtLS0g
YS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQNCj4gDQo+ICsrKyBiL3Rlc3RzL3Rj
Zy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldA0KPiANCj4gQEAgLTE5LDcgKzE5LDcgQEANCj4gDQo+
ICAgRVhUUkFfUlVOUyA9DQo+IA0KPiANCj4gDQo+ICAgQ0ZMQUdTICs9IC1Xbm8taW5jb21wYXRp
YmxlLXBvaW50ZXItdHlwZXMgLVduby11bmRlZmluZWQtaW50ZXJuYWwNCj4gDQo+IC1DRkxBR1Mg
Kz0gLWZuby11bnJvbGwtbG9vcHMNCj4gDQo+ICtDRkxBR1MgKz0gLWZuby11bnJvbGwtbG9vcHMg
LW12NjcgLU8yDQo+IA0KPiANCj4gDQo+ICAgSEVYX1NSQz0kKFNSQ19QQVRIKS90ZXN0cy90Y2cv
aGV4YWdvbg0KPiANCj4gICBWUEFUSCArPSAkKEhFWF9TUkMpDQo+IA0KPiANCj4gYW5kIGl0IG5v
dyBidWlsZHMsIGJ1dCBJIHNlZSBhIHJ1bnRpbWUgZXJyb3I6DQo+IA0KPiB0aW1lb3V0IC0tZm9y
ZWdyb3VuZCA5MCAgL2hvbWUvcnRoL3FlbXUvYmxkL3FlbXUtaGV4YWdvbiAgbWlzYyA+DQo+IG1p
c2Mub3V0DQo+IA0KPiBtYWtlWzFdOiAqKiogWy4uL01ha2VmaWxlLnRhcmdldDoxNTg6IHJ1bi1t
aXNjXSBFcnJvciAxDQo+IA0KPiAkIGNhdCAuL3Rlc3RzL3RjZy9oZXhhZ29uLWxpbnV4LXVzZXIv
bWlzYy5vdXQNCj4gDQo+IEVSUk9SOiAweDAwMDcgIT0gMHgwMDFmDQo+IA0KPiBGQUlMDQo+IA0K
PiANCj4gQW55IGlkZWFzIHRoZXJlPw0KDQpUaGF0J3MgYmVjYXVzZSBtaXNjIHJlcXVpcmVzIC1P
MiAoZG9uJ3QgcmVtZW1iZXIgd2h5KS4gIFdoZW4geW91IHB1dCAtTzIgaW4gQ0ZMQUdTLCBpdCBn
ZXRzIG92ZXJyaWRkZW4uICBIZXJlJ3MgdGhlIGNvbW1hbmQgdGhhdCBnZXRzIHVzZWQgLSBub3Rp
Y2UgdGhlIC1PMCBhZnRlciB0aGUgLU8yLg0KL2xvY2FsL21udC93b3Jrc3BhY2UvcWVtdS1zZXJp
ZXMvcWVtdS90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5IC0tZW5naW5lIGF1dG8gY2MgLS1jYyBoZXhh
Z29uLXVua25vd24tbGludXgtbXVzbC1jbGFuZyAtaSBxZW11L2RlYmlhbi1oZXhhZ29uLWNyb3Nz
IC1zIC9sb2NhbC9tbnQvd29ya3NwYWNlL3FlbXUtc2VyaWVzL3FlbXUgLS0gIC1Xbm8taW5jb21w
YXRpYmxlLXBvaW50ZXItdHlwZXMgLVduby11bmRlZmluZWQtaW50ZXJuYWwgLWZuby11bnJvbGwt
bG9vcHMgLW12NjggLU8yIC1XYWxsIC1XZXJyb3IgLU8wIC1nIC1mbm8tc3RyaWN0LWFsaWFzaW5n
ICAvbG9jYWwvbW50L3dvcmtzcGFjZS9xZW11LXNlcmllcy9xZW11L3Rlc3RzL3RjZy9oZXhhZ29u
L21pc2MuYyAtbyBtaXNjICAtc3RhdGljDQoNCg0KU28sIGluc3RlYWQgb2YgcHV0dGluZyB0aG9z
ZSBpbiBDRkxBR1MsIHB1dCB0aGVtIGluIEVYVFJBX0NGTEFHUy4NCg0KLS0tIGEvdGVzdHMvdGNn
L2hleGFnb24vTWFrZWZpbGUudGFyZ2V0DQorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmls
ZS50YXJnZXQNCkBAIC0yMCw2ICsyMCw3IEBAIEVYVFJBX1JVTlMgPQ0KIA0KIENGTEFHUyArPSAt
V25vLWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzIC1Xbm8tdW5kZWZpbmVkLWludGVybmFsDQog
Q0ZMQUdTICs9IC1mbm8tdW5yb2xsLWxvb3BzDQorRVhUUkFfQ0ZMQUdTICs9IC1tdjY3IC1PMg0K
IA0KIEhFWF9TUkM9JChTUkNfUEFUSCkvdGVzdHMvdGNnL2hleGFnb24NCiBWUEFUSCArPSAkKEhF
WF9TUkMpDQoNCg0KRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0IHB1dHRpbmcgdGhlIGZs
YWdzIGluIE1ha2VmaWxlLnRhcmdldCBpcyB0aGUgcHJvcGVyIHdheSBhbmQgY3Jvc3NfY2NfY2Zs
YWdzIGlzIG9ic29sZXRlPyAgSWYgc28sIEknbGwgc2VuZCB0aGUgYWJvdmUgYXMgYSBwYXRjaC4N
Cg0KVGhhbmtzLA0KVGF5bG9yDQoNCg==

