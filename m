Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C515BFFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:32:12 +0200 (CEST)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0ll-0004YZ-Of
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazpZ-00076w-TP
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazpX-0006MO-B5
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663767117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/c3Woi5W2xV0OTd3l2JjVM/8sMdVEMDD1w3TmNlsrM=;
 b=jJ9flz4BCn69loAhn4MLQqF60OnWnHCgAF8g9Xc/+GDiSe6KU+7czRzxK7N5uKROlGMVVv
 pmch7eHrdyeLjd4tdfTOBZwe7kxYndPAgnOTWtggAIJZhT5cJ51EZf+aa4KiGSmUJkbrqJ
 aTXlk/EPTkLDC3dCKDSecCFON3AOIRc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-TdzO_czlNbKCncDl3az6Kw-1; Wed, 21 Sep 2022 09:31:56 -0400
X-MC-Unique: TdzO_czlNbKCncDl3az6Kw-1
Received: by mail-qt1-f200.google.com with SMTP id
 fv21-20020a05622a4a1500b0035cc9b4fc20so4133061qtb.12
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=d/c3Woi5W2xV0OTd3l2JjVM/8sMdVEMDD1w3TmNlsrM=;
 b=GCjd9+wmGEFOmTi04mlN3zcESBAfPVy+esWbCzVWCRl5aGxc8o4IwlkItROjAweSMz
 LSnk94dWiNUDJf7xwaDlJy6yai0aCb+Xh/5eTpusL+VhXubtylhswxryzQG/+sqmm8pL
 B19daAFUECee0EkLyV6ezrFUr6+BOyueAQw2WZtTbgiRqXfRTrQw1cs2KjgOxDKghHgS
 DQRn5AfEt+ocmMYnyFkBd4WURfLzu6TMSA5ajrHRJhx3e2XaimomaCXQpmUyVysaM9Km
 uwKKq53YP2+eoKUfFuqgqpLmeKdDlVM6iVz53uqzqXajF6xvuFBh21OJwlsw50jGkqla
 TD4w==
X-Gm-Message-State: ACrzQf1APLA2BqRLbjGPFmpYNkconX9dJPCO6Q3cpP4PnLOdkeCi1ha1
 k04W6RcJq53Vt1x0SyqN5podFHDKM3EkkSssdvQonikr6MJRrEc9NXv7gNN9b6tUGgSaRFz3Ts/
 75o/aZsQTX2FxGQ4GP3ptOc+uGhI5d1w=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13622331qkb.144.1663767115826; 
 Wed, 21 Sep 2022 06:31:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ygHvRHXjQM219j/aHsx3q977yqihSlbw1n+IikYgbf7hDc5/wdIvd3mAl1CsKZn4zARiYT5v21Jz9vUJ+Rlc=
X-Received: by 2002:a05:620a:3725:b0:6ce:e7b3:d8e4 with SMTP id
 de37-20020a05620a372500b006cee7b3d8e4mr13622303qkb.144.1663767115509; Wed, 21
 Sep 2022 06:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-24-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-24-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:31:44 +0200
Message-ID: <CABgObfan_71HjR5L4qsE3r4Paq_=XRQa9Z0tN02fitzX=JBTtQ@mail.gmail.com>
Subject: Re: [PATCH v2 23/23] target/i386: Enable TARGET_TB_PCREL
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

On Tue, Sep 6, 2022 at 12:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>  static void gen_update_eip_cur(DisasContext *s)
>  {
>      gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +    s->pc_save = s->base.pc_next;

s->pc_save is not valid after all gen_jmp_im() calls. Is it worth
noting after each call to gen_jmp_im() why this is not a problem?

>  }
>
>  static void gen_update_eip_next(DisasContext *s)
>  {
>      gen_jmp_im(s, s->pc - s->cs_base);
> +    s->pc_save = s->pc;
> +}
> +
> +static TCGv gen_eip_cur(DisasContext *s)
> +{
> +    if (TARGET_TB_PCREL) {
> +        gen_update_eip_cur(s);
> +        return cpu_eip;
> +    } else {
> +        return tcg_constant_tl(s->base.pc_next - s->cs_base);
> +    }

Ok, now I see why you called it gen_eip_cur(), but it's still a bit
disconcerting to see the difference in behavior between the
TARGET_TB_PCREL and !TARGET_TB_PCREL cases, one of them updating
cpu_eip and other not.

Perhaps gen_jmp_im() and gen_update_eip_cur() could be rewritten to
return the destination instead:

static TCGv gen_jmp_im(DisasContext *s, target_ulong eip)
{
    if (TARGET_TB_PCREL) {
        target_ulong eip_save = s->pc_save - s->cs_base;
        tcg_gen_addi_tl(cpu_eip, cpu_eip, eip - eip_save);
        return cpu_eip;
    } else {
        TCGv dest = tcg_constant_tl(eip);
        tcg_gen_mov_tl(cpu_eip, dest);
        return dest;
    }
}

static TCGv gen_update_eip_cur(DisasContext *s)
{
    TCGv dest = gen_jmp_im(s, s->base.pc_next - s->cs_base);
    s->pc_save = s->base.pc_next;
    return dest;
}

and the "if (update_ip)" case would use the return value?

This change would basically replace the previous patch, with just the
"if (TARGET_TB_PCREL)" added here.

Paolo


