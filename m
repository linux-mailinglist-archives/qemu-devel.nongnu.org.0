Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33645BFD7C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:06:07 +0200 (CEST)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayUQ-0003f8-Jr
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayGK-0006Nv-Se
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayGJ-0002OQ-8N
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663761089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjVeC+tjlej7EINJEx1AaAFCEd67XKVfRoriACue9dE=;
 b=Cev2qVarp5JH4PyplU5U4gsRJefvgB7yUmffk9DFFkpo/OSyxW9tzJIqHqReB/6667vifR
 JNrJ8jxMbvSexghOqtletOqnjMfqKxizmr6Cl0ssKYeugugfN0MaxxxlaMEOFXV7Z5lI7e
 trOO7Lwqpn5rs8uMRFy1JiG0Ux2lIJY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-uwndPc3hPD-mOnJS4EZu5g-1; Wed, 21 Sep 2022 07:51:28 -0400
X-MC-Unique: uwndPc3hPD-mOnJS4EZu5g-1
Received: by mail-qt1-f199.google.com with SMTP id
 ay22-20020a05622a229600b0035bbb349e79so3969235qtb.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 04:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SjVeC+tjlej7EINJEx1AaAFCEd67XKVfRoriACue9dE=;
 b=TDDen8bCdnQFFLMaCRl+Bl64VpD+cH7yUJVikNKW6OpfAhQto57EAIckFzpEKULmDI
 ax+CJD1bTeoc9W7tO3RvNpKjJR8HW4usvmpBfGTku9mDiSfleHCe8FrYHA3svhFy+x3M
 OouSrCUKOR62da5iz6zwVQFjf+RSi7cEa3f6vdWP4k87hSzYNf8fk7MvXyPdsjeVzO2G
 qbW6sMTh1oRpozNIQuJDDtdc6nx9MXgt/Iu0JWtURayPFXsCF1Y5KaWbZFYOH8AfnzKK
 Msyb63qkQibsEloh78b5zEZTjyMhSUSK2Meh/1j2VyWq4PLAJfiXybvbNxgXrAHthMmq
 uE7w==
X-Gm-Message-State: ACrzQf1JCYv0drsw6FfwohN1IUKWypK2RTlDI1pEkikaRfYTis1SapfN
 rXOoAOanU058t68mkcvZ/q4RRQA3HU2VWK++PStEyZ5RiTmjJ0BY1sBp48kgWauQj2xWDPsFcqG
 fxFyMP8wkRteN7wenga2x1Me1zX0v9UE=
X-Received: by 2002:a05:620a:25c8:b0:6ae:2408:6e9a with SMTP id
 y8-20020a05620a25c800b006ae24086e9amr19557621qko.222.1663761087808; 
 Wed, 21 Sep 2022 04:51:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4IRnRhC2mIF7V0zFFxXMutYweRVk+fYlroyC3qUAoNG6/X+eC5VsjNoPX/HoUFthApcv4CxJRKLU9h22Zb/rs=
X-Received: by 2002:a05:620a:25c8:b0:6ae:2408:6e9a with SMTP id
 y8-20020a05620a25c800b006ae24086e9amr19557615qko.222.1663761087574; Wed, 21
 Sep 2022 04:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-4-richard.henderson@linaro.org>
 <4b30617b-23f9-d228-e163-1a7721b20f3b@amsat.org>
In-Reply-To: <4b30617b-23f9-d228-e163-1a7721b20f3b@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 13:51:16 +0200
Message-ID: <CABgObfaU=VE4ZH28d=wCzN437tp1nwFAUhfhuyRJzctzqd1aKw@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] target/i386: Remove cur_eip argument to
 gen_exception
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 6, 2022 at 4:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/9/22 12:09, Richard Henderson wrote:
> > All callers pass s->base.pc_next - s->cs_base, which we can just
> > as well compute within the function.  Note the special case of
> > EXCP_VSYSCALL in which s->cs_base didn't have the subtraction,
> > but cs_base is always zero in 64-bit mode, when vsyscall is used.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/i386/tcg/translate.c | 26 +++++++++++++-------------
> >   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


