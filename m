Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FDC53B651
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:45:26 +0200 (CEST)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwhOO-0004t1-Vo
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nwhKj-00038p-Bh
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:41:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:22737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1nwhKh-00011W-4l
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654162895; x=1685698895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=OP04L9/GThO3J4CUI16ZuT16f+b1JTbrOmnsQLuUUao=;
 b=MfNlmc1Kxa9Xt5htnj0SshHNz01xqWa/lNzZoZIubCau5fSNBNH5lQFd
 6KVhuZ3rFTEwJnAZWyC4MhzDgPhXpNgOjEqS9zrPfs7uNRgpBgZehhBZ5
 iWHu4Pnz/tiyVm7dy6goA4TlfnPvNHbPR+PZ6/XGNDcAY4HlGITMSRvz3
 bgX7A+xNx+lx8LaSYRZOOD+8YmVto28piLgJtYf9tVam1Et/dYtmEqW4O
 T/99Pg3hG5sklo1lGe2wOhUPdPBKJ6yl0nTrN9rKrX94jiiZ1uZLKC95b
 k0RVkhqnCtdscNzmanu+wfY0iMo0ZaODekfsMZEMZuRVcgaXJHZu3/eZB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275970165"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
 d="scan'208,223";a="275970165"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 02:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
 d="scan'208,223";a="904903051"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2022 02:41:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 2 Jun 2022 02:41:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 2 Jun 2022 02:41:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 2 Jun 2022 02:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb383S7Q51mBalMEreCBKDJanJ9b7mQ7BK4Kbgea6oDYicivV8ctDN+eqnCWw5/RLD9WjbX8y8H5nBUooXbH0btfvlytlT9P0oB715Rd+an7qMFmfCCn2DfuoSIJ5OHtzk/1gdlFknEwZhsUPFS155eaKZ677XiZ/KEJeaDl7UonAKCaFOzXw0Cp7be5F+yYzsctV5oHzbBzZUvFaU3LRXSn0DaRI1Xs7TLYXpperGGYEwzXev78w+u9CBJt5dXKoRaWOsZyWAHQj5U4EGWuFJEGwJg+kgqOtB0zsaR9fvwgLLXb/kpIjIxdCsltp/KBzPfmRXy2Yq1cF/4eEFWAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTZ5ZXs8IHqKD/t87Z2NTUNX8dZbyKpNs58llenJHc8=;
 b=CH5BHRplF8pDBIC59r5wUuODb0Venod1EC9HLtcOfFL4EBmmsid6doUluebYWXwY/9KyTKgbSfFOnwukFqtOMjjRJ8XexgPtAGBGD7mVgYil+VLJYS3Kzo1JzjW5Is8/ly2ILc0Y3BvugcV57xAtZ5oyfb/SB4sHkFCKVne0YRM5fz+bIqevqrA3cNPAaOim3v1pUZNSBMznBJtuWvIv1WpF9oZ66FShMvlei6LA18YQ3v6jmLUM2WnU97QGtfwJTDZQbW/DtSIHP33v2ad6nwyReUdR/MLeuh1ZZ3Z57BpZcAmISTGb77e4ynL0Tt5V3+wcQoYOc38kEkjPXnwNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by MN2PR11MB4160.namprd11.prod.outlook.com (2603:10b6:208:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 09:41:23 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::9107:8a79:eb69:ac00]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::9107:8a79:eb69:ac00%7]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 09:41:23 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: haxm-team <haxm-team@intel.com>
Subject: RE: [PATCH] Remove Colin Xu's mail address from QEMU's MAINTAINERS
 files
Thread-Topic: [PATCH] Remove Colin Xu's mail address from QEMU's MAINTAINERS
 files
