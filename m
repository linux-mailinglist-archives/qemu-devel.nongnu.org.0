Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0359168E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 23:03:33 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMboa-0003r1-B6
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 17:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMbnM-0002SL-MZ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 17:02:16 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMbnJ-0006IT-Pj
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 17:02:16 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so1742226pgb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=T2lIIpiIeG9rSqi8hEsOxkdPyp0d0kw7hZ32tWYRZBo=;
 b=BsJ/aBbpOh5tpYBy0penKXHwEF6lbifVeem+7L27ZBfpXbKQ9UBh0umO1qesZWnil3
 uTZ+NJ5i8z5Q/yUNX4tzViRGXDw8GTOcPs+EFp0vH+0W8N2JATUI8gEEibW0ioT4wXXr
 V5SvrG70GSbb22JV92uNIxhQQ+Gfwqbi6AHsPO6rYrLv3Kj5drvcW5CNpB8EZBu6ZOU9
 7oLNaMRCoqjE8f7KJRBTtphHOvKbZRxOGLpTgmc45FyDdaQ3hXBSIQoPHeIr9y41lnBU
 AAQwagk0q05o0VNaGRx+l+5M5DjG15ejwDdjSfs0Am5mjNlPKDu+HYkKtFSGuXFvD0Dw
 SlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=T2lIIpiIeG9rSqi8hEsOxkdPyp0d0kw7hZ32tWYRZBo=;
 b=YBJLEdjetZ2gdtqy/r8caOqtuWfJLzDLYBjLWiptCyD/UCN9FFRjKGXdSkkUFVBEuu
 JSiLSAoB2i24UXasrPKgZAP4XKAZB15nqnDBAVrseW2Y5abqFotLmwZ8NVfUjUZkJ8DX
 HurTv3HqGcroxL7p/Yqj7RfLl0NW14eutWgGFaLkKxyjb5hKqX9blrbOQOiDUa6GhIr0
 GKwV4Q0vtb2TDRkTLjShOUodhWdczMDlgZ642Svy21vrrmK2PqzE1g68a8185wyjkDX9
 Ad1rpQ1X2ora7+gw5UgVXuVXsPWjEZQ3ZWGvy67f+TjtonY9omR+S88wRD+nK1IsHvft
 NbtA==
X-Gm-Message-State: ACgBeo2NSR8H51bdVlgRuFWwFnu3MTlkITI59PuJAqTL+Ge+sSHn7TGF
 A7zhNNR+7LRAFYNwKoeNeO/hgw==
X-Google-Smtp-Source: AA6agR4o1ojV1MEZoNqpaLEI7LkcsdjvwE4eIq0DAfD2+nwmTMWxqQyqKBT3zMfyHS+S7c6T0zYIUQ==
X-Received: by 2002:a63:492:0:b0:41b:ee40:9b36 with SMTP id
 140-20020a630492000000b0041bee409b36mr4623488pge.538.1660338132023; 
 Fri, 12 Aug 2022 14:02:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b0016ef7235e09sm2215194plh.168.2022.08.12.14.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 14:02:09 -0700 (PDT)
Message-ID: <2888602a-93fe-fca5-552a-b41e9dfca887@linaro.org>
Date: Fri, 12 Aug 2022 14:02:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/5] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 8/12/22 04:45, Peter Maydell wrote:
> This pullreq has:
>   * two arm bug fixes which fix some "Linux fails to boot" bugs
>   * a docs typo-fixing patch
>   * a couple of compile failure/warning issues
> 
> I think they're all pretty safe and worth having in rc3.
> 
> thanks
> -- PMM
> 
> The following changes since commit a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-10 10:26:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220812
> 
> for you to fetch changes up to 4311682ea8293f720730f260e8a7601117d79e65:
> 
>    cutils: Add missing dyld(3) include on macOS (2022-08-12 11:33:52 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Don't report Statistical Profiling Extension in ID registers
>   * virt ACPI tables: Present the GICR structure properly for GICv4
>   * Fix some typos in documentation
>   * tests/unit: fix a -Wformat-truncation warning
>   * cutils: Add missing dyld(3) include on macOS

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Marc-André Lureau (1):
>        tests/unit: fix a -Wformat-truncation warning
> 
> Peter Maydell (1):
>        target/arm: Don't report Statistical Profiling Extension in ID registers
> 
> Philippe Mathieu-Daudé (1):
>        cutils: Add missing dyld(3) include on macOS
> 
> Stefan Weil (1):
>        Fix some typos in documentation (most of them found by codespell)
> 
> Zenghui Yu (1):
>        hw/arm/virt-acpi-build: Present the GICR structure properly for GICv4
> 
>   docs/about/deprecated.rst               |  2 +-
>   docs/specs/acpi_erst.rst                |  4 ++--
>   docs/system/devices/canokey.rst         |  8 ++++----
>   docs/system/devices/cxl.rst             | 12 ++++++------
>   hw/arm/virt-acpi-build.c                |  4 ++--
>   target/arm/cpu.c                        | 11 +++++++++++
>   tests/unit/test-qobject-input-visitor.c |  3 +--
>   util/cutils.c                           |  4 ++++
>   util/oslib-posix.c                      |  4 ----
>   9 files changed, 31 insertions(+), 21 deletions(-)
> 


