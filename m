Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744143C324
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:43:05 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfceO-0005K8-MH
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfcc4-0004DT-Hd
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:40:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:11000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfcc1-0007WF-RO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:40:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290923617"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="290923617"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="555124987"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2021 23:40:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:40:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:40:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 23:40:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 23:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB3+LVx3NaBY4SfNqh3Hi3yacnLPjkj/KzOtCfQ7dVXNe797pYfeyH60gMsf7D7o0qiUg8qZ7ytDIzyX7FQDgG2ZySH1wyHlyilqkGaetc/h3WykJ3vtP0oTgYutCF7BKsNsJWGMEW7+5bBub9LRnLVMynXfqgyQM68Fzq1L+NrwPyXXNjmSZo+JaNVQs44+ZAULB1QWLeBe/jQ1e5TkBdN+6986Dsfi/NAS8Y4Gz8sqhZfcx0h01PKy0Lox3HMUeIRqUo/3QQsGit1YAJNJBCs+UBFMjDoakH3DydLaIEIiyrIwVu8KZGrjts3yGChiWp3W314Q6E0DKBqfF37o7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELPn+zhWCQMX6//cYRaroJlVWT48FSJqRfjkaiF8oCY=;
 b=aKHE8YXU0cs4BCOK6XHqAk1+kGtIGY9gDqWmoVNH7quc1XJLsLvFw40ASltgOq+QzbjrUVpKIc9zeWjSuPKf2LvRTbn+feqcPNGKdPm9XZPwCCawZQvTZ1GPzPTGuJQvp81YxS1ClTxJyqGdpC2Pra3yWtaIvCzVbhKvESh1Mefi2kyudaX4QxGJpMVc3BHX1r8icJC0I8MbXzZ/SgdgkPmPqjSxlsFMIeyBBHuXoPc3LjVWshOb+RZ8BDAC9GQbFiSY4yWmKCVTvwFlmgFekhotaxfC8JKjryit9xSlSa0Bu0OCvhZ0UpG4O9lbGMtgc76t76l6TbChiy0URrAHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELPn+zhWCQMX6//cYRaroJlVWT48FSJqRfjkaiF8oCY=;
 b=Z+AMjhTNlS3qoZsIBIebdo6HCURaDBb5iWdE0B53mUcNTgFPVFVMUNGiVgMU0IaFELfQo6oMXSm3JCkYc5cAwZixjv/rPZc7yWBp/4oGqYZ0xYuL943ZedxbYkppmhMhplsUXuqcnjtLO8tt7McM8996WR9vOlc1xKjyyqLPUf8=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 06:40:13 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 06:40:13 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
Thread-Topic: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror
 and filter-redirector
Thread-Index: AQHXypcSY+VezyZ8uk2tgxJJmOPSWKvmRcYAgAAJBdCAABKVgIAAAJXA
Date: Wed, 27 Oct 2021 06:40:13 +0000
Message-ID: <MWHPR11MB003173BB1E208D240823E8D39B859@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
 <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
 <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
 <fbdf6a0d-739f-9949-abf1-35b7ed1a29da@redhat.com>
