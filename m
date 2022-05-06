Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E351E0FA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 23:19:15 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn5M2-0001kW-7g
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 17:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn5Kc-0000BK-BJ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 17:17:46 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:46525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn5Ka-0001RA-B9
 for qemu-devel@nongnu.org; Fri, 06 May 2022 17:17:45 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-d39f741ba0so8495388fac.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IlxWrrfqj4ov0L8068BQJecwogapZnOph3Sg6tB9F4c=;
 b=oiS4K1CB31s/2gjgKbdNz8y9JuPOBh7RIaVYn+07xKGQl2TgSzeiHY4D28spAPWwHv
 RFmBBHA2D0CJ0xknTmqlSgEWeYdhG7zyhC5l2vHKmJsPISlGxaAwsyNekeF40i8fAtUI
 afSA/PepR8ulqao97WKhILlsmOjVw2ReNuY1W+YXN49o2MGvuKSVPt7c8tkFQ//LeSp2
 CYxT7oRtuMfwAJCLdnwP8YwChdldaalA/eu+X1SjvCIV51QWB/TZk409+ITiiQGZcDD8
 cTbedJSvdE+igQs8tVnDKpSK/PLrVZRnMie4AxZOsWlltIkRl4hny41OBKv9eORFJCL6
 0P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IlxWrrfqj4ov0L8068BQJecwogapZnOph3Sg6tB9F4c=;
 b=N538jnamX7RDGRsKjYtkkHTTw4NOr4zNnOizQVwu0FaA3ijni/QLblK1ICu1SbAtqH
 QitsxczC9ZmjFnG8VAsO3w+IHIEnYTSef0hR5n3qPWOBWqvLm9aSQuezZpw/sg1R9UGW
 zVWtfmJds4TOAcStTLfO4/HkNIJS4iD/clSgXwus0+al2R6aS4qnhauHuL8SbCJ9oK7m
 eMXHyNzbs8x/MXZ9QfIScevTkapzKVg7/oIg5xB1OcbBMyPdTPISYVCGwaQS1RWHmhXG
 bTjEdZrCkFEK+al13ytPKcwe+qDlx1AjXBOPjwxH+dCRnhjzuPFMF4+17CMrCCAyX0Ac
 1bwg==
X-Gm-Message-State: AOAM533sjor9+FKBTkZ+QGXKxQ5eN0QJYwCFLAt/W1+qz4f7C3VLXvCU
 t/uulr9alYhmvYtRd4/dNz8kmg==
X-Google-Smtp-Source: ABdhPJzVqj6vDUmOfiYGbRVObb3cVBvy5v/COA/Q9/9moZ32gouJoyqBaSYSKY17z1ivbwuHq+O6WQ==
X-Received: by 2002:a05:6870:3112:b0:ce:c0c9:62b with SMTP id
 v18-20020a056870311200b000cec0c9062bmr5270951oaa.125.1651871861739; 
 Fri, 06 May 2022 14:17:41 -0700 (PDT)
Received: from ?IPV6:2607:fb91:2c60:4168:5603:e850:fc4d:149c?
 ([2607:fb91:2c60:4168:5603:e850:fc4d:149c])
 by smtp.gmail.com with ESMTPSA id
 w3-20020acadf03000000b003265922b72fsm2007292oig.40.2022.05.06.14.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:17:41 -0700 (PDT)
