Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FE460519
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 08:07:56 +0100 (CET)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrEHz-0004pd-C7
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 02:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mrEGb-00048O-Lt
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 02:06:29 -0500
Received: from mga02.intel.com ([134.134.136.20]:62932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mrEGX-0000lz-Dn
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 02:06:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10181"; a="223041400"
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="223041400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2021 23:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,270,1631602800"; d="scan'208";a="599489687"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2021 23:06:21 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 27 Nov 2021 23:06:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 27 Nov 2021 23:06:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 27 Nov 2021 23:06:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sat, 27 Nov 2021 23:06:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dc2ss7RNntAmRn42EEgz8syoNHFKeKuWFABVZzR1poBfiDhaI81ofkvSoLEkBQ7OYmyZUDF96uUb8YC4BhkYUl/J4vc9IClhAHzMlLYUh/RKPiSs2SDY3iHlaOHc10WzfXRVl7Y+H21fChjdHK3PTDjPTkBwsd4nXxWUwBFTg9O96t53U/QynUiGCuVeT8zZlDMQI6Hycp9Ug7IhKs+51gsoXA1ODcoE5jziOGJ5mT6a9uzXZmgwu6/78IXzueNWrS7UdYkYDzKbIC5YY5phqUrROmK8l9LdqyN2adwlB3BLNcUdy3AVw3FbFmk55Y6c0pgaovdvNnGTfg8MnP1q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrnvnde5np16QGmQRcSPrxwpqHjeMnFIeeFAAEZTzqw=;
 b=fjnb85ieS75qiFkoG0+Xoor8Fsi/v6pMXa47T0DsN0YXeQ7gl/lQAJzwz3ywE2ml3ooqPrWCq4pTXLFf5bO1gS/WY/VyByVwoZxmUkBFHRy9VvpHkRMCUKlbKzfmz7GjyHk5pc1yIJEdnwbQEq34PIHeo25RXD2Tw1VoJyyNYG7kT0xhw2GaNf5zZ3hmn4r7pwxB2aVX3D5GReC91AmKuzLYIMpJBmV3Md4E2OKPg3b7bPaULFQZzACG9O4nf2vase1ID/EGzmOlwmLseGnddzQXEOOpg0T1ktdxvALBfvLqTLce0Ps820Hq/FOrTgXj+dpqjKNWujKjZ1FDcbY97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrnvnde5np16QGmQRcSPrxwpqHjeMnFIeeFAAEZTzqw=;
 b=oAAq8S9MskEXAzrij/bq12TyAGd/Q5vd/JCTlO+ihWAQs6fDlU0q+1MZdnK5GXOj/6NdslRlOQJa25+tD9GGBGmIEi+LltdCbqduTPTubpXgrvFZUQA85GMnDqN5Jn46EAR0e2UDizrkfwsC4XX6dDaxHKcEHtSdRdhUbx+Z0jU=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Sun, 28 Nov
 2021 07:06:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%7]) with mapi id 15.20.4690.027; Sun, 28 Nov 2021
 07:06:18 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Topic: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Index: AQHX4PkO8vWA/pLrmUq8Xu2sJLwMqKwST9sAgAFIEoCAABCYAIAAEYxwgAALIICAABebQA==
