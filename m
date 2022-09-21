Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B049C5BFE1B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:42:43 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaz3q-0001NJ-OM
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayqM-0007hG-7v
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayqJ-0002Ea-Hl
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9tnzD2ISigPBkWBKK/M1VClQevxtBQOZgRTbcpx3kI=;
 b=R3anuWKcrd/sOUGVM0xktdD9NWl51Y7KKP72Kz9YJqkvmQRXyGlYc+WsN3jMsOVYbz+D3q
 3WyMDuRePq+WreCFf4KOPyXAuWMnL3eRk6NuE5UrLZA3Rzjfyav8fbiwkvzCW3Ii6+44fg
 imc6Jw0AeXECl9RkTTFaidCh+iTdMro=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-OcvqHi_0Pg6GU-NZL_lcFg-1; Wed, 21 Sep 2022 08:28:41 -0400
X-MC-Unique: OcvqHi_0Pg6GU-NZL_lcFg-1
Received: by mail-qt1-f198.google.com with SMTP id
 w4-20020a05622a134400b0035cbc5ec9a2so4038907qtk.14
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=s9tnzD2ISigPBkWBKK/M1VClQevxtBQOZgRTbcpx3kI=;
 b=v3eNxEVOMvV6k78CdcM2zwT3pcDdNsyjwybUqw4XNNt4I7ZGSidHwqTXBdpfAXXIod
 +r6XGzAk9YzbDlDRdvLtkJMhNcH252ZX/GzSJbrBw2PoQcxT8XcOsNSDmlDXl1P8R9I1
 bpyxSi7/MUycKqF1vkuoGoNNnWT+7zsO6GIUAkaONuqHz7KDvuQ4leIGRoOPkrtp7OSy
 6v+ZlZZALKnk27t+72Op4HpRhBk1YaI3WtIIkgw+n44zzd/HIl8mXyVEq0YHi3+kmzGy
 rGqHorrWOcVPKZYpIXuj6Hu+GgJrbeYE3bu2z3cXJ4dPJ89b1HU7evG6y+3NcMJwqDtP
 ZRRw==
X-Gm-Message-State: ACrzQf0J5qGP0UOWUUP8KLpQZ4La6rijETXxU5wsMMfbMEmtDNxG9lQE
 ovzDZMqXB8cU/N/tq2q/YnaLgoAHQ7NnwxVKG9wEqscOf510aCIBULQpqXdlFXVZSQX1rv8my/5
 dC5tiC3RP1bgA6qFkCDO3kFdwRJYCAT8=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23149644qtb.456.1663763321171; 
 Wed, 21 Sep 2022 05:28:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Kf6O3XUvtG1VfHkwMhcpo3zU45F9U6H10EnppHFlm9Ox+EtmBUfLLgXMJrgdnm8H5ohRfVyekwXm4uke8i/c=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23149626qtb.456.1663763320905; Wed, 21
 Sep 2022 05:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-14-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-14-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 14:28:29 +0200
Message-ID: <CABgObfbduu=N3ZiH2nVNin-6jM-hajmCu6S-DDYmB1ycMtW95w@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] target/i386: Introduce DISAS_JUMP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
> Drop the unused dest argument to gen_jr().
> Remove most of the calls to gen_jr, and use DISAS_JUMP.
> Remove some unused loads of eip for lcall and ljmp.

The only use outside i386_tr_tb_stop is here:

static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
{
    target_ulong pc = s->cs_base + eip;

    if (translator_use_goto_tb(&s->base, pc))  {
        /* jump to same page: we can use a direct jump */
        tcg_gen_goto_tb(tb_num);
        gen_jmp_im(s, eip);
        tcg_gen_exit_tb(s->base.tb, tb_num);
        s->base.is_jmp = DISAS_NORETURN;
    } else {
        /* jump to another page */
        gen_jmp_im(s, eip);
        gen_jr(s);
    }
}

Should it set s->base.is_jmp = DISAS_JUMP instead, so that gen_jr() can be
inlined into i386_tr_tb_stop() and removed completely? If not,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


