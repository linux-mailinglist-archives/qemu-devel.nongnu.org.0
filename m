Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98713390E3F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 04:19:50 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llj9B-0006rD-GM
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 22:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj5c-0004Ju-2k
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:16:08 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj5Z-0006Ax-BR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:16:07 -0400
Received: by mail-pf1-x436.google.com with SMTP id c12so13491549pfl.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 19:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zkjB9+nk1Z4CIrEZvbCo7BKExYtSqGXOC6IciuuLjLw=;
 b=bxfwHhwqatw/nnSaeis4fed2/DXxyEorwUr3/gD5HysFKwA6wK6BSAGNsJ70un57Vx
 bt1GA03Lg459qqG/icM1OuGNs9UFaJaYlH9pNCiQC73P+1i8+6crwx6t83APxK7n1lcl
 AXKHU6xFwmgTbdxUZZbPZeGrA4DT9o2VYDG2Oec7k/JHHNJ3kCtuy2VuUOLaGUXqKvXk
 8RxZUC9ZFJH/yVsrOxT20kChg+3To6G8F905vcpwZBuwbP68FRtDazty5wjKc4hlDR8S
 xs35AXKsc6WktlnnaZpZkXqYlJJA3zXf7l221a6ZtIOgivrveswfWoB+JqhJVsEkAPXX
 3jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zkjB9+nk1Z4CIrEZvbCo7BKExYtSqGXOC6IciuuLjLw=;
 b=GEdbLQkspJiFmpAHX/CWbY9ON2gRdUBXxP3/sfDEdVX+2Cw38PqHG8faq0mMJF1LSm
 QuSvcP+IpOp+z3TGjtHBU8/36qyGx3HlBLCiwyvR9ErVim+jy3gn+XJq+65xs8ejQ1Il
 MwG/LNoKC2CEsSekiDkBoYFklmXCcUDe+Fqq1YSsQ4KcQPpLOHyWVWKHSfdrp6ANOMPH
 187NXYf/akLh3uRDaWAkWaoQ4y0QsGJWqAG8thx2SuvOkJOerlyd2fwuU3k02IepgzWV
 PuIuqb55qEKUyvBUgnKDOntVHKrWceVRe1T3koOg1ieLR0Nz1goMyVAYoEXLrGAA/Wyd
 Inuw==
X-Gm-Message-State: AOAM532lVk3mt5u7Y0M6XI0IlOGuT0ignSOVnv23eWfeV9uJP6Oh3qaa
 c1U7xjje68nHCOfZpKO6n0bx7A==
X-Google-Smtp-Source: ABdhPJx0EYcy8xuSOySlC5Z0lTI2BWs3/98uta0/rNA/g6QZy1FV0A4UfPECSHnmY3PGUlaESgZg3A==
X-Received: by 2002:aa7:8ecc:0:b029:2e8:df63:9bc3 with SMTP id
 b12-20020aa78ecc0000b02902e8df639bc3mr14575963pfr.5.1621995363645; 
 Tue, 25 May 2021 19:16:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v11sm15454795pgs.6.2021.05.25.19.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:16:03 -0700 (PDT)
Subject: Re: [PATCH v7 05/23] cpu: Split as cpu-common / cpu-sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f71454db-6f44-e561-ed73-df809f9ee100@linaro.org>
Date: Tue, 25 May 2021 19:16:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> The current cpu.c contains sysemu-specific methods.
> To avoid building them in user-mode builds, split the
> current cpu.c as cpu-common.c / cpu-sysemu.c.
> 
> Start by moving cpu_get_crash_info().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/core/{cpu.c => cpu-common.c} | 17 -----------------
>   hw/core/cpu-sysemu.c            | 34 +++++++++++++++++++++++++++++++++
>   hw/core/meson.build             |  3 ++-
>   3 files changed, 36 insertions(+), 18 deletions(-)
>   rename hw/core/{cpu.c => cpu-common.c} (96%)
>   create mode 100644 hw/core/cpu-sysemu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

