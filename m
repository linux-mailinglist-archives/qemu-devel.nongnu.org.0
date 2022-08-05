Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2558A9F2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:08:39 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvC1-0005Qe-SO
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv56-00086r-9K
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oJv4y-0006Yf-QJ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659697275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwlXKfpdguMsC0MpGj+4CZRSBG4d63eVF4aKVN+9kt0=;
 b=P0+6cjZ1AaCTfUu4JXj+63p+hnJ+LP4c3MGAkrWbO0A56Ju5T1q4IK6Oo2BhAgdU1PplkU
 oNuLFRaQMQQPapf1YLZT6b++pgoxJlqXqduhg56HXY1VlN4tG/0LOEEdEDk7JSHyq/o48N
 P+1b6x/FHjCHejgEFs53otMOi8MU4lA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-mEzoWoEgPf2znBDd_NNIEg-1; Fri, 05 Aug 2022 07:01:14 -0400
X-MC-Unique: mEzoWoEgPf2znBDd_NNIEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso1413999edd.2
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PwlXKfpdguMsC0MpGj+4CZRSBG4d63eVF4aKVN+9kt0=;
 b=UVGymqBevNzbtx7F3FnG3LZD0KhJmnS0rMYt0f4CZeqIn0PLLEkrdmzva6e8SwgfCM
 Tw/6E02nyKB2zKsKdITwbjmThcKL4OVCUEmPRi1/XqxG7EEtWy9TU4AbZoTwg1kgU8nC
 oh4IBwi3kNcwlGpNYCq52OQmWiUFLZ5JVwNvPwjEroNpj2V+pCB8LpBzWTZE2+XgRgYH
 BqB52OlAomGx+35PPApDm6r/IHMmdU209U2w9Jo+XuuUxNhvnQWoT1h5cMZ0tzZe+4RE
 328P3Rij0o+hGt8s1hHyhlhPhzqcOWIMGNZZEjm93DsJihE8VFDuDbQeoKAgDYHfoS1V
 9hYw==
X-Gm-Message-State: ACgBeo1dBnuUMLi4S0t3WAaFboD4MuZCdA5ErmwHcIrAi6Aj7gV5Ibvc
 HmRkJ5KSpC/n71wtDSBq5s6qeA9P6c70I5CH3xHUQjbKfFwPckivffZL9f1APNWp+YWKuPRLDJI
 bv4UPPxbsRmE1dOs=
X-Received: by 2002:a05:6402:2079:b0:43d:a218:9b8a with SMTP id
 bd25-20020a056402207900b0043da2189b8amr5997391edb.357.1659697273265; 
 Fri, 05 Aug 2022 04:01:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+EbbiCltJd/G8d8C9Ev86B9XXlkwolA1csALbgKuEdIZUzz4p0hQsmludutBolPAUCmDX/w==
X-Received: by 2002:a05:6402:2079:b0:43d:a218:9b8a with SMTP id
 bd25-20020a056402207900b0043da2189b8amr5997270edb.357.1659697271578; 
 Fri, 05 Aug 2022 04:01:11 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a056402128b00b0043bd2a79311sm1909705edv.37.2022.08.05.04.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 04:01:09 -0700 (PDT)
Message-ID: <450f1c5b-1730-5e5c-b9bc-7cd5e744c250@redhat.com>
Date: Fri, 5 Aug 2022 13:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RFC 7/7] vl: Allow ThreadContext objects to be created
 before the sandbox option
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220721120732.118133-1-david@redhat.com>
 <20220721120732.118133-8-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220721120732.118133-8-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/22 14:07, David Hildenbrand wrote:
