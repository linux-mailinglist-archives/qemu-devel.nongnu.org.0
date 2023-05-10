Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747056FDC76
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:18:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhp6-00069A-4V; Wed, 10 May 2023 07:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwhoz-00064U-R3
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwhoq-00020A-Bg
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683717435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3nTEhKN+1gYwBBpze1Ch8cR5tbbSF3AlMJeGLMXsBM=;
 b=IbW5Um91Q6JhLfQ0a4t5CcS74L6DEWlZCovz5tKGjqGjrbZ0anokyWV/kEzdqy8IphKRsu
 tvZu75Csd5ywhpVqnR/sVcq/O4sdW+QqG8dYuuUjgEIyg25U69zxrEkvqAi9AkmgGo5tBw
 ersl38P3YM81AgcjU90/t2edH9kv/y0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-8jRVuVwdMySNnwkdQ-YodQ-1; Wed, 10 May 2023 07:17:13 -0400
X-MC-Unique: 8jRVuVwdMySNnwkdQ-YodQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bd7555c6eso6555115a12.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 04:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683717432; x=1686309432;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H3nTEhKN+1gYwBBpze1Ch8cR5tbbSF3AlMJeGLMXsBM=;
 b=N2XkcvrJKYaQEVQ0R27Cu5VOKoCl68/lPPhxh60XpdJdQuz7TQmmug3NqVKrE8utXg
 NAHv/DyxsCB1oEBv1oKdb/iyYOIxIKb83y/EK2IkuSiHZ7KMLEhPRkYXL7uDCLve6Pux
 Wo4Tfu5MgwHjFrw3rvK5R++HkgTVRNzIqhMRC3TTlOExjvFKWFiTss27zHNsEMVIHUsl
 eKuhEO2Akqz42zON24xw7BimPRq/aaUhpnva1SMRpF0narKR6qfi6SUpWe8dokZEOHeL
 WAK6UxghocaRqWTB/y9ePY3kGmVtN3qsq/TsyHx3PDz04biwl6w0M6fJREhwCWnUEvq7
 0zFQ==
X-Gm-Message-State: AC+VfDziRDd41KP9hzI0JTxBCHcNK+yKXa4Twg8EsqIsl64ADBWx4nEK
 9cqhMQVpCC6FBhoRpmVuZmxAMnD2uDeiCuiUnD0B7TFW44ffc0MdgJLEDhNGUR/qSK7wk7e4J3F
 MvuJiZdVzMtcZZks=
X-Received: by 2002:a05:6402:4d9:b0:50b:c8bf:67b1 with SMTP id
 n25-20020a05640204d900b0050bc8bf67b1mr14008856edw.10.1683717432653; 
 Wed, 10 May 2023 04:17:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sUr+YUE5VFl7rIDcaBPFQ/N93BliPaoGVk1U1RzodFZGHAXWekFwTzhMNvfHVwRyL5mDgBA==
X-Received: by 2002:a05:6402:4d9:b0:50b:c8bf:67b1 with SMTP id
 n25-20020a05640204d900b0050bc8bf67b1mr14008832edw.10.1683717432179; 
 Wed, 10 May 2023 04:17:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020aa7de08000000b005083bc605f9sm1766380edv.72.2023.05.10.04.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 04:17:11 -0700 (PDT)
Message-ID: <bd4d0fa0-6ce6-058c-22a3-f11909af8d12@redhat.com>
Date: Wed, 10 May 2023 13:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/45] loongarch-to-apply queue
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
References: <20230506063540.178794-1-gaosong@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230506063540.178794-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/6/23 08:34, Song Gao wrote:
> The following changes since commit eb5c3932a383ba1ef3a911232c644f2e053ef66c:
> 
>    Merge tag 'pw-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-05-05 19:18:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20230506
> 
> for you to fetch changes up to 725d7e763a802321e1bb303348afc551d564d31e:
> 
>    hw/intc: don't use target_ulong for LoongArch ipi (2023-05-06 11:19:50 +0800)

Hi,

this causes three failures on FreeBSD (detected by the 
x64-freebsd-13-build CI job):

Summary of Failures:
   8/779 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/qom-test 
           ERROR           0.94s   killed by signal 6 SIGABRT
  47/779 qemu:qtest+qtest-loongarch64 / qtest-loongarch64/test-hmp 
           ERROR           0.97s   killed by signal 6 SIGABRT
