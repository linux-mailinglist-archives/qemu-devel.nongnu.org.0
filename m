Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9AD5819A6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:24:18 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPE8-0001xU-A4
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oGPA0-0007QQ-Ga
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:20:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:30360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oGP9u-00014b-Mw
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:19:59 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QHjf2n001806;
 Tue, 26 Jul 2022 18:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=wx8Qt69gbvTJE/WrNRKqaP4q5G8UQJXoRJvFuHdp0qI=;
 b=NGjqFU3c8yy3rNHcySfbokURlk9EFv7JbmJeEc0Nt0fy9PUKScVXi4MvRFHUy+jT4Ycg
 GbsxgdTCBJYZOglHDK5hUdKrdVFNvDXJbcSZncV31bRjPgVmdUMtGpYnXj+lY5tV6/P3
 wfT6VYTnQxkkHzQUltSNy90QFSEP5LvtwSFtzAePCSXJFjGihKnCZZdTveW85mWdpN6Q
 KfZ4fbG4foA8RBtWZgo3E7ZCh5DoVyfvKpST0JLNWsd+yrFmtJYHBiK9cfD+4nYhCKdn
 mmoeFg5x2EXpTNhT0ttHCZv1qE6Lpk1ddbkCn6XN+tLf6sYXo2F+MD94R0yf/cqjKwsO eg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hj6hn9w5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 18:19:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1k/7zl/wiirkkbQkmm1GfAvQ2QUuya+E/y6I5masxAvOgvm5VP5UY8+4mgN/thMAPfZQrKbZgpJu6Lo+oOi1iwItV2izCrrQB1GflB+DNRK8a7B1Ic3fTHdgSQbthx3LhG/E7RXxTUo7kf8uZHAOtLSSIyJLVQlBZpQfP97AnX+YkCY096oh5Qgn40QvKMGV+rVZMVsNybdp8z+y9P23zcYKm5iKsSZh+PlMND6g/WVQI6tjSSF16fDuAyqdg+gf1UGjlKjpXb8a2MO0WSzGI2jWdFoJAAr91QU2wiSucHlTXnd3oXUuhSyiD1iBp3RzGXM4ZPz3NIxeouwgfadIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx8Qt69gbvTJE/WrNRKqaP4q5G8UQJXoRJvFuHdp0qI=;
 b=hUgwqJnkLv/b/+FYTM2K2nJLi/yWdZEICjWPE7Ti9mFslq0TNAHn5bZU4RjuEhkJtsDy5/Jdwv1DaZhdOYHVsXKL8Vmm935GARztCGBgUIESAdVVPr0lRsPpM5PN+zRV2VEGppQ7CbXasLiSUwtt8HjJM9g6tPodYv3QO8vo7PaBTDWyacdd0L7zduPOfleqkS8OhS4mXjv1T763o5+9VVuy4Y+RzvGK9eZTmZSM/XET45tBaXpyUj+jrLk0WkpnYi4GleNMD5kO3OKW13bKkF0HA5rxB7FFaKQxqtACIvMDFdWDzgz/EZyOY4GK3HnKjIwel2+MKI4/Icb3reBiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by MN2PR02MB5902.namprd02.prod.outlook.com (2603:10b6:208:112::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 18:19:45 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::e5cf:85a1:17cf:3022]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::e5cf:85a1:17cf:3022%6]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 18:19:45 +0000
From: Brian Cain <bcain@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Taylor Simpson
 <tsimpson@quicinc.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: RE: hexagon docker test failure
Thread-Topic: hexagon docker test failure
Thread-Index: AQHYoRRrSPhun14la0++7nF48wVKZa2Q7HBKgAAJMrA=
Date: Tue, 26 Jul 2022 18:19:45 +0000
Message-ID: <SN6PR02MB4205E6E8EC8265D706185C95B8949@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
 <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
