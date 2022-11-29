Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4063CB29
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 23:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09JS-000134-PZ; Tue, 29 Nov 2022 17:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09JN-00012V-Nu
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09JL-0008Go-Sy
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669761762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRMS2Fq+dvU/dUMUo8PW6THb6eYwZVaIizKVPF8ynq8=;
 b=II8425cebLJiKeXTeZLQ0aGl8tPmj8WIbc5mRNxni2hXvFfr897msO8CvVn/9hHyvg0y6x
 4ohbpeqgcHFABstNy1FmDLJULmLbVz0Gy75mC4ZTuZA+4GBhz6bXGZd23I9Ddr7X4gNvrG
 JUXy6REjtIqSfzZjwrc77Tuiv7k2u44=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-wQerUeX6ND6mI92m5GqB3g-1; Tue, 29 Nov 2022 17:42:40 -0500
X-MC-Unique: wQerUeX6ND6mI92m5GqB3g-1
Received: by mail-qk1-f199.google.com with SMTP id
 i21-20020a05620a405500b006fb25ba3e00so32241333qko.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 14:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRMS2Fq+dvU/dUMUo8PW6THb6eYwZVaIizKVPF8ynq8=;
 b=0j5gpC62+iXGCrtCWHQlQPrNMlmxrBgR68++f7oAZSEsG52r6iu1pX6ia2izYqvySz
 1LoEm5tveno5fuEfa1bVMZp4svz4onNOW16G7X254vVvZC1ZKrDzYKy7jQoh8rrYUqgN
 EnSn9dYZSsqt4SSv/qRH8/CZ+yYFvv0YTZKViCEayCTgoNRDkz9NwuixR8GSJRFc186q
 lQ5rQoZIUMR8C1HYcL3iRw8smOnTU4jncu5klN08/fDGeN7hyxEoBHKfZLyWvoYl4Woo
 zal+T67I2h66GL3YBWndaFNL268q4cGXpeGOKeUKGLSpdl/sMl5BaU5sRRy+Y5kgsefn
 NELA==
X-Gm-Message-State: ANoB5pl1b1e4BpFGJjJqttQJqC9KQ7UmU89Du9zbDUEWjhQkXsVXVVkw
 2d6HD82fJsXQwVfA/+MeXClrU57RsB/4o9kC/idcfRp5idgoCbLgwaNTcBzgzFF0bne0CK4wzJf
 JuVkbhvEKimbg8cI=
X-Received: by 2002:a05:620a:2621:b0:6fb:a4a4:8a17 with SMTP id
 z33-20020a05620a262100b006fba4a48a17mr39127246qko.500.1669761760039; 
 Tue, 29 Nov 2022 14:42:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Tz2C8zRfVhVN9nBU6Tel1TaqnuP9POWi+SeGkdRiUFltGA3H5olvsr6UwEgyhjaXPJVMRUQ==
X-Received: by 2002:a05:620a:2621:b0:6fb:a4a4:8a17 with SMTP id
 z33-20020a05620a262100b006fba4a48a17mr39127231qko.500.1669761759760; 
 Tue, 29 Nov 2022 14:42:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bm1-20020a05620a198100b006fa2b1c3c1esm3601046qkb.58.2022.11.29.14.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 14:42:39 -0800 (PST)
Date: Tue, 29 Nov 2022 17:42:38 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 03/11] kvm-all: Do not allow reap vcpu dirty ring
 buffer if not ready
Message-ID: <Y4aK3phFjJ1l9wnv@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cef36a9ceae0a67d746cfb459939d5886ab07bd9.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cef36a9ceae0a67d746cfb459939d5886ab07bd9.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, Yong,

On Mon, Nov 21, 2022 at 11:26:35AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> When tested large vcpu size vm with dirtylimit feature, Qemu crashed
> due to the assertion in kvm_dirty_ring_reap_one, which assert that
> vcpu's kvm_dirty_gfns has been allocated and not NULL.
> 
> Because dirty ring reaper thread races with Qemu main thread, reaper
> may reap vcpu's dirty ring buffer when main thread doesn't complete
> vcpu instantiation. So add the waiting logic in reaper thread and
> start to reap until vcpu instantiation is completed.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  accel/kvm/kvm-all.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f99b0be..9457715 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1401,6 +1401,35 @@ out:
>      kvm_slots_unlock();
>  }
>  
> +/*
> + * test if dirty ring has been initialized by checking if vcpu
> + * has been initialized and gfns was allocated correspondlingly.
> + * return true if dirty ring has been initialized, false otherwise.
> + */
> +static bool kvm_vcpu_dirty_ring_initialized(void)
> +{
> +    CPUState *cpu;
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int ncpus = ms->smp.cpus;
> +
> +    /*
> +     * assume vcpu has not been initilaized if generation
> +     * id less than number of vcpu
> +     */
> +    if (ncpus > cpu_list_generation_id_get()) {
> +        return false;
> +    }
> +
> +    CPU_FOREACH(cpu) {
> +        if (!cpu->kvm_dirty_gfns) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +
>  static void *kvm_dirty_ring_reaper_thread(void *data)
>  {
>      KVMState *s = data;
> @@ -1410,6 +1439,13 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>  
>      trace_kvm_dirty_ring_reaper("init");
>  
> +retry:
> +    /* don't allow reaping dirty ring if ring buffer hasn't been mapped */
> +    if (!kvm_vcpu_dirty_ring_initialized()) {
> +        sleep(1);

The sleep here is probably not necessary.  Could you instead have a look at
the other much simpler patch?  Here:

https://lore.kernel.org/qemu-devel/20220927154653.77296-1-peterx@redhat.com/

> +        goto retry;
> +    }
> +
>      while (true) {
>          r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
>          trace_kvm_dirty_ring_reaper("wait");
> -- 
> 1.8.3.1
> 
> 

-- 
Peter Xu


