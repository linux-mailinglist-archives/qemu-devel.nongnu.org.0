Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5204E5A86
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:17:23 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8M6-0004jg-FB
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:17:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8Kg-0003yP-67
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:15:54 -0400
Received: from [2607:f8b0:4864:20::634] (port=43007
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8Ke-00037A-GV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:15:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id p17so2774396plo.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=JvNtrTWPQVfMQlzO5BRx4OuM/FwkGGLAvET7OKGXWAY=;
 b=GLTu43C1mN1sOKveuLnlW0iaTrQ0JoVUD1wjVJvmEWfBuge/oAQETZoBxf2HWsWNuF
 L3Xe4lG7MsXpHq4YmN7s46xy+F/PjLVDUUwk8yhcX8lk8L14hQamEhz77F1SGOFySY5A
 zcgL7rFXht830j5Pg4OC/8vGM+B1vIGe1F6D/KsfUC+ylKuanxWZcPdA4sSHcCwsRCN1
 6bSbyMnI1eZuJRomsVm6dNdkNAtfWxmUpCylCcwumsRQeOoLYLicLqtTiW9TQy3YcoCR
 2KbZosr16RvpO6biJEtRjybsTOPjudwEQ1Xqy3Tpv2JSsA49a8EmTdpt0jm2ty4ZlK42
 WwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JvNtrTWPQVfMQlzO5BRx4OuM/FwkGGLAvET7OKGXWAY=;
 b=w6yRSmUeE1QAxozsi8Cqjh3yLGh6tXF/AKGkltAezwyuukcr9vdNNOgVIO6wrbC+M1
 tG3Y4CVtjpKhiLQNT/a2rgk6xXRC8uf7p19NodG1A24GKL7QsCv+WDsJ9n6HIz7qQ19x
 DK7MgLHbv1vqc+2ruHE108lpbT4BahhXt8RtA2PE9P28zO+6WJ7gdrDlqPrQqupRKvp3
 30NBjBdG3KFTqLu3SrKcur8guvO4SZbvvqpsPg7J7TfFST7ogk+3eUXtm2AtJpIgfUZj
 sAi+pa9fl0/IFAg15LTBK0JvEN3uq/tIdCT63ykfAHyAni63izzJ8S0ZdFlN8VIXbDUw
 Ak3Q==
X-Gm-Message-State: AOAM532IyPwAfXLYgDnjY1v3zmBS6xVFoiIUhSryZQ5P1PWmBkdrm9yD
 PpQxAiDEYHTWbUjWs1WJmlVa0K5G5qIrVA==
X-Google-Smtp-Source: ABdhPJxqXxHmR+Cr8W6plwTU7tuwrDJo76+LoRxl0vi/k9FaGtH1XPgn9IWciu85tD9SKADEwMZDiA==
X-Received: by 2002:a17:90b:3909:b0:1c7:9bc:a735 with SMTP id
 ob9-20020a17090b390900b001c709bca735mr14320821pjb.151.1648070151090; 
 Wed, 23 Mar 2022 14:15:51 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm761239pfu.74.2022.03.23.14.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:15:50 -0700 (PDT)
Message-ID: <c1c51547-2be3-57fa-b34e-0ae02d718bde@linaro.org>
Date: Wed, 23 Mar 2022 14:15:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 02/13] target/i386/kvm: Free xsave_buf when destroying
 vCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-3-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-3-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Fix vCPU hot-unplug related leak reported by Valgrind:
> 
>    ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
>    ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>    ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>    ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>    ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>    ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>    ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>    ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>    ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>    ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>    ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
>    ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
> 
> Reported-by: Mark Kanda<mark.kanda@oracle.com>
> Tested-by: Mark Kanda<mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/kvm/kvm.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

