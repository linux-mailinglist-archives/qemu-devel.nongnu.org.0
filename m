Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E5695D5C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqtZ-00011P-7d; Tue, 14 Feb 2023 03:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqtQ-000118-Bv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:42:28 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqtN-00047l-RF
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676364145; x=1707900145;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CUJL/x8DfwQVRpufW9D3HB1+lGrppejwanInIOHIl5Y=;
 b=jKuCS0G02b63Vt3Dl8iMC8hAYiHMPYbbvwymBIaGnDgrf56f+suS8Lhw
 58Sy/nu5Ewcl+Xp1vtg5wCnPJ585IR4+x534WAhF3BxRanUwGmcZL8CVn
 hObkfmg7EmxW5HY7bfqjqlWkhQikokCVav7QUmV/Rxztso22vzXi6erDP
 eCabnJiqoi2j4keyVZFSDxPCCDwA+3gKNdPG0C0qVhnxE5Cp3PvAiq/Uu
 yPYbJSK//O1JRf7aknsjPnzsOoR7vg018/DAHH+vcFcl45h9uGk1k+Z17
 UQlyNf3OWFa5h9b3bZarqbHrUZuhWgLoe4fkGlDTef/8gFninJG5Uy9kp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329737936"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="329737936"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="737819585"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="737819585"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2023 00:42:19 -0800
Date: Tue, 14 Feb 2023 16:50:07 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC 05/52] hw/core/machine: Rename machine-smp.c to
 machine-topo.c
Message-ID: <Y+tLP6KiIRVvtZUo@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-6-zhao1.liu@linux.intel.com>
 <6270bfbe-ab8c-80a2-4e27-27adfdcbb854@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6270bfbe-ab8c-80a2-4e27-27adfdcbb854@huawei.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Feb 13, 2023 at 08:52:13PM +0800, wangyanan (Y) wrote:
> Date: Mon, 13 Feb 2023 20:52:13 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [RFC 05/52] hw/core/machine: Rename machine-smp.c to
>  machine-topo.c
> 
> Hi Zhao£¬
> ÔÚ 2023/2/13 17:49, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Hybrid topology support will also be added to this file.
> > 
> > In order to maintain the semantic consistency of the file name and
> > content, the file name is changed to "machine-topo.c".
> > 
> > This file will handle all cpu topology related things, thus also change
> > the file description comment.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   MAINTAINERS                               | 2 +-
> >   hw/core/{machine-smp.c => machine-topo.c} | 2 +-
> >   hw/core/meson.build                       | 2 +-
> >   tests/unit/meson.build                    | 2 +-
> >   4 files changed, 4 insertions(+), 4 deletions(-)
> >   rename hw/core/{machine-smp.c => machine-topo.c} (99%)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 71c1bc24371b..58794885ced3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1733,7 +1733,7 @@ F: cpu.c
> >   F: hw/core/cpu.c
> >   F: hw/core/machine-qmp-cmds.c
> >   F: hw/core/machine.c
> > -F: hw/core/machine-smp.c
> > +F: hw/core/machine-topo.c
> >   F: hw/core/null-machine.c
> >   F: hw/core/numa.c
> >   F: hw/cpu/cluster.c
> > diff --git a/hw/core/machine-smp.c b/hw/core/machine-topo.c
> > similarity index 99%
> > rename from hw/core/machine-smp.c
> > rename to hw/core/machine-topo.c
> Better named as cpu-topology.c? So that it's consistent with the
> header "cpu-topology.h" in a following patch.

Nice, I'll rename it.

Zhao

> 
> Thanks,
> Yanan
> > index 3fd9e641efde..8066d2c46bef 100644
> > --- a/hw/core/machine-smp.c
> > +++ b/hw/core/machine-topo.c
> > @@ -1,5 +1,5 @@
> >   /*
> > - * QEMU Machine core (related to -smp parsing)
> > + * QEMU Machine core (related to CPU topology)
> >    *
> >    * Copyright (c) 2021 Huawei Technologies Co., Ltd
> >    *
> > diff --git a/hw/core/meson.build b/hw/core/meson.build
> > index 7a4d02b6c050..71d523dc6826 100644
> > --- a/hw/core/meson.build
> > +++ b/hw/core/meson.build
> > @@ -23,7 +23,7 @@ else
> >   endif
> >   common_ss.add(files('cpu-common.c'))
> > -common_ss.add(files('machine-smp.c'))
> > +common_ss.add(files('machine-topo.c'))
> >   softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
> >   softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
> >   softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
> > diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> > index a9df2843e92e..1720a769f1a2 100644
> > --- a/tests/unit/meson.build
> > +++ b/tests/unit/meson.build
> > @@ -46,7 +46,7 @@ tests = {
> >     'test-uuid': [],
> >     'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
> >     'test-qapi-util': [],
> > -  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
> > +  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-topo.c'],
> >     'test-interval-tree': [],
> >   }
> 

