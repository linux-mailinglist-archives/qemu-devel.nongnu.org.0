Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8643C2EA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:22:43 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcKg-00032f-PX
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfcHZ-0002BC-WC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:19:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:19928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfcHW-0000PW-BX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:19:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217256786"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="217256786"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="447413195"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 26 Oct 2021 23:19:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:19:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:19:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 23:19:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 23:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsKXgqMiY+0ByEi4oAQTWwt1n4mtClB3slqEe82IKdsEZT6I70fTEFMAp90th3yL0Vcj/DkMwutK5Om2TlM25alYf5r6FjHchxGwpqYaUvfqV+Q2ebGHzEMr0RVm6Png5IokOXewBoyOh28N75FQ7dJj9/2ol+gfd8dpzBeaexr/E/j1WhylLg6/ERCzDR8TtfskGzpNQxPAU15e0pqYemJZ6U2ZbQLsBqmycKNowD/4GVBew3H4TnJo7gNCw+DeH5xMej9SuF0Um2MR1WK9GYeh5sBkQQGeyEq3xS+tbjfTF4433ACK+I+0qHjFGNNJlqMJWK+QteFAxDAqHnzMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhNZEe9cVDLKKuQTR0qruY40D5H3VcwoDoMPk9csmes=;
 b=dmciH7zzqch4EQJrodt4zR9VeO3MXSUkJqn4YMf7VcL37ljUZL50hU/SS6P6Kcw3dfETo1+7eKq9UNSrRsVaR+NRaEeOZ2X8DVTNCP5SGU1ZdID+fBB2xdtfNzpiJQbhP2EzRDOmH35xHEl1EGyRyzczV6kInkcyaeee0EUXiOFCpeh45+MPl/nf7JoF3pXphbip5rQPCZZ0jl/B2E/yq6ypVczeot/oktGrgoWix/YDaF0WuW3zNDb78pDBqFxAlXGfal9rXfENcthuDDIhnX6wpsUfCctv1z64eFD2khTzHb0Al/9ohEfjvZ6PU5Ti5X4bnNYKSWo4OWYjqfbirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhNZEe9cVDLKKuQTR0qruY40D5H3VcwoDoMPk9csmes=;
 b=PG2BYwCN8eHoqav2DyhWPdqXYN9aTAyV+WCt+LPIphkUUV6toFbeOcfDbKXe4bBYsPCGD1ghqcw9IMl44jWyAW5QSA9hby6tmUUEQZQ9/7eq7fFt4pduD8nL5ZO54imP6xM8Cp+bV19M7PFK1IA03eVgH+i/sk8Jhe6JIouENMo=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1408.namprd11.prod.outlook.com (2603:10b6:300:24::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 06:19:20 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 06:19:19 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
Thread-Topic: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror
 and filter-redirector
Thread-Index: AQHXypcSY+VezyZ8uk2tgxJJmOPSWKvmRcYAgAAJBdA=
Date: Wed, 27 Oct 2021 06:19:19 +0000
Message-ID: <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
 <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
In-Reply-To: <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
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
x-ms-office365-filtering-correlation-id: 48938bb7-fd9a-4bc6-605c-08d99911b62f
x-ms-traffictypediagnostic: MWHPR11MB1408:
x-microsoft-antispam-prvs: <MWHPR11MB14080FEC827301D0BB5A5E619B859@MWHPR11MB1408.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzN1yKK25GXXYMNgMBbDMmKcQyzYLsvrtumnSaP5PHQvsAqYWbGz2ViBQNBmpVAmKslR556y4dITqpVH8c75ziVqCv4RgYAWepoP80KsHmyzU5S08qQvYMdZKCpWULWgkfoc2Ew0JmcMsb6rOM6q8oYeD64No46OiIIBIX7Byr8Dsr8hBm+Dea4FQlnSmxQWNqC+F453mRScYUOEZJlDnNiDfEulZsSH1hOIpp9yhHv73KcrQt7yCNG6MlvgBt5Z3WoLpRigMhAYJkux+O71s1IVM70QxbTYJFdbnwvC+zzfB8c8IGoeAt3pVA+CTwL7jz0oheE07Pjc+q08xIX4pxuDVzT+sxLqoiDQ4msKMtvpaRdGOFFLsGFfoERHlM+7CDm1Brzq7pHl2f7kQBArljmZp0AIujCyVADaqvG9U0zi9wzGlI5TXFQqJ1ue/9Z4VswIgnuGnuZ+t2q+dSpxWAx6uNOfJKNHDgOXzu3YGldF54PaILmeNioVXcy8sjp5k15gUlC2jgdWPD1KfmLX7+sDVjYwrJMAFknWtWbsv7KAB+RpWbVAcIBPwWdM3ab+HaHIphwqiIjPYwL/9Wh7XusUYuZz9jwAivvG5CzVE2KXnYmXlpex6V9F5VKnStApyModGNo9yKTjdN9BTPtj1F+Izp1sMHK6mvWmWOWGA0AUd2ygKAasn9+XqTRukD3sGq9tEdILPPFgMxXxATu6yw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(52536014)(9686003)(26005)(6506007)(66946007)(54906003)(38070700005)(33656002)(71200400001)(55016002)(5660300002)(8676002)(6916009)(316002)(86362001)(8936002)(53546011)(83380400001)(508600001)(7696005)(66476007)(64756008)(66446008)(122000001)(66556008)(76116006)(2906002)(4326008)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Wlh4ZG42U3JzWXFVYW9pbDVISGhSbXFGdHZQRWNhWGROK1NqcFJzZTZZ?=
 =?iso-2022-jp?B?ZUlkWk9ybnVVVTAxSHBUeXRrdEpBSU5WRENLTjY2L1hRNEN2WUF3YVdK?=
 =?iso-2022-jp?B?d1c1UEo0bGJKcW9sL2lsNmpPWGhHTlhpTlhJUDczYTdzaTMrMnpJNnpz?=
 =?iso-2022-jp?B?ZmQyeit4ZkIrMkVLZk8wL2NmNVdOaE15MExscVdjOFJhZUVJMDNBV0RO?=
 =?iso-2022-jp?B?SEZFbGs2aVo5SElsZjIvN2NmSXQxaVFMalA2K2MrSHFFN096bUxiREw4?=
 =?iso-2022-jp?B?SVFqbWhLNE4yUTZNVG9vT2owZGhJZFI2ZjVVb1QzU1lnUjJVZ3kraTZQ?=
 =?iso-2022-jp?B?K3ExMmtwS3k0Zm1NT1BqVjIzK0oza1JxMm93S3d2YWlSd3lCQVhwSjNM?=
 =?iso-2022-jp?B?d21Pd0hDM0ZZWDQxR2E1c3kxekdMMGlZWDlOSHBFZmYyM2JMS3hZa2JJ?=
 =?iso-2022-jp?B?V0s2NXNEdnUzbm5kQ1RHcEJVYXMvT2pTT3MrYy81T1lUY1hJWWxhMVhm?=
 =?iso-2022-jp?B?TGl6bkNvaGtrRFp6SHY1ZU8vdVpIeUJnb3M3SDNreElVZ2ZDZVhyZXk0?=
 =?iso-2022-jp?B?UU4zaXcwZWZnakh0UDk5MGxoL1RJS0VCZVlDN2kvaVMyN0JYbGUvMCtG?=
 =?iso-2022-jp?B?TG9nS1g4b25mdnY3Qmt0RDZZYXNJaW9VU29NaXhrRmNkc1BaU054eE9N?=
 =?iso-2022-jp?B?SnJwaysrM2ZDSGhmdVgwN3FuVi9pdEFlQVdNbDAzRHFVTndwSHgzSit2?=
 =?iso-2022-jp?B?aG1xREdNdmg0YnFPTnRoMnVpUzg0c0xUZU5YTUtiVm54eU4xb2ZxMmxX?=
 =?iso-2022-jp?B?UER3TFhYaEc4cWt1aHNkVGIzMXc2anFKT3lBNVdVTmF2SWd3OUMzRmlC?=
 =?iso-2022-jp?B?emNNOU43aFcvazhlWjg2eFczT2s5WHk4OCszM1d0UDhReG1CS2tJVm9K?=
 =?iso-2022-jp?B?NHBIN09TZGpsSHVPNGt5SWNpRzh4YVJ1Qmc1a0ttWUJodVZDelo0TXBZ?=
 =?iso-2022-jp?B?R1RqZnV5eGllL2JUZE9sVmc5dVh1TjRCTE16eXF1a3pURWpRc1l2dGpv?=
 =?iso-2022-jp?B?M3VQaGRkWEJYOU1rVXVaQ0VJcmxUM0E3cDRpUlorZEovbmFVTnNMbk9q?=
 =?iso-2022-jp?B?WXZ4ejg3RUlEeWFIK2dxSHF3ekNGOVRPcWRPY2oyRzN0WmtiTllvaXcw?=
 =?iso-2022-jp?B?OHNTMFhsekxPeCsvUUI1OHZDd3prZDg1OVo3czJLZWNzcUx3bmQ0blFa?=
 =?iso-2022-jp?B?UzBFc2dlOEJrMXZUdWVFMHZBMDd2TFhTMDM4M3hxRnJjQ2xKRmJhL2ti?=
 =?iso-2022-jp?B?a2J0bGkwcyt0bGFNL3Vzc3lReloyZzI1UThwa2U5MkYrMEI0aDhLWmFS?=
 =?iso-2022-jp?B?RC9aZDBVaFcvMmM2RUllaFVrTnE4bVV2TzhCUlRjTlVhWUlETDNNdUQw?=
 =?iso-2022-jp?B?L21BZW85WXJUL0cxRXo4Y2pxMXlTSDM1T1lvemRJemhYVWxEVkEyTEIv?=
 =?iso-2022-jp?B?K3N1T0hUT3o2UTBVcTlwYyt2dEpCcUFVanpBRjFMYko3U2txUUtSZVpj?=
 =?iso-2022-jp?B?YjBpQlZFZXhFdXlBZmtMZmc1T2ZxVkFTZ09LTEdHUHI3WXVtZktRNVpD?=
 =?iso-2022-jp?B?TElYVEo4ZW5rV3krMDJqdWhXM0Z2VGhzL0Rtb3ZJNWYrWUJBd2VWS0dB?=
 =?iso-2022-jp?B?UEp6MFJFMnJkdUs5R1MvZlFKeVFyb2dFSzVGamZVeVo4TFhCaklrWkZD?=
 =?iso-2022-jp?B?U05kUkJQdHd1cHlJMG5kcFVNQS90VFNaRFRJeW1UK0ZVMG9oaEtZREJv?=
 =?iso-2022-jp?B?M0M2b1NZN2hVU0tqbnJxYThsSVRQU3NpTUtNT2p6ejhKT0U0QzgxTGtB?=
 =?iso-2022-jp?B?N1hOOUFQUHJ2V0VMcGRiSUZ2U1lLNTIweERCaStQQ2NrK3RLWG8rTklk?=
 =?iso-2022-jp?B?dExtcUxoajAyMDhpRWNDOHRESlh1SzBUMmJqVENZL090bGN1RjFrWCtG?=
 =?iso-2022-jp?B?Z0FFZDUrQUcwd25TZXBudkd1MUpPT3BqWlN1akRwN256ZGZDZUJLL2pl?=
 =?iso-2022-jp?B?ZFBWeXh0RHhDanpEL281VmU1OFFoalRwODVITmVzR2xyTnVzWDF6TkJT?=
 =?iso-2022-jp?B?R09xUlRvVGx6d01zU3dwK1RUaTcwbU9FdEdOL3Q5M2RLRVJzVVRxcUx2?=
 =?iso-2022-jp?B?aDcyTElGa3FGOEhzK0JyU3BTR0swYnVJNTI3ZWxodUVoaW1VUmtvbXVB?=
 =?iso-2022-jp?B?QUlkUmNjdkNzMExhbXppVVkwR29FQ2xXTmRPckMrMWZWaUJPUmVUZVdq?=
 =?iso-2022-jp?B?Sm9DZHJQVHRUWlpwQ214SmJ6b1V1bFlyTkV4c0Q5MXJJUmFHN0FtaEZ2?=
 =?iso-2022-jp?B?alNqRDQ9?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48938bb7-fd9a-4bc6-605c-08d99911b62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 06:19:19.9098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: im3/QggLW0fMWNImXyW5w8OrPixqT+SLOr6q87cKRtZOUCvBuuO/FuMqsL7pG9Bhwhi3EhUFmvL2fE/BvbQhxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1408
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, October 27, 2021 12:46 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: qemu-dev <qemu-devel@nongnu.org>; Markus Armbruster
> <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirro=
r
> and filter-redirector
>=20
>=20
> =1B$B:_=1B(B 2021/10/27 =1B$B>e8a=1B(B2:17, Zhang Chen =1B$B<LF;=1B(B:
> > Make the vnet header a necessary part of filter transfer protocol.
> > So remove the module's vnet_hdr_support switch here.
> > It make other modules(like another filter-redirector,colo-compare...)
> > know how to parse net packet correctly. If local device is not the
> > virtio-net-pci, vnet_hdr_len will be 0.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >   net/filter-mirror.c | 88 ++++++++++----------------------------------=
-
> >   qemu-options.hx     | 14 ++++----
> >   2 files changed, 25 insertions(+), 77 deletions(-)
> >
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..4f0e26cc92 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -39,7 +39,6 @@ struct MirrorState {
> >       CharBackend chr_in;
> >       CharBackend chr_out;
> >       SocketReadState rs;
> > -    bool vnet_hdr;
> >   };
> >
> >   static int filter_send(MirrorState *s, @@ -48,7 +47,7 @@ static int
> > filter_send(MirrorState *s,
> >   {
> >       NetFilterState *nf =3D NETFILTER(s);
> >       int ret =3D 0;
> > -    ssize_t size =3D 0;
> > +    ssize_t size =3D 0, vnet_hdr_len =3D 0;
> >       uint32_t len =3D 0;
> >       char *buf;
> >
> > @@ -63,21 +62,18 @@ static int filter_send(MirrorState *s,
> >           goto err;
> >       }
> >
> > -    if (s->vnet_hdr) {
> > -        /*
> > -         * If vnet_hdr =3D on, we send vnet header len to make other
> > -         * module(like colo-compare) know how to parse net
> > -         * packet correctly.
> > -         */
> > -        ssize_t vnet_hdr_len;
> > -
> > -        vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> > +    /*
> > +     * The vnet header is the necessary part of filter transfer protoc=
ol.
> > +     * It make other module(like colo-compare) know how to parse net
> > +     * packet correctly. If device is not the virtio-net-pci,
> > +     * vnet_hdr_len will be 0.
> > +     */
> > +    vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> >
> > -        len =3D htonl(vnet_hdr_len);
> > -        ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len,
> sizeof(len));
> > -        if (ret !=3D sizeof(len)) {
> > -            goto err;
> > -        }
> > +    len =3D htonl(vnet_hdr_len);
> > +    ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof=
(len));
> > +    if (ret !=3D sizeof(len)) {
> > +        goto err;
> >       }
> >
> >       buf =3D g_malloc(size);
> > @@ -232,6 +228,12 @@ static void redirector_rs_finalize(SocketReadState
> *rs)
> >       MirrorState *s =3D container_of(rs, MirrorState, rs);
> >       NetFilterState *nf =3D NETFILTER(s);
> >
> > +    /* Check remote vnet_hdr */
> > +    if (rs->vnet_hdr_len !=3D nf->netdev->vnet_hdr_len) {
> > +        error_report("filter redirector got a different packet vnet_hd=
r"
> > +        " from local, please check the -device configuration");
> > +    }
> > +
> >       redirector_to_filter(nf, rs->buf, rs->packet_len);
> >   }
> >
> > @@ -252,7 +254,7 @@ static void filter_redirector_setup(NetFilterState
> *nf, Error **errp)
> >           }
> >       }
> >
> > -    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> > +    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
> >
> >       if (s->indev) {
> >           chr =3D qemu_chr_find(s->indev); @@ -323,20 +325,6 @@ static
> > void filter_mirror_set_outdev(Object *obj,
> >       }
> >   }
> >
> > -static bool filter_mirror_get_vnet_hdr(Object *obj, Error **errp) -{
> > -    MirrorState *s =3D FILTER_MIRROR(obj);
> > -
> > -    return s->vnet_hdr;
> > -}
> > -
> > -static void filter_mirror_set_vnet_hdr(Object *obj, bool value, Error
> > **errp) -{
> > -    MirrorState *s =3D FILTER_MIRROR(obj);
> > -
> > -    s->vnet_hdr =3D value;
> > -}
> > -
> >   static char *filter_redirector_get_outdev(Object *obj, Error **errp)
> >   {
> >       MirrorState *s =3D FILTER_REDIRECTOR(obj); @@ -354,31 +342,12 @@
> > static void filter_redirector_set_outdev(Object *obj,
> >       s->outdev =3D g_strdup(value);
> >   }
> >
> > -static bool filter_redirector_get_vnet_hdr(Object *obj, Error **errp)
> > -{
> > -    MirrorState *s =3D FILTER_REDIRECTOR(obj);
> > -
> > -    return s->vnet_hdr;
> > -}
> > -
> > -static void filter_redirector_set_vnet_hdr(Object *obj,
> > -                                           bool value,
> > -                                           Error **errp)
> > -{
> > -    MirrorState *s =3D FILTER_REDIRECTOR(obj);
> > -
> > -    s->vnet_hdr =3D value;
> > -}
> > -
> >   static void filter_mirror_class_init(ObjectClass *oc, void *data)
> >   {
> >       NetFilterClass *nfc =3D NETFILTER_CLASS(oc);
> >
> >       object_class_property_add_str(oc, "outdev", filter_mirror_get_out=
dev,
> >                                     filter_mirror_set_outdev);
> > -    object_class_property_add_bool(oc, "vnet_hdr_support",
> > -                                   filter_mirror_get_vnet_hdr,
> > -                                   filter_mirror_set_vnet_hdr);
> >
> >       nfc->setup =3D filter_mirror_setup;
> >       nfc->cleanup =3D filter_mirror_cleanup; @@ -393,29 +362,12 @@
> > static void filter_redirector_class_init(ObjectClass *oc, void *data)
> >                                     filter_redirector_set_indev);
> >       object_class_property_add_str(oc, "outdev",
> filter_redirector_get_outdev,
> >                                     filter_redirector_set_outdev);
> > -    object_class_property_add_bool(oc, "vnet_hdr_support",
> > -                                   filter_redirector_get_vnet_hdr,
> > -                                   filter_redirector_set_vnet_hdr);
> >
> >       nfc->setup =3D filter_redirector_setup;
> >       nfc->cleanup =3D filter_redirector_cleanup;
> >       nfc->receive_iov =3D filter_redirector_receive_iov;
> >   }
> >
> > -static void filter_mirror_init(Object *obj) -{
> > -    MirrorState *s =3D FILTER_MIRROR(obj);
> > -
> > -    s->vnet_hdr =3D false;
> > -}
> > -
> > -static void filter_redirector_init(Object *obj) -{
> > -    MirrorState *s =3D FILTER_REDIRECTOR(obj);
> > -
> > -    s->vnet_hdr =3D false;
> > -}
> > -
> >   static void filter_mirror_fini(Object *obj)
> >   {
> >       MirrorState *s =3D FILTER_MIRROR(obj); @@ -435,7 +387,6 @@ static
> > const TypeInfo filter_redirector_info =3D {
> >       .name =3D TYPE_FILTER_REDIRECTOR,
> >       .parent =3D TYPE_NETFILTER,
> >       .class_init =3D filter_redirector_class_init,
> > -    .instance_init =3D filter_redirector_init,
> >       .instance_finalize =3D filter_redirector_fini,
> >       .instance_size =3D sizeof(MirrorState),
> >   };
> > @@ -444,7 +395,6 @@ static const TypeInfo filter_mirror_info =3D {
> >       .name =3D TYPE_FILTER_MIRROR,
> >       .parent =3D TYPE_NETFILTER,
> >       .class_init =3D filter_mirror_class_init,
> > -    .instance_init =3D filter_mirror_init,
> >       .instance_finalize =3D filter_mirror_fini,
> >       .instance_size =3D sizeof(MirrorState),
> >   };
> > diff --git a/qemu-options.hx b/qemu-options.hx index
> > 5f375bbfa6..38c03812a7 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4946,18 +4946,16 @@ SRST
> >
> >           ``behind``: insert behind the specified filter (default).
> >
> > -    ``-object filter-
> mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=3Dall|rx|tx[,vn=
et_hdr
> _support][,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``
> > +    ``-object
> > + filter-mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dchardevid,queue=3Dal=
l|rx|tx
> > + [,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``
>=20
>=20
> I wonder if we break management layer. If yes, maybe it's better to keep =
the
> vnet_hdr_support here.

Yes and no,   With this series of patches, filters have ability to automati=
cally
Configure the appropriate vnet_hdr_support flag according to the current en=
vironment.
And can report error when can't fixing the vnet_hdr(The user cannot fix it =
from the previous way ).
So I think no need for the user to configure this option, some relevant bac=
kground knowledge required.

For the management layer, keep the vnet_hdr_support may be meaningless exce=
pt for compatibility.
In this situation, Do you think we still need to keep the vnet_hdr_support =
for management layer?
Enable/disable it do the same things for filters.

Thanks
Chen

>=20
> Thanks
>=20
>=20
> >           filter-mirror on netdev netdevid,mirror net packet to
> > -        chardevchardevid, if it has the vnet\_hdr\_support flag,
> > -        filter-mirror will mirror packet with vnet\_hdr\_len.
> > +        chardev chardevid, filter-mirror will mirror packet with
> vnet\_hdr\_len.
> >
> > -    ``-object filter-
> redirector,id=3Did,netdev=3Dnetdevid,indev=3Dchardevid,outdev=3Dchardevid=
,queu
> e=3Dall|rx|tx[,vnet_hdr_support][,position=3Dhead|tail|id=3D<id>][,insert=
=3Dbehind
> |before]``
> > +    ``-object
> > + filter-redirector,id=3Did,netdev=3Dnetdevid,indev=3Dchardevid,outdev=
=3Dchard
> > + evid,queue=3Dall|rx|tx[,position=3Dhead|tail|id=3D<id>][,insert=3Dbeh=
ind|bef
> > + ore]``
> >           filter-redirector on netdev netdevid,redirect filter's net
> >           packet to chardev chardevid,and redirect indev's packet to
> > -        filter.if it has the vnet\_hdr\_support flag, filter-redirecto=
r
> > -        will redirect packet with vnet\_hdr\_len. Create a
> > -        filter-redirector we need to differ outdev id from indev id, i=
d
> > -        can not be the same. we can just use indev or outdev, but at
> > +        filter. filter-redirector will redirect packet with vnet\_hdr\=
_len.
> > +        Create a filter-redirector we need to differ outdev id from in=
dev id,
> > +        id can not be the same. we can just use indev or outdev, but
> > + at
> >           least one of indev or outdev need to be specified.
> >
> >       ``-object
> > filter-rewriter,id=3Did,netdev=3Dnetdevid,queue=3Dall|rx|tx,[vnet_hdr_s=
uppor
> > t][,position=3Dhead|tail|id=3D<id>][,insert=3Dbehind|before]``