In-Reply-To: <fbdf6a0d-739f-9949-abf1-35b7ed1a29da@redhat.com>
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
x-ms-office365-filtering-correlation-id: 46135749-9ae3-4b1b-233f-08d99914a147
x-ms-traffictypediagnostic: CO1PR11MB5108:
x-microsoft-antispam-prvs: <CO1PR11MB5108EA0F4297A2B7BFF49E539B859@CO1PR11MB5108.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K5AP+yTkimdtnJ/MDgA6tEyuGJb/tmlRhAHBHFLnTPsFPn08DGozwlAENevJw54kfHVf0YhnTE8u1plDVXfbkQIMMyIeU5YNGtFf7INF51RFifuDP7E4BeotgPIfmlu66OkOy0BzPfubgK8kGB1JDGuMxuF1rrc+BqtrW0+s306ezcX8hdHoirqMlVmQC5/HY9O7r9n3kQ0nByVMpHEHCszqQDyTdGG4qS3oFPrzCMaFb7ZOtgea+SeTX91ZTpRkpkXGeQMX/JFEud4vusvpy1tqkPZE0j1FdFoxdIb39KuhVDMHgzVnjkqLKV0by+LT7LxIG5FX8xbe/JDiajOvv6ONUiqf1SYk5VGYNlIxONuaSPNL4EgpE32q4Lkhg6tC5qXTZrVE5WEdsiAhGSwoC87zg/wuLYEYUukEY5VJW+N5Ojq6UBolpgKVICS6QNm2SexHdMdXPxmm9uQW5TqlnxCU9IbVwTiIw/cAtD9Ic7+pGajpdoEKIw+VGYrBD6dXUnKLvUNdLqhpvQygSjnuhwUbjEusgG+Rp6FxX/NufFM2VhwxvPGVwUXpC9RUSHNvCd7KM1lFahHBUwZ5W6j560l5Sibz3MVLpD7ljJGp2YDt4MjZ3uPDV/udyecDUdCNmYQ457f+IY4eKo4v6ja4D8MocXiBvNMZ5gvGdQDil426/i00NAPRx9G5XquRmwgRRhJrMRVAYRNgwEKoGfoJgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66446008)(66946007)(66556008)(64756008)(8676002)(71200400001)(86362001)(122000001)(38100700002)(76116006)(54906003)(8936002)(7696005)(82960400001)(38070700005)(53546011)(6506007)(83380400001)(5660300002)(2906002)(33656002)(52536014)(316002)(6916009)(55016002)(4326008)(508600001)(9686003)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?MTVIdHQ2QTdTOTRRZFBaMTZxcjA1TmQ2elRtZGEvV3dCYnNZNHcxcVJU?=
 =?iso-2022-jp?B?WStCZHlvcVZLZ2c5T1VrRW5JS3phRS96TVFxK1k2QS9tZ3JVSHJhUHdq?=
 =?iso-2022-jp?B?MllJUTRMOVlGS2Y3Ni9CcFp0c0RwOHJEczJ2NlhMckJTYWdaYUNSaTVy?=
 =?iso-2022-jp?B?OXZlclU3Vlo0bU5vOWJZRDBNTyt0UE42cHU5TENlK3c3Yy85TkJqUEZ1?=
 =?iso-2022-jp?B?VnQ0RjdXN25PTHR5TTAraTNxb1VScFVRWWsyclhOMHdNamFsQVBYWnBj?=
 =?iso-2022-jp?B?SlBycDJwUUR0Vm1QV1RXSkN1M3VUWDRoQTkyK241ZkJIMytwbEpLeEw4?=
 =?iso-2022-jp?B?WUdma1JpUSszSEJkcFEzVWdzbVZhcHpRUFJSZmZneUxueFdsOEVoT09R?=
 =?iso-2022-jp?B?c0xZWjNHYUJ1OHJ1S1BrZlBaRS9qUkx1VTJYRmR4eWwrVThyN3BkMWFL?=
 =?iso-2022-jp?B?UnVhN0ttWCs4UEtBd3U1NmVzclI0cjV5anBWdUhod296SDJtYzVrb2pE?=
 =?iso-2022-jp?B?aDdDRytHNmY4L1hEVzlkcEs1a09MM1hUdFpaSi9hWFRZUERhRzdJcDFL?=
 =?iso-2022-jp?B?VlZrbUFTNVhQenFlOE5mUzZqa2MwY21WK1hWSlQzb1B3R2lBU1lSZERz?=
 =?iso-2022-jp?B?bTlVcytNSW5TUDdjNi9aT094ZmJNeVo5WHl3Wld0NXNTN2JMTlVVcEpm?=
 =?iso-2022-jp?B?anBham9oUHl0QkxIcG5XVG8rSUNBR2FFWHE5dElpY0JTQlprRFZGa0U2?=
 =?iso-2022-jp?B?TXJjREJUMmtIRmVmSUFKMTB1U0F4WWZVaitWZGRMUFl3elQ5SGUvZEV4?=
 =?iso-2022-jp?B?c2NsVnl5ZXRsYUVVdmg5NlVLRlNXWnlGNWt6QUhjZG8zMmF1emx4Y01w?=
 =?iso-2022-jp?B?Tm5xMmV4Kzc5RHU2WGhDWE40TGt2cnJuWk1UMlRtUGtXWFNKODMxQzht?=
 =?iso-2022-jp?B?S2VoOXZOUjFBbXpIelBNcXMyckUzMDdYcVdqcCszWTZNVmVJTnl2MnJu?=
 =?iso-2022-jp?B?K0p3c0hVUlFnaXdWUGJHclAzVHhpN0l3SUpvT2N5VzRwWWNpMlNHa3gx?=
 =?iso-2022-jp?B?RGpFeDd2cWtLcE0vZUF2MExzaytHTmJWcGh5SHRUSGo5MTEwZ1d0SzVr?=
 =?iso-2022-jp?B?dDR4Z3p0eC9vVVB4TzdObENWWHNkRUVCZ2VJUktiK2UwKzNXU1g5aVpI?=
 =?iso-2022-jp?B?NklSYXZlRnNBaHFSTDByNjFxUVNqZXJlQXc3V2kwTkpTOGgrekh4M0Ez?=
 =?iso-2022-jp?B?SXBYQzZSM3orSUQ3Wk00Vmd2K2ZCSFd4dWM4QW9UL1J2N0QvWkt1Q3c1?=
 =?iso-2022-jp?B?Rms1ZEQ2a0lNOGFNRkMrUDZXVEUzOXV6clRLZGZ2akJhUGY5T0ZYUElk?=
 =?iso-2022-jp?B?TlJsODlwTVJlRkFPczAwM052R0xoenhxMkhxQ1cxMU5rdytXOThHSDRK?=
 =?iso-2022-jp?B?blQzdEVhUXUyR0VvNCsySVE4S1BmQ2ZReDZmNlc0ZjQ0VVFtbUVBK2Jl?=
 =?iso-2022-jp?B?cFZMdzdrY1QycEFEcmE3dTdPMFhvV3ZaV2NIaWI5UFpSSUtNUVQ0S3gz?=
 =?iso-2022-jp?B?b0ltNndrbzJKOUtkb1JsUTE1bUNJQWN6T2hqYldpTFVtT2RoSGIyREhE?=
 =?iso-2022-jp?B?bXJ0blRPdWsyTGRTNkdCeHRHSFJ6SmdSeXFla2xjZlkxc2ErZWRSTzMy?=
 =?iso-2022-jp?B?S1NuUGNLVkl2T2RNQlVKQUdORmJObFFlbCtHVXhsNXFzQmRRRi9PRVR3?=
 =?iso-2022-jp?B?UkV1YTJtcDBWbmR6eGlYdnZRMGJGNVhkbktxMXpLYlMyOVpnV2RqVG15?=
 =?iso-2022-jp?B?Qm5nL1lRYXR0MnNMUklVMERDeGNOSGFMam12TVhjdGRyNWFOQys5UFRV?=
 =?iso-2022-jp?B?a21uRkwwaEU1ZXdUZUZUN1d4OWxSUVQzQStVc2laaWtlYmxOWjdtSk41?=
 =?iso-2022-jp?B?VUtBTkwvMnRIR0pwQWxUaUg0UEJlcmMyTzU5akEyTVRoN1FUQjhBdDR3?=
 =?iso-2022-jp?B?NU1YeTF4L2dSVTFpQ1ZTRmR4Z05MR3dGcUZwbVZ5M2xnRTVMbFNRTFBY?=
 =?iso-2022-jp?B?dERaU0NqbnhJa0ZwR01JcXd0NzVwaGlnbkNVYklqTVEwNVJwVU9BVjhH?=
 =?iso-2022-jp?B?cUUwb1dHUU4yWWI0SCtZTlpUZjNoTTgvK0pFTURtazNwRldJeDNWNkNU?=
 =?iso-2022-jp?B?aXRoWlVram53YlRmL1RwQjFXSEhqbmZYT0JlajYxZVh1QWQrUW8yekxs?=
 =?iso-2022-jp?B?Mm5CejF4akx1WCt1NTFtQlR4MGRGZFZMM283Q0lqRHJ1cGJHTFZHTTll?=
 =?iso-2022-jp?B?elRiQTkyUUN5S0JUL2U5ZWp4TGpiUWRIbm16ck5rWkQ1WjZyeXVZT0hW?=
 =?iso-2022-jp?B?YldKemc9?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46135749-9ae3-4b1b-233f-08d99914a147
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 06:40:13.3295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysIzz4xDkDxtWdlswoCFgZRCaQSPmBdLtJLB002xcQSC1G8xgvNNMbxVHBmAkWj5SiPQkKYK0NgH2zAVul2pVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, October 27, 2021 2:24 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: qemu-dev <qemu-devel@nongnu.org>; Markus Armbruster
> <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirro=
r
> and filter-redirector
>=20
>=20
> =1B$B:_=1B(B 2021/10/27 =1B$B2<8a=1B(B2:19, Zhang, Chen =1B$B<LF;=1B(B:
> >>
> mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=3Dall|rx|tx[,vn=
et_h
> >> dr _support][,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]=
``
> >>> +    ``-object
> >>> + filter-mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=3D=
all|rx|
> >>> + tx [,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``
> >> I wonder if we break management layer. If yes, maybe it's better to
> >> keep the vnet_hdr_support here.
> > Yes and no,   With this series of patches, filters have ability to auto=
matically
> > Configure the appropriate vnet_hdr_support flag according to the curren=
t
> environment.
> > And can report error when can't fixing the vnet_hdr(The user cannot fix=
 it
> from the previous way ).
> > So I think no need for the user to configure this option, some relevant
> background knowledge required.
> >
> > For the management layer, keep the vnet_hdr_support may be
> meaningless except for compatibility.
> > In this situation, Do you think we still need to keep the vnet_hdr_supp=
ort
> for management layer?
>=20
>=20
> So it depends on whether management layer like libvirt has already
> supported this. If yes, we may get errors using new qemu with old libvirt=
?

As far as I know, Current management layer like upstream libvirt is no COLO=
 official support yet.
And some real CSPs use libvirt passthrough qmp command to Qemu for manage C=
OLO VM.
It is no harm to users to reduce some unnecessary parameters. But if you th=
ink compatibility is
more important, I will restore this parameter in next version.

Thanks
Chen




>=20
> Thanks
>=20
> > Enable/disable it do the same things for filters.
> >
> > Thanks
> > Chen
> >


