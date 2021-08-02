Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCC3DD5C8
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:38:01 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXCi-00078C-US
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXBp-0005sS-8a
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:37:05 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXBn-0008Ld-Mu
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:37:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id g21so4983820edb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmKtBa9fyc7qjRpHH3J5yqPHkK2KJifQsGEJ7PbRq5A=;
 b=NvbtZaDlSyAZY0ErsSrjM3nqhNECXt6Dsln14B8xD7LEWMRELAMgYfSjbtzaOB6nmO
 wFRwcaFD3xblbAKh03JPwJiPd/lebV2vFeRm8AMe8S1KGYwB/2brUxom9YugVMDJzmKD
 +gu+IGB0BhGsWnR7vieCXRzC7MnnzvCYS8eo3HzruBKldBJhaVp9T8Kl8BrCJ/5bD9Ii
 zrbtoLivbBe91NqWA/aXk2e0a1+7HVuFxE04SWiLZAird0KUvYHRnfWAzXbTaRpHN9N3
 SPBihFpxELQxZvhW3H8Pwe3HScQTCBNJnkfQ+FOryn4usW6h/eBRPMX4YJCjwP8qvA5t
 Vk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmKtBa9fyc7qjRpHH3J5yqPHkK2KJifQsGEJ7PbRq5A=;
 b=dzY7/l6ZEGr8kOjpve6UXpbYRtBibV7QFl26y1X+1uyq8yk9iDv/EUhcw4BvPlI0TK
 GLlVZ4Vy320cYUbIYOI/IZGFHJ3cpniWvHl+8UdA9Hf2ROs3NRDwwjKdHQ3mq+KbEAa0
 e35JmJGFdHaC8kn6GoIosCcQuRS+MVIeasW6eHpQ4nSeQnobaa9JxobmowpbydhALsAN
 EFof6krhyiuNZI38m6/NO0XzuuQyHOM1at96eOTAWGhgvnJ/N03hnw2FMBBnaJ/3fqKb
 twg52QGBfXKBYsMP/r9wC6xepXbF+jEiQwDDlv2saAtz2tlBzesXor5yTITyE64ixVAt
 jiqA==
X-Gm-Message-State: AOAM530oWFvIvmy7l4W6FX2x/w+fo1zr6voXZtCm2EN5VUinuQIghZGJ
 cb9fGc2FA8FF++pq8Q+RhzBm+ydVOAVwajLk3nMPqg==
X-Google-Smtp-Source: ABdhPJy6GZgN1ztMdFLq5HpUhG2nsR3BOa9N/8xhmTBFFj+/Kle/FyjSZ8ZNRzwfA13Hzs+h2nj/wwNavdAjiy8UUbk=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr18685056edt.100.1627907822116; 
 Mon, 02 Aug 2021 05:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-5-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-5-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:36:18 +0100
Message-ID: <CAFEAcA95XPt-2oeKM1gCCRDOjAyf4m0vkoQNGwLZk4swo4gDAA@mail.gmail.com>
Subject: Re: [PATCH 4/6] coverity-model: clean up the models for array
 allocation functions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> sz is only used in one place, so replace it with nmemb * size in
> that one place.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-scan/model.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
> index 1a5f39d2ae..2d384bdd79 100644
> --- a/scripts/coverity-scan/model.c
> +++ b/scripts/coverity-scan/model.c
> @@ -178,13 +178,11 @@ uint8_t replay_get_byte(void)
>
>  void *g_malloc_n(size_t nmemb, size_t size)
>  {
> -    size_t sz;
>      void *ptr;
>
>      __coverity_negative_sink__(nmemb);
>      __coverity_negative_sink__(size);
> -    sz = nmemb * size;
> -    ptr = __coverity_alloc__(sz);
> +    ptr = __coverity_alloc__(nmemb * size);
>      __coverity_mark_as_uninitialized_buffer__(ptr);
>      __coverity_mark_as_afm_allocated__(ptr, AFM_free);
>      return ptr;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

The real g_malloc_n() returns failure if the multiplication
would overflow; I guess Coverity currently doesn't have any
warnings it generates as a result of assuming overflow
might happen?

thanks
-- PMM

