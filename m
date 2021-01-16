Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3882F8E46
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 18:26:03 +0100 (CET)
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0pKs-0000Em-GV
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 12:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pJc-0008FI-HT
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:24:44 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0pJa-0006R8-T6
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 12:24:44 -0500
Received: by mail-pf1-x434.google.com with SMTP id t29so2435319pfg.11
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 09:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7BJ4b+ZCK1KcbRqrUfzTg1s3YjZAZz2SSgqLMUOfm3k=;
 b=RR3d9FdFYr7MNC8Et7z2o1FbgvfHaHzkiNGUVKPSYVuAOqifNir+b0KAPicO6KYnHD
 0R7Qy7KrgRwvo3KI5lcXZDR/KUMfuiutw+bfbLfm8UCKYgq3E1N8zywjg+bO7tUBz8Qa
 nk1wG1jHUUly9ddLDpYbokbN2GN6u0cU124dkwr81/zUjU/0wki0Gqggc/QqjjUT30F9
 eXr0qKy7s1gw3v2297MlPkfdSaCNGjm1Viruu0JjDLWEE54VahmpEfcOnw58owpbw2bx
 lEMK6bfrEFaGMCQD3x7csglA8i8MuF/bFEJ8lWfMcpGHHRWv0N1/AjvGLmTinLyJW7mE
 oRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7BJ4b+ZCK1KcbRqrUfzTg1s3YjZAZz2SSgqLMUOfm3k=;
 b=YzZ03Xe2KinlsdlP/tlFdIyQz7Z7BSGFZHMPREzARdGnDoCLWBH/UQIP+J4b3hcxP6
 eiHaNgnKnm0zQl3AWYuI9SNVapr2I2E/Kf63SmAJls1EFbAiqex631vD7C3rYbN60v8d
 522AJ9efCnOMeqzxKp5J49ZOjxwzFVmG10F6DxxhDmFii0q7MDYty5pwMvgc58xW0UW1
 iSYlc4IkpNP8Mr/gv6x2CKEAjbp0r/5N2hdsTFEZzksSOxb8+c2V0bNg5r0dD5nixMRV
 wPtxuJrITK5229Q5eHFwLHRZxSkgk9WFLCMv3VpeZOEvkbXPDim73iPg7kJhAlDlV9e3
 xzWA==
X-Gm-Message-State: AOAM5334VYLHB9qQFcZvWq+EzikbUuZPeiYbBpuWu8HOVhWwglOF0Zva
 AeO+HsmTiRWHAiAfakv4fx+rKg==
X-Google-Smtp-Source: ABdhPJx+3KUtZGkuT2ewpb4sfj7NNaP3ImFgpEM2CqLhr7aOK2wZH2Q3ORc2zxMlFYeORSzo8AZcbQ==
X-Received: by 2002:a63:d303:: with SMTP id b3mr18380214pgg.113.1610817881564; 
 Sat, 16 Jan 2021 09:24:41 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id e65sm11831115pfh.175.2021.01.16.09.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 09:24:40 -0800 (PST)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: Alistair Francis <alistair23@gmail.com>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
 <CAKmqyKOezdn_bjyjAsAbiXQj_Cz-fphYCezo-tbBAjGR=Emgng@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccc7858f-46e7-0634-cad3-fe5bb0d5e99a@linaro.org>
Date: Sat, 16 Jan 2021 07:24:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOezdn_bjyjAsAbiXQj_Cz-fphYCezo-tbBAjGR=Emgng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 1:03 PM, Alistair Francis wrote:
> I run QEMU with these arguments:
> 
> ./build/riscv32-softmmu/qemu-system-riscv32 \
>     -machine virt -serial mon:stdio -serial null -nographic \
>     -append "root=/dev/vda rw highres=off  console=ttyS0 ip=dhcp earlycon=sbi" \
>     -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02
> -netdev user,id=net0 \
>     -object rng-random,filename=/dev/urandom,id=rng0 -device
> virtio-rng-device,rng=rng0 \
>     -smp 4 -d guest_errors -m 256M \
>     -kernel ./Image \
>     -drive id=disk0,file=./core-image-minimal-qemuriscv32.ext4,if=none,format=raw
> \
>     -device virtio-blk-device,drive=disk0 \
>     -bios default
> 
> I am uploading the images to:
> https://nextcloud.alistair23.me/index.php/s/MQFyGGNLPZjLZPH

I don't replicate the assertion failure, I get to

/sbin/init: error while loading shared libraries: libkmod.so.2: cannot open
shared object file: Error 74
[    0.819845] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00007f00
[    0.820430] CPU: 1 PID: 1 Comm: init Not tainted 5.11.0-rc3 #1


r~

