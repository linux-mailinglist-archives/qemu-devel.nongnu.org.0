Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5E4A7D7D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 02:49:35 +0100 (CET)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRFe-0006Uu-2Q
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 20:49:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFRBq-0005Yz-J1; Wed, 02 Feb 2022 20:45:42 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:33797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nFRBk-0005sn-77; Wed, 02 Feb 2022 20:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1643852731; x=1644457531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gu95pF23KXpeLehiVz6mNLapSFgE5P4v7KnNeSZMf/Y=;
 b=ZXsbMh/seZQxTubnFysrccTpDqrkvqwPCdul9I3e73a8SXzz6EYPl0tq
 NORfIytSL7s4OZRrouhA3rAO45ohpU1iEphv2Y5ElwCgx8iNmnKMo3x9Z
 0pqI3zr/9B92NK3IJxKQYTqlPYujKXFtraa6yrDH+nlRL5Q8KgXe5godE U=;
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTNO52TrsjsuY3Tbsqi5CYAvWkos5tMyZbyDUrdeItGlUaTCOxN0s3LVX6aMn42dTQ1ks8f8PDFL6GaVOppaFQAW4FGORmNxFueSUbeazJnvcxki0F6TEbIKAgjl4i/bm+IJbkFcukWGecicAdx/Mw3hUka34tQDkAZm17uloMYx90ONRtHVaQAf8dSQ9a27yKChicEIxnrEBhV3C7S2M1rKioZWjOlNOmsPimCrVvvhJgPUENee9dwoSV6fmDy5ztmKL1B8Fjo/dDE21x5xwCe7Dj/IuJ8nJUTcUFxhH0bqW3Alw0CgVoWuwlK8w/PHX4YVMhOmD0EF4q435FJn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gu95pF23KXpeLehiVz6mNLapSFgE5P4v7KnNeSZMf/Y=;
 b=GDg806VnRGXwk1xuzdHCrROZKTVHyaG6KNjAXgee64dbBoncLo9VQqlSpq6rTQg4tfFeI3y7d9Y7TZ4G3Ph7NhyT0N0WMAaI0bwu7FDj/nfziScWk0oWAaCtCUTrrgzS1CJCPvRB6fE1PZUiNNrqqA9xFFSSMg5SV92h8IzDacjZ/ihk1699tSH2hSQNmHDXXuq+Rq/9+7Rd/EZJvCAKNNof2gPaDwncksqYxcXtugqy5aEoM4dslZ4kckMJBHW8wWMmr0XnWpS/tczvGWXJIymIHT5azIs/Tcgm6qvrdE9C0Kj3FlmSeU2tsmWVIicLTiG50VTiTno9+/xOf3w/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB8757.namprd02.prod.outlook.com
 (2603:10b6:806:1e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 01:45:23 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%6]) with mapi id 15.20.4909.019; Thu, 3 Feb 2022
 01:45:23 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Topic: [RFC PATCH  0/4] improve coverage of vector backend
