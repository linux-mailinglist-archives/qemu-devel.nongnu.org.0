Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8339559307
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:08:36 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4cUd-0007GV-Kt
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o4cSE-0005YF-3e; Fri, 24 Jun 2022 02:06:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:31554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o4cS9-0006Um-9v; Fri, 24 Jun 2022 02:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656050761; x=1687586761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nv4U0NBQSnVKKyWlJzbmeLKnkevWS/Xt/kCq6H5vHFU=;
 b=FqfoR9bCOV19BmWZI4x32HPXURGpTG3Ri0FUeorgFMKEDCQVyAPnoOl/
 wz0IoWsBdRS4WdGr3pL5o1tP4+9n7qkg5XA3T9WmIWRJk1FLYB12RPiyv
 WzOSPiV+LSeogwNU8FsnINH7UMSMPhtcbIAZdJnlB16poEKYgf5WmmdMu
 fBkxGGSNZ69KyyQCSK46wUwzcgXPgknXFtKJ8cx+9NU3h6oNr5UOcvitQ
 u+8rs7Rkpf+d+L+2zp1IFjagBlAGuZDdBJc+VzvX9hM9Ft4mMH41doqUS
 vAIMGXgqfrKi83Rkz1f6wrQkNo+COwXJvG7+O7ZRsoVIgnAQz4lBW7XtA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="279697644"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="279697644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 23:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="716120344"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 23 Jun 2022 23:05:53 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 23:05:52 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 23:05:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 23:05:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 23:05:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFnCeKkgk+B+1Gbt50aOn0q/9TM9OD4cek9/AFX1fH1Oh3lrx3yEVmkrR9piy+/nIZ7AhdVpxeEqZBX2IGDGFFwjCVZzMhKcR1SXxKCCdaaCBxhAbEXQcPdlQsD5Ggrlrpfn8g3SQrHGBymwNmtcqIaqug1xSia5Lb7x3Lsaeul4+dawzufDpv4T7wG95LrAejUcYwjh1Xzv0KTeCnjBRjwMvJvhzLgzRvmozNoRAPDUGNhg0nD36AcGMRxQM0QQoacVPml/c6wvml1rH87Rhqrf/lHb4X9/Oqz73mlPKxnNp8nANaE/lPf77bAtLJEBsy5W+Mr0oezYXHdFEJvWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHHmgFabPGm+azG4iQpjUnxKPrv8yR2uajeWsvGAFr0=;
 b=lrsUakimL0FDLOxr+9Xfq/d+COOWl1A8p8mxbGB56BZqiDC1o6E8EOjONrrD3p5+OHli1Fjmd6p3+XZN7qmNyKmoY2tW97/QedTf9A/+iDECL1uhPcovFGhkedb60KafLQhVrxPxcAq9Q3fujQQNXV2hkhgOmUxdrk8g08gvsNgpcvBd8C31C9XgAl2zMdidSvv8oqx22tQikb6be3VeMn86aznyAViRHn1KuInE1J0prwc0MEOsCi1SHcNnBPRkh+I5yVSSFrBf+kxSlbj9Lm8pyAKnK4mIj0qm6hG/4Z1u+guHmApyFDYOmm+RfwdsLCzzIajv+sPh1fEGEbUQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CY4PR11MB0037.namprd11.prod.outlook.com (2603:10b6:910:77::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 24 Jun
 2022 06:05:50 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 06:05:50 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>
CC: Michael Tokarev <mjt@tls.msk.ru>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] common-user: Only compile the common user code if
 have_user is set
Thread-Topic: [PATCH] common-user: Only compile the common user code if
 have_user is set
