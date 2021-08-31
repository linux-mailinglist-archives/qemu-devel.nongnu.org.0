Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598A3FC972
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4W1-00061w-9F
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL4QH-0005oS-9i; Tue, 31 Aug 2021 10:07:33 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:54087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL4QE-000848-Mj; Tue, 31 Aug 2021 10:07:32 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VE0evw010569; Tue, 31 Aug 2021 07:07:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HA8vgON78wua0CWSvOydZDD12ztM80O2LLTPzMAytNs=;
 b=JKffpaTbt7igR+P33rcAhjaqPNx344J/3DW+f1+ApmWHYhykOKF5pwvHkrG256VVRLPA
 gaKqcWiMB5juH7+QRwQyKwKccATK6/oqG4M1QT5zcChCPdZwgZVSxWsCb75xcgkO8mmp
 B2RPqObMhVnpS0+0xNjYyYF/t9v3I9ydRT8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3aryp99037-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Aug 2021 07:07:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 07:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fz5rjZFQaI2mhZW5Ccea+bGyre3xF+FN6u2RC9GOFTeXo9b8t6NM8WlmY44eYGDyb0/65LNqaIon9IzcN5dcdnOhe1TpWuw8ktFvyhOL3CF/33lglUHsdv/L0mIT2vYjjhfLPRxOSZArTNKiVmI1ff+AXuN2LRANK3707cnpdgD7s4GKmN+dKMBvFVB8IHOA101bMv0fDFeOTlNmYzFBA24LOOjQBQGfUrWFJ2YnWaFbmXdSTfkk5eie/ycCtdAVVVxrl6qLiUwflTPMj1gvN5Z4wZbA6nSf/K/jVcLuaGj1RywHMGSlrA8QJfte5EQOF2+ez9cO+tzSlRjP0QnPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA8vgON78wua0CWSvOydZDD12ztM80O2LLTPzMAytNs=;
 b=ELLSDiuJOX+0ti6W2aBCxPiFbIZy8PXLe24UQfnNyFaxG32NuEHPUz37yWWIOpQFYUDxcr6VGgRClFEj33z42u7HgwOOZN1Zvtm+KXV4Liaw3hVJec0EDgd3D7NcfbjJSPM0gjLlqSeMMj/KgpBzjT4qOzC5BZ39kxMsyhFnh96/ZAIuEuoL3bg/SXqroDuNdrnFyhvbFvJUxyhCOElBpfkxkU7JQAKj9FfZjm24QTWfiQ27SsjC/effXr7EkpD3aJ1n+JB3UH5HzbAk4NtsQmKVisgUfqO6aj3smTiiDGVmMo5rlLc6Mdtm8Onu2/MiNUtByGoI5zh3Nrgw59l2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4648.namprd15.prod.outlook.com (2603:10b6:a03:37d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 14:07:14 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 14:07:14 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "Cameron
 Esfahani via" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Topic: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Index: AQHXm4dh466/7b8SHEitTznuegJn+auIlZeAgAByzN2ABGmjgIAADBMAgAAkuICAAAkegA==
Date: Tue, 31 Aug 2021 14:07:13 +0000
Message-ID: <1B01A3F5-1D6A-4976-B7C1-A4AD3259CB1C@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
 <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
 <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
In-Reply-To: <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb50e4bf-d72e-40cd-0363-08d96c88a22f
x-ms-traffictypediagnostic: SJ0PR15MB4648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB464811357176167FC4BE0CC6ACCC9@SJ0PR15MB4648.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2M3gAtRhTvsk4utFXdDXLjsQHIuFlHzYkTmd1su4OkEFKNUB9d30zNVaTmMU3N02eBKSX18YG7hHderbOUwqVP6gXGQ/hMQZlxBi/JBNJiqPbt6bN5o3tINKJKiRS7+fQzCtWdiwKXuwDF/WFd2zF3SdMo8CUhQjR7+SvHSJx+csLVxFTEO9bRzHXGOuGFmETBquLCy0WhdoVO0bC6Q84ysOjs8AG77XYsEJwSUx5Ur56cmsHskOnBT0gbx5Fr14JRpdZQRvyLt/FC9tUbS4SWdjHlgWjNR8vQaU0t1Gn1aU57hCbYUx9nPdSxF+QTR9vjdDqdMLdkJxaf3hgyFJj99/ZKzJOtHrkoHj7H8xI5m5jIA01QCbesO8uINWFbcmZtqqJSE2Tu/l7O0KvsC2RNXbUT9nOIwvaTsbvg3DncsTsyb0UCDc2AzqOxmcn4NiWd5XQIDEDhynZYtW2+HW1LKhVErn6uXUV8OgIW+cnWv3kSVNH39yZFqaxciNym5+KpKj4sx0Mn1KtWC6wAilAfEPoioSQKWYjcYxWkAtUVG7UImMuC2h2n3hIDXDctxo5Go4+r+oOoJqv6qJnBrnsz/Nm+UyGdngcK1irEmWPPmoP24kGSnP0jKUmRRqu3XVw0+K5uON5l/j8wDg6O/p3MsMkYwIDhIE4bGPdAofK2LEVjxkvuMe4ZgpVwXjAx3XBnw5rtKCePM590Q8tHKYiSYjcV6u+NMOmSqHV5plA8G1UNsDVFBLgS8cxKDGIkgk43f6CIvlOqloQtdpQqRPPYXjmcOrVyk3YybUhwoO7s8PCjy5rzU2CiCzczstAWebfdXXyz0JYSqH4qW4rVwRGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8936002)(86362001)(66946007)(54906003)(71200400001)(6506007)(38100700002)(2616005)(33656002)(122000001)(4326008)(53546011)(66476007)(76116006)(36756003)(66446008)(5660300002)(66556008)(64756008)(966005)(316002)(38070700005)(6486002)(6512007)(8676002)(186003)(6916009)(478600001)(2906002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVQyTC83R2tDWGFReFVRYXg1amRncWpqRDZCTXdjN0JlT2hWWmxmVlhXRlZX?=
 =?utf-8?B?Vk9JMFNhSkhzRnowUS9DZVBTSHlKdzZYeTlGM2NQdWh3Rk9pU05WNkMrM2hM?=
 =?utf-8?B?VVNXRVJwL0tPSjBEOXRoa3gra1h2dC9CYzFPZmgvd3k5STQwa1FWcDNTcVFL?=
 =?utf-8?B?dVRmRFpFdzZSVGRkZ2FaTEF6NDMrb2NocWFhdGtQK2ttMjNEdmEyQit3U2t5?=
 =?utf-8?B?NzdNczRRc2MvdE9qNG5Bd3AwYm1Mb0orY0dEMENWL1VieURLMjRvNkhYdXR0?=
 =?utf-8?B?c2twbERWaWpKdmpwQmQrcXNGbnVMTlNqVkNWUHROQ04ra0ZFZUp5TWNsLzVY?=
 =?utf-8?B?V3RnQ1BTVkFXVEVhRXJldnRUOFk0RU9wWWkzTURISmRQZGVYcVdkTFpWYWxq?=
 =?utf-8?B?VUc5Z2RwS0tPRXQvMUJLUVpiM0FmaFVPakp2clRvUWFZS2NUT3RZVlhDTXJH?=
 =?utf-8?B?UU14OVZ5U1loMnBMS3hlTjJqRGo3akIrRlMyZXk4N2IyK2VkU3RMZmVxVlZV?=
 =?utf-8?B?ZzBCeEF2U3BsMUdaMzlNR3pRbW9CUGVGWE16ZVlLcFhtUHpuSmgwMkROTnFO?=
 =?utf-8?B?MlIyZ1QvUElmdzh4V3ZYNVhQbnZYZ21aWmZGWDNNWklxaUxkTngxZFM4bXZM?=
 =?utf-8?B?eGpzSkJPMkhHdm8xTFlRV3NMeUlVaHJDckZSOEVQUjh4cXV3NlhJa1Y4OWxO?=
 =?utf-8?B?Z0tWZUhkTFNEMjJuZ0Q3dURWNzFKdGpyR1I4d0NwZ281Q0NKSzFESUV4bjQz?=
 =?utf-8?B?SkN5YTlUUXhxeUN2QmhsVjh3WmpxUkVlSW1JcDF0MkZXYlZMblQ0NlM4Q245?=
 =?utf-8?B?UGk4SjhDUU5iVEpwMFhTclE5VTNDVFhjOVQxWHE5YmNhVzFLSmZuKzRaTTN2?=
 =?utf-8?B?UVVEYS9ub2JIUWJZUnFIVkRDbm1FQUY4MTk0TGtLM1NZbHdkT3ZDREp6NTJM?=
 =?utf-8?B?N3pHS1p3ZzhKdmFaZ094OE9Pajl3V3kvZDhhaDJjZWwrUVYzclhHTnlQNnhQ?=
 =?utf-8?B?b2wxN1d1RWFCR0VPTEU4Y2pjUXNjUDNEamRqZDBZZnpQVVVQMFpZYlNhdW4x?=
 =?utf-8?B?a2NZZ2lEbHprV01BK21weUhzb1FnMXo1WUJEcHd1NUNTZkZadHpqQXJ1bG9a?=
 =?utf-8?B?eXoraDRDUDQyTXN2SkFlcm5MV1Z4a2x6OHh0WXNoTkdocWdpSU8yaWNaS2VC?=
 =?utf-8?B?TmM1dC9JKzhob1lTTENWMENEV3A5SWx6TE00SWlzUDdaMHNSdldpS1lZWWJR?=
 =?utf-8?B?QzJQdGFHbStVYXhhWm05QWova2NCMVRLM3dqS2Frb1NJa2ZNK2FOd3Z3STVa?=
 =?utf-8?B?b0NPMStteHdGVGcra3RsRlNmRXJPVlh2d2dTaU5KYXYySEV3KzBuSTdHVEZU?=
 =?utf-8?B?UkM2VTF3LzVINlAzRlhhSE91NjlkeVhWeXZ0aDAzakRtNW1aYm1uODFXUERU?=
 =?utf-8?B?TWVtTTBBUW5NV1Z2Yko0Wm1HZWpzaDZISUlQOUxvNGpBSlZNUlVRM3owSHVS?=
 =?utf-8?B?VXFOQyt4WDVMQ3BIczdCb3V4eTZEWFZ1Sy8za0hmc05mbG5CdCtqa1NYbTNr?=
 =?utf-8?B?S0xyRmZvNVZhQzI4cVc0cmtsWTB1U2hIcGFVd3dQVWN0a0kxN3pmaWxOMysx?=
 =?utf-8?B?c3lWVUFtZ2xOK2lUdVFLNEExVUl2SGFWTDlGck1lVGhMV1RINk9YZWlBNXpP?=
 =?utf-8?B?TDVNRThRbjJjTEJWWE1kOGZZSWV1TDNLakZkb01aOG5vVnhQdW9FRC82SXFS?=
 =?utf-8?B?NExIK3JSc0pNeUNOWWxrajVKb0hHYTFuWm1nV1ZMeUFnaUp3MGt3YytGUXU3?=
 =?utf-8?Q?6S5vwuQXqF/I2LNxIaBzBot0K2iht7pF+4An8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84D53044C0C8EE4C851669E7DA875C82@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb50e4bf-d72e-40cd-0363-08d96c88a22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 14:07:14.0049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7V70Wdzj4CyLuGNJcttuS922nue6rvnHLElvm2tnR9qjkZCKYJDGpY8fah7LYyq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4648
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 9Qpil9qAJh5dKyCKmJEH57CEg309N5Aq
X-Proofpoint-ORIG-GUID: 9Qpil9qAJh5dKyCKmJEH57CEg309N5Aq
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_07:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310078
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=88771d3da1=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

DQoNCj4gT24gQXVnIDMxLCAyMDIxLCBhdCA2OjM0IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IE9uIDgvMzEvMjEgMToyMyBQTSwgQW5kcmV3IEplZmZl
cnkgd3JvdGU6DQo+PiBIaSBDw6lkcmljLCBQZXRlciwNCj4+IA0KPj4gT24gVHVlLCAzMSBBdWcg
MjAyMSwgYXQgMjA6MDksIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOg0KPj4+IE9uIDgvMjgvMjEg
NTo1OCBQTSwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+Pj4gSSB0aGluayBJ4oCZbSBhIGxp
dHRsZSBjb25mdXNlZCBvbiB0aGlzIHBhcnQuIFdoYXQgSSBtZWFudCBieSDigJxtb3N0IG1hY2hp
bmVzIGp1c3QgdXNlIFVBUlQ14oCdIHdhcyB0aGF0IG1vc3QgRFRT4oCZcyB1c2Ug4oCcc3Rkb3V0
LXBhdGg9JnVhcnQ14oCdLCBidXQgZnVqaSB1c2VzIOKAnHN0ZG91dC1wYXRoPSZ1YXJ0MeKAnS4g
SSAvZG8vIHNlZSB0aGF0IFNDVTUxMCBpbmNsdWRlcyBhIGJpdCByZWxhdGVkIHRvIFVBUlQsIGJ1
dCBpdOKAmXMgZm9yIGRpc2FibGluZyBib290aW5nIGZyb20gVUFSVDEgYW5kIFVBUlQ1LiBJIGp1
c3QgY2FyZSBhYm91dCB0aGUgY29uc29sZSBhc3BlY3QsIG5vdCBib290aW5nLg0KPj4+IA0KPj4+
IFRoZSBVQVJUIGNhbiBiZSBzd2l0Y2hlZCB3aXRoIFNDVTcwWzI5XSBvbiB0aGUgQVNUMjUwMCwg
YnR3Lg0KPj4gDQo+PiBJZiBpdCBoZWxwcywgbmVpdGhlciB0aGUgQVNUMjYwMCdzICJCb290IGZy
b20gVUFSVCIgZmVhdHVyZSBub3IgdGhlIA0KPj4gQVNUMls0NTZdMDAncyAiRGVidWcgVUFSVCIg
ZmVhdHVyZSBhcmUgcmVsYXRlZCB0byB3aGljaCBVQVJUIGlzIHVzZWQgYXMgDQo+PiB0aGUgQk1D
IGNvbnNvbGUgYnkgdS1ib290IGFuZC9vciB0aGUga2VybmVsIC0gdGhlIGxhdHRlciBpcyBlbnRp
cmVseSBhIA0KPj4gc29mdHdhcmUgdGhpbmcuDQo+IA0KPiBvay4gDQo+IA0KPiBJIGRvbid0IHRo
aW5rIHdlIHNob3VsZCBpbml0aWFsaXplIGFsbCA1IFVBUlRzIG9mIFNvQyBhbmQgbGV0IHRoZSB1
c2VyIGRlZmluZSANCj4gYWxsIHRoZSBleHBlY3RlZCBkZXZpY2VzIG9uIHRoZSBjb21tYW5kLiBV
bmxlc3Mgd2Ugd2FudCB0byBkbyBzb21ldGhpbmcgbGlrZQ0KPiAnbWFjc19tYXNrJyA/IGJ1dCBh
dCB0aGUgU29DIGxldmVsLiBJdCBtaWdodCBiZSBvdmVya2lsbCBmb3IgdGhlIG5lZWQuDQo+IA0K
PiBNeSBzdWdnZXN0aW9uIGlzIGhhdmUgdGhlIEFzcGVlZCBib2FyZCB0ZWxsIHRoZSBTb0Mgd2hp
Y2ggdWFydCB3YXMgc2VsZWN0ZWQgDQo+IGZvciB0aGUgY29uc29sZS4gVGhhdCBjYW4gYmUgZG9u
ZSB3aXRoIGFuIGV4dHJhICJzZXJpYWwtZGV2IiBpbnQgcHJvcGVydHkgYXQgDQo+IHRoZSBTb0Mg
bGV2ZWwsIGRlZmF1bHRzIHRvIEFTUEVFRF9ERVZfVUFSVDUsIGxpa2UgZm9yIHRoZSBtYWNoaW5l
LiANCj4gDQo+IFRoZSBzZXJpYWwgaW5pdCBuZWVkcyBhIGNoYW5nZSAgOiANCj4gDQo+ICAgIC8q
IFVBUlQgLSBhdHRhY2ggYW4gODI1MCB0byB0aGUgSU8gc3BhY2UgYXMgb3VyIFVBUlQ1ICovDQo+
ICAgIHNlcmlhbF9tbV9pbml0KGdldF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbQVNQRUVE
X0RFVl9VQVJUNV0sIDIsDQo+ICAgICAgICAgICAgICAgICAgIGFzcGVlZF9zb2NfZ2V0X2lycShz
LCBBU1BFRURfREVWX1VBUlQ1KSwgMzg0MDAsDQo+ICAgICAgICAgICAgICAgICAgIHNlcmlhbF9o
ZCgwKSwgREVWSUNFX0xJVFRMRV9FTkRJQU4pOw0KPiANCj4gYnV0IGl0IHN0YXlzIHdoZXJlIGl0
IGlzIGN1cnJlbnRseSwgdW5kZXIgdGhlIFNvQy4NCg0KT2ggb2ssIHllYWggdGhhdCBkZXNpZ24g
c291bmRzIGdvb2QgdG8gbWUsIEkgY2FuIHN1Ym1pdCBhIHBhdGNoIGxpa2UgdGhhdC4NCg0KSeKA
mWxsIG1ha2Ugc3VyZSB0byByZXN1Ym1pdCBQQVRDSCA1LCB0aGUgcmVnaXN0ZXIgZml4ZXMsIHNl
cGFyYXRlbHkgdGhvdWdoLg0KDQo+IA0KPj4gVGhlICJEZWJ1ZyBVQVJUIiBpcyBhIGhhcmR3YXJl
IGJhY2tkb29yLCBhIFVBUlQtdG8tQUhCIGJyaWRnZSANCj4+IGltcGxlbWVudGVkIGJ5IHRoZSBT
b0MuIEl0IHByb3ZpZGVzIGEgc2hlbGwgZW52aXJvbm1lbnQgdGhhdCBhbGxvd3MgeW91IA0KPj4g
dG8gaXNzdWUgdHJhbnNhY3Rpb25zIGRpcmVjdGx5IG9uIHRoZSBBSEIgaWYgeW91IHBlcmZvcm0g
YSBtYWdpYyBrbm9jay4gDQo+PiBJIGhhdmUgYSBkcml2ZXIgZm9yIGl0IGltcGxlbWVudGVkIGhl
cmU6DQo+PiANCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbWJvYXIvY3ZlLTIwMTktNjI2MC9ibG9i
L21hc3Rlci9zcmMvZGVidWcuYw0KPj4gDQo+PiBTQ1U3MFsyOV0gb24gdGhlIEFTVDI1MDAgc2Vs
ZWN0cyB3aGV0aGVyIHRoaXMgYmFja2Rvb3IgaXMgZXhwb3NlZCBvbiANCj4+IFVBUlQxIG9yIFVB
UlQ1Lg0KPj4gDQo+PiBUaGUgIkJvb3QgZnJvbSBVQVJUIiBmZWF0dXJlIGlzIGltcGxlbWVudGVk
IGluIHRoZSBBU1QyNjAwIFJPTSBjb2RlIGFzIA0KPj4gYSBmYWxsYmFjayBmb3IgbG9hZGluZyB0
aGUgU1BMIGlmIGZldGNoaW5nIGl0IGZyb20gU1BJLU5PUiBvciB0aGUgZU1NQyANCj4+IGZhaWxz
LCBvciB0aGUgU1BMIGlzIGluY29ycmVjdGx5IHNpZ25lZCBmb3Igc2VjdXJlLWJvb3QuDQo+PiAN
Cj4+IEkgdGhpbmsgUGV0ZXIgaXMgb24gdGhlIHJpZ2h0IHRyYWNrIHdpdGggdGhpcyBwYXRjaD8N
Cj4gDQo+IFllcy4gbmVhcmx5LiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiBvbiBob3cgdG8gaGFu
ZGxlIHRoaXMgUGV0ZXIuIEEgbWFjaGluZSANCj4gKmFuZCogYSBTb0MgcHJvcGVydHkgc2hvdWxk
IHRvIHRoZSB0cmljay4gDQo+IA0KPiAnYW1jLT5zZXJpYWxfZGV2JyBpcyBhIGdvb2QgaWRlYS4g
WW91IG5lZWQgYSBzaW1pbGFyIG9uZSB1bmRlciB0aGUgU29DLg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgZmVlZGJhY2sgQW5kcmV3LA0KPiANCj4gQy4gDQoNCkFoLCB0aGFua3MgZm9yIGNsYXJpZnlp
bmcgQW5kcmV3ISBJIHdhcyBsb29raW5nIGF0IHRoZSBkYXRhc2hlZXQgYWdhaW4geWVzdGVyZGF5
LA0KYW5kIGl0IHNlZW1lZCBsaWtlIHRoZSDigJxkZWJ1Z+KAnSBhbmQg4oCcYm9vdOKAnSBmZWF0
dXJlcyBtaWdodCBiZSBkaXN0aW5jdCBmcm9tIHJ4L3R4LA0KYnV0IHRvIGJlIGhvbmVzdCBJIGhh
ZCBubyBpZGVhIGFuZCBjYW1lIHRvIHRoaXMgb3BpbmlvbiBtb3N0bHkgYnkgYWNjaWRlbnQuDQoN
ClNvLCBJ4oCZbGwgcmVzdWJtaXQgUEFUQ0ggNSBzZXBhcmF0ZWx5LCBhbmQgc3VibWl0IGFub3Ro
ZXIgcGF0Y2ggd2l0aCB0aGlzDQptYWNoaW5lICsgU29DIHByb3BlcnR5IGRlc2lnbiBieSBpdHNl
bGYuDQoNClRoYW5rcyBmb3IgeW91ciBjb25zaWRlcmF0aW9uLCBJIHJlYWxseSBhcHByZWNpYXRl
IGl0IQ0KDQpUaGFua3MsDQpQZXRlcg==

