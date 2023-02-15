Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2E5697483
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:46:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7nx-000541-IA; Tue, 14 Feb 2023 21:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7ns-00051f-1B
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:45:52 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS7no-0006kz-W5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 21:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676429149; x=1707965149;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ggMegEO+aA7HJ73g1IajnW2l4pzsdE5ubAd7VLIfElg=;
 b=EVcjo0p+uaMsayrQx0G7Oj/c93eleO1/tCFHWsqXS/X+HI+a3ghE4bFG
 3xxMvUHG1PIWX4W8Le10iuF/4zXUvmNEnXRUTeNT2l3F4TIR1ScB/1COR
 TGKS2xTw2xnWnQPpQb6VoguxEAQWpS7kX4ljF+VHiBqjK5rnEN6MUT7yM
 d+uOe6e4CCsUbYoQhyXrQrSp3bP/v7E3xG/ry00kDN+LVUsEIlf8N0MPH
 xMlaTUw5KTXfCCrdcgQWtK778rwvDUM7thUil6xwqCrHPK303P6dn3PAz
 M5i+1ZCUgUNs8DilUEiAQUDUvY6SIJPiTeSTnCsTtW97397HD6GLwaJWA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="332639526"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="332639526"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671454282"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="671454282"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 18:45:35 -0800
Date: Wed, 15 Feb 2023 10:53:23 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
 properties
Message-ID: <Y+xJI1k6yoOh8g6l@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-43-zhao1.liu@linux.intel.com>
 <e8102ed2-35b6-0fc2-c20b-dbfca89ec50b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8102ed2-35b6-0fc2-c20b-dbfca89ec50b@huawei.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 14, 2023 at 09:46:50AM +0800, wangyanan (Y) wrote:
> Date: Tue, 14 Feb 2023 09:46:50 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
>  properties
> 
> Hi Zhao,
> 
> ÔÚ 2023/2/13 17:50, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Since hybrid cpu topology configuration can benefit not only x86, but
> > also other architectures/platforms that have supported (in real
> > machines) or will support hybrid CPU topology, "-hybrid" can be generic.
> > 
> > So add the generic topology property to configure if support hybrid
> > cpu topology for architectures/platforms in SmpCompatProps.
> > 
> > Also rename SmpCompatProps to TopoCompatProps to make this structure
> > more generic for both smp topology and hybrid topology.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   include/hw/boards.h | 15 +++++++++++----
> >   1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 34ec035b5c9f..17be3485e823 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -127,19 +127,26 @@ typedef struct {
> >   } CPUArchIdList;
> >   /**
> > - * SMPCompatProps:
> > - * @prefer_sockets - whether sockets are preferred over cores in smp parsing
> > + * TopoCompatProps:
> > + * @hybrid_support - whether hybrid cpu topology are supported by machine.
> inconsistent with the name in the definition below.

Thanks! Will fix.

> > + *                   Note that hybrid cpu topology requires to specify the
> > + *                   topology of each core so that there will no longer be
> > + *                   a default core topology, thus prefer_sockets won't work
> > + *                   when hybrid_support is enabled.
> > + * @prefer_sockets - whether sockets are preferred over cores in smp parsing.
> > + *                   Not work when hybrid_support is enabled.
> >    * @dies_supported - whether dies are supported by the machine
> >    * @clusters_supported - whether clusters are supported by the machine
> >    * @has_clusters - whether clusters are explicitly specified in the user
> >    *                 provided SMP configuration
> >    */
> >   typedef struct {
> > +    bool hybrid_supported;
> >       bool prefer_sockets;
> >       bool dies_supported;
> >       bool clusters_supported;
> >       bool has_clusters;
> > -} SMPCompatProps;
> > +} TopoCompatProps;
> Also here. "Rename SMPCompatProps to TopoCompatProps and
> move it to cpu-topology.h and adapt the code" should be organized
> in one or more separate patches, being pre-patches together with
> the conversion of CpuTopology before. 

Do you think TopoCompatProps/SMPCompatProps should also be moved
into cpu-topology.h? It seems that SMPCompatProps is a collection
of properties of MachineClass.

> And put the "hybrid_supported"
> extension into another patch. Would this make it easier to review?

Yes, I agree. Thanks!

Zhao

> 
> Thanks,
> Yanan
> >   /**
> >    * MachineClass:
> > @@ -281,7 +288,7 @@ struct MachineClass {
> >       bool nvdimm_supported;
> >       bool numa_mem_supported;
> >       bool auto_enable_numa;
> > -    SMPCompatProps smp_props;
> > +    TopoCompatProps smp_props;
> >       const char *default_ram_id;
> >       HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> 

