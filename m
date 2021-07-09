Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D03C2192
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:28:06 +0200 (CEST)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mnk-0001q7-Il
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mmt-00019O-KB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mmp-0004X6-LV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625822825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c45km0lu+lwZxh41E84OeYZp/BbWXJq0Q+BNqwwvkV4=;
 b=KjXWv9+ZLfs3N9rQbpbatEKA5Yu0wYuVyQCEEoX9v4O+v2nNjkgnfDIKiDYka/AyJERp2M
 oaDC4FIpyteXvBCN4Frn2JOQXtM49dAMexIjRIM3iscBAeXLUzmLFX2TX+e0C5gJwG/1hg
 EE1o52a/gTMCCu1YMTQ/dDoga/4N4x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-nSBqaDJ-PwePX7cyItdMJA-1; Fri, 09 Jul 2021 05:27:04 -0400
X-MC-Unique: nSBqaDJ-PwePX7cyItdMJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEEB4100CCC0;
 Fri,  9 Jul 2021 09:27:02 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7704A5D6A8;
 Fri,  9 Jul 2021 09:27:00 +0000 (UTC)
Date: Fri, 9 Jul 2021 11:26:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH 2/2] numa: Parse initiator= attribute before cpus=
 attribute
Message-ID: <20210709112659.5a03a52d@redhat.com>
In-Reply-To: <b27a6a88986d63e3f610a728c845e01ff8d92e2e.1625662776.git.mprivozn@redhat.com>
References: <cover.1625662776.git.mprivozn@redhat.com>
 <b27a6a88986d63e3f610a728c845e01ff8d92e2e.1625662776.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: tao3.xu@intel.com, qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  7 Jul 2021 15:40:30 +0200
Michal Privoznik <mprivozn@redhat.com> wrote:

> When parsing cpus= attribute of -numa object couple of checks
> is performed, such as correct initiator setting (see the if()
> statement at the end of for() loop in
> machine_set_cpu_numa_node()).
> 
> However, with the current code cpus= attribute is parsed before
> initiator= attribute and thus the check may fail even though it
> is not obvious why. But since parsing the initiator= attribute
> does not depend on the cpus= attribute we can swap the order of
> the two.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

FYI:
I'm planning to deprecate '-numa node,cpus=' in favor of '-numa cpu'.


> It's fairly easy to reproduce with the following command line
> (snippet of an actual cmd line):
> 
>   -smp 4,sockets=4,cores=1,threads=1 \
>   -object '{"qom-type":"memory-backend-ram","id":"ram-node0","size":2147483648}' \
>   -numa node,nodeid=0,cpus=0-1,initiator=0,memdev=ram-node0 \
>   -object '{"qom-type":"memory-backend-ram","id":"ram-node1","size":2147483648}' \
>   -numa node,nodeid=1,cpus=2-3,initiator=1,memdev=ram-node1 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=first-level,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=5 \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=first-level,data-type=access-latency,latency=10 \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=204800K \
>   -numa hmat-lb,initiator=0,target=0,hierarchy=first-level,data-type=access-bandwidth,bandwidth=208896K \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=204800K \
>   -numa hmat-lb,initiator=1,target=1,hierarchy=first-level,data-type=access-bandwidth,bandwidth=208896K \
>   -numa hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8 \
>   -numa hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8 \
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  hw/core/numa.c | 45 +++++++++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 1058d3697b..510d096a88 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -88,6 +88,29 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>          return;
>      }
>  
> +    /*
> +     * If not set the initiator, set it to MAX_NODES. And if
> +     * HMAT is enabled and this node has no cpus, QEMU will raise error.
> +     */
> +    numa_info[nodenr].initiator = MAX_NODES;
> +    if (node->has_initiator) {
> +        if (!ms->numa_state->hmat_enabled) {
> +            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
> +                       "(HMAT) is disabled, enable it with -machine hmat=on "
> +                       "before using any of hmat specific options");
> +            return;
> +        }
> +
> +        if (node->initiator >= MAX_NODES) {
> +            error_report("The initiator id %" PRIu16 " expects an integer "
> +                         "between 0 and %d", node->initiator,
> +                         MAX_NODES - 1);
> +            return;
> +        }
> +
> +        numa_info[nodenr].initiator = node->initiator;
> +    }
> +
>      for (cpus = node->cpus; cpus; cpus = cpus->next) {
>          CpuInstanceProperties props;
>          if (cpus->value >= max_cpus) {
> @@ -142,28 +165,6 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>          numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
>      }
>  
> -    /*
> -     * If not set the initiator, set it to MAX_NODES. And if
> -     * HMAT is enabled and this node has no cpus, QEMU will raise error.
> -     */
> -    numa_info[nodenr].initiator = MAX_NODES;
> -    if (node->has_initiator) {
> -        if (!ms->numa_state->hmat_enabled) {
> -            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
> -                       "(HMAT) is disabled, enable it with -machine hmat=on "
> -                       "before using any of hmat specific options");
> -            return;
> -        }
> -
> -        if (node->initiator >= MAX_NODES) {
> -            error_report("The initiator id %" PRIu16 " expects an integer "
> -                         "between 0 and %d", node->initiator,
> -                         MAX_NODES - 1);
> -            return;
> -        }
> -
> -        numa_info[nodenr].initiator = node->initiator;
> -    }
>      numa_info[nodenr].present = true;
>      max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
>      ms->numa_state->num_nodes++;