Thread-Index: AQHYdmKQzQYZ084+O0203ckYFNoUSa072wLA
Date: Thu, 2 Jun 2022 09:41:23 +0000
Message-ID: <DM6PR11MB40905093667839742D4C600C87DE9@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <20220602092337.235765-1-thuth@redhat.com>
In-Reply-To: <20220602092337.235765-1-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 909c290a-3dab-4592-0fe7-08da447c0e39
x-ms-traffictypediagnostic: MN2PR11MB4160:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4160AC9E50303A5BA1D74F0787DE9@MN2PR11MB4160.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bj25fOP242vdc91g3Dz4ZWnBSiPNy5iK6bUgfvp4FR1GaEQ2RnrsQGdn6slys4novE9GYnF41HXQ4sgAWHdm8D79Wf1Q1TYIhHNzc7Z1MswE0tv1sAKHXk27hPV3hGUSzNN4LljQyNJ+p9WJ9IfmS3KpIQ/ryLICLadx16GMqhx8vK4o5Tq6wKmQE2W/wEb65kHxHYp0sv7Lhnb9vm+3JUWHMOlijHSfrS3o0HURZzG71/wXjKPG/eovaM0PlANOncX8aYPbknKl5Rgg4p3jk3s1o9u5zNzxifvksUMzByZbjAq2HhAa03JnMUHtfNBQYZBRAdcDaYUi+U8jDHsZDDbmgnCF3tXvP4vfSqM9Va24Uo3G7rEnxeUXQVY8nYeb7TpOadf8ccqje448NPsMu4ad7uueHKBWRZjwjI7/kGTNWAAerc58VAA+xEoFtf7GU4BPKQOCtWIPksmAZGD6IDGZ3aULomQsLdDJ79/vzoJwGpXyU+GRTVZnV4i3lvaJmBVBOVcWoZAXwYinlWnmBKejdIjqHN9rZ+Q8p5ooOLYz577rTH2fJZC8QHuvS3I4KgERfhuxUNjJwDtdP/EaJXxGApJEBin9HHZbt0NEXXWwrzRKBBB9jBcDBMj8AEwUAeV3gFJ+f8Yyu7YzAnMlwMR7NwPsPscgclme5yEPTt9IDA2afQuubZT6TngtofkalxxAXplTXn//jcyxFnUE9ZsEccghEgAqOc3Px4LPiNSuzJCRUBJLm1MVGMS0LO89D5zTQelwq70bLkbaj1qMblSLMRdFM0x6tz4HuxFnYrM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(966005)(7696005)(6506007)(26005)(316002)(9686003)(53546011)(86362001)(55016003)(99936003)(66946007)(4326008)(76116006)(66446008)(38070700005)(83380400001)(2906002)(508600001)(66476007)(64756008)(8676002)(33656002)(66556008)(5660300002)(8936002)(186003)(107886003)(52536014)(71200400001)(82960400001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?btSBWOZ8QIR4D+VxV3XneG1/eCBItZg3YB3Zn+jOer6rGLycQpbUkyDgRiY7?=
 =?us-ascii?Q?yf2bSdFaetVeo7QR0ZjFtb0N75enRKpJTjxjYjFOQ+H3jWQ/NN198v8vGBsK?=
 =?us-ascii?Q?olDeJuv9KJTqq0QEk2EM6asTt6Eisj2q7/T+n1/D2zMi/YP9tcqhmysG67cb?=
 =?us-ascii?Q?+UqeuNr79gpyeRCKn4Occllfch7OXxRvlaFpV5zQGGjB4PgcEjAzron7VDnt?=
 =?us-ascii?Q?y/N3HeerTjw3b69Z08acCZ8EWASbweiBr4HoU3tES/MGcGtFSO993llSsFt1?=
 =?us-ascii?Q?PkwxVyFnVslfGMNBsyLqn2Bscrxdt7ee2C/aRDEKxKSGbIOx3Lx3e4i0m7Cq?=
 =?us-ascii?Q?2X1BmpdeXigZSNZ/mtgfPG8zLyDMI1Xa401rQkMy2b76+R3lyjN4ZjkhpQB/?=
 =?us-ascii?Q?33bkvfKQ9YiHKyQr9+XoryxaNQ2vx8DvmZVEmMtS2cGyESO1mzyhow92m7+x?=
 =?us-ascii?Q?fuYa5pl10qL2t6pZiilXBtTMz5XedMQjdbdFDLm9VDsbjqPA3ABI4DjNqyZB?=
 =?us-ascii?Q?bi+yFUN/if7sz9DHIvEl/cThYOl/NWeVk722L8UMdzh5gNwURlxBC0ALdMhw?=
 =?us-ascii?Q?myqQo0MJgkmzQoYCvfr9MqrL5NW0OHKWOdQEC5PwUGE0dqSccv0Wb6ZhHKNw?=
 =?us-ascii?Q?uBjVWSd0QHcNG+mt87GR+Luyy1pPAjjaJiWLIS5vi8svDQE91z3Kg/9Msc/y?=
 =?us-ascii?Q?hQlhuozHMQZsHbbT9Q1LizgBevAUfRwAIK9WdK2l7JkMSvq2bYkmxVwBo4ja?=
 =?us-ascii?Q?MS0cqFgHMFonsoba8cZ6g+FPLyrszueBxwhLw/aP1jLjBM9s918NB1M5L+Yl?=
 =?us-ascii?Q?tTLu2sGoils0OgS9Xf6QXXpuiGPzDlzKR8XchTpKrCGhSQj9j4m74sR35GMA?=
 =?us-ascii?Q?HzEZ96q8RUIE3DyWVXdqwEclDxw99D13Y9UTjAvUCeiSBwG6Q0hQAxqR3aCl?=
 =?us-ascii?Q?ehB7TSavtjfU6bSwMi/46Qc+nRfGZaVhcV9ca6zZUfQio7/msmmW4nVCC+w0?=
 =?us-ascii?Q?/uRBW67Qrx9yZK6tpoy6kGtqnHgEJVWkwmm8MQvwqRij44voMylWAITD6aMS?=
 =?us-ascii?Q?lk2Lsa+2SBBzd/SAyU81WZ5Da5RinzuZAXQTxwbukDBkEeAZ9x0ve+sz/Tgb?=
 =?us-ascii?Q?595J8+ujGozB3vUTdPozflkU2qkJ8ygNavuAjw+uFEt0z+4zV8BWqUvQ2W8o?=
 =?us-ascii?Q?6eQOzGnapo7nOPoqM5uFk8Cgf6tkcN2z9DELcVT+sYUrf4SRY1WxOIAZGJkx?=
 =?us-ascii?Q?ojdu5PybZvQYAduXyfSrOfwmgnpL/D5rckKZc0GZk/Tx0XfkwJK96vAFjrm6?=
 =?us-ascii?Q?C1/oexdqytuzo1/KsW6afqJAlO1XDxh3zYYAFqDQ12aQKC1zYxOT/fJPl9dl?=
 =?us-ascii?Q?b0TbXhdQ4JIXa08bmMJHJ8ckpM4UgUCpJ8nle4vZKN2N5m+yedaoxW5b9Dcn?=
 =?us-ascii?Q?B4AqhE1p5/5OOfDuBwl91EDdrrGn5vXWmXEORcUhCyf17oBuvkpOsnqJTRL3?=
 =?us-ascii?Q?yGu4B/2YJjxL3o0PPU1xam/QKeBG0bNRNchwxNNKvArokDOBzFdhIDjkAh5c?=
 =?us-ascii?Q?3pF4QrVokXSdDP0jQlkJOEiZSMmc23mk2ioCpCyeYUL1f2NIwHCbxG1iK2VY?=
 =?us-ascii?Q?pyACWCFp6Ly61ut4jApUFQ60ksRkyf1+jru8g9/MAB2719leCg+6HQgLorIC?=
 =?us-ascii?Q?JOCiRviToRZ0wzTkPCnQEftcpDROePZ+/HseaJuCxgSYesURw3GHanrKSXIZ?=
 =?us-ascii?Q?915cadLgAg=3D=3D?=
