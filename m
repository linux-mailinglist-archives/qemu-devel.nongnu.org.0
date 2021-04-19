Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547413648ED
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:17:24 +0200 (CEST)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXWV-0002Po-9e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXOr-0001fL-TE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:09:29 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXOq-0006GB-7b
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:09:29 -0400
Received: by mail-ed1-x536.google.com with SMTP id h10so41609511edt.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oIcR+jn+P5ZI6cd1tZwddKKZQ0GTahtJj53SbGnCNM=;
 b=f70HuaoiOIxUGUye/I4zQKkQJ2k+b7i8lIbk3aRej3EOLGX3/yzUm7tdtfJb66zm9b
 RR5djr3TRQRq+zk/TEwhRUKb3EUJzJJSPL1plTzhz7tvXBpYbvGRmytHQNMzAUNS8hn3
 hOH2NQXbUxXhDvb4U9hPKDYxD5GYkKwHc32nKPm1NDVXMuhsquxcc0Wm+sJgp/RqL/Z5
 iKMgiaClea+NMdUf62lIf7VInrgGVjD7pJaWlS0meJL2RdJCFSRnMroGW/jJHrHBpdkr
 ho96KXGxHBJt+YRTE8Djz8Mvt8OtwnMm1PAIHWbmfGe2USD14iPy7DqSvXg2NFT29dw/
 keXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oIcR+jn+P5ZI6cd1tZwddKKZQ0GTahtJj53SbGnCNM=;
 b=t55YzB3ATasckd5MApdUCWgb2hwkTmRPVRmoW0kS3GLEciRFvOZGTWf4/tQqu+eoK3
 g0Gv4k1WSSbxgk0esGzKK7zA4P2EZC2KrhgsK3ahcfUFUzkqdlPVSDYVCsrzFBXEqHD+
 PWtLd7Vu7vCLAEF3N+xKG3PdlJrIkXZQaeifI7MV2dBBCXkXDo7FkwPlt8kfBVMJH5KQ
 XjihYt51tgIYUWH2lbf2QQFm4nOufwRQ/0olyWLOFGv/utH4baW1HEG9oYdWWyJgI/yo
 isriQrEJwj2SYed/5mPdxcxq//CdkDFJCkaT5BcRs7jgK1kQUOkA6UzZDU8SLVGGvYTD
 PTrw==
X-Gm-Message-State: AOAM5321EL1MZYIc+JZVIrJkz87V2hCRhF60amuApwxPG1i1CBO+xAmx
 /VtaKET+1usR1+PoYzYtu/RPcsN837ZwoiI4MBy1oQ==
X-Google-Smtp-Source: ABdhPJx05jkc/YDSj7o3c/tujN1pfIuVaCqRELLvkwLu78XH0q3O7gzb1Rgr0aaaNAAM39A45c9Amlx9DESnCx+0mTE=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26823407edb.204.1618852166385; 
 Mon, 19 Apr 2021 10:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-7-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:08:35 +0100
Message-ID: <CAFEAcA_fXNEJXKAnktMuZTRGngToaGqL6QQHk592VJzjRrnstQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 20:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have all of the proper macros defined, expanding
> the CPUARMTBFlags structure and populating the two TB fields
> is relatively simple.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
>  target/arm/translate.h |  2 +-
>  target/arm/helper.c    |  2 +-
>  3 files changed, 30 insertions(+), 23 deletions(-)
>

> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index f30287e554..50c2aba066 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -402,7 +402,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
>   */
>  static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
>  {
> -    return (CPUARMTBFlags){ tb->flags };
> +    return (CPUARMTBFlags){ tb->flags, tb->cs_base };
>  }
>
>  /*
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9070b773a9..85b7d6add0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -13271,7 +13271,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>  {
>      CPUARMTBFlags flags;
>
> -    *cs_base = 0;
>      assert_hflags_rebuild_correctly(env);
>      flags = env->hflags;
>
> @@ -13340,6 +13339,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>      }
>
>      *pflags = flags.flags;
> +    *cs_base = flags.flags2;
>  }

Don't you also need to make assert_hflags_rebuild_correctly()
check flags2 now ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

