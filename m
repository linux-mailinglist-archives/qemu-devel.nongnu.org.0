Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F75819DC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:39:53 +0200 (CEST)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPTE-0006xL-Gs
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGPQK-00046X-Jo
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:36:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGPQD-0003V2-7v
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:36:49 -0400
Received: by mail-pf1-x433.google.com with SMTP id c139so13996281pfc.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=JtkYenaC5xFtJRU6ugjQG6fjuu8VM7hARBEJKcUFzw0=;
 b=kPMFEhTgFyn7SHCIo9gLvzc+XQQDkDYxXWefYelwZw44xbqAL0HlHsFBlWzFfu/R7u
 BbwxajqB4S8khoCYjI9lhXGsL9/z0/XF2mZw7cmy5yb0t/ksdvMsdFmuzmHhc6HNTI7+
 sJjDWJHNZf/qKPW8z3gtbSPlzQhZbiKJx8HPN5ghH/n3SaUwn7Twe+e5d7Q2foAknEWn
 DDZdk/DoU+avSh3IBlbG+CFp+VKEtYp2tosxCOALc2fXsHZ4zyysbSLj7eYC2wdY+hIs
 Madi1UNBUYHBLk2XmfgybVGkvi2eBprGMpItIfj9Coidxs9s9/C2RdbB5V3dpWasEXvx
 0ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtkYenaC5xFtJRU6ugjQG6fjuu8VM7hARBEJKcUFzw0=;
 b=s7vZJyPxSnFivu66q3TICcs4zIavKh+6USLSG58fvU1Mg6YYhlumbLZgYv0Zu5Bxfi
 xEZJ7UVNeOCwnhO/LJLg/ZkGYWQE9rw+yx+OqfsKpTBxav6iXX0R0FmGC+nP/M/vaJkm
 KjmqGGvekBo5hlqENDyVETjGAbCgxxZ2/+It9KCz1e3Ye9eAlDATxx4B4CzoNpa8ivCy
 0mlDneDVqyYccmabcf9VzWeL9oonxNFLdl7WlyloZv2bOVykrDu/lL0WxRbOayByEeI6
 W+pYEHJsq8CMiRCk167CnfkXLz/7nv9rqR0PcVasqPBlNuuDemqw32AwPe5bmMOVYgxR
 HJDA==
X-Gm-Message-State: AJIora9hb8m5NSdmWEeJN38F37Iz2Aw07pRYTfEVAOi3WijWFKVMme67
 q97rIaFWYmdcP+4KRAuXWQFkZQ==
X-Google-Smtp-Source: AGRyM1vIHf+/E6N8n4uR6I9sArZwS2C/MBWR0bmbupyAi1hAfdq5za7kuOmOGa5CPIZ08R5Bh15SBw==
X-Received: by 2002:a05:6a02:183:b0:41a:8177:9c3 with SMTP id
 bj3-20020a056a02018300b0041a817709c3mr16092832pgb.157.1658860600217; 
 Tue, 26 Jul 2022 11:36:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 h189-20020a6283c6000000b00528d620eb58sm12398424pfe.17.2022.07.26.11.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 11:36:39 -0700 (PDT)
Message-ID: <46ed25de-67f7-b30a-9db3-900c342bc9e0@linaro.org>
Date: Tue, 26 Jul 2022 11:36:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/9] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 7/26/22 08:20, Peter Maydell wrote:
> A last lot of bug fixes before rc0...
> 
> thanks
> -- PMM
> 
> The following changes since commit 0d0275c31f00b71b49eb80bbdca2cfe244cf80fb:
> 
>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-26 10:31:02 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220726
> 
> for you to fetch changes up to 5865d99fe88d8c8fa437c18c6b63fb2a8165634f:
> 
>    hw/display/bcm2835_fb: Fix framebuffer allocation address (2022-07-26 14:09:44 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Update Coverity component definitions
>   * target/arm: Add MO_128 entry to pred_esz_masks[]
>   * configure: Fix portability issues
>   * hw/display/bcm2835_fb: Fix framebuffer allocation address

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alan Jian (1):
>        hw/display/bcm2835_fb: Fix framebuffer allocation address
> 
> Peter Maydell (8):
>        scripts/coverity-scan/COMPONENTS.md: Add loongarch component
>        scripts/coverity-scan/COMPONENTS.md: Update slirp component info
>        target/arm: Add MO_128 entry to pred_esz_masks[]
>        configure: Add missing POSIX-required space
>        configure: Add braces to clarify intent of $emu[[:space:]]
>        configure: Don't use bash-specific string-replacement syntax
>        configure: Drop dead code attempting to use -msmall-data on alpha hosts
>        configure: Avoid '==' bashism
> 
>   configure                           | 20 +++++++-------------
>   target/arm/cpu.h                    |  2 +-
>   hw/display/bcm2835_fb.c             |  3 +--
>   target/arm/translate-sve.c          |  5 +++--
>   scripts/coverity-scan/COMPONENTS.md |  7 +++++--
>   5 files changed, 17 insertions(+), 20 deletions(-)
> 


