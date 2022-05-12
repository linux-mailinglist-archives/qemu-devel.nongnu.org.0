Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58D525576
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:14:04 +0200 (CEST)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEGB-0002Dt-0D
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1npE7G-00029z-0L; Thu, 12 May 2022 15:04:50 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:14608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613189c29a=pdel@fb.com>)
 id 1npE7D-0004rE-Je; Thu, 12 May 2022 15:04:49 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CH9dXf016657;
 Thu, 12 May 2022 12:04:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=36eW9K+oiDhmyb5Y7GIUfCP9wxfC4GFaun8iTtUBmME=;
 b=aLJ4SduacPbwK3NqzKvOZHfAsJcK0POFjlCsF2GXxTPQ8o9kTVISsrqs1EIINYMsD2yX
 5muiduuG7V06Cz2KCJLmcjL9uLXtCUWjOnfvavtrrc8V2gjsP7nf6K2He9izEwSFjCZ3
 reWyRVAudOA9t0Ug95/GNBQIM1aQMFMpTKo= 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fyx8pfh3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 12:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuFV7kdCDQn8NLyzI97xOC99j/W6wdPMQGYI2eCsQYuS5QtNAQNLUJuARihKmI39ewaUZ2mxByFa4NewjqXbClK4tfOdsb5v6ewra/q3O9YLZwLlJ1B9fYyo4doObrUych1Xlqhprn7WNNVuhDz0Gmsd0KcVBHupi7K0GCnRePQjElNDfU8+YIe40qCWulxyKvmPdHTB6CW3KoAsiCQsbWdZQ+/gCyh1ycp8sMfgGbXYNC8kn6i9rtltQXVpW1D4V/ner/1lidLMPI+oOoySgQrAiU81PjCTIue8v3/5IV2GR+JIv0xuPeODs8UQYTa3jqlnNx/QT007956riAIIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36eW9K+oiDhmyb5Y7GIUfCP9wxfC4GFaun8iTtUBmME=;
 b=k1VuRH9UCkYWnjs6HJbSv07nZhr4hk3ThPjL7x9pS2JCIThNwW/+GXqqC9RuzQS/7vXKZ7rrcPoIKmhQ4JDAVnyKXYNRwkFL9I2IaUn+jOAC/PmA8R1/1v+GyPn5sHTyZrhtMynVX2vNv55AoDhlqIe74q8udyqDOT8JlNl781bDQNBmWouzNbGFWes+siKVQkFYjsQKLP6JUTjkKtpRr+bs0mvNk5pDeX+G89cylZGUzJsHiiyz/v+XJsKF3RalKo1Hq7Y11oCD0rN6Wh2o8ciNPvXvX7cs/G2PDx9QMEOAmjj5/+Zz5B1EgHHGgsQDArAfVClUn8gSN6rSQLX/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by PH0PR15MB4399.namprd15.prod.outlook.com (2603:10b6:510:81::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 19:04:29 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 19:04:29 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 Alistair Francis <alistair@alistair23.me>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Topic: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Thread-Index: AQHYZZ5ZWw2cAfFTiUOhGwZ1HOByLq0atjSAgADkxAA=
Date: Thu, 12 May 2022 19:04:28 +0000
Message-ID: <0C5778E9-EB9C-44EC-ABE3-65DBC37DB708@fb.com>
References: <irischenlj@fb.com> <20220512005411.2503971-1-irischenlj@fb.com>
 <ffbba219-a46e-430b-15b6-5e6a13240cbb@kaod.org>
In-Reply-To: <ffbba219-a46e-430b-15b6-5e6a13240cbb@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01ee0e99-b930-4a17-8621-08da344a3d79
x-ms-traffictypediagnostic: PH0PR15MB4399:EE_
x-microsoft-antispam-prvs: <PH0PR15MB4399E0A1A9C2ED93226CE61DACCB9@PH0PR15MB4399.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dY5fPaXOZltIyQamgX/K0r2Rkt2HSouVlQe758rjJ2d2ZrvRcltP9K0p8gpM9htAJcpG40iQNdwh4C36nptCxxCofUgIsL33ORZz6TaELNC1DsTuS+/K9VOYJ/dPbLfNiECiRgI5olNTEgpu/Ef6fYhL0wXlCYVesmQdWq1DJOPC0+tklBGRLtqbyc3JUUY85vr7+xej9ks8HJvTq99IuxY80huyEU6ZTYg4yGLjp0cZHxwwC/nV7auItThxaAhORPfNYFIgQhZZQfYDs7afPMZTM8SBwCWRT9yze337wlY8acKABZ+hrmazs7iVcqLmfW8LWEw8o84YO+Yl0IYcN7/X6rlP9/5IYh5WyhzZQGhcTMQIq1AEZTeTiEVFM3i+zB4lQs4Q7QDP1I6YPdohIUolw1t7FsCXwFYoax1fSGfntCn3QIzovTKhxb4UfXBWZY/OJBmPmO9OL4nHiu6az8jV371RpuAjV1OrzLAPZG3g46ELVnNBMOKYhqTX9vFQMMaRpmrClTKlD7AnwDl27rn2S6lZG4pYujxYrz2cxoROgLEMok5LGIApjNf1gjYP8W9pFq9+EjKxT5xOXFJoztTIM79B0/C+yXRizKNZkKv9eZzbDMC8AgqWV0tCtZeRAsiQnpBOVgl2Ax48vtz7Eo9TlkGKuAz3KrJ5ePfJquzmA/IkGS1hGeBe7SyRhzFntNYfSS7BnxBxap0jRsPnEg3bMjm/HhL1BSuOkrhBm1v/nA3MSU4m0s0LvxXcw/8g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(7416002)(6486002)(76116006)(66946007)(508600001)(71200400001)(86362001)(4326008)(8676002)(2906002)(186003)(36756003)(33656002)(83380400001)(66574015)(2616005)(109986005)(8936002)(6512007)(6506007)(53546011)(5660300002)(38100700002)(122000001)(38070700005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzhxT1pWZDlreVlaaVg0UEJTaFh4S1IvN3JNdlFjZGpaUmdkdEhvZGZEeFNn?=
 =?utf-8?B?c0Ftamc0cjZSN3JwQnRHM05NbGl4WE42dm5uOWg5NWg4M21haStoWWsvc2pL?=
 =?utf-8?B?QzJmYWwwbFlXYk1sdXpwUFdmWHc1QXJGSnpEVFdMQXp1M29BUnBycFZWdU5u?=
 =?utf-8?B?NGtGZGJJWTE0R3pPczJxRTBUZ0J6Mzh2c01kL3lZNEVqZXM5NXNHMTZVVVdh?=
 =?utf-8?B?cEpiOGcvMTN1WXlXZHpvNUY3NW1FN2U3dW1xTElxNWFUVENqdzFaVnlFUURZ?=
 =?utf-8?B?TDdlRDJ6c090dXg2bkRBNEt6MlU0Vzg5US95QXA5REZuU3lueVIrNjZQYTQv?=
 =?utf-8?B?OVlDMHZmVTFjRVc4cWVGSlFGYkkyQm9oaVZ4NlBsQzZzcDRLc3hPaEQvdWE0?=
 =?utf-8?B?VmQ0YnNoeC9NWjZUYzdyMDBlMVVKMkNRdmc4c0VJVjFMUjlMY1U0dWZ4dWta?=
 =?utf-8?B?N1NaMU8wOGtaQzFKRWtDMUkvRnlMQjNKejM1VEdISnhXU2ttK0xNeHhRNThz?=
 =?utf-8?B?M2VVb0tScVVSaFBCSE9qZEY3Zk5Ra0o1WW9yRER5YkpUQnlLTlphRkYzSFhy?=
 =?utf-8?B?L1daQzE4N0lQY0I4N2poVVl5dW9aVzVGLyt6RCtjcmNRMVNRYXU3SWNhTVli?=
 =?utf-8?B?R2ZZTnJ6Mmc5QXNIaEN6dUMzdFRpdE5LcjNlUWplTDhCSklrdGpKaHJzQjRF?=
 =?utf-8?B?QjZVTndjV2t1cjdwbWFmd1ZOV0JseUFQY0xQeUhEUjU0bnkwWm5ZVWNDQlRX?=
 =?utf-8?B?RWhtVy81QjdBek5OV1g1Q0s0ZFpEeHNzaGRHRzVNTHpBSEwvN3B3UnpoMFgr?=
 =?utf-8?B?QkZ4MlJwMmRKT1h0S2NpdDZadHBHVmNpSWVSTTBhc0ZjRms2c3pTUnh0Wlpa?=
 =?utf-8?B?ckVwNkRlS0ptay80dVRRbUwyVFFDUDlJSkRuaE1qUmNYS1B1UFhSTWpOdFBX?=
 =?utf-8?B?TWRERVVSbXUrMTZFN0g4Y3VzUjd5Y2MwbXpLbVVaR2RDRHZ3WjVralZIc2Mx?=
 =?utf-8?B?VVBQR0JpU2hJU01wWXdBZEFoVk1TUnJ4T3cyR1VMOWVoYldJRXJJN2lpTE5V?=
 =?utf-8?B?NXRjcHdiVE9HbmZhZ3hheGpGd1JMdGw5amFTYTdlRTh1YW1xQTJlRFNLNERM?=
 =?utf-8?B?clQrR1NXZ0huYkxMWEhsTUUzNW1XNStjU0UzSFE5THFRUi9uREpsN1o3OG5r?=
 =?utf-8?B?TzdFMW1maXM4V3ZLUitKQ2RkbFI2dEdrbFdZZEsxeGZweU9xeTNkS3kyUVN3?=
 =?utf-8?B?S2g1MHp4NlhqamhnanpLbjJSZEJOTnVvQW9vcU1sNXVYeFBIb0NmTEFDOEdP?=
 =?utf-8?B?T3kvbHVTcWtUdFlkQlFoa3l2eVJoU1ZLSFAyNHBITnhhNlErTXh1TXhDVHBJ?=
 =?utf-8?B?VEtaSDJtdHV4VGRGVnZMN29Sa244K3MrQW9iWTd6VFhCcXhkTmVYekxsSE43?=
 =?utf-8?B?V0Q5cG83d21Xck1KUW9UQkZDaVZsZjQ4UEZVY2wwMWxEQUpVNERxZDVFc2F4?=
 =?utf-8?B?cHpNSGo2OGJwYit2TnRYUzlnQncrcS9BblBHNWxoMmtnWUxEakdKSnBybmE3?=
 =?utf-8?B?eW4zaElxbGtqRlhEMkk3Nnl2c2o4Wllqamp4a0x0L1oyVk54R3k1UGMveDJK?=
 =?utf-8?B?cXFqOUw5MW5PMnZHVWVZLzJDMHlsaUozRStFMEJKbVBLZFdUZnlMUlE1MGc0?=
 =?utf-8?B?elFhTTJiR3lkRTRXdEt0TDZkeGM5RGJHK1Jsb3F2RXNzdm1zOWw1TndlWGM4?=
 =?utf-8?B?RUVMNHpOeFlTenJ2ZmtKZUJpZlZGblM3RFNVdW1oWlkxNjdOUmJaZC9kSm54?=
 =?utf-8?B?M1pubm1ML3JvYU5qbWppMHp6aUVUMWRXU2YyOFZNOTFhS25Jb25CSGFpV0N4?=
 =?utf-8?B?a1l2eHl0d3ptZ3ZKMS9sUUszSXVHcEIxOFpjWFh2bGpya0w5SUN3dncwaFZV?=
 =?utf-8?B?Zy9Jck1ERGVwWCtTMzZUK0c3NmJwRjV1WlFCdzBrdVA5ZENuKzVtcDRYVWZG?=
 =?utf-8?B?bHZZSDhsS2tkK2FaQ0NLQmpGNzAxK3prRnVYcWsrQnB5TGVqZys3UDlxajN5?=
 =?utf-8?B?T1FMNGUxTDQ2YW45M09jSTdReVM3WjV1REF6Y1BWWG5YeDYrTWNkeHZvMkh6?=
 =?utf-8?B?ZWt4NVF0WVlzdTdXNVFVa1JNRUU3eDFaN2lWd0FTdktmeDA5bW45L1NSY0FJ?=
 =?utf-8?B?dE5Ca1cwQTVkVVFZenViK3BnNi9QSjJ6am9ZcVBvRDZpQ1FrdHg2WVFsRk5V?=
 =?utf-8?B?cW1RZUs3b3hZcmhrdjZXWlcrTFZYTU9YRkdrdkx1eklXZ20wR1o0N2hncHVP?=
 =?utf-8?B?OVB5NlNGaDN1VlBYZ3N5T0l3d0lkTGovdy9ZekIyR2VINURaWWNLRnZOeUIy?=
 =?utf-8?Q?Y+uWJMY5m/wRAnvE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10CD96373ABE2847913960CC5AB55063@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ee0e99-b930-4a17-8621-08da344a3d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 19:04:28.9788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7bSQpQcIV6g0wJ+mRmLw7GCH20AQg6CVT5txKlUrinw+U0CeBuWKnRY2S2+Rr1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4399
X-Proofpoint-GUID: n9SkeGkdIZxfnXOUjL6bn5Nv_7rBj5en
X-Proofpoint-ORIG-GUID: n9SkeGkdIZxfnXOUjL6bn5Nv_7rBj5en
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_16,2022-05-12_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=613189c29a=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

DQoNCj4gT24gTWF5IDExLCAyMDIyLCBhdCAxMDoyNSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbyBJcmlzLA0KPiANCj4gWyBGaXhpbmcgVGhv
bWFzIGVtYWlsIF0NCj4gDQo+IE9uIDUvMTIvMjIgMDI6NTQsIElyaXMgQ2hlbiB2aWEgd3JvdGU6
DQo+PiBUaGUgd3JpdGVfZW5hYmxlIGxhdGNoIHByb3BlcnR5IGlzIG5vdCBjdXJyZW50bHkgZXhw
b3NlZC4NCj4+IFRoaXMgY29tbWl0IG1ha2VzIGl0IGEgbW9kaWZpYWJsZSBwcm9wZXJ0eSB1c2lu
ZyBnZXQvc2V0IG1ldGhvZHMuDQo+PiBTaWduZWQtb2ZmLWJ5OiBJcmlzIENoZW4gPGlyaXNjaGVu
bGpAZmIuY29tPg0KPj4gLS0tDQo+PiBSYW4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgb24gdGhl
IHBhdGNoIGFuZCBhZGRlZCBhIGRlc2NyaXB0aW9uLiBGaXhlZCBjb21tZW50cyByZWdhcmRpbmcg
REVGSU5FX1BST1BfQk9PTC4NCj4gDQo+IFlvdSBzaG91bGQgcnVuICdtYWtlIGNoZWNrJyBhbHNv
Lg0KPiANCj4gV2l0aCB0aGUgcmVtb3ZhbCBvZiAicWFwaS92aXNpdG9yLmgiIGFuZCB0aGUgcHJv
cGVydHkgbmFtZSBjaGFuZ2UNCj4gaW4gdGhlIHRlc3QsDQoNCkFjdHVhbGx5LCBJIHJlYWxpemVk
IHRoYXQgdGhpcyB0ZXN0IHdpbGwgc3RpbGwgbm90IHBhc3MgZXZlbiB3aXRoIHRoZQ0KV0VMID0+
IHdyaXRlLWVuYWJsZSBmaXguIFRoZSB0ZXN0IGlzIGFzc3VtaW5nIHRoYXQgd2UgY2FuIG1vZGlm
eWluZw0KdGhlIHByb3BlcnR5IGF0IHJ1bnRpbWUgKGFmdGVyIG9iamVjdCByZWFsaXphdGlvbiks
IHdlIHdvdWxkIG5lZWQNCnRvIHNwZWNpZnkgdGhlIHByb3BlcnR5IHdpdGggcmVhbGl6ZWRfc2V0
X2FsbG93ZWQ9dHJ1ZS4NCg0KSSB3b3VsZCBhc3N1bWUgdGhhdCBJcmlzIHByb2JhYmx5IHNob3Vs
ZG7igJl0IHVzZSByZWFsaXplZF9zZXRfYWxsb3dlZD10cnVlLA0Kc28gbWF5YmUgdGhlIHRlc3Qg
c2hvdWxkIGp1c3QgdmVyaWZ5IHJlYWRpbmcgdGhlIHByb3BlcnR5DQphZnRlciBpdCBoYXMgYmVl
biBzZXQgYnkgdGhlIFdSSVRFIEVOQUJMRSBjb21tYW5kLCBlLmcuIHVzZSBxb20tZ2V0DQphZnRl
ciB3cml0ZWIoQVNQRUVEX0ZMQVNIX0JBU0UsIFdSRU4pLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gDQo+IE9uZSBjb21tZW50IGJlbG93
LA0KPiANCj4+IGh3L2Jsb2NrL20yNXA4MC5jIHwgMiArKw0KPj4gdGVzdHMvcXRlc3QvYXNwZWVk
X3NtYy10ZXN0LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPj4gMiBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspDQo+PiBkaWZmIC0tZ2l0IGEvaHcvYmxvY2svbTI1cDgwLmMg
Yi9ody9ibG9jay9tMjVwODAuYw0KPj4gaW5kZXggNDMwZDEyOThhOC4uMDE5YmViNWI3OCAxMDA2
NDQNCj4+IC0tLSBhL2h3L2Jsb2NrL20yNXA4MC5jDQo+PiArKysgYi9ody9ibG9jay9tMjVwODAu
Yw0KPj4gQEAgLTM1LDYgKzM1LDcgQEANCj4+ICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+PiAj
aW5jbHVkZSAidHJhY2UuaCINCj4+ICNpbmNsdWRlICJxb20vb2JqZWN0LmgiDQo+PiArI2luY2x1
ZGUgInFhcGkvdmlzaXRvci5oIg0KPj4gLyogRmllbGRzIGZvciBGbGFzaFBhcnRJbmZvLT5mbGFn
cyAqLw0KPj4gQEAgLTE1NTgsNiArMTU1OSw3IEBAIHN0YXRpYyBpbnQgbTI1cDgwX3ByZV9zYXZl
KHZvaWQgKm9wYXF1ZSkNCj4+IHN0YXRpYyBQcm9wZXJ0eSBtMjVwODBfcHJvcGVydGllc1tdID0g
ew0KPj4gLyogVGhpcyBpcyBkZWZhdWx0IHZhbHVlIGZvciBNaWNyb24gZmxhc2ggKi8NCj4+ICsg
REVGSU5FX1BST1BfQk9PTCgid3JpdGUtZW5hYmxlIiwgRmxhc2gsIHdyaXRlX2VuYWJsZSwgZmFs
c2UpLA0KPj4gREVGSU5FX1BST1BfVUlOVDMyKCJub252b2xhdGlsZS1jZmciLCBGbGFzaCwgbm9u
dm9sYXRpbGVfY2ZnLCAweDhGRkYpLA0KPj4gREVGSU5FX1BST1BfVUlOVDgoInNwYW5zaW9uLWNy
MW52IiwgRmxhc2gsIHNwYW5zaW9uX2NyMW52LCAweDApLA0KPj4gREVGSU5FX1BST1BfVUlOVDgo
InNwYW5zaW9uLWNyMm52IiwgRmxhc2gsIHNwYW5zaW9uX2NyMm52LCAweDgpLA0KPj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL3F0ZXN0L2FzcGVlZF9zbWMtdGVzdC5jIGIvdGVzdHMvcXRlc3QvYXNwZWVk
X3NtYy10ZXN0LmMNCj4+IGluZGV4IDg3YjQwYTBlZjEuLmZjYzE1NmJjMDAgMTAwNjQ0DQo+PiAt
LS0gYS90ZXN0cy9xdGVzdC9hc3BlZWRfc21jLXRlc3QuYw0KPj4gKysrIGIvdGVzdHMvcXRlc3Qv
YXNwZWVkX3NtYy10ZXN0LmMNCj4+IEBAIC0yNiw2ICsyNiw3IEBADQo+PiAjaW5jbHVkZSAicWVt
dS9vc2RlcC5oIg0KPj4gI2luY2x1ZGUgInFlbXUvYnN3YXAuaCINCj4+ICNpbmNsdWRlICJsaWJx
dGVzdC1zaW5nbGUuaCINCj4+ICsjaW5jbHVkZSAicWVtdS9iaXRvcHMuaCINCj4+IC8qDQo+PiAq
IEFTUEVFRCBTUEkgQ29udHJvbGxlciByZWdpc3RlcnMNCj4+IEBAIC00MCw2ICs0MSw3IEBADQo+
PiAjZGVmaW5lIENUUkxfRlJFQURNT0RFIDB4MQ0KPj4gI2RlZmluZSBDVFJMX1dSSVRFTU9ERSAw
eDINCj4+ICNkZWZpbmUgQ1RSTF9VU0VSTU9ERSAweDMNCj4+ICsjZGVmaW5lIFNSX1dFTCBCSVQo
MSkNCj4+ICNkZWZpbmUgQVNQRUVEX0ZNQ19CQVNFIDB4MUU2MjAwMDANCj4+ICNkZWZpbmUgQVNQ
RUVEX0ZMQVNIX0JBU0UgMHgyMDAwMDAwMA0KPj4gQEAgLTQ5LDYgKzUxLDcgQEANCj4+ICovDQo+
PiBlbnVtIHsNCj4+IEpFREVDX1JFQUQgPSAweDlmLA0KPj4gKyBSRFNSID0gMHg1LA0KPj4gQlVM
S19FUkFTRSA9IDB4YzcsDQo+PiBSRUFEID0gMHgwMywNCj4+IFBQID0gMHgwMiwNCj4+IEBAIC0z
NDgsNiArMzUxLDI1IEBAIHN0YXRpYyB2b2lkIHRlc3Rfd3JpdGVfcGFnZV9tZW0odm9pZCkNCj4+
IGZsYXNoX3Jlc2V0KCk7DQo+PiB9DQo+PiArc3RhdGljIHZvaWQgdGVzdF9yZWFkX3N0YXR1c19y
ZWcodm9pZCkNCj4+ICt7DQo+PiArIHVpbnQ4X3QgcjsNCj4+ICsNCj4+ICsgcW1wKCJ7ICdleGVj
dXRlJzogJ3FvbS1zZXQnLCAnYXJndW1lbnRzJzogIg0KPj4gKyAieydwYXRoJzogJy9tYWNoaW5l
L3NvYy9mbWMvc3NpLjAvY2hpbGRbMF0nLCAncHJvcGVydHknOiAnV0VMJywgJ3ZhbHVlJzogdHJ1
ZX19Iik7DQo+IA0KPiBQZXRlciBhZGRlZCBxb21fZ2V0X2Jvb2woKSBhbmQgcW9tX3NldF9ib29s
KCkgaGVscGVycyBpbg0KPiBhc3BlZWRfZ3Bpby10ZXN0LmMsIGl0IG1pZ2h0IGJlIGludGVyZXN0
aW5nIHRvIHJldXNlLg0KPiANCj4gVGhlcmUgYXJlIHNpbWlsYXIgb25lcyBpbiB0aGUgbnBjbTd4
eCB0ZXN0cywgYnR3Lg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCj4gDQo+IA0KPiANCj4+ICsN
Cj4+ICsgc3BpX2NvbmYoQ09ORl9FTkFCTEVfVzApOw0KPj4gKyBzcGlfY3RybF9zdGFydF91c2Vy
KCk7DQo+PiArIHdyaXRlYihBU1BFRURfRkxBU0hfQkFTRSwgUkRTUik7DQo+PiArIHIgPSByZWFk
YihBU1BFRURfRkxBU0hfQkFTRSk7DQo+PiArIHNwaV9jdHJsX3N0b3BfdXNlcigpOw0KPj4gKw0K
Pj4gKyBnX2Fzc2VydF9jbXBoZXgociAmIFNSX1dFTCwgPT0sIFNSX1dFTCk7DQo+PiArDQo+PiAr
IGZsYXNoX3Jlc2V0KCk7DQo+PiArfQ0KPj4gKw0KPj4gc3RhdGljIGNoYXIgdG1wX3BhdGhbXSA9
ICIvdG1wL3F0ZXN0Lm0yNXA4MC5YWFhYWFgiOw0KPj4gaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQ0KPj4gQEAgLTM3Myw2ICszOTUsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
KmFyZ3YpDQo+PiBxdGVzdF9hZGRfZnVuYygiL2FzdDI0MDAvc21jL3dyaXRlX3BhZ2UiLCB0ZXN0
X3dyaXRlX3BhZ2UpOw0KPj4gcXRlc3RfYWRkX2Z1bmMoIi9hc3QyNDAwL3NtYy9yZWFkX3BhZ2Vf
bWVtIiwgdGVzdF9yZWFkX3BhZ2VfbWVtKTsNCj4+IHF0ZXN0X2FkZF9mdW5jKCIvYXN0MjQwMC9z
bWMvd3JpdGVfcGFnZV9tZW0iLCB0ZXN0X3dyaXRlX3BhZ2VfbWVtKTsNCj4+ICsgcXRlc3RfYWRk
X2Z1bmMoIi9hc3QyNDAwL3NtYy9yZWFkX3N0YXR1c19yZWciLCB0ZXN0X3JlYWRfc3RhdHVzX3Jl
Zyk7DQo+PiByZXQgPSBnX3Rlc3RfcnVuKCk7DQoNCg==

