Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DA587E22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:29:28 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIstj-0000nK-Qs
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIssS-0007kG-RQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:28:08 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:45920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIssR-0001qe-B7
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:28:08 -0400
Received: by mail-vs1-f54.google.com with SMTP id m67so7163414vsc.12
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=7U3e2dDcMVTbINccnwzI52nuVRwp+WItDZF2nMHWlRo=;
 b=G7dSEwzK4RQAsk8cJeXFFjstup2oD65yXR9gRTyKYZgzHH1oQL5Z7IhQ4pejHLOcwl
 8vy59HbR9EikTdzJ7KlqQCaHQtFDCaIY5rmyZPrfRlLjfIyjkTOVeQwyTeKag/1ytUCQ
 DqCA1WN7N2xwBK/S6ZTkyKEpIk3huGaMg+3mTsFCgNdJDwK6qs+Vo3FQlxvCVpUitoM2
 WoR8GHQLQwD6ez1KB56/cumk8OBu3lH7y0va8ABRNIfjzUzrBJ/5K817Hgsl4HA5mNle
 ACRxw+cBb/CvGdSylioRmTeiYP1hYLtdMA3mH9uoaUyn/BNyOeFmQlN7vQQzi9340Wbg
 GCxA==
X-Gm-Message-State: ACgBeo1lRsCvscoisDueel9kXO00JzCwDCa1708wmo/N0UHgoC+eAdol
 c9M7F7eruzafzff9qwNWulRsigGIfk2uxcjQJVW9BKTE
X-Google-Smtp-Source: AA6agR7q25KcIUJ5kfzusXQ2Lzo6rKZ9k/hdqeT3QGobzVkNI/UGVvybFFhNdsOYaRIrug++UeQ4lyP60j8KqMwFy9I=
X-Received: by 2002:a67:ab09:0:b0:387:ebbb:848 with SMTP id
 u9-20020a67ab09000000b00387ebbb0848mr1365138vse.23.1659450485220; Tue, 02 Aug
 2022 07:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220730021844.124503-1-richard.henderson@linaro.org>
 <7fb76578-6cf0-3b25-63ea-2e9dce7b3716@amsat.org>
 <ea8ad12b-66fb-7173-3e29-ffd7be3cd2b0@linaro.org>
In-Reply-To: <ea8ad12b-66fb-7173-3e29-ffd7be3cd2b0@linaro.org>
Date: Tue, 2 Aug 2022 16:27:53 +0200
Message-ID: <CAAdtpL4nzyVtZy5hY8k42Kj7B2WmYDtJz3LUT_sf-CAhULgL9Q@mail.gmail.com>
Subject: Re: [PATCH] target/mips: Advance pc after semihosting exception
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.54;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Aug 2, 2022 at 4:11 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 8/1/22 23:48, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Richard,
> >
> > On 30/7/22 04:18, Richard Henderson wrote:
> >> Delay generating the exception until after we know the
> >> insn length, and record that length in env->error_code.
> >>
> >> Fixes: 8ec7e3c53d4 ("target/mips: Use an exception for semihosting")
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1126
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/mips/tcg/translate.h               |  4 ++++
> >>   target/mips/tcg/sysemu/tlb_helper.c       |  1 +
> >>   target/mips/tcg/translate.c               | 10 +++++-----
> >>   target/mips/tcg/micromips_translate.c.inc |  6 +++---
> >>   target/mips/tcg/mips16e_translate.c.inc   |  2 +-
> >>   target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
> >>   6 files changed, 16 insertions(+), 11 deletions(-)

> >> @@ -16098,6 +16095,9 @@ static void mips_tr_translate_insn(DisasContex=
tBase *dcbase,
> >> CPUState *cs)
> >>       if (is_slot) {
> >>           gen_branch(ctx, insn_bytes);
> >>       }
> >> +    if (ctx->base.is_jmp =3D=3D DISAS_SEMIHOST) {
> >> +        generate_exception_err(ctx, EXCP_SEMIHOST, insn_bytes);
> >
> > Hmm this API takes an error_code argument:
> >
> >    int error_code;
> >    #define EXCP_TLB_NOMATCH   0x1
> >    #define EXCP_INST_NOTAVAIL 0x2 /* No valid instruction word for BadI=
nstr */
> >
> > Now we pass bytes. What about adding an extra helper?
> >
> >    void generate_exception_err_displace(DisasContext *ctx,
> >                                         int excp, int err,
> >                                         target_long displacement);
>
> These error codes are specific to the matching EXCP.
> We don't need to introduce extra storage, I don't think.

OK, fine then.

> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

