Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C966258AE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRbE-0008U1-Sw; Fri, 11 Nov 2022 05:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRbD-0008RU-98
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRbB-0007uM-QY
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668163763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kPuicOxxmAhYzy/gpJ36mHVtfyGmFmZsq+weM3ZKFw=;
 b=BOu2efkamU+Wuyn6e2vARekAECjLleRzu0i26ZgykFYHytxMq0m2JIxbfPp9YJAdo49U2A
 jTTytZ8hp4XbAiQ+kDT7+bx3tmaAC4i+jQTZZdHmdb8gTfkKfSu1oxPlOtEQMqITrAW8QM
 jXJ1HagkrX0pdhmWovxy5FoOP/szzpU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-5o6t6e-ZP_mLjThKtebBng-1; Fri, 11 Nov 2022 05:49:21 -0500
X-MC-Unique: 5o6t6e-ZP_mLjThKtebBng-1
Received: by mail-wr1-f69.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so905334wrg.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5kPuicOxxmAhYzy/gpJ36mHVtfyGmFmZsq+weM3ZKFw=;
 b=gDJ4/EYbOoUqXuYPlx2+2ZlUEbBy0ZRwOqvp9luVG9VOeTZ20G0oU8gTd5AT2s15VX
 7vjSIP3WQQCVbIO7ErvZwsFmXgU8kQrqastCC1MJj9VukYtR+Bqhq4N8dlhNbx1FP8M8
 5wmXip8V3UPlCH/doI6Zupxad62DgI+6OS+vfuKrXLEBN+SBtLg9Cu3SJybIx9pAfQDy
 B9XqVhNkKzpuhJpubRCXo5x3Z+qAtRK3aduq5VOlGcRrn3cmX7nzlH9JkeRi1UCC83qk
 5mINUSf2prDZnNiTAgutC0wyxcBTjNcmxkd72Y0otrTqlxNQLvLOR1s/5Wc8bx4hvBIt
 CVmw==
X-Gm-Message-State: ANoB5pnXVoGw5pOzeXJi4TvaCpDqbK8tVsMXdi/3eaanWLJdrgNxQ+iA
 /TGbx41cdE9b0hunEzQlF98/bhoTj36SECZyLMcWuqLTG79XdS4YN2LXpBP7veicFtG6juPhA+G
 +hldH0t2u7gtKP2w=
X-Received: by 2002:a5d:54cd:0:b0:236:6442:2f86 with SMTP id
 x13-20020a5d54cd000000b0023664422f86mr880414wrv.588.1668163760381; 
 Fri, 11 Nov 2022 02:49:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ja7CP2CzMwNfKVy9fBrnecx2Hq/ZkHE96zYgGmdZp0hUk9rFkGv98Zh6MDvd5f7g03H56kg==
X-Received: by 2002:a5d:54cd:0:b0:236:6442:2f86 with SMTP id
 x13-20020a5d54cd000000b0023664422f86mr880408wrv.588.1668163760135; 
 Fri, 11 Nov 2022 02:49:20 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 l22-20020a05600c16d600b003cf4eac8e80sm2883353wmn.23.2022.11.11.02.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:49:19 -0800 (PST)
Message-ID: <f4db2187-af9e-d417-2639-6641e3c6725a@redhat.com>
Date: Fri, 11 Nov 2022 11:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/3] KVM: keep track of running ioctls
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>
References: <20221110164807.1306076-1-eesposit@redhat.com>
 <20221110164807.1306076-3-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221110164807.1306076-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/22 17:48, Emanuele Giuseppe Esposito wrote:
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index f9fdd46b9d..8d6a4b1b65 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -237,6 +237,7 @@ static void cpu_common_initfn(Object *obj)
>       cpu->nr_threads = 1;
>   
>       qemu_mutex_init(&cpu->work_mutex);
> +    qemu_lockcnt_init(&cpu->in_ioctl_lock);
>       QSIMPLEQ_INIT(&cpu->work_list);
>       QTAILQ_INIT(&cpu->breakpoints);
>       QTAILQ_INIT(&cpu->watchpoints);
> @@ -248,6 +249,7 @@ static void cpu_common_finalize(Object *obj)
>   {
>       CPUState *cpu = CPU(obj);
>   
> +    qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>       qemu_mutex_destroy(&cpu->work_mutex);
>   }
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index f9b58773f7..15053663bc 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -397,6 +397,9 @@ struct CPUState {
>       uint32_t kvm_fetch_index;
>       uint64_t dirty_pages;
>   
> +    /* Use by accel-block: CPU is executing an ioctl() */
> +    QemuLockCnt in_ioctl_lock;
> +
>       /* Used for events with 'vcpu' and *without* the 'disabled' properties */
>       DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
>       DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);

These go in patch 1.

Paolo


