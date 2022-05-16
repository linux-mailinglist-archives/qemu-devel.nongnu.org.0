Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9C527D7B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 08:19:11 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqU4U-0005sh-Bn
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 02:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU0D-0004Fo-Rg; Mon, 16 May 2022 02:14:45 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:13308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU07-0005sC-LO; Mon, 16 May 2022 02:14:41 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24F9xjLK005253;
 Sun, 15 May 2022 23:14:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=L9rmDC3JO55PeQa82Y8JFMg236jjCFDLZeUcrKBU8BI=;
 b=Hi0EW6sL5OCW+XAKHXLjsZteR9BiNzghTlJPkI05hmbfQZM8fp0yfsVIonu5aFtABXeb
 3hASL9/322FbxkDZCdNEfHk6TZSY5ZcPtsL5/EU0M0e1sGa9y2jgXQS51hnMcBFe75+R
 9NPy19zo9d6jWqSTrJ+1RDPFs53c3QzH3Mo= 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g29xxf8wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 May 2022 23:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDjAzAwkYNXzsCdiCeX9XIeCpBkgSqj9yeqrrnuW+Gmn9SLyHUTKqbMTlKjPvlgACz1/vQccn0o20zNeef7p8pS3AjmRRRQrF1VDLTpPdnfnL36Pkv1v2Sw5qJ7txSzw3go5ICcim2pRuPQaXYHMNQAEFyvlRKUa+uQqS4oo4nH1LHA2EAD43/5Q3ZMxCDjfzyiuO390SEoSP1rJNihCK4M1yz0GESrTGs5tZq0Zjeo1cIMnzBcALMEqjO/BWDY7/u52ehZrTM15C/WuQQPABcLhQKR1KP5bPYU0zfrgQN2VLMeMYm4fcxBg9VS6DuKU1Hhdq4oPeeJlX4DrLSDUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9rmDC3JO55PeQa82Y8JFMg236jjCFDLZeUcrKBU8BI=;
 b=SIDg4UvHTwD01pbN7iWFGO9O/l7ETCU11UqUVtmBnUasuMFvs9bm48R0xzD6eSUgGNJIEJIy4BacbSpuGf581nPvBktTHt0kwAeNdEqwt7T9x282Hso7m7NQQGw6Z2358lSTMtTMsCipXkmbF6b24/OPnre6hWzM1ermitbcLErSgxOaOrYjE4gP2qsZndxC9soMXAD0Fp0i42L93lHDojnKSTlmtgv7t85Yqwxxco0ZLMTQ6ui6Maap1EdN5gVdaNDwo88DrY/ymvjeAT7xpBVg+c5BaOLUsZugFcoe2nLbT/F1dC9+DFYz619UMye9CVJC6eEH8zR9DwpIW++5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by PH0PR15MB4862.namprd15.prod.outlook.com (2603:10b6:510:c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 06:14:16 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 06:14:16 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v2] aspeed: Introduce a get_irq AspeedSoCClass method
