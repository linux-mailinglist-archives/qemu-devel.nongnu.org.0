Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B84893B4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:37:55 +0100 (CET)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qBd-0002aW-JY
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qAD-0001SW-Ti
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:36:26 -0500
Received: from mga17.intel.com ([192.55.52.151]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qAA-0004y5-Ss
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641803782; x=1673339782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IwNgQfi/Fa9ItQua8o70ZtkYm9BBpAbNIo5AycOXI50=;
 b=b73voiVskksOxMDdSmmepz/Rt/Ya+wii9Pa5LUqD8Jl6wl8CwWqLvpZv
 lrqBMmz2gPPe1UJt0fU82hFkmExJKVdnp2pwJSnnp3rduU1Wc9IYWqOS1
 MdDbJDewXH063N9+gJUvH5do9y9AXw6vaQvsU0rFjSxcatiaaBXH7pQv/
 l0SxSRe8bxMNFizGEZ78hg/P/QZUhfEMm+Vn3ZHg/ampWo/Y+kbrCtjnd
 ssoHGBH8/lGnVrkVE+S+Lw0Fg95yEjY38Skc+t07s+lOiqVqF55wCkUJm
 h1BwJIVkooWrBTfciCthSWdlH6Bz23SEd8l8ckx5d6Ievq9DmP63dH0i2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="223877155"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="223877155"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 00:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="762097170"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2022 00:36:17 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:36:17 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:36:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 00:36:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 00:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtdVqZjFIrlv45DdSiXNos8ZkT3SUyfdSphxLzFu0T/bU35WYwQFIoC2XPAXF7wRmLwQpimf78PPW8EYY8nsezGuF0++g/hXWeOvQKKEUGyCB2LxXcK3Vq3g+G9GJ1ttQKIfkkowLIzxZYBcVtOBcYs/X3czJpwc5rcAIDZ+/ls0U6wL2Mb2fNwmNebUWDGfKmnIgZgX+AaAp9SDkPbFIGxIZlIcaaCS8duw8BpJEwFidvMUOllJI4sXwuFcoQnaljpAKJfRdZyCzEVvYS84a9mTfafgmS4MiBnM5utuJVhyi4uEGuG41I2uWrUhNk8zK3w1oPPPBTm5XhL8L8j4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj/edOzIoOyfMu4WqSTan1MQ+aOj68HRdzcim8uR550=;
 b=dxerv9Nj5wgUJfMMtvmHxFK6m66gjnDt0+j/MYoPD5EyVPQ0dQt07wswBevDuAF0aJTeZxAJSPBbHXV09TYyyjQgaAEuoKnd+Ltw9MufrXyDEZ6nUGypcJCjkFsg+IY/HLWQL1PAB6dLtTqS31IcVhFPONX4bMB7rY7rMBXMaEomEoLHXDv4j9V6PSdRbTLYoAtnM5jdf2LBfYTqzKsx3XEvS6rJOxPq9FSy4ksSz58Y02HNDwQic9Zjoy14tDtOyMVTzLL1EipcuCWwSDrRvgr08Yxzxup19CaOGA74Y/tSDJKiC4PADAKcORPAWwbtV/QqEOBFvxvXOfqrNE6L/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR1101MB2275.namprd11.prod.outlook.com (2603:10b6:405:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 08:36:13 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:36:13 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Thread-Topic: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Thread-Index: AQHYA6lt1oVC0fF27kmmFYaXxYcTQKxb73sA
Date: Mon, 10 Jan 2022 08:36:13 +0000
Message-ID: <BN9PR11MB5276050198EED261C480B6B28C509@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-4-yang.zhong@intel.com>
In-Reply-To: <20220107093134.136441-4-yang.zhong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5ce594a-b242-4fe4-c4ad-08d9d41442e7
x-ms-traffictypediagnostic: BN6PR1101MB2275:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR1101MB227535C1A17F61E953DD09D48C509@BN6PR1101MB2275.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pDWqqtjID2ggSmLxl0Sgcwi9kOuWRc4HFeBVnNahoz+MSr/3s9c1IkVBguHAkmnYGviH2XX8R+9c3CkWhdTqN8Hw9+ajt+9vg6wI9XcmsJXV6BloifOEHKdFyQvax4NN8zG7YEXYtrKCHf1XVJYoZ1XYvPjlqs9xdVjA6Ulf9WZkS7LCj96dECTPO0MkQ0kZXFXMJvSN0JlWVjxTWEIG1mbgaG1DNdd8cePBvDBnMdsgWN6v8BRLvRh35HEHxYP0C9mb8sJSUEozX7TOfasQ5p/KdMQD/7LtAJPkNAc8USAfZOXNOxep/Ir38XADKX7iRNsd8eFf3KcleJiEZ3sNCiI8K+OAK7ORH2itNXGuuWX5+rDo3nUTR7x/ZxbHyKRLAC3SHXtxkX7QjZGQYEdCMghPkz3+/OoPtWaqlxMjllfQ3lx3U5hONncBD+RpNN6pTt6q9bqflh1lTqOTGP3IzF8VDYxGlHzDwlQieBAsfeUEjkyPqIwBcZJa+zhNUG2dJBUlxRHm9CA8F9oGejlKtK9Iapt7xGZcvrvFx/uM146K3E92PalagEnGzeA84UQAG/hJ6TYIx4qL4EV+VEfm0PEGdpltUiMKxyp0ILN/Ya6UczbQvj6F4i4BxnZWFY8Sr9niVsY4o4bWe73XTTac5UWO4M6fNKziGvy2YFqOsm18bRr7QImu+ZuDQ2I2KLv5yYtXzhyqp9HfLXMTEfQHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(5660300002)(8676002)(4326008)(66446008)(66556008)(66476007)(64756008)(66946007)(186003)(110136005)(86362001)(316002)(33656002)(8936002)(55016003)(82960400001)(83380400001)(9686003)(122000001)(38100700002)(38070700005)(76116006)(54906003)(6506007)(26005)(7696005)(71200400001)(2906002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CxEzUKbJ5Kkyx79Xtup+ftbRHRBnuyS4lfdQONb6DWnNwf2RqhZZS4+rygjj?=
 =?us-ascii?Q?gWlI3g2Pak4bnBREUch1A+jkrjH1Hp1PxACIQw/RAzQYYpIVz+ddMQTjT6Sl?=
 =?us-ascii?Q?2CKDZsI6yec9oF1lmgrHMj91wCOmHdgyyCrRkEHzF6NNhzcrVCzvpwmcplt1?=
 =?us-ascii?Q?3ARduqdf5LjPyurQ4X/X0/Us7nXOJ1vPRb9Z4sAEtFc/YwIcwzlGFZML6SJd?=
 =?us-ascii?Q?1OqaM0UiorW5oHfY/KUhAF5anvK2vtAkG119NrJ9cypqyrU/BeGOIICEiYY6?=
 =?us-ascii?Q?o/+70kMhJCOZQO+ZpsKVN+NuOWF3jYsKMsokZtecmjdy6SGmtBcj7F96y8+Z?=
 =?us-ascii?Q?79MR1ASU8Hn87nQ4YNYkFtiOhrzZ48qkoRVlTE1nq3bs3+Unp/ui5xDy5v4o?=
 =?us-ascii?Q?Ik+mdJMis3dAJENLJkuCUV1spgykMNbNweY5WvGeIIGFRxr44fgGlTuRTHk3?=
 =?us-ascii?Q?kvlYjuxVCj9HkG5MO6aqVrpSQDpZyXaf1OZ7Dwv6k7h7jmVBx/gRcXvloCxN?=
 =?us-ascii?Q?QDpTk5ybmCjxDy4LutE2QgYnsFHyBwkKcQ6G+ULn2zZ1rzAfNQBh7xfpaUhS?=
 =?us-ascii?Q?JOp/iylnxMxTyTKbMS+EDVI/puVXwCnfCDZWQ/T29I4dCcBkMqwFWpDuZ8Cf?=
 =?us-ascii?Q?eo8kFp4KXlS7vT54TpVIPsvHguvxxtsIYgRfbCWkBaC7qzqoADAA/1Tr4ytp?=
 =?us-ascii?Q?9rrzzQyLT7mX4TbKIMA2Nw+lp2bgzV0Kyy4phjhPCC/Cf+xXf4LzTWoKdMWI?=
 =?us-ascii?Q?T0T1EQo24SbBM2YEQdoW6znFWAdy88g9MdMONRXVmEW3mqWSQ+0UyKF/OhIZ?=
 =?us-ascii?Q?cBI+8iyrPUI6EI/wDGisVS2U+uewXG2fgaBawJoc6KEZ+lWYQFZyxhjVAZ5v?=
 =?us-ascii?Q?5fpQdTbtP0qKFbjlKTnFNTfteiqMX+qSbqhZwtlnZEqTv2J2oolF2wmKPjaO?=
 =?us-ascii?Q?WOZKgMDPWM6fdd1oeDmDjsI+afh+cYSMM7m8OIMlNB7ZyCU/FekEAhxEE67N?=
 =?us-ascii?Q?i6PZTq7+lkDv0ZJqRBjRn/Jf67MY76yMG5ilV9pNKo9sM2GMplPiznPwHJLe?=
 =?us-ascii?Q?5iFaMA2kqrxSHKuHyHLmF4qhqzf/uB6NvHXVk8m9dMzT23nNOBvLu+ZURlSi?=
 =?us-ascii?Q?A1Ty0xDcBiULFc3hMMHs/vwv6vQ+6aE+lyyrNT3FcFRNR6QD8TeLMIAaq9rY?=
 =?us-ascii?Q?iD+t104T3+eGSnWetBebYwCWK5pO1AvYvP1JCYqP2igJnws97Mbb7Vpxs0+g?=
 =?us-ascii?Q?JrTjNYzL1vMTmnGeYETW4o8J8s2oYBuEgQ/3aVYtYJl5dOoQwIxrwB4RjhQj?=
 =?us-ascii?Q?7F6eJMSWLMw+eRuQ4ATFkJsHkVZvurr2DVjbwPv8NefEE2+Fzyclpq+JnY8u?=
 =?us-ascii?Q?Io3oTVaaHuFZjJqMASU+1A6URynWhJ3ZJHTRBLhH/+jLpD6Wc8NQsj87EZYn?=
 =?us-ascii?Q?5pCfR2jRZlHQEfFpKmke0cJkE+HzcW6sSRBmOr0ZDU+wDbcjoCKT0aqROfHH?=
 =?us-ascii?Q?79Qeo+vV1VoKvNDS2LL4qVQbc2H+Fuhj58lRLVoItZTwzSyWV2/0RVPCgkAA?=
 =?us-ascii?Q?q7CGNbk9hlPQojkjffbIz7bcXYvh5K7MNE/BosqX7urbXFvRapDOwCwoQ8dD?=
 =?us-ascii?Q?U03kea1A6lJWOTFAN42n4ho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ce594a-b242-4fe4-c4ad-08d9d41442e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:36:13.6067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IR8KHxpoHJ7eLvYAtx+1lh2DBl/3EYS7oafD09lhcQTYqKeL8nqmQVonwGy70r6sMtA3RmLzpQhq7MMyiMg+6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2275
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=kevin.tian@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Zeng,
 Guang" <guang.zeng@intel.com>, "Christopherson, , Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Zhong, Yang <yang.zhong@intel.com>
> Sent: Friday, January 7, 2022 5:32 PM
>=20
> Kernel mechanism for dynamically enabled XSAVE features

there is no definition of "dynamically-enabled XSAVE features).

> asks userspace VMM requesting guest permission if it wants
> to expose the features. Only with the permission, kernel
> can try to enable the features when detecting the intention
> from guest in runtime.
>=20
> Qemu should request the permission for guest only once
> before the first vCPU is created. KVM checks the guest
> permission when Qemu advertises the features, and the
> advertising operation fails w/o permission.

what about below?

"Kernel allocates 4K xstate buffer by default. For XSAVE features
which require large state component (e.g. AMX), Linux kernel=20
dynamically expands the xstate buffer only after the process has
acquired the necessary permissions. Those are called dynamically-
enabled XSAVE features (or dynamic xfeatures).

There are separate permissions for native tasks and guests.

Qemu should request the guest permissions for dynamic xfeatures=20
which will be exposed to the guest. This only needs to be done
once before the first vcpu is created."

>=20
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> ---
>  target/i386/cpu.h |  7 +++++++
>  hw/i386/x86.c     | 28 ++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 768a8218be..79023fe723 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -549,6 +549,13 @@ typedef enum X86Seg {
>  #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
>  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
>  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
> +#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
> +#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> +#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> +                                         | XSTATE_XTILE_DATA_MASK)
> +
> +#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
>=20
>  /* CPUID feature words */
>  typedef enum FeatureWord {
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb..0a204c375e 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -41,6 +41,8 @@
>  #include "sysemu/cpu-timers.h"
>  #include "trace.h"
>=20
> +#include <sys/syscall.h>
> +
>  #include "hw/i386/x86.h"
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
> @@ -117,6 +119,30 @@ out:
>      object_unref(cpu);
>  }
>=20
> +static void x86_xsave_req_perm(void)
> +{
> +    unsigned long bitmask;
> +
> +    long rc =3D syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> +                      XSTATE_XTILE_DATA_BIT);

Should we do it based on the cpuid for the first vcpu?

> +    if (rc) {
> +        /*
> +         * The older kernel version(<5.15) can't support
> +         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> +         */
> +        return;
> +    }
> +
> +    rc =3D syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> +    if (rc) {
> +        error_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
> +    } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
> +        error_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> +                     "and bitmask=3D0x%lx", bitmask);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>  void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>  {
>      int i;
> @@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms, int
> default_cpu_version)
>      MachineState *ms =3D MACHINE(x86ms);
>      MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
>=20
> +    /* Request AMX pemission for guest */
> +    x86_xsave_req_perm();
>      x86_cpu_set_default_version(default_cpu_version);
>=20
>      /*

