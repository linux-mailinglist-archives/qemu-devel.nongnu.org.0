Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38016559350
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:23:57 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4cjT-0004Ks-HW
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o4chX-0003ZT-OA
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:21:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:7111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o4chU-0000H7-BB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656051712; x=1687587712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kh426Va9cfQoo+wQby1eR3srNZWvHZH9plp9NQ7NstU=;
 b=HInDvGU8d+FHqPJrtOno86yIOwHRdzNSNW2SOxEn8JVFnbZ4fpmuOHuL
 6VFkXU+ZYZqGhVnNnDnOqLn7j7WGoN63O7YaM11I5CcQ4o7qe88NvjZlr
 as41FRrfSW/iN6n0p0fRtD3Hd1rskVKYLCd4d5NeDAfHiwXZOVqg6/Erg
 k5GQcaZvbMVRw+a97qTvZR0+fQpeyBzFYKdnpFY2ypYJmQ2d1ATGxWufI
 eNz1c3JZTAvfn24XFlxCKLuNcFUU86TlvA3X7bAdvdIKWVSfJ5sIg2ZyI
 8gR8Y7Vejb/2HiI7ygsxoxpAmpRYXkUTo9bWhvNqwHfTCVDR8vsLKFKGY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="263972002"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="263972002"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 23:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="621616635"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2022 23:21:39 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 23:21:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 23:21:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 23:21:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFb5nYr2rG51Yxcccf1fxUoxMpbbxEmOEcAaTaeh8EbUA5irmsKpfSsHErPmBLMn3w/PaF1M825ZLIoGUxf1V1C41P61+nEpbmaqcQysHwtulzUSSy74/Tt4evaS6LZF9DiS9YuR32o5bv9Of6xBULDb0yZs2F4dB8j8gyFnjdFO9xDGV+oRev6/W06lO3iLoN3FeMubdnx4TkliOJKDfxsLEKv4VVUEN5AZp4AszY3enVYqw7HnJ/VQeeELf/1uvFZhMaQnDQvLvbqK211UzJbUCt0xQIwyh6b9EYNQs/2Hq+3G9Gzxu+Vuio5+xxHW/SUKCNh2ZnqUDo7Dn/xsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfNPGO0PkoSIxsx5m44xVOnnYvbRuLCiDm0flmtZXfc=;
 b=W1H5n56CpWd7qTk8VsWRQE9wr1StfiD/OawAT6nRGI+f18ooF4T3Nxr3lubNzmd/A76gp7Z+y71evjxTU5De117HbTYwaIWOPRPaKuHVQe584Oz4eQEUbwC6bYSOVyX7NIn1b8slM8eftldGEihHWKOFBpNeiUc8ZjVwj09X7PTq3OK1iWwvX9+rowsRMkHWBJ39PPoSmJL2zmMOPIwYhGRcEv+oA2euTrqTJlDdyoNxj/ncz5E2d1eLp1mTos4eznTWUecBVBFF11Cyqv86kvn+kTnezil4Mdmheva5jh//z/C8rpxtGkBe4mdjKFo10N2rswje/OV6mMh9PNzqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3717.namprd11.prod.outlook.com (2603:10b6:a03:b0::12)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 06:21:24 +0000
