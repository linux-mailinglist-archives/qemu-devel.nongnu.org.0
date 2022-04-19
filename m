Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D145750674B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:57:00 +0200 (CEST)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjfP-0002H5-PV
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjdB-000112-TN
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjd9-0005jM-Qd
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avMta+Zwq+d+0ZNxRQ4wPkw93beWV82HNKunWhZ8D48=;
 b=XLxnVdWh0Qk6SOXFP+1xYaTSEtdW3G/bavU5wxU/iJm3GDEGNr1meHFNN7oGYKKtX9OrJB
 XSUMSqiFCzM3oq9byl0vdFgIRxE/eBJIRDLvkLCE5Jcy34Q3Z9Rgvv0RuJDmmqHJMdMKJm
 /1977k/5sM8LHKmg2FcVMMR07q+uSsY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-CkmjlY5MNHusCctEk7ZntQ-1; Tue, 19 Apr 2022 04:54:35 -0400
X-MC-Unique: CkmjlY5MNHusCctEk7ZntQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 mp18-20020a1709071b1200b006e7f314ecb3so5643890ejc.23
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 01:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avMta+Zwq+d+0ZNxRQ4wPkw93beWV82HNKunWhZ8D48=;
 b=HTKbqF6zLrxcWpWJkAK+lctqr2dsuP8lTjUeT2TuGvtbeOeY3q+HEiqWGzvcljYz5Z
 xIGGD6pmztFTl5tlRJjxYt9YX9MNeqj0pU4YPfjm2DDRmM4bNTM1QknQ0wO2AQgyPOsV
 KzinMW1geL2C64DntvZ40K1pW1D78RJqjCj191Y7gXtflc2OyWCT6q8ruvltL06l+UTa
 Xj/swefkTzGzr3McILRkhgX1SfeRrPNtZ0CMv/7teRIYJHDkcPU6HGxwUINnuBvkrXpr
 voyal6HevP92ZWj3cIMuGMRmh2L/QLxO5y9f6OZ2KqJ7hPpwPhZlFmVPt1LQn57GFslG
 h1jQ==
X-Gm-Message-State: AOAM533UCxRkn3/fyUsT9/UFGZdhlG/Ijw+hkXKmFsqM57dmEqm2a+ay
 zuBmeF79qCCKZGOLplqiz8BwUt88XDiEKKTt5M1E7lfiJ4OmVUn3HBUyz7KqmRI+nTi9ktNu10F
 9/Ggmi9auAZJGo6E=
X-Received: by 2002:a05:6402:298c:b0:41d:6b63:aa67 with SMTP id
 eq12-20020a056402298c00b0041d6b63aa67mr16386698edb.42.1650358473967; 
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpOoHcnJzxnIG1h7sTCBZRH2lBVZlZ73Oo6MqRpz+SsthrclHjLHd4XjmXGCmp64cFnCABuQ==
X-Received: by 2002:a05:6402:298c:b0:41d:6b63:aa67 with SMTP id
 eq12-20020a056402298c00b0041d6b63aa67mr16386674edb.42.1650358473661; 
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a50934e000000b0042053e79386sm8188005eda.91.2022.04.19.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
Date: Tue, 19 Apr 2022 10:54:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220419105432.11ad0f90@redhat.com>
In-Reply-To: <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Apr 2022 08:33:29 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/13/22 9:52 PM, Igor Mammedov wrote:
> > On Sun,  3 Apr 2022 22:59:53 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> When the PPTT table is built, the CPU topology is re-calculated, but
> >> it's unecessary because the CPU topology has been populated in
> >> virt_possible_cpu_arch_ids() on arm/virt machine.
> >>
> >> This reworks build_pptt() to avoid by reusing the existing one in
> >> ms->possible_cpus. Currently, the only user of build_pptt() is
> >> arm/virt machine.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
> >>   1 file changed, 38 insertions(+), 62 deletions(-)
> >>
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index 4086879ebf..4b0f9df3e3 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c
> >> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>                   const char *oem_id, const char *oem_table_id)
> >>   {
> >>       MachineClass *mc = MACHINE_GET_CLASS(ms);
> >> -    GQueue *list = g_queue_new();
> >> -    guint pptt_start = table_data->len;
> >> -    guint parent_offset;
> >> -    guint length, i;
> >> -    int uid = 0;
> >> -    int socket;
> >> +    CPUArchIdList *cpus = ms->possible_cpus;
> >> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> >> +    uint32_t socket_offset, cluster_offset, core_offset;
> >> +    uint32_t pptt_start = table_data->len;
> >> +    int n;
> >>       AcpiTable table = { .sig = "PPTT", .rev = 2,
> >>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
> >>   
> >>       acpi_table_begin(&table, table_data);
> >>   
> >> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> >> -        g_queue_push_tail(list,
> >> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> >> -        build_processor_hierarchy_node(
> >> -            table_data,
> >> -            /*
> >> -             * Physical package - represents the boundary
> >> -             * of a physical package
> >> -             */
> >> -            (1 << 0),
> >> -            0, socket, NULL, 0);
> >> -    }
> >> +    for (n = 0; n < cpus->len; n++) {  
> >   
> >> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> >> +            socket_id = cpus->cpus[n].props.socket_id;  
> > 
> > this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
> > I'd add here and for other container_id an assert() that checks for that
> > specific ID goes in only one direction, to be able to detect when rule is broken.
> > 
> > otherwise on may end up with duplicate containers silently.
> >   
> 
> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
> may need add comments for this in v6.
> 
>      /*
>       * This works with the assumption that cpus[n].props.*_id has been
>       * sorted from top to down levels in mc->possible_cpu_arch_ids().
>       * Otherwise, the unexpected and duplicate containers will be created.
>       */
> 
> The implementation in v3 looks complicated, but comprehensive. The one
> in this revision (v6) looks simple, but the we're losing flexibility :)


comment is not enough, as it will break silently that's why I suggested
sprinkling asserts() here.

[...]
> Thanks,
> Gavin
> 


