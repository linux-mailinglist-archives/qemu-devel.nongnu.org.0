Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4B6F6639
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:47:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTfK-0007lE-8K; Thu, 04 May 2023 03:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTf8-0007kt-3D
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:46:02 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puTf5-0006ig-B7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683186359; x=1714722359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rAwHOHP2HATTczdPpomduJ1i5ocUr80Ou1R/ggO6+80=;
 b=cRgDZ6KkK98EVj7I0x5cLwIM6GqjwjysPRN2sSHbS6guMwS3vQojTpiQ
 fkl2YwTzL4fCHNCyAk9DHWFtv9WF5u5rkwRdFD1ZmbA0KF7Dx3Q55h+PL
 2w2kMfWdpMgMJI/DkO2Y2XxgAbZNlGbieIVQFR90B3dgnOTn4UyFDndpA
 ML0AspRV/MItgOPewXYSjZyokxFJiblEyzJQaQKQHiM3mviCKAzbbbSW8
 gXk3Y8r4DdjAfxxkurxKPF5ermvkv9kdlnzwtH5wuJ/i5pa+KBC8yj4QW
 UVo8hHvtccBIQgbhz9+OxzDv3e0ciF/cqG+z/qR5RaxaS4jpWm7Yuc6TW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328475743"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="328475743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="841027374"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="841027374"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2023 00:45:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 00:45:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 00:45:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 00:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8Gm/HCW4ELmilm2u2CW0Qrg72MEl/fmvQKkFpCYIoRXKMRDcE+WKjSmgvm7luu2WClIAA5pauNWZ0SfyiPxSlqbr9CwOaUCeUzOCDld9OwvtUpdBdOyM92OJ9MHHKJA/hl+bNA39PAph/zmNPItHqaX0nydQJp335c3ByOnkSblvgJ8dt7gRADeltgBCZLHyMrVMl3fLqN9md7wv/EIvDcrXsp8kDfmubWKHhjMYF7+smst5mL3uewW4onKdhhF3NuMPdMG/tsp3oO7pNAh3jQ8I/Z1ipujGBKtHbIIAUPGG120kVl3z3xLyYkvdyIAwa256w06EtdAAOHZ30rTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXxvh3zlHC+OIu3aYau0wn1QANFBge5UENJKWm/rT4k=;
 b=JWkZ6lYEe5jcNLtRCwtOzdhrjM0m7vEA1VOsMr93GcWf8Nj9sPQ5RrnoJD3O0BVN/6ToWYTir3lWHfxeAOF37zaVB8CdNO7TkJygJss+Cif4B8CmT+HjpF9XSJPwfh3grXnR1MqpqlO5lLIoRuiVD+drfzAUmZs8pB1ugIiwuZFtXNUTWuTSWTPS8lh9RrMNVAPdcrLop7rGiMDMdbg+paVbQyaKCr10bonniNWgY0GrpRx2Vge/JU7HhBI+oIh2ynZjIaZ2fqVOjmpB+fXPE4qtwJi+supXQJsdF3ptWnmJb4ILrMRye20xckbgnee59M1UJT5fbKQ0MKWly4o1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 07:45:35 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 07:45:35 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philmd@linaro.org>, Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH v4 04/10] configure: add --disable-colo-proxy option
