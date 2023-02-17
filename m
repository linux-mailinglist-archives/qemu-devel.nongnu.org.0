Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B424C69A420
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSr59-0005bx-IX; Thu, 16 Feb 2023 22:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSr57-0005bS-NQ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:06:41 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSr55-00013c-DS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676603199; x=1708139199;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+8lRVvFDWeebHLq4PjEE2NqdBl3tIFqp9SUSHgmn+WA=;
 b=kIW94dxK7SnYwa9+++8jZYjK9gm6Ywzy3b2wtbofKdlCZsfcs/Z/b+7o
 +o5dzdXDNWRs3v60ox568b4GO00PekdFeMki1HUB9hLd/d8aNWZPoTXmq
 6xfzRpyYeiK7q8jUFYhicNw3thgVLSxq9gL60OQQPBl+5eb0sfiX6AIJ5
 hn7E29wAJSIik/FIrcQcJJH9zir4kMOxoeaGkV6sf49FpTpth9nPhbVfq
 wkqA2FA+ax7gd/5WLzt63r7CsUSJKZZU36BzRQNYzxN5ODsHjoMHJ2gSE
 Q6w1vCpy148WgraFU/5ULlxlrKdBtA23+1FcG7c8BdUhLhGrjptjGc9il Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319998795"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="319998795"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 19:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759211713"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="759211713"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2023 19:06:33 -0800
Date: Fri, 17 Feb 2023 11:14:25 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC 12/52] hw/acpi: Replace MachineState.smp access with
 topology helpers
Message-ID: <Y+7xEVrlsoPpLnvg@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-13-zhao1.liu@linux.intel.com>
 <38f00a43-dc24-0a5b-e197-536c414354e7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38f00a43-dc24-0a5b-e197-536c414354e7@huawei.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Thu, Feb 16, 2023 at 05:31:11PM +0800, wangyanan (Y) wrote:
> Date: Thu, 16 Feb 2023 17:31:11 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [RFC 12/52] hw/acpi: Replace MachineState.smp access with
>  topology helpers
> 
> Hi Zhao,
> 
> 在 2023/2/13 17:49, Zhao Liu 写道:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > At present, in QEMU only arm needs PPTT table to build cpu topology.
> > 
> > Before QEMU's arm supports hybrid architectures, it's enough to limit
> > the cpu topology of PPTT to smp type through the explicit smp interface
> > (machine_topo_get_smp_threads()).
> > 
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Ani Sinha <ani@anisinha.ca>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/acpi/aml-build.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index ea331a20d131..693bd8833d10 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >               cluster_offset = socket_offset;
> >           }
> > -        if (ms->smp.threads == 1) {
> > +        if (machine_topo_get_smp_threads(ms) == 1) {
> >               build_processor_hierarchy_node(table_data,
> >                   (1 << 1) | /* ACPI Processor ID valid */
> >                   (1 << 3),  /* Node is a Leaf */
> ACPI PPTT table is designed to also support the hybrid CPU topology
> case where nodes on the same CPU topology level can have different
> number of child nodes.
> 
> So to be general, the diff should be:
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d1..dfded95bbc 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2044,7 +2044,7 @@ void build_pptt(GArray *table_data, BIOSLinker
> *linker, MachineState *ms,
>              cluster_offset = socket_offset;
>          }
> 
> -        if (ms->smp.threads == 1) {
> +        if (machine_topo_get_threads_by_idx(n) == 1) {
>              build_processor_hierarchy_node(table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 3),  /* Node is a Leaf */

Nice! I'll replace that.

> 
> Actually I'm recently working on ARM hmp virtualization which relys on
> PPTT for topology representation, so we will also need PPTT to be general
> for hybrid case anyway.

Good to know that you are considering hybrid support for arm.
BTW, I explained the difference between arm and x86's hybrid in previous
email [1] [2], mainly about whether the cpm model is the same.

I tentatively think that this difference can be solved by arch-specific
coretype(). Do you have any comments on this? Thanks!

[1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03884.html
[2]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03789.html

> 
> Thanks,
> Yanan

