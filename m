Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCE4893D6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:42:47 +0100 (CET)
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qGM-0006ev-D7
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qE0-0005kX-0O
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:40:22 -0500
Received: from mga02.intel.com ([134.134.136.20]:22791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qDx-0005Xk-8a
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641804017; x=1673340017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wRm+0YJJc+EHMc0HtBllgKYyS7kPQI1ksAnKt3GADKw=;
 b=b48xvrfZCocSmKQkbK9KTYo8Cw3EbHB8lmr7LWWvVZHdPBTBW97v5S59
 1Wt+rz5REb67Lb2htv4cybviCUFqivi6cMJvPmaoCy8rG8pZUARZz/C6W
 tgnbnA9t+BYdiauB6fcOEc51j4yHajTWHK05dnSBh+R4lsj+hdO/SnMS8
 F67Rmggk81R0LhgfHNVmJkM/HTNU/PYgheubexJ9TFBKErh8tOjV07Q5K
 03S5n2dQEQIt8OsLOTdbPhwfFM8I/+tAanS7fCjGfnawXMqQ5smUV6AjD
 G+Is3wsIvpxDg5VkhuhWM1kfFVqVa6ad8c4SlNHhuiEolwf4Nd2XdUVqF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="230522734"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="230522734"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 00:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="762098188"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2022 00:40:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:40:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 00:40:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 00:40:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjEkoviqfNRUAeS/8qlkdbVbGC0AbyGxUFvEWaEgLAacjaM9W/hlGcmqLokstFuwdeuvBF+WkIpWJlqKHnI+C883fuyrm1NdG2HSzkMXj00xOl+X5uxJ/O8N5PfqlkxzDTkFI3P7/vochKq5MxI8wu5J/pJ2Xfb6cGxpbhoSJM8Ltj5R4dbB6zaQM1jmOq0CQqsTQ040mXXim/NOD2Gstv7oxSl3QcWScZ25xGmewmvZkiJ/jXWpE54oGB+Yk7rlx6YKs53PV/nkR2/XxOo8KNmLtcFjTJvTWNu7i3RA5vEPiLup1iGzoKDlpnoVkH4VpF78J7ApWobk5L7WzHsf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYFw/0n8/EmkhAXLy3f/RWoKPyvZYora4rGcJYPtdo8=;
 b=NFOSKvxqiB6xtKNhy0tksc3MqHYPMVcvjGH5P/GVddW1tWLcYu+p9g7CuLEKjv3SJGM2nPSxvlJuaLIErqookFok+lE3XafTq7qHDs9/IeDbwP6rNlysMGI9OZd7QTFdTyWGiE+QMaFi5JzeBypYA7iN7awPiB6nmE8RSDHew6rqQ9TTXyU6oJWgUHgf0DDDGYcwYaHgaHMXixDdKHf2nJq2SYU0t7ela5ArLeX4UF5Wuv9+IldwGyxPQ9IBbZBpoinEzpIyis/amwZoqGB3W8uX//TJ7ihCJq8brtmVzx1keaGPo4kmWukVvRMmG63MIxM3lYXQbexVle1DxL6llA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB4178.namprd11.prod.outlook.com (2603:10b6:405:84::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 08:40:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:40:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Topic: [RFC PATCH 6/7] x86: Use new XSAVE ioctls handling
Thread-Index: AQHYA6lrudKRVK0NLkej/6hKJ3aX6axb85QA
Date: Mon, 10 Jan 2022 08:40:10 +0000
Message-ID: <BN9PR11MB527600E4DD1EA7BE7638A0518C509@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-7-yang.zhong@intel.com>
In-Reply-To: <20220107093134.136441-7-yang.zhong@intel.com>
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
x-ms-office365-filtering-correlation-id: f35aa9f6-0228-4c51-65ab-08d9d414d06e
x-ms-traffictypediagnostic: BN6PR11MB4178:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB4178C125D38D00DDC31278E08C509@BN6PR11MB4178.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jlWJO+KdOmS21WG1nP+i1rOCjSwsTk05LmgL8etvXPH1UDxGS1iwhaIJ79cLpw0yDujXe8CN9K3ZiZ2188/6hqx97kXPdkItBlIUyLNxwtgwVVtCexhAqmGHDXGyN6oARzvH2Oj2W8QRIgm87NlQFnmkcmFRHYrKJfNfJmfG6fN368ic2D6VnfDbNNs4gZm2+nPNgGR8CXlaJUWmnHTOMiob3B+Re5dftQgG95BqtZx4EAzKjgL4w47PXTWiQbYNliSOWffClPwgz+GRLwTJZXL9vrdtCFOeGRoxEEMgpx0CpY5koDJWpdHpdRVAftoThP3QH9kstsc7uHz8eshtsd82PpNFaqThipTCPxqJyJMZMfPWGo0cDczra3d2ZqRCJLngKrgR6I9x+png4x/0Ji7ala0Ex6O1OFxwUdh4vuNYPcr+8oOObjKS5dwMwNGi3U5hPCRVeRhDQAZxQHPwvd5zrsu2Y7asjsy9kZ3WaJga2yqq4W6gmV0MItbyDqF7vUAjm7Knfi6fFdS6eSjADde6E+FrwaSGkgn5lKwSmaVihvqceu6H9bZ9KlYnU2LzGaKI/uvoT6WRSUT1iZ980tZ5ocT4971DO+p5c7wzLDulrfQz9I1GYlz2qlFGCrRHKRqGVHVVeqWCJaHWUJ2dDDKr5Bs/SX42WtOOJmrRYjp7Qv+i6KxDEx1JNbCWgTXP/rud7qbCgrkPR7G+uzj82A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(83380400001)(4326008)(55016003)(122000001)(33656002)(38100700002)(9686003)(38070700005)(5660300002)(52536014)(316002)(110136005)(54906003)(71200400001)(7696005)(66446008)(64756008)(66556008)(66476007)(508600001)(66946007)(76116006)(8936002)(8676002)(2906002)(6506007)(26005)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gtEkr0gJZSQsoOTrTrg+JxkDnMDPu64NyMUp4ASTGtl3m6vDdsG/ef2rRlD7?=
 =?us-ascii?Q?QO4pjYDwYFs9QL4nG+JuZhWVs1/ngKdygAfzcvehADkK0g08ffYnJMvIAvpo?=
 =?us-ascii?Q?aHhGxYjDVc9larVL0QikmHaNcHoQjyIxj5zGdnFrO8blaoWsXChtZlJ243UX?=
 =?us-ascii?Q?buaL4G6NNRE9RBhwkMS5PUevRJXyIHGbxxUwU4bomnBOg13PxO4+8xmmE5jb?=
 =?us-ascii?Q?J+C/D7SHu94RO7dD+nIcj+ghXj5Qng1LIZv0eRNbuQHd2tnihjjMOqrTdGUD?=
 =?us-ascii?Q?PrAVKBmVIo7Cc95smYSsLxWk4Ka3qbnS6tOMml7yOQl7ttBokxpjuqI8iiem?=
 =?us-ascii?Q?VAN7hFqkYL04PcMM1pNROoOscBUKcdTUsTrbhLWBpX+0et1GaplFhnJ3e6M/?=
 =?us-ascii?Q?LnQJNE14DXugAz2aiWlRxbXkzvm/hcWu3BG8G5Blzao/P98LXRVqCvDMtSck?=
 =?us-ascii?Q?PmYheqhJoe3OA4ZHjdcLWXaZTpdi8GWvHDe8AcxAZ8DKs4xAla6RlPhuwXh1?=
 =?us-ascii?Q?IkbaW/VH5cgeWxRf5vYvVjTxm2MSFr9PggDC0bBxCYRJsjeJUqmiWbj8ntb4?=
 =?us-ascii?Q?vnnm4+mZUGwg83sOPa7Hts9Us8ZZDruEWSp7TbsmDlbW/EVWTTuOQU3GmyJt?=
 =?us-ascii?Q?A40x4XqQ+G4fjwuw2yIMZoCYi+gvN6kUmL14Paouwmy7KNOr/I1/cos813El?=
 =?us-ascii?Q?Uqkaaud/ydDZQiQsch+FlX0go1Ly2LAfbC91TTMpYC1LNAM10g/4U2yq5dQP?=
 =?us-ascii?Q?6GMv0z3h+R9cQmOXA5qpSfXsYGopUdmyaZLbOLlKWDSkgwx0SxGxf+ZJ2+AM?=
 =?us-ascii?Q?u1XQl570wX5q35SStEeii+HRstlI7ci53y1Oka9ZjiKCSFqVlJdzDA3RgfT8?=
 =?us-ascii?Q?AuVRv4JV5XGZ5C7lx4o/HY6LlJFFNu/0vG0zbafsfx3vCZFWYY5fQ3+kLzM1?=
 =?us-ascii?Q?H8U47XDw+TWuLm0ckDT3fqSHm+PSQbJM682kcf8Y8o5eIy8IBaBKkAOFIMb7?=
 =?us-ascii?Q?hETeOrF1pUvoMNqqtWpIPK82Arr/rmhqX7TzEv0cAxkwCZQcSNE3iNdUNpuf?=
 =?us-ascii?Q?y3aIHJeRPvNPBNefsrFdwiq3drnfgzy4zgyWjpY+2pQ6XEEzvCVJdNcyX0cL?=
 =?us-ascii?Q?VAWf58exQyiHtScLRoFNq7wdS1Ng6Xgj+kBMpUx6U7xnSNN1g55xtLytChhM?=
 =?us-ascii?Q?iM8nJ381qXEdQ4V/FLYaIwWCzPW/uBFG+9JwbMI/k2xTiCwUmihfNuX/sj7/?=
 =?us-ascii?Q?pmjRHrR8F6ZxUKykboyh07gPBSflUakp0DPYUQ7UFnmgXdJ+KdbMimkr3GXX?=
 =?us-ascii?Q?7eWsDWc/1wt9HUuETtU5CMUukCVLGfTm7VmnRNP/F1oDDASa/DUEY/8UePhF?=
 =?us-ascii?Q?nailBcc9XSmYFGKEJ8/kaGoOVgaDL9gYMFA9C3olkwG2MUgTcRpxn0GErpSE?=
 =?us-ascii?Q?8QpcSkfQwqaFRgaY8yXmTo3vZDZf0yPFYCpWRZtL+7UHcP0QzplwX0CFYeLN?=
 =?us-ascii?Q?AjAQdBqMCnbhVLod3J/ppYkBqE43ODVcyt4UT/I+qH7cscEFv89TnVBcAy/+?=
 =?us-ascii?Q?BahwT0JX8Hr6n61IOEGhElbc+4DshfwCKZ1jaCP7GxMhatIBwXJ2LW81eHgP?=
 =?us-ascii?Q?HLayRy/HKtVeUXNipCnH5M8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35aa9f6-0228-4c51-65ab-08d9d414d06e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:40:10.9831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jttfwDAqETRkXBABvl5DaiIkd04TsmeTDOKrqKMXTCbRm7BzUzDq2ebCwlPrimdw1WVS2ojWDUe9uHHHfBFe6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4178
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=kevin.tian@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> From: Jing Liu <jing2.liu@intel.com>
>=20
> Extended feature has large state while current
> kvm_xsave only allows 4KB. Use new XSAVE ioctls
> if the xstate size is large than kvm_xsave.

shouldn't we always use the new xsave ioctls as long as
CAP_XSAVE2 is available?

>=20
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  linux-headers/asm-x86/kvm.h | 14 ++++++++++++++
>  linux-headers/linux/kvm.h   |  2 ++
>  target/i386/cpu.h           |  5 +++++
>  target/i386/kvm/kvm.c       | 16 ++++++++++++++--
>  target/i386/xsave_helper.c  | 35 +++++++++++++++++++++++++++++++++++
>  5 files changed, 70 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> index 5a776a08f7..32f2a921e8 100644
> --- a/linux-headers/asm-x86/kvm.h
> +++ b/linux-headers/asm-x86/kvm.h
> @@ -376,6 +376,20 @@ struct kvm_debugregs {
>  /* for KVM_CAP_XSAVE */
>  struct kvm_xsave {
>  	__u32 region[1024];
> +	/*
> +	 * KVM_GET_XSAVE2 and KVM_SET_XSAVE write and read as many
> bytes
> +	 * as are returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
> +	 * respectively, when invoked on the vm file descriptor.
> +	 *
> +	 * The size value returned by
> KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
> +	 * will always be at least 4096. Currently, it is only greater
> +	 * than 4096 if a dynamic feature has been enabled with
> +	 * ``arch_prctl()``, but this may change in the future.
> +	 *
> +	 * The offsets of the state save areas in struct kvm_xsave follow
> +	 * the contents of CPUID leaf 0xD on the host.
> +	 */
> +	__u32 extra[0];
>  };
>=20
>  #define KVM_MAX_XCRS	16
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 02c5e7b7bb..97d5b6d81d 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_BINARY_STATS_FD 203
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
> +#define KVM_CAP_XSAVE2  207
>=20
>  #ifdef KVM_CAP_IRQ_ROUTING
>=20
> @@ -1550,6 +1551,7 @@ struct kvm_s390_ucas_mapping {
>  /* Available with KVM_CAP_XSAVE */
>  #define KVM_GET_XSAVE		  _IOR(KVMIO,  0xa4, struct
> kvm_xsave)
>  #define KVM_SET_XSAVE		  _IOW(KVMIO,  0xa5, struct
> kvm_xsave)
> +#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct
> kvm_xsave)
>  /* Available with KVM_CAP_XCRS */
>  #define KVM_GET_XCRS		  _IOR(KVMIO,  0xa6, struct kvm_xcrs)
>  #define KVM_SET_XCRS		  _IOW(KVMIO,  0xa7, struct kvm_xcrs)
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 245e8b5a1a..6153c4ab1a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1519,6 +1519,11 @@ typedef struct CPUX86State {
>      YMMReg zmmh_regs[CPU_NB_REGS];
>      ZMMReg hi16_zmm_regs[CPU_NB_REGS];
>=20
> +#ifdef TARGET_X86_64
> +    uint8_t xtilecfg[64];
> +    uint8_t xtiledata[8192];
> +#endif
> +
>      /* sysenter registers */
>      uint32_t sysenter_cs;
>      target_ulong sysenter_esp;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 3fb3ddbe2b..97520e9dff 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1983,7 +1983,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>=20
>      if (has_xsave) {
> -        env->xsave_buf_len =3D sizeof(struct kvm_xsave);
> +        uint32_t size =3D kvm_vm_check_extension(cs->kvm_state,
> KVM_CAP_XSAVE2);
> +        if (!size) {
> +            size =3D sizeof(struct kvm_xsave);
> +        }
> +
> +        env->xsave_buf_len =3D QEMU_ALIGN_UP(size, 4096);
>          env->xsave_buf =3D qemu_memalign(4096, env->xsave_buf_len);
>          memset(env->xsave_buf, 0, env->xsave_buf_len);
>=20
> @@ -2580,6 +2585,7 @@ static int kvm_put_xsave(X86CPU *cpu)
>      if (!has_xsave) {
>          return kvm_put_fpu(cpu);
>      }
> +
>      x86_cpu_xsave_all_areas(cpu, xsave, env->xsave_buf_len);
>=20
>      return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_XSAVE, xsave);
> @@ -3247,10 +3253,16 @@ static int kvm_get_xsave(X86CPU *cpu)
>          return kvm_get_fpu(cpu);
>      }
>=20
> -    ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
> +    if (env->xsave_buf_len <=3D sizeof(struct kvm_xsave)) {
> +        ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
> +    } else {
> +        ret =3D kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE2, xsave);
> +    }
> +
>      if (ret < 0) {
>          return ret;
>      }
> +
>      x86_cpu_xrstor_all_areas(cpu, xsave, env->xsave_buf_len);
>=20
>      return 0;
> diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
> index ac61a96344..090424e820 100644
> --- a/target/i386/xsave_helper.c
> +++ b/target/i386/xsave_helper.c
> @@ -5,6 +5,7 @@
>  #include "qemu/osdep.h"
>=20
>  #include "cpu.h"
> +#include <asm/kvm.h>
>=20
>  void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
>  {
> @@ -126,6 +127,23 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void
> *buf, uint32_t buflen)
>=20
>          memcpy(pkru, &env->pkru, sizeof(env->pkru));
>      }
> +
> +    e =3D &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
> +    if (e->size && e->offset) {
> +        XSaveXTILE_CFG *tilecfg =3D buf + e->offset;
> +
> +        memcpy(tilecfg, &env->xtilecfg, sizeof(env->xtilecfg));
> +    }
> +
> +    if (buflen > sizeof(struct kvm_xsave)) {
> +        e =3D &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> +
> +        if (e->size && e->offset) {
> +            XSaveXTILE_DATA *tiledata =3D buf + e->offset;
> +
> +            memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
> +        }
> +    }
>  #endif
>  }
>=20
> @@ -247,5 +265,22 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const
> void *buf, uint32_t buflen)
>          pkru =3D buf + e->offset;
>          memcpy(&env->pkru, pkru, sizeof(env->pkru));
>      }
> +
> +    e =3D &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
> +    if (e->size && e->offset) {
> +        const XSaveXTILE_CFG *tilecfg =3D buf + e->offset;
> +
> +        memcpy(&env->xtilecfg, tilecfg, sizeof(env->xtilecfg));
> +    }
> +
> +    if (buflen > sizeof(struct kvm_xsave)) {
> +        e =3D &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
> +
> +        if (e->size && e->offset) {
> +            const XSaveXTILE_DATA *tiledata =3D buf + e->offset;
> +
> +            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
> +        }
> +    }
>  #endif
>  }