Date: Sun, 28 Nov 2021 07:06:18 +0000
Message-ID: <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
In-Reply-To: <YZ8pi2ty2Z8wjt9u@xz-m1.local>
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
x-ms-office365-filtering-correlation-id: 23e79f19-6409-4747-b00e-08d9b23d9390
x-ms-traffictypediagnostic: PH0PR11MB5628:
x-microsoft-antispam-prvs: <PH0PR11MB5628D4FE54AE877861B9A38BC3659@PH0PR11MB5628.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xpUWJ5GaRKktP1jM8tlzsiI8s132gcdJ216+pb185VdoFZwvwlV/WB7h3YuddX8I1GPi6p4QhdO3vE6Ds1wBHIp59IkMehPdI9mrUqJhduN/f2ohSlt088YBUFY7O5K+P/9Csi2QfhMaemXQ5UcCYlRpJeiHvRP8vCA254LUPBN5tOPmzQ60L6B7P55D/e73cjJz6RVqz4fPVhD3wsjLn0cJ2aXyYSouAkeL3RqKKII+xQVSX19DBdenF5JvXliVaPFFsRKS4QcS8uldK5/NWnkZSwx2ZjWjc6hAhamaxF/CHxVKVcyn7OJb5EmkaygZBvv12ENHK1XhWoMTJHENGyEhrhPqw55s0IfxW48vrS2ZLxUfMtH2XOmz6K29x/NuSoYdloR+PKEWgY+gK+/gcflm+AdgVz2EPqTFJimkeOnab9aB+ImEUBcUqphyuZ8ZG+4ibA2si/rTuvIWTNKwncnpyU/b2zI/uAC0MYFGhlHvxbbHp3jvzb6uiTKrPfzOOFgRy8gIpSSc870FtEC6bAJuhCo2z2pM/LaCq0egWAJ6206r2Vmo1ny9bl9yaNxYUaQ5YPL33lCkl4N7ZvXRM+xfkibhINab3N4aS3nV2vdMGvImpapgDR1choY6F/aLlFP8hpEHiSS0gw0+cEzefmBFbjy/G9su4WYgAu4r6pgbWIvCW2ZQePeU27ZPL34c4iLVuQjjgLp2kvqiuOMPRRetHlEWvuIeLxnl2rI5JFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6506007)(54906003)(66446008)(2906002)(7696005)(66476007)(86362001)(33656002)(186003)(83380400001)(26005)(82960400001)(8936002)(76116006)(71200400001)(8676002)(122000001)(5660300002)(66556008)(64756008)(9686003)(316002)(52536014)(38070700005)(55016003)(66946007)(6916009)(38100700002)(508600001)(9126006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1lPZGMrMUQ3TGhjM0lRbzgyVnVwTjhoais3N0VKNDR3elF5YldCbTQ2SDdD?=
 =?utf-8?B?WEtnWVZCQU5vMlNwOGQ2VjU3MFNJaG9lYWpOU3FKVGlDRHNnNms5YlBBSTJH?=
 =?utf-8?B?UXI5eWN1cWJxVkcvenpHVDR4TUI1d3J2aEtRK1pJYm1VL3ExUzNjMUhOeExo?=
 =?utf-8?B?aE5tVU5BTE9OOFJTeHFZR0NhTDQzQkhzSW1TNXhMLy9td1J0Z2J5QU5KNGhU?=
 =?utf-8?B?OGtwOXNzOWgrekZKbFdjYStZSGZCMnJDdldIcjBsT3h5dGdWaXplTFlJdXdz?=
 =?utf-8?B?aG8rVWlIbXRxNWEvVG5lbjlHYW1mK2pJdjlVNXlVZ3pXNlBNbFpaVDVmS04y?=
 =?utf-8?B?RGVjL0s1TzVRMzNsSkNOOUUvZ3VjOW85WDJCWVZaL2RmOHVGejVXZ1ZnOFkr?=
 =?utf-8?B?OGpPWU9yMEl2ZU1TamV4UTdPTTYzamt0MHR4THhCYXlEczRTZFltWmFWWmZY?=
 =?utf-8?B?Ylowamt1Q0xMVWRJSWV6K3pQb1dzVFdBMTBCNDdINjhiUVRhSUQ5ZWhHdDF5?=
 =?utf-8?B?YVRMamdJa1pJekxGRUw5VGZ5dGgyWE43akt5bG1pTkFHcjBUSDZMMzJZK002?=
 =?utf-8?B?TmprK0gzTEN5czZUOGRyYXlBSVBjWW5PSlNVVnY3c1ltR2RYd1lSWHpYSkJD?=
 =?utf-8?B?NHBPRnVuOWlKNDUwOEo3WS8xWm1CREdibXd5SGFWckp0YnFWTzY3TjRGZ01Y?=
 =?utf-8?B?dHJycU11NmFDQzBDdmpKQjYzSDRTQTJ0RGI5ekducTlrZUpIZ1JjcWZWdDF4?=
 =?utf-8?B?TUlhaXBpYmRjYm1YQWZVaXZDQzZjcGdYUzNETEkvbUlpL2pBTzYrSVRhZHZp?=
 =?utf-8?B?Ui9ZWVdnaS9NRzdabFlRUnFRT0o2c1VBZDI2SVp5NTBVMzlhNS9mODNRVlVQ?=
 =?utf-8?B?REEvSzBab3ZaZmo4TEdXckZlc2k5MmpoT0tyYWpndjNZZ3VRWFVuN243dHpP?=
 =?utf-8?B?YTFjWXkvVlpmc1NBYU1LcldyakZLKy8wMWV4TzlOWmJUeUxicWxrYjNLNXha?=
 =?utf-8?B?K1NuQjlnVUQ4MXVBU3NJRVpjRmpFcjJ0L1pidC9lMFhBdFVEeWtjYTUyMUJS?=
 =?utf-8?B?SUpkZDJCTVA0YjVZN2Z5TjhrSjh6YXNiMnVwWUMzWXdwaFVSdGRYcU8yN0wz?=
 =?utf-8?B?bkt3cXpMemJ6akhVa2lIZGxqNVVpdm5DU2dHL3pBNmFCSFlEcXB4dzluVkVP?=
 =?utf-8?B?dWg1dHNXQkg5RVhsUTVwQWRrMjdmeWpKUldRTmxoTnhrd0c4YWoweVlJQWNW?=
 =?utf-8?B?MmlKT2lpSk8rbFFKYkd6TTBKUjhxVEpDekM4VVBTWCs4RzB3dk8rS1o0TzYw?=
 =?utf-8?B?R3lSWDNNSVNiaHlLa3B0aXdQeVpDeDhDOEZJUXRrYllWcXhkM3Z1MGpJS2hT?=
 =?utf-8?B?Mjdwakx6NzMrV0Z5eGYzcDlIdVBjZjIxSzNzZkVYVzB1WDh0MWpRRXl2KzE0?=
 =?utf-8?B?dnRRNGM5aFlyWkxyU2NseWRHNHdLaDhvY2o0SFA3ayt0YlZGTEYwSHJIT2RY?=
 =?utf-8?B?Yk1SOXY1bVZyeDRMVU5MNzFZK3BzZ3BzUlBhSXd0STZqOENmcHBtTGdtalYy?=
 =?utf-8?B?OGZrc0xtL3JtZmxVUlNvSm9iTVhFZ0FhUnFmUEtMcllvamVHY2Y4dWNQTnZG?=
 =?utf-8?B?Zmd3V3VUcVkzSUJYNytRNGJ0WVNSMFN1OUU3ekpGbllycS8vQjVsbWJNbWJ6?=
 =?utf-8?B?Y2ZrTnhQVmRFWXhqY3ZZS0hUY240elJmeTg5N3Urd0tBbmpQcFlYZXFwWlFB?=
 =?utf-8?B?M2x5ZEU2SjBNdUxlQzNhZzBGVmlvMTBFcVI0VkF1MkhlRDZnZEtjSjVnMHF5?=
 =?utf-8?B?SmhJam5aSlhUemZXbzRsdTBob2g5K0gxaFhLNVByaWlmSkVlNzVPdFNiVWpR?=
 =?utf-8?B?RENPSE9Xc0Zka01HU0EwM0hiWlNlSlIzT1BvUTVBZUU2U1dtbnRnYlNpWnkw?=
 =?utf-8?B?a1FoUk9GakNhbnlZZ3d3R2I3Y3NDV2tWQUlWNVlBSnNTWFJ4VFpHUmd2dlh3?=
 =?utf-8?B?OER3MzJCR21lS0NrSlpwUFRhYjJFa1FzT0t6dCt1dlI0bmlUSzRSRXBneXFo?=
 =?utf-8?B?ck5uWjdZVFYvVFhsU2VpZmJNVk5rV0x0UnlzbVB1U2g2d25UL1NWZG85VHF4?=
 =?utf-8?B?eDVtWXNTVWhraFcreVpYRnowaDJEL0tEU0NJT0NXOHBFNGMzdkdzMEtKeUNR?=
 =?utf-8?Q?8HplJWCmIjcWJBEc38svE5U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e79f19-6409-4747-b00e-08d9b23d9390
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2021 07:06:18.7092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AuhzW7q6+1AadhWXpnaqaactR8/uesfcXzHWETJ8BefP6ifwZoiYaEsqa1Qo3OY3WBqGwHcNmue3pi9aUlcPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yi.l.liu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBO
b3ZlbWJlciAyNSwgMjAyMSAyOjE0IFBNDQo+IA0KPiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBhdCAw
NTo0OTozOEFNICswMDAwLCBMaXUsIFlpIEwgd3JvdGU6DQo+ID4gPiBGcm9tOiBQZXRlciBYdSA8
cGV0ZXJ4QHJlZGhhdC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjUsIDIw
MjEgMTI6MzEgUE0NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBhdCAwNDowMzoz
NEFNICswMDAwLCBMaXUsIFlpIEwgd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogUGV0ZXIgWHUgPHBl
dGVyeEByZWRoYXQuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjQs
IDIwMjEgMzo1NyBQTQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjQsIDIwMjEg
YXQgMDI6MDM6MDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPiA+ID4gPiA+IFdoZW4g
Ym9vdGluZyB3aXRoIHNjYWxhYmxlIG1vZGUsIEkgaGl0IHRoaXMgZXJyb3I6DQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gcWVtdS1zeXN0ZW0teDg2XzY0OiB2dGRfaW92YV90b19zbHB0ZTogZGV0
ZWN0ZWQgc3BsdGUgcmVzZXJ2ZQ0KPiBub24tDQo+ID4gPiA+ID4gemVybyBpb3ZhPTB4ZmZmZmYw
MDIsIGxldmVsPTB4MXNscHRlPTB4MTAyNjgxODAzKQ0KPiA+ID4gPiA+ID4gcWVtdS1zeXN0ZW0t
eDg2XzY0OiB2dGRfaW9tbXVfdHJhbnNsYXRlOiBkZXRlY3RlZCB0cmFuc2xhdGlvbg0KPiA+ID4g
ZmFpbHVyZQ0KPiA+ID4gPiA+IChkZXY9MDE6MDA6MDAsIGlvdmE9MHhmZmZmZjAwMikNCj4gPiA+
ID4gPiA+IHFlbXUtc3lzdGVtLXg4Nl82NDogTmV3IGZhdWx0IGlzIG5vdCByZWNvcmRlZCBkdWUg
dG8NCj4gY29tcHJlc3Npb24NCj4gPiA+IG9mDQo+ID4gPiA+ID4gZmF1bHRzDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gVGhpcyBpcyBiZWNhdXNlIHRoZSBTTlAgYml0IGlzIHNldCBzaW5jZSBM
aW51eCBrZXJuZWwgY29tbWl0DQo+ID4gPiA+ID4gPiA2YzAwNjEyZDBjYmExICgiaW9tbXUvdnQt
ZDogUmVwb3J0IHJpZ2h0IHNub29wIGNhcGFiaWxpdHkgd2hlbg0KPiA+ID4gdXNpbmcNCj4gPiA+
ID4gPiA+IEZMIGZvciBJT1ZBIikgd2hlcmUgU05QIGJpdCBpcyBzZXQgaWYgc2NhbGFibGUgbW9k
ZSBpcyBvbiB0aG91Z2ggdGhpcw0KPiA+ID4gPiA+ID4gc2VlbXMgdG8gYmUgYW4gdmlvbGF0aW9u
IG9uIHRoZSBzcGVjIHdoaWNoIHNhaWQgdGhlIFNOUCBiaXQgaXMNCj4gPiA+ID4gPiA+IGNvbnNp
ZGVyZWQgdG8gYmUgcmVzZXJ2ZWQgaWYgU0MgaXMgbm90IHN1cHBvcnRlZC4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFdoZW4gSSB3YXMgcmVhZGluZyB0aGF0IGNvbW1pdCwgSSB3YXMgYWN0dWFsbHkg
Y29uZnVzZWQgYnkgdGhpcw0KPiBjaGFuZ2U6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtLS04PC0t
LQ0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMNCj4g
PiA+IGIvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5jDQo+ID4gPiA+ID4gaW5kZXggOTU2YTAy
ZWI0MGI0Li4wZWU1ZjFiZDhhZjIgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9pb21t
dS9pbnRlbC9pb21tdS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9pb21tdS9pbnRlbC9pb21t
dS5jDQo+ID4gPiA+ID4gQEAgLTY1OCw3ICs2NTgsMTQgQEAgc3RhdGljIGludA0KPiA+ID4gZG9t
YWluX3VwZGF0ZV9pb21tdV9zbm9vcGluZyhzdHJ1Y3QNCj4gPiA+ID4gPiBpbnRlbF9pb21tdSAq
c2tpcCkNCj4gPiA+ID4gPiAgICAgICAgIHJjdV9yZWFkX2xvY2soKTsNCj4gPiA+ID4gPiAgICAg
ICAgIGZvcl9lYWNoX2FjdGl2ZV9pb21tdShpb21tdSwgZHJoZCkgew0KPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICBpZiAoaW9tbXUgIT0gc2tpcCkgew0KPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmICghZWNhcF9zY19zdXBwb3J0KGlvbW11LT5lY2FwKSkgew0KPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIC8qDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICogSWYgdGhlIGhhcmR3YXJlIGlzIG9wZXJhdGluZyBpbiB0aGUgc2NhbGFibGUgbW9k
ZSwNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0aGUgc25vb3BpbmcgY29u
dHJvbCBpcyBhbHdheXMgc3VwcG9ydGVkIHNpbmNlIHdlDQo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICogYWx3YXlzIHNldCBQQVNJRC10YWJsZS1lbnRyeS5QR1NOUCBiaXQgaWYg
dGhlIGRvbWFpbg0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGlzIG1hbmFn
ZWQgb3V0c2lkZSAoVU5NQU5BR0VEKS4NCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgKi8NCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXNtX3N1cHBvcnRl
ZChpb21tdSkgJiYNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIWVjYXBf
c2Nfc3VwcG9ydChpb21tdS0+ZWNhcCkpIHsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCA9IDA7DQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4g
PiA+ID4gLS0tODwtLS0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IERvZXMgaXQgbWVhbiB0aGF0IGZv
ciBzb21lIGhhcmR3YXJlcyB0aGF0IGhhcw0KPiBzbV9zdXBwb3J0ZWQoKT09dHJ1ZSwNCj4gPiA+
IGl0J2xsDQo+ID4gPiA+ID4gaGF2ZSAgU0MgYml0IGNsZWFyZWQgaW4gZWNhcCByZWdpc3Rlcj8g
IFRoYXQgc291bmRzIG9kZCwgYW5kIG5vdCBzdXJlDQo+IHdoeS4NCj4gPiA+IE1heWJlDQo+ID4g
PiA+ID4gWWkgTGl1IG9yIFlpIFN1biBtYXkga25vdz8NCj4gPiA+ID4NCj4gPiA+ID4gc2NhbGFi
bGUgbW9kZSBoYXMgbm8gZGVwZW5kZW5jeSBvbiBTQywgc28gaXQncyBwb3NzaWJsZS4NCj4gPiA+
DQo+ID4gPiBJIHNlZTsgdGhhbmtzLCBZaS4NCj4gPiA+DQo+ID4gPiBIb3dldmVyIHRoZW4gT1RP
SCBJIGRvbid0IHVuZGVyc3RhbmQgYWJvdmUgY29tbWVudA0KPiA+ID4NCj4gPiA+ICAgIklmIHRo
ZSBoYXJkd2FyZSBpcyBvcGVyYXRpbmcgaW4gdGhlIHNjYWxhYmxlIG1vZGUsIHRoZSBzbm9vcGlu
ZyBjb250cm9sDQo+IGlzDQo+ID4gPiAgICBhbHdheXMgc3VwcG9ydGVkIHNpbmNlLi4uICINCj4g
PiA+DQo+ID4gPiBCZWNhdXNlIHRoZSBjdXJyZW50IHFlbXUgdnQtZCBlbXVsYXRpb24gc2hvdWxk
IGZhbGwgaW50byB0aGUgY2FzZSB0aGF0IFlpDQo+ID4gPiBtZW50aW9uZWQgLSB3ZSBzdXBwb3J0
IGluaXRpYWwgc2NhbGFibGUgbW9kZSBidXQgbm8gU0MgeWV0Li4NCj4gPg0KPiA+IGNoYXB0ZXIg
My45IG9mIDMuMiBzcGVjIHNheXMgYmVsb3cuDQo+ID4NCj4gPiDigJxJZiB0aGUgcmVtYXBwaW5n
IGhhcmR3YXJlIGlzIHNldHVwIGluIHNjYWxhYmxlLW1vZGUNCj4gKFJUQUREUl9SRUcuVFRNPTAx
YikNCj4gPiBhbmQgdGhlIFBhZ2UgU25vb3AgKFBHU05QKSBmaWVsZCBpbiBQQVNJRC10YWJsZSBl
bnRyeSBpcyBTZXQsIGFjY2VzcyB0bw0KPiB0aGUNCj4gPiBmaW5hbCBwYWdlIGlzIHNub29wZWQu
4oCdDQo+ID4NCj4gPiBJdCBtZWFucyB0aGUgUEdTTlAgZmllbGQgaXMgYXZhaWxhYmxlIHVuZGVy
IHNjYWxhYmxlIG1vZGUuIEFuZCBzcGVjIGFsc28NCj4gPiBzYXlzIGJlbG93IGluIGNoYXB0ZXIg
OTYuIG9mIDMuMiBzcGVjLg0KPiA+DQo+ID4gIlJlcXVlc3RzIHNub29wIHByb2Nlc3NvciBjYWNo
ZXMgaXJyZXNwZWN0aXZlIG9mLCBvdGhlciBhdHRyaWJ1dGVzIGluIHRoZQ0KPiA+IHJlcXVlc3Qg
b3Igb3RoZXIgZmllbGRzIGluIHBhZ2luZyBzdHJ1Y3R1cmUgZW50cmllcyB1c2VkIHRvIHRyYW5z
bGF0ZSB0aGUNCj4gPiByZXF1ZXN0LiINCj4gPg0KPiA+IEl0IG1lYW5zIHRoZSBQR1NOUCBmaWVs
ZCBvZiBQQVNJRCB0YWJsZSBlbnRyeSBpcyB0aGUgZmlyc3QgY2xhc3MgY29udHJvbA0KPiA+IG9m
IHRoZSBzbm9vcCBiZWhhdmlvdXIuIEFsc28gaXQgbWVhbnMgdGhlIHNjYWxhYmxlIG1vZGUgaGFz
IHRoZSBzbm9vcA0KPiA+IGNvbnRyb2wgYnkgZGVmYXVsdC4gXl9eLiBTbyB0aGUgY29tbWVudCBp
biB0aGUgYWJvdmUgY29tbWl0IGlzIGNvcnJlY3QNCj4gPiBzaW5jZSB0aGUgcG9saWN5IG9mIGlu
dGVsIGlvbW11IGRyaXZlciBpcyBhbHdheXMgc2V0dGluZyB0aGUgUEdTTlAgYml0Lg0KPiANCj4g
SSBzZWUuICBTZXR0aW5nIFBHU05QIGJpdCBpbiB0aGUgcGFzaWQgZW50cnkgbG9va3MgZmluZSB0
byBtZS4NCj4gDQo+IEhvd2V2ZXIgSUlVQyB3aGF0J3MgdHJpZ2dlcmluZyB0aGUgY3Jhc2ggKHRo
YXQgSmFzb24gaXMgZml4aW5nKSBpcyB0aGUgZ3Vlc3QNCj4gaW9tbXUgZHJpdmVyICJ0aGlua3Mi
IFNDIGlzIHN1cHBvcnRlZCBzaW5jZSBzY2FsYWJsZSBpcyBlbmFibGVkIChldmVuIGlmDQo+IHFl
bXUgdklPTU1VIGhhcyBkZWNsYXJlZCBFQ0FQLlNDPT0wIHRoZXJlKSwgdGhlbiBpdCdsbCB1cGRh
dGUNCj4gaW9tbXVfc25vb3BpbmcgYml0LCB0aGVuIGl0J2xsIHRyeSB0byBhdHRhY2ggdGhlIFNO
UCBiaXQgaW4gdGhlIDJuZCBsZXZlbA0KPiBwZ3RhYmxlIChpbnRlbF9pb21tdV9tYXApOg0KPiAN
Cj4gCWlmICgoaW9tbXVfcHJvdCAmIElPTU1VX0NBQ0hFKSAmJiBkbWFyX2RvbWFpbi0+aW9tbXVf
c25vb3BpbmcpDQo+IAkJcHJvdCB8PSBETUFfUFRFX1NOUDsNCj4gDQoNCkFib3ZlIGlzIHRoZSBm
YWN0IHRvZGF5Lg0KDQo+IFNvIHdoYXQgSSdtIHdvbmRlcmluZyBpczogd2hldGhlciB0aGUga2Vy
bmVsIHNob3VsZCBfbm90XyBzZXQgU05QIGJpdCBpbg0KPiB0aGUgMm5kIGxldmVsIHBndGFibGUs
IGV2ZW4gaWYgd2Ugc2V0IFBHU05QIGluIHRoZSBwYXNpZCBlbnRyeS4uIGJlY2F1c2UNCj4gYXMg
eW91IG1lbnRpb25lZCwgdGhlIGhhcmR3YXJlIChoZXJlIHRoZSBlbXVsYXRlZCB2SU9NTVUpIGlz
IGFsbG93ZWQgdG8gaGF2ZQ0KPiBib3RoIHNjYWxhYmxlPT0xIGJ1dCBzYz09MCBzbyBpdCBtYXkg
cmVjb2duaXplIFBHU05QIGluIHBhc2lkIGVudHJ5IGJ1dCBub3QNCj4gdGhlIFNOUCBiaXQgaW4g
cGd0YWJsZXMuDQoNClRoaXMgaXMgYSB3ZWlyZCBjb25maWd1cmF0aW9uLiA6KCBsZXQncyBmaXgg
aXQgaW4gc3BlYy4gZS5nLiBQR1NOUCBiaXQgaXMNCnN1cHBvcnRlZCBvbmx5IHdoZW4gc2NhbGFi
bGU9PTEgYW5kIHNjPT0xLiB0aGlzIG1ha2VzIG1vcmUgc2Vuc2UuIHJpZ2h0Pw0KVGhlbiBTTlAg
Yml0IHdpbGwgYWx3YXlzIGRlcGVuZCBvbiBzYyBiaXQsIGl0IHdvbid0IGhhdmUgYW55IHJlbGF0
aW9uc2hpcA0Kd2l0aCBzY2FsYWJsZSBiaXQuDQoNCj4gDQo+IElmIHdlJ2xsIHNraXAgcGd0YWJs
ZSBTTlAgYml0IGFueXdheSBmb3Igc2NhbGFibGUgbW9kZSwgaXQgbG9va3Mgd2VpcmQgdG8NCj4g
ZXhwbGljaXRseSBzZXQgaXQgdG9vLg0KPiANCj4gSSB0aGluayBpdCdzIGZpbmUgZm9yIEphc29u
J3Mgc29sdXRpb24gdG8ganVzdCBza2lwIGNoZWNraW5nIFNOUCBiaXQgc28gd2UNCj4gaWdub3Jl
IGl0IGluIHFlbXUsIGhvd2V2ZXIganVzdCB0byBkb3VibGUgY2hlY2sgd2UncmUgb24gdGhlIHNh
bWUgcGFnZS4NCg0KSWYgd2UgaGF2ZSBhYm92ZSBmaXggaW4gc3BlYywgdGhlIGlvbW11IGRyaXZl
ciB3b3VsZCBhbHNvIHVwZGF0ZSBpdHMNCmJlaGF2aW9yIG9uIHRoZSBTTlAgYml0LiB0aGVuIHRo
ZSBwcm9ibGVtIGVuY291bnRlcmVkIGJ5IEphc29uIHdpbGwNCmdvIGF3YXkuIHJpZ2h0Pw0KDQpU
aGFua3MsDQpZaSBMaXUNCg==

