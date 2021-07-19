Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23323CE659
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:52:06 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WUv-0006Uy-SM
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WTb-0005jE-C2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5WTX-0004Ta-D2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713438;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on/OH3d2gic4o1UamyJw7lNqSpSfjOaFSZpcr/CuODI=;
 b=ej1T59f+yR+BfWGJc7GxD4UQ2vnlXYgJFjC9wmWcIslq9d2/fRD9uU/D6+XKBvtZL7LWVt
 m+M+MZxnTsBTiPUGQ0G1i+2+EfyIG0sSW54WpC2DV7QRh8jE5Zq9dDUjVsvrcO8rYA/z4l
 zC+dRZACC8dWGtbKmEVnF9A5EnoyfUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-BTFUFy6dP4K5T2bBfsdv9A-1; Mon, 19 Jul 2021 12:50:37 -0400
X-MC-Unique: BTFUFy6dP4K5T2bBfsdv9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 147E1100C610;
 Mon, 19 Jul 2021 16:50:34 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B595D9F0;
 Mon, 19 Jul 2021 16:50:26 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:50:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <YPWtTxMISucwEjxj@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com>
 <20210719162846.dcltg22pbdpnyjcl@gator>
 <YPWqF2vygPDtNA/1@redhat.com>
 <20210719164815.bzfnrk6fzhfj5quj@gator>
MIME-Version: 1.0
In-Reply-To: <20210719164815.bzfnrk6fzhfj5quj@gator>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Mon, Jul 19, 2021 at 06:48:15PM +0200, Andrew Jones wrote:
> On Mon, Jul 19, 2021 at 05:36:39PM +0100, Daniel P. Berrangé wrote:
> > On Mon, Jul 19, 2021 at 06:28:46PM +0200, Andrew Jones wrote:
> > > On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
> > > > Currently the only difference between smp_parse and pc_smp_parse
> > > > is the support of multi-dies and the related error reporting code.
> > > > With an arch compat variable "bool smp_dies_supported", we can
> > > > easily make smp_parse generic enough for all arches and the PC
> > > > specific one can be removed.
> > > > 
> > > > Making smp_parse() generic enough can reduce code duplication and
> > > > ease the code maintenance, and also allows extending the topology
> > > > with more arch specific members (e.g., clusters) in the future.
> > > > 
> > > > No functional change intended.
> > > > 
> > > > Suggested-by: Andrew Jones <drjones@redhat.com>
> > > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > > ---
> > > >  hw/core/machine.c   | 28 ++++++++++-------
> > > >  hw/i386/pc.c        | 76 +--------------------------------------------
> > > >  include/hw/boards.h |  1 +
> > > >  3 files changed, 19 insertions(+), 86 deletions(-)
> > > > 
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index d73daa10f4..ed6712e964 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> > > >  
> > > >  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > > >  {
> > > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > >      unsigned cpus    = config->has_cpus ? config->cpus : 0;
> > > >      unsigned sockets = config->has_sockets ? config->sockets : 0;
> > > >      unsigned dies    = config->has_dies ? config->dies : 1;
> > > > @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > > >          return;
> > > >      }
> > > >  
> > > > -    if (dies > 1) {
> > > > +    if (!mc->smp_dies_supported && dies > 1) {
> > > 
> > > Won't this allow a user on an arch with !mc->smp_dies_supported to specify
> > > dies=1?
> > 
> > Conceptually that is fine. Before the introduction of CPU sockets
> > with 2+ dies, you can credibly say that all sockets had 1 die, so
> > it is nreasonable for users to say -smp ....,dies=1,....
> > 
> > libvirt will unconditionally set dies=1 for all QEMU targets if
> > the user didn't specify an explicit dies value
> > 
> > >          To not allow that, can we do
> > > 
> > >    if (!mc->smp_dies_supported && config->has_dies)
> > > 
> > > instead?
> > 
> > I don't see that this is benefitting apps/users.
> 
> Other than maintaining consistency; erroring with "we don't support dies"
> for 2+, but not for 1, is inconsistent, then I agree there isn't much
> reason to disallow it, since we'll be using the value of 1 anyway
> internally. I don't really have a strong preference here, so I'm fine with
> allowing dies=1.

How about we tweak the error message from

  "dies not supported by this machine's CPU topology"

to

  "multiple dies not supported by this machine's CPU topology"


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


