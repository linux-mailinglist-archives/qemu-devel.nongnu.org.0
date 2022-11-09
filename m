Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E066622F1E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osn7C-0007Ge-BE; Wed, 09 Nov 2022 10:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osn7A-000787-FZ
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:35:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osn78-0003LH-Bm
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:35:44 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9DMoSb011461; Wed, 9 Nov 2022 15:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=mmsy5hu3MNaGypTYW4qJfT8/VA/R2zur9M/6ooKesKM=;
 b=HHfl1tSsBghkTBgSy10geICGlmw9laMngKjb+Yfn6m5sH1/79dfpiuKKm+bFl8hAMbdh
 fMDvXWv835MiyIwkn77Eh+WZHwoaRLtMeFqTg74xSPYL6PLtx1AhwjGUrtxuOVYI3C0a
 rKCljnLKsRR1AN6WiwOAvfkzq5yrkM0PYLbMlsdgP9j+fBkvpudAnc3MXfhSj6wg6VyM
 GmiNzd6f+J60RoxSEZKKZ6xWqFnTKbeoTO6MblxiNh5b67YbDGJ7A0L4ZNtR09ZjaEI7
 dOEB3fq8vBVvozRcCL43/5RsrS/Z7CeQO098ZZuM4vhOl3nRfH3MCRXFJTnMupjY1DEX KA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr664s6mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 15:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4z+rk5s32UqLpZJDapRH7Q1MAYrMxJ2oTcTmSshUlziOQ5BI4TLV5PxahDj8TUyT1fWvbR+Z3CESemBWqq/Z50Rpf6MNQSN4Qf3ihr0FFgC7ngbReuMv2iGlsdvTByDHwCWs21VB5NI/ZpQSWHK2hj9/5jAcyvRHMGwzGxf8MYoo1SIWcO+8Gt9vTKHDOWHSoa12QRcrVu4CBwKnj2aTR3aZOuG5hS9v5lWGQW/hkc35VW5B9DmsLourCJzeDPXZYuD+3he2wLGBxxKa7xKHjfyQDV1DejpJ1cugJ6oUfqsyt9Ufp6GfjMaWn93+kIMtLM1wvIaAOu39OEsxyRryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmsy5hu3MNaGypTYW4qJfT8/VA/R2zur9M/6ooKesKM=;
 b=hymPwQmagHoD0zicVS3uT7iQTJk7xiEK7LtASNk/gdVvY1l1yn0K3CtZZUYGUSs0Y4LnJHEPUpFUUVZIp0UpUEQ+IgFLKf5lqgDQ1C22gl9lMqYDfUx97M9KXcyk81LgNpE660NIkg0/tH28rsOS+UcfMbzIE4e2qGL6Uq3YO7ei06aOLNUOwCsXKRxNirJfnl/2JjZ1kJdB2dRZry5RvECvRuPrvOIxknbT8xqvJZKOZ1yEAA1gT/xs8n59BrPHajI2ciFRSEsKFcHH1fLpm3Vn0xBEFB9EjymTWZEmuPoSCixxViQCdvLK+vUxfMf1EyL/h15hA8DmuIm69l7aDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6829.namprd02.prod.outlook.com
 (2603:10b6:208:199::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 15:35:36 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 15:35:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Topic: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Index: AQHY8ydtNdQLJIZC8ES19sOlkzaLUK40n9aAgAB9FCCAALVwgIAA6C8w
Date: Wed, 9 Nov 2022 15:35:35 +0000
Message-ID: <SN4PR0201MB8808244E70E1F042458C78EADE3E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-11-tsimpson@quicinc.com>
 <56eccfad-12a7-d854-7e62-d6ec865424f0@linaro.org>
 <SN4PR0201MB88085020EF16C459E65B7032DE3F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <652d22e5-6ebd-2bd3-07d5-0b4ca8d7a55c@linaro.org>
In-Reply-To: <652d22e5-6ebd-2bd3-07d5-0b4ca8d7a55c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6829:EE_
x-ms-office365-filtering-correlation-id: 4a4457ab-6dae-421d-61f4-08dac2680bdc
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lvFTg1dHHWLR92JAEZak6v6DXsvlsd2JCfzBJDTa4mkx51XCQWJ7iveNLr7udBbiNTl9MHYqwg5AkaQCC/cT0CXC90O8+amreBu0rrr7fqmPCrz+kHfcccmcy5R0xsghv3sGGPSOcqiFGsWBr4t8Ib8Xsl3qhQELwlx9XkmiYR1Eb6cdygwmSba83ZwpF4b/OlQwnRURN716jNOvdODN2VeKVclFialD8zsvbXjoePp5WWgd/UcAVTAzPfFbtVIsehRMbChvThPYEUlEpNo8jbAglbpRrWDxRp0p6+8tzXlfCpZXyEV/GmOzI23aVBSZp8i0M70ZcS9Q0J+KKWO4qnmNvFVf82u4bDD7tzuwqnMH6DuHARrTpMkkENiO2Hvipcl1sWDhVD58uvKzlw5ZVriVaiYfPjV3y/C0i47my/TmH6yc9jsTDj8Trrzp9R+psO85VGf7KCb5BDGeAeVM1IAgOnZ4KXbN1xE1/DrtULgjK8rrgTBZw8Shh1+3m6Bo+iGKIDW8542CpZ8j3tbRVZd++PjRsBvJgSXyn1xZkh0iH1L4EwWUiiTFmjAWg5/BGXnp0IuKR2vaQjkcxxH8stRjk5LwksMPn8E67t5U8gUJPCG4SaYMVrp+JYy7Il//mKDLJPiT1F8avCby16hqJvtN1pScihRGV/Zy19s2PmboWbRVVD3rG/WHuZQoUNcWUc7+b0AUW9y8T9NZaLsblT1d22ZsnRNuokJ8dxtwRgsl8+eheLa+2DCTNtUSR2CRyZgHQu7eNCM6XkT5E3WTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(86362001)(33656002)(55016003)(26005)(186003)(53546011)(71200400001)(107886003)(7696005)(9686003)(122000001)(6506007)(83380400001)(38100700002)(5660300002)(2906002)(38070700005)(52536014)(8936002)(478600001)(66446008)(54906003)(76116006)(8676002)(66556008)(66476007)(4326008)(66946007)(110136005)(41300700001)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUF3RDl3RzU3cklpVG5XaFZadjdISEhNcXdsK09SOHI3RkdYUThDU1c4QjI4?=
 =?utf-8?B?dENuaklTRjFhSUw1czhzeS9XY3hQTllWeWlTOUEyRFk2M25lU3BtdUVlZWF2?=
 =?utf-8?B?MVNVdGc2cXdCWDFFaWVibmhzK1lkNzhZOEdtN0c4aXVwYlAyWXFwZkxoeHZF?=
 =?utf-8?B?YkgxdC9rR1JtVFhIeTdUN3FmMVlMak9pKzJtRklXaHVseXd2cEJmNkF2MkVB?=
 =?utf-8?B?eC8reVdPQU5xWDlGNWlDYUhrekNNTE9DZ1NDcXFXRFNNemxrRUlSbHJuUUV1?=
 =?utf-8?B?ajdXVTNqaTdkMmVCU25EZzFoQmY2SUQ4YmxBeHRwV1ZNTkplRXpJS2M5bVpK?=
 =?utf-8?B?NS9ldTk1Mk9GVmFTWWtHZUlVMmdqT2JJc3g0dXlHTk15ZXBJTTVHYUZDTnNj?=
 =?utf-8?B?L0R0MExnMWxmc05jSGU5UDNQc0gwdHoyM1B3ZVFSUUorWVprWFdHekZmYzRr?=
 =?utf-8?B?bkU4cytVeDFVM1RLTWVDaEdFLzE0UXlMMUtaUHFlNlhMSkNzaDk0Mms5U1hr?=
 =?utf-8?B?OUkyaXBXYmlnb1BSVnUzdWtncmdUTWh2RnVHRzBNSDBaQ2hKbUNIVnVIVGo2?=
 =?utf-8?B?bTNwMkdVeEx6SDN5Lzk2VnQzSFhaTVhEQ0NHblVRZEVGM0t3NUFHR2RISE9k?=
 =?utf-8?B?ZExXMDhzMkxldzI5dktIMFNHU2QwM2w1Y3kra0lVMk1oVW54ckJUMGN4Qjds?=
 =?utf-8?B?cTVSd01QSm05cXRLb2F0SjZJY2FnRis2cDRhMFB2bGM1TmlrSCt4WWFiTmJ4?=
 =?utf-8?B?ZlBGYndJKzd0SEdNUFlmMUh0bktqaUF4Z0lSR3pmTld0VFVNenZyNFljbVN5?=
 =?utf-8?B?RzlwdDFvV0lTd05QUDl1Nytjb2dzRHNUclF0d3RmOWQ5RUNONjJmc1k3YmFR?=
 =?utf-8?B?UlpjVGpTejJHY21zbFVvRXhubFhxWHVGaEF2c1RrTXp1b3FtcUVhYkRVemYx?=
 =?utf-8?B?WnlWSWxuQytXU1pxUjBjY2d3cWltU2I1Y3R3bTBqb1FuT3NHdzVUQW1OdnA3?=
 =?utf-8?B?cWRQOGYwZ1ZiV3djNEtCZ3BNVG5xNXlGeTd0dGtDRFlWUkdSVWNlenRHSHF0?=
 =?utf-8?B?eFpmMHRIM0RtZnc5cmNzVk9Db2tKalBOeXV5cjc0QXo1RnArZXVCa2cwQnph?=
 =?utf-8?B?cDk1QU00UXFUSjRET3I1a1ZuLzRZZlYyWWJwSlQvZmxOMzRMRFRqcnRlN3l4?=
 =?utf-8?B?K0ZPQWEvTEtIQzZoMmxrdW05bkhoa1NYekxrSEFUVFJ1aTNNN3dUL0dlZWxu?=
 =?utf-8?B?MmcwdnpHb1NPT1BRMVU0eWRwZ25JaVFGeU8xNEJOTVJZWGE1cDJuM1NJTHZF?=
 =?utf-8?B?ZGZ6NWtZM3prR3htcXBrem80WjZyYTBkYjl6N2xpS3NzRjRYVFBtN2RSK2xW?=
 =?utf-8?B?TnR0aGc3TEs2YU1MVXJGZ01sb2F2N3dIR2wvWHBaQ3ZtSHZqcTVoQjV2SzEy?=
 =?utf-8?B?K3k3WVE2R2gwaURtUHpuUlh1SDg0Z0JSU3h0M2lwZjA1RXUrazJGcTN1RGdq?=
 =?utf-8?B?U0JnOXFEV3hDMkp0dGRpeGFFZTBRTktjZzdlcTdleGlGa0FDNEJBejRSZkVK?=
 =?utf-8?B?NU40a1M4SDd1ak9CMG8xRHg5N3RwcmpLOGFZbWhIZVdVblM1ejRoNnFYVTA2?=
 =?utf-8?B?YXFWb0FoelBEVzdBMHNnblJUQUlxanNPTlk0cHFWSHFDaVN6a0lpcnZUa054?=
 =?utf-8?B?NW9lN1IvbTRIbUZKdXgyVkR2L1I5QnFGVnczSXFDOW9SU2JENmlVbWVoMXM5?=
 =?utf-8?B?Uk1UbjNsb3lja2FGcTVzR3d0Nnpvam9GQ1RBSzNWTjFKM2R3YVRLYmIvVUJu?=
 =?utf-8?B?VUgyOFZHNlFPUjJWdmdWZFM1N2lnVkFUeFp5dkZ1MlpUS1RERnhZcXZKRU5O?=
 =?utf-8?B?bVpHcSs5RVB4K3ZmV2UvWDBGL3Z0UFo2ZmhvZkQ3U3RUbXVPWFpiMXE1cms4?=
 =?utf-8?B?YUdta2xLSmIvSEQ5dHIzQVhCUmZWNGRVUDhxZEJTUEpJOGpubW1kOSs5L0I1?=
 =?utf-8?B?N1kwU0RQSFo0VlMwWEVmeDJnV2UxVnRZeUhWNnRkQmxYSlR3dytvVitqL1hC?=
 =?utf-8?B?cnhYMVI4U1ByS0xxVXlEb0VWaHZ1SHVtU1hGalJ0OXoza0MweVVMWGgrZW1V?=
 =?utf-8?Q?w7J3E+uApJam9qHTQ30bX06Wt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4457ab-6dae-421d-61f4-08dac2680bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 15:35:35.7257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5vgdoQGNQU2hFmKb+y0Ll0j7s7Bj+CQ3CggMbAjhZd6/h7keYTPQwT0pu2MOkpuCn6nz5Bmr9vPIxEuGxrktQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6829
X-Proofpoint-GUID: nLP92TFC9XcFeKE7lFNcgcTc7qiwYGQ_
X-Proofpoint-ORIG-GUID: nLP92TFC9XcFeKE7lFNcgcTc7qiwYGQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=569
 suspectscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090117
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVt
YmVyIDgsIDIwMjIgNzo0MSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsg
YWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxMC8xMV0gSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIFVzZSBkaXJlY3QgYmxvY2sNCj4gY2hhaW5pbmcgZm9yIGRpcmVjdCBqdW1wL2JyYW5jaA0K
PiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDgsIDIwMjIgMToyNCBBTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24gPHRz
aW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+ID4+IENjOiBwaGls
bWRAbGluYXJvLm9yZzsgYWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPj4g
PGJjYWluQHF1aWNpbmMuY29tPjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA+PiA8cXVp
Y19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxMC8x
MV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFVzZSBkaXJlY3QNCj4gPj4gYmxvY2sgY2hhaW5p
bmcgZm9yIGRpcmVjdCBqdW1wL2JyYW5jaA0KPiA+Pg0KPiA+PiBPbiAxMS84LzIyIDE1OjA1LCBU
YXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPj4+ICAgIHN0YXRpYyB2b2lkIGhleGFnb25fdHJfdGJf
c3RhcnQoRGlzYXNDb250ZXh0QmFzZSAqZGIsIENQVVN0YXRlDQo+ICpjcHUpDQo+ID4+PiAgICB7
DQo+ID4+PiArICAgIERpc2FzQ29udGV4dCAqY3R4ID0gY29udGFpbmVyX29mKGRiLCBEaXNhc0Nv
bnRleHQsIGJhc2UpOw0KPiA+Pj4gKyAgICBjdHgtPmJyYW5jaF9jb25kID0gVENHX0NPTkRfTkVW
RVI7DQo+ID4+PiAgICB9DQo+ID4+DQo+ID4+IFR5cGljYWxseSB0aGlzIHdvdWxkIGdvIGluIGhl
eGFnb25fdHJfaW5pdF9kaXNhc19jb250ZXh0IGFzIHdlbGwsIGJ1dA0KPiA+PiBJIGRvbid0IHN1
cHBvc2UgaXQgcmVhbGx5IG1hdHRlcnMuDQo+ID4NCj4gPiBBRkFJQ1QsIHRoZXNlIGFyZSBhbHdh
eXMgY2FsbGVkIGJhY2sgdG8gYmFjay4gIFNvLCBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0DQo+
IHRoZSBkaXN0aW5jdGlvbiBzaG91bGQgYmUuDQo+IA0KPiBvcHMtPnRiX3N0YXJ0IGlzIGNhbGxl
ZCBhZnRlciBnZW5fdGJfc3RhcnQsIHNvIHlvdSBjYW4gZW1pdCBjb2RlIHRoYXQNCj4gb3BzLT5j
b21lcyBhZnRlciB0aGUNCj4gaW50ZXJydXB0L2ljb3VudCBjaGVjaywgYnV0IGJlZm9yZSB0aGUg
Zmlyc3QgZ3Vlc3QgaW5zdHJ1Y3Rpb24uICBSYXJlbHkgbmVlZGVkLA0KPiBzaG91bGQgcHJvYmFi
bHkgYmUgYWxsb3dlZCB0byBiZSBOVUxMLg0KDQpPSywgSSB3aWxsIG1vdmUgdGhpcyB0byBpbml0
X2Rpc2FzX2NvbnRleHQuDQoNClRoYW5rcywNClRheWxvcg0KDQo=

