Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFE3CE50E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:38:20 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WHb-00083w-FR
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WGR-0006gN-3M
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WGP-0003YA-87
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626712624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=C2L+qXF4Sq5a6dbUBQBRddMQRuvjxDRfBl3bLhJCf+w=;
 b=HBYuKscJ7Vwvg54QsgRblJONKfpAxoEcBe3LChc8Ob5LcXADYQ1gOUFe3e/DFqrcLKlvkc
 T7y4uA1GB5jhU18KOz58h8OjQPbm3sJHglrUYHqEzyV7czysXL0ifYzbpyhtFakZuKxzmu
 SOaYHZpdhQ/zaaersMOml/Xcbgul8Zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-kBjdzdRGNaO4MWjfvrv1GA-1; Mon, 19 Jul 2021 12:36:56 -0400
X-MC-Unique: kBjdzdRGNaO4MWjfvrv1GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1828E111C950;
 Mon, 19 Jul 2021 16:36:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF8A15C1C5;
 Mon, 19 Jul 2021 16:36:42 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:36:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <YPWqF2vygPDtNA/1@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com>
 <20210719162846.dcltg22pbdpnyjcl@gator>
MIME-Version: 1.0
In-Reply-To: <20210719162846.dcltg22pbdpnyjcl@gator>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 06:28:46PM +0200, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
> > Currently the only difference between smp_parse and pc_smp_parse
> > is the support of multi-dies and the related error reporting code.
> > With an arch compat variable "bool smp_dies_supported", we can
> > easily make smp_parse generic enough for all arches and the PC
> > specific one can be removed.
> > 
> > Making smp_parse() generic enough can reduce code duplication and
> > ease the code maintenance, and also allows extending the topology
> > with more arch specific members (e.g., clusters) in the future.
> > 
> > No functional change intended.
> > 
> > Suggested-by: Andrew Jones <drjones@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/core/machine.c   | 28 ++++++++++-------
> >  hw/i386/pc.c        | 76 +--------------------------------------------
> >  include/hw/boards.h |  1 +
> >  3 files changed, 19 insertions(+), 86 deletions(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index d73daa10f4..ed6712e964 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >  
> >  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >  {
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >      unsigned cpus    = config->has_cpus ? config->cpus : 0;
> >      unsigned sockets = config->has_sockets ? config->sockets : 0;
> >      unsigned dies    = config->has_dies ? config->dies : 1;
> > @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >          return;
> >      }
> >  
> > -    if (dies > 1) {
> > +    if (!mc->smp_dies_supported && dies > 1) {
> 
> Won't this allow a user on an arch with !mc->smp_dies_supported to specify
> dies=1?

Conceptually that is fine. Before the introduction of CPU sockets
with 2+ dies, you can credibly say that all sockets had 1 die, so
it is nreasonable for users to say -smp ....,dies=1,....

libvirt will unconditionally set dies=1 for all QEMU targets if
the user didn't specify an explicit dies value

>          To not allow that, can we do
> 
>    if (!mc->smp_dies_supported && config->has_dies)
> 
> instead?

I don't see that this is benefitting apps/users.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


