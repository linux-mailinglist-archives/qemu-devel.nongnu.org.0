Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD18508762
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:52:18 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8sa-0005um-Ef
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh8r2-0004sk-Qv
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh8r0-0002yZ-75
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650455437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ES5sXcoT4+dHsdY+TpBtfcjQSXQ/WBy2I8rr7J9w36U=;
 b=inGHNnSggFu90fXScZXbMPPFz21WViNnslGkTpCuXdJi8ONgQTw3JX3PFTW5JZLar0fpYN
 iJM8L+LXH6cXxkvQjl0EZEmfiSIMohUmEZvqY+pNLmmwVvTj5ZZXFiJhF/cmNE+mZMJeL2
 yvLJteDF+rCB0t+0+ZbwPbqhDDShok0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-SMRNi4OaOTa819iJ3eL8ZA-1; Wed, 20 Apr 2022 07:50:36 -0400
X-MC-Unique: SMRNi4OaOTa819iJ3eL8ZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ee36-20020a056402292400b0041d836b664cso1038151edb.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 04:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ES5sXcoT4+dHsdY+TpBtfcjQSXQ/WBy2I8rr7J9w36U=;
 b=Wnkh5RH+SBc7WfAI5fC4n8UAQkMK+AIU+U38Xas1iub6stpwI5BIcrK5pnwqXGYMI2
 J+5ZrKSJYgzP3Es473lTTZ0fP5BBQDdgXBXMZRsmIphgE+dNZux1AVY4Xql0rA3PoFa7
 J6G104pC67qqJX7nfscEOWmD6JOBPNreqxaMppEvyfTIJKpz2Owq33Eqy+Xwf8m8lAQ9
 6IpJQraBPyo8e9sYEBNhHuFexWJh/iFhSY+P+2cNgYbcy5Eu6ckHqUmSANyH7IiM0Q+n
 zlz7Xdp1o3+WNulqrHHtKjpmT1LaMltJEGQEK9MOrw94EpEVCGnzoicjYHpobnpCA7cF
 qomA==
X-Gm-Message-State: AOAM531JvzZa/0FOrE9GTxW+66gE92nfHfkyee41p2/TkaY+059I18EG
 0ZztFfCumsUtZLYf/hkk0Zsjud4S/P4U/ecQ5TiSgs51kItTszZMZ1eqQAMx0L6BwjQagYFYxsI
 mOh8dksm4XoxdLkk=
X-Received: by 2002:a17:907:8a27:b0:6f0:81f:4509 with SMTP id
 sc39-20020a1709078a2700b006f0081f4509mr1763841ejc.670.1650455434925; 
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTBbY4fD6RmfFzifbk8L72yvmbckclyxVta0T52q0xkM6CuC/tpHKcasPEXmvGF1eJ6yJr0Q==
X-Received: by 2002:a17:907:8a27:b0:6f0:81f:4509 with SMTP id
 sc39-20020a1709078a2700b006f0081f4509mr1763801ejc.670.1650455434601; 
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a170906725500b006e10a7d6d03sm6578181ejk.219.2022.04.20.04.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:50:34 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:50:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220420135032.43711096@redhat.com>
In-Reply-To: <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 18:31:02 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/20/22 4:32 PM, Igor Mammedov wrote:
> > On Mon, 18 Apr 2022 10:09:18 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> Currently, the SMP configuration isn't considered when the CPU
> >> topology is populated. In this case, it's impossible to provide
> >> the default CPU-to-NUMA mapping or association based on the socket
> >> ID of the given CPU.
> >>
> >> This takes account of SMP configuration when the CPU topology
> >> is populated. The die ID for the given CPU isn't assigned since
> >> it's not supported on arm/virt machine. Besides, the used SMP
> >> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> >> to avoid testing failure
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >> ---
> >>   hw/arm/virt.c           | 15 ++++++++++++++-
> >>   tests/qtest/numa-test.c |  3 ++-
> >>   2 files changed, 16 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index d2e5ecd234..5443ecae92 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>       int n;
> >>       unsigned int max_cpus = ms->smp.max_cpus;
> >>       VirtMachineState *vms = VIRT_MACHINE(ms);
> >> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >>   
> >>       if (ms->possible_cpus) {
> >>           assert(ms->possible_cpus->len == max_cpus);
> >> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >>           ms->possible_cpus->cpus[n].arch_id =
> >>               virt_cpu_mp_affinity(vms, n);
> >> +
> >> +        assert(!mc->smp_props.dies_supported);
> >> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> >> +        ms->possible_cpus->cpus[n].props.socket_id =
> >> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
> >> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> >> +        ms->possible_cpus->cpus[n].props.cluster_id =
> >> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> >> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> >> +        ms->possible_cpus->cpus[n].props.core_id =
> >> +            (n / ms->smp.threads) % ms->smp.cores;
> >>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> >> +        ms->possible_cpus->cpus[n].props.thread_id =
> >> +            n % ms->smp.threads;
> >>       }
> >>       return ms->possible_cpus;
> >>   }
> >> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> >> index 90bf68a5b3..aeda8c774c 100644
> >> --- a/tests/qtest/numa-test.c
> >> +++ b/tests/qtest/numa-test.c
> >> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
> >>       QTestState *qts;
> >>       g_autofree char *cli = NULL;
> >>   
> >> -    cli = make_cli(data, "-machine smp.cpus=2 "
> >> +    cli = make_cli(data, "-machine "
> >> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "  
> > 
> > Is cluster-less config possible?
> > (looks like it used to work before and it doesn't after this series)
> >   
> 
> Nope, it's impossible. This specific test case uses arm/virt machine
> where cluster is always supported.mc->smp_props.clusters_supported
> has been set to true in hw/arm/virt.c::virt_machine_class_init().
> 
> Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
> the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
> make it 'bit bisect' friendly as Yanan suggested.

so what was error that broke the test?
(probably should be mentioned in commit message)

(also is it possible to split out the test patch into
a separate one and put it before this one)


> 
> 
> >>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
> >>           "-numa cpu,node-id=1,thread-id=0 "
> >>           "-numa cpu,node-id=0,thread-id=1");  
> 
> Thanks,
> Gavin
> 