353/779 qemu:qtest+qtest-loongarch64 / 
qtest-loongarch64/machine-none-test        ERROR           0.73s 
killed by signal 6 SIGABRT

Paolo

> ----------------------------------------------------------------
> Add LoongArch LSX instructions.
> 
> v2: Fixes build error.
> 
> ----------------------------------------------------------------
> Alex Bennée (1):
>        hw/intc: don't use target_ulong for LoongArch ipi
> 
> Song Gao (44):
>        target/loongarch: Add LSX data type VReg
>        target/loongarch: meson.build support build LSX
>        target/loongarch: Add CHECK_SXE maccro for check LSX enable
>        target/loongarch: Implement vadd/vsub
>        target/loongarch: Implement vaddi/vsubi
>        target/loongarch: Implement vneg
>        target/loongarch: Implement vsadd/vssub
>        target/loongarch: Implement vhaddw/vhsubw
>        target/loongarch: Implement vaddw/vsubw
>        target/loongarch: Implement vavg/vavgr
>        target/loongarch: Implement vabsd
>        target/loongarch: Implement vadda
>        target/loongarch: Implement vmax/vmin
>        target/loongarch: Implement vmul/vmuh/vmulw{ev/od}
>        target/loongarch: Implement vmadd/vmsub/vmaddw{ev/od}
>        target/loongarch: Implement vdiv/vmod
>        target/loongarch: Implement vsat
>        target/loongarch: Implement vexth
>        target/loongarch: Implement vsigncov
>        target/loongarch: Implement vmskltz/vmskgez/vmsknz
>        target/loongarch: Implement LSX logic instructions
>        target/loongarch: Implement vsll vsrl vsra vrotr
>        target/loongarch: Implement vsllwil vextl
>        target/loongarch: Implement vsrlr vsrar
>        target/loongarch: Implement vsrln vsran
>        target/loongarch: Implement vsrlrn vsrarn
>        target/loongarch: Implement vssrln vssran
>        target/loongarch: Implement vssrlrn vssrarn
>        target/loongarch: Implement vclo vclz
>        target/loongarch: Implement vpcnt
>        target/loongarch: Implement vbitclr vbitset vbitrev
>        target/loongarch: Implement vfrstp
>        target/loongarch: Implement LSX fpu arith instructions
>        target/loongarch: Implement LSX fpu fcvt instructions
>        target/loongarch: Implement vseq vsle vslt
>        target/loongarch: Implement vfcmp
>        target/loongarch: Implement vbitsel vset
>        target/loongarch: Implement vinsgr2vr vpickve2gr vreplgr2vr
>        target/loongarch: Implement vreplve vpack vpick
>        target/loongarch: Implement vilvl vilvh vextrins vshuf
>        target/loongarch: Implement vld vst
>        target/loongarch: Implement vldi
>        target/loongarch: Use {set/get}_gpr replace to cpu_fpr
>        target/loongarch: CPUCFG support LSX
> 
>   hw/intc/loongarch_ipi.c                         |    2 +-
>   linux-user/loongarch64/signal.c                 |    4 +-
>   target/loongarch/cpu.c                          |    5 +-
>   target/loongarch/cpu.h                          |   27 +-
>   target/loongarch/disas.c                        |  911 +++++
>   target/loongarch/fpu_helper.c                   |    2 +-
>   target/loongarch/gdbstub.c                      |    4 +-
>   target/loongarch/helper.h                       |  566 +++
>   target/loongarch/insn_trans/trans_farith.c.inc  |   72 +-
>   target/loongarch/insn_trans/trans_fcmp.c.inc    |   12 +-
>   target/loongarch/insn_trans/trans_fmemory.c.inc |   37 +-
>   target/loongarch/insn_trans/trans_fmov.c.inc    |   31 +-
>   target/loongarch/insn_trans/trans_lsx.c.inc     | 4400 +++++++++++++++++++++++
>   target/loongarch/insns.decode                   |  811 +++++
>   target/loongarch/internals.h                    |   23 +
>   target/loongarch/lsx_helper.c                   | 3004 ++++++++++++++++
>   target/loongarch/machine.c                      |   79 +-
>   target/loongarch/meson.build                    |    1 +
>   target/loongarch/translate.c                    |   55 +-
>   target/loongarch/translate.h                    |    1 +
>   20 files changed, 9989 insertions(+), 58 deletions(-)
>   create mode 100644 target/loongarch/insn_trans/trans_lsx.c.inc
>   create mode 100644 target/loongarch/lsx_helper.c
> 
> 


