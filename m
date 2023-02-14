Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823B4696740
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwXf-000782-Tb; Tue, 14 Feb 2023 09:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRwXc-000766-Um
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:44:21 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRwXa-0007qM-LH
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676385858; x=1707921858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tQkrfiZDzDUu3kbnCpr/0tmJgei20uiODnfYqRy1aUE=;
 b=hggR3EAb7AEbbeinzfxs312r7DooyxxOLersH997IzY+3znEdHMpL8fA
 c49zcoQ1UJcOvpVCH/wRI48m6OQ5qLIi+QzH7rbv1OeW9d6iSPKLctiQx
 QwAuL5Vyae/WqPSrjm5ZpP6+c3EP0fChyjl0434aCrnSnU6htqTJej9nq
 Qin/5+At43iCnjy4Fu9HEq8DOSfRwZYlkzeLZ9p2a7odJgB3DLkqtMKz5
 2y9LkyuUWEqIjb62YjdXx+uP6my9CFdzIa8RH+U1NFKEhBocozwO0rgMC
 IZPWmyGorHmRAN/ULd8D2g3VsaL8b5sVgQes5NuwLeJYQxogVOPS5dtNa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314818740"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="314818740"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 06:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701671885"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="701671885"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 06:44:09 -0800
Date: Tue, 14 Feb 2023 22:51:57 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
Message-ID: <Y+ugDRTDNaUEDumN@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-42-zhao1.liu@linux.intel.com>
 <f5fc6965-d69f-485c-99dd-5542c2e10ed6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5fc6965-d69f-485c-99dd-5542c2e10ed6@linaro.org>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, Feb 13, 2023 at 02:35:24PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:35:24 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
> 
> On 13/2/23 10:50, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Since supported core types are architecture specific, we need this hook
> > to allow archs define its own parsing or validation method.
> > 
> > As the example, add the x86 core_type() which will be used in "-hybrid"
> > parameter parsing.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/core/machine-topo.c | 14 ++++++++++++++
> >   hw/core/machine.c      |  1 +
> >   hw/i386/x86.c          | 15 +++++++++++++++
> >   include/hw/boards.h    |  7 +++++++
> >   4 files changed, 37 insertions(+)
> > 
> > diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
> > index 12c05510c1b5..f9ab08a1252e 100644
> > --- a/hw/core/machine-topo.c
> > +++ b/hw/core/machine-topo.c
> > @@ -352,3 +352,17 @@ void machine_parse_smp_config(MachineState *ms,
> >           return;
> >       }
> >   }
> > +
> > +/*
> > + * machine_parse_hybrid_core_type: the default hook to parse hybrid core
> > + *                                 type corresponding to the coretype
> > + *                                 string option.
> > + */
> > +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype)
> > +{
> > +    if (strcmp(coretype, "") == 0 || strcmp(coretype, "none") == 0) {
> > +        return 0;
> > +    }
> > +
> > +    return -1;
> 
> Shouldn't this use mc->core_type()? Where is it used?

This interface is used in "[RFC 44/52] machine: Add "-hybrid" parsing
rule"[1] to check the "coretype" info passed from command line:

static void insert_core_into_cluster(MachineState *ms,
                                     HybridCluster *cluster,
                                     const HybridCoreOptions *config,
                                     Error **errp)
{
    ...
    ret = mc->core_type(ms, config->coretype);
    if (!ret) {
        error_setg(errp, "Invalid coretype=%s", config->coretype);
    }
    core_pack->core.core_type = ret;
    ...
}

I use that machine_parse_hybrid_core_type() as the default mc->core_type()
implementation. Other arch can override this default core_type() if
necessary, for example x86 has its own core_type implementation:
x86_parse_hybrid_core_type().

This default core_type() avoids useless and wrong core_type information
from the command line so that I can expose core type info in query_cpus_fast.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03250.html


Zhao

> 
> > +}

