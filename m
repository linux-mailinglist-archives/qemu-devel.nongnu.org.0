Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09E47EEAA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:58:42 +0100 (CET)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0jDd-0005s2-5s
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:58:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jBw-0004b3-C7
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n0jBu-0003Nj-Oy
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640347014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEc9RyIm/klwZaddP8iGOanhL+vZ4J7UP97QmKZexnk=;
 b=MZK1/an6loun8/hrcz7qnJSqSXe1Aem5oUsxr+eD4ufxyjDaGq4Ri3ztFKbJn7fyGI++Xo
 HH9dv5DVK4RGIKyUdwGpIL3rRN120mbkQOFPrhNYtziU8Rj+Ab8M/d582oB2EeGkwZgLcW
 KTuJ9P2QQiqVx7mxLdsx87SwTSJgEsA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-I2TLioE9MBSQGp1v9q6FiA-1; Fri, 24 Dec 2021 06:56:47 -0500
X-MC-Unique: I2TLioE9MBSQGp1v9q6FiA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so6687887edd.8
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 03:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MEc9RyIm/klwZaddP8iGOanhL+vZ4J7UP97QmKZexnk=;
 b=WkKmdCETMwXcWzWMZ+xZiEX3D/Y13SqT6HPqKp45Ud1HEfnp2oaJm/DqsNUfu4Jp1f
 L92BwPy+qPA9EtsCNLrJP6Q1MRObfI182BvWuqDoiUlU8ccpxTMFpwRzvHDJYKCtPXX7
 7VbLrxhCPHeXV1isl+xy934wldDanlePr8huA6MyTabvm1MYnmAaW7DfmpgEXsV+kutf
 0W8Br+KB2gL4jUyhQ3JhyMFwPnu7Y2c1cAyObWQz36ydFuk6yFbBLoLXx7RJstd+tdwp
 gnbHioab9h3VU+zrkMkwojaiNkv3U1hLoFOQThAahex9iYmb0oUJzYI8eJc53DdHKVN+
 HaeA==
X-Gm-Message-State: AOAM533Qd/eZQorKlHaZmQIXHx7DQURXtXc3OsE5N2uTBEAOmkzhPHb5
 ELYhNYyAKw/QtcIw2k9sSBnzmzUW4K54Wc256qodN2CEcQTevP+Wc455+4lQ9AYgKABBx+YOr+q
 DH3z5Lx9rSBG9qFg=
X-Received: by 2002:a17:907:e8b:: with SMTP id
 ho11mr5410469ejc.481.1640347006546; 
 Fri, 24 Dec 2021 03:56:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDOSdAbBE1qnnGZBm7ItJJh/vnYpKug+hzmQdct9Uy7rgWQ13975xCOIBbcWcdL9J06K7Fpw==
X-Received: by 2002:a17:907:e8b:: with SMTP id
 ho11mr5410445ejc.481.1640347006327; 
 Fri, 24 Dec 2021 03:56:46 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id j21sm2587281ejj.133.2021.12.24.03.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 03:56:45 -0800 (PST)
Date: Fri, 24 Dec 2021 12:56:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
Message-ID: <20211224115643.haya66ehfzeka4jv@gator.home>
References: <20211208170241.110551-1-cohuck@redhat.com>
 <87lf0jr6m4.fsf@redhat.com> <YbyR1C+77+moWF/O@redhat.com>
 <87fsqrqp8m.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsqrqp8m.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 03:29:13PM +0100, Cornelia Huck wrote:
> On Fri, Dec 17 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Fri, Dec 17, 2021 at 09:13:55AM +0100, Cornelia Huck wrote:
> >> On Wed, Dec 08 2021, Cornelia Huck <cohuck@redhat.com> wrote:
> >> 
> >> > Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> >> >
> >> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> > ---
> >> >  hw/arm/virt.c              |  9 ++++++++-
> >> >  hw/core/machine.c          |  3 +++
> >> >  hw/i386/pc.c               |  3 +++
> >> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >> >  include/hw/boards.h        |  3 +++
> >> >  include/hw/i386/pc.h       |  3 +++
> >> >  9 files changed, 71 insertions(+), 6 deletions(-)
> >> >
> >> 
> >
> >
> >> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> > index 223dd3e05d15..b03026bf0648 100644
> >> > --- a/hw/i386/pc_piix.c
> >> > +++ b/hw/i386/pc_piix.c
> >> > @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
> >> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> >> >  }
> >> >  
> >> > -static void pc_i440fx_6_2_machine_options(MachineClass *m)
> >> > +static void pc_i440fx_7_0_machine_options(MachineClass *m)
> >> >  {
> >> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >> >      pc_i440fx_machine_options(m);
> >> > @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
> >> >      pcmc->default_cpu_version = 1;
> >> >  }
> >> >  
> >> > +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
> >> > +                      pc_i440fx_7_0_machine_options);
> >> > +
> >> > +static void pc_i440fx_6_2_machine_options(MachineClass *m)
> >> > +{
> >> > +    pc_i440fx_machine_options(m);
> >
> > Needs to be pc_i440fx_7_0_machine_options()
> >
> >> > +    m->alias = NULL;
> >> > +    m->is_default = false;
> >> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> >> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> >> > +}
> >> > +
> >> >  DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
> >> >                        pc_i440fx_6_2_machine_options);
> >> >  
> >> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> > index e1e100316d93..6b66eb16bb64 100644
> >> > --- a/hw/i386/pc_q35.c
> >> > +++ b/hw/i386/pc_q35.c
> >> > @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >> >      m->max_cpus = 288;
> >> >  }
> >> >  
> >> > -static void pc_q35_6_2_machine_options(MachineClass *m)
> >> > +static void pc_q35_7_0_machine_options(MachineClass *m)
> >> >  {
> >> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >> >      pc_q35_machine_options(m);
> >> > @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
> >> >      pcmc->default_cpu_version = 1;
> >> >  }
> >> >  
> >> > +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
> >> > +                   pc_q35_7_0_machine_options);
> >> > +
> >> > +static void pc_q35_6_2_machine_options(MachineClass *m)
> >> > +{
> >> > +    pc_q35_machine_options(m);
> >
> > Needs to be pc_q35_7_0_machine_options()
> >
> >> > +    m->alias = NULL;
> >> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> >> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> >> > +}
> >> > +
> >> >  DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
> >> >                     pc_q35_6_2_machine_options);
> >> >  
> >> 
> >> So, this apparently causes some problems with one of the avocado tests:
> >> 
> >> 162-tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias -> AssertionError: None != 'Cascadelake-Server-v1' : Cascadelake-Server must be an alias of Cascadelake-Server-v1
> >> 
> >> (full output at https://gitlab.com/qemu-project/qemu/-/jobs/1893456217)
> >> 
> >> I have looked at the patch again and do not see what might be wrong (has
> >> something changed with the cpu model versioning recently?)
> >> 
> >> Does anyone else (especially the x86 folks) have an idea?
> >
> > AFAICT, just a typo in chaining up the methods I've pointed out inline.
> 
> Duh, indeed. Thanks for spotting this.
> 
> Will send a v2.
> 
>

/me wonders if this patch could be generated with a "simple" script in
order to avoid typos and/or forgetting lines. It seems like all
architectures have pretty consistent patterns.

Thanks,
drew


