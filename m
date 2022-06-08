Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE2542A11
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 10:56:29 +0200 (CEST)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyrUJ-0003cf-Ox
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 04:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nyrOr-0000cb-VR
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 04:50:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:43069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nyrOp-0000RV-Jx
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 04:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654678247; x=1686214247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9FTK2UtHl9KdMQCcm/aeDGoqN7d1Db2IESLbzde+NN0=;
 b=eqXzcve61u9QCO0QyA9OLWFzTLvoGQ2ZzE4gPq99Tl28+igiOktQWzkj
 IEIhOOGGshp2NA4UWey0WE3eLdwDzvmxO7Ad0TnXDL/pXe1W0Z9P3Yq/2
 NnXPBUqHlDG1A1/dXx9QmoS85NFeurb0R0YJoDtv32KbIrABMbjeoGq4i
 tAG5bG4oPBK7IOsJDY5KbRwTGiYEvPAEbcbhvZYUGTJd7s1DSQrx8AC9g
 ZNF8sgQsCJFHagLeux3ieed7cAwZdNoMfEQzYtyVWB8Fv79C9H9Zcn0Zt
 0t/EgbfjLlcETq4BPR4nKU5UlIMRId6JsUGrA/ULs/udpsEhK32bDX3M4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="276849942"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="276849942"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 01:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="670433805"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 01:50:45 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 01:50:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 01:50:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 01:50:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=habnKb+B3DQHW2sPccSLvnmMDUg3lcviBzjKdMALdadNOPUZ1w7yP3QIvJ4t6vLfHexvNgG23cHTewPkWlW6YcwmuVmUrOrG6llFi6Ku//OkjkEOqJ+/SqF5pWKgWcV7MAA24gTklyL+G+dfCFdbPAOtnSUKkft6THCWu/4MfpQ4DYI1G9xiPIRpmARuglCBZEkQPvFHBJH/raqmVnOo2HBIR1zkk9cezO1Lp4jAulvgH3ssKBRUhauRid4PeyEt3Kmz1DtmoOs8FSUl7hAGHX63Y3xUeJRG/1tnGM4d7BHXumxpPQUJo0IWlV+EEkddN2QAUcvOhq8p17uwvWHyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRrvfBXovN0pUKfw38gjghD6fgmbRFA6cjMwf+BZXUI=;
 b=cnEcinpz0rrBINCe9ff+xw1YdAlzXKjcyUMnl1T0VzDce73zAePipzzc7eRia+YW7gJrQ0fP6iT8bBV/tSmgEWYqPbCF3pCvEn/iX6zXgERsghKbuenH3B1RO5rC1a5qYXRTKZhe3WvoOyDf8OfwUWEESf+CAdQTSc95MYKXYbOGu032GV2ci1EaiP25ivsAb7uuRJG1ANhoxfhFfF7VUj+6oRdCsaB7DipL0z3l9M3gZCfEEeh1z+8V0it+wvhuou/Y8kqOkJ9DzX81l7tEOxK6H2qa9dwEF74rA8QB2ezOSW/jTGbTNeuU9Lqm2JyA94Cnutt/ByS9hpNgGOVyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CY4PR11MB1672.namprd11.prod.outlook.com (2603:10b6:910:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Wed, 8 Jun
 2022 08:50:43 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:50:43 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Juan Quintela <quintela@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, Leonardo
 Bras <leobras@redhat.com>
Subject: RE: [PATCH v7 05/13] multifd: Count the number of bytes sent correctly
Thread-Topic: [PATCH v7 05/13] multifd: Count the number of bytes sent
 correctly
Thread-Index: AQHYdNzDqd1HQPqdSEuhN6+OiLC1FK1FP4eA
Date: Wed, 8 Jun 2022 08:50:43 +0000
Message-ID: <MWHPR11MB003129186398F5E4B23180929BA49@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-6-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-6-quintela@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a1d1a83-f33e-4d4d-72a7-08da492bf8e5
x-ms-traffictypediagnostic: CY4PR11MB1672:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1672A8EA0A3217E7D3F73BBB9BA49@CY4PR11MB1672.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZqrLLuMnMADVE5CpvsNzhEFvSkS1Dc4rhfmGx3jSLkNhm50g16PXqDyYrssp6onxsUbbFoIUp8BGUVLTlXoN3AvO6UsqDeqAEcnDJBhZmOhsLbfqPlvBMvSReBrOVUXKGYwYnU3Y3CQ6+D31pvdF/rN0urmOOeyQE8Ts8g3mZmtDApCKAzuT+WOl7PdHCIFzyZlX23yMRjlUfq9dEe2KGl7zER9AL+cPuOU/ZBQNcDRNSbbGUOVPiO8fIsw5RAYFA7fUOVhx/wp8YMJCY28Eq96NYFnG8XRetWnqS/hEKTXOW+67+KH6I7fc3LSF1x+ekyIiepvT8gn6YiThttzo4Wy3DqJox0gFMh0D0OkfGavR50rExcriIYOcvRB281aryiCDGGXQ9YORUosZh+L73ie/e9a4iJo8yoTaUQMrOAB4sxjVveQKA+KatIldHBmAvvODlfipPmhSDlKv2aOGXGyqFXWsNWPZsyKqN4yPPFtJhibk9X6/oOTYwni4wPW8IF1yV/NDsLRalCfnL0CuPVc9PF+MK/lwyb5Yc3QYQugT+ZH1r0eVXUFYaiKhrGLoV1OuaHQ9uECTXTyguJ0tNjk5ldlePpJcSXutpOVQegI8hFIcG3QnZgdypm/FJb8j5Y2Q8BwO/vQvbM2mIYVXm+TT3Nc+UT8LXL9NnICkZGKWErOTAhjP7pHR20JiFmJv5y7wCbsdLHDtelAtCvItjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(53546011)(5660300002)(52536014)(4326008)(66946007)(82960400001)(76116006)(8676002)(64756008)(66476007)(66556008)(66446008)(71200400001)(38070700005)(83380400001)(508600001)(8936002)(86362001)(122000001)(6506007)(9686003)(186003)(110136005)(316002)(54906003)(38100700002)(55016003)(33656002)(2906002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LP0sFjseZdtT/+dciLrMbHz3o5dTvZf0HQTfZm8hJZsS9QNYLdAb/bY++6?=
 =?iso-8859-1?Q?syQdDOhKOk8ESa1kHpmH16eNt6MIIYp6uT2sK548MFcQ+ztx/eQJUV9TZR?=
 =?iso-8859-1?Q?WKglwC/mR1u6w/cq+woM6syIYBbO2yZA27+rK3G5OfUHJnbQ+RlecFYuXz?=
 =?iso-8859-1?Q?5rDqNbh6tZCL2jJDg9M0kBzaEYdLZhOmCVVYobm79hUZLfKpyJRa9ysgjq?=
 =?iso-8859-1?Q?U9jzRHo1K2yB7iNS9+sJDBIV0Rx4y5AceHV8XF2T6EIosj+IhuR+yze3/b?=
 =?iso-8859-1?Q?ObVL+nq8/TePkZsxWlU6d10gUwnjvCkLc0BfMbIFgwzJf77tpwYtDNWerC?=
 =?iso-8859-1?Q?FW+ZO9jYdnMgWH63Q5Pg+zRozYA0TqVLjseSYDH2oSWqhseg+YcvxMAmzO?=
 =?iso-8859-1?Q?+GP9ufjlB3ZetBJI9yOAZlHTLylP2IprSdcfwq2k0mdepAJ7SFK0XS7PLV?=
 =?iso-8859-1?Q?6T+MNea0LPDAJEvyzaaeKGvzxGDfXbMxtBX2+6otgWdS3+Ws1pcTHZvM9p?=
 =?iso-8859-1?Q?H3MfNf5Nr49lDYufeXRvjHH0watF3Sov24rR8GgafOCCYUiTiIB1o4sTCX?=
 =?iso-8859-1?Q?yDng5cTNgRlcNOFigqiEN7ooHTauHZsNljUcY3BpZlb+LgmzbEj0vvKQ2j?=
 =?iso-8859-1?Q?CgH6lqOr6Lpgxw+rr6ygf6aYB872P4lcXtq8r5FUzZsR2LxZ9kLaTalUV0?=
 =?iso-8859-1?Q?qp7Sb2NClVKeMMuPQlIaUG9aq3KTKnusRnd/CVDoGduzH4crQRqP3ia3AY?=
 =?iso-8859-1?Q?jmvM97fLklj586yGb6JM9ApuKCDwm4a7fpKYWftnGf+7hE3dBuIufH4yxT?=
 =?iso-8859-1?Q?poLrPPMuLTfr2WHLz7+q41UAVX0AruSAlVi2z8mMKrIRAoYUqNhZ7rk/dK?=
 =?iso-8859-1?Q?MShKRm6AAFqmTiu8SKAoONHsU0xkDT5zqdzpw/IS6Kim87YVaU4dg/cmzw?=
 =?iso-8859-1?Q?eCgaytWra9ju5B8/fGfaavpUwEvNFdxL/DztunviVm+XvaXCNqnRApcVei?=
 =?iso-8859-1?Q?RbQEknMh/nhJT/VfdoXWgH9NfJ2GYGA+/0BwgKO9DfN/hO3kPrp/jPSzLD?=
 =?iso-8859-1?Q?r0izwv1AWm0UruGBtO8pWbD1dUl5hPG21E2P8V84I/GWo3q1ossLS7idJC?=
 =?iso-8859-1?Q?s8HGwAZ92BxF01kVO67ccsxQumD6omh/hPgHxu2/GohMlciETkp/YWHlNK?=
 =?iso-8859-1?Q?KENC8JoYItY5U0X46RqHHfE4WmJpcViURux0K/KvnHVgTysmPWfM9WZWxR?=
 =?iso-8859-1?Q?/2epTHsFtcmMCMaRmOaFu6kVup2jG3e2kTImiDHvSKi1s9bXDgaF2W9akL?=
 =?iso-8859-1?Q?0Bi3bHZ9h4ulDjCkMzwn4KHKrwVYJv8LNouuauYLKxGumnwRzF+yJ4GEgW?=
 =?iso-8859-1?Q?WFhc9Ajbnlvr4IcOLyyZ/0qrJrOFjUMyWpTDwEvkMdJUpdT5M6Z6DpZvyz?=
 =?iso-8859-1?Q?sq9LLsbF+MgSjkDFKVAOB5qj49i+MGcXhAtTHZ/T9AztZdgs5LMZv6aqKA?=
 =?iso-8859-1?Q?TtnUC+3GEfoeJxHbXzThbk8AW5niUuvm8Hvpn9aoAD2Unn6zhxqUVLH38K?=
 =?iso-8859-1?Q?g0aepRZN1EclKI8shX3oCJ7OtSFtFA10th6SNyOyCArl2PBYeAKuC1Mcik?=
 =?iso-8859-1?Q?psjnbzC9kLJXumBafrFTxbuVXy/cKz1M2lU8SKKgPRSJW6hTPI9FnKW5Xk?=
 =?iso-8859-1?Q?wi1nO15bNr7mI7Y/FBbIlsCtEb2SwCCqDFXh9AjzNEre/drsF95OIS+mSR?=
 =?iso-8859-1?Q?1ORc2LhCCw86iqEVjbBslK9KPbuiAASYiGhQuxbxSbHn5jKOcx9pvYP9L6?=
 =?iso-8859-1?Q?nrpQQVplJQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1d1a83-f33e-4d4d-72a7-08da492bf8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 08:50:43.4085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfswmUWfC3agYFj9Glv1r46m1N2j67OCUFKi3ToosrN1VOaWG4JeqHKXdYU1JeZaHzF/7tv984+RFDv03LUjxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1672
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Juan Quintela
> Sent: Tuesday, May 31, 2022 6:43 PM
> To: qemu-devel@nongnu.org
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Philippe Mathieu-
> Daud=E9 <f4bug@amsat.org>; Yanan Wang <wangyanan55@huawei.com>; Dr.
> David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; Eduardo Habkost <eduardo@habkost.net>; Peter
> Xu <peterx@redhat.com>; Leonardo Bras <leobras@redhat.com>
> Subject: [PATCH v7 05/13] multifd: Count the number of bytes sent correct=
ly
>=20
> Current code asumes that all pages are whole.  That is not true for examp=
le
> for compression already.  Fix it for creating a new field
> ->sent_bytes that includes it.
>=20
> All ram_counters are used only from the migration thread, so we have two
> options:
> - put a mutex and fill everything when we sent it (not only ram_counters,
> also qemu_file->xfer_bytes).
> - Create a local variable that implements how much has been sent through
> each channel.  And when we push another packet, we "add" the previous
> stats.
>=20
> I choose two due to less changes overall.  On the previous code we increa=
se
> transferred and then we sent.  Current code goes the other way around.  I=
t
> sents the data, and after the fact, it updates the counters.  Notice that=
 each
> channel can have a maximum of half a megabyte of data without counting, s=
o
> it is not very important.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 ++
>  migration/multifd.c | 14 ++++++--------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h index
> 71f49b4063..8a45dda58c 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -102,6 +102,8 @@ typedef struct {
>      uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
> +    /* How many bytes have we sent on the last packet */
> +    uint64_t sent_bytes;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent.
> diff --git a/migration/multifd.c b/migration/multifd.c index
> 166246b9b7..eef47c274f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
>      static int next_channel;
>      MultiFDSendParams *p =3D NULL; /* make happy gcc */
>      MultiFDPages_t *pages =3D multifd_send_state->pages;
> -    uint64_t transferred;
>=20
>      if (qatomic_read(&multifd_send_state->exiting)) {
>          return -1;
> @@ -429,10 +428,10 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num =3D multifd_send_state->packet_num++;
>      multifd_send_state->pages =3D p->pages;
>      p->pages =3D pages;
> -    transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
> -    qemu_file_update_transfer(f, transferred);
> -    ram_counters.multifd_bytes +=3D transferred;
> -    ram_counters.transferred +=3D transferred;
> +    ram_transferred_add(p->sent_bytes);
> +    ram_counters.multifd_bytes +=3D p->sent_bytes;
> +    qemu_file_update_transfer(f, p->sent_bytes);
> +    p->sent_bytes =3D 0;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>=20
> @@ -605,9 +604,6 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->packet_num =3D multifd_send_state->packet_num++;
>          p->flags |=3D MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_update_transfer(f, p->packet_len);
> -        ram_counters.multifd_bytes +=3D p->packet_len;
> -        ram_counters.transferred +=3D p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
>=20
> @@ -712,6 +708,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>=20
>              qemu_mutex_lock(&p->mutex);
> +            p->sent_bytes +=3D p->packet_len;;

Typo here about ";;" ?=20

Thanks
Chen

> +            p->sent_bytes +=3D p->next_packet_size;
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
>=20
> --
> 2.35.3
>=20


