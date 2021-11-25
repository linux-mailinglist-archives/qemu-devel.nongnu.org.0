Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76B45D47A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 07:01:21 +0100 (CET)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq7ou-0001Ye-6a
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 01:01:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7ms-0000rZ-D7
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 00:59:14 -0500
Received: from mga03.intel.com ([134.134.136.65]:50655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7mq-0000VF-GD
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 00:59:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235389385"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="235389385"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 21:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="571700639"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2021 21:59:09 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 21:59:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 21:59:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 21:59:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kxb+JeQRHrkpQyYzdYmpaY3vnHdQqLUZkWOqO0+OKGCcGR6ijvZ83/DfWY4IHzsPxCI1QImLpAJTmBpnweZ5s3HJo0nlTva62E4odkquC56Cfes1a/WLuxtTF3kYYDqKKzmZ1MmzBBhxxPwJwZp/XK4ASurco/tABTPPizjzdodWLHGo0nQopabXlb7tIHSNnkdo++inFXdrsd/qekmKi7tBPRIDTvppTCWXipcM/kx/Omr3c7nPL8moLzITBf3t7lwLZFjM0Js/q/33bLCa+fa/Z3+jMxVqpvoQbw26Wb1CretS3PF1Q9jzSq0aIeU2TghHzOcp2RDDsQk80FDReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcnINUosia++bMArzkjlWCglQsS9qOKp3fZcpnbrXlQ=;
 b=HIhpqgaNHuA16NkxKApTs4QJ9MMamNSO/9UU9VFXE0rMwTXcw7oFQlXsurFf02Z3ITc50HLOyKv1O8K398KGi+eTDd03c/tcrw/bGtusCGwDYhzcb1rxdCPiWTetlvHzb+MIjzb62YoeRR9lVPq4hh3AOKd2EjlsMW/LvgcRJoapCaohv6BSvTOJCZTGMM5rBK1MalO4iHEZTdmak7KHfkD8xSuXP2YSlZZIEwGzVyxwZIBDXTRwlI4MA/otUUzWeKqgtSb0/7Vu0k7vQHdCOR07vBh2Bmea7E2FDfXtEocas5tKbinCs+dX1PMHdiY7lEfaO4QuAluy+FYemFe/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcnINUosia++bMArzkjlWCglQsS9qOKp3fZcpnbrXlQ=;
 b=yH3Ym/M99lCYEMQ6ACbNPm2fPGEqVMUpgyB5mhx25lSEeg+HgtjlOnWzCU+kQwSW3kb0RLYyQOfa4Y/JdV/XIeGzAZ5cbADkemSRoM32sRN+uSv8P5gSJelzlR7EhHj7E+czcJCxYHRnx9B6Z+bgCTTQdRIlIVEU6u8O7WgbXbU=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 05:59:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%7]) with mapi id 15.20.4690.027; Thu, 25 Nov 2021
 05:59:06 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Topic: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Index: AQHX4PkO8vWA/pLrmUq8Xu2sJLwMqKwST9sAgAAI0gCAAAaegIAAAo4AgAAGDgCAAANWAIABVVVQ
Date: Thu, 25 Nov 2021 05:59:06 +0000
Message-ID: <PH0PR11MB5658F5E794E255E63A71F661C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <CACGkMEvLAThn7VFtB2xeaP+bzPtnVwj0Orzpt=nK5Bg2h6QZow@mail.gmail.com>
 <YZ39USAfW7i1oAOO@xz-m1.local>
 <CACGkMEsohbTvbFhMaZ_aAHpyJdbB4xcp6zRzaVYZXAZzCN7Vyw@mail.gmail.com>
 <YZ4EioUDRAygL61n@xz-m1.local>
 <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
