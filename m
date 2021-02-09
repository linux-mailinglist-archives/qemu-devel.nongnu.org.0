Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE653154B2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:10:07 +0100 (CET)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WWc-0007Yu-4K
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9WSe-0003uG-RN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:06:00 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9WSb-000549-Qy
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:06:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s26so18979394edt.10
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5OCeOB2Pz9RoBRF6rrH2VE2yAQyN9LwRoqv0hHAvqc4=;
 b=SsJvzoGpixOAGBvukb3id6nuaxmDHVFKKnkQURbaj5QX0LpQE+l0Rs85SgNWoAKWwo
 TChtdRB7pScV0lKb3UOSUfh3Pj76GyoyH8O/69dE3jh4Nwhl1466kxNQHUbo8D8Oc+20
 D4AGlLwrgsBnCLK9ptKB/4b9nMk5/UPNBzNdlXMYUXWzMCSB6WPogUSXrFDRlx6n0qEY
 oHsikXIdOgesMWuBEpCxZA6UYAhLBwEBzBl0NqK41ZZpodqgmW/0dyL+SoIweQE3MDbL
 PO1JLZohRVNeHeANCCYMbDdr+52Uf4R/x6ozyd6w0/sLkBkvlA7gH8KstDmPuhRYpO9A
 0hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OCeOB2Pz9RoBRF6rrH2VE2yAQyN9LwRoqv0hHAvqc4=;
 b=GVGfKHGxXsolyQB9Ux9mXkdi5cIIielpfjohQHSTD+0aq3Xm3pXKPlusTia1lKNjvL
 bjwOJ7OOYKUBufWJkU8Dp4ObwTya17X0u1TmeAD9Tg64nUpJ+GLVZn4kNCcbflqh/YnT
 HRFsWNWhYan67f96smwVzAY+PBF/V0LKzQSbkPWHBv/zKtX7w7Vj99LKLJNse2mVJtls
 u7i+O/qblK6hHhRw15Gexc++m0qor3g3NaC8K5Yq+BfX8RnxizmJZl3yb7Ig7Hfk89yg
 OKkquQViRr4OOSLQ6c5f02qcd1MgeKlGHm56OZN0DNEC5PsyqdwZT2RmslA/2RFocrIo
 GbOw==
X-Gm-Message-State: AOAM531nh3Qtg1iP+Q3uf5RAruVUFDMXnDXdXD0O29/LuZXcrw7Z1UOa
 asFKkv8cvOrppckxYg0B744AlSXL24Cb3oQJSCjLLg==
X-Google-Smtp-Source: ABdhPJzAQqrSLMbaVY0dr5zSF4F0z+xPNgOtIq7mO+qIdwcnfazqF1o8Ry3hM8NszzYt7EtG0GnnPlDRNQGqauBt5WU=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr15274302edx.36.1612890355993; 
 Tue, 09 Feb 2021 09:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20210208233906.479571-1-richard.henderson@linaro.org>
 <20210208233906.479571-3-richard.henderson@linaro.org>
In-Reply-To: <20210208233906.479571-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 17:05:44 +0000
Message-ID: <CAFEAcA9bW7GPT7sz0GVDdYeV3ttxYL+UPUiNjHRt81r+BQRFtg@mail.gmail.com>
Subject: Re: [PATCH 2/4] accel/tcg: Create io_recompile_replay_branch hook
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a hook in which to split out the mips and
> sh4 ifdefs from cpu_io_recompile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
>  accel/tcg/translate-all.c     | 17 +++++++++++++----
>  2 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index ac3bb051f2..ddf334411f 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -88,6 +88,16 @@ struct TCGCPUOps {
>       */
>      bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
>
> +    /**
> +     * @io_recompile_replay_branch: Callback for cpu_io_recompile.
> +     *
> +     * The cpu has been stoped, and cpu_restore_state_from_tb has been

"stopped"

> +     * called.  If the faulting instruction is in a delay slot, and the
> +     * target architecture requires re-execution of the branch, then
> +     * adjust the cpu state as required and return true.
> +     */
> +    bool (*io_recompile_replay_branch)(CPUState *cpu,
> +                                       const TranslationBlock *tb);
>  #endif /* CONFIG_SOFTMMU */

thanks
-- PMM

