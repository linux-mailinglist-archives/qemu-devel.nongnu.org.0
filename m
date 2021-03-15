Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7433BBD7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:23:14 +0100 (CET)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLo7l-0006ZL-FS
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=070844fc59=adam.olek@aptiv.com>)
 id 1lLo39-0003cw-89
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:18:27 -0400
Received: from mx0a-00275a01.pphosted.com ([148.163.157.133]:5858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=070844fc59=adam.olek@aptiv.com>)
 id 1lLo36-0000QL-Bh
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:18:26 -0400
Received: from pps.filterd (m0109021.ppops.net [127.0.0.1])
 by mx0a-00275a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FEI0ja030204; Mon, 15 Mar 2021 10:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aptiv.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD21Dec2019-1-Aptiv;
 bh=SKdj27xfGctqgcKsj9JoIYxZdwgWk0vzCz2su/53qzI=;
 b=qx3PDyCZ0OoBUa/b+sWLh1aMOCeDRxbm3plTNIjfkwy91q3UX48fZWOk0GGym5GVJ0Ll
 l3fhzNi8r+TcS74fPBKtvlNxcGEl8iajXlmPN5SCnuhXFWsut2iMKmtAAVI0Bu75moHc
 YmolgkCTrH7+jme0fpoqQ8NtIHO6XicCUedKyxN0qq4mzEUIhphyootycSbFZ3YKB7tU
 ezazsr+hibjm0kbzCAbgy7vnxyD64CAOsJhLNcMsL6J5wIKNsDuika82C3Mzy2LfNWE0
 cbFJkFHdIjZH/P9swyrMg6CMOfEukINj4aC6INS85ViOd4OwFu4rxKZ/QHs/U2yTjrRe Zg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-00275a01.pphosted.com with ESMTP id 378txgkrnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 10:18:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5mBVhxvDuLp/Q+LQqXSwZY7UskGdDoWi6OuwOZza5/rW/Hudu89RnNs6HNQ8RQMANPWsuqQa3XaM6YeAlDThjkAtOMUuInrS4i853yLy5R9S/M+NS4AuyreTFDIsTcU5NH2cxngijoANGlfybcv0ERBMUqQpTfA0pkvCIfaKrIVaeyy4GjmtxQV1IRqfUEmmTmdRKGhw636soVtbti8cQaxfXekdWpGkqv3AC3INEvHNCC/aj+5TzJVFKhy+2ZYmtlCyrNxb5YDBQYOX0tVltEpJ0G+21qJckyWxZM3IR8gFaqNTRrvoAQsLOUOFQVwI8FxzR3d8/r+0JuahWlBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKdj27xfGctqgcKsj9JoIYxZdwgWk0vzCz2su/53qzI=;
 b=hxz7vFz2nbqZBXYtGiDjnv6nQvSdwMSiNsApkileom0H/VuelEsk0LVdGs4jZilkdetgT/MPbFtGeBjs+xStsKMECubBcP4sHyYkg8TjfhKrTY/ilSJmUyCiWCRgw4Z+2BPxgWO7MCG2uEx6I8R9fuMzxYVlfz2qakEuNaOc+PdSlR6uzUBn2Q3zLAqGNyKLHUuFT39tzCp5uNV7u1sgmxwBQ1AQPTRWKe109JmWkvar3ykn2fJRU6tl+bJVcn9i/YBn28VvdztYexHI2HG12IaP+KSIdkVGZb45P16Oa5dz8+uZ22HNtOr0C3h5XAGC/o/f8jFMc9kA+1Tqhn0Kjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aptiv.com; dmarc=pass action=none header.from=aptiv.com;
 dkim=pass header.d=aptiv.com; arc=none
