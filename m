Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91794F6620
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:05:12 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc95j-0007Sg-LG
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509556357b=pdel@fb.com>)
 id 1nc94F-0006Zn-PN; Wed, 06 Apr 2022 13:03:39 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:17836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=509556357b=pdel@fb.com>)
 id 1nc94D-0002Rc-I4; Wed, 06 Apr 2022 13:03:39 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 236FHocc010625;
 Wed, 6 Apr 2022 10:03:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=83hoOjgnt+qxLzxla4LZJagcGKBsEvqscH/qBxil+3o=;
 b=MIwuvAyN2ksnl+eTxI8Xrl4jBzuX+5AU7x6oJPniXxe3U4GH9lruuYSzEyh3kmO+2Tdw
 oW7WSH+Lyk+UpogUlKpEWcrRRiHRs2JRoDmK/8sxF8jJgTgLsHx8dosnFEOgmaYWhk4d
 QfiVKhHa9l8/s8D+UQWwD88DCAXr71+WWXc= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f90jrnb90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 10:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJigwDCqD7DHssScDuiPIcvVNYOT7d4RmLCRyyK0K0Mjla/T9sEiTDxKQuBSWjMobNO0G6Rj5AGiqTvdBuTwadu7q5dASDUct6oheHYkKRZ+1PD7xRHC0JdBjzL3+54N3N36HCEshgFiMvpO/3kham6iplDQd+ow60LEzI4uZbdUwa6f0dZKWvOX+ASdW6Ic0a742CB4Vmr76vfs3aZs5hp01X0P+0euQGCRiIuCgRg7G57Cz0xJp4xvYy7PzMzXUODxhCZhk2aALWVjCGEV3qpGaZv1Y0wZUaKAGPoNmPribS2YKD7TVki67oMsW4efh7yIRYx/ceixD2jxP5lUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83hoOjgnt+qxLzxla4LZJagcGKBsEvqscH/qBxil+3o=;
 b=ciIQGXEYwyiWTozc1wW6YlZhhz7QUDk5NT/QYAoMhQV+WSgRoLsgtAgZN3p4Y7CdokF+NppFFij+sQwhSSTEuTiTC3KRumVdD23o8x/zqDMx+hObi6w9XNyX2gWu8la9dCkvKf1pTMHgWWOoIoG3ml3+BiOIzxHYUVvgGtk6zjJOMrMP/x+wqhuOHPfIRGsjt6zpzxC/2TQV45chGe3/q+6G9J15gsA+qPXumD6zopdtzIwm25z41Bk5txYr/mETYOK7cqBExT8GP7JTc+LKij7hNqE+IOB25GCunUCk2zpEKKTnRST343rG03hatYplQ0fd+yY15Lh6bBYjlb4Adw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BLAPR15MB3842.namprd15.prod.outlook.com (2603:10b6:208:279::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 17:03:19 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::e145:753f:1240:6fc1%4]) with mapi id 15.20.5144.021; Wed, 6 Apr 2022
 17:03:19 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Arun Kumar Kashinath Agasar
 <arun.kka@samsung.com>, Corey Minyard <cminyard@mvista.com>, Andrew Jeffery
 <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Matt Johnston <matt@codeconstruct.com.au>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Topic: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Thread-Index: AQHYRSerTNcPCkQLM0iu4AURTxPSuqzh09OAgACbMoCAALcYAA==