Content-Type: multipart/mixed;
 boundary="_002_DM6PR11MB40905093667839742D4C600C87DE9DM6PR11MB4090namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909c290a-3dab-4592-0fe7-08da447c0e39
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 09:41:23.0819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSgqBDdrZIVQOKNCqYZg1dxHqC1zlcN/YG8skSEL+xlHqJZCtjXCsoOWj6i63iMFcnAUKLZ8fzFO5dl7weFbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4160
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=wenchao.wang@intel.com; helo=mga14.intel.com
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

--_002_DM6PR11MB40905093667839742D4C600C87DE9DM6PR11MB4090namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

Thanks for your mail. I once submitted the below patch to qemu-devel@nongnu=
.org but it has not been merged. I have pasted it as below and attached it =
in loop. Thanks.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
From 2257272c08291006bad5e9a44f48e7365f330640 Mon Sep 17 00:00:00 2001
From: Wenchao Wang <wenchao.wang@intel.com>
Date: Tue, 15 Mar 2022 20:51:22 +0800
Subject: [PATCH] MAINTAINERS: Update maintainers for Guest x86 HAXM CPUs

Clean up the maintainer list.

Cc: Hang Yuan <hang.yuan@intel.com>
Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2..36f877cf74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -492,7 +492,6 @@ Guest CPU Cores (HAXM)
 ---------------------
 X86 HAXM CPUs
 M: Wenchao Wang <wenchao.wang@intel.com>
