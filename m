Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F21FAED2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 13:00:17 +0200 (CEST)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl9KC-0005UV-D2
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 07:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jl9JG-00055e-Sq
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:59:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jl9JF-00066S-5H
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592305156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3FowvmmaIrkAYHcCJuy/Cv1ynM5RO+ll+9kxwv1os4=;
 b=fReDwNL5RroLY31HRNwpXP4BVO0B2cqh+8kSZR7SAfB67l5HLFVzehlQMvQRnj/uHOyaON
 U2mHjNxsXLmbgR9300/y278bjLYIfB6qfhUmgREEC/ux6U/yTenHhdcKEBfPoBNoU1q9ej
 MchIC7FBlexHksUnmcqUT0N6Qd2KWs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-RsfhFrmtM3iT_mVw0vtZpA-1; Tue, 16 Jun 2020 06:59:12 -0400
X-MC-Unique: RsfhFrmtM3iT_mVw0vtZpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95427106B3B8;
 Tue, 16 Jun 2020 10:59:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D3219C71;
 Tue, 16 Jun 2020 10:59:06 +0000 (UTC)
Date: Tue, 16 Jun 2020 12:59:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH 1/2] hw/386: Fix uninitialized memory with -device and
 CPU hotplug
Message-ID: <20200616125901.772229a6@redhat.com>
In-Reply-To: <159164753015.20543.7987300339811704895.stgit@naples-babu.amd.com>
References: <159164739269.20543.3074052993891532749.stgit@naples-babu.amd.com>
 <159164753015.20543.7987300339811704895.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 08 Jun 2020 15:18:50 -0500
Babu Moger <babu.moger@amd.com> wrote:

> Noticed the following command failure while testing CPU hotplug.
> 
> $ qemu-system-x86_64 -machine q35,accel=kvm -smp 1,maxcpus=2,
>   cores=1, threads=1,sockets=2 -cpu EPYC -device EPYC-x86_64-
>   cpu,core-id=0,socket-id=1,thread-id=0
> 
>   qemu-system-x86_64: -device EPYC-x86_64-cpu,core-id=0,socket-id=1,
>   thread-id=0: Invalid CPU [socket: 21855, die: 0, core: 0, thread: 0]
>   with APIC ID 21855, valid index range 0:1
> 
> This happens because APIC ID is calculated using uninitialized memory.
> This is happening after the addition of new field node_id in X86CPUTopoIDs
> structure. The node_id field is uninitialized while calling
> apicid_from_topo_ids. The problem is discussed in the thread below.
> https://lore.kernel.org/qemu-devel/20200602171838.GG577771@habkost.net/
> 
> Fix the problem by initializing the node_id properly.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
>  hw/i386/pc.c               |    2 ++
>  include/hw/i386/topology.h |   11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe..974cc30891 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1585,6 +1585,8 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>          topo_ids.die_id = cpu->die_id;
>          topo_ids.core_id = cpu->core_id;
>          topo_ids.smt_id = cpu->thread_id;
> +        topo_ids.node_id = cpu_x86_use_epyc_apic_id_encoding(ms->cpu_type) ?
> +                           x86_node_id_for_epyc(&topo_info, &topo_ids) : 0;

I'd rather not calculate some default value here,
this is the branch where we check user provided topology info and error out asking
to provide missing bits.

I also wonder if we should force user to specify numa nodes on CLI if EPYC cpu is used.
(i.e. I'm assuming that EPYC always requires numa)

>          cpu->apic_id = x86ms->apicid_from_topo_ids(&topo_info, &topo_ids);
>      }
>  
> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index 07239f95f4..ee4deb84c4 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -140,6 +140,17 @@ static inline unsigned apicid_pkg_offset_epyc(X86CPUTopoInfo *topo_info)
>             apicid_node_width_epyc(topo_info);
>  }
>  
> +static inline unsigned x86_node_id_for_epyc(X86CPUTopoInfo *topo_info,
> +                                            const X86CPUTopoIDs *topo_ids)
> +{
> +    unsigned nr_nodes = MAX(topo_info->nodes_per_pkg, 1);
> +    unsigned cores_per_node = DIV_ROUND_UP((topo_info->dies_per_pkg *
> +                                            topo_info->cores_per_die *
> +                                            topo_info->threads_per_core),
> +                                            nr_nodes);
> +
> +    return (topo_ids->core_id / cores_per_node) % nr_nodes;
what if nr_nodes == 0?

> +}
>  /*
>   * Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
>   *
> 
> 