Thread-Topic: [PATCH v2] aspeed: Introduce a get_irq AspeedSoCClass method
Thread-Index: AQHYaOm5Q55CoGix5Em3cLdbAeTyzK0hBoMA
Date: Mon, 16 May 2022 06:14:16 +0000
Message-ID: <B2015943-5947-461C-8174-2A380727861D@fb.com>
References: <20220516055620.2380197-1-clg@kaod.org>
In-Reply-To: <20220516055620.2380197-1-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c657e3de-2f53-40eb-39a7-08da37034e83
x-ms-traffictypediagnostic: PH0PR15MB4862:EE_
x-microsoft-antispam-prvs: <PH0PR15MB4862BF71B600946C4AB5FB88ACCF9@PH0PR15MB4862.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bXmVgASc89sqvsLJEBxhUdbxdK4djZJlsfVUG0S8NaSBza+v6rR+t77SAeNChgPlVIsThPTKpBSbEZeAvcQ7DMXvXDFZyPV4GQzO3J24a826TBPfviYPcPM+EjKLKzqds1LkL/nqpttlzUYALrZExx/wD9nPdnXJ6AhEStnN5wUO5DGJ3ojAWfIjkrRUyxw9Cm0zeporHyHZZ84Ucg4I5iEL4uujtnMqfUUtUQwNV0AMugef3TCo/za+uRFMW0ecQCp1AbzvkmHQK3w8sb3lcQEdqx7hFJEdvSZeSImpBLGD5vSOrXzbtcCs0RPH9cpsF9LsGSsHVL6F/SgK4LgCNEIy0U5cSwAZty2si4l89TeUl79meMjHj/CkImDP04f+ct3lTMquAyanmE63LCu/HbqfXzigyge5hgMq3auL8DdwkMBpHhctYCZlPItcefiNFvNsiXGSgBrqTX52wvtD0fna3WaNra9Axer8Hlr7XaiclCJe2fS02y2vM30T2hGkvyMyyuufkmReEhXgPHPOXUFcPUlYsfG0e7dw+1nzGoh26Qnprz3rMzHiSGcxdT2cSedInPZqmZ7KY0NmP1Y/LMNzk9GGzrzkinY1/xMCgk7d3b/JZuLvs1xLY2134g2nVSY2VmY3LsufXtJ6nkn3GRQdNROGCRKi6zYo6s3IQ4PYlQsRDvBnHOzK4vtXUIQWVjeTr27LR8EZ6C3aW2tuhItHV05JIQvkpuu/Iq9vCkjWyEb5jX0+x8IcDjukXC3e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(2906002)(6486002)(71200400001)(508600001)(5660300002)(38100700002)(38070700005)(33656002)(66476007)(76116006)(316002)(66556008)(8936002)(4326008)(8676002)(64756008)(54906003)(66446008)(66946007)(2616005)(6506007)(83380400001)(53546011)(186003)(109986005)(6512007)(122000001)(86362001)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3MvUENsL1pBeEg4RkYyM2hLc0hMMy9uakozT2ozNXoxWWZpbGswMmVLMUZ2?=
 =?utf-8?B?bTNIOU9PcTNyTmJFQ0ZOVXYraHk4dlV1N1h5dGFVb0RjYzZIcFo5RGJ1OUU2?=
 =?utf-8?B?VDJOTlo2MlU5dTFXY2wrNGxQQmZidHZuWDBxbTFTY2c0VGtSY0pIc25pRFgr?=
 =?utf-8?B?TzJrdUs3aGxMZm9yNmhWZXZMcWpDWXNHZVEzMEJqdjBtbmRVdjk3K054Nndj?=
 =?utf-8?B?TWt2T1hqUXZsYzEvbmswMnp4d2xSREViYXBxNERoWnZuNHVaY2hyb3V3RzE0?=
 =?utf-8?B?OXBqTllLd0NWRDlINTg5YnU2TDlHSGVLRkNQRWowNktHMjFQbE5FYVhjWS9u?=
 =?utf-8?B?Zmx4S3IwajYxWTJsZjN3QUZYVXRIdnM4ejVLWS9BS0VoYWozNTBld0c1ZGxt?=
 =?utf-8?B?UCtvaUNKMHpKK0hBZ3VMbFhwTWxnUlRlaCtTSzdJdGNiRjBabnpIVVcwOUE5?=
 =?utf-8?B?VnFuQm5iK2FUSXc4Njg4VU8ydDdCY3N3aW9ZVTZyNVZjT0tQYjdnRHNxa0oz?=
 =?utf-8?B?UDRnRFRGbFRMTExhSndWRy9OTUcxTWE0THVzeEJBWG9ycVA1UHFnT2hVRk9O?=
 =?utf-8?B?b29kSEpDcjhlNTJ2ek1WK2RQL3NOZlhoT0h2L1Q2VG1UQmUwcHRsUnV0Zkpo?=
 =?utf-8?B?d1FoVEM2WnhpYjJhdFdyczJ4VjlUNWZtK1R6MDFGb1cxUU9GejRrbDc2enll?=
 =?utf-8?B?S0Jock84c2hESFljdTdWNnAyZ2lSRmRwUnBmMXpLNGNvMktYZTUyZXhVakYr?=
 =?utf-8?B?R3dVQmduMWlVak9naHhrZHorc3QrRWpNQzNrZFVqZ053WWR5aUhNbEpxSm9R?=
 =?utf-8?B?Q29aR2ZBMVhXM1hDYy9XVG9VYllFUUJjUGwycUtrbmo1Z2tCb1VVaGdBRW4v?=
 =?utf-8?B?cWhsN3Bkd3RjelNsZlE5ZisvUm5Kc0RSYzFqV3ptQ3Zub1hiTXpBMnBtOGxi?=
 =?utf-8?B?ZEtmbmxlMmhsQ1VyS0I3K0JiMzNuMElVdnoxTm42Y2lWMFZvMnZlOEltRUNU?=
 =?utf-8?B?MUNReTF1UXdCWTJ3QmRudHk2T2hKc2Ezc3hSbisrdVlpblNLNmdWV0REamVZ?=
 =?utf-8?B?K0JvYlRvdnBocW1ySXJqOUJRbVVrNllWK3d2dGc3WFhSS3JndVl3TkhXd0Ji?=
 =?utf-8?B?VExKS1JYKzMvdXg5bTZzZjdYbHFIcWcvd3J6L21jSnFWVFczbEUwR0pkeU5L?=
 =?utf-8?B?dmVlTmN3cDdheThCTTJrMWFnZE1Ja1BRU1UxRkdnZHVMNUhSS3gyMmVEZTRC?=
 =?utf-8?B?TUVKQUNGLzZUR3pLMlVsYi9LaE5VdFlKQmkrakl3YmU0RnFYVGhIaEhPeWtv?=
 =?utf-8?B?QWVtSEhQQXl3ajFBNzlYbTJIM1Nza2N2WmlxVnpQamVnaXl3bExNd01aZmxR?=
 =?utf-8?B?MHRVRzd6aG1BUEFyTEdiY0xWR3AvcG42Y2VUQUI1UW5keFo1TVFtNGJidkEv?=
 =?utf-8?B?OFNLNzE4aXdKT0NVWlprOWdlSnp3RTRkK3RreXVEUHNrN20xZ2I2RnVha2JY?=
 =?utf-8?B?Vk03aFBMQXZNUGRzejdleUpiZFAzVjh4ZlRxZTBEZ0ptSG9aa2wycy9pYzNM?=
 =?utf-8?B?NFJoc3pZSWM3VEdFOUNpazdWNVhzY1BRejZuTmpLUlA0NElLbVNEV0IyTXBR?=
 =?utf-8?B?OGQyRnRXVDA1d3NSdkJMRDJqbE1IaEpCOXdGVm4wSzNRcnZjczFwbUc2YWtK?=
 =?utf-8?B?eFQ4djV5MzFYQis1U1lJek9QWkFDTHB4OU5EbmhVSVFUcnNkOCs3alF2NzF0?=
 =?utf-8?B?NHdiNlVoRnJsY3c5Nnp6R2x5Ymx1Q3Bxc1l5WHlZZ0xXUHQwSGszd0pic1hY?=
 =?utf-8?B?NW9LWU9NREdyTUVJdlp3L0ZOcG5oajZaTzM1T2NBR2JpVmhZalU0WXpBTW4z?=
 =?utf-8?B?cFFaM2ppSGh6OFdkNGJldkVzU2JQRFM5UTZrNEE2OGxQeEpFUCs2aDhBcXdh?=
 =?utf-8?B?blFFamxKQ2cxQ2pjeTYzWTFKS3lNUGVlYVdkRHRPbmRkSGtxYkhYVDhXUVNt?=
 =?utf-8?B?TzlON2NIM1F5TzBqaEFVWmhzVUJDOHBXSzdHNGxERWVUR1ZhZlA0N1Z5cHRm?=
 =?utf-8?B?WTlDWVJuZVZaRHNIczdpVzdsaERhMWkyVjk2WDVYL0dCTHlGWHNIaWRHTWVR?=
 =?utf-8?B?RGFWT1FUT1J5YytWRVh0TzBVQi9LRU1UQ1Ezb2NMTjNhYmpJbmlvQ0ZObjM1?=
 =?utf-8?B?dWFCWUZwbjJWVk9PWkFMSVdHMXh4VGhJS1NENnFDZFRVekU2UWNkQmxhakVX?=
 =?utf-8?B?dGZqNkdLL0xHRFcybGVKTzRjR1lVc2l4RDdQbFprL3YxN2F5N1M2ZGNQTVlN?=
 =?utf-8?B?eXNNd0Q5NGpidkJ3dHIzSkdTZk1HK3JIanBjMVJwY3dXVmF0YWN3emdKV3h3?=
 =?utf-8?Q?cWssPi2IuCyYyNfA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5E15D59BB34DA4288FF95EF732E44ED@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c657e3de-2f53-40eb-39a7-08da37034e83
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 06:14:16.7686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYNEW9Q2X6s3kkOggjkpwhaEvxSkrs/41kHSq8rSnccDT0xz1m+62CRcqtIHk8Mw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4862
X-Proofpoint-GUID: _b3U79Q3ksfZsXJuHibfSudB61Y2vGaP
X-Proofpoint-ORIG-GUID: _b3U79Q3ksfZsXJuHibfSudB61Y2vGaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

