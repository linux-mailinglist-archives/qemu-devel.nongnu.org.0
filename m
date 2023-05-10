Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF46FD884
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:48:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweYZ-00022C-BY; Wed, 10 May 2023 03:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweYX-00021m-Hk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:48:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweYV-0000gH-TG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:48:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so11578975e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704890; x=1686296890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ia32KWfM1ABSRX3Nk/Go2BSRz0lLAdpq6oz3v28yi5I=;
 b=zEmbIRWjYOqy4lgZRY8lNhOeIIrqb0TB4HC3PrU8aGDel9Sn9VzIxk+5hPIqOXuc2y
 sARfWTS7FRs17W3igSwHrRNTVipzCkEC3AUasd2XfabpuEkd+o+ye0Rjkq/yKadJ4ABU
 fLy3scyG0S3r/lwhdjUJhREDygHb7yoC1NO6TSiudb05o5SHnZl8GwGorHaSgcKYNllX
 jb/7PIlsD1v76kdCLqEUqmo5wUAZCF5BR3gtP3T/IQej0opC3dydINQfXsKrejvaELHI
 W0DemHm/1yCivYeNvh5BrNNZvbATRgyvbOLP+el8wEoLSyN8xPNiAQjCsvHvqBRXEDLz
 C4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704890; x=1686296890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ia32KWfM1ABSRX3Nk/Go2BSRz0lLAdpq6oz3v28yi5I=;
 b=lI5hKpxpfJfjBHUgNt442MR/z2fNYaoDDCJJMQJFcJramEjSC7fIoyPvUfaq3YWjuq
 NGCZbwmD4UxrfR+YfTEag5mznKF7VQekf8MH+vfTLXQcS9m6aXShZP/AEK5ZWFQGWFMz
 L/cNghU8LLvAlBrSlE3T/3quFFsUBR/sRkqLFfIvm6v8vcXv0RbOecc5yq7AtV0Bne8O
 EKV7r4lsBLoUNeoUhyHRA4EqNKoaS6UQRIgOJDxJqhYCzOc9bND8BBxA+d4bu8+WzJT5
 XRamFhV+g5/2oAza/XSDG4ud/ro16C77whOq742taT3ksb0e/71ma7USM0oTqU7EQ4f9
 1b4Q==
X-Gm-Message-State: AC+VfDx/znlOIxinaZPzZuaX3LB0Le8KCem/p7nv42SU1WYc26/x8Kql
 JVQrXSmwSvBz6ubhppffPUyRJQ==
X-Google-Smtp-Source: ACHHUZ71WWrBi/TgXNHKW4/8+P2Hc4QLPO7paEwmyvf+33CLOWFdSPDNzjvFGnahnZC1aG3SpiA/KA==
X-Received: by 2002:a1c:f418:0:b0:3f1:6f52:74d with SMTP id
 z24-20020a1cf418000000b003f16f52074dmr10905238wma.39.1683704890322; 
 Wed, 10 May 2023 00:48:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003f17a00c214sm21647284wmf.16.2023.05.10.00.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:48:09 -0700 (PDT)
Message-ID: <b97a3c1c-1713-27ad-beb0-18273de5075f@linaro.org>
Date: Wed, 10 May 2023 09:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v3 08/10] tcg: remove the final vestiges of dstate
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
 <20230505155336.137393-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230505155336.137393-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 17:53, Alex Bennée wrote:
> Now we no longer have dynamic state affecting things we can remove the
> additional fields in cpu.h and simplify the TB hash calculation.
> 
> For the benchmark:
> 
>      hyperfine -w 2 -m 20 \
>        "./arm-softmmu/qemu-system-arm -cpu cortex-a15 \
>          -machine type=virt,highmem=off \
>          -display none -m 2048 \
>          -serial mon:stdio \
>          -netdev user,id=unet,hostfwd=tcp::2222-:22 \
>          -device virtio-net-pci,netdev=unet \
>          -device virtio-scsi-pci \
>          -blockdev driver=raw,node-name=hd,discard=unmap,file.driver=host_device,file.filename=/dev/zen-disk/debian-bullseye-armhf \
>          -device scsi-hd,drive=hd -smp 4 \
>          -kernel /home/alex/lsrc/linux.git/builds/arm/arch/arm/boot/zImage \
>          -append 'console=ttyAMA0 root=/dev/sda2 systemd.unit=benchmark.service' \
>          -snapshot"
> 
> It has a marginal effect on runtime, before:
> 
>    Time (mean ± σ):     26.279 s ±  2.438 s    [User: 41.113 s, System: 1.843 s]
>    Range (min … max):   24.420 s … 32.565 s    20 runs
> 
> after:
> 
>    Time (mean ± σ):     24.440 s ±  2.885 s    [User: 34.474 s, System: 2.028 s]
>    Range (min … max):   21.663 s … 29.937 s    20 runs
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1358
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230503091756.1453057-9-alex.bennee@linaro.org>
> ---
>   accel/tcg/tb-hash.h       | 6 +++---
>   include/exec/exec-all.h   | 3 ---
>   include/hw/core/cpu.h     | 5 -----
>   accel/tcg/cpu-exec.c      | 7 +------
>   accel/tcg/tb-maint.c      | 5 ++---
>   accel/tcg/translate-all.c | 6 ------
>   6 files changed, 6 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


