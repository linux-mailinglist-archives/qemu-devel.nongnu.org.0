Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8DF45D471
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 06:52:17 +0100 (CET)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq7g8-0007dq-68
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 00:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7dn-0006Y0-S0
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 00:49:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1mq7dj-0007Ye-0I
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 00:49:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235266627"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="235266627"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 21:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="741069504"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2021 21:49:41 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 21:49:40 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 21:49:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 21:49:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 21:49:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4VP5OS8TYHMCqCaKOMTpTadCS3M3z9gfUhC7WLB2ZMRQdGd0S8atAOgbLVxmbprqz3BEEXNPNsNVa8OCi8x+2Uay1WIuCpQnEgZG8h0LKhT81n8ep5FGVt9QosH5MoTyArHe90JlSZ9UAccOwv3/73A6e6jx7+HHJs91vTaF+9hw5Z5kDim9yY7JzZ+3uBPlXl2cxLJ1a+/G8hBPLKYBWnNCv+ju/GNDWTIklmhAn6/0aoU1tv76FFm3HoMBZbaAlsOvRNZjJK4BBjF0v/ZTWVpcxw/9gr7QEsbxjpZ0dDwwN17F09ehhSgm/SAB52DePOhbKwCFvBXN0gyt7KQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO9D+Qscm9dRTKs5zrhWxTshURUzT6VV3uCluYURRHk=;
 b=RbRPjnADvn32f6zFFFg07GDHAoTl4aP98F2QMBXqbw4EOnLf3egh4+auh2TPUqWvNTB/PV1TK9Ib3+aBI5JIU2J3WDD+rZQkLhtb925MZ+OkHiUi+rDjKZJpO4W3QHf0epNpXNDmQNNyX/GATRhnEVgm+8TsYtGuIVJueswdgsPH6B3JpiXtB0HzvfOaD7m+JWDzFWbG0fyN+8mWK7hW0liiF6ySEx9zfhQMlSgeyVGmpPKU/PzzuLjNJ2BkqODYIN3r8btjYmfX0wzQ+TBrFZUo6p7Iq0NljaPxY70RG2/rBPus2npwbetFmgKU2222Sv5OaezB29yqLyZdQfNvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO9D+Qscm9dRTKs5zrhWxTshURUzT6VV3uCluYURRHk=;
 b=SOudz2IWy/96tkVsfwq2dPwT79xHhgRypxUjMcxJNhQabUQByV0pWHsg5j6A3z2jpg4KZje0SFcpY8RkkBvh6nUL49VRrHXbHGHtEYvVAu5cVQ4Gk54sRswpEfPT/uC9YVLKzGAayc9pGdi6m94HNLR/xVubYTnSkA61ZzDdBJ4=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5596.namprd11.prod.outlook.com (2603:10b6:510:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Thu, 25 Nov
 2021 05:49:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%7]) with mapi id 15.20.4690.027; Thu, 25 Nov 2021
 05:49:38 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Topic: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Thread-Index: AQHX4PkO8vWA/pLrmUq8Xu2sJLwMqKwST9sAgAFIEoCAABCYAIAAEYxw