Received: from MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM (2603:10b6:320:4::26) by
 CO1P197MB0007.NAMP197.PROD.OUTLOOK.COM (2603:10b6:110:74::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 14:18:18 +0000
Received: from MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
 ([fe80::d8e9:18d6:c62b:1bc6]) by MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
 ([fe80::d8e9:18d6:c62b:1bc6%12]) with mapi id 15.20.3933.032; Mon, 15 Mar
 2021 14:18:18 +0000
From: "Olek, Adam" <adam.olek@aptiv.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: EXT SENDER - Re: IMX FEC model- modification in interrupts
Thread-Topic: EXT SENDER - Re: IMX FEC model- modification in interrupts
Thread-Index: AdcVk33C80J3r2WzTL+ixnVTm1sPZgBFjXiAAL7qI1A=
Date: Mon, 15 Mar 2021 14:18:18 +0000
Message-ID: <MWHP197MB0063B01F144BC460FE0F8FC2E56C9@MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM>
References: <MWHP197MB00634EEBA13CDF0F980576C5E5919@MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM>
 <CAFEAcA9gNvv=bown60hBNaMY=WfFqddFVzvUAMT_GPLa9vY_NQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9gNvv=bown60hBNaMY=WfFqddFVzvUAMT_GPLa9vY_NQ@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=aptiv.com;
x-originating-ip: [5.60.155.99]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e26919a-5aef-48e6-e193-08d8e7bd2e46
x-ms-traffictypediagnostic: CO1P197MB0007:
x-microsoft-antispam-prvs: <CO1P197MB00072138DD8F39B2AA8C3329E56C9@CO1P197MB0007.NAMP197.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5Kyg6TBY6FnshcoIPXj8DEeuQN6QF36UGvqKFKrbutfWK9F3cYv9zls/0GMY7rB/oQryFPCWnHFNoPXI4hh6x7NvyOJgTBN20aOCn4oqfg3+iARngQ8/PI2I6MrLiPtTUkLhQJDugGgECUuQglcLckni1N34nFvFlpGc+/uhr+tQKEFGTlzx0z8Vt9/81/GhOWLJmuoK9oJnOiXJJ82uGM3h7EtGt/zUW3BEyED3accX+8rtKlE09voa91coTbtOhUgK5/L1gBveNi1SGg1MaJRETsRJyCTumR0DAB32zqqrlsUkcHYokdX0ud7yGgY37gH+NPYYQc1p8sqGqH7zEIJh7SOHbSycn6iuxtixhV7PczXH7FwcVZaPRz9m0suabxV7ZfYcwplYuWJh+cl/KMzqcVQplqJWajwtLsOEU42/7/KdWLD//3dgZnermKV3dF5zELwlavl/0p8kZsx5k5s05R3ss354TctpP0qy/FxA4YtbSk18J1+V5YJN+NedMMrnQPCJVWg+oj97ksjmGYlUfehQtVG6y6e6UKAWlvHO9EcJ0yML9NFe/F/7Ilx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39860400002)(136003)(9686003)(7696005)(5660300002)(55016002)(478600001)(2906002)(86362001)(186003)(4326008)(71200400001)(66476007)(66446008)(66556008)(53546011)(6916009)(6506007)(316002)(76116006)(83380400001)(8676002)(8936002)(66946007)(64756008)(33656002)(52536014)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RytxcUJTVDJWNDF2TExHcDl0UzB0WHlFRmk2Q2pHWjR2a2NvRU4zQ0VOVWJJ?=
 =?utf-8?B?aHFaNjBMcVFONWd6V1lKQm5HVGd0SjMyc081TVBDaksycjdCcXVTTm8yTFpp?=
 =?utf-8?B?em5IemY5cEVVTlpGYnE2MFhmMU8rWVZQeG5pNkhLMzNIdnE0b3dRV3NhVWZs?=
 =?utf-8?B?VXZHdklVRFZPQ3l6WC9UQm1VbWJTaGlkalpuTm9mTkZMQXB6WVNJR2RvU2Rs?=
 =?utf-8?B?M2g0NlhydFg2eUpaVjk0VzFCZ0Vua0dRTkJnTmI2QS9wd0tLMUhwNXQyMGFL?=
 =?utf-8?B?YXpzbWlER1M2dm1XMTdwQWI0L1JGMXNiMWEvT2pyYm9nM3c0VjZETExhODgz?=
 =?utf-8?B?cWsvajdMMnorOTlvWDI1MHVoblk3eDljZXZ1R1B6eEF6SjcyTmh6SHF1RlBB?=
 =?utf-8?B?RVQycllQSUs1WTI0VGttTWRlRytwOER3bVBOVjkzODRiQW1jZVhtZnA4cjl6?=
 =?utf-8?B?ZEd4VlRRWGt3YnMwUk1aYk9aRmZkaExBRUVUQ2VRU0dubkQwc2RNVDAxMXZp?=
 =?utf-8?B?YVRBVDdlSTZJWHEyTHUrd09WZ0d6VndjYlZyYkhicE9DUnBuRVUrU1NHYzFP?=
 =?utf-8?B?SnoyNWszQjA0Smh4bnN1UXIvQUJlb0ZMZHdGQTYzMUYwdjg1dFQ3dElXTHpO?=
 =?utf-8?B?cjh5c3hXZFN5ZXh6OUZNSlh5Y1lpdTAxVGM4d1NBWGJycStZQzlrblFtcVVq?=
 =?utf-8?B?RFRRTzFLR3lnVDdCby8xTWF0Q1Nxdi9GOTBlUWp4ZVBEY0s4R1dTZXhqWmx6?=
 =?utf-8?B?WUlGN243bW1zUS96Z3o4cEFibDk1WGF6MDQ2eDBwUzdrekNlSmlkelVkdFR6?=
 =?utf-8?B?Ni84b3JNRndINEZ0bzMyNExJNG9IbFVRM2tMWm9iWUpDdytVOXpma0hnVUVV?=
 =?utf-8?B?WkZvcEFWaEp4Ni9adGpGMm5ZajIraHJwenc0R0NZNTlhcVdyN1hYWHNFbjVl?=
 =?utf-8?B?ZzVFQWdXK0dwYlRoYTEwOER3KzEwQnZtZGc2QmZOKzhOdnYybzNUQW9GdFhW?=
 =?utf-8?B?c3lMMzNJYUExZ0pDYVF4b0ZkTlVTZ1VmSDluZFBPc1duSTlXWFV5bG5UK2N3?=
 =?utf-8?B?aGROKy9NWUJzVWJoR2RlNGZwcnVSbldKK0ZoZ0JadjFLdHV5MU5HVWJ6VFZz?=
 =?utf-8?B?WEVzQVQ5YkYyM1RoWVZ1UC9UblhBT2xXNWhjRmtadnp6WnVQUTBTVUlHTVRt?=
 =?utf-8?B?dG9zZWtZQmp4SW1EdmZjcWVld0YvbERwajh6dVoxUCtsV2Y4OG9zUFdJUDZx?=
 =?utf-8?B?TTdpWEE5RHF6Z2gyRkJLZVc3UVp1UHdpV3JPN2Fla0UxeEZyZlo2VFd4Si95?=
 =?utf-8?B?RjRMNzZ5Mk1aSHRjS1o0Y0JYK21NaUt4dVRKRDg3TmZyVTdWT1U1WjVXV3pC?=
 =?utf-8?B?aHk2eCtZQ2kzNEVHL01ScE9vSDNESmdBeWZIMVR6ZkFFZzhwUmhRWVhDSE5u?=
 =?utf-8?B?NDh5cTRBeDR6TUFKaE14T1N0R2lWM3ZDSDZEQXp1bHJSTVR1TGQxVitDS0w5?=
 =?utf-8?B?ZklKa1E1bHFsaUtrVWxIVWtNZnI4SVZmdW0xY0ZJaDlxNHZMbG1NZEVXM1pu?=
 =?utf-8?B?Ykpjd0QyTzlRU0Ura1IyRFgwV0lWSEFneDhNMExyelcvYzFaaE1DYnFUTmtK?=
 =?utf-8?B?WHl6ZjZoME02RHM5OFZqUWk3ckd3MnE5SnhRaEJkWnRKTG9XZHQvaVpEUS9I?=
 =?utf-8?B?UFpLa01RVnVkNUFxd1ZpSGhyZEIzZ0F0OG9VZ0lpME5Id1dNK2s2ZUJQWmhX?=
 =?utf-8?Q?P/2ZnRJpZd7TIq9T3Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aptiv.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e26919a-5aef-48e6-e193-08d8e7bd2e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 14:18:18.2688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6b1311e5-123f-49db-acdf-8847c2d00bed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUomnoPqaB6+TPjKvB2L8gMjE1A0Vi/Ud0V0C76Bw8sxIhzoGtQiCkOzYCBdElLW7XP64hAZuy33abBM3wKGbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1P197MB0007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=962 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103150103
Received-SPF: pass client-ip=148.163.157.133;
 envelope-from=prvs=070844fc59=adam.olek@aptiv.com;
 helo=mx0a-00275a01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

VGhhbmsgeW91IGZvciB5b3VyIGFuc3dlciwgd2UgdW5kZXJzdGFuZCB0aGF0IGNvbXBhdGliaWxp
dHkgd2l0aCBhbGwgTGludXggdmVyc2lvbnMgaXMgYSBwcmlvcml0eSBmb3IgeW91Lg0KV2UgaGF2
ZSBzbWFsbCBob3BlIHRoYXQgdGhpcyBlbWFpbCB3aWxsIGhlbHAgb3RoZXIgUUVNVSB1c2VycyBp
biBzdHJ1Z2dsaW5nIHdpdGggUU5YIG9uIFFFTVUuDQoNClJlZ2FyZHMsDQpBZGFtIE9sZWsNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIE1heWRlbGwgW21haWx0bzpw
ZXRlci5tYXlkZWxsQGxpbmFyby5vcmddIA0KU2VudDogVGh1cnNkYXksIE1hcmNoIDExLCAyMDIx
IDg6MDcgUE0NClRvOiBPbGVrLCBBZGFtIDxhZGFtLm9sZWtAYXB0aXYuY29tPg0KQ2M6IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KU3ViamVjdDogRVhUIFNFTkRFUiAtIFJlOiBJTVggRkVDIG1vZGVs
LSBtb2RpZmljYXRpb24gaW4gaW50ZXJydXB0cw0KDQpPbiBUaHUsIDExIE1hciAyMDIxIGF0IDA5
OjI3LCBPbGVrLCBBZGFtIDxhZGFtLm9sZWtAYXB0aXYuY29tPiB3cm90ZToNCj4gV2UgaGF2ZSB0
cmllZCB0byB1cCBhbmQgcnVubmluZyBRTlggNy4wIG9uIFFFTVUgNS4yLjAgU2FicmVsaXRlIG1v
ZGVsLiBUaGUgUU5YIHJlYWNoIHRoZSBwcm9tcHQgYW5kIHdhcyByZXNwb25zaXZlIHRvIHVzZXIg
Y29tbWFuZC4NCj4gSG93ZXZlciwgc3RhcnRpbmcgdGhlIG5ldHdvcmsgY2F1c2VkIGEgUU5YIGZy
ZWV6ZS4gQWZ0ZXIgZGVidWdnaW5nIHRoZSBwcm9ibGVtIGF0IFFOWCBhbmQgUUVNVSBzaXRlcyB3
ZSBlbmQgdXAgd2l0aCBhIHNvbHV0aW9uIHdoaWNoIHJlcXVpcmVzIGEgc2xpZ2h0IFFFTVUgc291
cmNlIGNvZGUgbW9kaWZpY2F0aW9uLg0KPg0KPiBJdCBzZWVtIHRoYXQgdGhlIGh3L25ldC9pbXhf
ZmVjLmMgaXMgc291cmNlIG9mIHRoZSBwcm9ibGVtLiBUbyBmaXggdGhlIGlzc3VlIHdlIGNoYW5n
ZWQgdGhlIGNvbmRpdGlvbiBpbiBsaW5lIDQ0MiBmcm9tOg0KPg0KPiBpZiAocy0+cmVnc1tFTkVU
X0VJUl0gJiBzLT5yZWdzW0VORVRfRUlNUl0gJg0KPiAgICAgIChFTkVUX0lOVF9NQUMgfCBFTkVU
X0lOVF9UU19USU1FUikpIHsNCj4NCj4gdG86DQo+DQo+IGlmIChzLT5yZWdzW0VORVRfRUlSXSAm
IHMtPnJlZ3NbRU5FVF9FSU1SXSAmIEVORVRfSU5UX1RTX1RJTUVSKSB7DQoNCj4gQ2FuIGFueW9u
ZSB0YWtlIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyBjb25kaXRpb24gYW5kIGNvbmZpcm0gdGhhdCB0
aGlzIG1vZGlmaWNhdGlvbiBtYWtlIHNlbnNlIGFuZCBpdCBoYXNu4oCZdCBuZWdhdGl2ZSBpbXBh
Y3Qgb24gYW55dGhpbmcgZWxzZT8NCg0KVGhlcmUgaXMgYSBtYXNzaXZlIGNvbW1lbnQgaW1tZWRp
YXRlbHkgYmVmb3JlIHRoZXNlIGxpbmVzIG9mIGNvZGUgd2hpY2ggZXhwbGFpbnMgd2h5IGl0IGlz
IGRvaW5nIHdoYXQgaXQgaXMgZG9pbmcsIHdoYXQgd291bGQgc3RvcCB3b3JraW5nLCBhbmQgd2hh
dCBvdGhlciBmdW5jdGlvbmFsaXR5IGluIFFFTVUgbmVlZHMgdG8gYmUgaW1wbGVtZW50ZWQgaW4g
b3JkZXIgZm9yIHRoZSBoYWNrIHRvIGJlIHJlbW92ZWQuLi4NCg0KdGhhbmtzDQotLSBQTU0NCg==

