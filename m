Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264868665D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:05:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCnG-0005xK-75; Wed, 01 Feb 2023 08:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1396ca8274=guohuai.shi@windriver.com>)
 id 1pNCnD-0005un-Q0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:04:51 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1396ca8274=guohuai.shi@windriver.com>)
 id 1pNCnB-00089a-3f
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:04:51 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311C027d030046; Wed, 1 Feb 2023 13:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=WNg5Z5O2VqviIf9oXaxfNxIC+bS3KWWRIaAP4lmf+io=;
 b=PYfg4EyVBFNc9d6OQ/rflSbodCfNpoIKc0tbqw1dKkQ0DsyUmexOq95jmiOazPv23WQK
 za2JBxBArKcYls7vlmCxoyttr9iy+5ON2sE6HE/SMgwcV22KnE5q07mNrgai23nKrPr5
 T+DtZQtigixPG4SPBI+7D4X1HNYDP5J7o8z5F5WyV+RSHxc8aAKYnfDk/lrSiFMWcVTc
 GegikfNDt2PbItYuUTb56CP3N4rWi7bQG8MyRBeeq8+3MeKsD+2ltc9Pva5avWYT+0gA
 cLPBYwC+mCnT5hgTHkOHjxm3fxntR3RGlNXYdyHJfcpRVv8siBR0qoJwxp6Cx0L+GnZp jA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nfn33r4kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvgNFgSf49pMj9C6UBnbx3EzROgB6gtfG3imZnAembvFnBP1W6jJEL94sJnBChDN3sGJZURlImH8LZZhtyNpv0wF8qN65aXk1bL6lIllg6UdNcw9UJx0sHWZnH+LupENmkY8j/RsDP8cUxqJ7UdSb/aLDcayD/4AP1ngWO6yrQgOwo4MJA6qL8WmhGMvKfcN/djB78eQPj37wJgndprptK5H3ZNACljnB3RFHIhkOPlom6eQIdG5BxX1vLafg3oht7JuIWFK0+QPkOHkUqL2mTmMC/ukMvT1NnHNl6FPlzcEX1LYYjYgIvlJr25LVJ+eKdLMewCVO3ckUBNjEpmoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNg5Z5O2VqviIf9oXaxfNxIC+bS3KWWRIaAP4lmf+io=;
 b=JyhY6Eq41sCt+H9ST/H0fsppudXX59jtI3XiPVA3RrOuP9GOP5RWsKYAVufoRcxIkzQ1ibU7DbyIpZfdY61ETfKps1leUwGanTIiK1rF5FquQi3gwI0T8ZLO0ACiEr9Qn7e/icDCeiLukoJQgUC6pXSpzBBkf7yZvwS84OK4Is2nd8umZm5sdccI3ohq0IIgIy+uIPXdycwEDQXoaUprVNXXCq53MmNfwOsvqKxXbOPYgs6fa0oKITtPlX5lq1BaclQnGei27AEmOWip/rVr++NO8OF/Ee2Ti1jO5HJ7ufqdzEyisc47ceMej3DK4xI3g7u7R4sLJ+MRxsOhUNGgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by BN9PR11MB5560.namprd11.prod.outlook.com (2603:10b6:408:105::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 13:04:26 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%6]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 13:04:26 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: RE: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
Thread-Topic: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
Thread-Index: AQHZNJCMQmymIWJSZkyL6kMe8Xemvq64mFSAgAACLoCAAAeogIABbXRg
Date: Wed, 1 Feb 2023 13:04:25 +0000
Message-ID: <MN2PR11MB41732681AABAD7BA573E1E9DEFD19@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
 <Y9koH+ElplpptxWp@redhat.com>
 <CAMxuvazwG372R9TtFLZLzDx_Zm8kzQRu9-guizfwegFvA=9gCg@mail.gmail.com>
