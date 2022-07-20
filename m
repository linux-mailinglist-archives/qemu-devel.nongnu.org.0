Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75F57B64E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:27:29 +0200 (CEST)
Received: from localhost ([::1]:37816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8nX-0000a3-Nd
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8jc-0005iN-An
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:23:24 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE8ja-0004hu-JF
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:23:23 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l11so31747235ybu.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUVR7heSHzcc2fb/Q5iggIRdcnGtKKw2ICoHki75YYE=;
 b=UaTX9YBrMLePOJs0NQFPlJufJXlmQmcQ/MyYqRlBx9uwOAwFc2JrWE9JXRFjnc2qgl
 Xeiz3xiERLsJwceSN9jCoH05RPx8lu/peHBEYYb7BuiOS/TzCpl72bjmV/Mu0CHjSfMC
 Tidh0yw9n6lWUN9R/nXLTblUf/WpvOjnAxpQbNjR7GDkv+cXPiKjpRlwR8EC60SjAxk2
 g6qA+WIEld6QIG14IYmFh1d8nNIVka6lc53FZL6P6MQ/muS6wNsA6hcaqN5f7c75P1Mr
 FDlQ8epUa/i4AwydrHdB7YAVa34zzXeA0pnVF2+vkVem9bsJwMlK10ta5/Sljcv0dwwA
 5ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUVR7heSHzcc2fb/Q5iggIRdcnGtKKw2ICoHki75YYE=;
 b=WvSiLyDbOXlZkiA9CuywjFb+Od5CfTchhCPFzR7eBpiY7s/oSUEDyo1httx9iGA4bt
 CZPWxO1VHNnwtbDUH3XJZFd6po2DErzx1ZY002b69Q6DOaCg4y2UVye8I8kGAEKl3fvI
 wueTm3kbd/2xGk0fthyRW23zs2totpaq1In7clbNrNsmspCTp7djzoptI/ghUJS76UEx
 W1LWFhfxS0WVM0Vq1iRSIiNgXH+2a0XAMOOqSP0G89uIgfYIgmYsgZNut9J5TL4E+XAi
 tXiwo1fTFeHOa6g90FVNUxA0xgqWRBUtssOBdtauNiaOAJ2+zavgH67yDVEMOrzWWD6B
 oSSQ==
X-Gm-Message-State: AJIora/o6rZWQZEoJcSgAL05HrZifEU1P2FpNqcUcNozGCYaWi9KcFHa
 inaEGpr0wS1UEjuVADnLIKBREHUSw9QwEBnh6yMmtw==
X-Google-Smtp-Source: AGRyM1sKuucL8OfYjBUZe7ngua9Ujzd7iXH24Cb9/sDATi240C7yHH3R5l854LXYENBp6/opXHVauZHbDY/ZU2zaacQ=
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr7125916ybf.67.1658319801475; Wed, 20 Jul
 2022 05:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-36-mst@redhat.com>
In-Reply-To: <20220516204913.542894-36-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 13:23:10 +0100
Message-ID: <CAFEAcA-KLShEbe8mYa+WGBgSNpZMbGv=syHqbSwyTtfoTEXAyQ@mail.gmail.com>
Subject: Re: [PULL v2 35/86] cxl/cxl-host: Add memops for CFMWS region.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Ben Widawsky <ben.widawsky@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 16 May 2022 at 21:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> These memops perform interleave decoding, walking down the
> CXL topology from CFMWS described host interleave
> decoder via CXL host bridge HDM decoders, through the CXL
> root ports and finally call CXL type 3 specific read and write
> functions.
>
> Note that, whilst functional the current implementation does
> not support:
> * switches
> * multiple HDM decoders at a given level.
> * unaligned accesses across the interleave boundaries

Hi; Coverity reports a bug in this code (CID 1488873):

> +/* TODO: support, multiple hdm decoders */
> +static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
> +                                uint8_t *target)
> +{
> +    uint32_t ctrl;
> +    uint32_t ig_enc;
> +    uint32_t iw_enc;
> +    uint32_t target_reg;

target_reg is 32 bits...

> +    uint32_t target_idx;
> +
> +    ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
> +    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> +        return false;
> +    }
> +
> +    ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
> +    iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
> +    target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
> +
> +    if (target_idx > 4) {

...in this half of the if() target_idx is at least 5...

> +        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
> +        target_reg >>= target_idx * 8;

...but 5 * 8 is 40, so this shift will always be undefined
behaviour. Was the if() condition intended to be "< 4" ?

> +    } else {
> +        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];

Was this (or the other one) intended to be ...LIST_HI ?

> +        target_reg >>= (target_idx - 4) * 8;

Not noticed by Coverity, but in this half of the if(),
target_idx is 4 or less, so (target_idx - 4) is in most
cases going to be negative, which isn't a valid shift amount.
This also suggests the if() condition is wrong.

> +    }
> +    *target = target_reg & 0xff;
> +
> +    return true;
> +}

What's the intended behaviour here ?

The code appears to be attempting to extract a particular
subfield from one or other of the cache_mem[] values. I would
recommend using extract32() for this rather than raw shift
and mask operations -- it's generally easier to write and
to review.

thanks
-- PMM

