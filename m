Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61636EBA0D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:47:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqFRH-0001mn-5p; Sat, 22 Apr 2023 11:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqFRE-0001mf-TX
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 11:46:13 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqFRD-0002YC-09
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 11:46:12 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so26291335ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682178369; x=1684770369;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBqBbNpOs8y6mv3uSrKFWmMAk5YVcAXcI7k/IdMHz/c=;
 b=kliBGkqTukrHCODriBDh6oToEDQG1PrZ3XuPZ7OV4MP193wAXLKIjNtnj54oYiMGQc
 vAqUJJrSAMZZTdvO3qkP2Y+Lj/0rZRTiKa8ioXYqnrBmSxhNaNoMyC3E/vK8E12nEN/g
 Pwf+QBZRsD7yJTvKdxHgPNXzyyJWjs2fAMa+tL2xvb1R6qLZHcTRgk8iRHndw3i3bmdk
 0JN20Rritkb3o2aNEcs0mbRs5NSh2PODnbpRDw84PPDEDn+Lu72dTuk1H6aTdng1A+Rj
 KKFkqyHLnEeci1ODIzvXjkTJ0pRX33AzovmJgEkBf9rfHFvtrbnEQQ8/9rEsdzAqlikn
 PvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682178369; x=1684770369;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBqBbNpOs8y6mv3uSrKFWmMAk5YVcAXcI7k/IdMHz/c=;
 b=I4NlUYVMx8z176WOKY5jvDqZF62HRvXdwB8MCJv5MxtNTg7LiBJ8Qf3G+yVa5TsNQJ
 Dl9fP1NpH4JSTbO93KQnPfHfa/JSBK9EADscT8DOsgviuaGlEx2HlxXs2xKIe6UERsg5
 DbnuWRAEmRNucu5u7uAnzFFAjV2zzTNApaKMXUhpvZ0CuM9LCSSzjLc6gNSvthm8lQkl
 1kRMHrzThnRXCw/zqV9L6o7DGJ2bqiwfxt33xddzxAshOQSFFSVezI5NbLgEuNrnjX4U
 UcXdLEujOyrKrQPYW0Zz215xNC1YvVJw6iWM6NfBUbZdXDM0my3Eat152LLyyK0laA0S
 XaoA==
X-Gm-Message-State: AAQBX9cJFgLzfBcIf0xmenlHdsxUn/xOI+5SbgJYgDNKnlN+zIJppVTJ
 TS5RCG+glSjUU4akseOtYfo=
X-Google-Smtp-Source: AKy350ZN3TCE6TN+Lu8a1HC6El3r27Oey2XIUrT8er2mdLZd3YYmqYxVS/4WVoQnbDKqiwh1tJ+2jw==
X-Received: by 2002:a17:903:1107:b0:1a2:70ed:6cd9 with SMTP id
 n7-20020a170903110700b001a270ed6cd9mr9815991plh.22.1682178369143; 
 Sat, 22 Apr 2023 08:46:09 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a170902864b00b0019c2b1c4db1sm4161254plt.239.2023.04.22.08.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 08:46:08 -0700 (PDT)