> Currently, there is no way to configure a CPU affinity inside QEMU when
> the sandbox option disables it for QEMU as a whole, for example, via:
>     -sandbox enable=on,resourcecontrol=deny
> 
> While ThreadContext objects can be created on the QEMU commandline and
> the CPU affinity can be configured externally via the thread-id, this is
> insufficient if a ThreadContext with a certain CPU affinity is already
> required during QEMU startup, before we can intercept QEMU and
> configure the CPU affinity.
> 
> Blocking sched_setaffinity() was introduced in 24f8cdc57224 ("seccomp:
> add resourcecontrol argument to command line"), "to avoid any bigger of the
> process". However, we only care about once QEMU is running, not when
> the instance starting QEMU explicitly requests a certain CPU affinity
> on the QEMU comandline.
> 
> Right now, for NUMA-aware preallocation of memory backends used for initial
> machine RAM, one has to:
> 
> 1) Start QEMU with the memory-backend with "prealloc=off"
> 2) Pause QEMU before it starts the guest (-S)
> 3) Create ThreadContext, configure the CPU affinity using the thread-id
> 4) Configure the ThreadContext as "prealloc-context" of the memory
>    backend
> 5) Trigger preallocation by setting "prealloc=on"
> 
> To simplify this handling especially for initial machine RAM,
> allow creation of ThreadContext objects before parsing sandbox options,
> such that the CPU affinity requested on the QEMU commandline alongside the
> sandbox option can be set. As ThreadContext objects essentially only create
> a persistant context thread and set the CPU affinity, this is easily
> possible.
> 
> With this change, we can create a ThreadContext with a CPU affinity on
> the QEMU commandline and use it for preallocation of memory backends
> glued to the machine (simplified example):
> 
> qemu-system-x86_64 -m 1G \
>  -object thread-context,id=tc1,cpu-affinity=3-4 \
>  -object memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1 \
>  -machine memory-backend=pc.ram \
>  -S -monitor stdio -sandbox enable=on,resourcecontrol=deny
> 
> And while we can query the current CPU affinity:
>   (qemu) qom-get tc1 cpu-affinity
>   [
>       3,
>       4
>   ]
> 
> We can no longer change it from QEMU directly:
>   (qemu) qom-set tc1 cpu-affinity 1-2
>   Error: Setting CPU affinity failed: Operation not permitted
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  softmmu/vl.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aabd82e09a..252732cf5d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1761,6 +1761,27 @@ static void object_option_parse(const char *optarg)
>      visit_free(v);
>  }
>  
> +/*
> + * Very early object creation, before the sandbox options have been activated.
> + */
> +static bool object_create_pre_sandbox(const char *type)
> +{
> +    /*
> +     * Objects should in general not get initialized "too early" without
> +     * a reason. If you add one, state the reason in a comment!
> +     */
> +
> +    /*
> +     * Reason: -sandbox on,resourcecontrol=deny disallows setting CPU
> +     * affinity of threads.
> +     */
> +    if (g_str_equal(type, "thread-context")) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  /*
>   * Initial object creation happens before all other
>   * QEMU data types are created. The majority of objects
> @@ -1775,6 +1796,11 @@ static bool object_create_early(const char *type)
>       * add one, state the reason in a comment!
>       */
>  
> +    /* Reason: already created. */
> +    if (object_create_pre_sandbox(type)) {
> +        return false;
> +    }
> +
>      /* Reason: property "chardev" */
>      if (g_str_equal(type, "rng-egd") ||
>          g_str_equal(type, "qtest")) {
> @@ -1895,7 +1921,7 @@ static void qemu_create_early_backends(void)
>   */
>  static bool object_create_late(const char *type)
>  {
> -    return !object_create_early(type);
> +    return !object_create_early(type) && !object_create_pre_sandbox(type);
>  }
>  
>  static void qemu_create_late_backends(void)
> @@ -2365,6 +2391,8 @@ static int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
>  
>  static void qemu_process_early_options(void)
>  {
> +    object_option_foreach_add(object_create_pre_sandbox);
> +
>  #ifdef CONFIG_SECCOMP
>      QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
>      if (olist) {

Cool, this is processed before -sandbox, so threads can have their
affinity. However, it's also processed before -name debug-threads=on
which means that even though we try to set a thread name in 3/7, it's
effectively a dead code because name_threads from
util/qemu-thread-posix.c is still false. Could we shift things a bit?
E.g. like this:

static void qemu_process_early_options(void)
{
    qemu_opts_foreach(qemu_find_opts("name"),
                      parse_name, NULL, &error_fatal);

    object_option_foreach_add(object_create_pre_sandbox);
..


Michal


