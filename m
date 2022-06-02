Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFD53B16B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 04:05:27 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwaDF-0007dC-Qq
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 22:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nwa7p-0005dX-W9
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:59:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nwa7e-0007RK-To
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:59:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id k16so4554569wrg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p0cwtxTKFUGdSCZKc257NQdYSr2Cwz9VjH/8b4n1T1I=;
 b=nL3j2pj3wtBS+/0vXqSbuVCVDBQVWtsRtHUn7YBIWoI2M/0N3dIYJUhUvUnrS+/FQj
 wwJ9oVh4BEqpvTdHnk/WLpTG25bzNcTODyzrIXiY/ycsddMKDqGJGrtj4zBlAgXfzpMA
 0GVOAgRs+vtlbv67q2kDH1LsdnggRl1YFImGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0cwtxTKFUGdSCZKc257NQdYSr2Cwz9VjH/8b4n1T1I=;
 b=G2NfMIHVaRRj8PPux3IO42ppShD+yq+6SrXMhtN4wM9IweTnbtnOU85sdGylwczblK
 VzHSpX+779S2vvSwBY+WDoMIUuuPK1X4/Meo9n4pgtJBiTzXdqgs3Joq8vAF6MoW+B5y
 NBYas0l1Ql6edqvpedADFX684coP1NECTD4CWqCiKztDUoC+8qS7ifkdMfe4Ac7lBcy4
 dZp4CPnrtNzhuNDN5VvY2cQAnB30tWvNHO2ozekCY25hTQqGY36Rl3OcvX76AK6bMYq4
 gxzJTsBQcIiCjv+oVIenQK25B8boymJEOiWD7Q0ySWbM/z0coqrNcENSqhyYKbsEBELH
 U8vQ==
X-Gm-Message-State: AOAM531bDQLfhI2jm+jg0mITBqh8iHgo3OTNmIQ9sT6M+1b30w2dKAhd
 UPiWTAX3WESGSEM1mlkRVxlnrMkNAVi1ysEvnfc=
X-Google-Smtp-Source: ABdhPJwEddFLR4Eosu6BqsKpQxarssihy6B/1qeH3eunPVMfNMYDWfbuIx+b8mq1/MIWdZEFOG4UyrYOU6TtdfzcAUs=
X-Received: by 2002:adf:ec0f:0:b0:20f:c997:6dba with SMTP id
 x15-20020adfec0f000000b0020fc9976dbamr1611048wrn.628.1654135176363; Wed, 01
 Jun 2022 18:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220602011459.294754-1-richard.henderson@linaro.org>
In-Reply-To: <20220602011459.294754-1-richard.henderson@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Jun 2022 01:59:24 +0000
Message-ID: <CACPK8XfQjzNtpr10nE+isQqnQsBGypBoNHgdavkL0E3LZpC8Fg@mail.gmail.com>
Subject: Re: [PATCH] tcg/aarch64: Fix illegal insn from out-of-range shli
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, 2 Jun 2022 at 01:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The masking in tcg_out_shl was incorrect, producing an
> illegal instruction, rather than merely unspecified results
> for the out-of-range shift.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1051
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I can confirm this fixes the issue I reported, thanks Richard.

Tested-by: Joel Stanley <joel@jms.id.au>

> ---
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 61e284bb5c..d997f7922a 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1261,7 +1261,7 @@ static inline void tcg_out_shl(TCGContext *s, TCGType ext,
>  {
>      int bits = ext ? 64 : 32;
>      int max = bits - 1;
> -    tcg_out_ubfm(s, ext, rd, rn, bits - (m & max), max - (m & max));
> +    tcg_out_ubfm(s, ext, rd, rn, (bits - m) & max, (max - m) & max);
>  }
>
>  static inline void tcg_out_shr(TCGContext *s, TCGType ext,
> --
> 2.34.1
>
>

