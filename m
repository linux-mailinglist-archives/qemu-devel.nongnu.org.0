Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB021DEC9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 19:33:29 +0200 (CEST)
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv2KW-0003Kk-8o
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jv2Je-0002lW-3q
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:32:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35873
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jv2Jb-0004Qe-M7
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594661550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msFyQfgd0XcrIXCnRVQePJrCoKEN5NKpVKambenTnIs=;
 b=N0I1koFJbA96DDEyKzd12lVuq/LWffV5FKH0gC/m2C5C52GyCcsvUkEYGo6wM7iV8Nqz3w
 TD5VjYdFuf6JJ+URrlCw908ZbkQhHx21+ofHYLng88lv2XpI/ybAQ95OmaB7fIexnl3zTC
 IrW4dbDWcvi+/nrkvL5/Qpuf2Q3hovE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-uSvgm8Y4ORag-ZkuGnJDlg-1; Mon, 13 Jul 2020 13:32:28 -0400
X-MC-Unique: uSvgm8Y4ORag-ZkuGnJDlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89994100AA22;
 Mon, 13 Jul 2020 17:32:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A52A25BAE4;
 Mon, 13 Jul 2020 17:32:23 +0000 (UTC)
Date: Mon, 13 Jul 2020 19:32:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
 CpuInstanceProperties
Message-ID: <20200713193221.27674630@redhat.com>
In-Reply-To: <47dc6238-bb71-d679-f58a-f574eb36d572@amd.com>
References: <159362436285.36204.986406297373871949.stgit@naples-babu.amd.com>
 <159362466108.36204.3751851750959980962.stgit@naples-babu.amd.com>
 <20200713110822.5495e1c6@redhat.com>
 <78809d9f-a491-8c99-3f35-7f012c7d75bf@amd.com>
 <20200713181740.16a357a6@redhat.com>
 <47dc6238-bb71-d679-f58a-f574eb36d572@amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Jul 2020 11:43:33 -0500
Babu Moger <babu.moger@amd.com> wrote:

> On 7/13/20 11:17 AM, Igor Mammedov wrote:
> > On Mon, 13 Jul 2020 10:02:22 -0500
> > Babu Moger <babu.moger@amd.com> wrote:
> >   
> >>> -----Original Message-----
> >>> From: Igor Mammedov <imammedo@redhat.com>
> >>> Sent: Monday, July 13, 2020 4:08 AM
> >>> To: Moger, Babu <Babu.Moger@amd.com>
> >>> Cc: pbonzini@redhat.com; rth@twiddle.net; ehabkost@redhat.com; qemu-
> >>> devel@nongnu.org
> >>> Subject: Re: [PATCH v2 1/3] hw/i386: Initialize topo_ids from
> >>> CpuInstanceProperties  
> > [...]  
> >>>> +
> >>>> +/*
> >>>> + * Initialize topo_ids from CpuInstanceProperties
> >>>> + * node_id in CpuInstanceProperties(or in CPU device) is a sequential
> >>>> + * number, but while building the topology    
> >>>     
> >>>> we need to separate it for
> >>>> + * each socket(mod nodes_per_pkg).    
> >>> could you clarify a bit more on why this is necessary?    
> >>
> >> If you have two sockets and 4 numa nodes, node_id in CpuInstanceProperties
> >> will be number sequentially as 0, 1, 2, 3.  But in EPYC topology, it will
> >> be  0, 1, 0, 1( Basically mod % number of nodes per socket).  
> > 
> > I'm confused, let's suppose we have 2 EPYC sockets with 2 nodes per socket
> > so APIC id woulbe be composed like:
> > 
> >  1st socket
> >    pkg_id(0) | node_id(0)
> >    pkg_id(0) | node_id(1)
> > 
> >  2nd socket
> >    pkg_id(1) | node_id(0)
> >    pkg_id(1) | node_id(1)
> >   
> > if that's the case, then EPYC's node_id here doesn't look like
> > a NUMA node in the sense it's usually used
> > (above config would have 4 different memory controllers => 4 conventional NUMA nodes).  
> 
> EPIC model uses combination of socket id and node id to identify the numa
> nodes. So, it internally uses all the information.

well with above values, EPYC's node_id doesn't look like it's specifying
a machine numa node, but rather a node index within single socket. In which
case, it doesn't make much sense calling it NUMA node_id, it's rather some
index within a socket. (it starts looking like terminology is all mixed up)

If you have access to a milti-socket EPYC machine, can you dump and post here
its apic ids, pls?

> 
> > 
> > I wonder if linux guest actually uses node_id encoded in apic id for
> > configuring/checking numa structures, or it just uses whatever ACPI SRAT
> > table provided.
> >    
> >>>> + */
> >>>> +static inline void x86_init_topo_ids(X86CPUTopoInfo *topo_info,
> >>>> +                                     CpuInstanceProperties props,
> >>>> +                                     X86CPUTopoIDs *topo_ids) {
> >>>> +    topo_ids->smt_id = props.has_thread_id ? props.thread_id : 0;
> >>>> +    topo_ids->core_id = props.has_core_id ? props.core_id : 0;
> >>>> +    topo_ids->die_id = props.has_die_id ? props.die_id : 0;
> >>>> +    topo_ids->node_id = props.has_node_id ?
> >>>> +                        props.node_id % MAX(topo_info->nodes_per_pkg, 1) : 0;
> >>>> +    topo_ids->pkg_id = props.has_socket_id ? props.socket_id : 0; }
> >>>>  /*
> >>>>   * Make APIC ID for the CPU 'cpu_index'
> >>>>   *
> >>>>    
> >>  
> >   
> 


