Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133E45D48B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 07:06:48 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq7uB-0003E0-3L
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 01:06:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7rt-0002X0-C7
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 01:04:25 -0500
Received: from mga09.intel.com ([134.134.136.24]:41434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7rr-0001A3-DN
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 01:04:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235268630"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="235268630"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 22:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="554525826"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2021 22:04:21 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 22:04:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 22:04:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 22:04:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnMRw9fLwUzKdkDX/RWYRcG1C4egbvRPftJPhywaTgWd3TgqXVNWdFmi0rxQGbKun83cFSXfAhDSdQKTVLjUpSzqQGmq73y8xMFtjFDccIBdZ8i5l6yl8vW2bPY8smHR6Q8zkWUZD3RiMgZA6J9vhi8c0S7e2wKeWxkiz4uYBHJgTQQSO67l6Beic/Hunv0XzqIYi7kltXlhs/Fzxx9FQ4jhle15kdDD8SJDGu9Dsh4vmwOFE0vZCxi/275XvYvTo2M3fOJ245tlvF/MHnSde1856AHxmwy/8NdfUkVHQ/9s8ikfp7iJ647W0OG5mAQAGFTIVmk359L8DIYEbijiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnVV78MX/7iFc3BvC0rZJ7g2YIbykMuLizZFjUzheOA=;
 b=l76Au5F85AqaG+f/44HEjJd34VX4nGolxLGD+X5sgp7vwdVJnsRkUcz/WBu/VognunJogMbUOUIVFobT3keVW9nugUQK01d6xjjDeqTQ2m/uRoHb22jbJD4IweaC7gCcxgP5YbiFJWU3kPthcJuWYWDS86k2SmTuZX283JKKHehSP0+sa/1MAbIWy52bMPZQYpia8ISNPKkI9f3YwBHqB2A7QYkur8erW899G8jRvbqV7ZwgXFTS24PYU85ZbQPydAevGoxKqT/DggcoWoIuOrA4Aa/IbN617uYE9x6mSr5p9vqOhq2HFVeYOFeu0waTywTcxs0erLKT5VllEmcZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnVV78MX/7iFc3BvC0rZJ7g2YIbykMuLizZFjUzheOA=;
 b=TnyFfISF8KbwZfaEpPb50BD4kjV31YhpFL0oGzZPPTdif14NcQEzOnHRx/111ZeoaJn5IfSadAIeJOLKazeGFvusIj3WXZIT8KkkN0ZCqHPiVr3QDsXelIofF6baZJbd0NIpP40RE/OoMj5vsW+l+ca09E5565FpGDY08+sF8HQ=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 06:04:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%7]) with mapi id 15.20.4690.027; Thu, 25 Nov 2021
 06:04:19 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Topic: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Index: AQHX4PkO8vWA/pLrmUq8Xu2sJLwMqKwST9sAgAAI0gCAAWjj4A==
