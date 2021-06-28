Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DE3B62A5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:46:43 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsX5-0004Vq-16
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsUv-0002lF-03
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:44:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsUr-0005wb-Es
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:44:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id o5so5370729ejy.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65VFurEdwp2i9qxKQhL/KHUmOSG7bsugd6zDxUKqlNY=;
 b=wt/TMBah3CPAwOmuhlMZMaj2WBXhlT1I9BsEtkyHQly6LpCxXgUMbMbEbi9icY6Ard
 2tV2EL3k/fDvGxL+BV8Em3fSNHzVe8rjrZ/uyNJ+KIw9DxjXwwC7sQVIM1cY+XYi1PAE
 +Uxr9sHW3CftvPnAFJHb6vJ7OjIdtMbN1Mz+oyMduQrKidLafQNkm+5S8O+cxRdiAQN0
 bkiBpUUCeVFV5qBfXnnAHkBqzUY9sJ75enw4gRU25niKeHGl97tr5ce9LaL+FljanqeU
 jMZdO5+/PqfExI+tqQADNTBY3UqHhquHcFQI5RS+jK+0JnlWqZ9KKGzvL8o1wy3iJ8Mo
 MLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65VFurEdwp2i9qxKQhL/KHUmOSG7bsugd6zDxUKqlNY=;
 b=O3JDnBEAfv5DkpvvDuCOmr448Fnol5Ccu4qNeU6eFxI5E2dhS8qbzBiN634OBVB2ce
 jU7GQOKCF2gGikebPmszoAdLhnI/mdOE+kHUIY2SgSzrkeTp73ZF44B3ZLNPvyxhSjgl
 kxFfNLVdSU2sGtRUca16iNUawTUZIEol3HRkJd/0SqBFEwBsuhfvu4OlOCdz6In9tVMd
 mKyGvldq8HloZVt9ptwJZs5M+7CDvMOzSd7c9XFn9ncMaAFBoyrc6GA6QpeZzHxWcSMA
 LGXHaNViXP/OaxQHKkkzYPwB8GR0NQWa1TCBqKnazRy3IiI7Fqnu6dIcuM5p9zOuis/F
 9q4w==
X-Gm-Message-State: AOAM533/Pg6JLZZS/LDHw+bQPqs7Gbgu/mXUP53NC9rNfKFu6C1b0izs
 y8UCEmd+at4qjG1XILO7ZmSjR+avSoNC1krUiy/BQw==
X-Google-Smtp-Source: ABdhPJx8hVl4GsInewrvQZiCgLA/TLWkLek31Dg0usl/bJe2zDxd1eNSWWfMXg5GdYOOSyk4Pz6e5ov2qrT4F0ql3FA=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr24884820ejc.482.1624891463950; 
 Mon, 28 Jun 2021 07:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-14-richard.henderson@linaro.org>
In-Reply-To: <20210626063631.2411938-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:43:47 +0100
Message-ID: <CAFEAcA_HiW05hA0wC-DGNSpnH-L7p_cj6ZFvAWpA0GQBcZvMVQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/29] tcg/s390: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Jun 2021 at 07:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
> easily provide the extension to 64-bits.  Drop the special case,
> previously used, where the input is already zero-extended -- the
> minor code size savings is not worth the complication.
>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +    case INDEX_op_bswap32_i32:
>          tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
>          break;

When we're working with i32s, is the top half of the host register
zero or garbage ? I guess either way LRVR does the right thing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

