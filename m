Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44747BA51
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 07:53:38 +0100 (CET)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZ1l-0001me-EH
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 01:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzYnN-0007Y4-VM
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:38:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:29176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzYnI-0007mc-Eg
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640068720; x=1671604720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yI7LdN4VYjCDM+E6X/IekcfAQlEu8sfmYj6hDEUJZKU=;
 b=LvMt1+ebp7M9/1Q3P3J22gKM0aWEyBDITGfu3Nqwz9LBSeHyr8yrgGw2
 +dCD2YG1uiKk8CSYgThAOb09IpLAsiTW1NreXaD0XSzvOl62LU7KRjNWM
 cmKnLU4ZvoZlhZlMfA1+cCjEl3fTyUsd70ERP4rDbVmIWM0QixXzq9uN8
 8PYy4KApxvZ+yUl1l8QrhrfpJjmOb7iLgVsquJiwUsy53puAuZQKAoI2L
 2YYMxWudsK8p0ZjWzSopO17nBMproEXVsFtU6W6dfR5iU/Yn2XBaPWXjX
 WtkqUjw7vtsACxNEYLuwn1PpAvGi9yDB97+0fM7BeMw6jT/FAy5JMvM7i g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240559912"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="240559912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 22:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="586589221"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2021 22:38:34 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 22:38:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 22:38:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 22:38:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 22:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCBMTHaK2H4DiTwR1l48YRK0gzxA/RT50fZcT4OjjZ1/y81h9CFoD5tEX5/QZerLxLQxUK8xq6F0fqw5/YT64uhOQLX0+H5BCQIxB8ClribAs9dA9QNJBtfURska011PzZy8HfUCVAqquHYvPvK26aiK8tskUNwH6N87Kq7EgpoBw5gNg3zM1oqe++yRUhXydfZjRgO2PJuqmFOBQEkS/3W3V/buHNykk3ZOttTd/uSepC2jX0LEK9HIWjRp31Gla8GZbUE4Aq9lhV6gBsjBRnU83ySWam0dJ5IS4wPzs/sqEizA9/3q4axA5AfCl208IiP/2maTDklvIQE6p+9M/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIWeLLeiP2I/joujzAV4gWIi6arXmPsU7s7bNo2ykkA=;
 b=f/8klQSfTiIi8Ke3kC05PHOwUoZ3prU7ZPyHD9o/JxslMetX5Sia4VdGDw5uiGxXfLC88ibTwKv/4tr8t59YttxhxJNMwDwZSTVMkN+CUVdBZS9Qc8KB5xUtF0ueiWuV0+zc3w8iYHtaawddfD2K5WwVrA7t9HtopxPp/U8A4Cj9+vtlNOamgKbdfyvYITxQJFm2wCL1T6UHs+bT30pZ87AxABMWdcLy7WxPzslBljbHJexPwucah5Hc+8Yle02kWzINOr5kkLFjDXGKX7SYGe4oszChLWFW4u7Evd8Srpmw1IDFeuCrONmZdoz8OvACt/vLDkmqJ0hHjiNcwvEHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 06:38:31 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 06:38:30 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>
