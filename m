Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C664AD3AD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:41:57 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHM4S-0001AG-CP
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHLhd-0004Sx-T8
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHLhb-0001Xy-6M
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsqI/zBYKtGBxaLdIaJgM+rlL/WkrJv9Wvl40VNjD3Q=;
 b=F1s7A3/BEP4YTXriip8kokTEOOkfRtX9VP77HCPEjzeSNUPAOzbU8cl1TE8ZvwA4K8oFXu
 GYJgy+TsCxLth/w/+XbT5+hU3XosxLpB/Rzx/ej3tpnqXi3YZsUHdbJnzsRQ9EO0rM0qOh
 3s7S44GmWTVJjxhwNxN5jKJxZePAoF4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-oAFbMamMMvCFRVpEY57Vsw-1; Tue, 08 Feb 2022 03:18:13 -0500
X-MC-Unique: oAFbMamMMvCFRVpEY57Vsw-1
Received: by mail-pf1-f200.google.com with SMTP id
 z37-20020a056a001da500b004c74e3fd644so9235279pfw.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wsqI/zBYKtGBxaLdIaJgM+rlL/WkrJv9Wvl40VNjD3Q=;
 b=t5j18wBAFPDAEWUyNDXg0u9M3+b59v+BnXezCwACCC6k4pFNKq0Y639aDTQABeBNvR
 rILwpkmk6AeoxzJFsMOcG55LqO2UevPm2oUxgqvIe2/Ib/FKkvG8371wVt6Amjkg8Unp
 6iyWS6pVW+gyCsAvidGDX/eI/e/RwYrFoIgWRRXGyqg8NSYgIBBKDmbxamDXNLC1LTCU
 9CmTo/c2RdbaRNSpJ5oArWz/6UpqS2I/QHgPvCs65fSMINUY2Us/TYSlovKxMocVGf6r
 ZCKbpbjyalTrV0tF4O5jt3BXRgRiFm4xdsmC1J+ZKufrvuuqBSPvD6jUfFZ1hsEY5cuo
 XPZw==
X-Gm-Message-State: AOAM533WfnbiGQfR8l4GI7eQqf+TmKtM2wj3Liv5N2Ab9dQaIi5HLMtJ
 Xbm9sKmVyv+DlBosJcov8mSojPNT95mkgE7JMz+2LWQ4cf9Lc7OnFU0Mga222YplfSzHJGAZmjt
 pToJyc20a7UOXJxA=
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr3287771pfr.30.1644308292319; 
 Tue, 08 Feb 2022 00:18:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUSQLNyski5RVY+vZUqrzQ86qbGLAjJNx7B49BS5O3+6oGpimK9UhYqFV2arX4xKw9/xLusw==
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr3287733pfr.30.1644308291982; 
 Tue, 08 Feb 2022 00:18:11 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id k15sm14686115pff.39.2022.02.08.00.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:18:11 -0800 (PST)
Date: Tue, 8 Feb 2022 16:18:05 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v12 2/5] migration/dirtyrate: refactor dirty page rate
 calculation
Message-ID: <YgInPaeq0mUzwv6R@xz-m1.local>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
 <1ecd8924ec4c9f9d35d73c8e3e066c9869e8b298.1643026714.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <1ecd8924ec4c9f9d35d73c8e3e066c9869e8b298.1643026714.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 10:10:37PM +0800, huangy81@chinatelecom.cn wrote:
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e..63159d6 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -73,6 +73,7 @@ static int cpu_get_free_index(void)
>  }
>  
>  CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
> +unsigned int cpu_list_generation_id;
>  
>  void cpu_list_add(CPUState *cpu)
>  {
> @@ -84,6 +85,7 @@ void cpu_list_add(CPUState *cpu)
>          assert(!cpu_index_auto_assigned);
>      }
>      QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
> +    cpu_list_generation_id++;
>  }
>  
>  void cpu_list_remove(CPUState *cpu)
> @@ -96,6 +98,7 @@ void cpu_list_remove(CPUState *cpu)
>  
>      QTAILQ_REMOVE_RCU(&cpus, cpu, node);
>      cpu->cpu_index = UNASSIGNED_CPU_INDEX;
> +    cpu_list_generation_id++;
>  }

Could you move the cpu list gen id changes into a separate patch?

>  
>  CPUState *qemu_get_cpu(int index)
> diff --git a/include/sysemu/dirtyrate.h b/include/sysemu/dirtyrate.h
> new file mode 100644
> index 0000000..ea4785f
> --- /dev/null
> +++ b/include/sysemu/dirtyrate.h
> @@ -0,0 +1,31 @@
> +/*
> + * dirty page rate helper functions
> + *
> + * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
> + *
> + * Authors:
> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_DIRTYRATE_H
> +#define QEMU_DIRTYRATE_H
> +
> +extern unsigned int cpu_list_generation_id;

How about exporting a function cpu_list_generation_id_get() from the cpu code,
rather than referencing it directly?

> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
> +                                 int64_t init_time_ms,
> +                                 VcpuStat *stat,
> +                                 unsigned int flag,
> +                                 bool one_shot)
> +{
> +    DirtyPageRecord *records;
> +    int64_t duration;
> +    int64_t dirtyrate;
> +    int i = 0;
> +    unsigned int gen_id;
> +
> +retry:
> +    cpu_list_lock();
> +    gen_id = cpu_list_generation_id;
> +    records = vcpu_dirty_stat_alloc(stat);
> +    vcpu_dirty_stat_collect(stat, records, true);
> +
> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
> +    cpu_list_unlock();

Should release the lock before sleep (dirty_stat_wait)?

> +
> +    global_dirty_log_sync(flag, one_shot);
> +
> +    cpu_list_lock();
> +    if (gen_id != cpu_list_generation_id) {
> +        g_free(records);
> +        g_free(stat->rates);
> +        cpu_list_unlock();
> +        goto retry;
> +    }
> +    vcpu_dirty_stat_collect(stat, records, false);
> +    cpu_list_unlock();
> +
> +    for (i = 0; i < stat->nvcpu; i++) {
> +        dirtyrate = do_calculate_dirtyrate(records[i], duration);
> +
> +        stat->rates[i].id = i;
> +        stat->rates[i].dirty_rate = dirtyrate;
> +
> +        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
> +    }
> +
> +    g_free(records);
> +
> +    return duration;
> +}

Thanks,

-- 
Peter Xu


