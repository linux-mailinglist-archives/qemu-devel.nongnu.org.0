Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E924ACDC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 04:12:35 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8a4A-0007ng-Kg
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 22:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8a3J-0007HJ-H9
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 22:11:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8a3H-00071E-3q
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 22:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597889497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AKdlf3rQUaT0vbHGrBRmXX3N8Tbb8SpvHR3UvGCnuPY=;
 b=KIsIHC6KcN3gnvzQ2BI8zFrJ2QuNcQU4CKPeNgig29DbP84fNjBMR3UlhsHccVclkktJ7P
 mN1zyE7wHJgdMMJkQh9zyDZTybxsO7QNZ0LPjPjoAYTyliVOpygG7qi4FOUSDDU+iBmOy7
 oz2BV4gGwmSxyTyWMkHkgyXHfhPSmP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-3qlaNqgUPmCjEFyXwP7VhQ-1; Wed, 19 Aug 2020 22:11:30 -0400
X-MC-Unique: 3qlaNqgUPmCjEFyXwP7VhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5651257051;
 Thu, 20 Aug 2020 02:11:29 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFA260BEC;
 Thu, 20 Aug 2020 02:11:28 +0000 (UTC)
Date: Wed, 19 Aug 2020 22:11:28 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 02/10] numa: introduce
 MachineClass::forbid_asymmetrical_numa
Message-ID: <20200820021128.GC642093@habkost.net>
References: <20200814205424.543857-1-danielhb413@gmail.com>
 <20200814205424.543857-3-danielhb413@gmail.com>
 <20200820011726.GF271315@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200820011726.GF271315@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 11:17:26AM +1000, David Gibson wrote:
> On Fri, Aug 14, 2020 at 05:54:16PM -0300, Daniel Henrique Barboza wrote:
> > The pSeries machine does not support asymmetrical NUMA
> > configurations.
> 
> This seems a bit oddly specific to have as a global machine class
> property.
> 
> Would it make more sense for machines with specific NUMA constraints
> to just verify those during their initialization?

This would be much simpler.  However, I like the idea of
representing machine-specific configuration validation rules as
data that can eventually be exported to management software.

(CCing John Snow, who had spent some time thinking about
configuration validation recently.)


> > 
> > CC: Eduardo Habkost <ehabkost@redhat.com>
> > CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/core/numa.c      | 7 +++++++
> >  hw/ppc/spapr.c      | 1 +
> >  include/hw/boards.h | 1 +
> >  3 files changed, 9 insertions(+)
> > 
> > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > index d1a94a14f8..1e81233c1d 100644
> > --- a/hw/core/numa.c
> > +++ b/hw/core/numa.c
> > @@ -547,6 +547,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
> >   */
> >  static void validate_numa_distance(MachineState *ms)
> >  {
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >      int src, dst;
> >      bool is_asymmetrical = false;
> >      int nb_numa_nodes = ms->numa_state->num_nodes;
> > @@ -575,6 +576,12 @@ static void validate_numa_distance(MachineState *ms)
> >      }
> >  
> >      if (is_asymmetrical) {
> > +        if (mc->forbid_asymmetrical_numa) {
> > +            error_report("This machine type does not support "
> > +                         "asymmetrical numa distances.");
> > +            exit(EXIT_FAILURE);
> > +        }
> > +
> >          for (src = 0; src < nb_numa_nodes; src++) {
> >              for (dst = 0; dst < nb_numa_nodes; dst++) {
> >                  if (src != dst && numa_info[src].distance[dst] == 0) {
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index dd2fa4826b..3b16edaf4c 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4512,6 +4512,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> >       */
> >      mc->numa_mem_align_shift = 28;
> >      mc->auto_enable_numa = true;
> > +    mc->forbid_asymmetrical_numa = true;
> >  
> >      smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
> >      smc->default_caps.caps[SPAPR_CAP_VSX] = SPAPR_CAP_ON;
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index bc5b82ad20..dc6cdd1c53 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -215,6 +215,7 @@ struct MachineClass {
> >      bool nvdimm_supported;
> >      bool numa_mem_supported;
> >      bool auto_enable_numa;
> > +    bool forbid_asymmetrical_numa;
> >      const char *default_ram_id;
> >  
> >      HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



-- 
Eduardo