Message-ID: <75464333-8807-e316-0b37-16c544616394@linaro.org>
Date: Fri, 6 May 2022 16:17:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/18] target/xtensa updates for v7.1
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220506195213.3835272-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506195213.3835272-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 14:52, Max Filippov wrote:
> Hello,
> 
> please pull the following updates for the target/xtensa.
> 
> The following changes since commit 823a3f11fb8f04c3c3cc0f95f968fef1bfc6534f:
> 
>    Update version for v7.0.0 release (2022-04-19 18:44:36 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/OSLL/qemu-xtensa.git tags/20220506-xtensa
> 
> for you to fetch changes up to 5e1d80a3fc16d5dbe7d677af6ba4df94d68c75d2:
> 
>    tests/tcg/xtensa: fix vectors and checks in timer test (2022-04-27 10:15:23 -0700)
> 
> ----------------------------------------------------------------
> target/xtensa updates for v7.1:
> 
> - expand test coverage to big-endian, MMUv3, cores without windowed
>    registers or loop option;
> - import lx106 core (used in the esp8266 IoT chips);
> - use tcg_constant_* in the front end;
> - add clock input to the xtensa CPU;
> - fix reset state of the xtensa MX PIC.

Auto-merging MAINTAINERS

Auto-merging target/xtensa/cpu.h

Auto-merging target/xtensa/translate.c

Auto-merging tests/tcg/xtensa/Makefile.softmmu-target

CONFLICT (content): Merge conflict in tests/tcg/xtensa/Makefile.softmmu-target


This branch is based on the v7.0 tag.  You need to rebase to master branch.


r~


> 
> ----------------------------------------------------------------
> Max Filippov (17):
>        tests/tcg/xtensa: allow testing big-endian cores
>        target/xtensa: fix missing tcg_temp_free in gen_window_check
>        target/xtensa: use tcg_contatnt_* for numeric literals
>        target/xtensa: use tcg_constant_* for exceptions
>        target/xtensa: use tcg_constant_* for TLB opcodes
>        target/xtensa: use tcg_constant_* for numbered special registers
>        target/xtensa: use tcg_constant_* for FPU conversion opcodes
>        target/xtensa: use tcg_constant_* for remaining opcodes
>        target/xtensa: add clock input to xtensa CPU
>        hw/xtensa: fix reset value of MIROUT register of MX PIC
>        tests/tcg/xtensa: fix build for cores without windowed registers
>        tests/tcg/xtensa: restore vecbase SR after test
>        tests/tcg/xtensa: fix watchpoint test
>        tests/tcg/xtensa: remove dependency on the loop option
>        tests/tcg/xtensa: enable autorefill phys_mem tests for MMUv3
>        tests/tcg/xtensa: enable mmu tests for MMUv3
>        tests/tcg/xtensa: fix vectors and checks in timer test
> 
> Simon Safar (1):
>        target/xtensa: import core lx106
> 
>   MAINTAINERS                                   |    1 +
>   hw/xtensa/mx_pic.c                            |    2 +-
>   target/xtensa/core-lx106.c                    |   52 +
>   target/xtensa/core-lx106/core-isa.h           |  470 ++
>   target/xtensa/core-lx106/gdb-config.c.inc     |   83 +
>   target/xtensa/core-lx106/xtensa-modules.c.inc | 7668 +++++++++++++++++++++++++
>   target/xtensa/cores.list                      |    1 +
>   target/xtensa/cpu.c                           |   15 +
>   target/xtensa/cpu.h                           |    5 +
>   target/xtensa/op_helper.c                     |    7 +-
>   target/xtensa/translate.c                     |  173 +-
>   tests/tcg/xtensa/Makefile.softmmu-target      |    4 +-
>   tests/tcg/xtensa/crt.S                        |    2 +
>   tests/tcg/xtensa/test_break.S                 |   86 +-
>   tests/tcg/xtensa/test_mmu.S                   |  182 +-
>   tests/tcg/xtensa/test_phys_mem.S              |   10 +-
>   tests/tcg/xtensa/test_sr.S                    |    2 +
>   tests/tcg/xtensa/test_timer.S                 |   68 +-
>   tests/tcg/xtensaeb/Makefile.softmmu-target    |    5 +
>   19 files changed, 8575 insertions(+), 261 deletions(-)
>   create mode 100644 target/xtensa/core-lx106.c
>   create mode 100644 target/xtensa/core-lx106/core-isa.h
>   create mode 100644 target/xtensa/core-lx106/gdb-config.c.inc
>   create mode 100644 target/xtensa/core-lx106/xtensa-modules.c.inc
>   create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target
> 


