Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2260406B84
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:40:26 +0200 (CEST)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfpQ-0006Kh-Jj
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mOfSN-0003V0-Eh
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:16:35 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:18444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mOfSJ-0003Ol-Fj
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:16:34 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18A9xDsQ027133;
 Fri, 10 Sep 2021 05:16:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ZmBURPovfA9przpXhKUV+iVSiFx0rPrbC6nzs5njhpI=;
 b=2gr/Vqu/55Fn5hqu8N3Ip4D7jeFshtsqWPSWBkrCaNMrL7PvUuHnTyVIc5H4yC/L4jup
 E/tCb8OwcDjhRxdo7NmDtu+oml3Dsho2xO3vhOtSwtRx0C4eDFvkdJrswkswhI7l2jmF
 yQt5eDYx5Qer0POni/cKF3YPnvtKUfj/0Xd+Wr4s/YLjumnRLRlysW6acodiVvTb94kJ
 gf1sDa/TuOJC25wJg7YkHdnpl8IISECQXKBDonSlNIJn1ia2hL0ceAYOgeFz2gyJHKqf
 6unMkp5ukV893c2bXvstcRunJAFL9HSFlVsT1CVP/cFyVlmyk4C/68hppDcpRDYGrNr0 3w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3aytmcs8aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 05:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+TMmxKT+jm5OFbiYuqoTkfdOti7WcvixFiKkvGG4lqFTcblP0XdNGAY6VG1+2awCpy7jKLqi1AOXOlEBpKUDaVwuYmqkkw/ac9UDbYZ4/yZsgkgBNDXGcEp7nU9KJIDyKnpUwz2fQp4DhIQ0xMyZQX7xfWc0fb+wS9GkUDLLBITXxNJ7xORR/I/cKjueHTxZ4Tut6dOATVI8jnBhDqY3kT0KeZfTBTPUBhVtTE0OE/acw32v7zHj8m33rc0FHhm9vuZ7JHWvIT2z9As3fKPmd1qvJc7L7KHRMpbtunajR6ij9ussfVP+/JlWMcYrOmLVgyHhiNAYrbbv5Mb/9rNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZmBURPovfA9przpXhKUV+iVSiFx0rPrbC6nzs5njhpI=;
 b=dGj6OYd5hFwJwcOwzBnG2G2B1zR8LxLkkOdRjiiJoyZPBBxfppSa+PiudyCHXTLUoS4s/5zs3avW6BCSRshI3ff3xPI1qtRNz3rfwyJBxjxGihRsPQ1fvYfzgGY83h4++36/zRZ6b5hFcDsH4jg78zCSb8iqPkBdXvWVEypXxQ3w9BkmQB9mxtXhWzhwCYXTKtd32ygEMnwnUKfW+xAaKKxW4dOP5kEaPtxsTn7vsB7fzqPO0D61Xi9Vlg324A7KesiUFiUymcO7tpJL64kwhKBjWIRhcXeai/vLQXUJHEbbycn1uWLnm46Yk8J8XNNh5PqnICXHZln4HClYH8EPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by MN2PR02MB6893.namprd02.prod.outlook.com (2603:10b6:208:200::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Fri, 10 Sep
 2021 12:16:27 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 12:16:27 +0000
From: John Levon <john.levon@nutanix.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Topic: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Index: AQHXkr3OvGMc1gF8HUqon/IhhiYGEKuY9OiAgAJloACAAGXUAIABLo0AgABm94A=
Date: Fri, 10 Sep 2021 12:16:27 +0000
Message-ID: <YTtMm8WTgi0eGExA@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
 <YTegRT0DPt50h8VU@movementarian.org>
 <A82F2970-293D-4455-8C92-2C9E58C3E626@oracle.com>
 <YTn4cHE0TRnhwQeJ@movementarian.org>
 <7B09AE7B-829E-462B-BCD8-8570CC343B47@oracle.com>
In-Reply-To: <7B09AE7B-829E-462B-BCD8-8570CC343B47@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5b19ea3-7a27-4bcd-318f-08d97454d0b5
x-ms-traffictypediagnostic: MN2PR02MB6893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB68934B1DB69ACD0D3199238F97D69@MN2PR02MB6893.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TvN85hGQlqKgBHsVQLvO4y51GTsV+uu8NmLVfE3y8eUXEe17p35RRK4rbShoprMT1GqxnONyafR/1Eur5veUMlS+Fi8py5EL/MTSZxBMOD3nseuXlT0XW+htABngjDIakW0T/PB4Xc0qpY9pv/Ap1TJRhGHA5+RDTCXDabgzCdJMkeJJ5Lpv3neJIquWnMfrcuZBjDfiRSBjTYemzyxZbQlYbfShUHqwGrFPrKdGWWV4NTR5I2AhFObB5a28b2HCmBUjcZF1m15jSk0kG1PeOFEJy0g4j5Ic7PZoMn6YfaIPT00PF/GQ/LLHs5WOd2pBvUk+lx9z8pspyA79Q3UdIKsLeS1WItekK5EkbEAdIhUOIF2Z5iu8Dpx6dTvyk2LYJY7P/1k1ADUuyrQxELTVfA84qP457RHim8RzeUpyebS2xJBp5QYXKEbFtPKZk9feQ+G0C07T2tmAq2v8qu/MojZM2nCzOVlGXRgsD6lHICNcXuttSBMO/hbAO4Bv/46Nehs3w8yFvMkhyCpFRRwnB3nQi9skkUPXovsGqusTleqwAR5Cy4BP/Yah3J2RbmKifpYw8UlMDftoDeJV53rtyoWg+CGs9OjfQ8EjqYdO3Kq0lGZZNVUA3sSuMM1d64dJoDjcc4bJnMz6qPQwdQtTaTYjza2WBV1g+RyffKuO2GffGZfA90sRkoDEUhmlZkbw1brz48TmayKqptfbxjlOQM7d8Ejb0NZKAZ9VqdhIReLb+8orEyEz4tuOijkmNaZOqeFy5hJwaREyyujFDEb3j0V3y7Uw2FLbI1BxRhdzEuU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(366004)(396003)(346002)(83380400001)(186003)(26005)(86362001)(6506007)(6512007)(44832011)(6916009)(71200400001)(9686003)(64756008)(54906003)(36756003)(66946007)(4326008)(6486002)(66446008)(107886003)(66556008)(66476007)(76116006)(91956017)(38070700005)(8676002)(966005)(478600001)(8936002)(5660300002)(122000001)(2906002)(38100700002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V09qR3c0MkVITkZ1VCt6K04xblNTOEVOTVB1ajhkZGdKVCtsS3EyTm9SdERo?=
 =?utf-8?B?dCt4c00wdVRiYkNJcmJJOUZEd3FyeGtaaWNpa00yK3lkNTU2TE5RMDdNY1c4?=
 =?utf-8?B?NjQveDRVT00ySks3emhabzNFRERaT2ZVaGpmY2NkeEV6bU9Hc1pDR2lhbXp0?=
 =?utf-8?B?ZUFrcTlaUktUUnhOU3N4SkJVOWhjb1lGc0RVOWpZWVBWdUJ3eGZYcnI2M2tN?=
 =?utf-8?B?VzJkMms1d2hjazFOQk9QcnRnc082aEJEaHVOOC83RlZOQllvME01WUtSQmJW?=
 =?utf-8?B?YXlQS0o0Wlk3VmhIaEdaWDR5V29hVndGQWZmb0UydDh5Ti8zT1ozakdCbSt0?=
 =?utf-8?B?OVBxMTBVWnNOcFJzbSs3QlhjdVFEQlJxVzh6VmFLY1Y4SVAzbjBxTHdVb2Zn?=
 =?utf-8?B?SzBxT1JuMzVZYytneUVydnZTR1BGdzRoMzVBZWxINWgxSGxxSW4yQkVFbFFR?=
 =?utf-8?B?QmhRU0VwdnMzRjRkcFZEa0RMRno4bFVSdjIzRjJoNFh6eFhzdjllbjBXdVJx?=
 =?utf-8?B?OGJOUXNkZm5IOUpRcFNVenJFSkw2L0xFeHpKY1E4eFlqcmhublBYSjkrUkNm?=
 =?utf-8?B?bFB0Wjk4WVJza202L2JUMytFUlhtcm5BZ3lwM0JwTTRpeVUvaDF2NDBJZTNE?=
 =?utf-8?B?aGZqY0RVUnVETzUyMlFJK1NvWlJVYnptQ0I3ZitESEJ2WUhxeE1iNjF2YUt3?=
 =?utf-8?B?YW5acHJzZHd2WkkwdlpDTXVEWGQ1eTVMdnBMeFo1YTFmY05jNldrK1lSbnho?=
 =?utf-8?B?cGtEd25zb0VxWWZnS1FZYU5ESWlLQ1U4WlowbTRHOHNLc3p2d0VxMm5hak0w?=
 =?utf-8?B?RHVtZUh0M25GcW1OdEcyUjg2MTVxVndiVy8rR2s4K1h5WUdNVFJOcml4Qkpt?=
 =?utf-8?B?bGd1cVhBR3FkTnlvZGNtclkvanRvR3VQMXhyUEZsWloybEhhdW5SV1I3MnNO?=
 =?utf-8?B?ZFJ2a29qZFg3QU5IUytzVXNBcVAyTk5ibU1obGlodndiWG0yTmc3L3M1SFlZ?=
 =?utf-8?B?Z3Erc1R6SlVid2lld0Zncm40eU9LWFIzekE0M29RYUs1Yi9VUXdXQ0VuNVpY?=
 =?utf-8?B?OE9zbGhRbFE3ditrUTUzQ3IwZUltaGdKQ3NXSVg5cU9UUnFLK2JPdll1cjZr?=
 =?utf-8?B?K3VBMHFadUpsUlhpK2pyc1JLdkVpdUhtTDc0WVFPUkh6UjZZdUcyZjNUT2lT?=
 =?utf-8?B?NEgxK01wUUdQS1hrUDM2R2JCL2JJdy9hcVhCR0VqSUtKa3dabVIxbEduclhE?=
 =?utf-8?B?YjBkSFJ5S0NOTFRIdEVBQm0wWjFLY1Nxd0dvbm4yK3R2SmtrYzVFcmZyR1Bv?=
 =?utf-8?B?NS9rTmp2WUJObnR3YWU3eGRKMExlS0xzV2hIS204dEJRRndLVVQ3elpDTXp4?=
 =?utf-8?B?UTk4VWl2bWtCZkZjNUxZTzgxUHRieE1lOGdlN2d5VDdVVUdHTWIxbkhCaWtN?=
 =?utf-8?B?SjN1UnZSbm9naUIrT1ZCMkJtK1dsOUFweFhxL0NxZTQ5ekhMdVlQQ0xuakVD?=
 =?utf-8?B?N3J0L2Z1elo1YVRjOEdRcmw5Unh0RTM1OUZQY1ZNazQyb21BbjdKZW5Rdmp1?=
 =?utf-8?B?THJ6RXlScXlCT3ltRGlxSjI2ZG9UeTN1d0luQXBIZzJqR1M0aGhIMU81UzdC?=
 =?utf-8?B?d0piZ2Y3MEJKM0tPbytXRHNlNXZ6ZTk3dkw0dHU5SWFLWkNabW1TbXYxMGFY?=
 =?utf-8?B?WW85ekViUnpSbEM2TjYrNDh3MjB0b0JucUVXL0NJZjBIamR0SXdyc2toRXdv?=
 =?utf-8?Q?IdSLjfNTDzghKfgPwiIMYKZ6MDeuXNKw4/C/n0Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F41A80A36F35642B5CE3B6E4468E886@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b19ea3-7a27-4bcd-318f-08d97454d0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 12:16:27.6436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpRQu11O8JCaWmOjURaPM0wSGdXaH3zkzlhti0t1Cdx1cIJYBxBV40R28nDMrtVMcumk0F/BQ3xVyPnA3wFMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6893
X-Proofpoint-ORIG-GUID: abD7n4GrHXEjA0toGaAq17OA0aLuESSt
X-Proofpoint-GUID: abD7n4GrHXEjA0toGaAq17OA0aLuESSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpLCBTZXAgMTAsIDIwMjEgYXQgMDY6MDc6NTZBTSArMDAwMCwgSm9obiBKb2huc29uIHdy
b3RlOg0KDQo+ID4+PiBPbiBNb24sIEF1ZyAxNiwgMjAyMSBhdCAwOTo0Mjo0MkFNIC0wNzAwLCBF
bGVuYSBVZmltdHNldmEgd3JvdGU6DQo+ID4+PiANCj4gPj4+PiAraW50IHZmaW9fdXNlcl9yZWdp
b25fd3JpdGUoVkZJT0RldmljZSAqdmJhc2VkZXYsIHVpbnQzMl90IGluZGV4LA0KPiA+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBvZmZzZXQsIHVpbnQzMl90IGNvdW50
LCB2b2lkICpkYXRhKQ0KPiA+Pj4+ICt7DQo+ID4+Pj4gKyAgICBnX2F1dG9mcmVlIFZGSU9Vc2Vy
UmVnaW9uUlcgKm1zZ3AgPSBOVUxMOw0KPiA+Pj4+ICsgICAgaW50IHNpemUgPSBzaXplb2YoKm1z
Z3ApICsgY291bnQ7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsgICAgbXNncCA9IGdfbWFsbG9jMChzaXpl
KTsNCj4gPj4+PiArICAgIHZmaW9fdXNlcl9yZXF1ZXN0X21zZygmbXNncC0+aGRyLCBWRklPX1VT
RVJfUkVHSU9OX1dSSVRFLCBzaXplLA0KPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IFZGSU9fVVNFUl9OT19SRVBMWSk7DQo+ID4+PiANCj4gPj4+IE1pcnJvcmluZyBodHRwczovL3Vy
bGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dpdGh1Yi5jb21fb3Jh
Y2xlX3FlbXVfaXNzdWVzXzEwJmQ9RHdJR2FRJmM9czg4M0dwVUNPQ2hLT0hpb2NZdEdjZyZyPXY3
U05MSnF4N2I5VmZjN1pPODJXZzRublo4TzVYa0FDRlEzMGJWS3hvdEkmbT1QSjM5MENmS1BkVEZV
ZmZTaTAyd2hNU3FleTJlbjhPSnY3ZG05VkFRS0kwJnM9TWZwMXhSS0VUM0xFdWNFZVp3VVZVdlNK
M1YwenpHRWt0T3pGd01zVGZFRSZlPSAgaGVyZSBmb3IgdmlzaWJpbGl0eToNCj4gPj4+IA0KPiA+
Pj4gQ3VycmVudGx5LCB2ZmlvX3VzZXJfcmVnaW9uX3dyaXRlIHVzZXMgVkZJT19VU0VSX05PX1JF
UExZIHVuY29uZGl0aW9uYWxseSwNCj4gPj4+IG1lYW5pbmcgZXNzZW50aWFsbHkgYWxsIHdyaXRl
cyBhcmUgcG9zdGVkLiBCdXQgdGhhdCBzaG91bGRuJ3QgYmUgdGhlIGNhc2UsIGZvcg0KPiA+Pj4g
ZXhhbXBsZSBmb3IgUENJIGNvbmZpZyBzcGFjZSwgd2hlcmUgaXQncyBleHBlY3RlZCB0aGF0IHdy
aXRlcyB3aWxsIHdhaXQgZm9yIGFuDQo+ID4+PiBhY2sgYmVmb3JlIHRoZSBWQ1BVIGNvbnRpbnVl
cy4NCj4gPj4gDQo+ID4+IAlJ4oCZbSBub3Qgc3VyZSBmb2xsb3dpbmcgdGhlIFBDSSBzcGVjICht
ZW0gd3JpdGVzIHBvc3RlZCwgY29uZmlnICYgSU8NCj4gPj4gYXJlIG5vdCkgY29tcGxldGVseSBz
b2x2ZXMgdGhlIGlzc3VlIGlmIHRoZSBkZXZpY2UgdXNlcyBzcGFyc2UgbW1hcC4gIEEgc3RvcmUN
Cj4gPj4gdG8gd2VudCBvdmVyIHRoZSBzb2NrZXQgY2FuIGJlIHBhc3NlZCBieSBhIGxvYWQgdGhh
dCBnb2VzIGRpcmVjdGx5IHRvIG1lbW9yeSwNCj4gPj4gd2hpY2ggY291bGQgYnJlYWsgYSBkcml2
ZXIgdGhhdCBhc3N1bWVzIGEgbG9hZCBjb21wbGV0aW9uIG1lYW5zIG9sZGVyIHN0b3Jlcw0KPiA+
PiB0byB0aGUgc2FtZSBkZXZpY2UgaGF2ZSBhbHNvIGNvbXBsZXRlZC4NCj4gPiANCj4gPiBTdXJl
LCBidXQgc3BhcnNlIG1tYXBzIGFyZSB1bmRlciB0aGUgZGV2aWNlJ3MgY29udHJvbCAtIHNvIHdv
dWxkbid0IHRoYXQgYmUNCj4gPiBzb21ldGhpbmcgb2YgYSAiZG9uJ3QgZG8gdGhhdCIgc2NlbmFy
aW8/DQo+IA0KPiAJVGhlIHNwYXJzZSBtbWFwcyBhcmUgdW5kZXIgdGhlIGVtdWxhdGlvbiBwcm9n
cmFt4oCZcyBjb250cm9sLCBidXQgaXQNCj4gZG9lc27igJl0IGtub3cgd2hhdCByZWdpc3RlcnMg
dGhlIGd1ZXN0IGRldmljZSBkcml2ZXIgaXMgdXNpbmcgdG8gZm9yY2Ugc3RvcmVzDQo+IHRvIGNv
bXBsZXRlLiAgVGhlIExpbnV4IGRldmljZSBkcml2ZXJzIGRvYyBvbiBrZXJuZWwub3JnIGp1c3Qg
c2F5cyB0aGUgZHJpdmVyDQo+IG11c3QgcmVhZCBmcm9tIHRoZSBzYW1lIGRldmljZS4NCg0KU3Vy
ZSwgYnV0IGFueSBkZXZpY2Ugd2hlcmUgdGhhdCBpcyBpbXBvcnRhbnQgd291bGRuJ3QgdXNlIHRo
ZSBzcGFyc2UgbW1hcHMsIG5vPw0KDQpUaGVyZSdzIG5vIG90aGVyIGFsdGVybmF0aXZlLg0KDQpy
ZWdhcmRzDQpqb2hu