Date: Thu, 25 Nov 2021 05:49:38 +0000
Message-ID: <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
In-Reply-To: <YZ8RfrbwXEB2fcJv@xz-m1.local>
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
x-ms-office365-filtering-correlation-id: 105aae9f-a9f6-4ab1-bdb4-08d9afd75e94
x-ms-traffictypediagnostic: PH0PR11MB5596:
x-microsoft-antispam-prvs: <PH0PR11MB5596677B11C2A60921CA32F0C3629@PH0PR11MB5596.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4pgwik19ywZl99U85MPdzLPOLVZzwN8p7oW0bSa9Rd3y28RDSP3NQadMaJbcX6RzqI62rcVF/V5lr2uqsW57C4U7itFdm2QanhFqIUuS/4z5fYqiAyZ2urQTTXrGEnl2fZzB0YVnurV1oaX+Y02sVXTKlEjBIDL+c772u84dc4fubeDhOwMwvt/XhGCU57egHGB0P8cRCej7MzAU7dHKdc6F9wimdFpqIU+5ihd6qpZ+8iYq0aM8gGwk8Ravl8NYUPk21myQY4HOAJzvLACt9A01f++OqJ6WQQLHnfgV6aW4LZo8Ts3vwrOtLkWHL3rWs/FsDSBft4qdUlWEmsiWv2BDO1cgv/l0QxbDczePD4tpMYtr2EvUEpvTVu7/0X6NvPEnOMqS1Et+dvbg+DpMEG39dWRjXMflEfg44a+Q1v65u8dcEFEl/JN1HqaKtCh94Y2gudD/OtlOIqHXqUee8MjVY3lFIZSJd0Eh8Lm8NPCyIMCfiisYdQouNTXOYW7oemcPz6XHAIeslqMZ8M31P3wfkumJBQB/jU+Y/qdOGT4J3bjoay1G3MRrR6Bi+ss9gQdRhGLuiyRwRdo+mLLU0TSxRPXPE91X7g19QQoG7zGLQD03ZxW1KhTRpsn0hIycGnKqTBkfM+rjVuCTW2ibQip/aCjsNdV7PlAE05mMfc7Fgf3XAkOcnnmYJpDO04dvB4WtD2LHaaLHP93Z6votwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(4326008)(8676002)(83380400001)(76116006)(55016003)(38070700005)(186003)(82960400001)(9686003)(508600001)(7696005)(66446008)(86362001)(26005)(122000001)(6916009)(54906003)(66476007)(52536014)(8936002)(71200400001)(66556008)(64756008)(2906002)(316002)(6506007)(5660300002)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpicTZPMVlMWEdKZ2Nhc1lmbDk5ZXB6Z045VStOdm8wWWE2U1g0ZHVSOFdj?=
 =?utf-8?B?ZmI5a1dXNFVUc3FPQXNWbHZpOEYvYVZHbFJTMHUvMUprZWU5TE85TEUrNkxi?=
 =?utf-8?B?YXYwemptSmNlQzBsdFVnWFp2enYvRVNNMElxUS9rc2Q1ZUc4WUZFZmNzL0ta?=
 =?utf-8?B?OWlmaGVRbXdnWWtNNDd2b1FLMXRlOVR3dFlUTVgzWTdTOW5PcmVWVGVRZHVC?=
 =?utf-8?B?NTZNVDJlamVZMzFkRG11Y0NaRTJoZ2Q5LzNMNUdwbEJ6TzIyRjIvQnlha251?=
 =?utf-8?B?U2NUZks5UEVZbEpYNXpyYUtNTnlGblFqaUFFOHU4c0lpZTZOaE1FbS9QYkpO?=
 =?utf-8?B?cmpHbGlYQ2tIZno2VFUzVXhxNUtoYXZNVzFpQnA4WUpPdnFMV1dZb1h3eURG?=
 =?utf-8?B?MndaU2dxNGlxQkpjajR3and5Qlg1WDRNOGtpSE9HZWxuU0F2T0JLeVhld3Va?=
 =?utf-8?B?KzFBY1ZyemdLWGp4TmtTRVpCQ0lGM0ZyUTl4WjVWSTk3a3YyVWhSNWpUZUx4?=
 =?utf-8?B?dk9TVWRTWHRScy9QYWFiZWxrdzdrVFRXN3pDVU5DWEFna0lncDRrVUw2a3Qv?=
 =?utf-8?B?MStEVm50VVVCYTh4cmpKVlNMWC81UWFSMzl2YXM2aEs0NEJCdG1GUnAxaUZ5?=
 =?utf-8?B?T1cyeTEwTk05SXplWmFxb1ZFMVlOUml5VTN2N2xMREFPYkFzamgvZS9ZbFZr?=
 =?utf-8?B?YXRQUGRkN3EzNHMvOUtpbHJPZWp2V0dreTZwMW1IS3lNT3pQRmVxVGxMVzRj?=
 =?utf-8?B?TWFteU9SaWJCQWtRVUQzSTRYaGQ5ZU4wY1RLYnhVaHBDWFNIMDhBQldldEZV?=
 =?utf-8?B?TXE2S2hnQnFKRE1vNGhlM2gyVVpERWxCeU0rQXlUTUcwaFp2T0ZPN1BnK1Nz?=
 =?utf-8?B?Q1hIeERSRjR3ektUS1pVRXNmMENkS1hJQjFXLzFneHdpS292VFNnaHJOOGRG?=
 =?utf-8?B?Y2p2Qmx4UFA0T3dYZHNSRUVxQW9xcXN1U0k5eHl6M1hrZTlkMkF0ZUh1aXVm?=
 =?utf-8?B?b0ZmWE9nYXdwazY3dVJKcUI1MmNPcEV2cGJ4SXpnSi9ocmFGNWVRUUszVG5x?=
 =?utf-8?B?Z2g5bHc2MGJCT3VrQ0dYczhvZ3Rza3JjOVhxdzhMdzc2YURKNzY0Yzh5MFFB?=
 =?utf-8?B?UjREZ2lBb0ZCVC9oaGlpMUU1dFFmVWJMZGdHOEU4RVJDYjAyckl3TDZhdThn?=
 =?utf-8?B?OXVKMGtyeGd5QmQwaUpHNEZvRlBVRUZXUTdQUnpjUnVPYnZseWNISzM0dHFr?=
 =?utf-8?B?dkpUMjJ3bVhEbnprWkJsNGRnYm5FUFNtREVydUdRQlp1NFhWYm4rRnpjcVI2?=
 =?utf-8?B?bmZuVXpyRGVoZlJoWGNiSko2ay9Jc09CWnE1aXY2TGdhcGsvWUF0cXBtaUp2?=
 =?utf-8?B?UWp3UEpPZkEycklHMk5LYk1PQlNHMTZxRGVWbEllWm1MVFFqUGNZditUMmRT?=
 =?utf-8?B?R2dBaFgwN0JINFRKaXZoOGV2TWdQMmVqOWxWR1lCeTEwc1MxSlkzRm9XQXN1?=
 =?utf-8?B?b3pWSjhWam9HMjFXMmxlTWp5TDVXb2tFVDd1N3hDaGVPVzJwSTJHZTFZNEpM?=
 =?utf-8?B?UFdacTFKRzIwLy9rMGFEU2lhdHVvaGl5djc3MlYrb3RTTUhpbWhKd3ZuUmFr?=
 =?utf-8?B?M1p5eWhKcS9VTnBlS0hsMWh5SXNFQnc0MVdWSk83YzQxeFRhVERMaDdtanFs?=
 =?utf-8?B?alZiOFFPUTJTSTJsblorRTBnUGcxZG15ZGRRS2NSekFXbXFnOWhzZkRnNlUv?=
 =?utf-8?B?WEhUYTJDWm9CcDVRU1Via3R1N0t5eUF5VEFKMDQ0MUo5M2F4eU1RK2xWTlly?=
 =?utf-8?B?RGlkVGYyMllOSFBndnNvL2IwWWdmY0dYZjRxa2RUQ05iM0lMNWNIdEUxdk9H?=
 =?utf-8?B?Y0p4MEpXZmV1RDNxdzVPellNbHZwU2duRTVUaUR6MDEwU011aXFCRnBCczZz?=
 =?utf-8?B?VmJuNkJmL2M3QXlSSWxRby9ycUVESm5ESURjZWxURmZsSFVuMWNQV2Vha05X?=
 =?utf-8?B?b0JUN2ErRG03d20yeEhaRTh3S1ZqekJmRFdicDM0M0V4N3lIWlEvMmdIWHFG?=
 =?utf-8?B?SWN4aUJCVHlxZENQVG4vell1N01CNHdqejJ0bXFubWZ1VW9FUFdnb1lpWEtQ?=
 =?utf-8?B?dk54dkw1eWtFa1QyRStET1k0TWF2U3dFb3krSXJBMmNyYXVoMWhZS1RtWm9C?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105aae9f-a9f6-4ab1-bdb4-08d9afd75e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 05:49:38.7419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQ9dNqfWU3XYtPGNSSgsTe2/BG7EK9zWgAt9DN5DDjkspL1i0WFkxE5SgongWMnGdTodX+SaAVP8529F/6EAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5596
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
Cc: Jason Wang <jasowang@redhat.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBO
b3ZlbWJlciAyNSwgMjAyMSAxMjozMSBQTQ0KPiANCj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQg
MDQ6MDM6MzRBTSArMDAwMCwgTGl1LCBZaSBMIHdyb3RlOg0KPiA+ID4gRnJvbTogUGV0ZXIgWHUg
PHBldGVyeEByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNCwg
MjAyMSAzOjU3IFBNDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgMDI6MDM6
MDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPiA+ID4gV2hlbiBib290aW5nIHdpdGgg
c2NhbGFibGUgbW9kZSwgSSBoaXQgdGhpcyBlcnJvcjoNCj4gPiA+ID4NCj4gPiA+ID4gcWVtdS1z
eXN0ZW0teDg2XzY0OiB2dGRfaW92YV90b19zbHB0ZTogZGV0ZWN0ZWQgc3BsdGUgcmVzZXJ2ZSBu
b24tDQo+ID4gPiB6ZXJvIGlvdmE9MHhmZmZmZjAwMiwgbGV2ZWw9MHgxc2xwdGU9MHgxMDI2ODE4
MDMpDQo+ID4gPiA+IHFlbXUtc3lzdGVtLXg4Nl82NDogdnRkX2lvbW11X3RyYW5zbGF0ZTogZGV0
ZWN0ZWQgdHJhbnNsYXRpb24NCj4gZmFpbHVyZQ0KPiA+ID4gKGRldj0wMTowMDowMCwgaW92YT0w
eGZmZmZmMDAyKQ0KPiA+ID4gPiBxZW11LXN5c3RlbS14ODZfNjQ6IE5ldyBmYXVsdCBpcyBub3Qg
cmVjb3JkZWQgZHVlIHRvIGNvbXByZXNzaW9uDQo+IG9mDQo+ID4gPiBmYXVsdHMNCj4gPiA+ID4N
Cj4gPiA+ID4gVGhpcyBpcyBiZWNhdXNlIHRoZSBTTlAgYml0IGlzIHNldCBzaW5jZSBMaW51eCBr
ZXJuZWwgY29tbWl0DQo+ID4gPiA+IDZjMDA2MTJkMGNiYTEgKCJpb21tdS92dC1kOiBSZXBvcnQg
cmlnaHQgc25vb3AgY2FwYWJpbGl0eSB3aGVuDQo+IHVzaW5nDQo+ID4gPiA+IEZMIGZvciBJT1ZB
Iikgd2hlcmUgU05QIGJpdCBpcyBzZXQgaWYgc2NhbGFibGUgbW9kZSBpcyBvbiB0aG91Z2ggdGhp
cw0KPiA+ID4gPiBzZWVtcyB0byBiZSBhbiB2aW9sYXRpb24gb24gdGhlIHNwZWMgd2hpY2ggc2Fp
ZCB0aGUgU05QIGJpdCBpcw0KPiA+ID4gPiBjb25zaWRlcmVkIHRvIGJlIHJlc2VydmVkIGlmIFND
IGlzIG5vdCBzdXBwb3J0ZWQuDQo+ID4gPg0KPiA+ID4gV2hlbiBJIHdhcyByZWFkaW5nIHRoYXQg
Y29tbWl0LCBJIHdhcyBhY3R1YWxseSBjb25mdXNlZCBieSB0aGlzIGNoYW5nZToNCj4gPiA+DQo+
ID4gPiAtLS04PC0tLQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9t
bXUuYw0KPiBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYw0KPiA+ID4gaW5kZXggOTU2YTAy
ZWI0MGI0Li4wZWU1ZjFiZDhhZjIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L2lu
dGVsL2lvbW11LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvaW9tbXUuYw0KPiA+
ID4gQEAgLTY1OCw3ICs2NTgsMTQgQEAgc3RhdGljIGludA0KPiBkb21haW5fdXBkYXRlX2lvbW11
X3Nub29waW5nKHN0cnVjdA0KPiA+ID4gaW50ZWxfaW9tbXUgKnNraXApDQo+ID4gPiAgICAgICAg
IHJjdV9yZWFkX2xvY2soKTsNCj4gPiA+ICAgICAgICAgZm9yX2VhY2hfYWN0aXZlX2lvbW11KGlv
bW11LCBkcmhkKSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGlvbW11ICE9IHNraXApIHsN
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICghZWNhcF9zY19zdXBwb3J0KGlvbW11
LT5lY2FwKSkgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAqIElmIHRoZSBoYXJkd2FyZSBpcyBvcGVyYXRpbmcgaW4gdGhl
IHNjYWxhYmxlIG1vZGUsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0aGUgc25v
b3BpbmcgY29udHJvbCBpcyBhbHdheXMgc3VwcG9ydGVkIHNpbmNlIHdlDQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgKiBhbHdheXMgc2V0IFBBU0lELXRhYmxlLWVudHJ5LlBHU05QIGJp
dCBpZiB0aGUgZG9tYWluDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpcyBtYW5h
Z2VkIG91dHNpZGUgKFVOTUFOQUdFRCkuDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
Ki8NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghc21fc3VwcG9ydGVkKGlvbW11
KSAmJg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICFlY2FwX3NjX3N1cHBvcnQo
aW9tbXUtPmVjYXApKSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IDA7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ID4gLS0tODwtLS0NCj4gPiA+DQo+ID4g
PiBEb2VzIGl0IG1lYW4gdGhhdCBmb3Igc29tZSBoYXJkd2FyZXMgdGhhdCBoYXMgc21fc3VwcG9y
dGVkKCk9PXRydWUsDQo+IGl0J2xsDQo+ID4gPiBoYXZlICBTQyBiaXQgY2xlYXJlZCBpbiBlY2Fw
IHJlZ2lzdGVyPyAgVGhhdCBzb3VuZHMgb2RkLCBhbmQgbm90IHN1cmUgd2h5Lg0KPiBNYXliZQ0K
PiA+ID4gWWkgTGl1IG9yIFlpIFN1biBtYXkga25vdz8NCj4gPg0KPiA+IHNjYWxhYmxlIG1vZGUg
aGFzIG5vIGRlcGVuZGVuY3kgb24gU0MsIHNvIGl0J3MgcG9zc2libGUuDQo+IA0KPiBJIHNlZTsg
dGhhbmtzLCBZaS4NCj4gDQo+IEhvd2V2ZXIgdGhlbiBPVE9IIEkgZG9uJ3QgdW5kZXJzdGFuZCBh
Ym92ZSBjb21tZW50DQo+IA0KPiAgICJJZiB0aGUgaGFyZHdhcmUgaXMgb3BlcmF0aW5nIGluIHRo
ZSBzY2FsYWJsZSBtb2RlLCB0aGUgc25vb3BpbmcgY29udHJvbCBpcw0KPiAgICBhbHdheXMgc3Vw
cG9ydGVkIHNpbmNlLi4uICINCj4gDQo+IEJlY2F1c2UgdGhlIGN1cnJlbnQgcWVtdSB2dC1kIGVt
dWxhdGlvbiBzaG91bGQgZmFsbCBpbnRvIHRoZSBjYXNlIHRoYXQgWWkNCj4gbWVudGlvbmVkIC0g
d2Ugc3VwcG9ydCBpbml0aWFsIHNjYWxhYmxlIG1vZGUgYnV0IG5vIFNDIHlldC4uDQoNCmNoYXB0
ZXIgMy45IG9mIDMuMiBzcGVjIHNheXMgYmVsb3cuDQoNCuKAnElmIHRoZSByZW1hcHBpbmcgaGFy
ZHdhcmUgaXMgc2V0dXAgaW4gc2NhbGFibGUtbW9kZSAoUlRBRERSX1JFRy5UVE09MDFiKQ0KYW5k
IHRoZSBQYWdlIFNub29wIChQR1NOUCkgZmllbGQgaW4gUEFTSUQtdGFibGUgZW50cnkgaXMgU2V0
LCBhY2Nlc3MgdG8gdGhlDQpmaW5hbCBwYWdlIGlzIHNub29wZWQu4oCdDQoNCkl0IG1lYW5zIHRo
ZSBQR1NOUCBmaWVsZCBpcyBhdmFpbGFibGUgdW5kZXIgc2NhbGFibGUgbW9kZS4gQW5kIHNwZWMg
YWxzbw0Kc2F5cyBiZWxvdyBpbiBjaGFwdGVyIDk2LiBvZiAzLjIgc3BlYy4NCg0KIlJlcXVlc3Rz
IHNub29wIHByb2Nlc3NvciBjYWNoZXMgaXJyZXNwZWN0aXZlIG9mLCBvdGhlciBhdHRyaWJ1dGVz
IGluIHRoZQ0KcmVxdWVzdCBvciBvdGhlciBmaWVsZHMgaW4gcGFnaW5nIHN0cnVjdHVyZSBlbnRy
aWVzIHVzZWQgdG8gdHJhbnNsYXRlIHRoZQ0KcmVxdWVzdC4iDQoNCkl0IG1lYW5zIHRoZSBQR1NO
UCBmaWVsZCBvZiBQQVNJRCB0YWJsZSBlbnRyeSBpcyB0aGUgZmlyc3QgY2xhc3MgY29udHJvbA0K
b2YgdGhlIHNub29wIGJlaGF2aW91ci4gQWxzbyBpdCBtZWFucyB0aGUgc2NhbGFibGUgbW9kZSBo
YXMgdGhlIHNub29wDQpjb250cm9sIGJ5IGRlZmF1bHQuIF5fXi4gU28gdGhlIGNvbW1lbnQgaW4g
dGhlIGFib3ZlIGNvbW1pdCBpcyBjb3JyZWN0DQpzaW5jZSB0aGUgcG9saWN5IG9mIGludGVsIGlv
bW11IGRyaXZlciBpcyBhbHdheXMgc2V0dGluZyB0aGUgUEdTTlAgYml0Lg0KQnV0IHNwZWMgaXMg
bm90IHNvIGNsZWFyLiBXaWxsIHJlYWNoIG91dCB0byBtYWtlIGl0IG1vcmUgY2xlYXJlciBpbiB0
aGUNCnNwZWMuIHRoYW5rcyBmb3IgY2F0Y2hpbmcgaXQuIDotKQ0KDQpSZWdhcmRzLA0KWWkgTGl1
DQoNCg==

