Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCD408865
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:37:43 +0200 (CEST)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPiPG-0004a9-IF
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPiNZ-0003u6-HI
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPiNX-0002pM-Sz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631525754;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPJFv7DUxF0L6f9WEAKxcibK9LyBSPDB6WHq/QxpK2o=;
 b=YA2HKpovkYowY69P/bD5IL9g71ejMYtdNMhLfgG8X7YWyLXhB1V1rLMH0J7yNzUWGiX8JP
 wFyA8Kcc76afCrF3lVqm8h9UXYVLrN+L4i2HLI8F9RUWesgQTgK7K1GwUC3G/mLUpJ7BeC
 g477nr5BgIYrz2RKelfiRXqf7dklj4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-iU9g9NZJM-mMRoyDossyPQ-1; Mon, 13 Sep 2021 05:35:47 -0400
X-MC-Unique: iU9g9NZJM-mMRoyDossyPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BAB11006AA1;
 Mon, 13 Sep 2021 09:35:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D22E5C1D1;
 Mon, 13 Sep 2021 09:35:44 +0000 (UTC)
Date: Mon, 13 Sep 2021 10:35:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>, pbonzini@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, eblake@redhat.com,
 seanjc@google.com
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Message-ID: <YT8bboSgYfWJP9kh@redhat.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <YTthmPn2KGcfNX21@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTthmPn2KGcfNX21@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 02:46:00PM +0100, Daniel P. Berrangé wrote:
> On Fri, Sep 10, 2021 at 06:22:56PM +0800, Yang Zhong wrote:
> > The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
> > the SGX information from VM side when SGX is enabled on Intel platform.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hmp-commands-info.hx         | 15 +++++++++++++
> >  hw/i386/sgx.c                | 29 ++++++++++++++++++++++++
> >  include/hw/i386/sgx.h        | 11 +++++++++
> >  include/monitor/hmp-target.h |  1 +
> >  qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
> >  target/i386/monitor.c        | 36 ++++++++++++++++++++++++++++++
> >  tests/qtest/qmp-cmd-test.c   |  1 +
> >  7 files changed, 136 insertions(+)
> >  create mode 100644 include/hw/i386/sgx.h
> 
> > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > index 02fa6487c3..8a32d62d7e 100644
> > --- a/hw/i386/sgx.c
> > +++ b/hw/i386/sgx.c
> > @@ -17,6 +17,35 @@
> >  #include "monitor/qdev.h"
> >  #include "qapi/error.h"
> >  #include "exec/address-spaces.h"
> > +#include "hw/i386/sgx.h"
> > +
> > +SGXInfo *sgx_get_info(void)
> 
> I'd suggest this should have an 'Error **errp'
> 
> > +{
> > +    SGXInfo *info = NULL;
> > +    X86MachineState *x86ms;
> > +    PCMachineState *pcms =
> > +        (PCMachineState *)object_dynamic_cast(qdev_get_machine(),
> > +                                              TYPE_PC_MACHINE);
> > +    if (!pcms) {
> 
>   error_setg(errp, "SGX is only available for x86 PC machines");
> 
> > +        return NULL;
> > +    }
> > +
> > +    x86ms = X86_MACHINE(pcms);
> > +    if (!x86ms->sgx_epc_list) {
> 
>   error_setg(errp "SGX is not enabled on this machine");
> 
> > +        return NULL;
> > +    }
> > +
> > +    SGXEPCState *sgx_epc = &pcms->sgx_epc;
> > +    info = g_new0(SGXInfo, 1);
> > +
> > +    info->sgx = true;
> > +    info->sgx1 = true;
> > +    info->sgx2 = true;
> > +    info->flc = true;
> > +    info->section_size = sgx_epc->size;
> > +
> > +    return info;
> > +}
> 
> 
> 
> > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > index 119211f0b0..0f1b48b4f8 100644
> > --- a/target/i386/monitor.c
> > +++ b/target/i386/monitor.c
> > @@ -35,6 +35,7 @@
> >  #include "qapi/qapi-commands-misc-target.h"
> >  #include "qapi/qapi-commands-misc.h"
> >  #include "hw/i386/pc.h"
> > +#include "hw/i386/sgx.h"
> >  
> >  /* Perform linear address sign extension */
> >  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> > @@ -763,3 +764,38 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> >  {
> >      return sev_get_attestation_report(mnonce, errp);
> >  }
> > +
> > +SGXInfo *qmp_query_sgx(Error **errp)
> > +{
> > +    SGXInfo *info;
> > +
> > +    info = sgx_get_info();
> 
> Pass errp into this
> 
> > +    if (!info) {
> > +        error_setg(errp, "SGX features are not available");
> 
> And get rid of this.
> 
> > +        return NULL;
> > +    }
> > +
> > +    return info;
> > +}
> > +
> > +void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> > +{
> 
>   g_autoptr(Error) err = NULL

I was mistaken here - Error shouldn't use g_autoptr, just

   Error err = NULL;

> 
> > +    SGXInfo *info = qmp_query_sgx(NULL);
> 
> Pass in &err not NULL;
> 
> Also  declare it with  'g_autoptr(SGXInfo) info = ...'
> 
> And then
> 
>    if (err) {
>       monitor_printf(mon, "%s\n", error_get_pretty(err);

Then use the simpler:

    error_report_err(err);

which prints + frees 'err'

>       return;
>    }
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


