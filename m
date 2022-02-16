Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84A4B8EC5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:03:23 +0100 (CET)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNi6-0002fp-Nh
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKNO2-0002tc-Bh
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:42:38 -0500
Received: from [2607:f8b0:4864:20::1036] (port=35455
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKNNz-0004Ss-GW
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:42:37 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso7005836pjg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MmKvfP0OaJRPSLHZZoV9CGr34m2AUL4SG/zVu26/9tI=;
 b=MHbHzyMd5UStsNDgY2JZQfFESvWTlYZ5pMyLbQ4PxCp3NM/CvTHzH2pQdWAyAAwWZD
 tRdLq7rioYL8VxsYRrdj7zUZ/wwwYp2DHgAaW9sZZ3/8Jx5/5CXK5jexHRj7EuR6loNX
 eTJfa2WIpIs1Qj2lkfJEjK1u7/REcf5ikeP//qjlFJC5T2C1IQ8pIjGF7K2/3Imr7fHT
 OE9PbafUSdADYLuGW/oQxbnoPtI7NAk4skGpz5La3DBLEiSMxrZgE/w2BfY/tKrZrLkc
 iEauTGqUCX6SJgPiee/fqI74Be2tFQgH2TxLqZzzj22FJLr1cwG+4hUan/VcMzK1n2Ii
 Mr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MmKvfP0OaJRPSLHZZoV9CGr34m2AUL4SG/zVu26/9tI=;
 b=ouYW3gRzAekpDR9jcP5JGeMA8n/14/+xcrJPb+FKSuQwc8ipp8I5BCCz1B99qLp1ga
 t3jySbMCiJ5H99MZA0tIi5tE8J3sxp7HBpC1AW7EhBMYv+Axbp+8fg84h4oalK80sP3B
 FH8ujkqx2Mi3W0oi+GzpWoiVtcKL8vdeaFJJVMiMISZl3akKgkeXz+9Z5quAwBQFXorg
 m7Rpq2wOl8QMk6+6QX3KyQSm7YJC3yeRkFG7CSA6b2j8nPOvlXRPXqXtno38nu15l4Qj
 1wqdl8gVglld7l3cyiJEyWBjjCzBCXi6333FKx9DcTHTb6j5V3YjAuS8A+lFxRz2wu4k
 XFMw==
X-Gm-Message-State: AOAM532M+k4NVrgum+eBXfLOoK0AoARC6wZJZFJmk7kxV2pUzpweyI0d
 SPhOrcSWgr+UXkYmWAl9+YY=
X-Google-Smtp-Source: ABdhPJwG0+89+WJf8NCxJsS88PJT30WrI53pcoo370TNgS8s8FxlUdtMMmfQ2aDTtFzvmWGUNKSDXw==
X-Received: by 2002:a17:902:e2d3:b0:14d:743c:abe2 with SMTP id
 l19-20020a170902e2d300b0014d743cabe2mr3277014plc.103.1645029753587; 
 Wed, 16 Feb 2022 08:42:33 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u16sm5860605pgh.54.2022.02.16.08.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:42:33 -0800 (PST)
Message-ID: <996032dd-4f00-6480-a485-80d49fb70c67@gmail.com>
Date: Thu, 17 Feb 2022 01:42:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
 <1872c662-9363-6d49-d057-9be7ab7c6e0b@linaro.org>
 <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <5356ac8a-cfbf-cfcb-13c5-872ecaf7bed2@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/17 0:08, Philippe Mathieu-Daudé wrote:
> On 16/2/22 11:19, Richard Henderson wrote:
>> On 2/16/22 04:01, Philippe Mathieu-Daudé via wrote:
>>> GCC 10.1 introduced the -moutline-atomics option on Aarch64.
>>> This options is enabled by default, and triggers a link failure:
>>>
>>>    Undefined symbols for architecture arm64:
>>>      "___aarch64_cas1_acq_rel", referenced from:
>>>          _qmp_migrate_recover in migration_migration.c.o
>>>          _cpu_atomic_cmpxchgb_mmu in accel_tcg_cputlb.c.o
>>>          _cpu_atomic_fetch_sminb_mmu in accel_tcg_cputlb.c.o
>>>          _cpu_atomic_fetch_uminb_mmu in accel_tcg_cputlb.c.o
>>>          _cpu_atomic_fetch_smaxb_mmu in accel_tcg_cputlb.c.o
>>>          _cpu_atomic_fetch_umaxb_mmu in accel_tcg_cputlb.c.o
>>>          _cpu_atomic_smin_fetchb_mmu in accel_tcg_cputlb.c.o
>>>          ...
>>>      "___aarch64_ldadd4_acq_rel", referenced from:
>>>          _multifd_recv_new_channel in migration_multifd.c.o
>>>          _monitor_event in monitor_hmp.c.o
>>>          _handle_hmp_command in monitor_hmp.c.o
>>>          _colo_compare_finalize in net_colo-compare.c.o
>>>          _flatview_unref in softmmu_memory.c.o
>>>          _virtio_scsi_hotunplug in hw_scsi_virtio-scsi.c.o
>>>          _tcg_register_thread in tcg_tcg.c.o
>>>          ...
>>>      "___aarch64_swp4_acq", referenced from:
>>>          _qemu_spin_lock in softmmu_cpu-timers.c.o
>>>          _cpu_get_ticks in softmmu_cpu-timers.c.o
>>>          _qemu_spin_lock in softmmu_icount.c.o
>>>          _cpu_exec in accel_tcg_cpu-exec.c.o
>>>          _page_flush_tb_1.isra.0 in accel_tcg_translate-all.c.o
>>>          _page_entry_lock in accel_tcg_translate-all.c.o
>>>          _do_tb_phys_invalidate in accel_tcg_translate-all.c.o
>>>          ...
>>>
>>> QEMU implements its own atomic operations using C11 builtin helpers.
>>> Disable the GCC out-of-line atomic ops.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>> ---
>>> Cc: Stefan Hajnoczi<stefanha@redhat.com>
>>> Cc: Paolo Bonzini<pbonzini@redhat.com>
>>>
>>> Clearly out of my understanding, but at least it links and the qtests
>>> pass.
>>> ---
>>>   configure | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>
>> These should have been supplied by libgcc.a, which we're supposed to 
>> be linking against. Something is wrong with your installation.
> 
> I don't have gobjc/g++ installed, so ./configure defaulted to Clang to
> compile these languages, but compiled C files using GCC. At the end the
> Clang linker is used (the default c++ symlink).
> 
> Could there be a mismatch between Clang (-mno-outline-atomics) and GCC
> (-moutline-atomics)?

I think you have to instruct Clang to use libgcc instead of compiler-rt 
and link the objects with GCC. Here is the documentation of Clang about 
the runtime I could find:
https://clang.llvm.org/docs/Toolchain.html#libgcc-s-gnu