In-Reply-To: <CACGkMEvDjMA87yRxW1dNcA-L7RtrvcqtTqn3sCOF7Yudd=YWpg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: f39e4c17-b2e3-433b-a73a-08d9afd8b106
x-ms-traffictypediagnostic: PH0PR11MB5611:
x-microsoft-antispam-prvs: <PH0PR11MB5611D3F9130C44487DD26E82C3629@PH0PR11MB5611.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JGcK5Ixii8VAP7lp3E+jmzx6KDFDFkBUNdZSP5OiiJ/J+WxFkj7E0TDWBsF0k/f5JY+YUdB3JNlZ9f/7AR6biOt7adr8RPQ1LDDmF8qR3oEfV02oHu8apNl2nJtsHJwODRwVNhBxRymJ0BbebWvQzd/ZQQlpUXqx9C1fUPw7SqyNJ7hJOeIXsEc59yjub6d7piLNTsM8KjC5Hx/7PdiRr7eCrwjisqaxEflP31svKCGoMdUjKtnDmrb3ntp6G4eas7AascKIQFV0mB7cGlFXwGJXhtBMI69rEMi7axyDfkxYhLQ7jJ8tli3B3N8j18eycm3nBiv+LBK29Jim8KdgWlT/G59AWWxa339yIHbImZQwe50VmKwfuBrWge3Gh3ALSvbqyxazyCyM/bg5fVBlRkQToShVOIV03SRpHumXsjxwopDBwxs7v86AjaMOsBSiSFTpOF5WUSgtJHB9GRhVWIWQ4rKaShmmjHNnpTJfD0jYt+si1sptohbWHZWo5gWvbZKwn/Z28j3exWe4BmxdLfq1siEVGZkNfWmyNGRmAbhc92uoCQm9k+lq17TQUGqHh4jOaGP745Tcqg504mzDmWYPmWGtyWUDMaDrpnIgOLGrCNv5224pp8WtN2iUUghPNeuK7ubfZDwbTMc1V4ryxqdqUSX/7eRTcwYGl9h6KzDhC6ow1+axdOtNIRHGV2t87Wq1WqHXUzUgMEg4bBKFvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(76116006)(5660300002)(66556008)(122000001)(66946007)(66446008)(38100700002)(53546011)(64756008)(9686003)(7696005)(508600001)(38070700005)(186003)(66476007)(6506007)(8936002)(71200400001)(86362001)(8676002)(4326008)(54906003)(110136005)(316002)(55016003)(82960400001)(26005)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlArL3lBU00rc0p6cCt3TlF3N2FYRTYrbzNSUVRSdXFIb0RlVzlSRkdTNTFQ?=
 =?utf-8?B?cjIxTyswSXJjT05DTzlnL2JhVExLYStzNjJxUERhc3QxRll3TStiSkxlYjFF?=
 =?utf-8?B?dzVmU0xURkRxM3BqNVVKK3NUWXh4WGpHNFlVeHNJZlVzQlVUT3plc0ZydWtu?=
 =?utf-8?B?R1EzTjJkMkJCZ0lhbjI1Z3J0dTNXUG9tcS8rbVoybWVBbFB5cWVodTZiaGRT?=
 =?utf-8?B?WWhSZlVkZ0tsZ3ZjYldIN3Y1V1pMK1A5MWxsdFIrenVpQUNxMzZMMmF3amJZ?=
 =?utf-8?B?VnlzazdmSCtDclVaRXVWdnVkVHhUR0ZnalVKeFRtMVFiNzZpYmVIcTlPTnpR?=
 =?utf-8?B?ZHg3OGI4c1V5YXFmWXFGM2lVQjJJNjVvZWlybmtkdGFLenlsYVpYa3pvMUhP?=
 =?utf-8?B?ajV3YUZiYzBvUFVyRzFWYjlBR1B3U3hvaTdlUXJkWlE4cXd3NHQ5NWZad1ll?=
 =?utf-8?B?Y3BOOFYxYzB5SHlvQlcvRnp1b0VNWVhQZnlBeW9GSHpOTmFLZUsrYTFVcnVo?=
 =?utf-8?B?cm0zOWxwbTQ4SFRXT0RhVHZnQWlrL1N2UFEyeGlSY1cwVnNYRHhTMjRZVkdj?=
 =?utf-8?B?L2lwR3pKNjZWM1g2bmVGZ3d3VnpzNWtNdktUUVJsNXg2Qjlmd3VSNDkyRCs5?=
 =?utf-8?B?aTlmMzRQaGJoSUNEOWZHUFdNc0hrQUdUdXZHU2hQV01DWEQrcEtGazgvVng5?=
 =?utf-8?B?aHBFWW8rbEhMYVBmOXpEcy8vRXRxK1AwcWZ2MGcyVkF5Y2szZHV2aFRMTlY1?=
 =?utf-8?B?SzFBQkRGMFZyb3FKUy9obHNrZ3c3RnNIR2tZaEdrYWJrT0swcXM3UFpFZGhH?=
 =?utf-8?B?aFhrRml6NmUyWlV1RWJWZFBZc2h1b0hCc3Y5ekZJbUFDZzM5Vklka2Vmbmdi?=
 =?utf-8?B?cGhCVGNxK3cyOFN6dTZoY09OckQwVWR4SGhCZDBmeCtpYnBRY0RLcDNYL2FZ?=
 =?utf-8?B?d3RJMjV3N1doWS9kVlB6aklvb0R1ZTRlQkd0ZzloWlVQYUdiTkVzRU56cnhZ?=
 =?utf-8?B?RkViWkxQVE40aGNrT1hBQ0pmQzdVUnFYRkxnWC9RUmlxbXBoSDlpOFh3SlFY?=
 =?utf-8?B?VVRJVVJ6U2RoS3JUU1JWYnRTK0gzcWVPRjlyNkJxaEZTa3ZRcVdNVUk3Sm5F?=
 =?utf-8?B?VUQ1UUVXR2NmdkpxZHhQbHU4WTRUV1ZLZDd2aEplbzVhNnlkMzMvQ2FWUVI0?=
 =?utf-8?B?Qm1uNjNIcC9pNmhWYjZ4bXBlNEZyNVlwanZXM3N5OUlFSi9uVmltUmxjK3dM?=
 =?utf-8?B?RjZEUi9rcTZaMGhSV2RENzNQVzZWVTJ0USswVXVDcVZCV2w0b2hVTWQ1YXJp?=
 =?utf-8?B?Mis5WGpGKzh5N3V2SkoxODhXdDdhcXIwbXJlK3pZQmNWRnR6Ymw3RG90TWVa?=
 =?utf-8?B?aW1nZU9keVJSWW5BMGVDQTlpV2JDYWxmZVM5UTNTemQrYkpFUkhCYjNsRlZR?=
 =?utf-8?B?OW5OSlErbDBMWU10cExBS25uS29tcUFlR0ZzR3JMVDJpc2FoODBvdzRNSkpL?=
 =?utf-8?B?TkhCQ1VCeC8yTDdKNHhleGNTSSswV0NrNkp4UmFJWmFNVUNpWGRtdWMxQUhk?=
 =?utf-8?B?ZlVoVGl0eTJuSEdoUWxJZWp5UkxwV1NRcUI5cGJndDcwWjVseUx3M1pSbDFP?=
 =?utf-8?B?VWc0b2hwSmpMU1VPSi83NmpQNS9idFNaWndDTTV3bG8xNStDVmZRa0kydjlH?=
 =?utf-8?B?bU95OGUyUXd0WC80dlFCMnJSQkJPL0dmWGhEYlB4dDR5TlRUVE9WbUhMcWlT?=
 =?utf-8?B?TzhzelJaVTk2YWxvVGlPYjRZODR4eSt0L0NabHVyM2FnZ0tEV2dtMit0MTl4?=
 =?utf-8?B?dUk5TGZWVkhMc0VYY1p6VlRJTERvaEFLbGtzZWJadTNLc09Hbkp0RHF4MU9W?=
 =?utf-8?B?ZDR2OGFyZnZSYTJoaG1RczBtd090aEF5d0lxVVd6RGRxVnA4dDZxd1dLZzV5?=
 =?utf-8?B?ODNIMk5kTTZJeVFJVTVVeXA1U0hNUlN3M0d1U2ZFN2c2TkZNTkJxK1FXU25Y?=
 =?utf-8?B?SHkvWm1tTjdEQkVJcXBsUHVzNTBkRzRQc0x4TUZHMUY1eXNHK29CS05mMXh1?=
 =?utf-8?B?VGxadDZLS3ZINm1OQ2l5SkdMVzMrczkzWGN1elErWHV1OHpVUDI2Tzhjc21E?=
 =?utf-8?B?bC9iWDNnVFZEUGJpLzA3WUFXV2VnR3Z1RWQ2aUpYWTB1M2FadEIxWDlucDk2?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e4c17-b2e3-433b-a73a-08d9afd8b106
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 05:59:06.5962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+O6YUPi3b+c4c7Qxxbm6wCmJjYF8ivnzLH14/usGEPIHLXm5d0QQNuu2FxANRGOmBkaKf/1cMqW3U7yJQBs8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yi.l.liu@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
YXksIE5vdmVtYmVyIDI0LCAyMDIxIDU6MzUgUE0NCj4gDQo+IE9uIFdlZCwgTm92IDI0LCAyMDIx
IGF0IDU6MjMgUE0gUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPiB3cm90ZToNCj4gPg0KPiA+
IE9uIFdlZCwgTm92IDI0LCAyMDIxIGF0IDA1OjAxOjQyUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6DQo+ID4gPiA+ID4gPiA+IC1zdGF0aWMgYm9vbCB2dGRfc2xwdGVfbm9uemVyb19yc3ZkKHVp
bnQ2NF90IHNscHRlLCB1aW50MzJfdA0KPiBsZXZlbCkNCj4gPiA+ID4gPiA+ID4gK3N0YXRpYyBi
b29sIHZ0ZF9zbHB0ZV9ub256ZXJvX3JzdmQoSW50ZWxJT01NVVN0YXRlICpzLA0KPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBzbHB0ZSwg
dWludDMyX3QgbGV2ZWwpDQo+ID4gPiA+ID4gPiA+ICB7DQo+ID4gPiA+ID4gPiA+ICAgICAgdWlu
dDY0X3QgcnN2ZF9tYXNrID0gdnRkX3NwdGVfcnN2ZFtsZXZlbF07DQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IEBAIC05NzksNiArOTgwLDEwIEBAIHN0YXRpYyBib29sDQo+IHZ0ZF9zbHB0
ZV9ub256ZXJvX3JzdmQodWludDY0X3Qgc2xwdGUsIHVpbnQzMl90IGxldmVsKQ0KPiA+ID4gPiA+
ID4gPiAgICAgICAgICByc3ZkX21hc2sgPSB2dGRfc3B0ZV9yc3ZkX2xhcmdlW2xldmVsXTsNCj4g
PiA+ID4gPiA+ID4gICAgICB9DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICsgICAgaWYg
KHMtPnNjYWxhYmxlX21vZGUpIHsNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgcnN2ZF9tYXNrICY9
IH5WVERfU1BURV9TTlA7DQo+ID4gPiA+ID4gPiA+ICsgICAgfQ0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IElNSE8gd2hhdCB3ZSB3YW50IHRvIGRvIGlzIG9ubHkgdG8gc2tpcCB0aGUgbGVhdmVz
IG9mIHBndGFibGVzIG9uDQo+IFNOUCwgc28gbWF5YmUNCj4gPiA+ID4gPiA+IHdlIHN0aWxsIHdh
bnQgdG8ga2VlcCBjaGVja2luZyB0aGUgYml0IDExIHJlc2VydmVkIGZvciBlLmcuIGNvbW1vbg0K
PiBwZ3RhYmxlIGRpcg0KPiA+ID4gPiA+ID4gZW50cmllcz8NCj4gPiA+DQo+ID4gPiBNYXliZSwg
YnV0IGl0J3MgcHJvYmFibHkgYSBxdWVzdGlvbiB0aGF0IGNhbiBvbmx5IGJlIGFuc3dlcmVkIGJ5
DQo+ID4gPiBJbnRlbC4gSSBjYW4gY2hhbmdlIGl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIGlmIHlv
dSBzdGljay4NCj4gPg0KPiA+IEknbSByZWFkaW5nIHZ0ZCBzcGVjIHYzLjEgKEp1bmUgMjAxOSkg
aGVyZSwgYW5kIGNoYXAgOS44IHRvbGQgbWUgdGhleSdyZQ0KPiA+IHJlc2VydmVkIGJpdHMgZm9y
IHBnZGlyIGVudHJpZXMsIGFzIG5vIFNOUCBiaXQgZGVmaW5lZCBvbiBwZ2RpciBlbnRyaWVzLg0K
PiANCj4gWWVzLCB5b3UncmUgcmlnaHQuDQoNCnllYWguIFRoZSBTTlAgYml0IGlzIG9ubHkgYXZh
aWxhYmxlIGluIHRoZSBsZWFmIHBhZ2luZyBlbnRyeS4gZS5nLiBmb3IgNEtCIHBhZ2VzLA0KdGhl
IFNOUCBiaXQgaXMgaW4gdGhlIFBURSwgYnV0IGZvciAyTUIgcGFnZXMsIHRoZSBTTlAgYml0IGlz
IGluIFBERSwgYW5kIGV0Yy4NCg0KUmVnYXJkcywNCllpIExpdQ0KDQo=

