Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D158A6EA8A2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:51:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppoKu-0007nT-Lm; Fri, 21 Apr 2023 06:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppoKs-0007nL-Nu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:49:50 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppoKr-00080L-36
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:49:50 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-b8f5121503eso1939687276.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682074186; x=1684666186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jVkPSXD94pwWRo7H7Czuk0NKhLA3IeMG/SBOM2cH1kU=;
 b=fxoTzrIO6BJxf76jgr8kvn6wnibSD7PXiG220FcPhhWLxv+qlNsj5j1q1nvFanEcQR
 yyFH47Kr3k1S7iYnNPumx1bi6QJXkkZuJ1fSRHv+K63o/siMswi5BhJeHEmggtIMQ4yH
 MRCxXsF4hxqGUvoH0aHiYZ9D79AP0eaEV5VHQZPaoDcouMLhluzCXS4eOKalPKwQw/vo
 7eFblVhFlOUaKdgi3OSMPtaI5Owv6Yj1CV7NVbMA6pZq//ofGl0hCqIwgG2F1pGDJ98O
 1XZDvpI2ChKoLYdde5t8xsQDxkneB2KPvr0FlMcZGvpPV4dksPTgAGm9lQzNGOHtLsNv
 84Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682074186; x=1684666186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jVkPSXD94pwWRo7H7Czuk0NKhLA3IeMG/SBOM2cH1kU=;
 b=OsPU5a4FC5Egld/VdnvOlXUGtplHd7o613qGaw1qRcyefD6i5x0kzcDrNQ1oMwh4Vu
 HAfM3AHmkDExZ+LTVA7xkeGzzzgHT0Hq17nmysjcBAa7iT+a2JXgX+TB7lmLn0NwjA61
 uRB5z0C7IVi5MVCiNz72+eyAD/3mviRd4Se5KMteuoxxgyqMDjcetqmyMnTPmwxfsNZR
 7+AUPpQuJHAuUShD1tTD6XIbu98EOCwHXekAeGv19d+y8JprzxOwOofHSXKtBHjhlakF
 ANpThsJB/2TCTVN+DUHYsNq343l47X1TCiDtqudqFdyLsyAkFmi/N5s0uqqPt2NEZuRo
 S6LA==
X-Gm-Message-State: AAQBX9cV8ZIUEawfSggj1O2g85ei+1ry7zhrLiY2dnu+hX/NtievuKqo
 LQl4lpsYNTIYC4blr2Cnl4vByCE+WAIK55eczuDF4cjT
X-Google-Smtp-Source: AKy350ZgRoikI4NzGjlF+eqLIH1TCIMUwrG2WDlqk5TrbAidwwweK0TeS5O29dkH4+W1L5VcpCvCSw==
X-Received: by 2002:a05:6902:1021:b0:b96:6c84:929e with SMTP id
 x1-20020a056902102100b00b966c84929emr1973410ybt.60.1682074186671; 
 Fri, 21 Apr 2023 03:49:46 -0700 (PDT)
Received: from [192.168.162.227] ([172.58.142.250])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a25850e000000b00b9582234118sm862580ybk.32.2023.04.21.03.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 03:49:46 -0700 (PDT)
Message-ID: <6d9eaf4c-43ce-ebad-f504-8736247bca03@linaro.org>
Date: Fri, 21 Apr 2023 11:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/21] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230420100456.944969-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 11:04, Peter Maydell wrote:
> Hi; here's the first target-arm pullreq for the 8.1 cycle.
> Nothing particularly huge in here, just the various things
> that had accumulated during the freeze.
> 
> thanks
> -- PMM
> 
> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:
> 
>    Open 8.1 development tree (2023-04-20 10:05:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230420
> 
> for you to fetch changes up to 1ed1f338520cda0574b7e04f5e8e85e049740548:
> 
>    arm/mcimx7d-sabre: Set fec2-phy-connected property to false (2023-04-20 10:46:43 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * hw/arm: Fix some typos in comments (most found by codespell)
>   * exynos: Fix out-of-bounds access in exynos4210_gcomp_find debug printf
>   * Orangepi-PC, Cubieboard: add Allwinner WDT watchdog emulation
>   * tests/avocado: Add reboot tests to Cubieboard
>   * hw/timer/imx_epit: Fix bugs in timer limit checking
>   * target/arm: Remove KVM AArch32 CPU definitions
>   * hw/arm/virt: Restrict Cortex-A7 check to TCG
>   * target/arm: Initialize debug capabilities only once
>   * target/arm: Implement FEAT_PAN3
>   * docs/devel/kconfig.rst: Fix incorrect markup
>   * target/arm: Report pauth information to gdb as 'pauth_v2'
>   * mcimxd7-sabre, mcimx6ul-evk: Correctly model the way the PHY
>     on the second ethernet device must be configured via the
>     first one

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



