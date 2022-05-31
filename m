Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD3538AFF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 07:45:28 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvuh3-0007o7-N3
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 01:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nvuck-0006q2-0M; Tue, 31 May 2022 01:40:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:59054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nvuch-0007ZT-9S; Tue, 31 May 2022 01:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653975655; x=1685511655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kChrtYKU/M6LQ7Pwq0xKo7KTluHymW1Ohe5Og+VEuiE=;
 b=g54JfLYljzGyV3K2tCM1YXdcqx1jc399AzShrfRH6TLd7bvDiJh32T9I
 jBH3ZCT9sTZh7lgB/xwUz76SYkjUSmnMpAGB5TaQsX6T5a6JMpa+liokk
 GMGKsoVhI2bPtW2rXlxmf8AhjQdNwIQ9V5CRPGJ3JgwuFmF+fX12JHtHv
 LcghPs+BCl92Z4W1pqiiOtzeO+264tOUvalTiCHw1sf2MNKyE22sOEQH3
 bu48QVWKrkRvjT7qXHrP9+BBedYNG4ECbUOFvN+IJdL+YBjQJGQ5rc5No
 svfptTlZ0IlAt/5Mt6NA58G/JsqLNIfQPkX2qTYGWzCQelmRjIvfCqrKR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="361521609"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="361521609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 22:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="903817180"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 30 May 2022 22:40:46 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 30 May 2022 22:40:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 30 May 2022 22:40:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 30 May 2022 22:40:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 30 May 2022 22:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjtlvzRDhDWWG9fkFdcOT0jCFHe6eLjqePYJf9fBCI24bOqU3yNWfBCVRFOPV/ko+jm9v6YShZUgkQNdcn+JNd5DX08Gxae8/pAKZmhPjJVFpvtufiv9paMUj1aUr8TR5t5eEvFgsftd9Px7pFZlRSUsoQHlNowr667h54MoV4FFR9wt9UhMTcLYDOuW3XjHy3rN31shyn6Dk99CwcuQFHWFmyndsAF/1Lf+j2g/zQvJbM4pY6i/GTZmuj4wGjmN9cKmSaaAAAo6P1U5YEK6tGqCE4MqRxFURlRMxC7YDlzw6Puj20Hc5VnHQaj+awQZ+Hb7ZR8zg9gIh2IZowvtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwEqlsv7pcrV39RbtMio+eA3m3n/sFTN9YapNnMgSDM=;
 b=M9/vuJ2oLh0D+9ZH36m3ax6HZWX7UylTveyHEFl7jOegf4zF+2LYDKACgOIZCwgplNB2asz8XNIu327Z8mXcMxO6q+9cUXtqDoFS6qCgRhOdUiHPYU2eVYbi+KA9aN1UXMHabYq7gF7PIAy4FveDnZ9WXyP4HxEymfYDiwf+FgZ+PYgNtiDPBtiffGSeN0pSi73EjjtkQxizPZaq6x8rpvdLw/RQm5fMODAKtvKNlegJSRwHgGmVDf6oL+7ROztsWmpbIt7A7x1WyO0SGM1MXRnwBroIsiD2TpV1n2Hu2ZPyCV7WA2Cg2oxcWMW6gItNKqOW2BJxDCebrFJ4GlZabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM5PR11MB1770.namprd11.prod.outlook.com (2603:10b6:3:10d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 05:40:43 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 05:40:43 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Haochen Tong <i@hexchain.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Andrew Melnychenko
 <andrew@daynix.com>, Yuri Benditovich <yuri.benditovich@daynix.com>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
Thread-Topic: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
Thread-Index: AQHYcgoov5ZrG3k1EkSiYzh8/yC7c604etQg
Date: Tue, 31 May 2022 05:40:43 +0000
Message-ID: <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220527190658.169439-1-i@hexchain.org>
In-Reply-To: <20220527190658.169439-1-i@hexchain.org>
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
x-ms-office365-filtering-correlation-id: c02c6fee-526c-4483-dfcd-08da42c81a87
x-ms-traffictypediagnostic: DM5PR11MB1770:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1770D9C9656FD19239EAED2C9BDC9@DM5PR11MB1770.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7EnphxPxXtoWfPmxKJRzToveUR+KjJ4lF/VtYM/I9BLGwfkNXfbBgWwzLNhIQGSiuQ80sOQu+v1kc4d2eHGehS7cYwoBfXQqs7HX9ozppDnTi9WiShPHN4fjNVApQlYh+vm/laXc9zCqbgmyQES/d4sODBxP2xBX+XPWBK3pytczhevfFujx4rvdei6E1q3gcFYkm4EiQdk1HpN5BHD2HYl5CTHM0ZjESSn+ykfHma6i72fTIvtGklmtxmzkOkFDB5jWcpC1BIjTiExLyTYs7SZmeueHC15WzmVWhIb7w7SULiS4cT7N3ASYGPSP4ZIPuy3d/P+PBBf5rZ1lW7o4yMWdnZXrNFz4brqfrc5l0O1H8XgYaRs9kAVUEPfhyOpE1uIxGn1zwzdp7kB2EHI3OUTFW4e1x6ruXKZ7VaUrVPgP2iEhj+lddfMbpeZM/wEbI4pLYwuGXBMdsBDeop5oWdqR/7p1WBiSeEBnNZC6phx/3LToJAKpARZQ4F/dO/xn2o9Gx5qSvuXnaiJz3p89bZRoHAZQrohFfdXiu0H2g493O3sG5M7XX3qjXW2bqfxJL9TVRod9HPSWzqouP8PORwqdhqKE740sA1Gc2NbvtidE1gkl12OxrQFzT5NGS3RIumyE5quXFuWIjpqwnED5nH9Z3seIbPghxmFaMtrhIlNHwTKCtOyniGlvbEgkF0fuAVw/rV9c9/B78fvspXxGliLidXVqeilyPr1Y9zJRm+Pn/HkOTF0XZQDewmgCZUFWG69E21dwhPzqaC/bc8XM6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(26005)(53546011)(33656002)(38070700005)(8676002)(2906002)(110136005)(316002)(9686003)(7696005)(508600001)(82960400001)(86362001)(122000001)(71200400001)(186003)(38100700002)(52536014)(8936002)(83380400001)(64756008)(76116006)(66446008)(4326008)(66946007)(66476007)(66556008)(5660300002)(55016003)(101420200003)(781001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FUSLnDp9Ii0Pvw4WwvvsucPBYzgHb5oRUbC8UTtHCSTgj0toTtk69LPxbRXX?=
 =?us-ascii?Q?iLPrV4YA//z9g9JFHUOCjFlqfrJMi5/MlsuP4tdaDcTDoQSpbdVaJBnuHsHs?=
 =?us-ascii?Q?08/0pZIebz2iYjwaRfYyvN2LiglJ85z+pKGSvrRg+xLG1lKdkHIh87RTu1mK?=
 =?us-ascii?Q?k62GLBv6sP4j+usxnvLdmnUofSLg7KkUbJEbSAMHiyuzskzzh8RkNz1b1KRn?=
 =?us-ascii?Q?jfXcsP3JgSNjHEq834AnSwwRete+hUZWUqPaxVJCr8sGfNgwZmDKmKpaCOSZ?=
 =?us-ascii?Q?hqagzqkOnpnnA54D5GfviLtCoPTXGQX2v3kOMQUOhXzDzC5DGg32aeBEivkP?=
 =?us-ascii?Q?ROL825JOErBhpNBzQ7KdHiR/MqMNRKuVsRsRUAvmRVnSufybBRR7q3aR1Z1e?=
 =?us-ascii?Q?9E6DuALOObgAhOwLhYwR4EjyoPnSpMlC5lbDUju8yKP77lVVCwxGXirm0Acm?=
 =?us-ascii?Q?DEVISyHjaVN0Tt1qzJ/UtjKZQYvhBAooZeKZhwpnTpVov1oKI/NklQ4rQu/2?=
 =?us-ascii?Q?ncwY6LNeOM+qVM4zr3MD0TN7x3tkqlW8lGFMw2cYvjDQhLnYu0K0kZaOs6Ep?=
 =?us-ascii?Q?Ed8pU7fhVhdKMAcCiGO7INBDFqU0Nz9hdxst+FW86q7p4+xFtRCHWz8HTKZ8?=
 =?us-ascii?Q?Zxm71fCf/nAJf6/b3OlhHwQ3buz5c6mCBtdbfqq4FZTvpShBft7/Kpsi6UcE?=
 =?us-ascii?Q?NDCvt8CcJPYoZOhiIXuqL1h5TopGJkiOksJ2+8ZyOHNmhd2c1+kTLPlcmDRE?=
 =?us-ascii?Q?uBwxKkwLBfQ6S3LF7n9UZ9mVmb+6/d/wmcshCtM8HP8TQ/b0gsvE6OFvGB2a?=
 =?us-ascii?Q?PkR42s+XuI9qLCQY6mz9PkDK8kPMVKQc0Qn+SP+0DYRL2XdvY2hAi8LfnQuh?=
 =?us-ascii?Q?IxzK5G6S4WdblZ5DRg+H7aZfgbsXGy5ovvxV3SWEGG744mXzeX3Hzck5E8G+?=
 =?us-ascii?Q?jqcLsG+FvU7my0MY/n/YiV1g6WjKOfqsmTvMjkDn6j0ESB5XSNqPPK8N4uEV?=
 =?us-ascii?Q?dcYrrtJxAjCxI2Q8hmudmWx6USupn2vDOuWK87oF0ZhNVaPZ74ZXwejpf47C?=
 =?us-ascii?Q?+mSHtQAuRfoTKhUGSLSmmayMgAGo9+yYs9ZUmOFrNRW7g6UpdXPmAw4d2KKc?=
 =?us-ascii?Q?wUCeuHLufpLGAJYYA/Os54nbmBQRolVBPCSkyM9ubRQfJubPmKgPAJ5zTOzg?=
 =?us-ascii?Q?wLOFIlAWUYUukAd31H/kPj/ZUDM4al+CcFMCR/hg0DXk8gWSE6TPliRb55cG?=
 =?us-ascii?Q?IPuQ1uGIJSlm0Hjtl+SZVvROQkVaE/gVSYicesdFMIgLAnwpnPhMWYl65ey+?=
 =?us-ascii?Q?iAPiG9UOC9R96B/D44+DwnZTKics2/xeaLFd1zA/b1woiWqfRnWgryhNtExL?=
 =?us-ascii?Q?IUs2EM3vQNUDI9ToppVaouoyBE6wNOVPv/+9gr+CKEPny4mrJVZpb/5dH2tj?=
 =?us-ascii?Q?jP241Z8bTvi/28Lum2HttwPz9SMt4ZCHQ0uZQO1vzV+Mvk8MkHSccK+hgmjf?=
 =?us-ascii?Q?V+buYk01LXCMu2mFY+WAFO0gaUhAG2NoCUBcxq8Y8oXEp2gEmgzH0uxgL/d4?=
 =?us-ascii?Q?UpDut1keVqR8r9KVVHvOdujiXGwT+fF4gzo2sJDuzWb+444o3y3iU06bS0Pp?=
 =?us-ascii?Q?GXAACCBKe4XPcaglS1E3Z+grtsJUMvTr4zDruGstR8EC7scJA6fp+jvDdSSq?=
 =?us-ascii?Q?GPUsfWjVhE3OwbrIfG14Dx8gR/E6j954Syh12130q+66uCCgXuly/eVCpDzL?=
 =?us-ascii?Q?5poEtmd2gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02c6fee-526c-4483-dfcd-08da42c81a87
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 05:40:43.1726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+JWigBRveAxGlMwGaQXFWtqwCHQUv8WVyyY0G56ImVM/g+H96hILQ76BgOLBwz8qOIHmzBof2220f74YWuGsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1770
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Haochen Tong
> Sent: Saturday, May 28, 2022 3:07 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org; Haochen Tong <i@hexchain.org>
> Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
>=20
> bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
> Replace with the equivalent bpf_program__set_type call to avoid a
> deprecation warning.
>=20
> Signed-off-by: Haochen Tong <i@hexchain.org>

It looks good to me.
By the way, add eBPF maintainers.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  ebpf/ebpf_rss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c index 118c68da83..cee658c1=
58
> 100644
> --- a/ebpf/ebpf_rss.c
> +++ b/ebpf/ebpf_rss.c
> @@ -49,7 +49,7 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
>          goto error;
>      }
>=20
> -    bpf_program__set_socket_filter(rss_bpf_ctx-
> >progs.tun_rss_steering_prog);
> +    bpf_program__set_type(rss_bpf_ctx->progs.tun_rss_steering_prog,
> + BPF_PROG_TYPE_SOCKET_FILTER);
>=20
>      if (rss_bpf__load(rss_bpf_ctx)) {
>          trace_ebpf_error("eBPF RSS", "can not load RSS program");
> --
> 2.36.1
>=20


