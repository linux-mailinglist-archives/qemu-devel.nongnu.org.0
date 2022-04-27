Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C5A511450
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:32:01 +0200 (CEST)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nje1g-0005iT-FQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1njdwV-00035v-5y
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:26:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:11594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1njdwR-0006Jh-Vj
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651051595; x=1682587595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vIbVDIfrlgOnTO90/jGeGXHFmgZaAmSgSHf4to0U37o=;
 b=AQYdPODhQNKgzeHi9mk1AXLPOpC9spweuzLLCsQHA1KFRAb+1yQ0uDEE
 LfLrBpYAFGzAYx+XdmQ+WO6coe0j3glB0jqkIdYNh++tcqDNv59m/aPXe
 PzmEmqiikpn/AQd5/zsEwP9eeSf4myY2W6g97swJtABexb5yFHjU5Rj4b
 t/5oouC9GnkK/0e/vnvTQSDQQeZErI90ht9nOpTCRWK1J2+FmTLi2kakA
 7MuUKEkmO2VHzRwbr143UU/GJrLljbnacaeea29CqI390b8chiGfYIbFZ
 nijAu7AXv29LhBhUCHqT+NDnMcfETwwXqjb0dWbwSXsqMGF6p07w/EEEW g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291023214"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291023214"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 02:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="680304789"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 27 Apr 2022 02:26:31 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 02:26:31 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 02:26:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 02:26:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 02:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7CFO4Zimy/m0SIY7JnUDc7MhBlccgmH/fISWVuUwL8oEfFbSNK+M60ouCEYdehhUMtGZKRx1tOGk8VBTajfVIb0BygkQeDrrfLtxlamrTke0pB6i3xrEm74zWAtCU5w2mhtUvQV/Yalx44uIW2pnIEUiqgKRvTUWaPjbNM+yd0u6YeLM0JaejMGAaDe1EPE9psm9sdZ9I5fm3YV4CQT2U+Q5cQ7K7YYF0tayrmbDuOVrBcxPldvnkbk8Np/DLv6eFakjhSURZT0vIZ5THZcmQJIQnRz2/xO1knmlLGulinO6qWGl461ldNylrnqkN+CepEL7GMRG0zjcSnBt9ES9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIbVDIfrlgOnTO90/jGeGXHFmgZaAmSgSHf4to0U37o=;
 b=nLgQIXSbkeoWsrG73Qq5yja2AxoJ1q7Z6wWZJFBlnMgP1dBOmnGPLZtHsiTHqJCEUKV/0yo/h9dAJchiNtdEKuFowfvi2KI6Cg+6MQWS0/nZ19szQKfaHECfwfv4B4Q5cR068WNlgqvBSCNoGdhJy3pjub5h8HMHpFY6GOXHpp0AULtoD8dMXp7YXGfYXdpTYyHECeytMhjRNu0nxQW8+1cFoK8jzm318yPR5x7QtekKFOkLEFZ3yeo550oH0JXY1mGEzfF2To68s0+p4Qpp7WFteAgzjVt71pccGMBH89jx5AxPLdRmOs35/zYHPoB23HvWsHfLSy74g9J25eVRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 09:26:29 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::84ea:da3f:8546:f002]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::84ea:da3f:8546:f002%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 09:26:29 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
Thread-Topic: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
 support form COLO to PRELAUNCH
