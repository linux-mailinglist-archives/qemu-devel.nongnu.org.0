Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625E6C9272
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 06:54:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgIMo-0000Bw-UB; Sun, 26 Mar 2023 00:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgIMH-0008W2-E0
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 00:51:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgIMF-0007Nh-G4
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 00:51:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id ix20so5582585plb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 21:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679806313;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z/gdWZ0LgvDEKK8tzTDVhUo+Ri1S1DgEeVjsCGtrFpM=;
 b=XT3sVrbVDO7U2cEKw5j0Xwvm6cNgYRFp4dSJtVmXvkCG26FaQGvaIf3qMdhngIQrn6
 IxkKbu0iPanwimyzkqwUzwpboEID57K47BgC6yyFv9L0xrWix9xjtUHegU+NFH81v8J2
 RV7oMUxSDcx/q2buO4a69OCiwZ9n6/dUgZI3iYuhOPdPdhNrU9LJWWcbXIyiCb6R7Er2
 cbdcBZmbQEptH2rQlBw4YMMBWVfQO3CONdPdgrKqTWDg4Wu2rU9Bni9Bkxk756E7PFRs
 5e7OMmicCHBb24wDTsgGSNOnkCR3zkA5xM146cGpaLSHqM2Cs0KXobXe1dtdrukTT/e7
 pFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679806313;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z/gdWZ0LgvDEKK8tzTDVhUo+Ri1S1DgEeVjsCGtrFpM=;
 b=eP8aRDj+uW8tyzNKhBMAVUu5B7qtl64fA2lv4J9R4gJqNDLW4SjulOV7gFJvzrieNp
 SVstm0rOoUDGYu+dA//uQXi83FNTmt5ZYTn6eEE87gFFdI7pEDr7Agdp1OeUd8egkxBg
 C9BEnn47AcZJVVf+gEiUs9sUEaorFnSKWzgnP2s9Z7s3cOxZLhnJ/QW9v5us1zKLYmHK
 k8D/ulO2sG/5iot+UdeVboY/7ylrpyQep6U0RJZHSgwrk/zoEo9M02n2dfbbDe2ZU8ap
 s3UGKW04dAtgBn7QoJXvzPy/kUBNG1IipoA7eWBr1ch5e20E7l6YnK7O9A891uvsC+ZG
 bkBA==
X-Gm-Message-State: AAQBX9eSupApPeym6AhDQ4fX+O1wxNxWHQKDM0HA9bPSufL5njpcnzuD
 nrQ8vUAzowLyvFVJnLzwbyEQ3QAjNwJz6SHVg4c=
X-Google-Smtp-Source: AKy350bmOu9KqnvKu+V+OYLDN906QRHY9JRdwnZxP/zhFViL/zeKvGIGOftEv0Dkjb/T8wpULQvxlg==
X-Received: by 2002:a17:902:ec82:b0:1a1:8d4e:a71d with SMTP id
 x2-20020a170902ec8200b001a18d4ea71dmr11114823plg.46.1679806313321; 
 Sat, 25 Mar 2023 21:51:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:8931:d1e4:9c7f:b1c5?
 ([2602:ae:1544:6601:8931:d1e4:9c7f:b1c5])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a170902eb4600b001a076025715sm16674688pli.117.2023.03.25.21.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 21:51:52 -0700 (PDT)
Message-ID: <92e4db02-af02-6403-6ef2-c78bb109ea65@linaro.org>
Date: Sat, 25 Mar 2023 21:51:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 00/11] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org
References: <20230322150744.175010-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Ping.

On 3/22/23 08:07, Richard Henderson wrote:
> Posting pre-PR because I had to adjust Emilio's QTree patch [1],
> and added a new patch to avoid an assert that can be generated
> with incorrect -R reserved_va values vs the ARM commpage.
> 
> r~
> 
> [1] https://gitlab.com/rth7680/qemu/-/jobs/3975817279#L92
> 
> Emilio Cota (2):
>    util: import GTree as QTree
>    tcg: use QTree instead of GTree
> 
> Richard Henderson (9):
>    linux-user: Diagnose misaligned -R size
>    include/exec: Change reserved_va semantics to last byte
>    accel/tcg: Pass last not end to page_set_flags
>    accel/tcg: Pass last not end to page_reset_target_data
>    accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
>    accel/tcg: Pass last not end to page_collection_lock
>    accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
>    accel/tcg: Pass last not end to tb_invalidate_phys_range
>    linux-user/arm: Take more care allocating commpage
> 
>   configure                   |   15 +
>   meson.build                 |    4 +
>   include/exec/cpu-all.h      |   15 +-
>   include/exec/exec-all.h     |    2 +-
>   include/qemu/qtree.h        |  201 +++++
>   linux-user/arm/target_cpu.h |    2 +-
>   accel/tcg/tb-maint.c        |  112 +--
>   accel/tcg/translate-all.c   |    2 +-
>   accel/tcg/user-exec.c       |   25 +-
>   bsd-user/main.c             |   10 +-
>   bsd-user/mmap.c             |   10 +-
>   linux-user/elfload.c        |   67 +-
>   linux-user/main.c           |   31 +-
>   linux-user/mmap.c           |   22 +-
>   linux-user/syscall.c        |    4 +-
>   softmmu/physmem.c           |    2 +-
>   tcg/region.c                |   19 +-
>   tests/bench/qtree-bench.c   |  286 +++++++
>   tests/unit/test-qtree.c     |  333 +++++++++
>   util/qtree.c                | 1390 +++++++++++++++++++++++++++++++++++
>   tests/bench/meson.build     |    4 +
>   tests/unit/meson.build      |    1 +
>   util/meson.build            |    1 +
>   23 files changed, 2412 insertions(+), 146 deletions(-)
>   create mode 100644 include/qemu/qtree.h
>   create mode 100644 tests/bench/qtree-bench.c
>   create mode 100644 tests/unit/test-qtree.c
>   create mode 100644 util/qtree.c
> 


