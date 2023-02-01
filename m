Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F4686814
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:22:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDyq-0005wt-Vz; Wed, 01 Feb 2023 09:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pNDyo-0005wU-Lg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pNDyl-0000YB-KY
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675261249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9i2DdjaJQ/b6TlJ14elnM5Fcf/iqH4d0LWJejo/ABjk=;
 b=RONZ/Vy5dt+Zrs2rIju7+NqsJLDPkvzCInzkRZXq718478e3NGicgLpYlnvkHdXjCDKAGO
 vn78PnlnovrBzxZFax/l6LSkR6aFeCg4orJV7Sq4ugs/bzx90KVdhypNnSO85n7QKn21aP
 hnS0s53JKq55h7oMXd49JFo6PWq8ysE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-dMKGLHxpOduCOjtG4gA85w-1; Wed, 01 Feb 2023 09:20:46 -0500
X-MC-Unique: dMKGLHxpOduCOjtG4gA85w-1
Received: by mail-qv1-f70.google.com with SMTP id
 p15-20020a0cf54f000000b0054fc21ff275so1631616qvm.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9i2DdjaJQ/b6TlJ14elnM5Fcf/iqH4d0LWJejo/ABjk=;
 b=izfh5K7rrLEklRwW2slrku9MsTfSCljEDlFfP92yKMne2PMQFNqwbHOnzaPsIuejmt
 PWyKtpdjbPscFJ0kve54iVWtirm7EeK2+fbXGqoin1ga25//Qnu1Er0ysIMH/s0GhSvR
 wFBnEsnOQvsxVwOyEGpTAJ6mW3pLzKBr07NhSxCma6KUYk3V16bRIAbhWRgA9eVWHxNa
 Z3kbVuS+1DIQ8F+kriaqdLqfo2+fK7/HhF0p4PvuTbw/UNSyDScExH2YA7H8tV1pMClT
 9512u7aqZr13Sl4UNk4CrB40s+bHXQQ1Msm1EnfIeUw8WeSGqEl4ANiT6ZFr/BxdCXr+
 3fng==
X-Gm-Message-State: AO0yUKXPMeDhgH9X7kzq9KFTX9SN++l7woUJWvpCyKtuvvXH+wBiXYfZ
 ZUKqDKYhKv/25Gn5+n6ufoT6G2+ZGRMJ8KlIiKjCbR9/Pu8lZDnE7B8YtsMhcEspSZiWd8K/oRo
 JrHkp+n3EsODN/s0=
X-Received: by 2002:a05:622a:14d4:b0:3b8:340b:1aab with SMTP id
 u20-20020a05622a14d400b003b8340b1aabmr4740583qtx.25.1675261245741; 
 Wed, 01 Feb 2023 06:20:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8OnzwcEuISyagLy5fZwLTtvHIIqwLDYp4TTfv/Msl/TzyQc/aA29L/J976QQkK4gpX/TBFKQ==
X-Received: by 2002:a05:622a:14d4:b0:3b8:340b:1aab with SMTP id
 u20-20020a05622a14d400b003b8340b1aabmr4740551qtx.25.1675261245491; 
 Wed, 01 Feb 2023 06:20:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v3-20020ac87283000000b003b62e9c82ebsm11846825qto.48.2023.02.01.06.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 06:20:44 -0800 (PST)
Message-ID: <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
Date: Wed, 1 Feb 2023 15:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: richard.henderson@linaro.org
Cc: iii@linux.ibm.com, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20221031054105.3552-1-richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
Content-Language: en-US
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20221031054105.3552-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Richard,

Commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization before
registration") seems to cause a regression on one kvm unit test:

FAIL debug-wp-migration (terminated on SIGSEGV)

This can be reproduced with upstream kernel, qemu and kvm unit test.

Seems the change in accel/tcg/translate-all.c is the cause of the SIGSEV
(the removal of the allocation of jc (CPUJumpCache)).

If I restore
    if (unlikely(jc == NULL)) {
        jc = g_new0(CPUJumpCache, 1);
        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
        assert(jc == NULL);
        return;
    }
I don't get the crash anymore.

What I fail to understand is why this code is called with a kvm
accelerated qemu (the test runs by default with kvm).


#0  0x000002aaab41ee94 in tcg_flush_jmp_cache (cpu=cpu@entry=0x2aaac391910)
at ../accel/tcg/translate-all.c:1581
#1  0x000002aaab423458 in tlb_flush_by_mmuidx_async_work
(cpu=0x2aaac391910, data=...)
at ../accel/tcg/cputlb.c:360
#2  0x000002aaaae0b1d0 in process_queued_cpu_work
(cpu=cpu@entry=0x2aaac391910) at ../cpus-common.c:351
<augere> (cpu=cpu@entry=0x2aaac391910)

#0  0x000002aaab423658 in tlb_flush_by_mmuidx (cpu=0x2aaac391910,
idxmap=4095)
at ../accel/tcg/cputlb.c:377
#1  0x000002aaab4236e8 in tlb_flush (cpu=cpu@entry=0x2aaac391910) at
../accel/tcg/cputlb.c:391
#2  0x000002aaab1500f0 in vmsa_ttbr_write
(env=0x2aaac393850, ri=0x2aaac3c90e0, value=2154950976315703518) at
../target/arm/helper.c:3784
#3  0x000002aaab14e5a8 in write_raw_cp_reg
(env=env@entry=0x2aaac393850, ri=ri@entry=0x2aaac3c90e0,
v=v@entry=2154950976315703518)
at ../target/arm/helper.c:96
#4  0x000002aaab153f1c in write_list_to_cpustate
(cpu=cpu@entry=0x2aaac391910)
at ../target/arm/helper.c:191
#5  0x000002aaab20f24c in kvm_arm_reset_vcpu
(cpu=cpu@entry=0x2aaac391910) at ../target/arm/kvm.c:634
#6  0x000002aaab147cbc in arm_cpu_reset (dev=0x2aaac391910) at
../target/arm/cpu.c:522

Thanks

Eric




