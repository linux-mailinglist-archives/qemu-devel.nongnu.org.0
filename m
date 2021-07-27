Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381273D7587
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:04:52 +0200 (CEST)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MlP-0001uY-AQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MjZ-0008HR-Rq
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8MjU-0008CI-IM
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1z4fEUjg8PSvt9ARm3ozC8RithZJZLoLgHXdgz3aWE=;
 b=HH+GIwl2GdPb3tpBZWgvmax3QRxDsXhdzx3UTmuHYhCeVKeXp/+2La7umV6rOGvhe0xnbu
 7Y62qRa5+aIm75bq1nk3u9ImCGWK1+hhBkwlCWYcBInLyoDo+7PHaRcVDQW2hyIy52v1JG
 NjAZ8TJ71gTOdIhU0hkrfp6wRjc17qs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-iSDHknAYNEyBeNt93Midlg-1; Tue, 27 Jul 2021 09:02:48 -0400
X-MC-Unique: iSDHknAYNEyBeNt93Midlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so1334976wmj.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=A1z4fEUjg8PSvt9ARm3ozC8RithZJZLoLgHXdgz3aWE=;
 b=uI7ZiQHjl1FkXxaZrCeJ0pZXcGoiHf8GVjP/JH7Bkkn44M+965udWvUJVFOkxuu4pj
 N6bw8r27PbTPGJEU80CKO7Zbc0KzNK90Bnj/K627eAbdkLRvfbpHyjuzNMlNmsDxptHX
 SEEVSxnzOj/2p7qsUeQdXxCigmc0rY1rCFw/wCVCRp+zQJu71hKCc5RoO7YLDfSIvnjJ
 n3ibqRIN8woeTOdfKrYM8FwBTfs4UMY/A+UREX+eKav4dy0RErCQBFMTqyPKSLuBbmOT
 1jlGgoenJHj/5gBgKQszXi+nQYoSIvno/YSI9M8GwUsIlBTo1Q6tefGJ8HFjt8dKeQBd
 zc1A==
X-Gm-Message-State: AOAM530nAKiKTLCgRvyHBEDxVR7mSVR4Dr9WfT5/kdJnZV9xBXp/rZlC
 IOGBGnCszhce/L4YhwJlush1D56kWi6mPynUeSrYxIbinzrh0/9n8YXWC8lZk/Jd9ClyoGJSdlu
 OxmWxzPsA0Nf/owI=
X-Received: by 2002:a05:600c:304a:: with SMTP id
 n10mr862504wmh.79.1627390966942; 
 Tue, 27 Jul 2021 06:02:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYd/RDTkl04Jy6BRpuDN+Xp9OeDji2ClfsDc2XuUutjYlH+6b4r3YMz9AQUQZr5IU8Xf5JlA==
X-Received: by 2002:a05:600c:304a:: with SMTP id
 n10mr862482wmh.79.1627390966778; 
 Tue, 27 Jul 2021 06:02:46 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 q17sm3269694wrv.47.2021.07.27.06.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:02:46 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] cpus: Export queue work related fields to cpu.h
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e7ad5f92-c445-72dd-ca2e-5250a3559669@redhat.com>
Date: Tue, 27 Jul 2021 15:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> This patch has no functional change, but prepares for moving the function
> do_run_on_cpu() into softmmu/cpus.c.  It does:
> 
>    1. Move qemu_work_item into hw/core/cpu.h.
>    2. Export queue_work_on_cpu()/qemu_work_cond.
> 
> All of them will be used by softmmu/cpus.c later.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   cpus-common.c         | 11 ++---------
>   include/hw/core/cpu.h | 10 +++++++++-
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e58d..d814b2439a 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -27,7 +27,7 @@
>   static QemuMutex qemu_cpu_list_lock;
>   static QemuCond exclusive_cond;
>   static QemuCond exclusive_resume;
> -static QemuCond qemu_work_cond;
> +QemuCond qemu_work_cond;
>   
>   /* >= 1 if a thread is inside start_exclusive/end_exclusive.  Written
>    * under qemu_cpu_list_lock, read with atomic operations.
> @@ -114,14 +114,7 @@ CPUState *qemu_get_cpu(int index)
>   /* current CPU in the current thread. It is only valid inside cpu_exec() */
>   __thread CPUState *current_cpu;
>   
> -struct qemu_work_item {
> -    QSIMPLEQ_ENTRY(qemu_work_item) node;
> -    run_on_cpu_func func;
> -    run_on_cpu_data data;
> -    bool free, exclusive, done;
> -};
> -
> -static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
> +void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
>   {
>       qemu_mutex_lock(&cpu->work_mutex);
>       QSIMPLEQ_INSERT_TAIL(&cpu->work_list, wi, node);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index bc864564ce..f62ae88524 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -243,7 +243,15 @@ typedef union {
>   
>   typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
>   
> -struct qemu_work_item;
> +struct qemu_work_item {
> +    QSIMPLEQ_ENTRY(qemu_work_item) node;
> +    run_on_cpu_func func;
> +    run_on_cpu_data data;
> +    bool free, exclusive, done;
> +};
> +
> +void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi);
> +extern QemuCond qemu_work_cond;
>   
>   #define CPU_UNSET_NUMA_NODE_ID -1
>   #define CPU_TRACE_DSTATE_MAX_EVENTS 32
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