In-Reply-To: <CAMxuvazwG372R9TtFLZLzDx_Zm8kzQRu9-guizfwegFvA=9gCg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|BN9PR11MB5560:EE_
x-ms-office365-filtering-correlation-id: 86c8be5e-3ece-43d2-5e17-08db0454d88c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8picayTlfcOgYhLLzV3vXWXftRzNeYnOS/ytm47pHRjZN9NtuXsvFtEaIB2wkV+5bQ/V8jTapmskIF1VQBxKN4sltVmwhAB7fCJNPkS2y6Gca0d98GBXp9nmsLYzIFq+5aOrWMbu8loeuMXiJVF6WcwHTGW8ZWcbxrwtInv96NYBuEcz1MWh8xMs5Y3IovWOZeb4/4b36uQ79RbRO8R5sEuB2ptgik+BE5DK/ZD/IoSY9bXIOJoJSvTc12UQ4LVjQZLqGjJBljU3Al3j0QTO5Y9No6PFykPvv8rxtHkpY6kmT8HNjDAb5MzsOjTJTrrb5nQYioIusCPji05Fib01OZVqgphAwRqWAPHeK+rsGOYMxAjvp/N3t669I9+eh4hiru2971jGo7HY7HLGyNSO3LiA8NWGMVrTz6/gL+DbkBChF1WhJWPb9iEN2jcfF+3fkmb1+dnUWABVVAm4VQuiQ8b2UA1Rt7aBzlutaqU+JRvkqbA5reRtOMBnveCh675BRHMd5mVcgQjKokpCAvIiCmk/HnqBQwoaoXSCDxcpnUeB+BzZdgzs8/f8ieO0RwO0Rn/q7fUilxCd/mda7q0jd/HkmBcbu//zCj/kxBN/BgXIhYaEHzXNZPAIbsXVphZxo3k8QhbIjY26FgLral57wEEteZxHVKzUdSsCBFXqmJrurZql+d9Qoccw7V6zCetVp8z5Jc4o2tB5RD2sUxg8QMb3qLtc0/i/sN5kkn8lDVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199018)(8676002)(66446008)(66556008)(76116006)(83380400001)(64756008)(66476007)(86362001)(66946007)(5660300002)(41300700001)(38070700005)(7696005)(33656002)(71200400001)(55016003)(2906002)(478600001)(966005)(316002)(8936002)(6506007)(38100700002)(53546011)(26005)(186003)(9686003)(122000001)(52536014)(4326008)(66899018)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bi9zSWc5bDcrZHB1d25TUUsvbDBacXJGQ3lVeUt5M3cxdS83ZTFUUlNWdVJD?=
 =?utf-8?B?R3J0Ty9GOTVBVnJnWTFyKy9MUzVwUUE3S0MxUXNRbllWbUxkQkpud1JQNnp1?=
 =?utf-8?B?VWhkUzBteHR3YmxzTkdnQkVxY0pnMmFuZjZYc3l5aHZJSkdIOFBCSnREUnVy?=
 =?utf-8?B?OFZDV0hQUVcvWmRXcXYvK1hjbmc5YVFNZm9pZDRyOFlCVE9idXpYVXdxZk1X?=
 =?utf-8?B?TGFOWDd1dUZxVVBzMEMwdVVURW9tQTJXN3NLanNzNzJoSTVoY3VId2UxbTZD?=
 =?utf-8?B?eWQ3SEtLZ3dPMTZsVWhZb05tYnZGYlhHMmRmWEhTZXZOT2cwNFUyM2pEdHBp?=
 =?utf-8?B?Z1JTL3pMY0hra0MwRERmK0ZqUElNaHcvODd2OTBRdENmOWtFd0lEUnAvZEJ2?=
 =?utf-8?B?Q3ZXemhzSC94MjRLTmw0eGd2alRDbGRvSFRIeW5kb0lSUXo2NXFHL0Z1NStu?=
 =?utf-8?B?MENuTVFDTEthRHFHVmNvUXBaVk9DRjgzbTVHRFdOWlVjZElweW9rcWNKcm9m?=
 =?utf-8?B?V21DdG81S1V0ZTVCSlBLMzBuY3pLYkJkSFB4Qk9xajRCOHB5Y1ZuNjZIN0p3?=
 =?utf-8?B?ZDBtOHQ0elkwZFpvL01HbUl2QWR1MmRsSkVsc005SEg2Lzlna29HNVV2TnJH?=
 =?utf-8?B?b00zWm5mNklIdVZOK3cyZjh3VFZwTHlCNTl0VzJYQ0lhSFFBejYyZkNzL3Zy?=
 =?utf-8?B?VnF1d2VzNTRIM3dXYWdTRTJHVDlxcEZrZXJJc3V2ZGoxb2lEd3JLRk9wa21l?=
 =?utf-8?B?TzM0ZjR1aTJYdkNrYnVZSzhNTXVTRXQ1eUx5QUtva0ZNRWZYL05JdVJ0U0g5?=
 =?utf-8?B?bTJRaFJXbTdmb285OWVhbTZYS0NKSDFZMUJrOEg2L1Zzb09Icm82eFNLdjFt?=
 =?utf-8?B?Q3NZV3BxUkJXd04zZ0ZSMnpzcUJJK2dpMGY2N1lxUmhGVWw3OWkwQ1dSbVM2?=
 =?utf-8?B?OEVwTGxNc29mUjZGRDNkclA1UWpldzlOUlhjZkphTDB3aldWNVMwNHlFRHdm?=
 =?utf-8?B?YnRXZWpaZU9CMGRyMU5zU2xieFRHQzB5dytHVXdmSXFsdU9mYnNRQ3ZLekpi?=
 =?utf-8?B?Z21JQ1oxRnU4RW93bExwUnpqSlluV1U1a29taExLMHoyWlNBK0VwR2Q5TEJ6?=
 =?utf-8?B?b3BSd2RaSU4zdTlXak5hU204NjlGT2M2ZU5Tb1VwT0hhVk0yYlM0VEVHNGNq?=
 =?utf-8?B?Q3NVZzZxd1JYVnNReFU4RjNseVk4UE4rRkhpMG5QT1VGK2g2U2orQ25hM051?=
 =?utf-8?B?ZnJ4MlBCWm9hSUt0S3F5MmMxU3pSUVBCdmlwb3A0emtsMGswaU05czlYSkpJ?=
 =?utf-8?B?NXA3a0o4Vk94dDYzSFpFUlo1dU1EVWFKbDNjSlE4Z3lvSlllS20zVDJrWmdx?=
 =?utf-8?B?VkpFUmtwNzltb2k1UW8xc0ZaWEcrc0pXYzdEYjRVUmlIUUNHeGVmb200MS95?=
 =?utf-8?B?U1RwWVBhUG1wYWFDNnJCNWhCMjBoN1VadG0rWGE4OTc5YUh5VE5jQTRjNWhj?=
 =?utf-8?B?bFlDdGtNUU9nK2pLNk45eGdHekg1ZHllNHo1UXZIc21FMlhpbXhFZmRUZ3lF?=
 =?utf-8?B?SXVLdHI5N2djYmdOMWlLL2trTUF1Z3Q1MTFhQy91WDBtVjZZc0tNZVJzVUlq?=
 =?utf-8?B?RDB6VXEvMHh4STNyTm9lckIxWVVyZW9yd2FvNEVVWVdGci9EQVhtcms5Lytr?=
 =?utf-8?B?RHRkMlZNd3JxK0haczNYTy90c2xaOVF0cVErZ01vcVNseTZ6UWNqVEZmemty?=
 =?utf-8?B?eWprbVdkNDVpNjh1WkpoRGUxbUduaHg5bFMyNFY5enRXQlhGb0o3ZVVaMElH?=
 =?utf-8?B?Z2Ztenk3U3doQm5MWHczeE9jQ21WTnZscXhaT25FOWJBWmlNSTl0cWhYeENo?=
 =?utf-8?B?Nk5hREIwYWpzWEhjbHkyOFZOVURLanowNytLWlVJbUVMZ1RwK1REVG5mL0JT?=
 =?utf-8?B?TFlJUnRuY3ZraVp6UnZ2NUluYlNpVWRHTHJpaHkzVElqaTlESjdaMlI5SDMv?=
 =?utf-8?B?UjE3T3hRUlN0Tm9YNEFVUkUxMnBwVXJKc1V1enU1ZGtjQmQzTExMb0R0eWE4?=
 =?utf-8?B?SXoyUG5BSjRXUDloMVk1d2FMc1prdG5hNC9sZHRWZS9nd1R6THFkNDB0bG9P?=
 =?utf-8?B?UmJDTEVOUXBSWTVNMHFFNTNmMmp0WGhjZXBpd0t4U2pRdlVDR3NDQjRoRDRs?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c8be5e-3ece-43d2-5e17-08db0454d88c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 13:04:25.9586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRt74TWTG5sSedcuWAzJTQQ4o2Y1fl5C2q9WSgAfFP7fVg2UHL3eFZKMWmIjTJuKTzMINpra9O1DhcSEja58JKZayYIMaBvJaj845Qnsx5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5560