-M: Colin Xu <colin.xu@intel.com>
 L: haxm-team@intel.com
 W: https://github.com/intel/haxm/issues
 S: Maintained
--=20
2.17.1

Best Regards,
Wenchao

-----Original Message-----
From: Thomas Huth <thuth@redhat.com>=20
Sent: Thursday, June 2, 2022 17:24
To: qemu-devel@nongnu.org
Cc: Colin Xu <colin.xu@intel.com>; Wang, Wenchao <wenchao.wang@intel.com>; =
haxm-team <haxm-team@intel.com>
Subject: [PATCH] Remove Colin Xu's mail address from QEMU's MAINTAINERS fil=
es

Colin's address bounces - seems like he left Intel. Thus remove the entry f=
rom MAINTAINERS now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00dc4a8ecb..dbf328cc94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,7 +488,6 @@ Guest CPU Cores (HAXM)
 ---------------------
 X86 HAXM CPUs
 M: Wenchao Wang <wenchao.wang@intel.com>
-M: Colin Xu <colin.xu@intel.com>
 L: haxm-team@intel.com
 W: https://github.com/intel/haxm/issues
 S: Maintained
--
2.31.1


--_002_DM6PR11MB40905093667839742D4C600C87DE9DM6PR11MB4090namp_
Content-Type: application/octet-stream;
	name="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch"
Content-Description: 0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch
Content-Disposition: attachment;
	filename="0001-MAINTAINERS-Update-maintainers-for-Guest-x86-HAXM-CP.patch";
	size=807; creation-date="Thu, 24 Mar 2022 00:52:00 GMT";
	modification-date="Thu, 02 Jun 2022 09:41:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMjU3MjcyYzA4MjkxMDA2YmFkNWU5YTQ0ZjQ4ZTczNjVmMzMwNjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+
CkRhdGU6IFR1ZSwgMTUgTWFyIDIwMjIgMjA6NTE6MjIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBN
QUlOVEFJTkVSUzogVXBkYXRlIG1haW50YWluZXJzIGZvciBHdWVzdCB4ODYgSEFYTSBDUFVzCgpD
bGVhbiB1cCB0aGUgbWFpbnRhaW5lciBsaXN0LgoKQ2M6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGlu
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPgotLS0KIE1B
SU5UQUlORVJTIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZjJlOWNlMWRhMi4uMzZmODc3Y2Y3
NCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQ5Miw3ICs0
OTIsNiBAQCBHdWVzdCBDUFUgQ29yZXMgKEhBWE0pCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KIFg4
NiBIQVhNIENQVXMKIE06IFdlbmNoYW8gV2FuZyA8d2VuY2hhby53YW5nQGludGVsLmNvbT4KLU06
IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+CiBMOiBoYXhtLXRlYW1AaW50ZWwuY29tCiBX
OiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaGF4bS9pc3N1ZXMKIFM6IE1haW50YWluZWQKLS0g
CjIuMTcuMQoK

--_002_DM6PR11MB40905093667839742D4C600C87DE9DM6PR11MB4090namp_--

