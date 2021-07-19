Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474753CE658
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:49:28 +0200 (CEST)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WSN-0004NQ-CF
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WRP-0002ml-56
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WRN-0002nL-9N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aG0b+EQdVAUxbbixs9/gtx1tnGm1lT2Y+6YySmpe/Yg=;
 b=hjPJtjDNn3O4T/KIeH7M8JvoYrpUOCg7Vivy1XFapXKFIGUNJUUfdm1yuqAF7kerVxYq16
 25S3lqA+5gfRuYmeWpBKbz2sRIk5PKc8VaW4NiXhAjAIgouD2wz4HVqNwG1qSvwxrQGDGg
 38j4aoz8vt49q0hnEN7mU5ntfEYxLLE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-ZsQ-0HoRMQmKr6U8wa142A-1; Mon, 19 Jul 2021 12:48:20 -0400
X-MC-Unique: ZsQ-0HoRMQmKr6U8wa142A-1
Received: by mail-il1-f200.google.com with SMTP id
 s12-20020a056e02216cb02901f9cee02769so11038822ilv.11
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aG0b+EQdVAUxbbixs9/gtx1tnGm1lT2Y+6YySmpe/Yg=;
 b=dO/zJR1S0+0K5dnuqeeMtIQnCe7zTAujJtsInLHc2hfzQ8ABdE1fbIxN1ZZ/MxWmOp
 S21x2TrGJzgA1MJuK5dV1arhHaR7XFCFuq06+iHDnZDCSMEf3CXQ5Mf89Hz1vkC/ZrS3
 IG/EuCzCmj8AXBVNjDfoydrfHZh4BKykLfgPtxAHx8pqdeR0Mb0IHLeGILawv4uZCZBV
 ijUejW3KdxLY5CIOXGZXNha59ejdTPd66HS6OGXwajcYkPcxpOvnoijaiVOLi3ZBqX2U
 8Gh5KAUe5TAj74DMiyPq/6I4xRyZTCjDG3BPwgHVpByjX/cS8DbcEk1/z8owgh3AEKdz
 LkKw==
X-Gm-Message-State: AOAM532Sb5AShtMrtpNy5H3FnR5ZFsV5Xd/jhpuo8hqV/EynJ6XQB3k5
 Vu5AB8WIzzoDkqmU513pp66QC5ss6gjnyiAX7gufpGE7gC66jl8leN3ZaG0+Ec6Z6DNzuvtaQOr
 HLBHxnOqMaHhnT34=
X-Received: by 2002:a05:6e02:1142:: with SMTP id
 o2mr18314547ill.277.1626713299816; 
 Mon, 19 Jul 2021 09:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtN2E6VNJ8Qjmq7zY2O5yTYGxMx88705ZD43+HksM61kaaRFqx8M8dmpM2qhlH2ofoisA6kQ==
X-Received: by 2002:a05:6e02:1142:: with SMTP id
 o2mr18314528ill.277.1626713299598; 
 Mon, 19 Jul 2021 09:48:19 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id a1sm2359824ilp.1.2021.07.19.09.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:48:19 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:48:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.2 v2 02/11] machine: Make smp_parse generic enough
 for all arches
Message-ID: <20210719164815.bzfnrk6fzhfj5quj@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-3-wangyanan55@huawei.com>
 <20210719162846.dcltg22pbdpnyjcl@gator>
 <YPWqF2vygPDtNA/1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPWqF2vygPDtNA/1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Jul 19, 2021 at 05:36:39PM +0100, Daniel P. Berrangé wrote:
> On Mon, Jul 19, 2021 at 06:28:46PM +0200, Andrew Jones wrote:
> > On Mon, Jul 19, 2021 at 11:20:34AM +0800, Yanan Wang wrote:
> > > Currently the only difference between smp_parse and pc_smp_parse
> > > is the support of multi-dies and the related error reporting code.
> > > With an arch compat variable "bool smp_dies_supported", we can
> > > easily make smp_parse generic enough for all arches and the PC
> > > specific one can be removed.
> > > 
> > > Making smp_parse() generic enough can reduce code duplication and
> > > ease the code maintenance, and also allows extending the topology
> > > with more arch specific members (e.g., clusters) in the future.
> > > 
> > > No functional change intended.
> > > 
> > > Suggested-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >  hw/core/machine.c   | 28 ++++++++++-------
> > >  hw/i386/pc.c        | 76 +--------------------------------------------
> > >  include/hw/boards.h |  1 +
> > >  3 files changed, 19 insertions(+), 86 deletions(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index d73daa10f4..ed6712e964 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -743,6 +743,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> > >  
> > >  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > >  {
> > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > >      unsigned cpus    = config->has_cpus ? config->cpus : 0;
> > >      unsigned sockets = config->has_sockets ? config->sockets : 0;
> > >      unsigned dies    = config->has_dies ? config->dies : 1;
> > > @@ -761,7 +762,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > >          return;
> > >      }
> > >  
> > > -    if (dies > 1) {
> > > +    if (!mc->smp_dies_supported && dies > 1) {
> > 
> > Won't this allow a user on an arch with !mc->smp_dies_supported to specify
> > dies=1?
> 
> Conceptually that is fine. Before the introduction of CPU sockets
> with 2+ dies, you can credibly say that all sockets had 1 die, so
> it is nreasonable for users to say -smp ....,dies=1,....
> 
> libvirt will unconditionally set dies=1 for all QEMU targets if
> the user didn't specify an explicit dies value
> 
> >          To not allow that, can we do
> > 
> >    if (!mc->smp_dies_supported && config->has_dies)
> > 
> > instead?
> 
> I don't see that this is benefitting apps/users.

Other than maintaining consistency; erroring with "we don't support dies"
for 2+, but not for 1, is inconsistent, then I agree there isn't much
reason to disallow it, since we'll be using the value of 1 anyway
internally. I don't really have a strong preference here, so I'm fine with
allowing dies=1.

Thanks,
drew

> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 