Thread-Topic: [PATCH v4 04/10] configure: add --disable-colo-proxy option
Thread-Index: AQHZegt3PuVf/VfjkUyhK5LAiwXWTq9Jw92w
Date: Thu, 4 May 2023 07:45:35 +0000
Message-ID: <MWHPR11MB0031A6901E847CA3ED49E9AF9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-5-vsementsov@yandex-team.ru>
In-Reply-To: <20230428194928.1426370-5-vsementsov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DS0PR11MB7191:EE_
x-ms-office365-filtering-correlation-id: 85c2964f-890e-4d9c-e7aa-08db4c738bc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEGHda/3kczyZUop4P3yhWGdy6YuiJNdsBpivqGmikJtZ/LLp/LvoRGz4g5qIWKMX7O9jtbniTDRFqd8OKxywarplvLKEYmpCVu7p3Stkc9IVaa1OqdA2Od5cPa6v7/HGiprja3kmlyPsN1083kPPrdUnVs+KAeCfcgakjhnV+ncEoP/3uq1nbhlgCbZO7U0DzpRlL3MFyvQGbaV7IaPociM0DVSauIB2/+ferfZJZlGWn+uGXtPoqsqF/QRIPASZHsTIh7H+zdR+EHBTLz2vFPUWumIhVfVLN6AkghQwOg8J0k2VUdOK4tx7iOXlDEGyGA4F7/RIUUV1vUAwpikHLxhjxy7uFmjSmL0YXarzabYtDRjofQ4hi5KJ/mUGUzDP4NGs1aFOiXAUzDoqllIOFRXv8n45NG3McQSHQrBWnd9nEjkfQNyOepc63SRa43+ZV4N1f4w5eUDV8NR9L68Ho4+1xSZZBxG0sJrsKMr7cbuTVBQ5vZxtJDUgApiZQGZrr3P69JdQP7E3zq/Y4zmPHaFbdpCk0dIFkp6DxNb1VWvg5iBICn7cuajP+ECV0dKpGkXx4FQ3bCSW0kzKww2eaLb3OBkpZ/I/nqekm+BmSdFtoMVLnkM/jcHPiCnzvkd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(83380400001)(2906002)(5660300002)(7416002)(33656002)(8676002)(8936002)(110136005)(66446008)(66476007)(41300700001)(86362001)(66946007)(66556008)(52536014)(76116006)(71200400001)(478600001)(4326008)(54906003)(316002)(7696005)(64756008)(55016003)(122000001)(38100700002)(82960400001)(186003)(53546011)(38070700005)(26005)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xly7W534rMNJtEMQOlhn8Dh2ofFi/IFCrdv/sCWeDIGL9Ib/nuw9FQbqJH?=
 =?iso-8859-1?Q?HXUFpFt8XDROdIOYqRPTMDO7jw3bvio4S74k7baelvQVo7d3LO5Fx2qFKO?=
 =?iso-8859-1?Q?wfrVwt70J50euKDlBHe3fuaHex9lCmCzJirh5SKWzgvYZ/58zSrzYfIFVg?=
 =?iso-8859-1?Q?+CQeRN9RTxOVHk3fnK539h1xI+RyoOXFRihVpkFg8K/t5Nzk8ccXc8xMmY?=
 =?iso-8859-1?Q?w5DQMyT97c3fkyR5Zw70Tblh9tlDCUE3k4tCqW8vTpRiFppAwbM8CYWU9I?=
 =?iso-8859-1?Q?XP9ZMX2aQKoB2e3vJCKszuHuQQHacoKngg483a6p0DZjQm0KkdC1i3hNZz?=
 =?iso-8859-1?Q?XOnjZ9x9aYxT2lpT4JBdKta523QI/gxkCkNhdcr1sWCmstAmpnTuehYepD?=
 =?iso-8859-1?Q?x5JYJB0OYHKBL7nUgpHrrwgr7Dd6RNmlYZFof0Vlwtw6djYmqftenQQMlz?=
 =?iso-8859-1?Q?QagvP8s9H3jvVj7Ew1ZAfy6xs6fmOvqfjse8nDlj5AzDC93cyuHwI8TpsK?=
 =?iso-8859-1?Q?gKW5WzbbM34eJsWqn0qkssWUveUXX65Aw9d9XYuDQqd9pYLxO3TxLtPJPn?=
 =?iso-8859-1?Q?f7KzKv9bp+dQBAa3cyrtUTvTeg+GIFJ/1UpnQ38wC0/m+A95qBXtP+33lY?=
 =?iso-8859-1?Q?0WaLYmkXvp7knw1rjHOu84+/4UzYP/r6Klz71JR4mntmoEjyH0NeDfETFS?=
 =?iso-8859-1?Q?ZNTcWphIxBeACkpzFJ3R2G9LEHzeWAMAcpLktT0uMUIFT0OAytVYQizJqL?=
 =?iso-8859-1?Q?J685nkclfwrNF1qGhBeTRiWgR5U8HMmiS0JuzzLKKy0XNAKXY3PbLwqUE1?=
 =?iso-8859-1?Q?qxMAlMJLQtOSWskP8seZN1gMgxn8Bsh1qchmwJHw66386OsvgaFK27exlT?=
 =?iso-8859-1?Q?2czX1PvbDopCW+0HNlYrwQKwJgyFZHJyW+NAiIrzzqJa+TdR4pKRRfZ3lC?=
 =?iso-8859-1?Q?4sSoOfyTHRTs33GQU2j4KHwSV1J3u+C+ynjyXHHAhdA8Hx9afCk5ddSUl3?=
 =?iso-8859-1?Q?clg1kaHq0aETB+cGo2bUPoTgUwJpnnrc2BwXVELQXookv8EqgIb9XSPI5R?=
 =?iso-8859-1?Q?Q5LOHaHO3XDm4vmcmw3ehNs2ov6AT7IjV46i9Tskdrw/WPizNAhVB5L5Kx?=
 =?iso-8859-1?Q?qFOGl/ZjPyjiJzZOMgz0wI/5VNFnWqGigfUZyarcqppwiX/dtgfKzLiOis?=
 =?iso-8859-1?Q?cOnJSj15VfDuKWTMl4l1ZL04F6mqbhAK6xHYsbMeTb3gk0R0IhZf7Ai1uS?=
 =?iso-8859-1?Q?onCbs0ZxA5uyhsYRNY0tyVNRfar0skaycSlbuF6abjXzGEFojV4hJbGRd8?=
 =?iso-8859-1?Q?7Dayduw6JW0mwFoK9vhnS46pjg/SEPcjod6oIlX9lUQ/449fZ0XRP8Gah7?=
 =?iso-8859-1?Q?WsvVgIgtv5Amue8RB8LWDCH/KKPchxsfOxKzkTYqh7GbypknFAoaFyKpuW?=
 =?iso-8859-1?Q?cdx4BWHy0bN4iN2X6khw11Cu9hsn1SXS/pu5OzvIAbe/+IsxNvij8M+VRz?=
 =?iso-8859-1?Q?kZw0gh60kU4g57dideiAS9E04KF+i+Jzygs4nOCHb810ssnUCOvMEdaRAI?=
 =?iso-8859-1?Q?5qV/paS1kC4LC53EdAD0oSGjfbjo/4Ah4u+pvvUW9NJEkPlwbV9mDEdKdB?=
 =?iso-8859-1?Q?UVfLvRJlLkcvWEBVZ6ot0K93lN4goYNk8F?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c2964f-890e-4d9c-e7aa-08db4c738bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:45:35.3115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNoEMH8tc028J/QRNmdK6ogTRenXWcIN7dm7pGAjrsX8eyeBgedKaDHvdn5o4w8sEkkBBBuxnWqRq5wXpA8QOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Sent: Saturday, April 29, 2023 3:49 AM
