Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD858CED5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 22:06:34 +0200 (CEST)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL91F-0006st-0q
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL8xs-0004qg-9w
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:03:04 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL8xq-0005e2-69
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:03:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d7so9482327pgc.13
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 13:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=srMCfTK4ptQCCuMqoXGm5dG20E0GFuGHuQL4fB5H2BM=;
 b=jQeOcySaQnfxMEkr7tlTQaW8ULWcN9I1VuRyebB7+ULh1s9b4bFCZ243Jw3knqE6C/
 abmnPjZFIxBKw2umcTpOM4+laU2UudVMnbw2UA/rEJl/3EdPuR3P4/Mxo73edHZuyp/x
 S9wsPvMk1wCOLvV3FJTslMpi1TubyImRFGH6iTEx2sdAjDxz/RWx7FB2usMmua7eYbWm
 A3ycCOww62OGgQp6VE3Ufp1acBVX17myrD2lj5+TM/a48Wx+fovhKeEbKMn3WLAiAfPt
 qJaPuOgU8yzYyvVWouwFkacUQVGkbopEmHcVy9z/mJbYJ/HUUvN4t9/6VsQ8eyLhw0bs
 ypxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=srMCfTK4ptQCCuMqoXGm5dG20E0GFuGHuQL4fB5H2BM=;
 b=0i+qmPVHstW2EujUr/HV3fL3lsBzblozYHB8JEg5ZPczRoVlA9PwUe6L01O456b+qT
 vePVZURyuJxow/gvKBqZeVxdcH/ajsAfSAjfrY6PAVb15Q8NCcvhHVlpKjk8W+GQmxQc
 HfYBLY4JsEeGLyY+pMVi2coM/V8Yfyzv2508p/fWUiOdqhBe/CMoOjuJgIwjxubxa6jq
 +hBChV1YC3/0GgoqN1crerJ3UDyWiBSasMOee/EpmbeXdWvY4XQH/nkFXTQwB3lIZUV2
 elNaaPC50WngHYePlPXhnbipvCVxaLMXuCqW3TvnVde2mlQEdsmsxSUWzZwNmrRvav1e
 A9nA==
X-Gm-Message-State: ACgBeo1e4eaDtCtEBiUZ6haUIzmiZHPJuJGDvb51B/FJWs0HaRzV7geI
 QZTAbejyjANWz/c8L0/k2S1usA==
X-Google-Smtp-Source: AA6agR4OBi9J8fr5jT84msEb4pPGxN+NE82gUEybEQwgs/zu8BEaKIQ92QI9DPb8d3r5ybqbt+hh9A==
X-Received: by 2002:a65:57c6:0:b0:415:c329:5d49 with SMTP id
 q6-20020a6557c6000000b00415c3295d49mr16192123pgr.581.1659988980561; 
 Mon, 08 Aug 2022 13:03:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b?
 ([2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a1709029a0c00b0016ef8a8592esm9267413plp.8.2022.08.08.13.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 13:02:59 -0700 (PDT)
Message-ID: <3963c88c-c2bb-f0ac-3911-99c5bb7ff60d@linaro.org>
Date: Mon, 8 Aug 2022 13:02:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/5] Misc QEMU 7.1 fixes for 2002-08-08
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220808125706.60511-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 8/8/22 05:57, Paolo Bonzini wrote:
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to f6a5f380627ab2af384bf2f2940d29386dea11ff:
> 
>    tests/qtest: add scenario for -readconfig handling (2022-08-08 14:54:56 +0200)
> 
> ----------------------------------------------------------------
> * Fix and tests for -readconfig
> * Fixes for changeable block size

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (1):
>        tests/qtest: add scenario for -readconfig handling
> 
> Mark Cave-Ayland (2):
>        scsi-disk: fix overflow when block size is not a multiple of BDRV_SECTOR_SIZE
>        scsi-disk: ensure block size is non-zero and changes limited to bits 8-15
> 
> Paolo Bonzini (2):
>        vl: fix [memory] section with -readconfig
>        vl: remove dead code in parse_memory_options()
> 
>   hw/scsi/scsi-disk.c           |  25 ++++--
>   softmmu/vl.c                  |  32 ++++---
>   tests/qtest/meson.build       |   1 +
>   tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 229 insertions(+), 24 deletions(-)
>   create mode 100644 tests/qtest/readconfig-test.c


