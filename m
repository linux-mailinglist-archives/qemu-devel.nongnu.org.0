Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CDC4185BF
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 04:49:37 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUKES-0000xS-E7
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 22:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mUKDC-0000GD-Np
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 22:48:18 -0400
Received: from mga05.intel.com ([192.55.52.43]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1mUKD9-0002Xm-II
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 22:48:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10118"; a="309864275"
X-IronPort-AV: E=Sophos;i="5.85,322,1624345200"; d="scan'208";a="309864275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2021 19:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,322,1624345200"; d="scan'208";a="517836093"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2021 19:48:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 25 Sep 2021 19:48:11 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 25 Sep 2021 19:48:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sat, 25 Sep 2021 19:48:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sat, 25 Sep 2021 19:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK1cQfuciVb295k449ptsoPupp5sSNFSuiUGh62DY16O8vBJ8W2W70skd31VH/MN9KxCLgLYtZ3pbTDIuDmKuuXvehwTXC5X+dg4RKPZ3w5gBfIahtY6ZqvdvzV1coUK/CNu19cJ3iq+vMgnumzNxgLK6LdWwPlFU2M4urkbtomoaZKV9ZNNf8PMOxFWoxXxtJ2LzIZsMr/XtR1ga7kX1Z5rUTgtZuzp78uM6BZJ6piPnfUj07XGVAtaZkqOb+7XYFn3P56T9UGAbbX6UEI141vXVBMi71eLza75rmsHV/D5O2CpjuzH+/AYGqrG2VIYcEvBbigfPA3qzyD5Lsjb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=T6ddrHDAh48NCRyef2ywvdOUAi3c9NtvFzmZBoBPD8U=;
 b=SFBPl4px4mkkrUOlGO/1yYKrGbv37+h2/Lm8J0t5mqxpdMtNf4w98iqkJKLb5L2201+l9TfNvXJy5JDNAgL5/bLbxlxwGgKyKf0ow5P1ep7Qo8IFVkISZNCRFpKwjEpq8InIAQ+fRBO3EEnWE5J61Fg+GPmlSuLS7aTpSdGRlY4zy3d8D166vO12K+laqorBgGN8sLjlrMkYlzr27COJPGTnus0yJ42aalI8BuEZcbpEB225sd+o/4KMVHD2qzhcTUEvxe/fKxZkEddOFlRhAgy9dLKFCFuIK7Wwr1kLlB9ut6UAJJVRJcbJT3HQgart1skc7CYXVT4qIA6QIzyI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6ddrHDAh48NCRyef2ywvdOUAi3c9NtvFzmZBoBPD8U=;
 b=fConBEIKlnVQ1RVziZkSAICQ9P+aL2G6tNpFQlvebEHQSvcXyyxN7LO1miqki9tcANfP7AVzyJPwx1IfY+NygFmcLYpMHFj1PpgYcg4+Z9f3Mh1aUM0tu+VMGUjE/1kbi5t0C+uIGNFukZPOy9WYfW4imyv1DEQL/6P2Ri0by/o=
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN8PR11MB3764.namprd11.prod.outlook.com (2603:10b6:408:90::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sun, 26 Sep
 2021 02:48:06 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 02:48:06 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Tarun Gupta <targupta@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Subject: RE: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
Thread-Topic: [question] VFIO Device Migration: The vCPU may be paused during
 vfio device DMA in iommu nested stage mode && vSVA
Thread-Index: AQHXsQwh2mhwIZa9kkaP0W0OQp9PmKuyuLBwgAAyhQCAArGFwA==
Date: Sun, 26 Sep 2021 02:48:06 +0000
Message-ID: <BN9PR11MB543364BEED583CD247EB2BC08CA69@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <7494b6a8-8dae-cbe9-fcff-29e10a4f0015@huawei.com>
 <BN9PR11MB5433E189EEC102256A3348A18CA49@BN9PR11MB5433.namprd11.prod.outlook.com>
 <06cb5bfd-f6f8-b61b-1a7e-60a9ae2f8fac@nvidia.com>
In-Reply-To: <06cb5bfd-f6f8-b61b-1a7e-60a9ae2f8fac@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01d9702d-79aa-4ecf-4d05-08d98098119a
x-ms-traffictypediagnostic: BN8PR11MB3764:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB3764ED4A0C41328A245CB0108CA69@BN8PR11MB3764.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HHUdELT2F157RagEsM6LY44hyB/xOuCZVco7Y7duN52P5XtDC7pS7Br26o+nggOCWJ67TYLp0HwLX7S1s1NJmkayF4mIlxKT6Y7wLXI00SCyMs0qoBlOXZ5cZKpelqhKFBsC1zbksj8uxoObGhbT/qt9ddRiblKrCsFcEVCMX16X4jh2byYLHiDI9T7knSRqteCZXBU2BhGxW5GSo8ftgf6NJZVt8aRS4hkMYPWg4EaIGp0Ca3QkAPcBLWmziKa59QLGtDravrRHd//qaX8DkISLBiT7+KMlpXNYabelctMZ6l7VVUO51IhtDYOGKloJk6VuTI7LGy1ZGGWpK/UDBc0WD4ebdhY1sIHEhlEmNCouplcEzkaxZsS64s5OfrU+45HObvVBkQqU81OrBJSWENTIfnlBZZ5SmqTpJTdo/KrmOupfJLMk/XCIkuWGzlHIhe8zGEVJC++ftzGTDoc4GxXG9sl8/Esm0HT5Ejcouh+kH/Kgqa3+SEadV9r9MyxzNsg2bSoqWCSrlog0He1H/yOBnjWZ/x2hHaTWnp+UYFGWQ+iR2MQOXm+hqCzoq22rUDcQ53BFiKtYkcZA7HXnvX6aO2tgkudSRaQgZSl0SwA5/09vaIKZa3ah3VbGdqKpCh9qUX2nuewNEOSOV9sAuj11DvXtgtm6nIdPBqA3u+IUpnFqAIrzOKDGsBQqa+qMy8EfvhpcivF7uEGzVdk/+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5433.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(4326008)(64756008)(66556008)(66946007)(26005)(5660300002)(38100700002)(8936002)(66446008)(7416002)(53546011)(6506007)(2906002)(86362001)(9686003)(107886003)(186003)(8676002)(55016002)(7696005)(66476007)(71200400001)(316002)(52536014)(33656002)(508600001)(38070700005)(83380400001)(76116006)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2grcUU2bjdlbUE4b2JnMXFBTldTU21lU01ZblBiWHRHMW9PblUxUHpxc2lz?=
 =?utf-8?B?cHRjQ3IyWU5UVlQrWHl0amltYUpmRU5GWDg0OXNYRW01UENLNi9VTTBpVHZv?=
 =?utf-8?B?VjAwSmRURngydlR2clUyVlZrMGZwaEJVTktEQ2RhSE13S0I0RmJhSVFJb0VW?=
 =?utf-8?B?c0Irbmk4bzRpcFVZaURhOTN2cm1yWDM0cHJWWmU5aG0ycUt6YXhQM1lDeW9X?=
 =?utf-8?B?dWpMRXU5a0h0aFpya0dlejRsR2pTUGlOMVpEWjR5VStmVGFPYzVzMmF6d3Jv?=
 =?utf-8?B?SDBneURucFI4Z096TWovSFpPSDF6WDNMZTZUYmZlUGVzTzdrOFdFY0V6MTNS?=
 =?utf-8?B?TC9BdWIvWk1NS2ZCVjY1UjBuY2pCVXFXVk5NaWF6MGMrRk9BNTB6R1lPS05h?=
 =?utf-8?B?QS91T3E4Z3BEbWJ1TzJsMW8wazVBVjZnTTNuOFZuaUtJYmcvTGluV2Z2QWpY?=
 =?utf-8?B?ZjBpM2pjVGNTQlVqNjg0NllXSG1VVDRIMTNVZ0hHSmpJcE4zRjBYek9iWm03?=
 =?utf-8?B?eDRKVjd2QlpCNE93UEtwN1lsaWpTakV1UW8rU0gxSkNzd2h4WFcxZi82ckts?=
 =?utf-8?B?OUx3UVA5bk5ENnhWZkl4aGEzY2l1eVNkNGQwWldabWt1Z0RDNHBYUFFCVEtt?=
 =?utf-8?B?MjN0R2lZdG9hRTY4TFJEam92VGJBUFNkNy9UVW5nZjh5WW5ER0NZQzhTSjZk?=
 =?utf-8?B?ajBBaytiUytHMzVwQWRwdUZvVUJ0T3A0WVVnLzhZRW9LYy9GYWJPU1lCMi9z?=
 =?utf-8?B?aUgwdFhJYTNOOUpNaEdsQXM0bVRtbUk0ZkhJT0ROQ1BuRVpndGZQMzc3U3dk?=
 =?utf-8?B?aVNrZUlUMTQ1dmZnak8xa2ZCQ1IxemJmRjQ0clRzS0xJaHlIbEMxU2lKSGww?=
 =?utf-8?B?ODJwUzVtZW9LNzhkWE5HZHU3ejQ1cFhiM1VQcWpPckVOdEpFUUltQlhGSTFy?=
 =?utf-8?B?ZFpVVWJrc2ZrOEVLVXVtU1pENlpYR3JTQWlSU2YzcktjWGdtWkxhTEZ5Y0Z2?=
 =?utf-8?B?eG50MVBrQ0c1Q0Vqc0d3cGphd0c4eWQ0UTlodHdNZjFVVnRuSzJWOTNMTyt2?=
 =?utf-8?B?emZyN2ZhSWdXVlQxR1c5QjZTNUZYT2o4MXpzQnliZytOcmpBU0RpWEE5bHZT?=
 =?utf-8?B?UlcyK2UxUVRCSEY1b3Qzb2NxNmRoZXh5K0ZKbGpYVDF4UXhQV3BpbUZpbDNG?=
 =?utf-8?B?ZzUrck55RzRrcmo1ek1TMXRHUm1kVUlNd3E0dnAyRlphWUVITkZrWE5LRjJ1?=
 =?utf-8?B?QnJubFNlaERYek5RSExDY3I4Um9BaFZPbXptYlBHTnpKV25CRnFMRlNIcUw0?=
 =?utf-8?B?WCtVcjc3UzI4eUZybXdXbTV3dTZmZDJHY0JJLzhpZ2JuNCsreDgyMjlEdzYv?=
 =?utf-8?B?VGRLZmlzN2k3TU9kV3hWVU52UDg5RlZXbVNRWlFRN0JjY1NmWWRVelVJUDZX?=
 =?utf-8?B?VDBOM3J6SDdvdHRFTENRVzdFdXhJcEIxL0pGT21CR2JWN1NaYU5rMzZrcGtK?=
 =?utf-8?B?OFNpekE3VDFOOUlmdUlaWk1uZ3JZVWpHdkFoQ3dqME01UFBQd3AyQXFTb2lV?=
 =?utf-8?B?djUyWWNIVWMwKzdmc2F1TWVKTU1qV1JGY0MxNXR6L1VDT0dnSnpYbFBDN0k2?=
 =?utf-8?B?MHIyYTdNY0VTTHJCR0dmNCtsZXBPamxKOWVWQjg2SlVGZnNyY05rMW1NSGV5?=
 =?utf-8?B?NldkbEEybUZ4Ym1qVlVYVGhFMXl1TTZaNE8rMnVReGw0MEEwTzZHWFQvRXYw?=
 =?utf-8?Q?L/WawucsfMbl2rHncdU795q7DdUPpH9OpAXC1gr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d9702d-79aa-4ecf-4d05-08d98098119a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2021 02:48:06.7269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFqimGPPYlEIhedfeYdkRnNK7N8Qz1B/GmmZLVbq4o2ahyg7e5/GwCt1EL8imeCM7k+6+03rYG+aYlHOt/dV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3764
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=kevin.tian@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "tangnianyao@huawei.com" <tangnianyao@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "liulongfang@huawei.com" <liulongfang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRpYS5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDI0LCAyMDIxIDU6MjkgUE0NCj4gDQo+IE9uIDkvMjQvMjAyMSAxMjox
NyBQTSwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEt1bmt1biBKaWFuZyA8amlhbmdr
dW5rdW5AaHVhd2VpLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMjEg
MjoxOSBQTQ0KPiA+Pg0KPiA+PiBIaSBhbGwsDQo+ID4+DQo+ID4+IEkgZW5jb3VudGVyZWQgYSBw
cm9ibGVtIGluIHZmaW8gZGV2aWNlIG1pZ3JhdGlvbiB0ZXN0LiBUaGUNCj4gPj4gdkNQVSBtYXkg
YmUgcGF1c2VkIGR1cmluZyB2ZmlvLXBjaSBETUEgaW4gaW9tbXUgbmVzdGVkDQo+ID4+IHN0YWdl
IG1vZGUgJiYgdlNWQS4gVGhpcyBtYXkgbGVhZCB0byBtaWdyYXRpb24gZmFpbCBhbmQNCj4gPj4g
b3RoZXIgcHJvYmxlbXMgcmVsYXRlZCB0byBkZXZpY2UgaGFyZHdhcmUgYW5kIGRyaXZlcg0KPiA+
PiBpbXBsZW1lbnRhdGlvbi4NCj4gPj4NCj4gPj4gSXQgbWF5IGJlIGEgYml0IGVhcmx5IHRvIGRp
c2N1c3MgdGhpcyBpc3N1ZSwgYWZ0ZXIgYWxsLCB0aGUgaW9tbXUNCj4gPj4gbmVzdGVkIHN0YWdl
IG1vZGUgYW5kIHZTVkEgYXJlIG5vdCB5ZXQgbWF0dXJlLiBCdXQganVkZ2luZw0KPiA+PiBmcm9t
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB3ZSB3aWxsIGRlZmluaXRlbHkgZW5jb3VudGVy
DQo+ID4+IHRoaXMgcHJvYmxlbSBpbiB0aGUgZnV0dXJlLg0KPiA+DQo+ID4gWWVzLCB0aGlzIGlz
IGEga25vd24gbGltaXRhdGlvbiB0byBzdXBwb3J0IG1pZ3JhdGlvbiB3aXRoIHZTVkEuDQo+ID4N
Cj4gPj4NCj4gPj4gVGhpcyBpcyB0aGUgY3VycmVudCBwcm9jZXNzIG9mIHZTVkEgcHJvY2Vzc2lu
ZyB0cmFuc2xhdGlvbiBmYXVsdA0KPiA+PiBpbiBpb21tdSBuZXN0ZWQgc3RhZ2UgbW9kZSAodGFr
ZSBTTU1VIGFzIGFuIGV4YW1wbGUpOg0KPiA+Pg0KPiA+PiBndWVzdCBvc8KgwqDCoCDCoMKgwqAg
wqDCoMKgIDQuaGFuZGxlIHRyYW5zbGF0aW9uIGZhdWx0IDUuc2VuZCBDTURfUkVTVU1FIHRvIHZT
TU1VDQo+ID4+DQo+ID4+DQo+ID4+IHFlbXXCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgMy5p
bmplY3QgZmF1bHQgaW50byBndWVzdCBvcyA2LmRlbGl2ZXIgcmVzcG9uc2UgdG8NCj4gPj4gaG9z
dCBvcw0KPiA+PiAodmZpby92c21tdSkNCj4gPj4NCj4gPj4NCj4gPj4gaG9zdCBvc8KgwqDCoCDC
oMKgwqAgwqDCoMKgwqDCoCAyLm5vdGlmeSB0aGUgcWVtdSA3LnNlbmQgQ01EX1JFU1VNRSB0byBT
TU1VDQo+ID4+ICh2ZmlvL3NtbXUpDQo+ID4+DQo+ID4+DQo+ID4+IFNNTVXCoMKgwqAgwqDCoMKg
IMKgwqDCoMKgwqAgMS5hZGRyZXNzIHRyYW5zbGF0aW9uIGZhdWx0wqDCoMKgIMKgwqDCoCDCoMKg
wqDCoMKgIDgucmV0cnkgb3INCj4gPj4gdGVybWluYXRlDQo+ID4+DQo+ID4+IFRoZSBvcmRlciBp
cyAxLS0tPjguDQo+ID4+DQo+ID4+IEN1cnJlbnRseSwgcWVtdSBtYXkgcGF1c2UgdkNQVSBhdCBh
bnkgc3RlcC4gSXQgaXMgcG9zc2libGUgdG8NCj4gPj4gcGF1c2UgdkNQVSBhdCBzdGVwIDEtNSwg
dGhhdCBpcywgaW4gYSBETUEuIFRoaXMgbWF5IGxlYWQgdG8NCj4gPj4gbWlncmF0aW9uIGZhaWwg
YW5kIG90aGVyIHByb2JsZW1zIHJlbGF0ZWQgdG8gZGV2aWNlIGhhcmR3YXJlDQo+ID4+IGFuZCBk
cml2ZXIgaW1wbGVtZW50YXRpb24uIEZvciBleGFtcGxlLCB0aGUgZGV2aWNlIHN0YXR1cw0KPiA+
PiBjYW5ub3QgYmUgY2hhbmdlZCBmcm9tIFJVTk5JTkcgJiYgU0FWSU5HIHRvIFNBVklORywNCj4g
Pj4gYmVjYXVzZSB0aGUgZGV2aWNlIERNQSBpcyBub3Qgb3Zlci4NCj4gPj4NCj4gPj4gQXMgZmFy
IGFzIGkgY2FuIHNlZSwgdkNQVSBzaG91bGQgbm90IGJlIHBhdXNlZCBkdXJpbmcgYSBkZXZpY2UN
Cj4gPj4gSU8gcHJvY2Vzcywgc3VjaCBhcyBETUEuIEhvd2V2ZXIsIGN1cnJlbnRseSBsaXZlIG1p
Z3JhdGlvbg0KPiA+PiBkb2VzIG5vdCBwYXkgYXR0ZW50aW9uIHRvIHRoZSBzdGF0ZSBvZiB2Zmlv
IGRldmljZSB3aGVuIHBhdXNpbmcNCj4gPj4gdGhlIHZDUFUuIEFuZCBpZiB0aGUgdkNQVSBpcyBu
b3QgcGF1c2VkLCB0aGUgdmZpbyBkZXZpY2UgaXMNCj4gPj4gYWx3YXlzIHJ1bm5pbmcuIFRoaXMg
bG9va3MgbGlrZSBhICpkZWFkbG9jayouDQo+ID4NCj4gPiBCYXNpY2FsbHkgdGhpcyByZXF1aXJl
czoNCj4gPg0KPiA+IDEpIHN0b3BwaW5nIHZDUFUgYWZ0ZXIgc3RvcHBpbmcgZGV2aWNlIChjb3Vs
ZCBzZWxlY3RpdmVseSBlbmFibGUNCj4gPiB0aGlzIHNlcXVlbmNlIGZvciB2U1ZBKTsNCj4gPg0K
PiANCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGNoYW5nZSBpcyByZXF1aXJlZC4gV2hlbiB2Q1BV
cyBhcmUgYXQgaGFsdCB2Q1BVDQo+IHN0YXRlcyBhcmUgYWxyZWFkeSBzYXZlZCwgc3RlcCA0IG9y
IDUgd2lsbCBiZSB0YWtlbiBjYXJlIGJ5IHRoYXQuIFRoZW4NCj4gd2hlbiBkZXZpY2UgaXMgdHJh
bnNpdGlvbmVkIGluIFNBVklORyBzdGF0ZSwgc2F2ZSBxZW11IGFuZCBob3N0IG9zIHN0YXRlDQo+
IGluIHRoZSBtaWdyYXRpb24gc3RyZWFtLCBpLmUuIHN0YXRlIGF0IHN0ZXAgMiBhbmQgMywgZGVw
ZW5kaW5nIG9uIHRoYXQNCj4gdGFrZSBhY3Rpb24gd2hpbGUgcmVzdW1pbmcsIGFib3V0IHN0ZXAg
NiBvciA3IHRvIHJ1bi4NCj4gDQoNCnRoaXMgaXMgbm90IGxpa2Ugbm9ybWFsIHBlbmRpbmcgQ1BV
IGludGVycnVwdHMgd2hpY2ggY2FuIGJlIHNhdmVkIGFuZA0KbWlncmF0ZWQuDQoNCkhlcmUgdG8g
c2F2ZSB0aGUgZGV2aWNlIHN0YXRlIHlvdSBuZWVkIGRyYWluIGluLWZseSByZXF1ZXN0cy4gQnV0
IGluLWZseQ0KcmVxdWVzdHMgbWF5IGFscmVhZHkgaGl0IEkvTyBwYWdlIGZhdWx0cyBhbmQgYXJl
IHdhaXRpbmcgZm9yIGZhdWx0DQpjb21wbGV0aW9uIGZyb20gdGhlIENQVS4gSWYgeW91IHBhdXNl
IHZDUFUgaW4gdGhlIG1pZGRsZSwgdGhlIGZhdWx0IGlzDQpuZXZlciBmaXhlZCB0aHVzIHRoZSBp
bi1mbHkgcmVxdWVzdHMgY2Fubm90IGJlIGRyYWluZWQgKHVubGVzcyB0aGUgZGV2aWNlDQpzdXBw
b3J0IHByZWVtcHRpb24gcGVyIGZhdWx0LCB3aGljaCBpbWhvIG5vdCB0aGUgY2FzZSBmb3IgbW9z
dCBTVkEtDQpjYXBhYmxlIGRldmljZXMpLiBUaGVuIHlvdSdsbCBlaXRoZXIgZmFpbCBtaWdyYXRp
b24gb3IgbWlncmF0ZSBicm9rZW4gDQpkZXZpY2Ugc3RhdGUuDQoNCnZDUFVzIGhhdmUgdG8gY29u
dGludWUgcnVuIHVudGlsIGRldmljZSBkcmFpbmluZyBjYW4gYmUgY29tcGxldGVkLg0KVGhpcyBy
ZXF1aXJlbWVudCBjb3VsZCBiZSBpbmRpY2F0ZWQgdmlhIHRoZSBtaWdyYXRpb24gcmVnaW9uLg0K
DQpUaGFua3MNCktldmluDQo=