Date: Thu, 25 Nov 2021 06:04:19 +0000
Message-ID: <PH0PR11MB5658C44467136D45AD687777C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
In-Reply-To: <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783ccc45-b54d-49f6-e232-08d9afd96b58
x-ms-traffictypediagnostic: PH0PR11MB5643:
x-microsoft-antispam-prvs: <PH0PR11MB564381360847DA6F9DA477A8C3629@PH0PR11MB5643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SL7D/p/MCluoEsGNSjgl4nl7owToV+ib6REvsl4/DwNAUvCc8UrTA8Uz7jv0o4p+8Nv99diQGbghWjS7o7EmKfYj9QSpI9hoEcSYjqp8Lm0/I4ySNO0ypkQ2HFEFhlRCfyawLAzGzsJbUpj5xlJ+8E47opS3AYMdUt5yIHRC2SN874yBlGw2zt2vFDUeHwT7vWdKHBJWTLTBRk/maE/9hV5E+jMog8jtWbUeSjz0F4LxSvPXnAF+cjAeV+YHN1XrBSF2MKpD+ByGQxpxkC2K/R8yCzl+OiA/ju7Ic6VsrxvTxrOAkYPoXDz4XZN9kwjkrTlPJ41UmjwJc1UKieMRzkF6MJhcIWxjzVQfRMxv67B3wgP/RD6BA5yTcn8wICbL9rcVwo4K7I7Y41JvKfDzg5JTi4q6hFaFKjyPE+5kKZqxHD9TS76AVMhVCFpqjLBrzTfMlVuiaCefa3IYrFSDRLraVq4ROjr/4MfTOswcKzSH4r2x++WBE0gzuJXuwmRYYrV0m4Va25q1kqmGP4OCM2drYnt61T0ElvRrZumxSNmyY/JKUibvIZauw05SbFwskxOf6yfal0bjFkZeIOMgILaOGpgQUyvZ+rLcCoHClfgXg98Bo4fVpCIl5nntPgXUopbB3IssWSN9Nl0PInGwdZr4MR0su85rG3NMhO2EUDDp3vfGR+9pHpneJGe9ZS3bwYUyrF1osfGcuEXnfnSLRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(4326008)(33656002)(83380400001)(82960400001)(7696005)(316002)(110136005)(66946007)(8676002)(54906003)(86362001)(26005)(2906002)(186003)(66446008)(55016003)(66476007)(66556008)(64756008)(76116006)(53546011)(71200400001)(8936002)(52536014)(6506007)(122000001)(38100700002)(9686003)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEFqSnRUMVBzTDlKQ3laQlFGNGJ1czdOakp4clkwblBJL29vZkI1MWZESkhw?=
 =?utf-8?B?a25pVkRjU1pRNFh3UklNanRQYzYzVXBIWHRIMm5ibEhmVUwyaDdHOFZ4NEgz?=
 =?utf-8?B?NkYyYm55VDJNTHBwa09FVGlaRW1WaTNLQWo5WTBiZittRVlCR2FPY3pFaUpM?=
 =?utf-8?B?T1RBTjVUNkI4cTJNY0Z6emZpUkNrbFMxdnl3K0RueXJvZHZGL3dZYmprd3pN?=
 =?utf-8?B?SEVodlREM1FlQmRPT0tzVmJtZnhlajViLzlxdE96TXZWVzhvakMrSlpheUNY?=
 =?utf-8?B?Y2dlcnV2c3ZlMVZnK2pRWk84ZVpHNjlsbUMvUFVaMTE1cGJpbnpPL0ZOeGxY?=
 =?utf-8?B?VzZyYXpua21DMS9UNjVDejNRU25MNncrd2lscSszcmFKWHZjMGlWK1hhS2xm?=
 =?utf-8?B?eHczNWRwY3ZPbWNzUUxST0l5bm9aSzFWaTNaUnRnSzJoaStKQjlVNzE5U2Rr?=
 =?utf-8?B?b1BYc2FIVUROSmhYS0ZHeDc4TlloYVhpQWoyOFZMUXNQNGZrRUZLQ3JhQVFt?=
 =?utf-8?B?WDdYWG5lUVkzcmM3c0VUazRlVmpsUUt2NlI4U0lhTE5raThzdDNySEZZd2FD?=
 =?utf-8?B?Tldwb0pMd2sxWnlGRUVMMmxubFA3bmxlbnhyYlF4d2RhdzBtaVZBSkZmSlBB?=
 =?utf-8?B?dUVROG9VVTRiRm9ETndIdHNneW51QjQ3TmQvWWpXc0dJajRoNjJMS0RkYmVP?=
 =?utf-8?B?SmRoNU01bURabHRnY0dhV0FlcUtidHJ4QXl5QWQwYkpwR0swVmh2OWQ3eksw?=
 =?utf-8?B?ZlpxUFA0UlFabE1ISzdPSW5nM1A3Um8vd2s0WlVLVjZVeDV0amdzQytHeUFM?=
 =?utf-8?B?OFY4YW1rU01GYlRBRlJpK0VRM2xEbm1WYngyR21WVkRsZ2RJczZGVGV5S21F?=
 =?utf-8?B?eTNKcW1JZzJpcWhpZkhVcFl0ZGdlSjhLRWYvNW9BOVJCRk85dG1oZXpzcHRj?=
 =?utf-8?B?SmZPV1lYUEJPWGpLSUllN0w5c3I3a2lBcUtuVE1raDZxL1RzQjE4Z1dydm52?=
 =?utf-8?B?VHRmOGEwaVRIbGFwV2lyL3ZNWVIzN3I1dVcxVnk4YXVTc2k5WEpnUXlIYkxz?=
 =?utf-8?B?cXlHZmhZRW96YU5zNktkUDBDTm1rcnkvNEJ3bDNxZFZML005ZFV4dEtOUmR0?=
 =?utf-8?B?ZWcxdUJvQmI2L2pUL01adU9ZVWcvRnFWRGsrZWVaMlNYb2c5SnFNMkFUMC9O?=
 =?utf-8?B?d0pnRHpNa1hvVURVczB1ZGdGSFRBVHk2U2h2Zm1KZy9jYm5TdzNVRUdwRXVV?=
 =?utf-8?B?QVhXVFVnM1hsME42S2FHY2RaTnlQY3BSczNobHg0RjlkNmlQVGNEN014OS9a?=
 =?utf-8?B?Q05yWitLTzcyRG9BNytYanJBNmthenFsTmN0Y0haS2pwUXFnRWRTSDdJTzZv?=
 =?utf-8?B?NnZOV1Q0UkpSUWNNMXNDb2hsOXEwaFdwejdLbzI5YjA2Yit5VHlWeTJmMjJM?=
 =?utf-8?B?S05tc1dKSFZUNGhqVFdIaTh4ZUtIb0JROVdsMDNvRnlYMHd5OXU3cFVsTHhQ?=
 =?utf-8?B?dGtXOVVNVHVqdUhBZlJ4aEFGS2piS2lvaHpaN1Q3RUdGMHJZam9MOTVWbVhs?=
 =?utf-8?B?SklCdEtwdDROY2hqSFNjQVNHRUJPVjVMSExiRHlFWHJnczZlKzFxLzI1ajQ3?=
 =?utf-8?B?alVlemNYN25QVjUxYlA4Z1NXbG9zdVh1TzdqTFpqWmE5R3ZURS9FemxNZSt4?=
 =?utf-8?B?RldhaS9pNDN0YXJtNHZYMGFGYjNGTWF3RmtHWlhYMHVsdnJrdHo2dk92T1Y1?=
 =?utf-8?B?UE1sU0E3U1AxUXkwT1ZVWm5QWHpnanh4YmNoWEJsMWRqaUVtM0swOU95dGZG?=
 =?utf-8?B?VGdpNmpMRkF1cm4wZURmZzI2b3hUbUsxVG5hdVFQTTNZRE5zMDVvUXFFRit5?=
 =?utf-8?B?MHE4S0hyYUg2cXlmZG1zTWJZZExmU2lKTHpSZ2dmcjM4RkNlTk9Yd29QY3g0?=
 =?utf-8?B?Vytjb1pWdUgxY0txbGpUdFU1Q0xrNmVmS2N6eGVxVitva2NMZUkrTGxrdHNC?=
 =?utf-8?B?cGpNSjZGcVpWTlIrZzJtZ0I0Y2I0U0tlVzh5Z1JFU1J1dUZXY29zQjloSXJX?=
 =?utf-8?B?aTZwejVjbjduY3NqZDh0NlMzUEw5dWpsd2RnUkU2ZU1ESDNDV0lmQ2g4Y1Zt?=
 =?utf-8?B?OUFGbE0yd3JGdkpjejB6YjBqR0ZTNEhYbzhvY0V1bkUrb2FCd2JiNjdFa2l2?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783ccc45-b54d-49f6-e232-08d9afd96b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 06:04:19.2072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azFG/8vz0DYw3WkQX/P2fl8acw1vvl9A+i8i/zcLgwrCTjZjEI1JyRaSUGIsXbXjxA0Itv5vWtnkRV9KWrnMfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yi.l.liu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDI0LCAyMDIxIDQ6MjkgUE0NCj4gDQo+IE9uIFdlZCwgTm92IDI0LCAyMDIx