> To: qemu-devel@nongnu.org
> Cc: lukasstraub2@web.de; quintela@redhat.com; Zhang, Chen
> <chen.zhang@intel.com>; vsementsov@yandex-team.ru; Paolo Bonzini
> <pbonzini@redhat.com>; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> <berrange@redhat.com>; Thomas Huth <thuth@redhat.com>; Philippe
> Mathieu-Daud=E9 <philmd@linaro.org>; Jason Wang <jasowang@redhat.com>
> Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
>=20
> Add option to not build filter-mirror, filter-rewriter and colo-compare w=
hen
> they are not needed.

Typo: This patch still build the filter-mirror/filter-redirector in filter-=
mirror.c.
Please remove the "filter-mirror" here.
Other code look good to me.

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

>=20
> There could be more agile configuration, for example add separate options
> for each filter, but that may be done in future on demand. The aim of thi=
s
> patch is to make possible to disable the whole COLO Proxy subsystem.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  meson_options.txt             |  2 ++
>  net/meson.build               | 13 ++++++++++---
>  scripts/meson-buildoptions.sh |  3 +++
>  stubs/colo-compare.c          |  7 +++++++
>  stubs/meson.build             |  1 +
>  5 files changed, 23 insertions(+), 3 deletions(-)  create mode 100644
> stubs/colo-compare.c
>=20
> diff --git a/meson_options.txt b/meson_options.txt index
> 2471dd02da..b59e7ae342 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value=
:
> 'auto',
>         description: 'block migration in the main migration stream')
> option('replication', type: 'feature', value: 'auto',
>         description: 'replication support')
> +option('colo_proxy', type: 'feature', value: 'auto',
> +       description: 'colo-proxy support')
>  option('bochs', type: 'feature', value: 'auto',
>         description: 'bochs image format support')  option('cloop', type:=
 'feature',
> value: 'auto', diff --git a/net/meson.build b/net/meson.build index
> 87afca3e93..6f4ecde57f 100644
> --- a/net/meson.build
> +++ b/net/meson.build
> @@ -1,13 +1,10 @@
>  softmmu_ss.add(files(
>    'announce.c',
>    'checksum.c',
> -  'colo-compare.c',
> -  'colo.c',
>    'dump.c',
>    'eth.c',
>    'filter-buffer.c',
>    'filter-mirror.c',
> -  'filter-rewriter.c',
>    'filter.c',
>    'hub.c',
>    'net-hmp-cmds.c',
> @@ -19,6 +16,16 @@ softmmu_ss.add(files(
>    'util.c',
>  ))
>=20
> +if get_option('replication').allowed() or \
> +    get_option('colo_proxy').allowed()
> +  softmmu_ss.add(files('colo-compare.c'))
> +  softmmu_ss.add(files('colo.c'))
> +endif
> +
> +if get_option('colo_proxy').allowed()
> +  softmmu_ss.add(files('filter-rewriter.c'))
> +endif
> +
>  softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
>=20
>  if have_l2tpv3
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index d4369a3ad8..036047ce6f 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -83,6 +83,7 @@ meson_options_help() {
>    printf "%s\n" '  capstone        Whether and how to find the capstone =
library'
>    printf "%s\n" '  cloop           cloop image format support'
>    printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
> +  printf "%s\n" '  colo-proxy      colo-proxy support'
>    printf "%s\n" '  coreaudio       CoreAudio sound support'
>    printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
>    printf "%s\n" '  curl            CURL block device driver'
> @@ -236,6 +237,8 @@ _meson_option_parse() {
>      --disable-cloop) printf "%s" -Dcloop=3Ddisabled ;;
>      --enable-cocoa) printf "%s" -Dcocoa=3Denabled ;;
>      --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
> +    --enable-colo-proxy) printf "%s" -Dcolo_proxy=3Denabled ;;
> +    --disable-colo-proxy) printf "%s" -Dcolo_proxy=3Ddisabled ;;
>      --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
>      --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
>      --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dtrue ;; diff=
 --git
> a/stubs/colo-compare.c b/stubs/colo-compare.c new file mode 100644 index
> 0000000000..ec726665be
> --- /dev/null
> +++ b/stubs/colo-compare.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "qemu/notify.h"
> +#include "net/colo-compare.h"
> +
> +void colo_compare_cleanup(void)
> +{
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build index
> 8412cad15f..a56645e2f7 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -46,6 +46,7 @@ stub_ss.add(files('target-monitor-defs.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
>  stub_ss.add(files('colo.c'))
> +stub_ss.add(files('colo-compare.c'))
>  stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
> --
> 2.34.1