Subject: RE: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
Thread-Topic: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
Thread-Index: AQHX9dFWXTEURWNtpE6u8KD0qLg6hKw8fAow
Date: Tue, 21 Dec 2021 06:38:30 +0000
Message-ID: <MWHPR11MB0031244B90C10F7E048744B29B7C9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211220103025.311759-1-thuth@redhat.com>
In-Reply-To: <20211220103025.311759-1-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b39df90-1db5-4be1-da88-08d9c44c80f5
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_
x-microsoft-antispam-prvs: <MW4PR11MB587239CEB3EA89151C9DD73C9B7C9@MW4PR11MB5872.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VVuQxp2DwrG6VIUbzMj5Ze3J+08YTIVlEdc9wD5C2CXQhRMhFxu/mPcrzsSl2dnckxyQsXAlBAC2UV90cUcYCXqq+6Pidkx4foKn1Q9u1ZCMUGsWppcxVPybpQs0o/Ld0EB0NnECpuesWPshTJjZxk0H7zz60lCJG6U+JRBqSQ4Y5dFVb9sbf8koOFTEp3B1lhKGnM+qQgz8coyn6u52EnpkzTY4ZH/FQNo/cTZqN8gSzCIBX9k8tQVAFb8e8KVqkx9wyhGsdy+qkSun0VM7AbrKohxdYoHdyVhb9gYuveudOxDjlsb8ZuE8XRAeklZG7dT/JwGKU501mNJlOMPNvTEplycAJwEDrOJSwR8DNfHm7M5CppzvX1JqQfb1rHkyvKrzJtgJVsxePPKixiTzD9K1CTu0agQQvRZJ8WrIdgyACgacct52zEyVSBTqKJ3GIFTy6MIFjbNY/fyyiuse4xgG99OhOT3MgVwyOTV+uenrb4nYuNS+wyshkN5RnwfjAE4TPefh+sh+5ZTei3cRMOXJk9/cb8wezkO0ZcbFfVt3vCD07WTvmtzQU+WiN6Jtaq2qrrEY6eGXyCor89qB+Yas6ojFOayH1YvhtUGN7Ygp/i6HpOHDIMcXo6GTzslPeZhi16y6uvD8hPXIbATWMZc7jiCnCjOLRYhnxIAKsNGAO4p3qXsibuMs0HcB3v5OyLjRxZml0JCx9+Zj1D3OTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8676002)(54906003)(110136005)(508600001)(82960400001)(53546011)(26005)(8936002)(38100700002)(122000001)(7696005)(2906002)(83380400001)(71200400001)(4326008)(33656002)(66556008)(76116006)(66476007)(6506007)(30864003)(66446008)(66946007)(5660300002)(186003)(55016003)(38070700005)(64756008)(9686003)(316002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?48o39uyumts7jaDCqNLPmi4kfY8aRg2tBqMhFZ96HW2OdThu7qElbVSDz3E/?=
 =?us-ascii?Q?akzF10VQfQvNdWzPH/3sSXiLGrfVOpGuopNuSP86Arq7PAn1BvFMXeSwvgCe?=
 =?us-ascii?Q?TRBKwaMdn2ETs38jbD6inqaSlDDGXj7cQVyYDxjQd2DWtPvpQZMiifGHa8ei?=
 =?us-ascii?Q?KNcXQc47H+w5H8akXVtUuQldEbLHuxGjSK+pyo4KkTu2wGS7u4Y76jnooOYZ?=
 =?us-ascii?Q?wZMvleSaD4Vgdmo4TPDtFEEN1TLB1h0Ne/B0Gq/uIgWdxfzm9wuPEPPJWIZd?=
 =?us-ascii?Q?1yRWaotEFNtjDp8qI8B2DoN5JQylWMgxwxSyHZ+Z4Zl8EXvN24N8jQsx9kWY?=
 =?us-ascii?Q?n9f05tqVKuTvO92TO1YdErXWZY589Y+5lVC/81kGDTWWdeTltQu+cgz07yZb?=
 =?us-ascii?Q?acMHhBSfwXHdEJwvO7sK0I+v+lvltd8JMrMRYsbnlbuuIhYgo94DwUVql53G?=
 =?us-ascii?Q?+ewF5uu3PT5C3z5+JjtgK6GQI3FKbLqajMLz1xva6DEu5hIOX88rjkxfxkAU?=
 =?us-ascii?Q?shlwe2eMEyHK9JmaXyoqOHgCBprtzksJbQji+DJb1dhi0pvcg5+f9xIWttj3?=
 =?us-ascii?Q?GUzMjaTHz/pWFgeqYgCzjXoPe7GZ8cxIHYetIjD5Q79PhzgMJSsPTk5hVxy7?=
 =?us-ascii?Q?oL6xpQpG0lx/dvgJK2KOsTyl+lb8eYweYE5+09+jmTjrie94BBYzgBNpFFuJ?=
 =?us-ascii?Q?JsGubI63tJQzDTTC297lo0gkehPNoPMXqOAbzwDlzF5FJt/Pa7xsA6A/DCT+?=
 =?us-ascii?Q?vTZvJfLPDQXuQIzBx9FVoCAsyUbwzW8dqFRnTU5EtRsORzawEeOWrVR5vukN?=
 =?us-ascii?Q?ii8spcf/MvDwcjd2VocmSkMYzKeuvkJmfvY/zGH+zKJFPdgdALxREEisYfD3?=
 =?us-ascii?Q?LkaAqR2EEcpZtNgMrb8NfXpMTLIGR145oegwlXvFVjjVpUlCBG2dVWg9rE6n?=
 =?us-ascii?Q?G/UtIauEH8UHrFZQGNQg8yYk3y7K32Ew6bvSU65muv5Ae9vW0ndZ+lp7T578?=
 =?us-ascii?Q?bCZBSAZyMyzTTmkr3dylfZUst2GyaY9l/p9bnPYbG8lFvZWMamtaw6/XRpMg?=
 =?us-ascii?Q?krwCn0Sk3Q14uXXQIUnnkypMFlm5hKFzGBIhBq8pBVnRnMXw9xmdm1iO8cQN?=
 =?us-ascii?Q?iKn057GhuzZJcnSVRxMAc6DS4z66rBIwaBr/T5UTxVUStVnWYepPxLbDS6hE?=
 =?us-ascii?Q?NrmSlSUwfd52dhkkZQrOlzzQor061B94dzkoJAQniE9m2iyvj0vVCK9W7iC/?=
 =?us-ascii?Q?LPPGNv0y8mNuqoZjybpoUTu8i1tpfJNUdbhzsUp8D7cD3VEzov39ZLTwfm2n?=
 =?us-ascii?Q?gicUgmPGmhK85J/amk0qNA4zoxZKxnJVaaUIlRI2jHJLF3zbEmxiBX++WY+E?=
 =?us-ascii?Q?j8tEVAOuSG0gpu6NZUXUEGzb8IrQW8wPVf4W0ANBTCIFIM/ouTaCjki97F6k?=
 =?us-ascii?Q?Mm7l3QTZTbRYVxAh3fLHY0bheWbkykMC/141CR85wudpMiIcUFCWugEB+hxI?=
 =?us-ascii?Q?NQhIGoIA2mdoYlJlGUVtXhQNOxbDPGl+7R0bHF5vh5eYJo0bBuva+ddFc1di?=
 =?us-ascii?Q?Og8QyyCDrj+0LQA51zUPfg8607Phxixj8RdXeD25gBWRs+cZ8XA0B8MO4AjC?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b39df90-1db5-4be1-da88-08d9c44c80f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 06:38:30.7811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO8lf+dH17enI3HXH1UN6aV5tKUJVOit8BZIoj8f3Ok2mHv17/QUMKoZtOaDhw2IEHryKdVXfYGRVBFmCK+NmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Hongyang <yanghy@cn.fujitsu.com>,
 Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Thomas Huth
> Sent: Monday, December 20, 2021 6:30 PM
> To: qemu-devel@nongnu.org; Laurent Vivier <lvivier@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Yang Hongyang
> <yanghy@cn.fujitsu.com>; Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
> Subject: [PATCH] tests/qtest: Make the filter tests independent from a
> specific NIC
>=20
> These filter tests need a NIC, no matter which one, so they use a common
> NIC by default. However, these common NIC models might not always have
> been compiled into the QEMU target binary, so assuming that a certain NIC=
 is
> available is a bad idea. Since the exact type of NIC does not really matt=
er for
> these tests, let's switch to "-nic" instead of "-netdev" so that QEMU can
> simply pick a default NIC for us.
> This way we can now run the tests on other targets that have a default
> machine with an on-board/default NIC, too.
>=20

Oh, It's my and Hongyang's abandoned mailbox.
Looks good to me.
By the way, should I add the test/qtest/test-filter* to the MAINTAINER file=
?

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/meson.build              | 40 +++++++++++++++++++++-------
>  tests/qtest/test-filter-mirror.c     | 10 ++-----
>  tests/qtest/test-filter-redirector.c | 20 +++-----------
>  tests/qtest/test-netfilter.c         |  8 +-----
>  4 files changed, 38 insertions(+), 40 deletions(-)
>=20
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build index
> ebeac59b3f..7811177f03 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -47,7 +47,6 @@ qtests_i386 =3D \
>    (have_tools ? ['ahci-test'] : []) +                                   =
                    \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +           \
>    (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : [])=
 +
> \
> -  (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['test-filter-
> redirector'] : []) +    \
>    (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test']=
 : [])
> +            \
>    (config_host.has_key('CONFIG_LINUX') and                              =
                    \
>     config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] :=
 []) +
