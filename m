Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E73EEC0C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:04:02 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxp2-0004JB-OX
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxo5-0003Xj-5M
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxo0-00085s-Me
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629201775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWkqZLxGXc8MGjqgICh3WuHyBRG0K8HGxRgoYllsW4U=;
 b=Rn4qja7/sddzK4SH1RfcWaGoRfN1ccFT/DKX1by3fRVLmx1BM2UBw5PX3JY6UIMoFkt3zu
 A7XufMp+etlm0Keb+uO6NtecYNJS52VPF5joDPoO1B+BKXDsG2Nn+QuyQfKdAg5Q4jOZP9
 TH0fak6eUE8hhYWp776X7U1WIZp5XPI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-9i1svphsNeC98tiFf9FhFQ-1; Tue, 17 Aug 2021 08:02:54 -0400
X-MC-Unique: 9i1svphsNeC98tiFf9FhFQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 e15-20020a1709061fcf00b005bd9d618ea0so1853673ejt.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tWkqZLxGXc8MGjqgICh3WuHyBRG0K8HGxRgoYllsW4U=;
 b=I+yC4GmUTfzeQnGgSPlUL3geFtb/K7Q/TI1Px1TFQbj12aOEQU5xlYoWcRTLR2gDSw
 H9MPZnwRlI9L8vyjAskY8rUTY2amHJj5SxZ3EDYze1xlimLpRkTBvAjia9OhRggUoUUX
 Loiw7I4KDzAJG7N8HYKCTVGMB+6TWxsH2lFR3URMyze57/hC347sRGalRScwVQXKd1Qz
 ZhAdV2GTyOpdif/Ot/DfOCH1hx/gyVZXOpKhvXIufSRrdfBNLRsXaZJo7zLJ8y7Smu9S
 nWeBLLDPBKkVpdbZXqc3GJJ0kKh6p4fJK4YN2rKRj41XmAOFW+kfKPw3r5PU+1HGn/lS
 lC6A==
X-Gm-Message-State: AOAM533gAYj5g2S4bponT3lQb0a+kXMX6uk4UZ1laFAjnWtWfqABUVsp
 Z2DqSgZTXYUL0w6xL7LzEQUae0PDGgcwEwayB4l48g2c0I12ov2dFOJqe3fiP9htak/X0HNMWXF
 sxkqHLEIk3Lc0nsc=
X-Received: by 2002:a17:906:1784:: with SMTP id
 t4mr3511441eje.445.1629201772916; 
 Tue, 17 Aug 2021 05:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuQs1RH73EhP5hwPjgjrU5HCX/sDCDLyx/CyoemQZZi7GB0e5oS79vx11aWdpXjqta75S3ig==
X-Received: by 2002:a17:906:1784:: with SMTP id
 t4mr3511409eje.445.1629201772630; 
 Tue, 17 Aug 2021 05:02:52 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id ks20sm675586ejb.101.2021.08.17.05.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 05:02:52 -0700 (PDT)
Date: Tue, 17 Aug 2021 14:02:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 1/1] machine: Disallow specifying topology parameters as
 zero
Message-ID: <20210817120250.fdpujloefaqtawwo@gator.home>
References: <20210816210603.42337-1-ehabkost@redhat.com>
 <20210816210603.42337-2-ehabkost@redhat.com>
 <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfaWxNsq2i8j6P+oZGFjxyR3MFE9FopHsnvuNAPXa4upYQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 11:37:21PM +0200, Paolo Bonzini wrote:
> How do we know that no one has ever used such configuration? The conversion
> was meant to be bug-compatible.

We don't. But we do know that a zero input value was never documented
prior to 1e63fe68580, which has not yet been released. Can we claim
that an undocumented input value has undefined behavior, giving us
freedom to modify that behavior until it is documented?

Thanks,
drew