Message-ID: <fbba1520-2e95-1401-dfc8-ff759900a542@gmail.com>
Date: Sun, 23 Apr 2023 00:46:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 12/13] HACK: use memory region API to inject memory to
 guest
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-13-gurchetansingh@chromium.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230421011223.718-13-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.047, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/04/21 10:12, Gurchetan Singh wrote:
> I just copied the patches that have been floating around that do
> this, but it doesn't seem to robustly work.  This current
> implementation is probably good enough to run vkcube or simple
> apps, but whenever a test starts to aggressively map/unmap memory,
> things do explode on the QEMU side.
> 
> A simple way to reproduce is run:
> 
> ./deqp-vk --deqp-case=deqp-vk --deqp-case=dEQP-VK.memory.mapping.suballocation.*
> 
> You should get stack traces that sometimes look like this:
> 
> 0  __pthread_kill_implementation (no_tid=0, signo=6, threadid=140737316304448) at ./nptl/pthread_kill.c:44
> 1  __pthread_kill_internal (signo=6, threadid=140737316304448) at ./nptl/pthread_kill.c:78
> 2  __GI___pthread_kill (threadid=140737316304448, signo=signo@entry=6) at ./nptl/pthread_kill.c:89
> 3  0x00007ffff7042476 in __GI_raise (sig=sig@entry=6) at ../sysdeps/posix/raise.c:26
> 4  0x00007ffff70287f3 in __GI_abort () at ./stdlib/abort.c:79
> 5  0x00007ffff70896f6 in __libc_message (action=action@entry=do_abort, fmt=fmt@entry=0x7ffff71dbb8c "%s\n") at ../sysdeps/posix/libc_fatal.c:155
> 6  0x00007ffff70a0d7c in malloc_printerr (str=str@entry=0x7ffff71de7b0 "double free or corruption (out)") at ./malloc/malloc.c:5664
> 7  0x00007ffff70a2ef0 in _int_free (av=0x7ffff7219c80 <main_arena>, p=0x555557793e00, have_lock=<optimized out>) at ./malloc/malloc.c:4588
> 8  0x00007ffff70a54d3 in __GI___libc_free (mem=<optimized out>) at ./malloc/malloc.c:3391
> 9  0x0000555555d65e7e in phys_section_destroy (mr=0x555557793e10) at ../softmmu/physmem.c:1003
> 10 0x0000555555d65ed0 in phys_sections_free (map=0x555556d4b410) at ../softmmu/physmem.c:1011
> 11 0x0000555555d69578 in address_space_dispatch_free (d=0x555556d4b400) at ../softmmu/physmem.c:2430
> 12 0x0000555555d58412 in flatview_destroy (view=0x5555572bb090) at ../softmmu/memory.c:292
> 13 0x000055555600fd23 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:284
> 14 0x00005555560026d4 in qemu_thread_start (args=0x5555569cafa0) at ../util/qemu-thread-posix.c:541
> 15 0x00007ffff7094b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
> 16 0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> or this:
> 
> 0x0000555555e1dc80 in object_unref (objptr=0x6d656d3c6b6e696c) at ../qom/object.c:1198
> 1198        g_assert(obj->ref > 0);
> (gdb) bt
> 0  0x0000555555e1dc80 in object_unref (objptr=0x6d656d3c6b6e696c) at ../qom/object.c:1198
> 1  0x0000555555d5cca5 in memory_region_unref (mr=0x5555572b9e20) at ../softmmu/memory.c:1799
> 2  0x0000555555d65e47 in phys_section_destroy (mr=0x5555572b9e20) at ../softmmu/physmem.c:998
> 3  0x0000555555d65ec7 in phys_sections_free (map=0x5555588365c0) at ../softmmu/physmem.c:1011
> 4  0x0000555555d6956f in address_space_dispatch_free (d=0x5555588365b0) at ../softmmu/physmem.c:2430
> 5  0x0000555555d58409 in flatview_destroy (view=0x555558836570) at ../softmmu/memory.c:292
> 6  0x000055555600fd1a in call_rcu_thread (opaque=0x0) at ../util/rcu.c:284
> 7  0x00005555560026cb in qemu_thread_start (args=0x5555569cafa0) at ../util/qemu-thread-posix.c:541
> 8  0x00007ffff7094b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
> 9  0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> The reason seems to be memory regions are handled on a different
> thread than the virtio-gpu thread, and that inevitably leads to
> raciness.  The memory region docs[a] generally seems to dissuade this:
> 
> "In order to do this, as a general rule do not create or destroy
>   memory regions dynamically during a device’s lifetime, and only
>   call object_unparent() in the memory region owner’s instance_finalize
>   callback. The dynamically allocated data structure that contains
>   the memory region then should obviously be freed in the
>   instance_finalize callback as well."
> 
> Though instance_finalize is called before device destruction, so
> storing the memory until then is unlikely to be an option.  The
> tests do pass when virtio-gpu doesn't free the memory, but
> progressively the guest becomes slower and then OOMs.
> 
> Though the api does make an exception:
> 
> "There is an exception to the above rule: it is okay to call
> object_unparent at any time for an alias or a container region. It is
> therefore also okay to create or destroy alias and container regions
> dynamically during a device’s lifetime."
> 
> I believe we are trying to create a container subregion, but that's
> still failing?  Are we doing it right?  Any memory region experts
> here can help out?  The other revelant patch in this series
> is "virtio-gpu: hostmem".

Perhaps dma_memory_map() is what you want?

> 
> [a] https://qemu.readthedocs.io/en/latest/devel/memory.html
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>   hw/display/virtio-gpu-rutabaga.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
> index 5fd1154198..196267aac2 100644
> --- a/hw/display/virtio-gpu-rutabaga.c
> +++ b/hw/display/virtio-gpu-rutabaga.c
> @@ -159,6 +159,12 @@ static int32_t rutabaga_handle_unmap(VirtIOGPU *g,
>       GET_VIRTIO_GPU_GL(g);
>       GET_RUTABAGA(virtio_gpu);
>   
> +    memory_region_transaction_begin();
> +    memory_region_set_enabled(&res->region, false);
> +    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
> +    object_unparent(OBJECT(&res->region));
> +    memory_region_transaction_commit();
> +
>       res->mapped = NULL;
>       return rutabaga_resource_unmap(rutabaga, res->resource_id);
>   }
> @@ -671,6 +677,14 @@ rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
>       result = rutabaga_resource_map(rutabaga, mblob.resource_id, &mapping);
>       CHECK_RESULT(result, cmd);
>   
> +    memory_region_transaction_begin();
> +    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL,
> +                                      mapping.size, (void *)mapping.ptr);
> +    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset,
> +                                &res->region);
> +    memory_region_set_enabled(&res->region, true);
> +    memory_region_transaction_commit();
> +
>       memset(&resp, 0, sizeof(resp));
>       resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
>       result = rutabaga_resource_map_info(rutabaga, mblob.resource_id,

