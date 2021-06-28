Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44C3B63CE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:58:28 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsiR-0008EJ-Pv
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsgg-0004nY-0G
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:56:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsgb-0005Ij-VH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:56:37 -0400
Received: by mail-pg1-x532.google.com with SMTP id d12so15672804pgd.9
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TDnxbH5FGckt2AG7xmbIt7GJAml6I4pcJvZgF8vt04c=;
 b=CuV+cb9GizvXQ3BwSMlYIgIgvq9uUKkmrf+6l7ZTw1vKpl7ZgRjd17934bCNqCqO+6
 lHUtVYKb2R482b7Z70bhz2oG6cA17V7jc8OI5X4u0o3ltZcXOXlVeOSCZU+R3fFs2DL7
 C6swIZvw4iLM+P3u1ru1r8lLfso0RPdvlRt5KAX5kTDIbvEhDnOFQSd+zKIp9HM0ksYS
 PUgEcoIk3sjcI6Ul1C3TFYsvfNv4uWOGw4hhIxawyONehymtM98Iy0ILadwmFLvJHB4t
 CirLRdGqnvot8yBjwQ/+Ftg0amViT4FJ3yjJaZ4kl+AOo2sgNq4glCIz467VaKKL5ts7
 44xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDnxbH5FGckt2AG7xmbIt7GJAml6I4pcJvZgF8vt04c=;
 b=KGQtUuEwnOfnkYuMmyJrJehgDSpnLUp0K1vrtLIOr+2etCMKQvRYuYlpsd+Z7TMEO7
 jHNSHqZbvh7MsnyUOdtyB7SfzTEmphm04lrahcJlpB+Jv4PDO7IcxBDdOi/T8xhUq/iK
 kAw3Kt+BW4wx/PvnBjdvMxw1QnRDPAZvGUkovqz9jY0u+SNe0GSvlnKkBN6QHWTfcdr5
 5Hl4oiQJZ4ka3VHdXykis9BIhPaHio99cbDBUgy/M1C9S+T8aGp4f8taLHjwgEDIHXHm
 Uz/m1u7GLlLL5N9QaoMV615hLg1Fptsks4NSJAiNBGyAUGUXQFnwfdSVPXYBMFIRNxke
 Dbqw==
X-Gm-Message-State: AOAM5307kZjsN+/UVuYl9fXJgo2KNUWDtb/TuKLSwJtyed7e77ZXywSK
 MfBdBqPKV7S3gswi1u3oaowDGZCLCi3RJQ==
X-Google-Smtp-Source: ABdhPJykuVFvAeN6SMxzqfwDU93d+4RYQ2tLqhePrp0maVL9CjEAEpleN0vevJvCucMI5slKtfzjVA==
X-Received: by 2002:a63:4e4d:: with SMTP id o13mr23578438pgl.361.1624892192553; 
 Mon, 28 Jun 2021 07:56:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d13sm14123527pfn.136.2021.06.28.07.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 07:56:32 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] target/cris: Add DISAS_DBRANCH
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
 <20210622154820.1978982-12-richard.henderson@linaro.org>
 <20210623134318.GB3586016@toto>
 <685fd02d-b92d-e038-e19d-bf2c870f83f8@linaro.org>
 <20210623141721.GC3586016@toto>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18b435ca-8f68-bcc7-bb4b-5432cd8e03fa@linaro.org>
Date: Mon, 28 Jun 2021 07:56:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623141721.GC3586016@toto>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 7:17 AM, Edgar E. Iglesias wrote:
> On Wed, Jun 23, 2021 at 06:55:49AM -0700, Richard Henderson wrote:
>> On 6/23/21 6:43 AM, Edgar E. Iglesias wrote:
>>> On Tue, Jun 22, 2021 at 08:48:16AM -0700, Richard Henderson wrote:
>>>> Move delayed branch handling to tb_stop, where we can re-use other
>>>> end-of-tb code, e.g. the evaluation of flags.  Honor single stepping.
>>>> Validate that we aren't losing state by overwriting is_jmp.
>>>
>>> Hi Richard,
>>>
>>> This patch breaks my kernel boot test:
>>>
>>> edgar@zapote:cris-axisdev88$ ./qemu-run.sh
>>> + MACH=-M axis-dev88
>>> + QEMU_BUILD_PATH=/home/edgar/src/c/qemu/build-qemu/
>>> + QEMU=/home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris
>>> + KERNEL=-kernel kimage
>>> + NIC0=-netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0
>>> + /home/edgar/src/c/qemu/build-qemu//cris-softmmu/qemu-system-cris -M axis-dev88 -netdev user,id=net0,hostfwd=tcp::2256-10.0.2.15:21 -net nic,netdev=net0 -serial stdio -display none -kernel kimage
>>> Linux version 2.6.33 (edgar@edde) (gcc version 4.3.1 20080521 (prerelease) [gcc-4_3-branch revision 135713] (GCC 4.3.1 Axis release R93/1.93) ) #4 Thu Jan 13 15:11:20 CET 2011
>>> bootconsole [early0] enabled
>>> ROM fs in RAM, size 6946816 bytes
>>> Setting up paging and the MMU.
>>> Linux/CRISv32 port on ETRAX FS (C) 2003, 2004 Axis Communications AB
>>> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 4080
>>> Kernel command line: root=/dev/mtdblock3 init=/linuxrc rootfstype=jffs2 mmc_core.use_spi_crc=0 mmc_spi.spi_mode=3
>>> PID hash table entries: 128 (order: -4, 512 bytes)
>>> Dentry cache hash table entries: 4096 (order: 1, 16384 bytes)
>>> Inode-cache hash table entries: 2048 (order: 0, 8192 bytes)
>>> Memory: 22864k/32768k available (2260k kernel code, 9904k reserved, 504k data, 80k init)
>>> Hierarchical RCU implementation.
>>> NR_IRQS:80
>>> Enabling watchdog...
>>> Calibrating delay loop... qemu-system-cris: ../qemu/target/cris/translate.c:3236: cris_tr_translate_insn: Assertion `dc->base.is_jmp == DISAS_NEXT || dc->cpustate_changed' failed.
>>> Aborted (core dumped)
>>
>> Ach, I see it -- rfe and rfn set DISAS_UPDATE without cpustate_changed.
>> Could you try adding dc->cpustate_changed = 1 in dec_rfe_etc, please.
>>
> 
> Great, that fixes it! This now passes all my tests.
> 
> With that fix, on the full series:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Thanks.  Based on private email with Edgar, I'll queue this to tcg-next.


r~


