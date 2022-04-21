Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8B509BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:09:29 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSoa-0004VX-CD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nhShv-0007mS-6W
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nhShs-0005Jg-3F
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650531751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Yqmx+bpUE2MADKJnlTIjk/ZfQ94wM4wYlGjUx2KmP0=;
 b=B4sF/RCHz46vnL9UZ7xMzfaH25OwxbJ189jgxWjL0UJ1wMcUYguiQsEOD8355kczjrfgaM
 UYz1woyg+uXPCpguA8ZQmOERNcOJK7HRmkZGvIRs1pubIhT2VBkjs7SKs81d+IPIYwXyUT
 5sHBe4cXPzCS3qdoBchCS7XfaAWkx9w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-XGGykdFjMBad4XTOizuGgQ-1; Thu, 21 Apr 2022 05:02:30 -0400
X-MC-Unique: XGGykdFjMBad4XTOizuGgQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 ne8-20020a1709077b8800b006e87e97d2e7so2172426ejc.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Yqmx+bpUE2MADKJnlTIjk/ZfQ94wM4wYlGjUx2KmP0=;
 b=I7KedvSQp8Me7eHvAcAP4wEd82STMVj8HSy3WCo5YvW1MglwUpm2kd0DVm1lyeFvNN
 bURwrhfdS1/IAq1RAzmf0IEqATaXfn3bXDJen6R+/Y8KMuxU+uYLDc8EkU1xgAwSXVph
 8JsTrSIGkPU7IqK04L3+JU39htpOzF4nEYVcAxFMPBV5A/BCZmxtK2a+BdFiH+mjdczp
 RY2nU79e3eS1D+qWNa2sPwO7h2boimUdzG7OMyYm6OjxxYbGmLpJYSV/8v4B3JHpbc+u
 Elae8q7EUgvPrVf/QXyotbGNmggrT6ZJQvnJXUM5j1WVCAYWd0p/TMImETfjor0B6/cL
 gQ4Q==
X-Gm-Message-State: AOAM533MGSABg0AZhZgurjPljZgqcmgJR9cJMAN4K3xPGOWjvnQHoeiA
 JWt6IJl54pMhcKLfC9isldWRsPQTHt8gB78mpz3yQi17d4WV66FQ+TkBaIzasicYwVC/U2nJASt
 9SVuyXN9vWPXaduU=
X-Received: by 2002:a05:6402:42c9:b0:423:e275:28d9 with SMTP id
 i9-20020a05640242c900b00423e27528d9mr22572216edc.176.1650531748720; 
 Thu, 21 Apr 2022 02:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdnRdW8+srLD+fqYSr5K3PpoQ/jpvFDMR8Y+EWXQ5aokvcA0pYGQXfB78voXAv4AlXQTI2Bg==
X-Received: by 2002:a05:6402:42c9:b0:423:e275:28d9 with SMTP id
 i9-20020a05640242c900b00423e27528d9mr22572169edc.176.1650531748407; 
 Thu, 21 Apr 2022 02:02:28 -0700 (PDT)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm11201938edt.80.2022.04.21.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:02:26 -0700 (PDT)
Date: Thu, 21 Apr 2022 11:02:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220421090224.l6i3qcu53seiz5yf@gator>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
 <20220420135032.43711096@redhat.com>
 <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, thuth@redhat.com,
 shan.gavin@gmail.com, pbonzini@redhat.com, mst@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wangyanan55@huawei.com, qemu-arm@nongnu.org,
 Jonathan.Cameron@huawei.com, ani@anisinha.ca,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 10:24:46PM +0800, Gavin Shan wrote:
...
> With amend to the command lines, the following one is used and below error
> is raised from the test. The error is mentioned in the commit log in
> PATCH[v7 2/4].
> 
>     -machine smp.cpus=2                                   \
>     -numa node,nodeid=0,memdev=ram -numa node,nodeid=1    \
>     -numa cpu,node-id=1,thread-id=0                       \
>     -numa cpu,node-id=0,thread-id=1
> 
>     qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>     (reported from hw/core/machine.c::machine_set_cpu_numa_node())
> 
> After the changes to virt_possible_cpu_arch_ids() is applied, "thread-id=1"
> isn't valid any more. The CPU topology becomes like below. Note that
> mc->smp_props.prefer_sockets is true on arm/virt machine.

prefer_sockets is only true for mach-virt 6.1 and older. It's false for
6.2 and later.

Thanks,
drew

> 
>     index    socket   cluster    core    thread
>     --------------------------------------------
>       0        0        0         0        0
>       1        1        0         0        0
> 
> With the amended command lines, the topology changes again so
> that "thread-id=1" is valid:
> 
>     index    socket   cluster    core    thread
>     --------------------------------------------
>       0        0        0         0        0
>       1        0        0         0        1
> 
> It should be ok to split the test/qtest/aarch64_numa_cpu() changes into
> a separate patch and put it before this one. In that case, the specified
> smp.{socket, cluster, core, threads} isn't used by arm/virt machine yet,
> and 'thread-id=2' should be still valid. Lets do this if I need post v8.
> Otherwise, I guess it's also fine to squash the test/qtest/aarch64_numa_cpu()
> changes into PATCH[2/4], as we're doing.
> 
> > 
> > > 
> > > 
> > > > >            "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> > > > >            "-numa cpu,node-id=1,thread-id=0 "
> > > > >            "-numa cpu,node-id=0,thread-id=1");
> 
> Thanks,
> Gavin
> 


