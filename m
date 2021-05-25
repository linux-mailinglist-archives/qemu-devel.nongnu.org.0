Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBB390419
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:36:37 +0200 (CEST)
Received: from localhost ([::1]:55776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYAe-0001H5-Bn
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY78-0003i7-8x
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:32:58 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY76-0002L1-ET
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:32:57 -0400
Received: by mail-ej1-x631.google.com with SMTP id s22so47468715ejv.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vZ0MtvGDrirRRYqI51+gRMjVOF9jZCmPQ4dryIlJEfE=;
 b=mH79LG2mc3fE/GquuUPwsYyr54zgANdVRPH3U0BrF5uFtB9CBP6FbG9JgUkOZrVdai
 ZUN54zK+2swdxepIFHLwOVazl7V0SBMBKC+qnEpIduqry43Wf3U2jA/2RPNoc4nskE9P
 mMnRl2UaLNBPTAitxydOJexzPPXN0rBbJ7Whp9zTUj3uI80NYyxFVeu5U7En6VDQiGmw
 rPwCSGDjHvax0XDlD2vNOFREjtp37JQqAvAbQ9HWgVzfEEgZEKx0KMKnsH3z1uxXkbH2
 L0R1qU5wliv/ozixLS6rL5fJK2XDp/OX9RaKWsd8mDuGLAlxhNVEjAMplH3LtyhQgSYL
 SBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vZ0MtvGDrirRRYqI51+gRMjVOF9jZCmPQ4dryIlJEfE=;
 b=qpnppLAKHHn/1OlpfAqPv541KwKP93wx0UGLv9nFVDugYrVktYgP2g2t/8yp1dVdu0
 DTsHNzdTOHEx4ieG2pMaPAr2cFhpoQuCn3wHtgD6/1W5TQOu/DMu4eu38ww0siSTQERN
 uwB35T73xC5cigg0qiNRusGYLk3qnHvRCutPn47r/Bs/RG2kMC9JwwluNNImCr6x3h1c
 F9jH16oce2AvLZqyavu39I10D79MhyuoQvbEbnM4xWWAKCqvoC4KF2u9Jn73oDxVrqYz
 4Nr4bvzA/GhUu+2CvglrlwJudSD7+sVtX1BxJn2WI+PncStYvZ2kUncOvja2WXyH0zS7
 o52w==
X-Gm-Message-State: AOAM530RT5VXDThshOcpbJEz+RDkxjHEkUZL5r8jZ8yt02kStMPfDe/C
 nAzfb/aCEsoM6A1fvn+IMUywQYJ0fgFhEP4cgpjm5A==
X-Google-Smtp-Source: ABdhPJwgHZYJclFehIpTXvSsFNl08bR6/P6aVCwIrGwtFJeZaF/h2Q79uqMMoW1E2SSpOpYXSgmEYDYGlwWOIdxTofs=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr28594607ejb.407.1621953174718; 
 Tue, 25 May 2021 07:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210509151618.2331764-1-f4bug@amsat.org>
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 15:32:31 +0100
Message-ID: <CAFEAcA863+SFfx8bV-zpw+ZUNAQsSJt_Gm3OA7i83dhPCviRaw@mail.gmail.com>
Subject: Re: [PATCH 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 May 2021 at 16:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Richard,
>
> I tried to make sense of the multiple changes in your patch
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg805595.html
> by splitting it in multiple trivial changes. At least this way
> it is easier to me to follow / review what you did.
>
> The original patch description was:
>
>   Add tlb_flush interface for a range of pages.
>   Call these tlb_flush_range_by_mmuidx*.
>   Rewrite the_flush_page_bits_by_mmuidx* to use the new
>   functions, passing in TARGET_PAGE_SIZE for length.
>
> If you find it useful, fill free to take / respin / reorder this
> series, improving descriptions.  Last patch certainly deserves a
> better description ;)

Thanks very much for splitting this patch up -- it made it
a lot easier to review. I've added the commit messages
Richard has sent, moved the last patch to earlier in the
series, and applied the whole lot to target-arm.next.

-- PMM

