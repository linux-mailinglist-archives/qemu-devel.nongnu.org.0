Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF95C6E5FDE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:31:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojXj-0000CY-6a; Tue, 18 Apr 2023 07:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojXg-0000Ap-De
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:30:36 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pojXe-0000Jk-SE
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:30:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so258753866b.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681817433; x=1684409433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XchKrNC7MDnASk5zAguAUjVvYixzm90kzpWHwgue84o=;
 b=iCHYYDnuS7NOqctB5QKdVNAtEjPpbzk7GnC1/7hMiSlBCLtj6Depq1hAuCT4TlCRi5
 15j+t1QLMZroQOWI9F9gffhR015W+/RwxNOHea9uPBRcXXFGEWYuGmtiNZo7DZ/T4M8A
 bAeO7MYevr6lFOM2ToD4J3GTt+0NzrjSB9s7hv5jA41GLfGz1+D9v9esiKpd6rFuQNi2
 8fHMuTp0E6e4xo0cAOPZuapzE+4aPkTeT6Y2LiIZqr7raUouSDRkYtCCBGI8LpmzW1Zo
 gGRXv0tuimWDlr5ExBcVXmuUUTh3PqvPPvisL83QwJA4r+VKnXRN7te7/lB8u+R1uQl+
 /3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681817433; x=1684409433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XchKrNC7MDnASk5zAguAUjVvYixzm90kzpWHwgue84o=;
 b=N6089d/K0ca2WLdZggG07UfrNR8WgfLSs8VzdbwvZ4pF3oEtSEs/biinwvF2BQnPeR
 qby2GA0IqIRyvZSoyCRAFMiJXrYS/Bo7Oo2PzgRSbZsqtd6lhiuugGg0d3sA1eACFv1a
 nA+1BACscq92OPzntrG2vUkmRPGZsOFxcbwnR+beZ7WS2et2Qnzv4kfqwYgMW2ZPCwoW
 MynKTu96E/tQKoE3Pemv+NvLR8z1r21Z7dnF0FNIlypqb3qYe1gYE+Z11TieaKxkwX2b
 a+1yEYLZgrqaq6tnojpVDsNo1YroKuAOli08WM3lCupGfVxKCsZ9pgovQZoKZfNCCKS7
 OKGA==
X-Gm-Message-State: AAQBX9eHNIF0dDzXeJzs42yR8Z6eSkxAIf3+ZJoRLl+/oy2A0ePXyXP7
 UTf86dwslb+o4auhnbFc+BQl814LW258NQs5zQ2Ong==
X-Google-Smtp-Source: AKy350bh4G1FiUbfan/6ttkvNimyHHfd9YIG+mJPdwf+9GAfkpEqQhlc4rBQGWqRIVfP+cJ0WCJ0PaQ1fr0kaS4Twhs=
X-Received: by 2002:a50:9e4d:0:b0:506:7dbc:39a0 with SMTP id
 z71-20020a509e4d000000b005067dbc39a0mr1035132ede.6.1681817433204; Tue, 18 Apr
 2023 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-3-peter.maydell@linaro.org>
 <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
In-Reply-To: <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 12:30:22 +0100
Message-ID: <CAFEAcA8EOrEs=ivv+skKy+e40BiiD9qDP-KFakfgk1E=y89NVA@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 18 Apr 2023 at 12:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/14/23 18:04, Peter Maydell wrote:
> > +        /* Check if page table walk is to secure or non-secure PA space. */
> > +        ptw->out_secure = (is_secure
> > +                           && !(pte_secure
> > +                                ? env->cp15.vstcr_el2 & VSTCR_SW
> > +                                : env->cp15.vtcr_el2 & VTCR_NSW));
> > +    } else {
> > +        /* Regime is physical */
> > +        ptw->out_secure = pte_secure;
>
> Is that last comment really correct?  I think it could still be stage1 of 2.

I borrowed the comment from earlier in the function, in the ptw->in_debug
branch of the code, which has the same

   if (regime_is_stage2(s2_mmu_idx)) {
      ...stuff...
   } else {
      /* Regime is physical */
   }

structure as this one does after this patch. If s2_mmu_idx isn't
a stage 2 index and it's not one of the Phys indexes, what is it ?

-- PMM