In-Reply-To: <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18002360-573b-4792-2d71-08da6f336ac4
x-ms-traffictypediagnostic: MN2PR02MB5902:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fV2Ln2PGY7sKpD0xqyw50Pasocuw3k6//0vOJijsqAWA2UyiRj6FT8w+4d7uaGWuVnPEyjlLWrodb1cuX5HhUpknpiIoc0frOa9K+9Pf9LglMcroRKvHjrv3mKEJ3+MTj3SG1pqaihtnozFZgqvhzXGB7p0jCUFN+8j6RweD0jg+FyVew2YNAJ6MrLRsE8vjdTbPJwERwrjVmgI+LqNFKXYZbV9s3aT1dMrAq+BEXxYFHuGkuJsI8RjRfpBn1xaA0fA29YqH2T6KwuUsKSbG0V/UwPzskwPcrbBWaeVgJo59lmnbGaEC9FmcaPZretZNOj+SAzAjhgNtYPzskUw/cqLJ5m+hM+O8KDRYqo70FlxTQaZsBBtlcrDmveYcFNU3ZfeDZfcN9hK86H5e+H8dDFIaJvnZh3yh6KG1kRxBzykVAfioFVvo1WJF9mrBXQKpYarh+GT64RWrBbAIvq9N663iqdbmDx8b4wT5WttsN+QsHh1yy/+hSwcjC8y0HbK4WiN35i2uVJWOXfHxgBZB+6EZk0izCGHbGV+q8blelVi/Rhk9uSjDxQBnE7f9YqLYxvB9+eC2kbzFFDKLPWr/DkQZw5bi3uCVnIGIVfg3avCAjj/AnbU+WdpbbBa/TWqH7vRPb5UM6BNvcV86yCWE4DFwuBRD+cgO7v0+2Z9O+JPAQ5vHysJEVXwd8OiCJtu3FnT5//j9yzhqV5RYM6eN2Xb8iqHHJ2HBva9CfcJ9Wuc09ObQEWV2Eebq3oq+UHAZ7FZYyD21V9/g3AWJLJE+ZPuj2mbsUrP1+bx7IUfSpBDcRizUo5TtJBk+CVFh6EzUBPYcSZoIQEyksWO6jHWAcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(966005)(3480700007)(53546011)(71200400001)(66446008)(8676002)(76116006)(86362001)(55016003)(66476007)(2906002)(26005)(8936002)(52536014)(83380400001)(41300700001)(7696005)(6506007)(64756008)(33656002)(6636002)(66556008)(110136005)(5660300002)(38100700002)(186003)(122000001)(9686003)(4326008)(478600001)(66946007)(38070700005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWNLeGdHNGliOUZtK29uWnBXd3ZuOUVrM3ErZGt4bVFKS2hQNW42ako4Qzli?=
 =?utf-8?B?cUtqRXhUcTJHOGI4SUdaRk5JZS84MHZRRmk0N2VrRWRVUVZaaFBuTzZzSm51?=
 =?utf-8?B?RmR1ck1SM0N6TTU4YWdNNEQ5LzNncGhtc0IwN0I4Z2JFbktIbjVlT0duUGE0?=
 =?utf-8?B?R1NkdXAySW5HRkNydVpkMlN3UTYrN2tnTkI0ZTdoNEFHY3grYUlmK09wejJw?=
 =?utf-8?B?NkY1TmVMZ0dhbVhPRkNySmVkOXl6TjVYTjlOanlUS0JKdHkyN3BVV24vL21m?=
 =?utf-8?B?R0FzUGFQU3FOTExnYUR6NkNYeWFxNHc2SzhHUE9wZGdqOTF1SHJBQlZpQ1hi?=
 =?utf-8?B?bWRNSGNZODhJMURDemloNU1sb3Q2K1VXYmFFd0hUWHlMdHovaU9DOHhIT1Vr?=
 =?utf-8?B?dzNCSGZwcDZSMkdFR2g0MXdPZEhYZGlySHk1SXM2aEFkVXZlYWxGd09xekJr?=
 =?utf-8?B?MHhkNnhwY1k0ZXVOQlR1VDBHOW1xUysyNnZqb1JTdndPNnVRd0dJMHUyOVdn?=
 =?utf-8?B?dDAwRllHU0V0UmdHLzVFSnVHZi9QYUhUbXhQTmVoZXhwRCtkMDR6amhWSWNN?=
 =?utf-8?B?SmhJdEVQK2UyQXhqTHhCUjhQYXZyTFFzQmZ3dVZWU0tZWGdPWDEySmFsN2Vk?=
 =?utf-8?B?cmxNMk1UdFU0TVBnVk5Mdm5leWd0ZGpsaTFBQnlXN3BSZkVpcnMzcm9PcDNo?=
 =?utf-8?B?R0NSck9UQk9nODFZVHAxOU14SjZpT1g0YUtVaVQrd1FIUk1jN0YrbXVGS1pm?=
 =?utf-8?B?V0NiUG1zRHgyelZPR0RwV1BaSVd6TEVtaDZMMnEyaTdobkF1YURCVDIvK3E3?=
 =?utf-8?B?V0s0SDBNbjNMSTZNNkhMRklBZ0pSMTZnaEV0TWJ5ODJ6OXNKMG80aEFBVXZX?=
 =?utf-8?B?emx3bkJrQ1E2U0VXaEJZVkxZY2RLd0RBMDZPR0xZS0d2b1J6OEZaWXlDZDQ0?=
 =?utf-8?B?Q0hNMGhtWjhDUWtZcWN0a2d6b1VzenFseTNiTHVxN21pQUJ6YVVwb1hGT3NJ?=
 =?utf-8?B?bllyKzVNeDM3bWVpaGltRjZaazBrcllvVURweC84NXdRRGZpRDI4YXVyS1BF?=
 =?utf-8?B?QThKWnVQeS9SNHZobWRoY3d5QjdqVnpKTHRRUlczdklmRVNpVnVlaTVORXgx?=
 =?utf-8?B?OURMK1R5Z0lmYkFMdDRDbVZEU2RMYnoraFZkeE1UcmIrclFmVXZLS3NucUkv?=
 =?utf-8?B?aDY5aGZtZlV0QVZnTXpaRE95U2dXcjdPejNvS1g2T21FS21Vd1NTTllxSWFK?=
 =?utf-8?B?S3pTZGNaSDd6V2hrV0FjUWxqMlBZTUNXa1ZmRFZBN0xtejRxYk0xWHA1djU1?=
 =?utf-8?B?OEZnekhEN1lBRTk4WFkxSUVnazlON0xOaFJZam11c0dSUHMzcVIzd2lXNTJC?=
 =?utf-8?B?anoxL053TGQrV05yZXJYOGxGNDdDRVZjQVN6UFRXVk0xRkI3VDZOMmd2b0Zi?=
 =?utf-8?B?Q2s3Slh0U2RtRlJBZWRvelljeCtwWDA4T3pOQXBzZHJmcnhqVWE5L3hCR3dM?=
 =?utf-8?B?YnIrK3JVemFmT2swWGZDY1FSVitYUEFVN3FreUxDcWVrRmxMcmpXc1hhT0xE?=
 =?utf-8?B?S3k1RUk2dXF2dWtwcmNXVmtWME5Da2c5RnV0QjByT1YxcWhmeCtWUkZxODNy?=
 =?utf-8?B?dG13bDZNWU84NmJENzdqQ1FxcUN2dFUxTkhXdm8zMXpsZ2pURXFuU2s5cTZ3?=
 =?utf-8?B?OGtOR3JwVjhoTnVMbElRU2ViN2ZhR0JJSEhZT2Joa3gxdW1LOE5KZDJFVHBL?=
 =?utf-8?B?VGliV1RoUjIvUkxPeHF0UldvRnEvSjlSVmhkbkY1QWNEckxabVNmT3NnSFRX?=
 =?utf-8?B?cDJJQlowK1RLTjlUdlhSakxsUE5uVFcrR29yUGE1WnN5WmlWVUgvak1xb1o3?=
 =?utf-8?B?SHAwRTNkZWJTZmh1eWYzaGx5bVFqZ09ZblY2RUxoSjJNSjg4NkgxNjV4S2NR?=
 =?utf-8?B?bXlvbDZkTGdBekg4eThZK3RyelJUOG1lMEhrWWJwMXQydXlGTnZGTkNKcFpG?=
 =?utf-8?B?OGJPa2t1K2tnamRoNlpwWTlXay8xK3VRVW8vVXJhbklaMTVrTU9laVdKcWgv?=
 =?utf-8?B?K2N0RE03YmRGb3pCcHpBL09KUVBRRDBtbndsRkV3K0pvNzIweENhWFdFemN1?=
 =?utf-8?Q?0S9FbPAyuVAVC/T2cL/m504uo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18002360-573b-4792-2d71-08da6f336ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 18:19:45.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1W6tH6jn77ClhGymidUbu34lOxzNc/k3U7hsTzkfmVKh/oR+4veiKog7zVfZ6cyHKuOBM/Jol3a1HQ5dRnRSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5902
