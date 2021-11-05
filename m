Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B447446789
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:09:19 +0100 (CET)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2iM-00033c-BT
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fp-0000kK-OK
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fo-00068L-1z
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id d5so14778953wrc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PgBOXjWRT4ilK+CvYVA0tU2Ura/yDjQ/Gts47zKEik=;
 b=sfQkZTYt6TeabH4oq038/ICp7Hlv4RGHRTJPuz1sIljSxOlXGRk0QHiZZVPzfEqy29
 Dd6GtD81gsNgcfYybyNYNMiM/s51v1kuA0gTD2+LcoTBJgAgBRQ3siW0tqtAIQE6BPBH
 L0YwS7ux1MzL0vuddp36xDxvng+ir11Mc5VzyC58w68Q1ZFm6TrVjH3+BP85D65yHsw1
 iwp74OMX4a6bBvL2iTf8UuulHjA6Ln3NdSv77gAA3zj/Mg+Ptoi6xmmVY8wmOgbebwEQ
 iZTzg0lG+jcr1pzjxkb2vKqLD8VQrrDLNc+iSPAue6zhO2T/OebjfkJqdkJTU3Scq/0C
 FXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PgBOXjWRT4ilK+CvYVA0tU2Ura/yDjQ/Gts47zKEik=;
 b=m22Qh4bPzZ1QjXp7gf4x4uWFgrGDtOdSJzCuh53wWmDKYX4XREAke8ygl+cJtsNo0n
 uWmCyFqdB0X9ag35nRW8fPkH5/HGItUYoaJXqtk/KRljaXh9Ggq9HOdSR2LTJC59HFYd
 2QhkC8F6JqEPo0qXlgNhux4QTNu/jl5xHjFRo/BrlYTYIBi+geHyV2cdG5iNWuHB/C22
 7YSZLSlGSn7F7r2UPrNMUvPsLsdMHcbEPxGWkNuM68t2S2gfdBEHZh4YNZtibgXOPcg1
 5Tmp31tsz3jGVLYjEjQWc5d9yyb2cCJSijxjN2iDPAWDl+OFEMkPrNiVHbj2YXTmh0Z4
 feQw==
X-Gm-Message-State: AOAM530TRYZoNwS5O69sreREp81yU3yg3Isx2QcyrZ/MN4rV/th6AlTo
 WPcjoLY4rBpPGGE39iamchJVKM27isgMTh014ummjg==
X-Google-Smtp-Source: ABdhPJxfuvvag7Rdf0IK0E2zVKYNAMheH3czzB9Bb+Ybkzch5EavyYsNQpDtBNiEckHgfFVK/7R9oh+8xm9+9x30xcM=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr68501471wrt.275.1636131998799; 
 Fri, 05 Nov 2021 10:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-3-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:27 +0000
Message-ID: <CAFEAcA8S3Ov35k2WEZqTR7svnjRZZ=GfGhpMLp=bsiB3vGH22g@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] target/arm: Hoist pc_next to a local variable in
 arm_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