X-Proofpoint-GUID: BoYz1udG7hYihIqFBwYeL9Slo0GstoDc
X-Proofpoint-ORIG-GUID: BoYz1udG7hYihIqFBwYeL9Slo0GstoDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=774 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010112
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1396ca8274=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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

DQoNCj4gRnJvbTogTWFyYy1BbmRyw6kgTHVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5j
b20+IA0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDMxLCAyMDIzIDIzOjA3DQo+IFRvOiBEYW5p
ZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiBDYzogTWVuZywgQmluIDxC
aW4uTWVuZ0B3aW5kcml2ZXIuY29tPjsgR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz47IENocmlz
dGlhbiBTY2hvZW5lYmVjayA8cWVtdV9vc3NAY3J1ZGVieXRlLmNvbT47IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZzsgU2hpLCBHdW9odWFpIDxHdW9odWFpLlNoaUB3aW5kcml2ZXIuY29tPjsgTGF1cmVu
dCA+IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDAwLzE2XSBody85cGZzOiBBZGQgOXBmcyBzdXBwb3J0IGZvciBXaW5kb3dzDQo+DQo+IENBVVRJ
T046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQh
DQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gSGkNCj4N
Cj4gT24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgNjozOSBQTSBEYW5pZWwgUC4gQmVycmFuZ8OpIDxt
YWlsdG86YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IE9uIFR1ZSwgSmFuIDMxLCAyMDIz
IGF0IDA2OjMxOjM5UE0gKzA0MDAsIE1hcmMtQW5kcsOpIEx1cmVhdSB3cm90ZToNCj4gPiBIaQ0K
PiA+IA0KPiA+IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDE6NTIgUE0gQmluIE1lbmcgPG1haWx0
bzpiaW4ubWVuZ0B3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiANCj4gPiA+IEF0IHByZXNlbnQg
dGhlcmUgaXMgbm8gV2luZG93cyBzdXBwb3J0IGZvciA5cCBmaWxlIHN5c3RlbS4NCj4gPiA+IFRo
aXMgc2VyaWVzIGFkZHMgaW5pdGlhbCBXaW5kb3dzIHN1cHBvcnQgZm9yIDlwIGZpbGUgc3lzdGVt
Lg0KPiA+ID4NCj4gPiA+ICdsb2NhbCcgZmlsZSBzeXN0ZW0gYmFja2VuZCBkcml2ZXIgaXMgc3Vw
cG9ydGVkIG9uIFdpbmRvd3MsDQo+ID4gPiBpbmNsdWRpbmcgb3BlbiwgcmVhZCwgd3JpdGUsIGNs
b3NlLCByZW5hbWUsIHJlbW92ZSwgZXRjLg0KPiA+ID4gQWxsIHNlY3VyaXR5IG1vZGVscyBhcmUg
c3VwcG9ydGVkLiBUaGUgbWFwcGVkIChtYXBwZWQteGF0dHIpDQo+ID4gPiBzZWN1cml0eSBtb2Rl
bCBpcyBpbXBsZW1lbnRlZCB1c2luZyBOVEZTIEFsdGVybmF0ZSBEYXRhIFN0cmVhbQ0KPiA+ID4g
KEFEUykgc28gdGhlIDlwIGV4cG9ydCBwYXRoIHNoYWxsIGJlIG9uIGFuIE5URlMgcGFydGl0aW9u
Lg0KPiA+ID4NCj4gPiA+ICdzeW50aCcgZHJpdmVyIGlzIGFkYXB0ZWQgZm9yIFdpbmRvd3MgdG9v
IHNvIHRoYXQgd2UgY2FuIG5vdw0KPiA+ID4gcnVuIHF0ZXN0cyBvbiBXaW5kb3dzIGZvciA5cCBy
ZWxhdGVkIHJlZ3Jlc3Npb24gdGVzdGluZy4NCj4gPiA+DQo+ID4gPiBFeGFtcGxlIGNvbW1hbmQg
bGluZSB0byB0ZXN0Og0KPiA+ID4NCj4gPiA+wqAgwqAiLWZzZGV2IGxvY2FsLHBhdGg9YzpcbXN5
czY0LHNlY3VyaXR5X21vZGVsPW1hcHBlZCxpZD1wOSAtZGV2aWNlDQo+ID4gPiB2aXJ0aW8tOXAt
cGNpLGZzZGV2PXA5LG1vdW50X3RhZz1wOWZzIg0KPiA+ID4NCj4gPiA+IEJhc2UtY29tbWl0OiAx
MzM1NmVkYjg3NTA2YzE0OGIxNjNiOGM3ZWIwNjk1NjQ3ZDAwYzJhDQo+ID4gPg0KPiA+ID4gQ2hh
bmdlcyBpbiB2NDoNCj4gPiA+IC0gRml4ZWQgOXBmcyBtb3VudGVkIGFzIHJlYWQtb25seSBpc3N1
ZSBvbiBXaW5kb3dzIGhvc3QsIGFkZGluZyBhDQo+ID4gPsKgIMKgd2luMzJfZXJyb3JfdG9fcG9z
aXgoKSB0byB0cmFuc2xhdGUgV2luZG93cyBuYXRpdmUgQVBJIGVycm9yIHRvDQo+ID4gPsKgIMKg
UE9TSVggb25lLg0KPiA+ID4gLSBGaXhlZCBlcnJvcnMgb2YgaGFuZGxpbmcgc3ltYm9saWMgbGlu
a3MNCj4gPiA+IC0gQWRkZWQgZm9yd2FyZCBkZWNsYXJhdGlvbiB0byBhdm9pZCB1c2luZyAndm9p
ZCAqJw0KPiA+ID4gLSBJbXBsZW1lbnRlZCBXaW5kb3dzIHNwZWNpZmljIHh4eGRpcigpIEFQSXMg
Zm9yIHNhZmUgZGlyZWN0b3J5IGFjY2Vzcw0KPiA+ID4NCj4gPiA+DQo+ID4gU29ycnkgdG8gbG9v
ayBhIGJpdCBsYXRlIGF0IHRoaXMgc2VyaWVzLCBJIGRvbid0IGtub3cgd2hhdCB3YXMgZGlzY3Vz
c2VkDQo+ID4gcHJldmlvdXNseS4NCj4gPiANCj4gPiBNeSBnZW5lcmFsIGZlZWxpbmcgaXMgdGhh
dCBhIGxvdCBvZiB0aGlzIEZTIHBvcnRhYmlsaXR5IHdvcmsgd291bGQgYmUNCj4gPiBiZXR0ZXIg
aGFuZGxlZCBieSB1c2luZyBHSU8gKGV2ZW4gdGhvdWdoIHRoaXMgbWF5IGFkZCBzb21lIGV4dHJh
DQo+ID4gZGVwZW5kZW5jeSkuIEdJTyBsYWNrcyBzb21lIGZlYXR1cmVzIG9uIHdpbjMyIChmb3Ig
ZXhhbXBsZSB4YXR0cmlidXRlcyBvbg0KPiA+IHdpbjMyKSwgYnV0IHRoZXkgY291bGQgaGF2ZSBi
ZWVuIHByb3Bvc2VkIHRoZXJlIHRvbyBhbmQgYmVuZWZpdGluZyBvdGhlcg0KPiA+IGFwcHMuDQoN
CkdJTyBmdW5jdGlvbiBpcyBhY3R1YWxseSBzYW1lIGFzIE1pbkdXIEFQSXMsIHdoaWNoIGlzIG5v
dCBzYWZldHkgYXMgTWluR1cgKGRpc2N1c3NlZCBpbiBwcmV2aW91cyB2ZXJzaW9ucykuDQoNCmh0
dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vYmxvYi9tYWluL2dsaWIvZGlyZW50
L2RpcmVudC5jI0w2MQ0KaHR0cHM6Ly9naXRodWIuY29tL0FsZXhwdXgvbWluZ3ctdzY0L2Jsb2Iv
bWFzdGVyL21pbmd3LXc2NC1jcnQvbWlzYy9kaXJlbnQuYyNMNDINCg0KR0lPIGZ1bmN0aW9uIGFs
c28gZG9lcyBub3QgaGFuZGxlIHN5bWJvbGljIGxpbmtzIG9uIFdpbmRvd3MgaG9zdCwgdGhpcyBt
YXkgY2F1c2Ugc2VjdXJpdHkgaXNzdWVzLg0KR0lPIGZ1bmN0aW9ucyBhbHNvIHVzZSBXaW5kb3dz
IFBPU0lYIEFQSXMgd2l0aG91dCBleHRyYSBzZWN1cml0eSBjaGVja3MgKGRvZXMgbm90IHByb3Zp
ZGUgTk9fRk9MTE9XIGZsYWdzKToNCmh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGli
Ly0vYmxvYi9tYWluL2dsaWIvZ3N0ZGlvLmMjTDEwNTANCg0KOXBmcyBuZWVkIGZ1bmN0aW9ucyBs
aWtlIG9wZW5hdCgpIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBzdWItc2VxdWVuY2Ugb3BlcmF0aW9u
IGlzIHdvcmtpbmcgaW4gdGhlIGV4cGVjdGVkIHBhcmVudC4NCg0KU28gdXNpbmcgR0lPIHdpbGwg
c3RpbGwgaGF2ZSBzZWN1cml0eSBpc3N1ZXMuDQoNCj4NCj4gVGhlIGN1cnJlbnRseSBpbXBsIHJl
bGllcyBvbiB0aGUgb3BlbmF0LCBmc3RhdGF0LCBta2RpcmF0LCByZW5hbWVhdCwNCj4gdXRpbWVu
c2F0LCB1bmxpbmthdCBmdW5jdGlvbnMuIElJUkMgdGhpcyB3YXMgaW4gb3JkZXIgdG8gZGVhbCB3
aXRoDQo+IHZhcmlvdXMgc2VjdXJpdHkgdnVsbmVyYWJpbGl0aWVzIHRoYXQgZXhpc3QgZHVlIHRv
IHJhY2UgY29uZGl0aW9ucy4NCj4gQUZBSUssIHRoZXJlJ3Mgbm8gd2F5IHRvIGFjaGlldmUgdGhl
IHNhbWUgd2l0aCBHSU8gYXMgaXRzIGEgaGlnaGVyDQo+IGxldmVsIEFQSSB3aGljaCBkb2Vzbid0
IGV4cG9zZSB0aGlzIGtpbmQgb2YgZnVuY3Rpb25hbGl0eQ0KPg0KPiBDb3JyZWN0IG1lIGlmIEkg
YW0gd3JvbmcsIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBob2xkIG11Y2ggc2luY2UgdGhlIHBy
b3RvY29sIGRvZXNuJ3Qga2VlcCBhIGNvbnRleHQgKHdpdGggYXNzb2NpYXRlZCBmZHMpIGFyb3Vu
ZC4gQnV0IHBlcmhhcHMgR0lPIEFQSSBhbG9uZSBjYW4ndCBwcm92aWRlIHNhZmUgaW1wbGVtZW50
YXRpb25zIG9mIHRoZSBGaWxlT3BlcmF0aW9ucyBjYWxsYmFja3M/DQo+DQo+IEFsc28gYSBsb3Qg
b2YgOXAtdW5peCBzcGVjaWZpYyBkZXRhaWxzIG1heSBub3QgbWFwIGVhc2lseSB0byB0aGUgR0lP
IEFQSS4gSG93IHRoZXkgY2FuIGJlIHBvcnRlZCB0byB3aW4zMiBpcyBjZXJ0YWlubHkgYSBjaGFs
bGVuZ2UsIG1vc3RseSBkdXBsaWNhdGluZyB0aGUgZWZmb3J0IGRvbmUgaW4gR0lPIHRvIG1lLg0K
DQpUaGFua3MNCkd1b2h1YWkNCg==