Received: from BYAPR11MB3717.namprd11.prod.outlook.com
 ([fe80::a11f:64e8:4555:ad6a]) by BYAPR11MB3717.namprd11.prod.outlook.com
 ([fe80::a11f:64e8:4555:ad6a%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 06:21:24 +0000
From: "Yao, Yuan" <yuan.yao@intel.com>
To: Markus Armbruster <armbru@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Zhong, Yang" <yang.zhong@intel.com>, "Connor
 Kuehl" <ckuehl@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
Subject: RE: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Topic: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Index: AQHYe9viDVA1WJqoCUaizrs+j1JVhq1eILmLgAAKUoA=
Date: Fri, 24 Jun 2022 06:21:24 +0000
Message-ID: <BYAPR11MB3717F03961AC6518C4D3F04195B49@BYAPR11MB3717.namprd11.prod.outlook.com>
References: <20220609083456.77946-1-yuan.yao@intel.com>
 <87czeyd3p7.fsf@pond.sub.org>
In-Reply-To: <87czeyd3p7.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e09bfab-d1ed-49bd-f1a8-08da55a9c35a
x-ms-traffictypediagnostic: IA1PR11MB6514:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: evQtCZHBFg3avsF6qGjh6BzUutkzUmxrqm1g/jWQvm1myDn2wx9wmD68x+gqCG4tbBRpHp7pa94TupakG4XX/HtE0M7FElpANOiHS+S5VIskIjZWyQkxnxAX8/4fYZ2+FR5i3ycR9ykenh9gDm5RS418N/RHRtCK0w4FCZUTPe6Cgwp+jGtcWllwBws6QVl/zSBafzBgtxm0AX0Pv7EzwSHyOCrH3uPRp9wC+8Fv433jk8h4/7VJVSavDSfFOxIJ/JKjDGFH3ScqP9KqmHIMtbE8vMBawqNUAInzMoDpQ2bRoalUF5RUTSYGUhRJV2snFOq+vRduAjdKIgpVtWp8dFvKyaBGQUhKLJBIqACoOoiTlW0jxvC9bsFcgLzUVKw/o58wMejRSfmEgqyv4qCJhBwfqb5wNnKjZ92+XolxjuNhbIgJp9IDlcb4Oh7/2cVeJ69tncbVMhgkMMZIOS3+HfaQMjTpLDOy1usQQbm0ItqQSmQPup+vLM2nsdFWHh0tmktW8nXS17w5yGOoXBmplqnpkJYEfbXvInKVdVvHSes+givrE5DHhoGdxnQrDCCrOJsbJkMGwwkbjopU66qw31Z07qtwjdmdf837ndNxGeYm/CSZ4kOmZ6iVUt5hEimrRJd88Vh1h3CAjGsBTtyArgrNEbUdnnd0CtAc2lMLyPb+Zd4XbebODA70aEbGo45LGxA6fqcz/cvCL1ErpYc1JW+wDY7o07JRV7Wx7Q2/sdi5kUQrqjpyc8Hpsi9ttxQjTSXhKGRRSreDBdMnEiWAZhcxMskviqevGu7BMcBA2qE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(136003)(346002)(396003)(83380400001)(8936002)(38100700002)(186003)(38070700005)(122000001)(107886003)(82960400001)(5660300002)(41300700001)(4326008)(6506007)(33656002)(86362001)(66476007)(316002)(2906002)(66946007)(478600001)(54906003)(55016003)(7696005)(76116006)(6916009)(9686003)(66556008)(8676002)(64756008)(66446008)(52536014)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lYp5agwgQ7u0ySj9GJ6Yjm/dGEOeREIup6cnxWoQeWhi/58J/YZ3bUrQnf?=
 =?iso-8859-1?Q?RIKWO8cJzJknl6lVKI7vVtOXUYsUZSw0PAWaKULCJ8Ena52B6ctya3bsmI?=
 =?iso-8859-1?Q?CQ4dH1hi0NmkgSmZX8Rk03N50Y50oDnHKauzqYMFePN4ccyuitCOXDs8dp?=
 =?iso-8859-1?Q?VwxLBuycVp9mIE3iw/JG0OJSjA1mTu9B+XmBb974/E6hJ5+p4jWCsjhV3U?=
 =?iso-8859-1?Q?WxPAeulOph/lHUajPzmnIb7OHqSs/RFfAvoG6n9O5U9SDh4szwQc1KJPeq?=
 =?iso-8859-1?Q?6RsRFiB09N/0W9QSQW3kfly8diuXVefEj2pvIGfQ9auSjHYqcSDwGBLzVw?=
 =?iso-8859-1?Q?qs2vCwcuEt/ZxzrTrPc1MLZ5evxFp5o1if17wTmnCu+a87QPeyotKI9MFZ?=
 =?iso-8859-1?Q?vE66pX+PyLyZON3UQyy3/3t7UllxiSNVjQVuHKpL/bhmXrNuWDmnPk4zrB?=
 =?iso-8859-1?Q?UCK6GJVD1OflcNINzdTtlLxTLn0y783y1CILT8/U7ow1tyJEpsmrHFGeg4?=
 =?iso-8859-1?Q?YApaohyaa+WOOp/n2votmTPTCLY80dSpz9q3iuakphaMqf0hnCiTqqgsyn?=
 =?iso-8859-1?Q?/dD1vfQTqheLRm6PvuZgmMD+3+VZfXpKHP6KnCSmq2zb6QPG7i+2ny662X?=
 =?iso-8859-1?Q?GuGyDfIEg+L1KurbFN9wXWfuuma++EDOU98O7wCtYZA2VDc5fll6vf7Pc2?=
 =?iso-8859-1?Q?SeOaGHg0YAqgeMB2D++rj4+U+mpgLa3+TeACbqC8R+jLKwdCgqT4SUmHbH?=
 =?iso-8859-1?Q?RJCgFFtR/yOfjoU4ZXAQs/5viHPihWWzFGORz7fZ0shPoQeHuRxZ4OXXot?=
 =?iso-8859-1?Q?iUmYdRdQ70qRLe1LIGLBWqsxLpepeSNbFmSfx9dug7HnArt/2Wj4XGdvd6?=
 =?iso-8859-1?Q?EtnrmJniP0eu8fG9ByOObU+Hsv7Nu/Oc6/X8JJmurGfns4v+lltepHAsY1?=
 =?iso-8859-1?Q?6k7iEXFq2OzOj1qTXQCxHKKlJ/VTzWGEw7mVKI8scnVkLO9apjHfQn2jop?=
 =?iso-8859-1?Q?1rjpffk2vjuahTjCu7305RUZ8IQWm2T62nvkWA6qUK9206QSSmM/3Hwrz9?=
 =?iso-8859-1?Q?cl3cvJObtELfSLnT7+5Q1rZghFqgHYNslBEvzL5JF5EpsZpjGbp2nCs+le?=
 =?iso-8859-1?Q?EYAww0fX+2JzgoBXcwh6bD43vWt4u+g/NmD5dLuflttI4wGn2atWNPMuzQ?=
 =?iso-8859-1?Q?QMEbL02Uuf8wLLYKCBql/LH3LObg2Rnkdfj7IPiMQUJHRqlbJ+f22z0Ttl?=
 =?iso-8859-1?Q?DI/W3OMj8T8jq9T8I6c/axzR9l648Ab98ld/SihrS0jJQDjvaeqGs8sCO+?=
 =?iso-8859-1?Q?iMcchxj4WUulVWHDOuFRQGHnATnSgc6d5gzVyh2gnz4DhBxc0CJiv2w+ry?=
 =?iso-8859-1?Q?i87JSxbsP5uOug+RRdOG1u0yYBaFKNHZzHzvROjfrX+8isJTJc8bFmIN1S?=
 =?iso-8859-1?Q?F3wVI9pHxDTzslGuWoFYBUiePXnQCrUh27Eu82k9lyUzvK7d4yL8OQ+iMh?=
 =?iso-8859-1?Q?B7tMUcoOqradrRTj35V8/OOXPYYnU1sw8vf1A03FBG2SF25/jHyWPPaVf3?=
 =?iso-8859-1?Q?0UcVxaVdwEBoM8VXYRwPWoSBoiy+3wOEtg2Qw9ZEZxsXsdj3YUIzUAv4EN?=
 =?iso-8859-1?Q?7iRYmrI38+BBEBMIxtTo7RCInbtJQPhlLB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e09bfab-d1ed-49bd-f1a8-08da55a9c35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 06:21:24.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGsuVMotdNvgQuDPX8dR/hZ5u5WQVPU9UjBMqWT8KlTrbQw5weuNUAGVLbOVlFjomi0ScyHFn/6rT6ghqbI3wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=yuan.yao@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>-----Original Message-----
>From: Markus Armbruster <armbru@redhat.com>
>Sent: Friday, June 24, 2022 13:35
>To: Yao, Yuan <yuan.yao@intel.com>
>Cc: Paolo Bonzini <pbonzini@redhat.com>; Philippe Mathieu-Daud=E9 <f4bug@a=
msat.org>; Dr. David Alan Gilbert
><dgilbert@redhat.com>; Zhong, Yang <yang.zhong@intel.com>; Connor Kuehl <c=
kuehl@redhat.com>; qemu-devel@nongnu.org;
>Yamahata, Isaku <isaku.yamahata@intel.com>
>Subject: Re: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA=
57 enabled guest
>
>Yuan Yao <yuan.yao@intel.com> writes:
>
>> Don't skip next leve page table for pdpe/pde when the
>
>level

Sorry for my typo.

>
>> PG_PRESENT_MASK is set.
>>
>> This fixs the issue that no mapping information was
>
>fixes
>
>> collected from "info mem" for guest with LA57 enabled.
>>
>> Signed-off-by: Yuan Yao <yuan.yao@intel.com>
>
>Should we add
>
>  Fixes: 6c7c3c21f95dd9af8a0691c0dd29b07247984122

Yes, I will add this next time, thanks.

>
>?
>
>> ---
>>  target/i386/monitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
>> index 8e4b4d600c..3339550bbe 100644
>> --- a/target/i386/monitor.c
>> +++ b/target/i386/monitor.c
>> @@ -489,7 +489,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState=
 *env)
>>                  cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
>>                  pdpe =3D le64_to_cpu(pdpe);
>>                  end =3D (l0 << 48) + (l1 << 39) + (l2 << 30);
>> -                if (pdpe & PG_PRESENT_MASK) {
>> +                if (!(pdpe & PG_PRESENT_MASK)) {
>>                      prot =3D 0;
>>                      mem_print(mon, env, &start, &last_prot, end, prot);
>>                      continue;
>> @@ -508,7 +508,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState=
 *env)
>>                      cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8)=
;
>>                      pde =3D le64_to_cpu(pde);
>>                      end =3D (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 =
<< 21);
>> -                    if (pde & PG_PRESENT_MASK) {
>> +                    if (!(pde & PG_PRESENT_MASK)) {
>>                          prot =3D 0;
>>                          mem_print(mon, env, &start, &last_prot, end, pr=
ot);
>>                          continue;
>>
>> base-commit: 6d940eff4734bcb40b1a25f62d7cec5a396f994a
>
>The commit message talks about not skipping something when the flag is
>set.  However, the patch *flips* the sense of conditions, which means
>were *also* changing behavior when the flag is unset.  How?

Yes, this also changes the behavior when the flag is unset, because the
original code does wrong for both set and unset , flips the checking
condition bring all of them to right behavior. I think I can add these
to the commit message in v2.


