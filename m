Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076050B8B6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:38:46 +0200 (CEST)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtUj-0001Xu-3o
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nht93-0006r3-Gv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:16:21 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nht91-0006XZ-0D
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:16:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id r83so7334439pgr.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZgSaQVVV8icH8NQLFfI/lN7DtyETg2GF8i7qE8DpmBA=;
 b=G+pBzjcXhNF/6pil9keW3/+A72rsb5vpapj6akils+biP9RGMB4VbB9ewa0dJpfa7z
 KlqvaJ08tUshiHwJTGdO/b0AWeh/VfYX5PdtGvrWLeR1catTaIQhLPX0wjk8O5z9RBaL
 5nL7cd0vtk4z/yBatR4dTRm4u6HrLxvdWw3HZVrLsBd0odo9fGAzqGg6yvMA9sej6Ugd
 T0urIcdjsRnRlKyYEeRrN8QDT2r2MSLa6E1Vujf90zcls8/dqsYsq9rFlnn8mu53T3Xb
 JrIBb+LY4473reCE98oeuhAm0E0J5k4NaYLC9xwjDYRecQ6EaMZ30o24R/f4r9M+ZhNi
 /kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZgSaQVVV8icH8NQLFfI/lN7DtyETg2GF8i7qE8DpmBA=;
 b=xEIuR8TKyMZcp3Ok2MfW0tvBsrHI8PWcXr1xpwtdMPTDPjQsHtNNx+9mvztLYy2PsZ
 ibbLUleTz43jVuqX8qUR+m6IhuktjRlrBWWdDRti4GOp+D8CzsEIP6BihUETeGMUCZGr
 Bd2ivS0zKL26vcB7oW7bbFWCsutJSOgqRLB5hjFJSHKVPulbyqrfxvVuonn4RGn5x0JA
 eR88aT14PyO+rCWgVHY9OFqEE7RaBwMJFCn2yL5JavL75BBj5S8VOOcMWzib+mfiVOXE
 wMb+9EWqpAtZY2nJr7vSLblKHMIsVwEHAfcWR9izBmXW9CiJrMdtnlYrr30sYfdYQRCQ
 HM/g==
X-Gm-Message-State: AOAM531SLNhZnELNUwSzmltXtTufN8lq9++AXGgXKLsvJX8LtHl5jHd3
 vMSVABuJNjhiWLQWR7CNIn+Xdg==
X-Google-Smtp-Source: ABdhPJxe8PQCUniDexb+3pZnhpbp67TfM7yc/NErVzqIPZBvmhtMFeiv9kHSveIUQcAM+jBgaIalXg==
X-Received: by 2002:a63:eb13:0:b0:382:1cd5:7d06 with SMTP id
 t19-20020a63eb13000000b003821cd57d06mr3948788pgh.280.1650633377179; 
 Fri, 22 Apr 2022 06:16:17 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:fa4a:ee40:5a62:9e6a?
 ([2607:fb90:27d0:b0f2:fa4a:ee40:5a62:9e6a])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a520b00b001d7dd00c231sm2909458pjh.22.2022.04.22.06.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:16:16 -0700 (PDT)
Message-ID: <ecc2903c-6cfa-68ee-40fa-d97295bd099c@linaro.org>
Date: Fri, 22 Apr 2022 06:16:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/13] Dump patches
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: viktor.prutyanov@redhat.com, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 03:15, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> 
>    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/dump-pull-request
> 
> for you to fetch changes up to f5daa8293b292929cb429f154e926191ba8e040c:
> 
>    dump/win_dump: add 32-bit guest Windows support (2022-04-22 13:41:56 +0400)
> 
> ----------------------------------------------------------------
> dump queue
> 
> Hi
> 
> The "dump" queue, with:
> - [PATCH v3/v4 0/9] dump: Cleanup and consolidation
> - [PATCH v4 0/4] dump: add 32-bit guest Windows support
> 
> v2:
> - fix compiler warning in "dump/win_dump: add 32-bit guest Windows support"
> 

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> ----------------------------------------------------------------
> 
> Janosch Frank (9):
>    dump: Use ERRP_GUARD()
>    dump: Remove the sh_info variable
>    dump: Introduce shdr_num to decrease complexity
>    dump: Remove the section if when calculating the memory offset
>    dump: Add more offset variables
>    dump: Introduce dump_is_64bit() helper function
>    dump: Consolidate phdr note writes
>    dump: Cleanup dump_begin write functions
>    dump: Consolidate elf note function
> 
> Viktor Prutyanov (4):
>    include/qemu: rename Windows context definitions to expose bitness
>    dump/win_dump: add helper macros for Windows dump header access
>    include/qemu: add 32-bit Windows dump structures
>    dump/win_dump: add 32-bit guest Windows support
> 
>   include/qemu/win_dump_defs.h | 115 ++++++++++-
>   include/sysemu/dump.h        |   9 +-
>   contrib/elf2dmp/main.c       |   6 +-
>   dump/dump.c                  | 372 ++++++++++++++++-------------------
>   dump/win_dump.c              | 305 +++++++++++++++++-----------
>   hmp-commands.hx              |   2 +-
>   6 files changed, 482 insertions(+), 327 deletions(-)
> 


