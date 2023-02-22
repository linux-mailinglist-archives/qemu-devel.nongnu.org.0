Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958269F873
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:57:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrTh-00068c-ST; Wed, 22 Feb 2023 10:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTa-00066I-S9
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:56:14 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTY-0008LJ-Lq
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:56:14 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso2075671pjv.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=xZncKXS3JLOWHAALUueHCR9aGhlXMQFbZdHD4bmhWSY=;
 b=V+YcUZDJgp4O/gqyBNv9+ieBxkl1omrOLZSKxteH05o0DVavlsqSMxDRSjs5FuTLEu
 P1bD/aLuN/axnqdNT/q5jIe6dUdUly+HmWeVM6j4i8tYvbF3hVDNOjgyGPMpfjgSHGVn
 Vfi/Biw5bCQ3BUSCkM2tjs6fOwoydY+aNILzYbNMrKu/3PNGWmWxIzG09Jz8hUE0UQy9
 qZJGJ8Ic/HvB0nGdvf3r8/7axKYz9GJrpGzdjPA0aym2rfFENEUFRtLinBkOyam2qz6S
 UJCMxdcxJzkRB7qoe3g5GkecKNi8hIElE8OYndTWV/CZ80MXoJszudz6VYrvdOcAVT50
 HLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZncKXS3JLOWHAALUueHCR9aGhlXMQFbZdHD4bmhWSY=;
 b=0U6fkZfqHHtaXK2EunVxa0b/UD9qHiAKCmgUDJQqH3zNOzx0DeyqX/4h0uBIy/VFXz
 l1WYOW9+VAi6g0RN67kS9oonV4j7hNnNfANodyaMTonXoAr1SUZrQ1hQXlfafq8o0b1W
 93JJuVhv2uGqVK8NQLprhBKknvUgPGS1z4LhefF+HMdeI958H7fKn7d238w3JQmESBfs
 +8FV3pZE99W9MpN9dOOhlh4nfuxLC760ZNEw/ltiX4jYySnLzVKE7hNZ1cxQvStdxeGc
 fB/hRaClhPW+Bl1aWwBIuj+iSebk183NiZo6K5Kj6qZW2iDqZFT7+qkVhVuT3f10Z0zR
 ROAg==
X-Gm-Message-State: AO0yUKX+7ojmFHnCzgRuFOFkyYcCVrGT4VSLuNA/xkH6SFbISJdAk5/n
 f14s5KSHmvNsrs2zb2bCaQeVJQ==
X-Google-Smtp-Source: AK7set8TnLBcQT0Ag3vracuLAw6hBpUU7mZu3WKgRrVEX9uLa0mkfH5FsEqcM/havnsH42CXemejSg==
X-Received: by 2002:a17:902:d501:b0:19a:96ea:3850 with SMTP id
 b1-20020a170902d50100b0019a96ea3850mr8808227plg.17.1677081371350; 
 Wed, 22 Feb 2023 07:56:11 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0019acd3151d0sm6702927plb.114.2023.02.22.07.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:10 -0800 (PST)
Date: Wed, 22 Feb 2023 07:56:10 -0800 (PST)
X-Google-Original-Date: Wed, 22 Feb 2023 07:55:11 PST (-0800)
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <CAFEAcA_DvrOgKAdVcF8OxpxUv9aPB5hOWjWryOt_SpFiNzY12A@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 bmeng@tinylab.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-3ef3787a-321d-4a23-aa45-8831b3093ac5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 21 Feb 2023 08:43:47 PST (-0800), Peter Maydell wrote:
> On Fri, 17 Feb 2023 at 17:53, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>>
>>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217
>>
>> for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:
>>
>>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)
>>
>> ----------------------------------------------------------------
>> Fourth RISC-V PR for QEMU 8.0
>>
>> * A triplet of cleanups to the kernel/initrd loader that avoids
>>   duplication between the various boards.
>> * OpenSBI has been updated to version 1.2.
>> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>>   reviewers.  Thanks for the help!
>> * A fix for PMP matching to avoid incorrectly appling the default
>>   permissions on PMP permission violations.
>> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>>   cpu_get_tb_cpu_state().
>> * Fixes for the vector slide instructions to avoid truncating 64-bit
>>   values (such as doubles) on 32-bit targets.
>
> This seems to have caused CI to decide it needs to rerun the
> 'docker-opensbi' job, which doesn't work:
> https://gitlab.com/qemu-project/qemu/-/jobs/3808319659
>
> I don't understand what exactly is going on here -- Alex,
> Bin, any ideas?
>
> Why do we build the firmware in CI if we have checked in
> binaries in pc-bios?
>
> Should .gitlab-ci.d/opensbi/Dockerfile really still be
> starting with Ubuntu 18.04 ? That is already older than our
> set of supported platforms, and falls out of support from
> Ubuntu in a couple of months.

I just sent along a patch 
<https://lore.kernel.org/r/20230222154938.9201-1-palmer@rivosinc.com/>.  
I have no idea how to test it in the CI, though...

> (.gitlab-ci.d/edk2/Dockerfile is also using 18.04.)

I guess I'd missed this in the original email, I stumbled on that one as 
well 
<https://lore.kernel.org/r/20230222155341.10127-1-palmer@rivosinc.com/>.

>
> thanks
> -- PMM