DQoNCj4gT24gTWF5IDE1LCAyMDIyLCBhdCAxMDo1NiBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBhbmQgbWFrZSByb3V0aW5lIGFzcGVlZF9zb2NfZ2V0
X2lycSgpIGNvbW1vbiB0byBhbGwgU29Dcy4gVGhpcyB3aWxsIGJlDQo+IHVzZWZ1bCB0byBzaGFy
ZSBjb2RlLg0KDQpMb29rcyBnb29kLCBJIGp1c3QgdGVzdGVkIHRoYXQgSSBjb3VsZCByZWJhc2Ug
bXkgY2hhbmdlcyBvbiBpdCBhbmQgcmVjb21waWxlL2V0Yy4NCg0KUmV2aWV3ZWQtYnk6IFBldGVy
IERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KDQo+IA0KPiBDYzogSmFtaW4gTGluIDxqYW1pbl9s
aW5AYXNwZWVkdGVjaC5jb20+DQo+IENjOiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gLS0t
DQo+IGluY2x1ZGUvaHcvYXJtL2FzcGVlZF9zb2MuaCB8ICAzICsrKw0KPiBody9hcm0vYXNwZWVk
X2FzdDEweDAuYyAgICAgfCAgNSArKystLQ0KPiBody9hcm0vYXNwZWVkX2FzdDI2MDAuYyAgICAg
fCAgNSArKystLQ0KPiBody9hcm0vYXNwZWVkX3NvYy5jICAgICAgICAgfCAxMyArKysrKysrKysr
LS0tDQo+IDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FybS9hc3BlZWRfc29jLmggYi9pbmNsdWRl
L2h3L2FybS9hc3BlZWRfc29jLmgNCj4gaW5kZXggZTEzYWYzNzRiOTIzLi4zNzg5ZjM4NjAzZTUg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvaHcvYXJtL2FzcGVlZF9zb2MuaA0KPiArKysgYi9pbmNs
dWRlL2h3L2FybS9hc3BlZWRfc29jLmgNCj4gQEAgLTk0LDYgKzk0LDcgQEAgc3RydWN0IEFzcGVl
ZFNvQ0NsYXNzIHsNCj4gICAgIGNvbnN0IGludCAqaXJxbWFwOw0KPiAgICAgY29uc3QgaHdhZGRy
ICptZW1tYXA7DQo+ICAgICB1aW50MzJfdCBudW1fY3B1czsNCj4gKyAgICBxZW11X2lycSAoKmdl
dF9pcnEpKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgZGV2KTsNCj4gfTsNCj4gDQo+IA0KPiBAQCAt
MTUzLDQgKzE1NCw2IEBAIGVudW0gew0KPiAgICAgQVNQRUVEX0RFVl9JM0MsDQo+IH07DQo+IA0K
PiArcWVtdV9pcnEgYXNwZWVkX3NvY19nZXRfaXJxKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgZGV2
KTsNCj4gKw0KPiAjZW5kaWYgLyogQVNQRUVEX1NPQ19IICovDQo+IGRpZmYgLS1naXQgYS9ody9h
cm0vYXNwZWVkX2FzdDEweDAuYyBiL2h3L2FybS9hc3BlZWRfYXN0MTB4MC5jDQo+IGluZGV4IDQy
NzE1NDkyODI1NC4uOWFlOWVmYWFjMTQ0IDEwMDY0NA0KPiAtLS0gYS9ody9hcm0vYXNwZWVkX2Fz
dDEweDAuYw0KPiArKysgYi9ody9hcm0vYXNwZWVkX2FzdDEweDAuYw0KPiBAQCAtNjEsMTEgKzYx
LDExIEBAIHN0YXRpYyBjb25zdCBpbnQgYXNwZWVkX3NvY19hc3QxMDMwX2lycW1hcFtdID0gew0K
PiAgICAgW0FTUEVFRF9ERVZfS0NTXSAgICAgICA9IDEzOCwgLyogMTM4IC0+IDE0MiAqLw0KPiB9
Ow0KPiANCj4gLXN0YXRpYyBxZW11X2lycSBhc3BlZWRfc29jX2dldF9pcnEoQXNwZWVkU29DU3Rh
dGUgKnMsIGludCBjdHJsKQ0KPiArc3RhdGljIHFlbXVfaXJxIGFzcGVlZF9zb2NfYXN0MTAzMF9n
ZXRfaXJxKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgZGV2KQ0KPiB7DQo+ICAgICBBc3BlZWRTb0ND
bGFzcyAqc2MgPSBBU1BFRURfU09DX0dFVF9DTEFTUyhzKTsNCj4gDQo+IC0gICAgcmV0dXJuIHFk
ZXZfZ2V0X2dwaW9faW4oREVWSUNFKCZzLT5hcm12N20pLCBzYy0+aXJxbWFwW2N0cmxdKTsNCj4g
KyAgICByZXR1cm4gcWRldl9nZXRfZ3Bpb19pbihERVZJQ0UoJnMtPmFybXY3bSksIHNjLT5pcnFt
YXBbZGV2XSk7DQo+IH0NCj4gDQo+IHN0YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0MTAzMF9pbml0
KE9iamVjdCAqb2JqKQ0KPiBAQCAtMjgwLDYgKzI4MCw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9z
b2NfYXN0MTAzMF9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkNCj4g
ICAgIHNjLT5pcnFtYXAgPSBhc3BlZWRfc29jX2FzdDEwMzBfaXJxbWFwOw0KPiAgICAgc2MtPm1l
bW1hcCA9IGFzcGVlZF9zb2NfYXN0MTAzMF9tZW1tYXA7DQo+ICAgICBzYy0+bnVtX2NwdXMgPSAx
Ow0KPiArICAgIHNjLT5nZXRfaXJxID0gYXNwZWVkX3NvY19hc3QxMDMwX2dldF9pcnE7DQo+IH0N
Cj4gDQo+IHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfc29jX2FzdDEwMzBfdHlwZV9pbmZv
ID0gew0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMgYi9ody9hcm0vYXNw
ZWVkX2FzdDI2MDAuYw0KPiBpbmRleCBlZWRkYTdiYWRjMzcuLjQxNjFhMGNjNGJiZSAxMDA2NDQN
Cj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMNCj4gKysrIGIvaHcvYXJtL2FzcGVlZF9h
c3QyNjAwLmMNCj4gQEAgLTExNCwxMSArMTE0LDExIEBAIHN0YXRpYyBjb25zdCBpbnQgYXNwZWVk
X3NvY19hc3QyNjAwX2lycW1hcFtdID0gew0KPiAgICAgW0FTUEVFRF9ERVZfSTNDXSAgICAgICA9
IDEwMiwgICAvKiAxMDIgLT4gMTA3ICovDQo+IH07DQo+IA0KPiAtc3RhdGljIHFlbXVfaXJxIGFz
cGVlZF9zb2NfZ2V0X2lycShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGN0cmwpDQo+ICtzdGF0aWMg
cWVtdV9pcnEgYXNwZWVkX3NvY19hc3QyNjAwX2dldF9pcnEoQXNwZWVkU29DU3RhdGUgKnMsIGlu
dCBkZXYpDQo+IHsNCj4gICAgIEFzcGVlZFNvQ0NsYXNzICpzYyA9IEFTUEVFRF9TT0NfR0VUX0NM
QVNTKHMpOw0KPiANCj4gLSAgICByZXR1cm4gcWRldl9nZXRfZ3Bpb19pbihERVZJQ0UoJnMtPmE3
bXBjb3JlKSwgc2MtPmlycW1hcFtjdHJsXSk7DQo+ICsgICAgcmV0dXJuIHFkZXZfZ2V0X2dwaW9f
aW4oREVWSUNFKCZzLT5hN21wY29yZSksIHNjLT5pcnFtYXBbZGV2XSk7DQo+IH0NCj4gDQo+IHN0
YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0MjYwMF9pbml0KE9iamVjdCAqb2JqKQ0KPiBAQCAtNTcy
LDYgKzU3Miw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0MjYwMF9jbGFzc19pbml0KE9i
amVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4gICAgIHNjLT5pcnFtYXAgICAgICAgPSBhc3Bl
ZWRfc29jX2FzdDI2MDBfaXJxbWFwOw0KPiAgICAgc2MtPm1lbW1hcCAgICAgICA9IGFzcGVlZF9z
b2NfYXN0MjYwMF9tZW1tYXA7DQo+ICAgICBzYy0+bnVtX2NwdXMgICAgID0gMjsNCj4gKyAgICBz
Yy0+Z2V0X2lycSAgICAgID0gYXNwZWVkX3NvY19hc3QyNjAwX2dldF9pcnE7DQo+IH0NCj4gDQo+
IHN0YXRpYyBjb25zdCBUeXBlSW5mbyBhc3BlZWRfc29jX2FzdDI2MDBfdHlwZV9pbmZvID0gew0K
PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9zb2MuYyBiL2h3L2FybS9hc3BlZWRfc29jLmMN
Cj4gaW5kZXggNTg3MTRjYjJhMDFkLi5jMzM5YjVjNzRkZTUgMTAwNjQ0DQo+IC0tLSBhL2h3L2Fy
bS9hc3BlZWRfc29jLmMNCj4gKysrIGIvaHcvYXJtL2FzcGVlZF9zb2MuYw0KPiBAQCAtMTIxLDEx
ICsxMjEsMTEgQEAgc3RhdGljIGNvbnN0IGludCBhc3BlZWRfc29jX2FzdDI0MDBfaXJxbWFwW10g
PSB7DQo+IA0KPiAjZGVmaW5lIGFzcGVlZF9zb2NfYXN0MjUwMF9pcnFtYXAgYXNwZWVkX3NvY19h
c3QyNDAwX2lycW1hcA0KPiANCj4gLXN0YXRpYyBxZW11X2lycSBhc3BlZWRfc29jX2dldF9pcnEo
QXNwZWVkU29DU3RhdGUgKnMsIGludCBjdHJsKQ0KPiArc3RhdGljIHFlbXVfaXJxIGFzcGVlZF9z
b2NfYXN0MjQwMF9nZXRfaXJxKEFzcGVlZFNvQ1N0YXRlICpzLCBpbnQgZGV2KQ0KPiB7DQo+ICAg
ICBBc3BlZWRTb0NDbGFzcyAqc2MgPSBBU1BFRURfU09DX0dFVF9DTEFTUyhzKTsNCj4gDQo+IC0g
ICAgcmV0dXJuIHFkZXZfZ2V0X2dwaW9faW4oREVWSUNFKCZzLT52aWMpLCBzYy0+aXJxbWFwW2N0
cmxdKTsNCj4gKyAgICByZXR1cm4gcWRldl9nZXRfZ3Bpb19pbihERVZJQ0UoJnMtPnZpYyksIHNj
LT5pcnFtYXBbZGV2XSk7DQo+IH0NCj4gDQo+IHN0YXRpYyB2b2lkIGFzcGVlZF9zb2NfaW5pdChP
YmplY3QgKm9iaikNCj4gQEAgLTQ4Nyw2ICs0ODcsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29j
X2FzdDI0MDBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+ICAgICBz
Yy0+aXJxbWFwICAgICAgID0gYXNwZWVkX3NvY19hc3QyNDAwX2lycW1hcDsNCj4gICAgIHNjLT5t
ZW1tYXAgICAgICAgPSBhc3BlZWRfc29jX2FzdDI0MDBfbWVtbWFwOw0KPiAgICAgc2MtPm51bV9j
cHVzICAgICA9IDE7DQo+ICsgICAgc2MtPmdldF9pcnEgICAgICA9IGFzcGVlZF9zb2NfYXN0MjQw
MF9nZXRfaXJxOw0KPiB9DQo+IA0KPiBzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNwZWVkX3NvY19h
c3QyNDAwX3R5cGVfaW5mbyA9IHsNCj4gQEAgLTUxMiw2ICs1MTMsNyBAQCBzdGF0aWMgdm9pZCBh
c3BlZWRfc29jX2FzdDI1MDBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEp
DQo+ICAgICBzYy0+aXJxbWFwICAgICAgID0gYXNwZWVkX3NvY19hc3QyNTAwX2lycW1hcDsNCj4g
ICAgIHNjLT5tZW1tYXAgICAgICAgPSBhc3BlZWRfc29jX2FzdDI1MDBfbWVtbWFwOw0KPiAgICAg
c2MtPm51bV9jcHVzICAgICA9IDE7DQo+ICsgICAgc2MtPmdldF9pcnEgICAgICA9IGFzcGVlZF9z
b2NfYXN0MjQwMF9nZXRfaXJxOw0KPiB9DQo+IA0KPiBzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNw
ZWVkX3NvY19hc3QyNTAwX3R5cGVfaW5mbyA9IHsNCj4gQEAgLTUyOCw0ICs1MzAsOSBAQCBzdGF0
aWMgdm9pZCBhc3BlZWRfc29jX3JlZ2lzdGVyX3R5cGVzKHZvaWQpDQo+ICAgICB0eXBlX3JlZ2lz
dGVyX3N0YXRpYygmYXNwZWVkX3NvY19hc3QyNTAwX3R5cGVfaW5mbyk7DQo+IH07DQo+IA0KPiAt
dHlwZV9pbml0KGFzcGVlZF9zb2NfcmVnaXN0ZXJfdHlwZXMpDQo+ICt0eXBlX2luaXQoYXNwZWVk
X3NvY19yZWdpc3Rlcl90eXBlcyk7DQo+ICsNCj4gK3FlbXVfaXJxIGFzcGVlZF9zb2NfZ2V0X2ly
cShBc3BlZWRTb0NTdGF0ZSAqcywgaW50IGRldikNCj4gK3sNCj4gKyAgICByZXR1cm4gQVNQRUVE
X1NPQ19HRVRfQ0xBU1MocyktPmdldF9pcnEocywgZGV2KTsNCj4gK30NCj4gLS0gDQo+IDIuMzUu
MQ0KPiANCg0K

