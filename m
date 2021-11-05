Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C7445F70
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 06:32:37 +0100 (CET)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mirq8-0000tj-Ah
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 01:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mirnB-00008j-UE
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 01:29:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:35887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mirn8-0007fm-LB
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 01:29:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="232096528"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="232096528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 22:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="729568969"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2021 22:29:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 4 Nov 2021 22:29:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 4 Nov 2021 22:29:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 4 Nov 2021 22:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXExZccp5tPRb6W+ikwe4ANp2vzT/dqRL/GOeHD0z46Rw/bwEiSdIUw8XdDAYRXtrrpabYo8Hs0E63ZAJaJ16AxdQZ3khb5X2eU6z1x/+r8AmUnmlYfZOSff+x/xi+2YC5iLYy9gDhl5OMmbMjSjrzo/dKuFZMss2hM4+SJDwgliN1CXvWH0yxo5H6rZTkqdUCzkJYQgpagbXMly0aXt1XQG5Qf5J+BJC9/VBwnEkOmNcT2qCSoaVxPOLyt1lO4cCmlNwC1hXDdUSy5gWr6nMEaC1KMi7yZt3kObEGCS5wgIPcqrGcB28IXBfOAi9fbs4qjclY+62Dva/VbdBE6Qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4GaMVQLHc0Sof1LOhsFWIR1eVLRjRa8EjhkfC3keig=;
 b=LIYoBv5fFKGBUPE7y3W32uQUCt9kcsx9Obusbp6AW6KK/UnaPS8Y6tBNhAXhTjrIn+ABZ10JWd93mXvFyv2lPc1SYPHyKbKZC8Y2t6GTGuRxj+jrfIJzmAmeorgp7emztSsyzTWSI1VSJ2WR3Kq2TPKQUssJcxk61XnmyDIx47gcnnaoY01MdKBmmEgKvJ+LGoK4Qk79hAq/H2u7mGblSjjol0vA2r3VUmr/X48hh50lw42OMmYUBJiUHpkkYGFcHPHFYPT1Vo+Ib452gMwKDYps9SVsgrD3uxyExvNLjnzVOAD0a7g8HhPwOLgicKZvgXz9wB0l4U1B6AS95g2H2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4GaMVQLHc0Sof1LOhsFWIR1eVLRjRa8EjhkfC3keig=;
 b=GJMk3rN0dQilU/w2OsEq1u7i78FSh6UoSgct5Yev4rSSxgo/+5kzcH6aOXAb3lKOsz5wB/r4N5R3cplUb/SC6UFu7NfoaFiEZijkK5Kvg0efSrEcWNOEbUsRZdmvhq1i0hAZAn9wCD/PNUJIgBDBVgLukOuWwOIJu7DXhDYNXrQ=
Received: from DM5PR11MB0027.namprd11.prod.outlook.com (2603:10b6:4:6b::33) by
 DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17; Fri, 5 Nov 2021 05:29:25 +0000
Received: from DM5PR11MB0027.namprd11.prod.outlook.com
 ([fe80::3958:5a94:4db3:a878]) by DM5PR11MB0027.namprd11.prod.outlook.com
 ([fe80::3958:5a94:4db3:a878%7]) with mapi id 15.20.4649.021; Fri, 5 Nov 2021
 05:29:25 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISAgAAMYICAABYMEA==
Date: Fri, 5 Nov 2021 05:29:24 +0000
Message-ID: <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
In-Reply-To: <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c51a360-fc99-4193-2281-08d9a01d3ace
x-ms-traffictypediagnostic: DM5PR1101MB2105:
x-microsoft-antispam-prvs: <DM5PR1101MB2105291F6E1143FE68674A5B9B8E9@DM5PR1101MB2105.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdnQgWFwPr6q/Kp91vvi3e/y4faZPeq0ymB5MrRvJnm1q+kQk6LJLBEup3xMonkb4MJ4Mw8EJgYBiXexXOb2utQKpKF/IWES/c3Jieje38MOFlyOu7kktyqXmoiELBSNhOY4N3iSczXe+M2Bpj9+gIoj+2ER0k5XcbVAw1ln+M8dLdwCqublyWQZGpXQxRUR7eJJA93iIZvabx9AZgB5klXopwkVpxUA4A6Il2r7X+a4Fr8OkpAkMWplkVFD9IHklbOZfcbqoRDqG8h+WBclap0f4YMDN7OeK3QAle+7udYDig9sgc45ESuTVMiBufVbROEcd+csodKZaFssXne52er+iUcWT1U1cd6gE2jM3nsNwvRLpyBb3o5pQfidtgbYJUeREYaWX9prWE4+ookL9s+noQl1nvxOK8Kn6Yg+H/PjXf4P8esMvNwCXJBr0Bp1N/6j03S6du56KuridYXOJZ75wF2fVLUcQFnDYMnWksd11SBlgIksNsNPJegRaY2SOxEWwvj2Xut78ELMfv8abLicKwd9I3GciHuWUExDbwY0DB6Wgle+FMVW3MpJ3r2xa2NeKnMBFb0yShBwK/bu2weTQMVgLH/OepBQjMPyNtUkPOPk2fovE9feFdpo0YIxbGrm+B0OcNnPAu26IAakk40J7trZp02JCVMEquLYtTBUb7G03xHUyYnVOqJ1okku5/TFfMqVBzAr+yziGM2MpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB0027.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(66556008)(66446008)(66946007)(316002)(66476007)(9686003)(76116006)(8936002)(54906003)(52536014)(6916009)(33656002)(55016002)(2906002)(4326008)(83380400001)(26005)(53546011)(7696005)(71200400001)(86362001)(38070700005)(8676002)(6506007)(5660300002)(122000001)(38100700002)(82960400001)(186003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmpaT3RUNW93YVg5aEhLRlBIT0JvNnF6ZmJFd0RaSEh2dHR3N3h2ZHd4a055?=
 =?utf-8?B?aGtUaXkvNFNnSUdrc1ZBL3RoY3BtNXFZK3pZeC9zOUc4WjhQbzk1MjNNaDJm?=
 =?utf-8?B?WHQvZjdLN3I3UTJIajQ0N3RMMmtITEFpRmVpVEJodjZYSjkzN0pMbmlJMHE1?=
 =?utf-8?B?ZkNIbkI2T2R3WHFWVWFqNWhIZExCbXVNWHIyTkpnUTRqcmdOa3lwUUxRQ2Yv?=
 =?utf-8?B?R1VXMnRNZ2VqTTVqMThEQ2xJTUNLTjdGaW5XZ0NSMmc4eU1ibnJhc0xXRFpW?=
 =?utf-8?B?MkRpVUJxOWVYM3RHMTJ4KzZiVEhkWHh6bU95Y2VkWUtCVFp5ZlcyWGY0MTFl?=
 =?utf-8?B?b1JNcDRMZ1BNdlZ3MjdZUVkydmtIaU90dlp0Ry9USXNONkhjcEZ5aDBaMW9p?=
 =?utf-8?B?bmpvZ3JvWUtnWVhxQWV0R3FYTk0xQ1VMSmJnekQvZnhIYjFYTExzWXRBQ3VS?=
 =?utf-8?B?ZUQ2ODdsSXZSc0tYazNvOEpFd1ZvSkVZRDZseHhzeGFvNXZHSDFrUnFiWTlw?=
 =?utf-8?B?UmE0UWY5Y25KTmFocXBiMlVtM25NMytBMithclhVanYzN1pyVDMza1l2YWUy?=
 =?utf-8?B?Rk12dzBDN1Z5WWQ5OXZCZFEzcmF2STFrUVQwc3lMSE9ZS2dtMTBMam8wOVdv?=
 =?utf-8?B?elZjeXFyanZqejMxUVRUYzR5WHl2a0Z5cUtNNStGVlBoemdsdVFqdVFWTHFN?=
 =?utf-8?B?T2NCQVk4QTV5M3k0OEFwcjlaaC9JMFBwWjlSUitjTHFRU2IwSWtKTk1ZVmtE?=
 =?utf-8?B?Si9IYzEwOXpEZTJ3NGFlMVJUK1ZRM1BmdTNMdU9hc2JIU3JXcEg1ZWo0VDdv?=
 =?utf-8?B?MFIrb3RkcnlOcXU1dEt5cHdTdm44aUhzM2xvdU1QMktqK3kxUHhNRXRlZnMw?=
 =?utf-8?B?VEFwOUt1MVljZ3ZocnlhME5EejhtQ0RaN2lZYm10Z3BpQmZPemtxMjR0Tngx?=
 =?utf-8?B?RFo5RDVpZC9ZTjFCZU4xYk5JOGlPekMraSt2b0ZBWnNJTE9LMDRSRklTcDVF?=
 =?utf-8?B?VXg5NE1VOW53aUhUdWd0ZnptUUdtRGNJcUg3OG80aEtSS0VFNXNQS0pXRWZJ?=
 =?utf-8?B?U1JOb3Z0bEpxL1c4b3h4T3J6Z242M0FIQnhrWFE5d2FLdk5oc291MmxudEp2?=
 =?utf-8?B?UGlFNStqQ0huTkJsQWY1QVA2SnJ4UFRvK3cyOXdFOEc5dzlKTmt3MkpDNm0x?=
 =?utf-8?B?Vyt1Wi9VWGVXVUx0alV6dDdkL0RQNXF2VWtRR3U1cTdueGFjREVvOTA5czNr?=
 =?utf-8?B?djlDMW9wdnhRNWkrM3ZFNGF1YmlUczcraE41VGNMYzRPR2dsQjRyazFOL2Ux?=
 =?utf-8?B?NW00clVKN1RjV3JoaGRUb204K0FYaWYyRlJiYWNSdVlHanpJY2N3eUxFWmFu?=
 =?utf-8?B?bXdnSVliYUorRk5wRXJCa3BCWFZBNlhIRENLblNOK1BpVW1NQjhmNVh5MUZZ?=
 =?utf-8?B?blVGZzkzeVJGVDFITVhOa3F4c2g0NDYycG1Md0dyMGpRbkxGUEFnSVkwT01H?=
 =?utf-8?B?M3ZSZzVFMHE1bHVGL2lPS2hlTVl5R2FkVGcvUDRYb1U5ZiszaGU2ZWlNVWw1?=
 =?utf-8?B?WUh4RUhRUXd3NzhyY1kyMHowdFpKdElpME1iNzI1cHM1YUo2SGVpZkw0Q0ln?=
 =?utf-8?B?c0krVmZjWExLSXRKR2NUZWVkRjJyK01JUDhta01IVzFlbGpiRllIN1NrakJZ?=
 =?utf-8?B?dVp3aU9SVDN3WlE2b2pkVHJxSmpRQWxmWWhFd0c3cXQ0MHJjQXVlNzNZcnhk?=
 =?utf-8?B?cURLN1NkTjRZZjluMlVCWWM3clVGeUx6Z0F2NGNjbmN0SGkxWk9pVjU1cmRR?=
 =?utf-8?B?WlAwSk4xSnZnSjBoRStRNWUxcFlkcm8yWVJnYmdNbGl3N0dxaXZqVkFzZDhN?=
 =?utf-8?B?WnkrZ25VR2pvY2xFYlU1TXVuK3FicTZKcTRLaHA3OXFjMkwyQi8yTjZSL2VN?=
 =?utf-8?B?ci9ueEo3YVFCMHBHbkRza1lGeVRib1YrVTNIZ3c4RjdQc1R1MC8xRmFRcGU5?=
 =?utf-8?B?RFJ1M0d5Vnp6MW5qcGFhVWtsMWtOYkNaWjlPV0FZamhYQi9hRnVEQUhIeVhK?=
 =?utf-8?B?aFFMUzNOWEQ2YVFJS0hic204OUVrVmlvclZNWWxab1J4UXBUcnNpb2dzZnRF?=
 =?utf-8?B?RFRyK08wMHpkQVN1RWR5VkFsbmV5aEFnQk9sODlqbG5DY2YzVFQxayt2d1RT?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c51a360-fc99-4193-2281-08d9a01d3ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 05:29:24.8840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9mtUHMevf9EfsWp9CR5Kyw66YxB67y1r8nXGkllg3ujEzCBipNEyUjdigH9z6h0mHhLf1lKEZyoA5CACUMIzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIxIDEyOjAz
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBNYXJr
dXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVy
IHByb3RvY29sIGZvciBmaWx0ZXItDQo+IG1pcnJvci9yZWRpcmVjdG9yDQo+IA0KPiBPbiBGcmks
IE5vdiA1LCAyMDIxIGF0IDExOjI3IEFNIFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+IFNl
bnQ6IEZyaWRheSwgTm92ZW1iZXIgNSwgMjAyMSAxMToxNyBBTQ0KPiA+ID4gVG86IFpoYW5nLCBD
aGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47IE1hcmt1cyBBcm1icnVzdGVyDQo+ID4gPiA8YXJt
YnJ1QHJlZGhhdC5jb20+DQo+ID4gPiBDYzogcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zz47IExpIFpoaWppYW4NCj4gPiA+IDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNmZXIg
cHJvdG9jb2wNCj4gPiA+IGZvciBmaWx0ZXItIG1pcnJvci9yZWRpcmVjdG9yDQo+ID4gPg0KPiA+
ID4NCj4gPiA+IOWcqCAyMDIxLzExLzQg5LiL5Y2IMTozNywgWmhhbmcsIENoZW4g5YaZ6YGTOg0K
PiA+ID4gPj4+Pj4NCj4gPiA+ID4+Pj4+IEkgd29uZGVyIGlmIHdlIG5lZWQgdG8gaW50cm9kdWNl
IG5ldyBwYXJhbWV0ZXIsIGUuZw0KPiA+ID4gPj4+Pj4gZm9yY2Vfdm5ldF9oZHIgaGVyZSwgdGhl
biB3ZSBjYW4gYWx3YXlzIHNlbmQgdm5ldF9oZHIgd2hlbiBpdA0KPiBpcyBlbmFibGVkLg0KPiA+
ID4gPj4+Pj4NCj4gPiA+ID4+Pj4+IE90aGVyd2lzZSB0aGUgInZuZXRfaGRyX3N1cHBvcnQiIHNl
ZW1zIG1lYW5pbmdsZXNzLg0KPiA+ID4gPj4+PiBZZXMsIEN1cnJlbnQgInZuZXRfaGRyX3N1cHBv
cnQiICBkZWZhdWx0IGVuYWJsZWQsIGFuZA0KPiA+ID4gPj4+PiB2bmV0X2hkcl9sZW4NCj4gPiA+
ID4+PiBhbHJlYWR5IGZvcmNlZCBmcm9tIGF0dGFjaGVkIG5mLT5uZXRkZXYuDQo+ID4gPiA+Pj4+
IE1heWJlIHdlIGNhbiBpbnRyb2R1Y2UgYSBuZXcgcGFyYW1ldGVyICJmb3JjZV9ub192bmV0X2hk
ciINCj4gaGVyZQ0KPiA+ID4gdG8NCj4gPiA+ID4+PiBtYWtlIHRoZSB2bmV0X2hkcl9sZW4gYWx3
YXlzIGtlZXAgMC4NCj4gPiA+ID4+Pj4gSWYgeW91IHRoaW5rIE9LLCBJIHdpbGwgdXBkYXRlIGl0
IGluIG5leHQgdmVyc2lvbi4NCj4gPiA+ID4+PiBMZXQgbWUgZXhwbGFpbiwgaWYgSSB3YXMgbm90
IHdyb25nOg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gInZuZXRfaGRyX3N1cHBvcnQiIG1lYW5zIHdo
ZXRoZXIgb3Igbm90IHRvIHNlbmQgdm5ldCBoZWFkZXINCj4gbGVuZ3RoLg0KPiA+ID4gPj4+IElm
IHZuZXRfaGRyX3N1cHBvcnQ9ZmFsc2UsIHdlIHdvbid0IHNlbmQgdGhlIHZuZXQgaGVhZGVyLiBU
aGlzDQo+ID4gPiA+Pj4gbG9va3MgdGhlIHNhbWUgYXMgeW91ICJmb3JjZV9ub192ZW50X2hkciIg
YWJvdmUuDQo+ID4gPiA+PiBZZXMsIEl0IHdhcy4gIEJ1dCB0aGlzIHNlcmllcyBjaGFuZ2VkIGl0
Lg0KPiA+ID4gPj4gQ3VycmVudCAidm5ldF9oZHJfc3VwcG9ydCIgY2FuJ3QgZGVjaWRlIHdoZXRo
ZXIgc2VuZCB2bmV0IGhlYWRlcg0KPiA+ID4gPj4gbGVuZ3RoLCB3ZSBhbHdheXMgc2VuZCBpdCBl
dmVuIDAuDQo+ID4gPiA+PiBJdCB3aWxsIGF2b2lkIHNlbmRlci9yZWNlaXZlciB0cmFuc2ZlciBw
cm90b2NvbCBwYXJzZSBpc3N1ZXM6DQo+ID4gPiA+PiBXaGVuIHNlbmRlciBkYXRhIHdpdGggdGhl
IHZuZXQgaGVhZGVyIGxlbmd0aCwgYnV0IHJlY2VpdmVyIGNhbid0DQo+ID4gPiA+PiBlbmFibGUg
dGhlICJ2bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPiA+ID4+IEZpbHRlcnMgd2lsbCBhdXRvIHNldHVw
IHZuZXRfaGRyX2xlbiBhcyBsb2NhbCBuZi0+bmV0ZGV2IGFuZA0KPiA+ID4gPj4gZm91bmQgdGhl
IGlzc3VlIHdoZW4gZ2V0IGRpZmZlcmVudCB2bmV0X2hkcl9sZW4gZnJvbSBvdGhlciBmaWx0ZXJz
Lg0KPiA+ID4gPj4NCj4gPiA+ID4+PiBBbmQgbXkgImZvcmNlX3ZuZXRfaGRyIiBzZWVtcyBkdXBs
aWNhdGVkIHdpdGgNCj4gPiA+IHZuZXRfaGRyX3N1cHBvcnQ9dHJ1ZS4NCj4gPiA+ID4+PiBTbyBp
dCBsb29rcyB0byBtZSB3ZSBjYW4gbGVhdmUgdGhlIG1pcnJvciBjb2RlIGFzIGlzIGFuZCBqdXN0
DQo+ID4gPiA+Pj4gY2hhbmdlIHRoZSBjb21wYXJlPyAoZGVwZW5kcyBvbiB0aGUgbWdtdCB0byBz
ZXQgYSBjb3JyZWN0DQo+ID4gPiA+Pj4gdm5ldF9oZHJfc3VwcG9ydCkNCj4gPiA+ID4+IE9LLCBJ
IHdpbGwga2VlcCB0aGUNCj4gPiA+ID4+IGZpbHRlci1taXJyb3IvZmlsdGVyLXJlZGlyZWN0b3Iv
ZmlsdGVyLXJld3JpdGVyDQo+ID4gPiA+PiBzYW1lIGFzIHRoaXMgdmVyc2lvbi4NCj4gPiA+ID4+
IEZvciB0aGUgY29sby1jb21wYXJlIG1vZHVsZSwgSXQgd2lsbCBnZXQgcHJpbWFyeSBub2RlJ3Mg
ZmlsdGVyDQo+ID4gPiA+PiBkYXRhJ3Mgdm5ldF9oZHJfbGVuIGFzIHRoZSBsb2NhbCB2YWx1ZSwg
QW5kIGNvbXBhcmUgd2l0aA0KPiA+ID4gPj4gc2Vjb25kYXJ5IG5vZGUncywgYmVjYXVzZSBpdCBp
cyBub3QgYXR0YWNoZWQgYW55IG5mLT5uZXRkZXYuDQo+ID4gPiA+PiBTbywgaXQgbG9va3MgY29t
cGFyZSBtb2R1bGUncyAidm5ldF9oZHJfc3VwcG9ydCIgYmVlbiBhdXRvDQo+ID4gPiA+PiBjb25m
aWd1cmF0aW9uIGZyb20gdGhlIGZpbHRlciB0cmFuc3BvcnQgcHJvdG9jb2wuDQo+ID4gPiA+PiBJ
ZiB0aGUgImZvcmNlX3ZuZXRfaGRyIiBtZWFucyBoYXJkIGNvZGUgYSBjb21wYXJlJ3MgbG9jYWwN
Cj4gPiA+ID4+IHZuZXRfaGRyX2xlbiByYXRoZXIgdGhhbiBjb21lIGZyb20gaW5wdXQgZmlsdGVy
J3MgZGF0YT8NCj4gPiA+ID4+DQo+ID4gPiA+PiBUaGFua3MNCj4gPiA+ID4+IENoZW4NCj4gPiA+
ID4+DQo+ID4gPiA+IEhpIEphc29uL01hcmt1cywNCj4gPiA+ID4NCj4gPiA+ID4gUmV0aGluayBh
Ym91dCBpdCwgSG93IGFib3V0IGtlZXAgdGhlIG9yaWdpbmFsICJ2bmV0X2hkcl9zdXBwb3J0Ig0K
PiA+ID4gPiBmdW5jdGlvbiwgQW5kIGFkZCBhIG5ldyBvcHRpb25hbCBwYXJhbWV0ZXIgImF1dG9f
dm5ldF9oZHIiIGZvcg0KPiA+ID4gZmlsdGVycy9jb21wYXJlPw0KPiA+ID4NCj4gPiA+DQo+ID4g
PiBJdCdzIGEgd2F5IGJ1dCByZXRoaW5rIG9mIHRoZSB3aG9sZSB0aGluZy4gSSB3b25kZXIgd2hh
dCBpZiB3ZSBqdXN0DQo+ID4gPiBlbmFibGUgInZuZXRfaGRyX3N1cHBvcnQiIGJ5IGRlZmF1bHQg
Zm9yIGZpbHRlciBhbmQgY29sby1jb21wYXJlPw0KPiA+DQo+ID4gSXQncyB3b3JrcyBieSBkZWZh
dWx0IGZvciB1c2VyIHVzZSAtZGV2aWNlIHZpcnRpby1uZXQtcGNpIGFuZCBlMTAwMC4uLg0KPiA+
IEJ1dCBpdCBjYW4ndCByZXNvbHZlIHRoaXMgc2VyaWVzIG1vdGl2YXRpb24sIGhvdyB0byBmaXgv
Y2hlY2sgdXNlcg0KPiBjb25maWd1cmF0aW9uIGlzc3VlOg0KPiA+IEZvciBleGFtcGxlIHVzZXIg
ZW5hYmxlICIgdm5ldF9oZHJfc3VwcG9ydCAiIGZpbHRlci1taXJyb3IgYW5kIGRpc2FibGUNCj4g
PiAiIHZuZXRfaGRyX3N1cHBvcnQiIGZpbHRlci1yZWRpcmVjdG9yIEFuZCBjb25uZWN0IGJvdGgg
ZmlsdGVyIG1vZHVsZXMgYnkNCj4gY2hhcmRldiBzb2NrZXQuDQo+ID4gSW4gdGhpcyBjYXNlIGd1
ZXN0IHdpbGwgZ2V0IHdyb25nIG5ldHdvcmsgd29ya2xvYWQgYW5kIGZpbHRlcnMgZGlkbuKAmXQN
Cj4gPiBwZXJjZWl2ZSBhbnkgYWJub3JtYWxpdGllcywgYnV0IGluIGZhY3QsIHRoZSB3aG9sZSBz
eXN0ZW0gaXMgbm8gbG9uZ2VyDQo+IHdvcmtpbmcuDQo+ID4gVGhpcyBzZXJpZXMgd2lsbCByZXBv
cnQgZXJyb3IgYW5kIHRyeSB0byBjb3JyZWN0IGl0Lg0KPiANCj4gVGhlIHByb2JsZW0gaXMgaG93
ICJhdXRvX3ZuZXRfaGRyIiBoZWxwIGluIHRoaXMgY2FzZS4gSXQncyBhIG5ldyBwYXJhbWV0ZXIN
Cj4gd2hpY2ggbWF5IGxlYWQgdG8gbW9yZSB3cm9uZyBjb25maWd1cmF0aW9uPw0KDQpObywgdGhl
ICJhdXRvX3ZuZXRfaGRyIiB3aWxsIGZpeCBtb3N0IHRoZSB3cm9uZyBjb25maWd1cmF0aW9uIGlz
c3VlcyBhcyAidm5ldF9oZHJfc3VwcG9ydCIgY29ycmVjdCBzZXR0aW5nLg0KV2hlbiB3ZSBlbmFi
bGUgdGhlICJhdXRvX3ZuZXRfaGRyIiwgdGhlIG9yaWdpbmFsICJ2bmV0X2hkcl9zdXBwb3J0IiB3
aWxsIG5vIGVmZmVjdC4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRoYW5rcw0KPiANCj4gPg0K
PiA+IFRoYW5rcw0KPiA+IENoZW4NCj4gPg0KPiA+ID4NCj4gPiA+IFRoYW5rcw0KPiA+ID4NCj4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiBDaGVuDQo+ID4gPiA+DQo+ID4g
PiA+DQo+ID4gPiA+Pj4gVGhhbmtzDQo+ID4gPiA+Pj4NCj4gPiA+ID4+Pj4gVGhhbmtzDQo+ID4g
PiA+Pj4+IENoZW4NCj4gPiA+ID4+Pj4NCj4gPiA+ID4+Pj4+IFRoYW5rcw0KPiA+ID4gPj4+Pj4N
Cj4gPiA+ID4+Pj4+DQo+ID4NCg0K