> \
> @@ -90,7 +89,9 @@ qtests_i386 =3D \
>     'vmgenid-test',
>     'migration-test',
>     'test-x86-cpuid-compat',
> -   'numa-test']
> +   'numa-test',
> +   'test-filter-redirector'
> +  ]
>=20
>  dbus_daemon =3D find_program('dbus-daemon', required: false)  if
> dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
> @@ -109,31 +110,49 @@ endif
>=20
>  qtests_x86_64 =3D qtests_i386
>=20
> -qtests_alpha =3D [ 'boot-serial-test' ] +                               =
                       \
> +qtests_alpha =3D ['boot-serial-test'] + \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>=20
>  qtests_avr =3D [ 'boot-serial-test' ]
>=20
> -qtests_hppa =3D [ 'boot-serial-test' ] +                                =
                       \
> +qtests_hppa =3D ['boot-serial-test'] + \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>=20
> -qtests_m68k =3D [ 'boot-serial-test' ]
> -qtests_microblaze =3D [ 'boot-serial-test' ]
> +qtests_m68k =3D ['boot-serial-test'] + \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : [])
> +
> +qtests_microblaze =3D ['boot-serial-test'] + \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : [])
> +
>  qtests_microblazeel =3D qtests_microblaze
>=20
>  qtests_mips =3D \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +            \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>=20
>  qtests_mips64 =3D \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +            \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>=20
>  qtests_mips64el =3D \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +            \
>    (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
>=20
>  qtests_ppc =3D \
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : []) + \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +            \
>    (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +
> \
>    ['boot-order-test', 'prom-env-test', 'boot-serial-test']              =
   \
> @@ -143,19 +162,22 @@ qtests_ppc64 =3D \
>    (config_all_devices.has_key('CONFIG_PSERIES') ? ['device-plug-test'] :=
 []) +
> \
>    (config_all_devices.has_key('CONFIG_POWERNV') ? ['pnv-xscom-test'] : [=
])
> +                 \
>    (config_all_devices.has_key('CONFIG_PSERIES') ? ['rtas-test'] : []) +
> \
> -  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +              \
> +  (slirp.found() ? ['pxe-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test']=
 :
> []) +             \
>    (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-
> test'] : []) +         \
> -  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +
> \
>    qtests_pci + ['migration-test', 'numa-test', 'cpu-plug-test', 'drive_d=
el-test']
>=20
>  qtests_sh4 =3D (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ?
> ['endianness-test'] : [])  qtests_sh4eb =3D
> (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] :
> [])
>=20
> -qtests_sparc =3D ['prom-env-test', 'm48t59-test', 'boot-serial-test']
> +qtests_sparc =3D ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + =
\
> +  ['test-filter-mirror', 'test-filter-redirector'] + \
> +  (slirp.found() ? ['test-netfilter'] : [])
>=20
>  qtests_sparc64 =3D \
>    (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] :
> []) +            \
> +  (slirp.found() ? ['test-netfilter'] : []) + \  ['test-filter-mirror',
> + 'test-filter-redirector'] + \
>    ['prom-env-test', 'boot-serial-test']
>=20
>  qtests_npcm7xx =3D \
> diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-m=
irror.c
> index bc0dee64dd..95367d14d3 100644
> --- a/tests/qtest/test-filter-mirror.c
> +++ b/tests/qtest/test-filter-mirror.c
> @@ -28,13 +28,8 @@ static void test_mirror(void)
>      char *recv_buf;
>      uint32_t size =3D sizeof(send_buf);
>      size =3D htonl(size);
> -    const char *devstr =3D "e1000";
>      QTestState *qts;
>=20
> -    if (g_str_equal(qtest_get_arch(), "s390x")) {
> -        devstr =3D "virtio-net-ccw";
> -    }
> -
>      ret =3D socketpair(PF_UNIX, SOCK_STREAM, 0, send_sock);
>      g_assert_cmpint(ret, !=3D, -1);
>=20
> @@ -42,11 +37,10 @@ static void test_mirror(void)
>      g_assert_cmpint(ret, !=3D, -1);
>=20
>      qts =3D qtest_initf(
> -        "-netdev socket,id=3Dqtest-bn0,fd=3D%d "
> -        "-device %s,netdev=3Dqtest-bn0,id=3Dqtest-e0 "
> +        "-nic socket,id=3Dqtest-bn0,fd=3D%d "
>          "-chardev socket,id=3Dmirror0,fd=3D%d "
>          "-object filter-mirror,id=3Dqtest-f0,netdev=3Dqtest-
> bn0,queue=3Dtx,outdev=3Dmirror0 "
> -        , send_sock[1], devstr, recv_sock[1]);
> +        , send_sock[1], recv_sock[1]);
>=20
>      struct iovec iov[] =3D {
>          {
> diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filt=
er-
> redirector.c
> index 4269b2cdd9..4f3f59cba8 100644
> --- a/tests/qtest/test-filter-redirector.c
> +++ b/tests/qtest/test-filter-redirector.c
> @@ -62,16 +62,6 @@
>  /* TODO actually test the results and get rid of this */  #define
> qmp_discard_response(qs, ...) qobject_unref(qtest_qmp(qs,
> __VA_ARGS__))
>=20
> -static const char *get_devstr(void)
> -{
> -    if (g_str_equal(qtest_get_arch(), "s390x")) {
> -        return "virtio-net-ccw";
> -    }
> -
> -    return "rtl8139";
> -}
> -
> -
>  static void test_redirector_tx(void)
>  {
>      int backend_sock[2], recv_sock;
> @@ -93,8 +83,7 @@ static void test_redirector_tx(void)
>      g_assert_cmpint(ret, !=3D, -1);
>=20
>      qts =3D qtest_initf(
> -        "-netdev socket,id=3Dqtest-bn0,fd=3D%d "
> -        "-device %s,netdev=3Dqtest-bn0,id=3Dqtest-e0 "
> +        "-nic socket,id=3Dqtest-bn0,fd=3D%d "
>          "-chardev socket,id=3Dredirector0,path=3D%s,server=3Don,wait=3Do=
ff "
>          "-chardev socket,id=3Dredirector1,path=3D%s,server=3Don,wait=3Do=
ff "
>          "-chardev socket,id=3Dredirector2,path=3D%s "
> @@ -103,7 +92,7 @@ static void test_redirector_tx(void)
>          "-object filter-redirector,id=3Dqtest-f1,netdev=3Dqtest-bn0,"
>          "queue=3Dtx,indev=3Dredirector2 "
>          "-object filter-redirector,id=3Dqtest-f2,netdev=3Dqtest-bn0,"
> -        "queue=3Dtx,outdev=3Dredirector1 ", backend_sock[1], get_devstr(=
),
> +        "queue=3Dtx,outdev=3Dredirector1 ", backend_sock[1],
>          sock_path0, sock_path1, sock_path0);
>=20
>      recv_sock =3D unix_connect(sock_path1, NULL); @@ -163,8 +152,7 @@
> static void test_redirector_rx(void)
>      g_assert_cmpint(ret, !=3D, -1);
>=20
>      qts =3D qtest_initf(
> -        "-netdev socket,id=3Dqtest-bn0,fd=3D%d "
> -        "-device %s,netdev=3Dqtest-bn0,id=3Dqtest-e0 "
> +        "-nic socket,id=3Dqtest-bn0,fd=3D%d "
>          "-chardev socket,id=3Dredirector0,path=3D%s,server=3Don,wait=3Do=
ff "
>          "-chardev socket,id=3Dredirector1,path=3D%s,server=3Don,wait=3Do=
ff "
>          "-chardev socket,id=3Dredirector2,path=3D%s "
> @@ -173,7 +161,7 @@ static void test_redirector_rx(void)
>          "-object filter-redirector,id=3Dqtest-f1,netdev=3Dqtest-bn0,"
>          "queue=3Drx,outdev=3Dredirector2 "
>          "-object filter-redirector,id=3Dqtest-f2,netdev=3Dqtest-bn0,"
> -        "queue=3Drx,indev=3Dredirector1 ", backend_sock[1], get_devstr()=
,
> +        "queue=3Drx,indev=3Dredirector1 ", backend_sock[1],
>          sock_path0, sock_path1, sock_path0);
>=20
>      struct iovec iov[] =3D {
> diff --git a/tests/qtest/test-netfilter.c b/tests/qtest/test-netfilter.c =
index
> 785b6f3226..b09ef7fae9 100644
> --- a/tests/qtest/test-netfilter.c
> +++ b/tests/qtest/test-netfilter.c
> @@ -178,11 +178,6 @@ int main(int argc, char **argv)  {
>      int ret;
>      char *args;
> -    const char *devstr =3D "e1000";
> -
> -    if (g_str_equal(qtest_get_arch(), "s390x")) {
> -        devstr =3D "virtio-net-ccw";
> -    }
>=20
>      g_test_init(&argc, &argv, NULL);
>      qtest_add_func("/netfilter/addremove_one", add_one_netfilter); @@ -
> 192,8 +187,7 @@ int main(int argc, char **argv)
>      qtest_add_func("/netfilter/remove_netdev_multi",
>                     remove_netdev_with_multi_netfilter);
>=20
> -    args =3D g_strdup_printf("-netdev user,id=3Dqtest-bn0 "
> -                           "-device %s,netdev=3Dqtest-bn0", devstr);
> +    args =3D g_strdup_printf("-nic user,id=3Dqtest-bn0");
>      qtest_start(args);
>      ret =3D g_test_run();
>=20
> --
> 2.27.0
>=20


