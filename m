Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F3391E63
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:50:44 +0200 (CEST)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxg3-0006PI-PN
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxYU-0008Qw-Oh
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:42:54 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxYR-0006DI-U4
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:42:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso807557pjb.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebV2L6YkJ3ftQHodKPGw/tTpwzJUCoKeijb7QGEw1X4=;
 b=bTLepR2J+2jsdeL+PTkBUG1IlYyTe2vySCyq00AAM+7e8n2RsimMevdNGTZVKbbPhi
 tbQNty7wD+dCwx9dWslCrf8rrdeiJG70HQ2PObRXMXDajtfP1YoMaynmiX0WcJjv/uDa
 gtW3OFjjqqke8Lc/lvPTAsvvvOj4EbJNqs+BTKYTnWI4dlN4zziuN+FgfBVyib/VN11G
 Zurz2wJLLfWdbuvTUSLELW9E/H7Sl995sK5zLcBJFzfxfPq2oaDYBxKIMdlBulIZG8jg
 Bj+cRuTXYV7ye5z3LN8JYdoNjZNIUyaRrhEBwwmCnKiCe396ooLVdOt466y7tRaC1qt5
 lnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebV2L6YkJ3ftQHodKPGw/tTpwzJUCoKeijb7QGEw1X4=;
 b=hWApdpChSRCfrgXATH1GNzkAzAyNweIhBZKAJFYqdkJTCt3kfppc1nxiokCq9eH9gC
 48rjx35KTjqRbEsxrNUmMJK1GbAC/4iBOox7k0mUVPQYhhqoZpX8yoNo+l0gpkOyTVbN
 ZsHxYGr4/9KFgi0OooKsAggaNfttpGTu7sKcZ5mWPLKvZylV1k9MkBzGXbaN6W5SemHw
 d/cedc5T2L+gHfLAXR7XwlMWLPdev9WU9ygjK3+c1qkqlvclxuZcQu5RFu7ayZQ5uzE5
 FKilgekaGJ5ldEwStqUcmSaAsuuTx66d0WgVlC+gybaRUw56Qg7h9R5gOTLFOuEYO2Go
 h5eg==
X-Gm-Message-State: AOAM5334//vA5KeRFwzAaklvxE33M/J5ZU646SN9YPBtOyw36XamfsPb
 4GimDM0JMB6zrqQ/W6dwuEMnVw==
X-Google-Smtp-Source: ABdhPJyqR6k9XMHcLjQH73HkPxJ/wnapsrknRJQ+gbuWnvhhA99ChVMwp2/bALYqsKC4Ia4sg4k51Q==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr37600933pjn.66.1622050970143; 
 Wed, 26 May 2021 10:42:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u19sm16245675pfn.158.2021.05.26.10.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:42:49 -0700 (PDT)
Subject: Re: [PATCH v7 00/23] cpu: Introduce SysemuCPUOps structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e0baa8d-b123-5e61-7bb3-c642ab25564a@linaro.org>
Date: Wed, 26 May 2021 10:42:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
>    cpu: Remove duplicated 'sysemu/hw_accel.h' header
>    cpu: Split as cpu-common / cpu-sysemu
>    cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
>    cpu: Introduce cpu_virtio_is_big_endian()
>    cpu: Directly use cpu_write_elf*() fallback handlers in place
>    cpu: Directly use get_paging_enabled() fallback handlers in place
>    cpu: Directly use get_memory_mapping() fallback handlers in place
>    cpu: Assert DeviceClass::vmsd is NULL on user emulation
>    cpu: Rename CPUClass vmsd -> legacy_vmsd
>    cpu: Move AVR target vmsd field from CPUClass to DeviceClass
>    cpu: Introduce SysemuCPUOps structure
>    cpu: Move CPUClass::vmsd to SysemuCPUOps
>    cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
>    cpu: Move CPUClass::get_crash_info to SysemuCPUOps
>    cpu: Move CPUClass::write_elf* to SysemuCPUOps
>    cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
>    cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
>    cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
>    cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps

I've queued all of these to tcg-next, fixing minor patch conflicts on the way. 
  Most of which were the reorg going on in target/ppc/.

>    cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c

I squashed this one back into "Introduce SysemuCPUOps structure", and moved the 
target/*/ includes from cpu.h next to where the structure is declared.


r~