Thread-Index: AQHYRXzmizOHXYyq0ES2uHvbpCCqMa0DnnYAgAAE1MA=
Date: Wed, 27 Apr 2022 09:26:29 +0000
Message-ID: <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
In-Reply-To: <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb4c7d5c-37b6-45a0-bf4a-08da28300277
x-ms-traffictypediagnostic: PH7PR11MB6055:EE_
x-microsoft-antispam-prvs: <PH7PR11MB60557295D2B371F03EEDFBA59BFA9@PH7PR11MB6055.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: me2r1Y+I+4s47uwB0iuzc0dOGkoDOIDCBNGtlfdXVMPW3buzW+eqMvasDANBynW5Km5YOSakLPG4tqW7mOT8FvH0TYZUx1eccvdRxHeUjTHrSI9f8ySm0Y2SHHUwTi4do+SD7rCNYPTsnSv+T6jBU71qsNYfHL23BiTI7e3ahOXt4iyILveXq6A4gy5o2VVDp1+itA8PkYBufZakZhTNMH2LoCNBV4GPz/Wgamb7fzmdSkHsXE54GlqRY18vQPI8HPzhcSpEiNRp/W0bBYdP2TGTN9dac9EwxPvjmK3Y7yrlN0Gd9opOsPzrfbiWeDivk1khJQUdfxgRwHF0unSylLWtR4HA7Ha/elU2bFdQfdcdF6GS7nx2ShqUCvC2wWk3VmjKOumC8Z2JBbbmIQDXVBqnDawHRzQ/YFd31qOlF2jZDn0qgkXY0EaMtzPv5mFc5BLJYQmyTOpVYm2dAfTFG3nlozCvx7V3aZodPE3zwDkIrydfk5x8BTgYmYkb8EEmdiKfLv5IcR6ALl1dGASZUisfHTCGjR8QHFRvgush6BhMdGSg+MhPMhCYv/tzrd5O+Z+0ZNrEf9+Bsba4em3R14ZmYZuYe7LmVhe+hT2bhYh1IUVpO4pIzR/QJD7CJLj+e5GxpKPXQ6fCukxtB661Up2ag2vqmCT93XJgy5f8AV5rGgQvy6Yvy3mpoNMI+HMmtfKDb5ghpDwbjWxrs2pJOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(64756008)(66446008)(8676002)(82960400001)(38100700002)(38070700005)(122000001)(55016003)(4326008)(66476007)(2906002)(54906003)(7696005)(110136005)(76116006)(33656002)(71200400001)(316002)(66946007)(52536014)(186003)(508600001)(6506007)(53546011)(83380400001)(26005)(9686003)(5660300002)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnNHWEFyY3doY2lxNnYxWjhsOHNwbEdpRjFWVmpNWDhHdms2dXFRSURsd3JB?=
 =?utf-8?B?NUlEZ1ZSdlBCTkZEbHF0UjF0WExIcldSSjZiM0g1Y3g2UW0yYkRHWGRpVzJh?=
 =?utf-8?B?elVqU0hrN2MyakNPdHlRdlpnQjl5S1VTM1d5UTZRNktWTUd5R254T0xGZXMz?=
 =?utf-8?B?amJFa3lhclFKR1Y0WjN1Ynd2aWh5SEhHSjYrMm9CK0FvUllRRk1tUDMyR2Vz?=
 =?utf-8?B?UUFHWDZTK1hOY1JUbHFsYW9VeGFQWkF5VUpNNC9jN3A4UjVyREFFUmE4aWM4?=
 =?utf-8?B?Q3p6WENUUThkY1JLQzB4bEpnRzA0eFdSRGpJZkFtWm5jc3lBUTFabXJnRUJI?=
 =?utf-8?B?WjBYUys3c0k4eVpsb2tLcDdlaTF5cDNzOXE1dEhKeXI2dkJEL2pMUEN2OXlm?=
 =?utf-8?B?bDltaWM1dHRYM0tJbXFpUHNPeU5rVUdXaFJHb21meWp3OEEzUUhSOTBVSzgr?=
 =?utf-8?B?QkJEcWxLZk02QmpON1dqSnZ2bXpsWGt1eVo2UTdvMXFnU0FiRHBXL1F3TDF2?=
 =?utf-8?B?bnNMN0VpUVZBSnhrQVc5SSs4QTVuMjFhSDV2Yk1JY0JNVTI2Szhud3oxRlpl?=
 =?utf-8?B?UXpWQUhDczY0TWlrWDB6cUpaTE4vV0RCaXBWTmVpUnFiVmx0bkNnQnY5WWRZ?=
 =?utf-8?B?dVZTUWkyRkhKOHVVbWMwdXNYNW5Dc3R1ZGJtbk1XS0l4d2VOMDNGVkJKdjky?=
 =?utf-8?B?bFh5L0Jwa3AwVUgyclc0QkhKRHZjam9TcnRMK0JZZmdJUmFwN0hqeEpobkZC?=
 =?utf-8?B?eDJHRG9FT09ORytUdWVWczBKeTU3UHkvdnExa25xNUNUUzhmd25qRy9pMW5q?=
 =?utf-8?B?RVZHejgxYU9waFNJSXFpODhTdkRRZGRTZ2N0OEE5VW5PdCtrZmVhWG51L20x?=
 =?utf-8?B?SGRuR0pzd1lHVDI4RE01VmkxRW44bXNkV1BxNE05NDQvMitPNkdCOE1xeW9o?=
 =?utf-8?B?bFBaNGtoaXRUME9UQUh5UnN5UGdYS0hYUmM5Tk1CcUVZdmdVS0dRQm5HalBs?=
 =?utf-8?B?M0hMbUkwQlBDTGE5NktzYno2SXpSTkdIbVhPN3IrU25qRUdIQnhpYTFIK05r?=
 =?utf-8?B?UnNwRGM5eW9oSnNuSTFOcm1ocEgxMDR4UDltemdTNDA2dkRFSGcyVnZpUHdL?=
 =?utf-8?B?N0xqSlgzenpRWGQwNks2VDR3QnlSTzdZTStnQWNnRGp4ekh0OERyVFgxR0hu?=
 =?utf-8?B?cnVLOG5aek44WHROTUR5ZlI5dXlTRTMwZjQxdFpmNzNXRXFDMmdwYitZMHZD?=
 =?utf-8?B?dGhhc1F2TExzYjY0SjVxRHFEYWV3ZEVkODRQNkZtOUlWWkttblV3dmwvTFA3?=
 =?utf-8?B?OEcwS0U3U1Q2OFN2cjBZQWY5SzRtRTV4RVdURTBMVGtuNy83OGdqZnprZnZz?=
 =?utf-8?B?bWRjVVlwMndHVlk5VTM2VzN1RTlYWGQwUmRZVXlzQVdGdXVjM3RsYWVhcGU1?=
 =?utf-8?B?QVYxVmdUN3Rjb2dWbUVkOHhub0h2STlNQnFSc3ZQM3AyQTZyYXlaNktVazNH?=
 =?utf-8?B?cUMzT1graHhyOW9vVTNWaVd3YmVIYVRtUHlLd3lRY2svVE9OUnhjL1ZuOUtU?=
 =?utf-8?B?YU02MS9lM2ZnUzhMODJtbktQTE8zR3lrS096QnNHeXVETXVyZ0ljd3lzUnFL?=
 =?utf-8?B?aXdydGlMZWUzVUVkaHVXYThONWRKMXR5QVMxWWhuZ09Ob3dCb2lDcjFhM0tw?=
 =?utf-8?B?YlBtOUFkS3lTelBmLzU1Y0dBaWNIS0oxRi9RNjNPT3pZajJmY3UyNmNqWlkv?=
 =?utf-8?B?emprS1h6d0V1Ty95MVl4Q3p0dXFOOGUrdEsrL3ZNdytIWkFMV2o0S3FZeTRi?=
 =?utf-8?B?d0dtdGtJYVVJR3BNQ0FIeE02amNmT003YXlYRVB0NHJjZnJkaGc2dVhJR2xC?=
 =?utf-8?B?ZUpPY04yMlZIMG1FMDNqcHlkMHhCaUFxdFFNc2pkSXhtZ0ZKMzRFelFJNUZy?=
 =?utf-8?B?WFNDMVRTZ1N3ZnY4eEdCUEYzTXZYR1E5YzFMVk5SdjJRSmpYV0JmNVZ2cjQ1?=
 =?utf-8?B?RDU0bGxhVE5UNnljekFIUjh6amg2U09jV1plem1ROXVFeVRSdDJmTHNjWVU0?=
 =?utf-8?B?dkNJSVFoVE1VOXJ1dUYwRDBJSFgvdysrVVQzY0grVjEzbTlyQjB0a3R1Tk1Q?=
 =?utf-8?B?Nk1TbDlndGxGeVk3NlFOVktMTDF4Y3MzNWEra1F4aHp6bzU3Qmk5bGgvVkZz?=
 =?utf-8?B?dXVqKzNkSE0vN0xmMlBKTFlCcW5pVy9FMGJkSkdmeDlTVnBuMitRejUwMkth?=
 =?utf-8?B?ZzNuN1VCdmhPaXFGK1ZjUnlTSW1nMGlmR2Z1NUIrelFFNXdGNmZnRG43dzVF?=
 =?utf-8?B?NGxtOGNyaWJZL0JwakVnTyt6MzhHbElPTHNIUEk3UkJXYTdrR0RTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4c7d5c-37b6-45a0-bf4a-08da28300277
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 09:26:29.0977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ieq567/V7zaVbEwur90yYwL54f9Ka816Hcv86Nc7AoGAsvZ4dPCVRFACyJQUrmDtsWQ5cTyUYbBhVqhe8doJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Like Xu <like.xu@linux.intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAyMiA0OjU3
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBMaSBa
aGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IExpa2UgWHUgPGxpa2UueHVAbGludXguaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyIDEvNF0gc29mdG1tdS9ydW5zdGF0ZS5jOiBhZGQgUnVuU3RhdGVU
cmFuc2l0aW9uDQo+IHN1cHBvcnQgZm9ybSBDT0xPIHRvIFBSRUxBVU5DSA0KPiANCj4gT24gRnJp
LCBBcHIgMSwgMjAyMiBhdCAxMTo1OSBBTSBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBJZiB0aGUgY2hlY2twb2ludCBvY2N1cnMgd2hlbiB0aGUgZ3Vl
c3QgZmluaXNoZXMgcmVzdGFydGluZyBidXQgaGFzDQo+ID4gbm90IHN0YXJ0ZWQgcnVubmluZywg
dGhlIHJ1bnN0YXRlX3NldCgpIG1heSByZWplY3QgdGhlIHRyYW5zaXRpb24gZnJvbQ0KPiA+IENP
TE8gdG8gUFJFTEFVTkNIIHdpdGggdGhlIGNyYXNoIGxvZzoNCj4gPg0KPiA+IHsidGltZXN0YW1w
IjogeyJzZWNvbmRzIjogMTU5MzQ4NDU5MSwgIm1pY3Jvc2Vjb25kcyI6IDI2NjA1fSxcDQo+ID4g
ImV2ZW50IjogIlJFU0VUIiwgImRhdGEiOiB7Imd1ZXN0IjogdHJ1ZSwgInJlYXNvbiI6ICJndWVz
dC1yZXNldCJ9fQ0KPiA+IHFlbXUtc3lzdGVtLXg4Nl82NDogaW52YWxpZCBydW5zdGF0ZSB0cmFu
c2l0aW9uOiAnY29sbycgLT4gJ3ByZWxhdW5jaCcNCj4gPg0KPiA+IExvbmctdGVybSB0ZXN0aW5n
IHNheXMgdGhhdCBpdCdzIHByZXR0eSBzYWZlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGlr
ZSBYdSA8bGlrZS54dUBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcg
Q2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IA0KPiBJJ2QgZXhwZWN0IHRoaXMgdG8gZ2V0
IGFjayBmcm9tIHRoZSByZWxldmFudCBtYWludGFpbmVycy4NCj4gDQoNClRoZSBzY3JpcHRzL2dl
dF9tYWludGFpbmVyLnBsIGNhbid0IGZpbmQgcmVsZXZhbnQgbWFpbnRhaW5lcnMgZm9yIHRoaXMg
cGF0Y2guDQpNYXliZSBQYW9sbyBoYXZlIHRpbWUgdG8gY292ZXIgdGhpcyBzaW1wbGUgcGF0Y2gg
cmVsYXRlZCB0byBydW5zdGF0ZT8gDQoNClRoYW5rcw0KQ2hlbg0KDQo+IFRoYW5rcw0KPiANCj4g
PiAtLS0NCj4gPiAgc29mdG1tdS9ydW5zdGF0ZS5jIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NvZnRtbXUvcnVuc3RhdGUu
YyBiL3NvZnRtbXUvcnVuc3RhdGUuYyBpbmRleA0KPiA+IGUwZDg2OWIyMWEuLmMwMjFjNTYzMzgg
MTAwNjQ0DQo+ID4gLS0tIGEvc29mdG1tdS9ydW5zdGF0ZS5jDQo+ID4gKysrIGIvc29mdG1tdS9y
dW5zdGF0ZS5jDQo+ID4gQEAgLTEyNyw2ICsxMjcsNyBAQCBzdGF0aWMgY29uc3QgUnVuU3RhdGVU
cmFuc2l0aW9uDQo+IHJ1bnN0YXRlX3RyYW5zaXRpb25zX2RlZltdID0gew0KPiA+ICAgICAgeyBS
VU5fU1RBVEVfUkVTVE9SRV9WTSwgUlVOX1NUQVRFX1BSRUxBVU5DSCB9LA0KPiA+DQo+ID4gICAg
ICB7IFJVTl9TVEFURV9DT0xPLCBSVU5fU1RBVEVfUlVOTklORyB9LA0KPiA+ICsgICAgeyBSVU5f
U1RBVEVfQ09MTywgUlVOX1NUQVRFX1BSRUxBVU5DSCB9LA0KPiA+ICAgICAgeyBSVU5fU1RBVEVf
Q09MTywgUlVOX1NUQVRFX1NIVVRET1dOfSwNCj4gPg0KPiA+ICAgICAgeyBSVU5fU1RBVEVfUlVO
TklORywgUlVOX1NUQVRFX0RFQlVHIH0sDQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KDQo=

