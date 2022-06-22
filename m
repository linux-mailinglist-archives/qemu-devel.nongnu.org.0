Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE55544DE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:29:46 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wgC-00089p-SR
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3wY1-0007qA-Df
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:21:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3wXx-0007r3-LY
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655889673; x=1687425673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zhy14xIEC3pFzTpfuz+M/Nz/ovoiid/MUhhsDaxIfHo=;
 b=QaF4gtUDw3KnFQDJvxqNNpmqCisWlzAUJhOm1oys1NsFwVdtia/8dkpd
 CUqnx7PMVfL5a2gitE88uDlkN2YM2SIinmiDOrKmjwwjwDFdsNBoqWJWw
 CwCh2Sfk+Cokhpzh17Zk2zkt2gcBo+aXHH9+mngqx1B7TMyNYrudZ1kiC
 EbP6tSqnMCkH8XJ3Y0jZQHGhX9awmkpRFkvpAC8tGQJCNLuKYJreFM/VH
 ViIXCmYyqVTKVY+rnoRuMEQ/rbqPnxXiDgUZddmcTn3gLx+iCgUC7PW7/
 T+sC3Ae1dSkUXAf+jJZ4WKyuBs11mTFsz6N47QYcsJ3A1fndE2HHrszqz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281440065"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281440065"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 02:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="690403254"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2022 02:21:09 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 02:21:08 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 02:21:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 02:21:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 02:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp0KzRxOTKTKBh8TSUembblW1IYwEAbkBhVSs08vgb3VRltlVFyIESIjYVnYTj9hJDslJQ0QbJmu6T/0hcD7Ozq4rS1B0TrRkkWVaUlN9P4sqfe4lqNIpHrj8MiSXo+2brXjhfCw8IdCVsjmbIV/j1Xwxh/wb4o5GoUzDrMRdfEJxC3QopOfGf5DtbLPN+SpdpJCHwQJ92/InO/v3VVyDIJcPLl2ubGy/Qszk6Kmh57gZf+MNisLnbQvtenlscBnN37lFTTqz0ncaGJkNuE4bYLwVlPlWLVPj+Nes1HdDdFj5PUehcg5kg4JQpBasSiL9pxo2DdEAy5A9ti5FNwz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhy14xIEC3pFzTpfuz+M/Nz/ovoiid/MUhhsDaxIfHo=;
 b=k/tS2icoRHj5bXBsCliM7nN+OsHChoDmfr8WbghMA5Ru9zyAKVqhGDRUrO3zmKs+tMqK/lkt1iLqeYXtLkhkJynAmyIx8xTDA3aWApYjvY+e9FfiYDI9Rftn6qgPlNO/m3AwtwlfBXJY0M6A9e3O/ox9b4ugQAFPQQUVu8UkhLRquk3CWY+jTtZ1cagnDi4ly1dTvqJKsr+3kafV672CYlhJ/sVJfzwh1af1K+ozDKJANouoNDufCX3scQJ2PUf9kgtOP5sz3iPA5fihSczsrBwVVbQac8+c3ByvJDFcXSdgVEBKE0MGYbXJOvrdWUd6DlBDC7bd+Xzt5x1j118TRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BL1PR11MB5399.namprd11.prod.outlook.com (2603:10b6:208:318::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 09:21:05 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:21:05 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-dev
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost
 <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, "Andrew
 Melnychenko" <andrew@daynix.com>
Subject: RE: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Topic: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Index: AQHYgh8EJk95aDHPrke2v71SXRLplK1TPbyAgASPuXCAACkNgIAACbmAgAABQNCAAA7PgIAACtVAgAAEAYCAAvDvsA==
Date: Wed, 22 Jun 2022 09:21:05 +0000
Message-ID: <MWHPR11MB00311006625A0F7F9D2FF4379BB29@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
 <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <c4835276-c0fb-a500-8f8b-326c269ba9f9@redhat.com>
 <MWHPR11MB00316977F6D2A6EBE8151A1B9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrBN0WRjqeWCWPzJ@redhat.com>
In-Reply-To: <YrBN0WRjqeWCWPzJ@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3c76c7f-5af9-4a54-be65-08da543088d9
x-ms-traffictypediagnostic: BL1PR11MB5399:EE_
x-microsoft-antispam-prvs: <BL1PR11MB53992089C732C1A31B7E2EE19BB29@BL1PR11MB5399.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9JSjktf8RQapWgzLuXmm7V+Qouk83+LZ8iDf1Hi5X3cAkFfQc6t6KPfD3k8JZAFpRhtWqIfG20LYLcyp3CKbgd2pqFcEebNDXTX2QkluLQ4+ZHu9jW7u4w1cqB/q7fgW2govFG2HcDVx7gIXaTAyiBzT+TSGfzWcOR0lXNs+9TqkatLdMO436bSA34j6XdK+rVHbAz+i0udVmGjWe7014lA6CC8UI36FgREMIjFwRMLSck6xJIG2AlBwZt/QgZqR7VTB7Y/c2VgSa2DxajBHF3tI5xxS9Iv450JaCvNIbAunsAgZ+HS0/0PdP34J/jxKj2GlbwZqMth8DlD18ZfaMopb87FoFvL3sWO7V6ApDlTN1gtbgXXQULI4mFLVdZO7hcxatyAUt5VND3dBySn0c53DGzgnoDXDAEVSzvSWHmpN/I6fXZRf3/8aAseV2GRRV+Ob2D+MVzu+mawAw9ZABlloyjMDExTojXs+5DRPQ/kBWmRuvUc+YVAmzxbT9mamlr/3t+xUYQRPJsXkR0HvMEf+fxOZkHppa1SUTEkVxl5E5amdiojzlB6veAcM1wxgbTY/KXTrfyhZMj6TgBRboHQjJb1OEfRPRtBIgmh/FLakuIRrRKaIbqEw9wakbJU2kQGsy+iNgdD4dJW412Rz179LXwMRxufhRcXXSD4VuVDkAHj6oYFcsQO8Jy3dhEQ3h2/WJRiLRMV/Q086DPkMVMFA/W66c+S/I/WLoJZ0L685Uvgye7mj2WBLJnInf0+5r7LGQp1s7M/bRCN1+3kv+PHh2BlCMW5k0mvtM1F/JwQZKVl1Wt4jJQVA390ZWX65OZX4OHtBizv9N2U+WfgsPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(396003)(366004)(376002)(38070700005)(6916009)(7416002)(54906003)(316002)(9686003)(66574015)(41300700001)(26005)(53546011)(82960400001)(86362001)(71200400001)(122000001)(76116006)(33656002)(8936002)(38100700002)(55016003)(66946007)(966005)(52536014)(478600001)(5660300002)(186003)(83380400001)(7696005)(8676002)(4326008)(2906002)(6506007)(66476007)(66556008)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlNmYllmcUNmbHBINTZBWUxKM3dLaENJUTdGTmduTlRxcHJyR25EdS9CQXl6?=
 =?utf-8?B?Ny9qUDBrNTVPRHNzL3h6M1lualpDWTFwbHdlNUpoV1cra1pyc0w0RVNuR3Aw?=
 =?utf-8?B?N3JuYy8rTnVITVptOCtvUmlHNTNwbmp2SE12anJaR2lqbEpYd0pjOXV3TGI4?=
 =?utf-8?B?WnovNnAxVm5aS3lnZXU2Z2Q0VjcvTnNoUXExcHBBa2tqYzRKcWU4b3NQTzZV?=
 =?utf-8?B?V0h3cDNhQTJ3RmFtb1kvN0hycWZrdURMaFh5b0ZGL0p6N29VeUVyUFpJVWF0?=
 =?utf-8?B?SFhscGVGUGFSMCt0aEMwaExyNFQ5MGdzd3F1dDB0RlBQczRQWUZLZktTd0hx?=
 =?utf-8?B?Z2E3Y05zbkY3MzBLcXF4QVRPUmYzQ2RHOXV3cnphM3duaUZiOFFKUW5XLzZi?=
 =?utf-8?B?c04xYW93ZHplc3VjNkIyQTF5WkR3QXk2UTN0L2prUDRZSTFVTUVCMDJoZlNH?=
 =?utf-8?B?QVd0cDlyenBmL1FVRXdEWnFaQ0RjckZZMnBvb2d4Q0ZhYjIzb1VDcjc5OU1W?=
 =?utf-8?B?Nmt0WW5OZitnYndYUU9vWmR2cDBaMzlpbURqaGNCMFFZN2pvZEl5a0h4L0Nk?=
 =?utf-8?B?bUFFdStvUDhKVzhrckZISVJIY3MrY3o5RDNpYkt3MFJDM2ZLVGllcVJxbU5u?=
 =?utf-8?B?QVVDR0RudG91RUFqNXpzV0dRV0hzU1pzbnhneHNxbnJnRGFmWURTaU5ibzZ5?=
 =?utf-8?B?UE53dWIvWldYeC9CTzNFWVY5RjBQR0JySEtQRWtic2NWald5bUlSZ0l1TDFT?=
 =?utf-8?B?SEExSElvbWd2em9DVTZBZzR2UnJETlRITjMxbUhBS2Ryc24yQzkybUs5Mk4v?=
 =?utf-8?B?YnFDbTFGZWhVajRBQ1pvR3hDcGVnZkk0NWlMVXRYZ0hlMjJsYmgzb0hPbWxH?=
 =?utf-8?B?eERXMXo2QVhrTS9FYm1iVmhGcitxUDI0dkRqeEZ0dXNURmNRUXVsVklpWHc1?=
 =?utf-8?B?OWtUL3JiR1pYTUpZYlpmVWlLK0VDYzd1Q2IvQmdOYzZQSFRoeFUrdTNOajdr?=
 =?utf-8?B?SU00OWQyK01zWDZ4UVZNaEdjekxla1NjV1NKNnZ1WFZ1c25PWGlraElqVmJU?=
 =?utf-8?B?QTNUNnZPb05ZYkhtM2VnMXliSGVoaWJyMVQ3dEtidUJJZUoxOTJMYUxRemRu?=
 =?utf-8?B?WlNWTzEvZ2F3dlFMOEx6ZmsvbElFZHNzV3JrRXRaVWRZTkFrN3JuNUd3MzJv?=
 =?utf-8?B?dWtWc0FhaW9KbitvblFxRXk2RDRzU1NNZ2k2ZUU2Qit2L1ZCWlRUV1FReDRq?=
 =?utf-8?B?eXBac3phbml4RTd4bHluTzk0SnMwMEs4Q3JpQ2RMVitHOW5SNDM2Mk1ORC9H?=
 =?utf-8?B?blBzTnFkejZ6ZVZoRG1SVWxZUFBnRVFBQTVMQ3podzlVR2p1bW5ML0dybjhV?=
 =?utf-8?B?YWxXNlQxV2Z6YTVaVXRWNnVnWGNWVXdTUDFtZFdoSlJxSWE3QS9Fc0JRRWxC?=
 =?utf-8?B?T0tQbDJ4VitHVmhPaVk2Rk5FSmM4b251L0ptckVpS0tXaWpJUmNIZ3htMnBK?=
 =?utf-8?B?VUpNakFZY3NYU2w3OHM4K3RDK2JTZ2RoOUZBU0Y5ajI5anhWanBwZnhRb21t?=
 =?utf-8?B?RG5TS3gzQ0NLZ3F6RUJsT2JObXB6RElObVBrR1JIRmRFZVU2YWdOd3VlRmxQ?=
 =?utf-8?B?R1luTkVaNGlyZnpXY1lBaWdvTHJFVFBqWmcwZGdpb3U5a0Z4TmxQbG00QUtP?=
 =?utf-8?B?c1ZxNDdZd3RkVnhodXlvZGwyaTRweHFOVDMzeVhwbHVVNkRRcm5Dc3lUYmd2?=
 =?utf-8?B?aEJoVExoamxvMXZUY2tTWGZLTVhXUU5VTldNMXBzL2RFQ0w5b3FpbmhxQnFP?=
 =?utf-8?B?SDVNSWhDY1MveXd2NmFiZTlNNFA0Ly9aN0RkWkJKb2QvK0k2aWEvSWxXM2xN?=
 =?utf-8?B?RkoydG5RTityQmk4SldoNzQyZUZpVHpoYVpXK2ptY1l1TjJEc29XdE0zbGFp?=
 =?utf-8?B?ZjAwM0kwdytLZng5eEQwdzZoZlRZUWJxUTlCdEs4cnpxZCtBUUYzMWJJeTdy?=
 =?utf-8?B?Z2xnbGVBcWZPMnovV0htY1VXdWQxY3BpMTExeDZCV3B3NGc0V3h1V3Nkekls?=
 =?utf-8?B?eUZBa0VhM2F5cVlDK0tvTWVDd2ViNXN5OERIWTFGWXpIMnZkWGNPaEFXK3pK?=
 =?utf-8?B?amJoT0t5SHBpV3p1UWpKcTVNSjFEMVhQRXdRQjVQaVR3RHF2dTBPWm1uT0cr?=
 =?utf-8?B?Tk5PT2oxdTZyUk5SZXFRUVJKZEFHc29hYXZFM2pnc2ZOK1JmTEpodnYxNjNP?=
 =?utf-8?B?Q0ZmT2pXcExRU01Cb0RLVEpTSStBOTNweCtTbkVhZzJwUWtLUXYxeXFJallq?=
 =?utf-8?B?cjc2Y253dklLRkQvT1FicllsbmVnRVpVWEV6Unp1QnZmNE5iRnVJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c76c7f-5af9-4a54-be65-08da543088d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 09:21:05.7012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6oyod0qMIX4trv3T7Zo+Zt8qOyGxi9wNQ97YpQrvD5MmDFlki8I2sQVySsEkzbsxs2BUS/6aOWjUq159t1cBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5399
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFAuIEJlcnJh
bmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDIwLCAyMDIy
IDY6MzcgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgSmFzb24gV2FuZw0KPiA8amFzb3dhbmdA
cmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBQYW9sbw0KPiBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgRWR1YXJkbyBIYWJrb3N0IDxlZHVhcmRvQGhh
Ymtvc3QubmV0PjsNCj4gRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBNYXJrdXMgQXJt
YnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBMYXVyZW50DQo+IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPjsg
WXVyaSBCZW5kaXRvdmljaA0KPiA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsgQW5kcmV3
IE1lbG55Y2hlbmtvDQo+IDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMg
UEFUQ0ggMDEvMTJdIGNvbmZpZ3VyZTogQWRkIGlvdmlzb3IvdWJwZiBwcm9qZWN0IGFzIGENCj4g
c3VibW9kdWxlIGZvciBRRU1VDQo+IA0KPiBPbiBNb24sIEp1biAyMCwgMjAyMiBhdCAxMDoyOTox
NEFNICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5j
b20+DQo+ID4gPiBTZW50OiBNb25kYXksIEp1bmUgMjAsIDIwMjIgNTo0NCBQTQ0KPiA+ID4gVG86
IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47IERhbmllbCBQLiBCZXJyYW5nw6kN
Cj4gPiA+IDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiA+ID4gQ2M6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gPiA+IGRldmVsQG5vbmdudS5vcmc+
OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgRWR1YXJkbw0KPiA+ID4gSGFi
a29zdCA8ZWR1YXJkb0BoYWJrb3N0Lm5ldD47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsNCj4gPiA+IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IFBldGVyIE1h
eWRlbGwNCj4gPiA+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBMYXVyZW50IFZpdmllciA8
bHZpdmllckByZWRoYXQuY29tPjsNCj4gPiA+IFl1cmkgQmVuZGl0b3ZpY2ggPHl1cmkuYmVuZGl0
b3ZpY2hAZGF5bml4LmNvbT47IEFuZHJldyBNZWxueWNoZW5rbw0KPiA+ID4gPGFuZHJld0BkYXlu
aXguY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDEvMTJdIGNvbmZpZ3VyZTog
QWRkIGlvdmlzb3IvdWJwZiBwcm9qZWN0DQo+ID4gPiBhcyBhIHN1Ym1vZHVsZSBmb3IgUUVNVQ0K
PiA+ID4NCj4gPiA+IE9uIDIwLzA2LzIwMjIgMTEuMjksIFpoYW5nLCBDaGVuIHdyb3RlOg0KPiA+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
ID4+IEZyb206IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0KPiA+ID4gPj4gU2VudDog
TW9uZGF5LCBKdW5lIDIwLCAyMDIyIDQ6NDcgUE0NCj4gPiA+ID4+IFRvOiBEYW5pZWwgUC4gQmVy
cmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsgWmhhbmcsIENoZW4NCj4gPiA+ID4+IDxjaGVu
LnpoYW5nQGludGVsLmNvbT4NCj4gPiA+ID4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPjsgcWVtdS1kZXYgPHFlbXUtDQo+ID4gPiA+PiBkZXZlbEBub25nbnUub3JnPjsgUGFv
bG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IEVkdWFyZG8NCj4gPiA+ID4+IEhhYmtv
c3QgPGVkdWFyZG9AaGFia29zdC5uZXQ+OyBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47
DQo+ID4gPiBNYXJrdXMNCj4gPiA+ID4+IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsg
UGV0ZXIgTWF5ZGVsbA0KPiA+ID4gPj4gPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IExhdXJl
bnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+Ow0KPiA+ID4gPj4gWXVyaSBCZW5kaXRvdmlj
aCA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsgQW5kcmV3DQo+ID4gPiA+PiBNZWxueWNo
ZW5rbyA8YW5kcmV3QGRheW5peC5jb20+DQo+ID4gPiA+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRD
SCAwMS8xMl0gY29uZmlndXJlOiBBZGQgaW92aXNvci91YnBmDQo+ID4gPiA+PiBwcm9qZWN0IGFz
IGEgc3VibW9kdWxlIGZvciBRRU1VDQo+ID4gPiA+Pg0KPiA+ID4gPj4gT24gMjAvMDYvMjAyMiAx
MC4xMSwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToNCj4gPiA+ID4+PiBPbiBNb24sIEp1biAy
MCwgMjAyMiBhdCAwNTo1OTowNkFNICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPiA+ID4+
Pj4NCj4gPiA+ID4+Pj4NCj4gPiA+ID4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+Pj4+PiBGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29t
Pg0KPiA+ID4gPj4+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDE3LCAyMDIyIDQ6MDUgUE0NCj4gPiA+
ID4+Pj4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPiA+Pj4+
PiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0K
PiA+ID4gPj4+Pj4gZGV2ZWxAbm9uZ251Lm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+Ow0KPiA+ID4gPj4+Pj4gRWR1YXJkbyBIYWJrb3N0IDxlZHVhcmRvQGhhYmtvc3Qu
bmV0PjsgRXJpYyBCbGFrZQ0KPiA+ID4gPj4+Pj4gPGVibGFrZUByZWRoYXQuY29tPjsgTWFya3Vz
IEFybWJydXN0ZXINCj4gPGFybWJydUByZWRoYXQuY29tPjsNCj4gPiA+ID4+Pj4+IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IFRob21hcyBIdXRoDQo+ID4gPiA+Pj4+
PiA8dGh1dGhAcmVkaGF0LmNvbT47DQo+ID4gPiA+PiBMYXVyZW50DQo+ID4gPiA+Pj4+PiBWaXZp
ZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT47IFl1cmkgQmVuZGl0b3ZpY2gNCj4gPiA+ID4+Pj4+IDx5
dXJpLmJlbmRpdG92aWNoQGRheW5peC5jb20+OyBBbmRyZXcgTWVsbnljaGVua28NCj4gPiA+ID4+
Pj4+IDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gPiA+ID4+Pj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBB
VENIIDAxLzEyXSBjb25maWd1cmU6IEFkZCBpb3Zpc29yL3VicGYNCj4gPiA+ID4+Pj4+IHByb2pl
Y3QgYXMgYSBzdWJtb2R1bGUgZm9yIFFFTVUNCj4gPiA+ID4+Pj4+DQo+ID4gPiA+Pj4+PiBPbiBG
cmksIEp1biAxNywgMjAyMiBhdCAwMzozNjoxOVBNICswODAwLCBaaGFuZyBDaGVuIHdyb3RlOg0K
PiA+ID4gPj4+Pj4+IE1ha2UgaW92aXNvci91YnBmIHByb2plY3QgYmUgYSBnaXQgc3VibW9kdWxl
IGZvciBRRU1VLg0KPiA+ID4gPj4+Pj4+IEl0IHdpbGwgYXV0byBjbG9uZSB1YnBmIHByb2plY3Qg
d2hlbiBjb25maWd1cmUgUUVNVS4NCj4gPiA+ID4+Pj4+DQo+ID4gPiA+Pj4+PiBJIGRvbid0IHRo
aW5rIHdlIG5lZWQgdG9kbyB0aGlzLiBBcyBpdCBpcyBicmFuZCBuZXcNCj4gPiA+ID4+Pj4+IGZ1
bmN0aW9uYWxpdHkgd2UgZG9uJ3QgaGF2ZSBhbnkgYmFjayBjb21wYXQgaXNzdWVzLiBXZSBzaG91
bGQNCj4gPiA+ID4+Pj4+IGp1c3QgZXhwZWN0IHRoZSBkaXN0cm9zIHRvIHNoaXAgdWJwZiBpZiB0
aGV5IHdhbnQgdGhlaXIgUUVNVQ0KPiA+ID4gPj4+Pj4gYnVpbGRzIHRvIHRha2UgYWR2YW50YWdl
DQo+ID4gPiBvZiBpdC4NCj4gPiA+ID4+Pj4+DQo+ID4gPiA+Pj4+DQo+ID4gPiA+Pj4+IFllcywg
YWdyZWUuIEl0J3MgdGhlIGJlc3Qgd2F5IHRvIHVzZSB0aGUgdUJQRiBwcm9qZWN0Lg0KPiA+ID4g
Pj4+PiBCdXQgY3VycmVudCBzdGF0dXMgaXMgZGlzdHJvcyh1YnVudHUsIFJIRUwuLi4pIGRvZXMg
bm90IHNoaXANCj4gPiA+ID4+Pj4gdGhlIGlvdmlzb3IvdWJwZiBsaWtlIHRoZSBpb3Zpc29yL2Jj
Yy4gU28gSSBoYXZlIHRvIGRvIGl0Lg0KPiA+ID4gPj4+PiBPciBkbyB5b3UgaGF2ZSBhbnkgYmV0
dGVyIHN1Z2dlc3Rpb25zPw0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gSWYgZGlzdHJvcyB3YW50IHRv
IHN1cHBvcnQgdGhlIGZ1bmN0aW9uYWxpdHksIHRoZXkgY2FuIGFkZA0KPiA+ID4gPj4+IHBhY2th
Z2VzIGZvciBpdCBJTUhPLg0KPiA+ID4gPj4NCj4gPiA+ID4+IFllcywgbGV0J3MgcGxlYXNlIGF2
b2lkIG5ldyBzdWJtb2R1bGVzLiBTdWJtb2R1bGVzIGNhbiBzb21ldGltZXMNCj4gPiA+ID4+IGJl
IGEgcmVhbCBQSVRBIChlLmcuIGlmIHlvdSBmb3JnZXQgdG8gdXBkYXRlIGJlZm9yZSByc3luYydp
bmcNCj4gPiA+ID4+IHlvdXIgY29kZSB0byBhIG1hY2hpbmUgdGhhdCBoYXMgbGltaXRlZCBpbnRl
cm5ldCBhY2Nlc3MpLCBhbmQgaWYNCj4gPiA+ID4+IHVzZXJzIGluc3RhbGwgUUVNVSBmcm9tIHNv
dXJjZXMsIHRoZXkgY2FuIGFsc28gaW5zdGFsbCB1YnBmIGZyb20NCj4gc291cmNlcywgdG9vLg0K
PiA+ID4gPj4gQW5kIGlmIGRpc3Ryb3Mgd2FudCB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZSwgdGhl
eSBjYW4gcGFja2FnZQ0KPiA+ID4gPj4gdWJwZiBvbiB0aGVpciBvd24sIGFzIERhbmllbCBzYWlk
Lg0KPiA+ID4gPg0KPiA+ID4gPiBIaSBEYW5pZWwgYW5kIFRob21hcywNCj4gPiA+ID4NCj4gPiA+
ID4gSSBkb24ndCBrbm93IG11Y2ggdGhlIGJhY2tncm91bmQgaGlzdG9yeSBvZiBRRU1VIHN1Ym1v
ZHVsZXMsIGJ1dA0KPiA+ID4gbWVzb24NCj4gPiA+ID4gYnVpbGQgaXMgYSBzdWJtb2R1bGUgZm9y
IFFFTVUgdG9vLiBJdCBtZWFucyB1c2VyIGNhbid0IGluc3RhbGwNCj4gPiA+ID4gUUVNVSBmcm9t
IHNvdXJjZXMgd2l0aCBsaW1pdGVkIGludGVybmV0IGFjY2Vzcy4NCj4gPiA+DQo+ID4gPiBUaGVy
ZSBpcyBubyB3cml0dGVuIHBvbGljeSwgYnV0IEkgdGhpbmsgdGhlIGdlbmVyYWwgY29uc2Vuc3Vz
IGlzDQo+ID4gPiB0aGF0IHdlIG9ubHkgc2hpcCBjb2RlIGluIHN1Ym1vZHVsZXMgaWY6DQo+ID4g
Pg0KPiA+ID4gMSkgSXQncyBub3QgYXZhaWxhYmxlIGluIGEgcmVxdWlyZWQgdmVyc2lvbiBpbiBk
aXN0cm9zIHlldA0KPiA+ID4NCj4gPiA+IGFuZA0KPiA+ID4NCj4gPiA+IDIpIGl0IGlzIGVzc2Vu
dGlhbGx5IHJlcXVpcmVkIHRvIGJ1aWxkIFFFTVUgKGxpa2UgbWVzb24pIG9yIGlmIHRoZQ0KPiA+
ID4gZmVhdHVyZSBoYXMgYmVlbiBwYXJ0IG9mIHRoZSBRRU1VIHNvdXJjZXMgYmVmb3JlIGFuZCB0
aGVuIG1vdmVkIHRvIGENCj4gPiA+IHNlcGFyYXRlIHJlcG9zaXRvcnkgKGxpa2Ugc2xpcnApLg0K
PiA+ID4NCj4gPiA+IFdlIHNoaXAgbWVzb24gYXMgYSBzdWJtb2R1bGUgc2luY2Ugd2UgcmVxdWly
ZSBzb21lIG1lc29uIGZlYXR1cmVzDQo+ID4gPiB0aGF0IGFyZSBub3QgYXZhaWxhYmxlIHdpdGgg
dGhlIG1lc29uIHZlcnNpb25zIGluIHRoZSBkaXN0cm9zIHlldC4NCj4gPiA+IE9uY2UgdGhlIGRp
c3Ryb3MgY2F0Y2ggdXAsIHdlJ2xsIGxpa2VseSByZW1vdmUgdGhlIG1lc29uIHN1Ym1vZHVsZSBm
cm9tDQo+IFFFTVUuDQo+ID4gPg0KPiA+ID4gPiBBbmQgYmFjayB0byBEYW5pZWwncyBjb21tZW50
cywgIFllcywgdGhlIGJlc3Qgd2F5IGlzIGRpc3Ryb3MgYWRkDQo+ID4gPiA+IHRoZSB1YnBmIHBh
Y2thZ2VzLCBCdXQgbWF5YmUgaXQncyB0b28gbGF0ZSB0byBpbXBsZW1lbnQgbmV3DQo+ID4gPiA+
IGZlYXR1cmVzIGZvciB1cy4gV2UgY2FuIGludHJvZHVjZSB0aGUgc3VibW9kdWxlIG5vdyBhbmQg
YXV0bw0KPiA+ID4gPiBjaGFuZ2UgdG8gdGhlIGRpc3Ryb3Mncw0KPiA+ID4gbGliIHdoZW4gZGlz
dHJvcyBhZGQgaXQuICBGb3IgZXhhbXBsZSBRRU1VJ3Mgc3VibW9kdWxlIFNMSVJQIGRvIGl0DQo+
ID4gPiBpbiB0aGUgc2FtZSB3YXkuDQo+ID4gPg0KPiA+ID4gc2xpcnAgdXNlZCB0byBiZSBwYXJ0
IG9mIHRoZSBRRU1VIHJlcG9zaXRvcnksIGJ1dCB0aGVuIGhhcyBiZWVuDQo+ID4gPiBtb3ZlZCB0
byBhIHNlcGFyYXRlIHByb2plY3QgYSB3aGlsZSBhZ28uIEhvd2V2ZXIsIGF0IHRoYXQgcG9pbnQg
aW4NCj4gPiA+IHRpbWUgdGhlcmUgd2VyZW4ndCBhbnkgcGFja2FnZXMgaW5zIGRpc3Ryb3MgeWV0
LCBzbyB3ZSBoYWQgdG8gaW5jbHVkZSBpdCBhcw0KPiBhIHN1Ym1vZHVsZS4NCj4gPiA+DQo+ID4g
PiBOb3cgdGhhdCB0aGUgZGlzdHJvcyBzaGlwIGl0LCB0b28sIHdlJ3JlIHBsYW5uaW5nIHRvIHJl
bW92ZSB0aGUNCj4gPiA+IHNsaXJwIHN1Ym1vZHVsZSBmcm9tIFFFTVUgc29vbiwgc2VlOg0KPiA+
ID4NCj4gPiA+DQo+ID4gPiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUt
ZGV2ZWwvMjAyMi0wNC9tc2cwMDk3NC5odG1sDQo+ID4gPg0KPiA+ID4gPiBJdCBtYWtlIHVzZXIg
ZXhwZXJpZW5jZSB0aGUgbGF0ZXN0IHRlY2hub2xvZ3kgd2l0aCBubyBvdGhlcg0KPiA+ID4gPiBk
ZXBlbmRlbmNpZXMuDQo+ID4gPg0KPiA+ID4gV2VsbCwgdGhhdCdzIG9ubHkgdHJ1ZSBpZiB3ZSB1
cGRhdGUgdGhlIHN1Ym1vZHVsZSBpbiBRRU1VIHJlZ3VsYXJseS4NCj4gPiA+IElmIHdlIGZvcmdl
dCB0byB1cGRhdGUsIHdlIGNvdWxkIGVhc2lseSBtaXNzIHNvbWUgaW1wb3J0YW50IChtYXliZQ0K
PiA+ID4gZXZlbiBzZWN1cml0eQ0KPiA+ID4gcmVsYXRlZCkgZml4ZXMgZnJvbSB0aGUgdXBzdHJl
YW0gcHJvamVjdHMuIFRoaXMgY2FuIGJlIGEgbmlnaHRtYXJlDQo+ID4gPiBmb3IgZGlzdHJvcywg
d2hlbiB0aGV5IHRoZW4gaGF2ZSB0byBnbyBhcm91bmQgYW5kIGxvb2sgaW50byBlYWNoIGFuZA0K
PiA+ID4gZXZlcnkgcHJvamVjdHMgd2hldGhlciB0aGV5IGVtYmVkIGEgY2VydGFpbiBjb2RlIG1v
ZHVsZSB0aGF0IG5lZWRzIGENCj4gPiA+IENWRSBmaXguIEl0J3MgYmV0dGVyIGlmIGl0IGNhbiBi
ZSBmaXhlZCBpbiBvbmUgY2VudHJhbCBzcG90IGluc3RlYWQuDQo+ID4gPg0KPiA+ID4gPiB1QlBG
IGluZnJhc3RydWN0dXJlIGhhdmUgdGhlIGFiaWxpdHkgdG8gZXh0ZW5kIHRoZSBjYXBhYmlsaXRp
ZXMNCj4gPiA+ID4gd2l0aG91dCByZXF1aXJpbmcgY2hhbmdpbmcgc291cmNlIGNvZGUuIElmIHdl
IG5vdCBhbGxvdyBpdCwgd2UNCj4gPiA+ID4gaGF2ZSB0byByZS1pbXBsZW1lbnQgYWxsIHRoZSBl
QlBGIGFzc2VtYmxlciwgZGlzYXNzZW1ibGVyLA0KPiA+ID4gPiBpbnRlcnByZXRlciwgYW5kIEpJ
VA0KPiA+ID4gY29tcGlsZXIgbGlrZSBEUERLIHVzZXJzcGFjZSBlQlBGIHN1cHBvcnQgKERQREsg
Y2FuJ3QgdXNlIHVicGYNCj4gPiA+IHByb2plY3QgYnkgbGljZW5zZSBpc3N1ZSkuDQo+ID4gPg0K
PiA+ID4gTm90IHN1cmUgd2hldGhlciBJIHVuZGVyc3Rvb2QgdGhhdCBzdGF0ZW1lbnQgcmlnaHQg
Li4uIG5vYm9keSBzYWlkDQo+ID4gPiB0aGF0IFFFTVUgc2hvdWxkIG5vdCBhbGxvdyBpdCAtIHdl
IGp1c3Qgc3VnZ2VzdGVkIHRvIHJlbHkgb24gYQ0KPiA+ID4gc3lzdGVtIGluc3RhbGxhdGlvbiBv
ZiB1YnBmIGluc3RlYWQgb2YgZW1iZWRkaW5nIHRoZSBjb2RlLiBPciBpcw0KPiA+ID4gdGhhdCBu
b3QgcG9zc2libGU/PyAoSSBkb24ndCBrbm93IHRoYXQgcHJvamVjdCB5ZXQgLSBpc24ndCBpdA0K
PiA+ID4gcG9zc2libGUgdG8gY29tcGlsZSBpdCBhcyBhIHNoYXJlZCBsaWJyYXJ5PykNCj4gPg0K
PiA+IFRoYW5rcyBmb3IgeW91ciBkZXRhaWxzIGV4cGxhbmF0aW9uLg0KPiA+IEl0IGxvb2tzIGJl
dHRlciB0byBpbnRyb2R1Y2UgdGhlIHVCUEYgc2hhcmVkIGxpYnJhcnkgZm9yIFFFTVUuDQo+ID4g
Rm9yIGV4YW1wbGU6DQo+ID4gLi9jb25maWd1cmUgLS11YnBmLWxpYj1wYXRoDQo+IA0KPiBJJ3Zl
IG5vdCBsb29rZWQsIHNvIG1heWJlIGl0IGFscmVhZHkgZG9lcyB0aGlzLCBidXQgaWRlYWxseSAg
J3VCUEYnDQo+IHdvdWxkIHNoaXAgYSAncGtnLWNvbmZpZycgIGZpbGUsIHNvIHRoYXQgYXBwcyBj
YW4gYXV0b21hdGljYWxseSBmaW5kIGl0IGFuZCBzZXQNCj4gdGhlIHJpZ2h0IGNmbGFncy9saWJz
IGV0YyBmb3IgdGhlIGNvbXBpbGVyLiBGb3IgY29uZmlndXJlIGludGVncmF0aW9uLCBub3JtYWxs
eQ0KPiB3ZSdkIGV4cGVjdCBpdCB0byBiZSAtLWVuYWJsZS11YnBmLy0tZGlzYWJsZS11YnBmLCB3
aXRoIGl0IGF1dG9tYXRpY2FsbHkNCj4gZW5hYmxpbmcgaXRzZWxmIGlmIHRoZSBwa2ctY29uZmln
IGZpbGUgaXMgZm91bmQuDQo+IFRha2UgYSBsb29rIGF0IGhhbmRsaW5nIG9mIHNvbWUgZXhpc3Rp
bmcgbGlicmFyaWVzIHdlIGRlcGVuZCBvbiBmb3IgZXhhbXBsZXMuDQo+IA0KDQpPSywgdGhhbmtz
IHlvdXIgY29tbWVudHMuIEkgcmV2aWV3ZWQgdUJQRiBjb2RlLCBidXQgbm8gcGtnLWNvbmZpZyBm
aWxlLg0KVGhlIG1ha2UgaW5zdGFsbCBqdXN0IGNvcHkgdGhlIGxpYnVicGYuc28vLmEgdG8gL3Vz
ci9saWIuDQpGb3J0dW5hdGVseSwgd3JpdGluZyB0aGlzIGZpbGUgbG9va3MgZWFzeS4gSSB3aWxs
IHRyeSB0byBkbyBpdCBhbmQgbWFrZSBRRU1VIHVzZSB0aGUgbGlidWJwZi5zbyBsaWtlICJwaXht
YW4iLg0KDQpUaGFua3MNCkNoZW4NCiANCg0KPiBXaXRoIHJlZ2FyZHMsDQo+IERhbmllbA0KPiAt
LQ0KPiB8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLQ0KPiBodHRwczovL3d3dy5mbGlj
a3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwNCj4gfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAg
ICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8DQo+IHw6
IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLQ0KPiBodHRwczovL3d3dy5pbnN0YWdy
YW0uY29tL2RiZXJyYW5nZSA6fA0KDQo=