> 
> Paolo
> 
> Il lun 16 ago 2021, 23:06 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
> 
> > From: Yanan Wang <wangyanan55@huawei.com>
> >
> > In the SMP configuration, we should either provide a topology
> > parameter with a reasonable value (greater than zero) or just
> > omit it and QEMU will compute the missing value. Users should
> > have never provided a configuration with parameters as zero
> > (e.g. -smp 8,sockets=0) which should be treated as invalid.
> >
> > But commit 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
> > has added some doc which implied that 'anything=0' is valid and
> > has the same semantics as omitting a parameter.
> >
> > To avoid meaningless configurations possibly introduced by users
> > in the future and consequently a necessary deprecation process,
> > fix the doc and also add the corresponding sanity check.
> >
> > Fixes: 1e63fe68580 (machine: pass QAPI struct to mc->smp_parse)
> > Suggested-by: Andrew Jones <drjones@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> > Tested-by: Daniel P. Berrange <berrange@redhat.com>
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > Message-Id: <20210816024522.143124-2-wangyanan55@huawei.com>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  hw/core/machine.c | 14 ++++++++++++++
> >  qapi/machine.json |  6 +++---
> >  qemu-options.hx   | 12 +++++++-----
> >  3 files changed, 24 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 54e040587dd..a7e119469aa 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -832,6 +832,20 @@ static void machine_set_smp(Object *obj, Visitor *v,
> > const char *name,
> >          return;
> >      }
> >
> > +    /*
> > +     * A specified topology parameter must be greater than zero,
> > +     * explicit configuration like "cpus=0" is not allowed.
> > +     */
> > +    if ((config->has_cpus && config->cpus == 0) ||
> > +        (config->has_sockets && config->sockets == 0) ||
> > +        (config->has_dies && config->dies == 0) ||
> > +        (config->has_cores && config->cores == 0) ||
> > +        (config->has_threads && config->threads == 0) ||
> > +        (config->has_maxcpus && config->maxcpus == 0)) {
> > +        error_setg(errp, "CPU topology parameters must be greater than
> > zero");
> > +        goto out_free;
> > +    }
> > +
> >      mc->smp_parse(ms, config, errp);
> >      if (*errp) {
> >          goto out_free;
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index c3210ee1fb2..9272cb3cf8b 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1288,8 +1288,8 @@
> >  ##
> >  # @SMPConfiguration:
> >  #
> > -# Schema for CPU topology configuration.  "0" or a missing value lets
> > -# QEMU figure out a suitable value based on the ones that are provided.
> > +# Schema for CPU topology configuration. A missing value lets QEMU
> > +# figure out a suitable value based on the ones that are provided.
> >  #
> >  # @cpus: number of virtual CPUs in the virtual machine
> >  #
> > @@ -1297,7 +1297,7 @@
> >  #
> >  # @dies: number of dies per socket in the CPU topology
> >  #
> > -# @cores: number of cores per thread in the CPU topology
> > +# @cores: number of cores per die in the CPU topology
> >  #
> >  # @threads: number of threads per core in the CPU topology
> >  #
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 83aa59a920f..aee622f577d 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -227,11 +227,13 @@ SRST
> >      of computing the CPU maximum count.
> >
> >      Either the initial CPU count, or at least one of the topology
> > parameters
> > -    must be specified. Values for any omitted parameters will be computed
> > -    from those which are given. Historically preference was given to the
> > -    coarsest topology parameters when computing missing values (ie sockets
> > -    preferred over cores, which were preferred over threads), however,
> > this
> > -    behaviour is considered liable to change.
> > +    must be specified. The specified parameters must be greater than zero,
> > +    explicit configuration like "cpus=0" is not allowed. Values for any
> > +    omitted parameters will be computed from those which are given.
> > +    Historically preference was given to the coarsest topology parameters
> > +    when computing missing values (ie sockets preferred over cores, which
> > +    were preferred over threads), however, this behaviour is considered
> > +    liable to change.
> >  ERST
> >
> >  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> > --
> > 2.31.1
> >
> >


