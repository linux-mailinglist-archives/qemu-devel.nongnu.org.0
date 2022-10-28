Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD7610888
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 05:04:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooFce-0007za-Hc; Thu, 27 Oct 2022 23:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ooFcP-0007zN-0k
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 23:01:13 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ooFcM-0002gd-Qo
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 23:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666926070; x=1698462070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q7e3qbqm5NIFgkW1vuf08AOeLFCA9PvUyP0qNLvSihY=;
 b=lUyDJGKjISPcDDlW+TiiwXlbLahVDhnA3dHOi2avCmweBkZNPtEnRgge
 Ys9mOGyyqnixnfmZIfTIpDreJdDLh2jLQ34yoeR1HAoeIb2LwpFpFuQiK
 EbA/z+b05cELhpomTQDR+0Aft9Sc+ZlmmROjyWe2Miv4laR+db2RPnPOr
 9zLEFxv7TRpAfVYdlse+s6B+p9lE9wTUKdTiPcQ0g+Yp6NxgIIIjxXZSx
 pWYEyqmI5AER8sQZK06+GC+do71DmEza0ufCk95MkHruP9fkfbW6yswka
 uXFrZZXSyv0S0HNtXqxrsVGr1bdtI3pmRtAenvq4F+rCqytJ44AoA5F2k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="394709361"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="394709361"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 20:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="737939812"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="737939812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2022 20:01:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:01:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 20:01:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 20:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjpLwijt/P2d6bbDLUiObiU11B8hBEVbRzOELzL7XLZh7Vt6W9JymVhqytd7uZev9E/0lTko0x09gSh+iZ5Vd1YRNF/vsSNUPdodkkpO6ndhlInXExNRby2e9/tCBvZtG/vQzCepgonbALgDoO0+UeOwwxDVMjgOQ0drlaqdwmXPMOZUxBpT9raVmABHjEW8pjFE+KiTGmcnV6jlW8wortAGAZdlrjhA13L95Sg5KdfLzO03ScQKFg0eb/uvIuW1RHotZZsIFPIH5MQOA+Eb2b0ZX6IF8xjhb2SGAhWTvc4MAcwn+zJEDHXnf20r8kFg8YC/ck194FN+4aOaommGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2wso7HoRYq9pNukbK5zjdKRWsZHwAhyQlk6qhuV5e4=;
 b=nXbb7VhddB+/ygT+6jIjHvXHhpHi1o08jpb1iX7a4oebUl5LLsrvyw4bLSR0w9nvNdt5YIq6EG9zazIb0lI7DaIXfrs5i8cd4QFv98HMHowiBso74cJ2nQZV+IF0Vwkr+Y+vA+fJqn/n4u5pbWmlLyNJvMPmijTQ8+Pxj2B9//xjCHrK8oIjJ8W25cYD+5OWd3sRV8JsITsAY5sjALI+3//Yf+vbLqp5FShoX6EnnPUte/m+a5caIPYrrc2zUKOJwV0SXzhP42LQpPa6naCbrcLFy898KI7rB1q/RTgo1lB7syvoOShnjln0YlbyMWc9PUyaRdnuTUDrCMk4sNKVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by BN9PR11MB5402.namprd11.prod.outlook.com
 (2603:10b6:408:11b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 03:01:00 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740%12]) with mapi id 15.20.5746.028; Fri, 28 Oct
 2022 03:01:00 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "david@redhat.com" <david@redhat.com>, "f4bug@amsat.org"
 <f4bug@amsat.org>
Subject: RE: [PATCH v2] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Thread-Topic: [PATCH v2] softmmu/physmem: Fix input parameters for
 flatview_access_allowed()
