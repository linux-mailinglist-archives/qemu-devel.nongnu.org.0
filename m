Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939241F331
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:36:44 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMSh-0004Ju-9o
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWM8s-0002no-Ur
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWM8p-0008JE-7q
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633108570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0RDL6OPsBpQ8yxdCm1HozU4NLEGPnl3ZGrsM6NRK6M0=;
 b=fu95pibK9J3ZmxVujieqgnTGDcI8ljzop6mV6QSBXt8mivvPxN68oAVF9hQ368B4DFB5Cm
 aP28ddm3G53WcKJOqPs6v1kxMDD4BEO91wNxDFo4rfoMb6LmCXTLcTCqsR8W8mADdjJpcu
 AgU6yKNlG6gCNewGS+AW4MRXQAyhh38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-tdvoboP2M1uEBmanAquEyA-1; Fri, 01 Oct 2021 13:15:57 -0400
X-MC-Unique: tdvoboP2M1uEBmanAquEyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1EF519067E1;
 Fri,  1 Oct 2021 17:15:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7A15D6BA;
 Fri,  1 Oct 2021 17:15:51 +0000 (UTC)
Date: Fri, 1 Oct 2021 18:15:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
Message-ID: <YVdCRYvRHIio6MZe@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
> On 29/09/21 04:58, Yanan Wang wrote:
> > @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
> >           return;
> >       }
> > -    smp_parse(ms, config, errp);
> > -    if (*errp) {
> > +    if (!smp_parse(ms, config, errp)) {
> >           qapi_free_SMPConfiguration(config);
> >       }
> >   }
> > 
> 
> This is actually a leak, so I'm replacing this patch with

This patch isn't adding a leak, as there's no change in
control flow / exit paths.  AFAICT, the leak was introduced
in patch 15 instead, so the code below shoudl be squashed
into that, and this patch left as-is.

> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 54f04a5ac6..d49ebc24e2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -897,7 +897,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
>      MachineState *ms = MACHINE(obj);
> -    SMPConfiguration *config;
> +    g_autoptr(SMPConfiguration) config = NULL;
>      ERRP_GUARD();
>      if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
> @@ -920,7 +920,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>      smp_parse(ms, config, errp);
>      if (*errp) {
> -        goto out_free;
> +        return;
>      }
>      /* sanity-check smp_cpus and max_cpus against mc */
> @@ -935,9 +935,6 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>                     ms->smp.max_cpus,
>                     mc->name, mc->max_cpus);
>      }
> -
> -out_free:
> -    qapi_free_SMPConfiguration(config);
>  }
>  static void machine_class_init(ObjectClass *oc, void *data)
> 
> which removes the need.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