Thread-Index: AQHYhkFTepY764/lU0itO3P/HG9nUa1eE/2A
Date: Fri, 24 Jun 2022 06:05:50 +0000
Message-ID: <MWHPR11MB00312AB5FD51C3D313F24D3F9BB49@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220622140328.383961-1-thuth@redhat.com>
In-Reply-To: <20220622140328.383961-1-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0abdf24-426a-4bd0-f94e-08da55a796ab
x-ms-traffictypediagnostic: CY4PR11MB0037:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pzHh4UWdhsLc/81rVBh1g7Sm+5IycTFR6qXqVjoGdtqfuBaPUVs7tQGP9agfCiW7B9Hpdbs6/9/2Syfdh3IEcrdmWKihAOrnPeQcwHSQFRGdW7MBJn9ye4MrCrweFunfD5wjDGCQf577k+DIJ9y24mEF4+nzEuXs3eGh2ndJbzMOQD0QxzUyGpbsjgg2nd2A1609/Pkfk+gyKzK48c/MSGvpVJ9UQrwsibtDoYsj/QfBVa+3qdJUqYKjeZQwhE0OydNxthk8TIHsRQL9SbdNnURGr/9qrZEcaiJxD/DYcCJFR6jNXyydwKgLtPjSmnMH4QHM/HQI4pXBtWnA6dBCSK/FszSGilJjiNb7Ruq9EwOCbF8ihuUmyElkqGtjSOTo2BnyURSkBJXTRWfI4RcNzFbxFoQXFccuJYrvXxnAaHUNLKmHKR+IOtK0v0laTDKiRgESAKaGmM6Gl2CIt6QZF1TnoBbxp4cyyVjMQeyi2bd+EAMwntCTIZTMU+NSuRnT45Wn427VPmOu+YdXYblIe4S3qNW31eFmdunrhEtoqTaPnHN6x8LxsbsquuaYf5BovShLgARVEWLOylQ9/uZIFxYkEpBNUvyNaEZzyclOx4CKtZuTXwzwz5coRhF9IVC0VmGrBOb625PEPraf9eSg8GUycQo/vJ8kv4CqtvOC8mYXsCtiHOi6GN+qNb500tp51nYl80Uw2TAAo5E7hpzkLtzFzo67biGIBrTLblhQM/22mdksmtoRlIsK7kf6inbM4LlOTR1Tg21WGvH1MSJ4cTMnbp0lZ9D8hOuJmCeKCyg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(366004)(346002)(39860400002)(136003)(66556008)(66476007)(83380400001)(66946007)(4326008)(6506007)(66446008)(64756008)(8676002)(26005)(53546011)(7696005)(5660300002)(76116006)(186003)(52536014)(8936002)(2906002)(38070700005)(86362001)(9686003)(55016003)(110136005)(33656002)(54906003)(478600001)(82960400001)(122000001)(71200400001)(38100700002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qbZZP4/HzUUzq4ODFPpn1M3RXTEtSvkqZ2TTyQUMXfRwVCX2qIwgiKNm9T2D?=
 =?us-ascii?Q?coYKm3sz5uV0LjysUazwOboFks3PugZ+fRr2EW4u1uafAoXom0t882USUm1S?=
 =?us-ascii?Q?8s16WwpshQtPWe0BRaGrn7+2kQiqj2FI9f7Js+GKNNA1tby4X+3nJecbyiPr?=
 =?us-ascii?Q?aKyfIqI7aiCGQ35smA2nkK38f9tUaWvCt5/xX30HMIdEXUteigOs21mZ9Bo6?=
 =?us-ascii?Q?zWtskqwI9j+SLZEgnHMolSaFC4SoOXhSkYdKLF85pMzMrjqQECt6xtBB8MS9?=
 =?us-ascii?Q?eGxQB3yQDxb3TUcYrNz0VO8B3bMZCHMGIo3UmpbvJnIb09uOjmhoc8LFD9+X?=
 =?us-ascii?Q?+dVkP/0pmgGQ6mWXirNL+Jagi8lBayqBB337eY8JDmiNj09leQuWXYUWICti?=
 =?us-ascii?Q?mMyO+Cp4x1EzlunR0LpaP0SrJwZqhZdwTIKoCPMJqbQevW9vvyCg6/YBeSpe?=
 =?us-ascii?Q?aqT/oOC71sMKXjiUgPYFTXZnNLrcpct3F4zSXonp4qSvQc0j0VGLrRk3heP4?=
 =?us-ascii?Q?SAQ+XZEIiAKUNYR5JH1twbRHn2W1tte7QY648qy+yv1isM22IDR+gPX7pFT8?=
 =?us-ascii?Q?HpJqRVtkooPSArVs3eaRJ/KOCpU2pdSW/f2JmxrWbTTCOwCNPrfaRUxrloLQ?=
 =?us-ascii?Q?11qdvCrSwpPRLffmXSOaVFq7NPgajb8ykS24bRgVx7SJ7mWVe5hxZOrbQ6U0?=
 =?us-ascii?Q?FGX/vL1WnBGkJqW22eVJ/C1LxjL2vJK3nJpwerpaH1EiIax5tExQv3uuI22t?=
 =?us-ascii?Q?2/7ca2PXoAQESYVpalTQ8pn8fcGCPR7jzEV4dCXElzU9Yz4vZJxZjsODqVWe?=
 =?us-ascii?Q?9/PYwzPQ8qzTn6moQH5kjcOMmJnbGBipA5+9KqjBCpkap88WL1uJARe2u9k9?=
 =?us-ascii?Q?1dbsd1+Pxz+Po9DuHD90Vq0qvMuNhtaat7R5kKOEPAG0fn2uheht8k++kjcX?=
 =?us-ascii?Q?jLPX28FWN8lIMfOQ2xzbumb1O28k8NpXqa/jWZkqgbPfnoPXeuWAYnNQPd2t?=
 =?us-ascii?Q?A7EJKPAJUzHF3DHR6OWALUAJ/3zd7PuRJ4bPuEIwRPBAAKc2p8XG7SmmShYc?=
 =?us-ascii?Q?IIvOXGK2eu411i7HLk1cJV75R8nDFLfkG4Btjioii3q1VKb3ePby7xbtfig4?=
 =?us-ascii?Q?UUIRLKaTrfp1ZVLV5OkDZTZCa1a8dhZz8dtLWu+6AclZPeArkovx98VYHdSj?=
 =?us-ascii?Q?XJ7zyf8yr5zU3Ppw9ULj5fdFPSTI2Bx9ip1iGRqtihYk7xElfiyUtgE/iDEB?=
 =?us-ascii?Q?HcUh9BN4nOfujUZnVzZeAXj4Lk9CZfEakUJZW+T0Xuk5dObdZ6IJRMCrLbaQ?=
 =?us-ascii?Q?pXKdNy+TOQq4R36pdD1IkKSW5Vcp22kDyblVLpb/FVKDUb6Gx7dfBMuhCFQB?=
 =?us-ascii?Q?ZQqApyui66GsdgAj7Zn760wtX/HQroPcP6+HwF3B+B2LhoH+KEJD+7XJkhIu?=
 =?us-ascii?Q?9jdV0vdcrtkJLltb+6BZBMYUTw5eYmm59ANbMZ1AiNVuwjDmIPZR8+yRO/Bw?=
 =?us-ascii?Q?Y0O1slzUTyCVy+/m6NXOK/9F1EFzwyTXqzALDNLBYRMH4KR0zZXnFQn+CD/Q?=
 =?us-ascii?Q?cmL+DtQF7d7Titq1yWiujj6D9BZzZQBXxDG427GC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0abdf24-426a-4bd0-f94e-08da55a796ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 06:05:50.1630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVD26s3ex3e8BxBy072USehRbg9Zjmzrq2XniGaVsBGXTrEfM71T/RcYktwUCmS2q7Omu/ooN2SdSexrRAuNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0037
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
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



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Thomas Huth
> Sent: Wednesday, June 22, 2022 10:03 PM
> To: qemu-devel@nongnu.org; Riku Voipio <riku.voipio@iki.fi>
> Cc: Michael Tokarev <mjt@tls.msk.ru>; qemu-trivial@nongnu.org; Paolo
> Bonzini <pbonzini@redhat.com>
> Subject: [PATCH] common-user: Only compile the common user code if
> have_user is set
>=20
> There is no need to waste cycles here if we only compile the system binar=
ies
> or tools. Additionally, this change is even a hard requirement for buildi=
ng the
> tools on systems that do not have an entry in the common-user/host/ folde=
r
> (since common-user/meson.build is trying to add such a path via the
> include_directories() command).
>=20
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Looks good to me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  common-user/meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/common-user/meson.build b/common-user/meson.build index
> 26212dda5c..ac9de5b9e3 100644
> --- a/common-user/meson.build
> +++ b/common-user/meson.build
> @@ -1,3 +1,7 @@
> +if not have_user
> +   subdir_done()
> +endif
> +
>  common_user_inc +=3D include_directories('host/' / host_arch)
>=20
>  user_ss.add(files(
> --
> 2.31.1
>=20


