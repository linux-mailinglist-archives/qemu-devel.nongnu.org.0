Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92C50838B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:36:38 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5pF-0006wM-Eg
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5li-00041I-5y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nh5lf-0005BF-MO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650443574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4E30pfhwb4ck69KEciFHA0NRtjO9nRWX70n7OvhJ+A=;
 b=E1RzmxVvazF9TsG7pwLHTyiHvk07tPNyPVyRAyoWNnTDr1W/T41+xYRrGB15itqVv3ootV
 47X8iUgqvvtbv9fddLV1810ZISrU1SE4MtHQoNwDk9zCb3pdlZbQ8MB+RwvMRYfZLg25aK
 KFSoIJ6YNvLLDlz48UyULuMnGjFyrZQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-8wcDJ1uFM0yWgk-7wG9sEQ-1; Wed, 20 Apr 2022 04:32:52 -0400
X-MC-Unique: 8wcDJ1uFM0yWgk-7wG9sEQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d13-20020a50fb0d000000b00422ef4a8679so721040edq.17
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4E30pfhwb4ck69KEciFHA0NRtjO9nRWX70n7OvhJ+A=;
 b=5lFTmyDaJHEI1pkTkQnpomJshlD8qaFQqwsNZn/0x2PJuRm6Nkrw8eDmSgO2TVDaXh
 rq6+gS03/e6/eSJPJf2U/gfwgTAB1Q1Zvz6KzBkEs1kKsbj8LEY/HoR71FIpvzy3gpeu
 uIoTbyMn7EQi2nxBf+Hw2i4VKdozZCYnO6zI8lKT7AHqjrg7WBJ85MWPrZ/dOsRseRkb
 3ppsof1riYMNmSg6tnUVmMoAUbqKt3LvCVJfcOv2z2oI3WCW1TK+p9ZrFyodKy0WRRxK
 R3GK+1iq7T8WybHnp7hyiQjn/AFrmp5NUsbOd1sRNPiYEp1OCubVRLKeQfAf/LKGd8ip
 ADbQ==
X-Gm-Message-State: AOAM533RHzpMPaTcJRmXTSOxLEaVSpUsRaoH04yYC4NYKAcLh8FsZPX/
 tv4iRBloiYhsTDjXc2B/aWfTTHvk5MOtumzSEm3mtPdWY+bhFik63PmyRh8vdvDYJ2tnigFpGxK
 JEjKvNC4d1S+31Is=
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr16579231ejx.396.1650443570845; 
 Wed, 20 Apr 2022 01:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAnMB9B5WX67dPQn75M89LBvu3UM4Lg7R+Bvplg0TSDLkDGQoNwkPEdDDymbwkHhUdQZO/Wg==
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr16579198ejx.396.1650443570601; 
 Wed, 20 Apr 2022 01:32:50 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090679c300b006cf9ce53354sm6479373ejo.190.2022.04.20.01.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:32:50 -0700 (PDT)
Date: Wed, 20 Apr 2022 10:32:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220420103248.6e3575cd@redhat.com>
In-Reply-To: <20220418020920.144263-3-gshan@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, 18 Apr 2022 10:09:18 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
> 
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine. Besides, the used SMP
> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> to avoid testing failure
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c           | 15 ++++++++++++++-
>  tests/qtest/numa-test.c |  3 ++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..5443ecae92 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>      int n;
>      unsigned int max_cpus = ms->smp.max_cpus;
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>  
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len == max_cpus);
> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>          ms->possible_cpus->cpus[n].type = ms->cpu_type;
>          ms->possible_cpus->cpus[n].arch_id =
>              virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id =
> +            (n / ms->smp.threads) % ms->smp.cores;
>          ms->possible_cpus->cpus[n].props.has_thread_id = true;
> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> +        ms->possible_cpus->cpus[n].props.thread_id =
> +            n % ms->smp.threads;
>      }
>      return ms->possible_cpus;
>  }
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..aeda8c774c 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-machine smp.cpus=2 "
> +    cli = make_cli(data, "-machine "
> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "

Is cluster-less config possible?
(looks like it used to work before and it doesn't after this series)

>          "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>          "-numa cpu,node-id=1,thread-id=0 "
>          "-numa cpu,node-id=0,thread-id=1");


