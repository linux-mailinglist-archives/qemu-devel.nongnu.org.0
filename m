Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2159A3F48A8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:29:35 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI7Cw-0003J2-6S
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI7BY-0001wg-JG
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:28:08 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI7BW-0007zO-Rq
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:28:08 -0400
Received: by mail-ej1-x632.google.com with SMTP id h9so35979275ejs.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxUwvMUQza1G/oaJ3Rf9E/eCNuvUnPBz2ARZVrani5Y=;
 b=pfgNfemjGu0HlsRj3xti0bGxVA2wMrKheNnnU2pO/bUpDCVcY9xONJXOvfLC5uNgBT
 DGNKOrqWMBi3soCydVEUm22dzdvOdfLq9sVe5EHy5pgNfISMdE/E1KsTAR7k5WnxobhB
 ctUDsBaA2WvLi9ezEUiF8PdlSuWY+wOnQK6TQW3DbtohMI8EX+c5QrynkcZkNUc5C1GO
 8+qpsK65pOb9+I+u9hb4yG5ZEtq+03wxkKpdy3nbXvhBRcbUOfVgSgKJqc8Jr8pc8c6X
 e1HK/+v3pl/b/PWRAtCoLzULUIG+zhKvDNoD/PmgmRz28lW62h99V+zTjbFiEs908yQ6
 hIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxUwvMUQza1G/oaJ3Rf9E/eCNuvUnPBz2ARZVrani5Y=;
 b=H0HikD5E10Polu+SlD1CunQCiKYkLzzUx5/4JMPbQll8enM0HGEoSBgEN8N/UEyctL
 vFym4Yo517GRE7uPvU0lcLVd5kuo05at6onFVAMPmEWoVKOyNwfmcdYXrep8HX3IaPus
 H5le205zF3DdOGMZ/PUcc1spVskUBKC8VlcMid/twFCe/TJWUzzLU+auw57l2NDH+wSq
 fi+lDE9+Ac+2xTM1uvHLOfchthZhnw9Ko61fRvWnAsLB6kJS5xKFNDVEOldaxjKYT3SH
 2eEyGZRadSjDOs2lXH0cduiFEK4oZo9xUDdq3BjcLbtpiV9u6nfymnla9dSTnQp6psho
 dg3Q==
X-Gm-Message-State: AOAM532Fqbc3MfuL0Ocgsl1pKcPDCMYJIG98rEvDOi6sTYi06n2YN8ti
 HQmINR0SgTKeX/FWAog3V9EZSqmQ1D32S4vde3exSxmluDg=
X-Google-Smtp-Source: ABdhPJxyYZBRfZopZX/UT7t0Qx/SUhsjjS4ENmDmjHPjVW31Enn8488B/yNYhnoETtAFJn/NzkazPm2Mcz8eGDTpDHA=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr34066903ejb.382.1629714485366; 
 Mon, 23 Aug 2021 03:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210820171220.15089-1-peter.maydell@linaro.org>
In-Reply-To: <20210820171220.15089-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 11:27:18 +0100
Message-ID: <CAFEAcA-vG4DJY7Xm8zhs9ZdMspzSrVC53nUwzNRm8ZepM1UaAA@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Remove unnecessary checks of b2 in SSE decode
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 18:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the SSE decode function gen_sse(), we combine a byte
> 'b' and a value 'b1' which can be [0..3], and switch on them:
>    b |= (b1 << 8);
>    switch (b) {
>    ...
>    default:
>    unknown_op:
>        gen_unknown_opcode(env, s);
>        return;
>    }
>
> In three cases inside this switch, we were then also checking for
>  "if (b1 >= 2) { goto unknown_op; }".
> However, this can never happen, because the 'case' values in each place
> are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> cases to the default already.
>
> Delete the dead code.
>
> This check was added in commit c045af25a52e9 in 2010; the added code
> was unnecessary then as well.  this commit amounts to a revert of
> c045af25a52e9.
>
> Fixes: Coverity CID 1460207
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Somebody should double-check this, because one assumes Andi
> added the code for a reason...

It occurred to me that maybe we'd be better just changing
these into
  assert(b1 < 2);

These are guarding all the places where we do a dereference
of an sse_op_table*[x][b1] and the inner table only has 2
elements. So asserting would be a sensible guard. I'll send out
a v2 patch that does that.

-- PMM