IGF0IDM6NTcgUE0gUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPiB3cm90ZToNCj4gPg0KPiA+
IE9uIFdlZCwgTm92IDI0LCAyMDIxIGF0IDAyOjAzOjA5UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6DQo+ID4gPiBXaGVuIGJvb3Rpbmcgd2l0aCBzY2FsYWJsZSBtb2RlLCBJIGhpdCB0aGlzIGVy
cm9yOg0KPiA+ID4NCj4gPiA+IHFlbXUtc3lzdGVtLXg4Nl82NDogdnRkX2lvdmFfdG9fc2xwdGU6
IGRldGVjdGVkIHNwbHRlIHJlc2VydmUgbm9uLQ0KPiB6ZXJvIGlvdmE9MHhmZmZmZjAwMiwgbGV2
ZWw9MHgxc2xwdGU9MHgxMDI2ODE4MDMpDQo+ID4gPiBxZW11LXN5c3RlbS14ODZfNjQ6IHZ0ZF9p
b21tdV90cmFuc2xhdGU6IGRldGVjdGVkIHRyYW5zbGF0aW9uDQo+IGZhaWx1cmUgKGRldj0wMTow
MDowMCwgaW92YT0weGZmZmZmMDAyKQ0KPiA+ID4gcWVtdS1zeXN0ZW0teDg2XzY0OiBOZXcgZmF1
bHQgaXMgbm90IHJlY29yZGVkIGR1ZSB0byBjb21wcmVzc2lvbiBvZg0KPiBmYXVsdHMNCj4gPiA+
DQo+ID4gPiBUaGlzIGlzIGJlY2F1c2UgdGhlIFNOUCBiaXQgaXMgc2V0IHNpbmNlIExpbnV4IGtl
cm5lbCBjb21taXQNCj4gPiA+IDZjMDA2MTJkMGNiYTEgKCJpb21tdS92dC1kOiBSZXBvcnQgcmln
aHQgc25vb3AgY2FwYWJpbGl0eSB3aGVuIHVzaW5nDQo+ID4gPiBGTCBmb3IgSU9WQSIpIHdoZXJl
IFNOUCBiaXQgaXMgc2V0IGlmIHNjYWxhYmxlIG1vZGUgaXMgb24gdGhvdWdoIHRoaXMNCj4gPiA+
IHNlZW1zIHRvIGJlIGFuIHZpb2xhdGlvbiBvbiB0aGUgc3BlYyB3aGljaCBzYWlkIHRoZSBTTlAg
Yml0IGlzDQo+ID4gPiBjb25zaWRlcmVkIHRvIGJlIHJlc2VydmVkIGlmIFNDIGlzIG5vdCBzdXBw
b3J0ZWQuDQo+ID4NCj4gPiBXaGVuIEkgd2FzIHJlYWRpbmcgdGhhdCBjb21taXQsIEkgd2FzIGFj
dHVhbGx5IGNvbmZ1c2VkIGJ5IHRoaXMgY2hhbmdlOg0KPiA+DQo+ID4gLS0tODwtLS0NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9p
bnRlbC9pb21tdS5jDQo+ID4gaW5kZXggOTU2YTAyZWI0MGI0Li4wZWU1ZjFiZDhhZjIgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9pb21tdS9pbnRlbC9pb21tdS5jDQo+ID4gQEAgLTY1OCw3ICs2NTgsMTQgQEAgc3RhdGljIGlu
dA0KPiBkb21haW5fdXBkYXRlX2lvbW11X3Nub29waW5nKHN0cnVjdCBpbnRlbF9pb21tdSAqc2tp
cCkNCj4gPiAgICAgICAgIHJjdV9yZWFkX2xvY2soKTsNCj4gPiAgICAgICAgIGZvcl9lYWNoX2Fj
dGl2ZV9pb21tdShpb21tdSwgZHJoZCkgew0KPiA+ICAgICAgICAgICAgICAgICBpZiAoaW9tbXUg
IT0gc2tpcCkgew0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICghZWNhcF9zY19zdXBw
b3J0KGlvbW11LT5lY2FwKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICogSWYgdGhlIGhhcmR3YXJlIGlzIG9wZXJhdGluZyBp
biB0aGUgc2NhbGFibGUgbW9kZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0aGUg
c25vb3BpbmcgY29udHJvbCBpcyBhbHdheXMgc3VwcG9ydGVkIHNpbmNlIHdlDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICogYWx3YXlzIHNldCBQQVNJRC10YWJsZS1lbnRyeS5QR1NOUCBi
aXQgaWYgdGhlIGRvbWFpbg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGlzIG1hbmFn
ZWQgb3V0c2lkZSAoVU5NQU5BR0VEKS4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8N
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXNtX3N1cHBvcnRlZChpb21tdSkgJiYN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIWVjYXBfc2Nfc3VwcG9ydChpb21tdS0+
ZWNhcCkpIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9DQo+ID4gLS0tODwtLS0NCj4gPg0KPiA+IERvZXMgaXQgbWVhbiB0aGF0
IGZvciBzb21lIGhhcmR3YXJlcyB0aGF0IGhhcyBzbV9zdXBwb3J0ZWQoKT09dHJ1ZSwNCj4gaXQn
bGwgaGF2ZQ0KPiA+IFNDIGJpdCBjbGVhcmVkIGluIGVjYXAgcmVnaXN0ZXI/DQo+IA0KPiBJIGd1
ZXNzIG5vdCwgc28gaXQncyBwcm9iYWJseSBvbmx5IHRoZSBwcm9ibGVtIG9mIHZJT01NVS4NCj4g
DQo+ID4gVGhhdCBzb3VuZHMgb2RkLCBhbmQgbm90IHN1cmUgd2h5LiAgTWF5YmUgWWkNCj4gPiBM
aXUgb3IgWWkgU3VuIG1heSBrbm93Pw0KPiANCj4gQW5vdGhlciBpbnRlcmVzdGluZyBwb2ludCBp
cyB0aGF0LCBpdCBsb29rcyB0byBtZSBhZnRlciB0aGF0IGNvbW1pdA0KPiBTTlAgaXMgdXNlZCBm
b3IgdGhlIGRvbWFpbiB0aGF0IGlzIG5vdCBVTk1BTkFHRUQgZXZlbiBpZiBQR1NOUCBpcyBub3QN
Cj4gc2V0Lg0KDQpQZXIgc3BlYywgaWYgdGhlIFBHU05QIGlzIHNldCwgaXQgbWVhbnMgdGhlIGZp
bmFsIHBhZ2UgYWNjZXNzIGlzIHNub29wZWQuDQpJZiBpdCdzIG5vdCBzZXQsIHRoZW4gaXQncyB1
cCB0byBvdGhlciBiaXQgdG8gZGVjaWRlIGl0LiBGb3IgZGV0YWlsLCB5b3UgbWF5DQpyZWZlciB0
byB0YWJsZSA2IG9mIGNoYXB0ZXIgMy45IGluIHZ0ZCAzLjIgc3BlYy4NCg0KUmVnYXJkcywNCllp
IExpdQ0KDQoNCg==