Date: Wed, 6 Apr 2022 17:03:18 +0000
Message-ID: <3BBAF589-4650-4F12-8343-828210B78FB4@fb.com>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com> <Yk0uP2BHaOTBQDf2@apples>
In-Reply-To: <Yk0uP2BHaOTBQDf2@apples>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de49b9ef-a8c3-4ea9-b358-08da17ef596e
x-ms-traffictypediagnostic: BLAPR15MB3842:EE_
x-microsoft-antispam-prvs: <BLAPR15MB3842356D3E685818F70594D1ACE79@BLAPR15MB3842.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jXT26AQGnJE/rNJI0jlUvJhSdtfe4ASP+DJMcXBc6M0AeeBOmFVz7jO+B56wYGQvICpwRC9rPiw/1Wc1qnu0P8P9McUAle4bmaapfBbl+d2RBJ1IEPynyE0pU/yS6zKvJBdyfpTMRRl8z6FJijVn2OS1/nee7MaJ7gx1L88HeMD+jzgrAJVo+y8097fQ0e2h4YUSfC+Mb04p/IGbqqTTY4tM5SCcdgJrgCg4ckfogqx88nAOcp7hshHnhZdXCiu0EFEW5rvoqsu354lCB9BOkRFfzjdw+2GePSr7wskabex28d+PYDc6oEwKuxeydrst0cw81q5XUw6ZpqKmBYCWYc4Mj26f32LnKAeQj8wRSXyQ0WkN8m/RkMEk23Eesiw8LFGOzLvSSPBwCUgpjSG4gUD2EgEwz5BVlSAljbFaEEHaVyjiJ7XCouWox2hAmj2xj1J15AWr20AZ5qLD60Jy4k6T1IxBJvb95yqv/7jeNAZo/dcs1IiI5iFEt7rgiJZ/sXVUkoNkAbdcMH1rsdzWHjEGPWgceSzi6KcoTWwuaPjqtuU71T7KYsaqGSKQizA3qxhyJxl6htZE0FnPI1dl9bZiIwzFjV+sEvbGGBE6qlk/Bzq5ua2pDgZcgB+crBFoPtrOEQrw794xqwns/akX2CuE/WUWYAl386Z+3PL7AX4jwINWhr7PQAwr3nQU9IbCyMwUJf+xFUC3U0XU4nky3YHV3KL3liahjfRkaWRNrt4DcsB6xJ54IcfzVUyOZ6/VZ+yF0AdSf1/f46KIIOfs9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(66446008)(66476007)(76116006)(66556008)(316002)(6916009)(54906003)(38100700002)(66946007)(86362001)(122000001)(6486002)(8676002)(7416002)(508600001)(8936002)(5660300002)(71200400001)(83380400001)(2616005)(33656002)(2906002)(6512007)(36756003)(186003)(53546011)(6506007)(38070700005)(4326008)(45980500001)(505234007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1lOTFFwUlNiWHp0dFd5VS91K1ZDK3VYUFBUUkx0L1E0a2F2R0tWSGlMR0N1?=
 =?utf-8?B?a29HVzRMU251ZUkvZHB1a3l5b0NaK1VJK3ZCdm9BTHFSTUZZMmxiWEJ1anNU?=
 =?utf-8?B?UmVVWU9uNEhaNUhkUjNPMSt6c2RJSmNMQm05Q2prVEhWSVY4Uitick9leGJN?=
 =?utf-8?B?bEdUSVFEN0UxL0YxTnJqdmtmQ3hHUzhENGduMEJYakJQY0Vra1gwMVNCVkRh?=
 =?utf-8?B?RGlVOVhHWEhybEI2S01pckx5Zmd2MWJkRUl4ZEtLTmkxakQxRnNKMzNRMHRM?=
 =?utf-8?B?WFQ0dnhIM3VncytHaThzeEtwUkRUbjBWMTNZdFlJTGFzQVFFTElPb3lvRHVh?=
 =?utf-8?B?UnVRcnZxRktrQzR0VlZ6NkJpbzF4cWRNSi9CdkNuSThWLzlOTDNnOExvTUZO?=
 =?utf-8?B?eTdDcGFkRjlCb3kzUFUrTkxVQ1VqckJyeTU4bEZhTmkybys1U1N0Q0twbU01?=
 =?utf-8?B?QTNOZGx6dEFRd3Y5ZTh1THZWZ0RaVW5jVVMwVmR0Sm1vZURCN25iQThZd1BT?=
 =?utf-8?B?UnpYUklhWDgwcjU4b2t4MDlsRlNXNUt6UTZ0RUFaQ3ZqK1N5M09rYVpDcDRp?=
 =?utf-8?B?cTJsdjd2a2hIR1p4d2UzbkhQeEpUV29sVlRXdSsrZGt0cm14RmpGNjNmNXFp?=
 =?utf-8?B?eEpxYysvRUFVYzVTUXMzQjFaeVhYZUhaTXNwajN2YUYxNitaaldtajBIQ2Yr?=
 =?utf-8?B?WHUxdnMrNFh0M1JITi9UVG5vVDhRKzJFeW4zMURqZ2JrbElUcGN1alZKMHNF?=
 =?utf-8?B?Tjd5M0dXUXI5ajJKMEp5Tm1LQlorM0ZHY0VkSTFWZVlpc09uend0Z0FydEJT?=
 =?utf-8?B?MGpBQ2p5RHl5Z1VwWkhRY0MxS0JTbS9IeXJVQkxlQkUxc0FGZVZ5MC9JalFE?=
 =?utf-8?B?S3htbmZFQVBRUnQzN0N2emIxYWkzb2dNWGZObVpGUWYxRXJaR1BpOVREWVBV?=
 =?utf-8?B?eTJBM0pDcU80YXY0RVVueEpyTGtQa0VaK1BQRXVnRXE5V3VUVkFuNThnbEhX?=
 =?utf-8?B?US9zbGxVWU5sSlVNdHNzZW56ZlpIMjVTMEwvS3ZWS3Y5dktwaGVwUWthNzVs?=
 =?utf-8?B?OEljWTIxeFdZMTI0UG5QSWNuV1FPYlFTcGdIMHljZzBwNWk0a1NaVE4vaG9P?=
 =?utf-8?B?MVpNMG5ycG1yU2NFeHhza2huSm90VkFNSlFpTlJiWWU3bVIva2pZMG1jK1I5?=
 =?utf-8?B?NWJjbHp2aFBoeUh1T1d5aTdlK2ZXZUdVaHRvSHN6bHJoVytiSkR3VklkOHJw?=
 =?utf-8?B?M2FWWkFnWHdIOUd6THBTNExFYk81Q0hwZUV5SllZTUxZQTRUdGRIajV4NEd0?=
 =?utf-8?B?OTdtam1jdUR4SEZ4SXpIVE9Cc3BwSm9QTE9FbW1wVVpSeGsyTzREcFRlbEd6?=
 =?utf-8?B?a2YyeGk4UHhnWHA3NS9mUnRDVlcwSkJ3RGR3N0NFOHl3Q25sdGxoNy9naFYv?=
 =?utf-8?B?Q1hmU3haeWNxbyt5c2tSZEp6K2dUWXVuWkNOMmEwMzlMUm1qM3lhS0NWV0Q4?=
 =?utf-8?B?b3F0dEFzV1YrTW1NRUVZdXU2QzRiUSttT2hjcHFlSnVvVjM0S1pUQXpzcFlV?=
 =?utf-8?B?d3ZHS2tTRTVzYm9iQ0prcXkxRnA1RFB6R0t5Z3pWTVBDVXJkSy9FMUlqcWZs?=
 =?utf-8?B?NDFSY0FCM0Z1MCtWRlk5WllDa3RRRVhIWFJyUWgwMWhQd3VSbDdjMFR5VTlj?=
 =?utf-8?B?alBubURKd1hpNEVRYXptUm9oUVN1VlhMVVo4SkNnQ2VkbTVYZ3dDVmxyRjZL?=
 =?utf-8?B?RHdBRWh0NUREQXFYMjRlUWU2VnhvaS9ndTQvM0sycHJjSGJTTjJUbmFCV2hS?=
 =?utf-8?B?allxMVJ4ZG5PblNXUjNFVzVYbU13Nm5Gbjl5MUZUdjVDeFF0NE9KTjV2N1lr?=
 =?utf-8?B?am5vL0tQM0Nmbnp1U2VCNmROYmF1WW8wa2swQXVWelMwOHRHWU82bW5IaHhY?=
 =?utf-8?B?UWpUcEV6UnB6KzBBRFRQaWhsYllucHMxbTEzMnBNU1plWUpWWjArRlVMWEhu?=
 =?utf-8?B?SGZzZ1QrOHYzWnJlWmh0SDc1dTJVc2VtRjVKbkVremdFNUZ6S3QzUjJUemsv?=
 =?utf-8?B?OHhrWEdnRmVjak9aMlJneU9lejdiTlAxK0QrY0gwS0ptdjVIelAySTB6SExN?=
 =?utf-8?B?ZnpGOTR2dGlRTmY2SXdlamhhMStrMFFXeW5DWGMxK2VYTnFGemhEWmpRV1k3?=
 =?utf-8?B?dXFuOEpHRWk3VmVzRUxBSWUzcDdOazh2czcxUVl2Q09jNXhFclpsN1VNK0N2?=
 =?utf-8?B?b0pIY0xsanJNbHZnRkE3NVhoeklUNGxUNXlLeVl4c2JTZlcxcHFrOGN5aWNC?=
 =?utf-8?B?M0JzR0MvaHFqbFRBd1ZmMzBZN3dKREZWcWltSXc4blpzNkRheUVZOGhXeFQv?=
 =?utf-8?Q?1+ujdgy97MpRp9sU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC20137B903ED74DB71E1A037755173B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de49b9ef-a8c3-4ea9-b358-08da17ef596e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 17:03:19.0146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mfr+UqRzGMvN9kKG1UUiruc5iLEvDGH1sVQIV+7GcJwmfW37eqdtAtJOb9uHwguW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR15MB3842
X-Proofpoint-GUID: B3539UlknSeMjo9btOhRPwuskmB9NwI_
X-Proofpoint-ORIG-GUID: B3539UlknSeMjo9btOhRPwuskmB9NwI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_09,2022-04-06_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=509556357b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gQXByIDUsIDIwMjIsIGF0IDExOjA3IFBNLCBLbGF1cyBKZW5zZW4gPGl0c0BpcnJl
bGV2YW50LmRrPiB3cm90ZToNCj4gDQo+IE9uIEFwciA1IDIwOjUyLCBQZXRlciBEZWxldm9yeWFz
IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBNYXIgMzEsIDIwMjIsIGF0IDk6NTcgQU0sIEtsYXVz
IEplbnNlbiA8aXRzQGlycmVsZXZhbnQuZGs+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206IEtsYXVz
IEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+Pj4gDQo+Pj4gSGkgYWxsLA0KPj4+IA0K
Pj4+IFRoaXMgUkZDIHNlcmllcyBhZGRzIEkyQyAic2xhdmUgbW9kZSIgc3VwcG9ydCBmb3IgdGhl
IEFzcGVlZCBJMkMNCj4+PiBjb250cm9sbGVyIGFzIHdlbGwgYXMgdGhlIG5lY2Vzc2FyeSBpbmZy
YXN0cnVjdHVyZSBpbiB0aGUgaTJjIGNvcmUgdG8NCj4+PiBzdXBwb3J0IHRoaXMuDQo+Pj4gDQo+
Pj4gQmFja2dyb3VuZA0KPj4+IH5+fn5+fn5+fn4NCj4+PiBXZSBhcmUgd29ya2luZyBvbiBhbiBl
bXVsYXRlZCBOVk0gRXhwcmVzcyBNYW5hZ2VtZW50IEludGVyZmFjZVsxXSBmb3INCj4+PiB0ZXN0
aW5nIGFuZCB2YWxpZGF0aW9uIHB1cnBvc2VzLiBOVk1lLU1JIGlzIGJhc2VkIG9uIHRoZSBNQ1RQ
DQo+Pj4gcHJvdG9jb2xbMl0gd2hpY2ggbWF5IHVzZSBhIHZhcmlldHkgb2YgdW5kZXJseWluZyB0
cmFuc3BvcnRzLiBUaGUgb25lIHdlDQo+Pj4gYXJlIGludGVyZXN0ZWQgaW4gaXMgSTJDWzNdLg0K
Pj4+IA0KPj4+IFRoZSBmaXJzdCBnZW5lcmFsIHRyaWNrZXJ5IGhlcmUgaXMgdGhhdCBhbGwgTUNU
UCB0cmFuc2FjdGlvbnMgYXJlIGJhc2VkDQo+Pj4gb24gdGhlIFNNQnVzIEJsb2NrIFdyaXRlIGJ1
cyBwcm90b2NvbFs0XS4gVGhpcyBtZWFucyB0aGF0IHRoZSBzbGF2ZSBtdXN0DQo+Pj4gYmUgYWJs
ZSB0byBtYXN0ZXIgdGhlIGJ1cyB0byBjb21tdW5pY2F0ZS4gQXMgeW91IGtub3csIGh3L2kyYy9j
b3JlLmMNCj4+PiBjdXJyZW50bHkgZG9lcyBub3Qgc3VwcG9ydCB0aGlzIHVzZSBjYXNlLg0KPj4g
DQo+PiBUaGlzIGlzIGdyZWF0LCBJ4oCZbSBhdHRlbXB0aW5nIHRvIHVzZSB5b3VyIGNoYW5nZXMg
cmlnaHQgbm93IGZvciB0aGUgc2FtZSB0aGluZyAoTUNUUCkuDQo+PiANCj4gDQo+IEF3ZXNvbWUh
DQo+IA0KPj4+IA0KPj4+IFRoZSBzZWNvbmQgaXNzdWUgaXMgaG93IHRvIGludGVyYWN0IHdpdGgg
dGhlc2UgbWFzdGVyaW5nIGRldmljZXMuIEplcmVteQ0KPj4+IGFuZCBNYXR0IChDQydlZCkgaGF2
ZSBiZWVuIHdvcmtpbmcgb24gYW4gTUNUUCBzdGFjayBmb3IgdGhlIExpbnV4IEtlcm5lbA0KPj4+
IChhbHJlYWR5IHVwc3RyZWFtKSBhbmQgYW4gSTJDIGJpbmRpbmcgZHJpdmVyWzVdIGlzIGN1cnJl
bnRseSB1bmRlcg0KPj4+IHJldmlldy4gVGhpcyBiaW5kaW5nIGRyaXZlciByZWxpZXMgb24gSTJD
IHNsYXZlIG1vZGUgc3VwcG9ydCBpbiB0aGUgSTJDDQo+Pj4gY29udHJvbGxlci4NCj4+PiANCj4+
PiBUaGlzIHNlcmllcw0KPj4+IH5+fn5+fn5+fn5+DQo+Pj4gUGF0Y2ggMSBhZGRzIHN1cHBvcnQg
Zm9yIG11bHRpcGxlIG1hc3RlcnMgaW4gdGhlIGkyYyBjb3JlLCBhbGxvd2luZw0KPj4+IHNsYXZl
cyB0byBtYXN0ZXIgdGhlIGJ1cyBhbmQgc2FmZWx5IGlzc3VlIGkyY19zZW5kL3JlY3YoKS4gUGF0
Y2ggMiBhZGRzDQo+Pj4gYW4gYXN5bmNocm9ub3VzIHNlbmQgaTJjX3NlbmRfYXN5bmMoSTJDQnVz
ICosIHVpbnQ4KSBvbiB0aGUgYnVzIHRoYXQNCj4+PiBtdXN0IGJlIHBhaXJlZCB3aXRoIGFuIGV4
cGxpY2l0IGFjayB1c2luZyBpMmNfYWNrKEkyQ0J1cyAqKS4NCj4+PiANCj4+PiBQYXRjaCAzIGFk
ZHMgdGhlIHNsYXZlIG1vZGUgZnVuY3Rpb25hbGl0eSB0byB0aGUgZW11bGF0ZWQgQXNwZWVkIEky
Qw0KPj4+IGNvbnRyb2xsZXIuIFRoZSBpbXBsZW1lbnRhdGlvbiBpcyBwcm9iYWJseSBidWdneSBz
aW5jZSBJIGhhZCB0byByZWx5IG9uDQo+Pj4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBrZXJu
ZWwgZHJpdmVyIHRvIHJldmVyc2UgZW5naW5lZXIgdGhlIGJlaGF2aW9yDQo+Pj4gb2YgdGhlIGNv
bnRyb2xsZXIgc2xhdmUgbW9kZSAoSSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gYSBzcGVjIHNoZWV0
IGZvcg0KPj4+IHRoZSBBc3BlZWQsIGJ1dCBtYXliZSBzb21lb25lIGNhbiBoZWxwIG1lIG91dCB3
aXRoIHRoYXQ/KS4NCj4+PiANCj4+PiBGaW5hbGx5LCBwYXRjaCA0IGFkZHMgYW4gZXhhbXBsZSBk
ZXZpY2UgdXNpbmcgdGhpcyBuZXcgQVBJLiBUaGUgZGV2aWNlDQo+Pj4gaXMgYSBzaW1wbGUgImVj
aG8iIGRldmljZSB0aGF0IHVwb24gYmVpbmcgc2VudCBhIHNldCBvZiBieXRlcyB1c2VzIHRoZQ0K
Pj4+IGZpcnN0IGJ5dGUgYXMgdGhlIGFkZHJlc3Mgb2YgdGhlIHNsYXZlIHRvIGVjaG8gdG8uDQo+
Pj4gDQo+Pj4gV2l0aCB0aGlzIGNvbWJpbmVkIEkgYW0gYWJsZSB0byBib290IHVwIExpbnV4IG9u
IGFuIGVtdWxhdGVkIEFzcGVlZCAyNjAwDQo+Pj4gZXZhbHVhdGlvbiBib2FyZCBhbmQgaGF2ZSB0
aGUgaTJjIGVjaG8gZGV2aWNlIHdyaXRlIGludG8gYSBMaW51eCBzbGF2ZQ0KPj4+IEVFUFJPTS4g
QXNzdW1pbmcgdGhlIGVjaG8gZGV2aWNlIGlzIG9uIGFkZHJlc3MgMHg0MjoNCj4+PiANCj4+PiAj
IGVjaG8gc2xhdmUtMjRjMDIgMHgxMDY0ID4gL3N5cy9idXMvaTJjL2RldmljZXMvaTJjLTE1L25l
d19kZXZpY2UNCj4+PiBpMmMgaTJjLTE1OiBuZXdfZGV2aWNlOiBJbnN0YW50aWF0ZWQgZGV2aWNl
IHNsYXZlLTI0YzAyIGF0IDB4NjQNCj4+PiAjIGkyY3NldCAteSAxNSAweDQyIDB4NjQgMHgwMCAw
eGFhIGkNCj4+PiAjIGhleGR1bXAgL3N5cy9idXMvaTJjL2RldmljZXMvMTUtMTA2NC9zbGF2ZS1l
ZXByb20NCj4+PiAwMDAwMDAwIGZmYWEgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZm
Zg0KPj4+IDAwMDAwMTAgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmDQo+
Pj4gKg0KPj4+IDAwMDAxMDANCj4+IA0KPj4gV2hlbiBJIHRyeSB0aGlzIHdpdGggbXkgc3lzdGVt
LCBpdCBzZWVtcyBsaWtlIHRoZSBpMmMtZWNobyBkZXZpY2UgdGFrZXMgb3Zlcg0KPj4gdGhlIGJ1
cyBidXQgbmV2ZXIgZWNob2VzIHRoZSBkYXRhIHRvIHRoZSBFRVBST00uIEFtIEkgbWlzc2luZyBz
b21ldGhpbmcgdG8NCj4+IG1ha2UgdGhpcyB3b3JrPyBJdCBzZWVtcyBsaWtlIHRoZSDigJxpMmNf
c2VuZF9hc3luY+KAnSBjYWxscyBhcmVu4oCZdCBoYXBwZW5pbmcsDQo+PiB3aGljaCBtdXN0IGJl
IGJlY2F1c2UgdGhlIGJvdHRvbSBoYWxmIGlzbuKAmXQgYmVpbmcgc2NoZWR1bGVkLCByaWdodD8g
QWZ0ZXINCj4+IHRoZSBpMmNfZG9fc3RhcnRfdHJhbnNmZXIsIGhvdyBpcyB0aGUgYm90dG9tIGhh
bGYgc3VwcG9zZWQgdG8gYmUgc2NoZWR1bGVkDQo+PiBhZ2Fpbj8gSXMgdGhlIHNsYXZlIHJlY2Vp
dmluZyAodGhlIEVFUFJPTSkgc3VwcG9zZWQgdG8gY2FsbCBpMmNfYWNrIG9yIHNvbWV0aGluZz8N
Cj4+IA0KPj4gcm9vdEBibWMtb29iOn4jIGVjaG8gMjRjMDIgMHgxMDY0ID4gL3N5cy9idXMvaTJj
L2RldmljZXMvaTJjLTgvbmV3X2RldmljZQ0KPj4gWyAxMzUuNTU5NzE5XSBhdDI0IDgtMTA2NDog
MjU2IGJ5dGUgMjRjMDIgRUVQUk9NLCB3cml0YWJsZSwgMSBieXRlcy93cml0ZQ0KPj4gWyAxMzUu
NTYyNjYxXSBpMmMgaTJjLTg6IG5ld19kZXZpY2U6IEluc3RhbnRpYXRlZCBkZXZpY2UgMjRjMDIg
YXQgMHg2NA0KPj4gcm9vdEBibWMtb29iOn4jIGkyY3NldCAteSA4IDB4NDIgMHg2NCAweDAwIDB4
YWEgaQ0KPj4gaTJjX2VjaG9fZXZlbnQ6IHN0YXJ0IHNlbmQNCj4+IGkyY19lY2hvX3NlbmQ6IGRh
dGFbMF0gPSAweDY0DQo+PiBpMmNfZWNob19zZW5kOiBkYXRhWzFdID0gMHgwMA0KPj4gaTJjX2Vj
aG9fc2VuZDogZGF0YVsyXSA9IDB4YWENCj4+IGkyY19lY2hvX2V2ZW50OiBzY2hlZHVsaW5nIGJv
dHRvbS1oYWxmDQo+PiBpMmNfZWNob19iaDogYXR0ZW1wdGluZyB0byBnYWluIG1hc3Rlcnkgb2Yg
YnVzDQo+PiBpMmNfZWNob19iaDogc3RhcnRpbmcgYSBzZW5kIHRvIGFkZHJlc3MgMHg2NA0KPj4g
cm9vdEBibWMtb29iOn4jIGhleGR1bXAgLUMgL3N5cy9idXMvaTJjL2RldmljZXMvOC0xMDY0L2Vl
cHJvbQ0KPj4gMDAwMDAwMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgfC4uLi4uLi4uLi4uLi4uLi58DQo+PiAqDQo+PiAwMDAwMDEwMA0KPj4gDQo+PiBU
aGFua3MgYWdhaW4gZm9yIHRoaXMsIGl04oCZcyBleGFjdGx5IHdoYXQgSSBuZWVkZWQuDQo+PiAN
Cj4gDQo+IEhtbW0uIFRoZSBvbmx5IG9idmlvdXMgZGlmZmVyZW5jZSBJIHNlZSBoZXJlIGlzIHRo
YXQgSSB3cml0ZQ0KPiAic2xhdmUtMjRjMDIiIGFuZCBub3QganVzdCAiMjRjMDIiIHRvIG5ld19k
ZXZpY2UuIE5vdCBzdXJlIGlmIHRoYXQgaGFzDQo+IGFueSBpbXBsaWNhdGlvbnM/IEFsc28sIGxv
b2tzIGxpa2UgeW91ciBFRVBST00gaXMgaW5pdGlhbGl6ZWQgd2l0aA0KPiB6ZXJvZXMsIG1pbmUg
aXMgYWxsIG9uZXMuIFRoaXMgaGludHMgYXQgdGhlIGRldmljZSBiZWluZyBpbnN0YW50aWF0ZWQg
aXMNCj4gZGlmZmVyZW50LiBJJ20gYWxzbyBub3Qgc2VlaW5nIHRoZSAnYXQyNCcsIHdoaWNoIHVw
b24gbG9va2luZyBpbiB0aGUNCj4ga2VybmVsIGNvZGUgaXMgYSBkaWZmZXJlbnQgZGV2aWNlPw0K
DQpBcmUgeW91IGxldHRpbmcgdGhlIGtlcm5lbCBjb250cm9sIHRoZSBFRVBST00/DQoNCklmIEkg
YWN0dWFsbHkgbGV0IHRoZSBrZXJuZWwgY29udHJvbCBpdCwgdGhlbiBJIGNhbuKAmXQgdXNlIGky
Y3NldCwgYmVjYXVzZQ0KdGhlIGtlcm5lbCBzZWVtcyB0byBiZSBrZWVwaW5nIHRoZSBidXMgYnVz
eS9ldGMuIEkgdHJpZWQgaTJjIGJ1cyA5IHRoaXMgdGltZS4NCg0Kcm9vdEBibWMtb29iOn4jIGky
Y3NldCAteSA5IDB4NjQgMHgwMCAweGFhIGkNCkVycm9yOiBDb3VsZCBub3Qgc2V0IGFkZHJlc3Mg
dG8gMHg2NDogRGV2aWNlIG9yIHJlc291cmNlIGJ1c3kNCg0KSG93ZXZlciwgaWYgSSBkb27igJl0
IGluc3RhbnRpYXRlIGEga2VybmVsIGRldmljZSwgYW5kIEkganVzdCB1c2UgaTJjc2V0L2kyY2dl
dCwNCkkgY2FuIGNvbnRyb2wgdGhlIEVFUFJPTToNCg0Kcm9vdEBibWMtb29iOn4jIGkyY3NldCAt
eSA5IDB4NjQgMHgwMCAweGNjIGkNCnJvb3RAYm1jLW9vYjp+IyBpMmNnZXQgLXkgOSAweDY0IDB4
MDAgaQ0KMHhjYyAweGI5IDB4NGQgMHhlMSAweDQyIDB4NTYgMHgwMCAweDAwIDB4YzUgMHg1YiAw
eDI4IDB4ZTEgMHg0MiAweDU2IDB4MDAgMHgwMCAweDAwIDB4NjEgMHgxMyAweGUyIDB4NDIgMHg1
NiAweDAwIDB4MDAgMHhiNyAweDY0IDB4MjggMHhlMSAweDQyDQogMHg1NiAweDAwIDB4MDANCg0K
VW5mb3J0dW5hdGVseSwgaTJjLWVjaG8gc3RpbGwgZG9lc27igJl0IHNlZW0gdG8gc2VuZCBpdHMg
ZGF0YToNCg0Kcm9vdEBibWMtb29iOn4jIGkyY3NldCAteSA5IDB4NDIgMHg2NCAweDAwIDB4YWEg
aQ0KaTJjX2VjaG9fZXZlbnQ6IHN0YXJ0IHNlbmQNCmkyY19lY2hvX3NlbmQ6IGRhdGFbMF0gPSAw
eDY0DQppMmNfZWNob19zZW5kOiBkYXRhWzFdID0gMHgwMA0KaTJjX2VjaG9fc2VuZDogZGF0YVsy
XSA9IDB4YWENCmkyY19lY2hvX2V2ZW50OiBzY2hlZHVsaW5nIGJvdHRvbS1oYWxmDQppMmNfZWNo
b19iaDogYXR0ZW1wdGluZyB0byBnYWluIG1hc3Rlcnkgb2YgYnVzDQppMmNfZWNob19iaDogc3Rh
cnRpbmcgYSBzZW5kIHRvIGFkZHJlc3MgMHg2NA0KDQpXaGF0IGlzIHRoZSBleGFjdCBzZXF1ZW5j
ZSBvZiBldmVudHMgb25jZSBpMmMtZWNobw0Kc3RhcnRzIGEgbmV3IHRyYW5zZmVyPyBEb2VzIHRo
ZSBzbGF2ZSBkZXZpY2UgQUNLDQp0aGUgc3RhcnQsIG9yIGRvZXMgaXQganVzdCB3YWl0IGZvciBk
YXRhIHRvIGJlIHNlbnQ/DQoNCkFuZCB0aGVuIGlmIEkgdHJ5IHRvIHJlYWQgdGhlIEVFUFJPTToN
Cg0Kcm9vdEBibWMtb29iOn4jIGkyY2dldCAteSA5IDB4NjQgMHgwMCBpDQpzbWJ1czogZXJyb3I6
IFVuZXhwZWN0ZWQgc2VuZCBzdGFydCBjb25kaXRpb24gaW4gc3RhdGUgMQ0Kc21idXM6IGVycm9y
OiBVbmV4cGVjdGVkIHdyaXRlIGluIHN0YXRlIC0xDQpzbWJ1czogZXJyb3I6IFVuZXhwZWN0ZWQg
cmVjdiBzdGFydCBjb25kaXRpb24gaW4gc3RhdGUgLTENCnNtYnVzOiBlcnJvcjogVW5leHBlY3Rl
ZCByZWFkIGluIHN0YXRlIC0xDQpzbWJ1czogZXJyb3I6IFVuZXhwZWN0ZWQgcmVhZCBpbiBzdGF0
ZSAtMQ0Kc21idXM6IGVycm9yOiBVbmV4cGVjdGVkIHJlYWQgaW4gc3RhdGUgLTENCg0KSeKAmWxs
IHRyeSBkZWJ1Z2dpbmcvcmVmYWN0b3JpbmcgZnVydGhlciB0byBzZWUgd2h5IGl04oCZcyBub3Qg
d29ya2luZy4NCg0KQnkgdGhlIHdheSwgdGhpcyBpcyBteSBpMmNfaW5pdCBjb2RlIGluIFFFTVUg
dG8gZW5zdXJlDQphIFFFTVUgRUVQUk9NIG1vZGVsIGlzIHByZXNlbnQ6DQoNCnN0YXRpYyB2b2lk
IGZieTM1X2kyY19pbml0KEFzcGVlZE1hY2hpbmVTdGF0ZSAqYm1jKQ0Kew0KICAgIEkyQ0J1cyAq
aTJjWzE2XTsNCg0KICAgIGZvciAoaW50IGkgPSAwOyBpIDwgMTY7IGkrKykgew0KICAgICAgICBp
MmNbaV0gPSBhc3BlZWRfaTJjX2dldF9idXMoJmJtYy0+c29jLmkyYywgaSk7DQogICAgICAgIGFz
c2VydChpMmNbaV0gIT0gTlVMTCk7DQogICAgfQ0KDQogICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1w
bGUoaTJjWzldLCAiaTJjLWVjaG8iLCAweDQyKTsNCiAgICB1aW50OF90IGJ1ZlsyNTZdID0gezB4
ZmZ9Ow0KICAgIHNtYnVzX2VlcHJvbV9pbml0X29uZShpMmNbOV0sIDB4NjQsIGJ1Zik7DQp9DQoN
ClRoaXMgaXMgYW4gQVNUMjYwMC1iYXNlZCBib2FyZCB0b28uDQoNCg==

