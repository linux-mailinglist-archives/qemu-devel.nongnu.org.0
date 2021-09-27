Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1B4194D0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:09:10 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqNY-0005RB-RR
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqGr-0007xq-HJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:02:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqGp-0000Gw-0E
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:02:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x20so7142692wrg.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6/uh5sm0QPzxKzXrNYKYumBlBoF14TEfWgJ4MPm1Uo=;
 b=gdDAOExB2GRTnY/zjMF4d1awUu85qgiaWsrC9sbCh8dsiEjXggnzogu6H6EANFx6U3
 l6mvtXpBLie2IrqNbXC/N90a2FFLhpl4zvlOAfVcSXW2wKjTsVfLgiKRS4EBKM8bg26F
 tepZ9g7SzVRbJ5gHmOTFzn3eKmzz/7WwD5KbBz7iMpxjY3kj5Oi+9TA8MiMxr/wE5dNY
 GaM37LNC26KsSEtWypXOx32J01jnDx3XUg+vg8efxlJFt6/7qrP6R20Q3c1B/zS5eRY4
 jMqGVQogd9ChSWN5HeF6AjWTo+tw5Jv7fiP55qW0WV38oN9Z50sxy4w8MfUhTxx7W4cp
 2Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6/uh5sm0QPzxKzXrNYKYumBlBoF14TEfWgJ4MPm1Uo=;
 b=HvL0e04Kyrdhs7WrxhOo+x5eKbHYq51yRPgm1HRvjft2cgq8hh3tXyODlOpiSz5mXq
 RX96raTd4Joz5mjHqI/inR12nxlJsq+S2oYpCzvsg7JeJ0ZX0mfSK6eI391VCjMG4yi8
 G5r+AGZjGQKpyc7Ym+pOCbcIz1aWoikYCSw0gXUGsNUFQ36L5cXRhgmicNEmgRwShlJ6
 U0pGBhpu4Wec3fW17ibbmVLVotuzA8v9goS9j6JIE/p6xQjJ49X/RYAR8nRZlpAlaNlZ
 JTRbUPPpo7YY25osy/erfpcGbwt/m5hoyX1bvBYwcllzvuvd3jtjBG1fdVRG9dh8ya/B
 1aAw==
X-Gm-Message-State: AOAM531mmH74igHuuQObQBvoIHnYQJsiq0eTYRlUQIEBLV13E1NP6iq2
 CAKE0Vf6nfR3bNHjabcU/WgZl9AGfb61Ob6t6jG/Uw==
X-Google-Smtp-Source: ABdhPJwCgISVpiwCNF09e5xVlN+UcBqciHSYLbgb6rjxPOX7bQJvU3TBRZsDnnVx5Zqqzo4qnmjIE36CV0zQKaw7kLY=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr19136182wrn.275.1632747728493; 
 Mon, 27 Sep 2021 06:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-12-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:01:15 +0100
Message-ID: <CAFEAcA8JiY1abWig8q6YFTCNCop1j85C7iwbtN0+SdaV7UVazw@mail.gmail.com>
Subject: Re: [PATCH v3 11/27] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER
 not set
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This has been a fixme for some time.  The effect of
> returning -EFAULT from the kernel code is to raise SIGSEGV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

