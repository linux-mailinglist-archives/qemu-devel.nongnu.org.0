Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD56C5BFEDA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:19:16 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazdD-0002Wh-V0
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazWc-00043p-0L
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazWZ-0002DU-30
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6X8UR8++NuceI7LDJbi+luFd46ZRlve4an1uy/niZNg=;
 b=CMPlvVjCxFWIlb+Jp3Ski8z7TbaYxLPE2Uo5Gml4s1wrtfXnFDad3OZp4tnsfn0ON2R1gV
 Aj5aQ7s+FlJexnIs8/9i5NmKrn37dCYjRMJZNDxBiAa2vJp8ANQy9iDhSNRmIUGwWfvkL+
 fmZqoLTbHMNPcBhFaxGRFo4sL2JKd1U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-qZLmq_HBMkWu6IYw4_ogYg-1; Wed, 21 Sep 2022 09:12:21 -0400
X-MC-Unique: qZLmq_HBMkWu6IYw4_ogYg-1
Received: by mail-qt1-f199.google.com with SMTP id
 ew15-20020a05622a514f00b0035cb76e35e5so4072964qtb.7
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6X8UR8++NuceI7LDJbi+luFd46ZRlve4an1uy/niZNg=;
 b=xHJEB5NpjRNp4IhV193m2da85E96Z5MaqToHAM1RhZMZsOZ0uLAjGm2cmK6TCDEPRF
 cx0Ssoei2gNwZi2DIROvNHpQRR4uuBg3SE9C2/X2oDRNaMf0vGaRv74KzwgjsrDkmt6V
 mmXkRkWRIoBM/OOqu/tW8CV0CZg5KWUsisdNcBMebKDD/oi1M48OQc5obYz0WpXV8NJX
 9lmr2le4QAaFPe3t/5pT8SmuIDsfDC788hwlo08RiRnzGkQGFCgn6tCdMM5YGz+Vj11W
 zd7TkC6sZFP2ngnocJnqUGf2WCVW+Sp8UdqdtE0azxwrH2Q3aH1xMGayhPq+jsk/ha/3
 UW0w==
X-Gm-Message-State: ACrzQf3wIHGcwOgbPcTpmZWpmc3vkF4PwtwRqvOXLcGgkdhLlRUW+Bgt
 0cGdZqnK0dqEcQC7w5JmNdAv+BJaGs0DbccAXMljB1Zi0yHpUjSdU/95hcJ/INX87ZXDLqqws7/
 PW8qYdbo07N8Fis5TVxZcYPBS34RmjA0=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr23009337qtk.422.1663765940478; 
 Wed, 21 Sep 2022 06:12:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DBmjYZ4zQgFckRMw+ZQP3YWE8S4X/UowYQ/8bRnPZ0EhGQo4dPSbFU6/cAXBmlCurD8iSUS8gHD4o0Jued7c=
X-Received: by 2002:a05:622a:1755:b0:35b:a3ad:6283 with SMTP id
 l21-20020a05622a175500b0035ba3ad6283mr23009312qtk.422.1663765940202; Wed, 21
 Sep 2022 06:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-23-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-23-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:12:09 +0200
Message-ID: <CABgObfZAoC=-etWqZy9vQzLOaqw3PuiwW6baYjhXaPxvJ-XvzA@mail.gmail.com>
Subject: Re: [PATCH v2 22/23] target/i386: Create gen_eip_cur
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/translate.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 97a5f7e432..39bcb7263b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -516,6 +516,11 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
>      }
>  }
>
> +static TCGv gen_eip_cur(DisasContext *s)
> +{
> +    return tcg_constant_tl(s->base.pc_next - s->cs_base);
> +}

eip_cur_tl() for consistency with eip_next_tl()?

Paolo