Thread-Index: AQHYGHGJHyYvQ8C+vki+6vd1G/AKz6yA5OuAgAApILA=
Date: Thu, 3 Feb 2022 01:45:23 +0000
Message-ID: <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
In-Reply-To: <87k0ecvoxu.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1e90b86-9c7e-4c9f-3e9d-08d9e6b6d848
x-ms-traffictypediagnostic: SN4PR0201MB8757:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB8757E5D4D7F42CA5EE906AF4DE289@SN4PR0201MB8757.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ckcc+1qIBy9kIOqDRZBgJli9XHooNhaDtAeXo7dT6tTZ1CJs+Q8b+r3ogEWj1y6SE286F6QS5TMsIlarEyCarb1PKghmTNhVIvJcIQTXcHbpLoSMXaydND52oJB7D10nO+R6KWn4PLpyqVV7GQHjQ8mZVSJJxtdMnb9cdSd0Ydgtg884ix8lcUK6UnJtqQtxRBEbyIon6pzy1FzG9t5GxVF3rOtd/gibAmpGH+aJZylfi7JHkKoZfdZs/2i1JCB+38t1XaQNIwVKj72CBMq2P6Fl0yL0qJKZzsEzYBAK+52YQPiCDOJ1Kf4SeVMphF3O8qI9uj9BO5c7+RKNCzi3OOXJwXJW+pXa1IE3i4sGfGxroX9cQHCRqkA5lsO2w0K1KPojHKlyMu+eV/but1oYRZlq/J45dZ1F2DYI+c43/TJZTnUWibQn1qqiVwTlkK/rMNxXeULj+uULS4RqH/gXtbUizMS20AbJgSAcsitVCHbJm9+XVO6BUlByDat0B3qLWtnDSgpIKvI40qEDkLxZN1WnggedOAhEHEf1Z216fSVG67j4NOpnQs5Y6Eo1yiXCcQRPVjKZH66E1HNqXXROu4+ghQ49Xf2pbKfLahujqKf0bRr9qDUq3xQXni2IxjXPjOr5wNLNPxZOyvb8cznusKe7QuNHh7lMRoSEHF4iUpZJidr8JHmoFbRaiHHDE1Ct4O0vyPpKQsec9e7PrpHRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(122000001)(38100700002)(2906002)(6506007)(110136005)(52536014)(316002)(508600001)(38070700005)(71200400001)(53546011)(9686003)(7696005)(55016003)(33656002)(8676002)(86362001)(76116006)(66556008)(54906003)(8936002)(5660300002)(4326008)(66946007)(66476007)(83380400001)(186003)(66446008)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0pseUtpNFdRM1RUUXU4SFI0Y1ZPVjdmVHdMdEZialpXaTZ0cVlmS1ZLSVl1?=
 =?utf-8?B?RnhRS0l1SjF6bTNxYlFHL1NyOFJPSStEeTFzWmIvR1YzNjROb1RteHV3bVRv?=
 =?utf-8?B?MUdaRnM3Q3gzQnhNME1oR3dORTdyL0xBanhDVVM5UGZlRHp3aWxwZHJETFVn?=
 =?utf-8?B?NkZBb2EwMHBvMU8vYUpSUGFaVzJVYjVjbVdlRXJVaUJyTTlyZU9JNms5M1ZY?=
 =?utf-8?B?WGkxNDlDMW0xaFB4YkxoQVp4anhhdUlGQnJHbzgzbTRFMGg5YitMMlhPbkhE?=
 =?utf-8?B?M2E3dGhUMlVRM01rOHJqbUh5ay9YOGhWZnhOcWFXZUFMK3pvKzhhOHZVWlcz?=
 =?utf-8?B?M1VMcEdoSkdjM2tyTEF3R29JM3pZa3dSSGZ1YWxtaWg5VFp2OElWWDQvTnpu?=
 =?utf-8?B?VElEZWwzMFRuVFhrQUg5ZWNmMDRHVDdleXJuVi9ETnp5YXJnZ3MvTjFKWHNZ?=
 =?utf-8?B?N2tjMWMxVUdPdkRxOWdHVjE0SHBkbVNlbTB1RVZqOXZYbWxlZjFUMlBhb08r?=
 =?utf-8?B?d0F2SkV6ZlZqU01SRWRaaitzSHYvVU0xZXZiaVdBRGtGNStqMkRtc1RPd1ox?=
 =?utf-8?B?SElZWWlqSG9ubmNNU25JcStKcjFLTGI3aUkzbWtxUEYyVklTUFpLSmpsOW9m?=
 =?utf-8?B?b1RxYVZEdnkzV0Q4UnBib2tVMWYwbjVZWnp2c2ZLcXVrbVZsbUtrZmlUV081?=
 =?utf-8?B?TmpoNloxZUdiOVpVcy9PRFNzNE1DRmhSTVNxeWxUR01rd2FENFVVMmZPdkpp?=
 =?utf-8?B?TmVhdGNINHVhSEFsOTFSYjRORFljbVp6OXE3b1kraUxhWEVKSzg2dVRnUjdV?=
 =?utf-8?B?cmpuY1Bua3dTNlNVTThpTkJlWkRSM0hZK08zYnhIZEx0ZGFSdWU3N0diZWNm?=
 =?utf-8?B?Mk5jWlpqYVJqUHBFV213QllxOUVMbWh3QWRRSEk2cjFJWitOc1J4WTdUTUpJ?=
 =?utf-8?B?b1lCOFo5YW5ZNHEweEJjSzdsc3g1S3d3SExNQjc5MUlrSEs5RmVQVENQRkNw?=
 =?utf-8?B?WklxaXNVbUp1TU8zdXBrZnZFKzRMdjhBUG8vQWlTWXJuSEtnRXFGZXZkQWNi?=
 =?utf-8?B?aytpVVYwMU9iUDJ2SjE4SzltQ1hIbi9BRWJHdVZNOU42cnlTdmgrYkUzcUtV?=
 =?utf-8?B?c1JJMFpLeVI0TEU5TmpYQ251Y2NndVNJVWNVdHBUUVdzMVltSndhdEducFh4?=
 =?utf-8?B?dTdJSk1EdzVnaFZyVU5MREh4dklvdEhyQzBtU1RybElUOXJ3WG1Kam5qK0Rv?=
 =?utf-8?B?dVB6TWlZLzlhdnJnOEpjNVovd3BRNU54eC9FRzlRNS9CWHNOVjlWK3lJaHlT?=
 =?utf-8?B?bW9iZ0sxUXM5bThKRERKTWpnSzgzRmx6R1kvSEdLVTlCM3ZkY3UrdmRyWksv?=
 =?utf-8?B?SE4zRWV0RjdTRCtudURQNnJkdTVjZ1l4UGM2dE5HQ0NCNjBBRlRlaTAwN3Ru?=
 =?utf-8?B?TG9qTlE4b2o2UUVEemxTOVFMYUhzNTl3ZmM5SGx5WHdFY2U3R2NCaG5qTnZt?=
 =?utf-8?B?N1JpMytGMWRpQ0FwYXNhV0lOUUpMS1Uvd0FPS1pCOVdONlV2NENzME9sTWZl?=
 =?utf-8?B?eWJ0ZDlTRXg1S29HUEs1QVZtZE9ldm14NWdjaVBtVG4xYWlWMnIxcWt4U3h0?=
 =?utf-8?B?U25Qc0J0MVR0dmxNSXQvYTAzRTZ1QkVlU29WbENLdm0xWDZTWDBuc2t6dlVZ?=
 =?utf-8?B?NnN2Sld1NkxHUDMreXFpalNZK3h4czN4Q3pPT2pyOHNZcnRyM3hJRnhEa0tT?=
 =?utf-8?B?bG9GQ010cFkzK3ErZWpZVmpLc0dsajlEenp2N1IwWWZIYXVnSjJ1Z3dkeDBH?=
 =?utf-8?B?VGhwT1U4N3FJbjFtZE1ROUNud3NlODlGUGhYc3dvNzI2ZEpXOGt6TmJrd1Nr?=
 =?utf-8?B?RXE2VkV2ak9kTmliekNMRERlb0hQYTdPRUdxaFdaUFAwazMxSDN2QVFBZVlG?=
 =?utf-8?B?bk9kUWk1dy8xcVNkOTByQ3VnQTR2djc5ZDdFb1pFbVE3MlJtaGxZSWY3SGN1?=
 =?utf-8?B?YWpYSU1RYko0SnNpM2VIMDhBTVFJcWRWSG45am8wMSthc2VNVnNkSXpFZkRH?=
 =?utf-8?B?QXprd2I5ZXRld2pvVy82aHRhYWNMaWgvL0VvRzB3QjBmWXFudy8wYlhWZkRI?=
 =?utf-8?B?c2ZJTnlRZTJnVzBxWXBTSHkyME0vRFdLUkZyVWpnOW5maENGTDdldVJScWJa?=
 =?utf-8?Q?iZf3UgbtGlALMsCb4WX9/1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e90b86-9c7e-4c9f-3e9d-08d9e6b6d848
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 01:45:23.5748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fajgbu1G++3PBb2afzG2dGr1fh69I70CtDWNa0fJXnL2au+5Mj5W57aLBtdgYU3wzirShseVGjJTCK5zlwNk1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8757
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIy
IDU6MTYgUE0NCj4gVG86IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZw0KPiBDYzogcWVtdS1hcm1Abm9uZ251Lm9yZzsgZmFtQGV1cGhvbi5uZXQ7IGJl
cnJhbmdlQHJlZGhhdC5jb207DQo+IGY0YnVnQGFtc2F0Lm9yZzsgYXVyZWxpZW5AYXVyZWwzMi5u
ZXQ7IHBib256aW5pQHJlZGhhdC5jb207DQo+IHN0ZWZhbmhhQHJlZGhhdC5jb207IGNyb3NhQHJl
ZGhhdC5jb207IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0ggMC80XSBpbXByb3ZlIGNvdmVyYWdlIG9mIHZlY3RvciBiYWNrZW5kDQo+IA0KPiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+ID4gSGkgUmljaGFy
ZCwNCj4gPg0KPiA+IFdoaWxlIHJldmlld2luZyB0aGUgVENHIHZlY3RvciBjbGVhbi11cHMgSSB0
cmllZCB0byBpbXByb3ZlIHRoZSByYW5nZQ0KPiA+IG9mIGluc3RydWN0aW9ucyB3ZSB0ZXN0ZWQu
IEkgY291bGRuJ3QgZ2V0IHRoZSBleGlzdGluZyBoYWNreQ0KPiA+IHNoYTEgdGVzdCB0byB2ZWN0
b3Jpc2UgbmljZWx5IHNvIEkgc25hcmZlZCB0aGUgc2hhNTEyIGFsZ29yaXRobSBmcm9tDQo+ID4g
Q0NBTi4gVGhlIHNoYTUxMiB0ZXN0IGlzIGdvb2QgYmVjYXVzZSBpdCBpcyBhbGwgcHVyZWx5IGlu
dGVnZXIgc28gd2UNCj4gPiBzaG91bGQgYmUgYWJsZSB0byB1c2UgbmF0aXZlIGNvZGUgb24gdGhl
IGJhY2tlbmQuIFRoZSB0ZXN0IGFsc28gaGFzDQo+ID4gdGhlIG5pY2UgcHJvcGVydHkgb2YgdmFs
aWRhdGluZyBiZWhhdmlvdXIuDQo+IA0KPiBIaSBUYXlsb3IsDQo+IA0KPiBZb3UgbWlnaHQgd2Fu
dCB0byBjaGVjayB0aGlzIG91dDoNCj4gDQo+IOKclyAgLi9xZW11LWhleGFnb24gLi90ZXN0cy90
Y2cvaGV4YWdvbi1saW51eC11c2VyL3NoYTUxMg0KPiAxLi4xMA0KPiBub3Qgb2sgMSAtIGRvX3Rl
c3QoJnRlc3RzW2ldKQ0KPiAjICAgICBGYWlsZWQgdGVzdA0KPiAoL2hvbWUvYWxleC5iZW5uZWUv
bHNyYy9xZW11LmdpdC90ZXN0cy90Y2cvbXVsdGlhcmNoL3NoYTUxMi5jOm1haW4oKSBhdA0KPiBs
aW5lIDk4NikNCj4gbm90IG9rIDIgLSBkb190ZXN0KCZ0ZXN0c1tpXSkNCg0KVGhhbmtzIGZvciB0
aGUgaGVhZHMtdXAuICBJJ2xsIHRha2UgYSBsb29rDQoNClRheWxvcg0K