X-Proofpoint-ORIG-GUID: LRgtI_STp9BMIcBH8g8InpzbDhuw2Sg9
X-Proofpoint-GUID: LRgtI_STp9BMIcBH8g8InpzbDhuw2Sg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260070
Received-SPF: pass client-ip=205.220.168.131; envelope-from=bcain@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRZW11LWRldmVsIDxxZW11LWRl
dmVsLWJvdW5jZXMrYmNhaW49cXVpY2luYy5jb21Abm9uZ251Lm9yZz4NCj4gT24gQmVoYWxmIE9m
IFJpY2hhcmQgSGVuZGVyc29uDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjYsIDIwMjIgMTI6NDIg
UE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gQ2M6IHFl
bXUtZGV2ZWwgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3ViamVjdDogUmU6IGhleGFnb24g
ZG9ja2VyIHRlc3QgZmFpbHVyZQ0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkgb2YNCj4gYW55IGxpbmtz
IG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBPbiA3LzI2
LzIyIDEwOjIzLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZz4NCj4gPj4gU2VudDogVHVlc2RheSwgSnVseSAyNiwgMjAyMiAxMDo0
MSBBTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiA+
PiBDYzogcWVtdS1kZXZlbCA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiA+PiBTdWJqZWN0OiBo
ZXhhZ29uIGRvY2tlciB0ZXN0IGZhaWx1cmUNCj4gPj4NCj4gPj4gSGkgVGF5bG9yLA0KPiA+Pg0K
PiA+PiBPbmUgb2YgeW91ciByZWNlbnQgaGV4YWdvbiB0ZXN0c3VpdGUgY2hhbmdlcyBpcyBpbmNv
bXBhdGlibGUgd2l0aCB0aGUNCj4gPj4gZG9ja2VyIGltYWdlIHRoYXQgd2UncmUgdXNpbmc6DQo+
ID4+DQo+ID4+IHRlc3RzL3RjZy9oZXhhZ29uL211bHRpX3Jlc3VsdC5jOjc5OjE2OiBlcnJvcjog
aW52YWxpZCBpbnN0cnVjdGlvbg0KPiA+Pg0KPiA+PiAgICAgYXNtIHZvbGF0aWxlKCIlMCxwMCA9
IHZtaW51YiglMiwgJTMpXG5cdCINCj4gPj4NCj4gPj4gICAgICAgICAgICAgICAgICBeDQo+ID4+
DQo+ID4+IDxpbmxpbmUgYXNtPjoxOjI6IG5vdGU6IGluc3RhbnRpYXRlZCBpbnRvIGFzc2VtYmx5
IGhlcmUNCj4gPj4NCj4gPj4gICAgICAgICAgIHIzOjIscDAgPSB2bWludWIocjE6MCwgcjM6MikN
Cj4gPj4NCj4gPj4gICAgICAgICAgIF4NCj4gPj4NCj4gPj4gMSBlcnJvciBnZW5lcmF0ZWQuDQo+
ID4+DQo+ID4+DQo+ID4+IENhbiB3ZSB0cnkgYWdhaW4gdG8gdXBkYXRlIGRlYmlhbi1oZXhhZ29u
LWNyb3NzPyAgSSByZWNhbGwgdGhhdCBsYXN0IHRpbWUNCj4gPj4gdGhlcmUgd2FzIGEgY29tcGls
ZXIgYnVnIHRoYXQgcHJldmVudGVkIGZvcndhcmQgcHJvZ3Jlc3MuICBQZXJoYXBzIHRoYXQNCj4g
aGFzDQo+ID4+IGJlZW4gZml4ZWQgaW4gdGhlIGludGVyaW0/DQo+ID4+DQo+ID4+IEknbSB3aWxs
aW5nIHRvIGFjY2VwdCBzdWNoIGFuIHVwZGF0ZSBpbiB0aGUgbmV4dCB3ZWVrIGJlZm9yZSByYzEs
IGJ1dCBpZiB3ZQ0KPiA+PiBjYW4ndCBtYW5hZ2UgdGhhdCB3ZSdsbCBuZWVkIHRvIGRpc2FibGUg
dGhlIGZhaWxpbmcgdGVzdChzPykuICBUaGFua3MgaW4NCj4gPj4gYWR2YW5jZSwNCj4gPj4NCj4g
Pj4NCj4gPj4gcn4NCj4gPg0KPiA+IEhpIFJpY2hhcmQsDQo+ID4NCj4gPiBTb21lIG9mIHRoZSB0
ZXN0cyByZXF1aXJlIHRoZSAtbXY2NyBmbGFnIHRvIGJlIHBhc3NlZCB0byB0aGUgY29tcGlsZXIN
Cj4gYmVjYXVzZSB0aGV5IGhhdmUgaW5zdHJ1Y3Rpb25zIHRoYXQgYXJlIG5ldyBpbiB2NjcuDQo+
ID4NCj4gPiBUaGlzIHBhdGNoDQo+ID4gY29tbWl0IGNkMzYyZGVmYmJkMDljYmJjMDhiM2JiNDY1
MTQxNTQyODg3YjhjZWYNCj4gPiBBdXRob3I6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+DQo+ID4gRGF0ZTogICBGcmkgTWF5IDI3IDE2OjM1OjQ4IDIwMjIgKzAxMDANCj4gPg0K
PiA+ICAgICAgdGVzdHMvdGNnOiBtZXJnZSBjb25maWd1cmUuc2ggYmFjayBpbnRvIG1haW4gY29u
ZmlndXJlIHNjcmlwdA0KPiA+DQo+ID4gTW92ZWQgdGhpcyBsaW5lIGZyb20gdGVzdHMvdGNnL2Nv
bmZpZ3VyZS5zaCB0byB0aGUgbWFpbiBjb25maWd1cmUgc2NyaXB0DQo+ID4gOiAke2Nyb3NzX2Nj
X2NmbGFnc19oZXhhZ29uPSItbXY2NyAtTzIgLXN0YXRpYyJ9DQo+ID4NCj4gPg0KPiA+IEhvd2V2
ZXIsIHRob3NlIGZsYWdzIGFyZW4ndCBhY3R1YWxseSBwYXNzZWQgdG8gdGhlIGNvbXBpbGVyIGFu
eSBtb3JlIC0gYXQNCj4gbGVhc3QgYnkgZGVmYXVsdC4NCj4gPg0KPiA+IFRoZSBnaXRsYWIgYnVp
bGRlciBpcyBwYXNzaW5nDQo+ID4gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11
Ly0vam9icy8yNzcxNTI4MDY2DQo+ID4gU28sIHRoZXJlIG11c3QgYmUgc29tZXRoaW5nIGluICRN
QUtFX0NIRUNLX0FSR1MNCj4gPg0KPiA+IEkgdXNlIHRoZSBmb2xsb3dpbmcgd2hlbiBJIHJ1bg0K
PiA+IG1ha2UgRVhUUkFfQ0ZMQUdTPSctbXY2NyAtTzInIGNoZWNrLXRjZw0KPiA+DQo+ID4NCj4g
PiBTbywgd2UgcHJvYmFibHkgZG9uJ3QgbmVlZCBhIG5ldyBkb2NrZXIgaW1hZ2UuICBEbyBvdGhl
ciB0YXJnZXRzIGhhdmUgdGhlaXINCj4gY3Jvc3NfY2NfY2ZsYWdzPyAgUGxlYXNlIGFkdmlzZS4N
Cj4gDQo+IE9vb2gsIHRoYXQncyBlYXN5LiAgSnVzdCBtb2RpZnkgQ0ZMQUdTIGluIHRlc3RzL3Rj
Zy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldC4NCj4gDQo+IEkndmUganVzdCB0ZXN0ZWQNCj4gDQo+
IC0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldA0KPiANCj4gKysrIGIvdGVz
dHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0DQo+IA0KPiBAQCAtMTksNyArMTksNyBAQA0K
PiANCj4gICBFWFRSQV9SVU5TID0NCj4gDQo+IA0KPiANCj4gICBDRkxBR1MgKz0gLVduby1pbmNv
bXBhdGlibGUtcG9pbnRlci10eXBlcyAtV25vLXVuZGVmaW5lZC1pbnRlcm5hbA0KPiANCj4gLUNG
TEFHUyArPSAtZm5vLXVucm9sbC1sb29wcw0KPiANCj4gK0NGTEFHUyArPSAtZm5vLXVucm9sbC1s
b29wcyAtbXY2NyAtTzINCj4gDQo+IA0KPiANCj4gICBIRVhfU1JDPSQoU1JDX1BBVEgpL3Rlc3Rz
L3RjZy9oZXhhZ29uDQo+IA0KPiAgIFZQQVRIICs9ICQoSEVYX1NSQykNCj4gDQo+IA0KPiBhbmQg
aXQgbm93IGJ1aWxkcywgYnV0IEkgc2VlIGEgcnVudGltZSBlcnJvcjoNCj4gDQo+IHRpbWVvdXQg
LS1mb3JlZ3JvdW5kIDkwICAvaG9tZS9ydGgvcWVtdS9ibGQvcWVtdS1oZXhhZ29uICBtaXNjID4N
Cj4gbWlzYy5vdXQNCj4gDQo+IG1ha2VbMV06ICoqKiBbLi4vTWFrZWZpbGUudGFyZ2V0OjE1ODog
cnVuLW1pc2NdIEVycm9yIDENCj4gDQo+ICQgY2F0IC4vdGVzdHMvdGNnL2hleGFnb24tbGludXgt
dXNlci9taXNjLm91dA0KPiANCj4gRVJST1I6IDB4MDAwNyAhPSAweDAwMWYNCj4gDQo+IEZBSUwN
Cj4gDQo+IA0KPiBBbnkgaWRlYXMgdGhlcmU/DQoNCkkgZG9uJ3QgdGhpbmsgSSd2ZSBzZWVuIHRo
aXMgb25lIGZhaWwgYmVmb3JlLiAgV2UgY2FuIGFuYWx5emUgdGhlIGZhaWx1cmUgYW5kL29yIGJp
c2VjdCB0byBzZWUgaWYgaXQgd2FzIGludHJvZHVjZWQgYnkgYSBwYXJ0aWN1bGFyIGNvbW1pdC4N
Cg0KLUJyaWFuDQo=