Thread-Index: AQHYnaiKG4Izqvd4OUy+/xTIHoJMoq4jtyfQ
Date: Fri, 28 Oct 2022 03:01:00 +0000
Message-ID: <MWHPR1101MB2110C6F0B15C58E0DCCC45EA92329@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220722084539.187393-1-zhenzhong.duan@intel.com>
In-Reply-To: <20220722084539.187393-1-zhenzhong.duan@intel.com>
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
x-ms-traffictypediagnostic: MWHPR1101MB2110:EE_|BN9PR11MB5402:EE_
x-ms-office365-filtering-correlation-id: 2b167573-9166-4089-83eb-08dab890a4d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AmjNJgMlT0OAuK5vx26FRV9Ss6E2Op9MVh/cxsa4bP4GUq4JlCAtndTh+syhYtK90YU4YYZR7IAc2iky1AmUYUYdtcgjvvQl7Q/j4whnBUZPPOvFe0FglHLljazZF4MH7zRowNBu7+4diNsUKvFDBR7v0ejFn9dj+mlrbagyOe4uI4Favwk39NThTrQPrcFLR5ItljsfKuitIKWglQn5aaHFTgkZXzz3c+Lwgpr0z4HEn5lBz+jiZLeyxPMachMGcQM6/y20tjip9nf3hQeuUcjVy/wKHOzUMV9GQH2evqrc5UC7PvwQ4ZZ0c+gDO4ZiK+E/k0oIrEEN/YbY2A3Vauw7u3/+hdshmmmj4848U7BZ4fXVRQdZLjN9khqNo0mhsvnSw4ipP2TozG5YznVEzGRkQEiMdsgpfP63dZ6plxWN6Xq26rg/2eSZZGk4qqFDesNZBNfufvhlS5tNWMRPT97Gh8rK4RqPYYozk3BQN4e/Nzjza4vC0sK7yIhT/acGXVyUw17DhY7/a/JZqj6zJa0oOaU+xUWvuS9cIXgkAGeQMacECrQiykokqRoyYw3K5Vv3xv5EseAytzddCMyxbsxpsQnqKE/ofY/b+PHB2X6AzX6FFsLaNt0tZQXC40Y6Im4qfOcUIXtr+U/ULezzfp/ffuR5dchG9gsfUPwugRVtH+P+4NArY5vSRfAFT8Vk7ny6JCoo2WpLL71I3jSdgkgrlxHPsti9Eznjre/v0H5Rv1+p7Tec7Aq5oT3efGxY/4Q4sPmUCQQCae7h2smtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(2906002)(8936002)(5660300002)(52536014)(33656002)(478600001)(71200400001)(41300700001)(83380400001)(6916009)(54906003)(76116006)(316002)(66446008)(66556008)(64756008)(66946007)(4326008)(66476007)(8676002)(86362001)(6506007)(186003)(38070700005)(55016003)(82960400001)(38100700002)(7696005)(9686003)(26005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZiyHZ56C9ZpbpkrXsMb0ckUYOfXfnRB5FukYLPe5hr93Es8nlE3Z3XrPHqzW?=
 =?us-ascii?Q?HK6L6eqMd/YvJ7l8mIVLptv3tdV8e8pUUdWCv7nYz0TqcgQOwIlVsBTnXol3?=
 =?us-ascii?Q?tlp/vKUcR3D98jsEy7lwsyEKCTaZKdh11uEd5aCGneiz4tpJTYmHN2W8jSR8?=
 =?us-ascii?Q?Zp2H+2ZqLYl+6PzGqPBugkckqIPdpS7wfPy6XXWUMbMwfxcp8m+ywX56Po+P?=
 =?us-ascii?Q?i+hDyy9iI8Vs3O33OPE8tVgwdlH5NTX9CaxwyDwAq6741unX967xKxDCvaY2?=
 =?us-ascii?Q?iCiI2GfQuhoKV0gj+zJ//VhX8TD5PwGcaj+3nPAojgrGwA9QPqJ99Ye30VFY?=
 =?us-ascii?Q?9D9WU5tSHfdJw7vbqz8plNxmmrJA0pTcjkKf1LR/3WGHfe/xSKKH8VubMyxz?=
 =?us-ascii?Q?/XsKJJWwfZeqsaa9+xYnRRXOwJfbc4k0y0AllmAhp1XkDmkAm0rZlKhHSVAV?=
 =?us-ascii?Q?hzkqXeVfqjBUgzsz5YNAl9rjMPTfCHKSnkbWXGNE3xiYkCuKX9c8RPR9AKRb?=
 =?us-ascii?Q?xDo9I+5eaJ8QFssvnk1vOlRpJECg2/FvZun0/OsJKha1mlrvhlobiXp1+vuP?=
 =?us-ascii?Q?4iArXBIqu8B0cEMIFa8JvWG04XdokhQ8rvGL35r82YPnRZKJyYvLUcFJWihJ?=
 =?us-ascii?Q?+JsqqNzugGCoM8A7L6sPs1qwPNZEO4yz2jHnF/A1nePw8Ihxf+v3TqhNLu2Y?=
 =?us-ascii?Q?gNdd65mOK2c/2DUDB27etCBrQiVjP6Vo4jkguqhvsD9YwItLlMjpscEO3wuL?=
 =?us-ascii?Q?YvDNjamT4J4gn1Xch0WaoN2u+iEkNiurQoTIYYLXMOzXpeLdSCZnf3h516kZ?=
 =?us-ascii?Q?NJVNoYW98e9o1axUf+wSGUaIyw5ZF1Gq4Z/BpL9YxuV/rktbwXfOCg/VJFuk?=
 =?us-ascii?Q?cCqKJo/wWrFYZH8Rd8zfvA4Y/hzdjID9uESgLn/dZOnksu0PYZbmGVQFrt7j?=
 =?us-ascii?Q?Svy9r3yU3WxTQJiPUWt0VZIoaQXEGHH0RUA93Ux1xRz8njCLcLGYLL6+wx0d?=
 =?us-ascii?Q?4/gY4rIXVEEtyEzwZvdnObtCSyK9y/5pNB6gcPLhgGMAdQJiHWGhOQYo9ggu?=
 =?us-ascii?Q?VfIvOO/OKSl7V3ZjWBQPdUVcnraEUnl/jYOjZcZxz5ML5LmAv76/fhBHXDTc?=
 =?us-ascii?Q?c6TDwd9rgDjUdx3XqPK9TR6agPzsPHzCmsBEPbiCCqabjw2PjQUjIbOOh/js?=
 =?us-ascii?Q?Xc+JOcaU5UxqWpVG56UBwFgxPVN8R95XYn6rVkKcDoI+bjKMKV4cGZ0undOc?=
 =?us-ascii?Q?nyW/uZtozeLXZY+mmDBHX50El66VA3FcihdUQHqRs40jucqX9F4KjgF8VZf5?=
 =?us-ascii?Q?3gYcbi2jR4VpJcfvM1SxCbqT7Iav3bm5x9JMPwSv5i6ERtEbxevMjb2DK2U5?=
 =?us-ascii?Q?94SX6j6CE1cVU8c88LGQB3IDefGaQPYqNBhSAIGhRz+1NCkPLwkrykUZ3qPC?=
 =?us-ascii?Q?Q2+rPAbNrlfi0Oul7sUJbUoFKqE1YBj03vxQhJxoADD+duGjcOwN9o+HG9DU?=
 =?us-ascii?Q?MKz2ieXVoLlu0l1GP2m2yaly4BXklTuZVYcIqIbiyjWKDhmpysT/2hZ5EZoJ?=
 =?us-ascii?Q?qneeDuODdHnXmS4TtzDwpTVwReUvMIdk7w8wbuBh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b167573-9166-4089-83eb-08dab890a4d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 03:01:00.6029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zv1yHKlbThd829qvONPv7k+5wUyYvGCrpx/kbxKRMxf4PXSCm8b83btNP2WifxOacLVuprtvNbWSvNv6tePqMChztpnA1emY5QqipUQYBGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5402
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=zhenzhong.duan@intel.com; helo=mga05.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



>-----Original Message-----
>From: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Sent: Friday, July 22, 2022 4:46 PM
>To: qemu-devel@nongnu.org
>Cc: pbonzini@redhat.com; peterx@redhat.com; david@redhat.com;
>f4bug@amsat.org
>Subject: [PATCH v2] softmmu/physmem: Fix input parameters for
>flatview_access_allowed()
>
>The comment of flatview_access_allowed() suggests to pass address within
>that memory region, this isn't true in some call sites.
>
>This makes qemu log in flatview_access_allowed() confusing and potential r=
isk
>if the input parameter will be checked in the future.
>
>Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>Reviewed-by: Peter Xu <peterx@redhat.com>
>Reviewed-by: David Hildenbrand <david@redhat.com>
>---
>v2: Fix typo and removed Fixed-by per David
Hi Maintainers,

Can this patch be considered merged as it got reviewed-by and no objection =
for a long time. Thanks.

Zhenzhong

>
> softmmu/physmem.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/softmmu/physmem.c b/softmmu/physmem.c index
>fb16be57a6c6..214cb04c8fc3 100644
>--- a/softmmu/physmem.c
>+++ b/softmmu/physmem.c
>@@ -2850,7 +2850,7 @@ static MemTxResult flatview_write(FlatView *fv,
>hwaddr addr, MemTxAttrs attrs,
>
>     l =3D len;
>     mr =3D flatview_translate(fv, addr, &addr1, &l, true, attrs);
>-    if (!flatview_access_allowed(mr, attrs, addr, len)) {
>+    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
>         return MEMTX_ACCESS_ERROR;
>     }
>     return flatview_write_continue(fv, addr, attrs, buf, len, @@ -2917,7
>+2917,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
>
>     l =3D len;
>     mr =3D flatview_translate(fv, addr, &addr1, &l, false, attrs);
>-    if (!flatview_access_allowed(mr, attrs, addr, len)) {
>+    if (!flatview_access_allowed(mr, attrs, addr1, l)) {
>         return MEMTX_ACCESS_ERROR;
>     }
>     return flatview_read_continue(fv, addr, attrs, buf, len,
>--
>2.25.1


