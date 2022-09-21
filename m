Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F35BFF0B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:39:51 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazx8-0006Pj-KK
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazVi-0002zw-Mq
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazVh-00027v-1E
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663765888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZOCkv/SX4mKYSjkgZW7VHX8ve1HftGh3iXNHqQ34WI=;
 b=bP4FG2npRCC6vW+SG22gINCmsD7OoOp0yQFvUyV9PK97hiovHAGGi/uTJLGOmqfw69Gevc
 SJRoMINABSD/tDeFVhzSJy7tZWBcVBN42z3NV4it9ygeNAxlZazkQ+8G6q1HXCcfwcky/L
 lrxsnWW9IwNj7MUTipadLM1gbQiZr64=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-x4Gx6IA8NEyHoM-l46hRyQ-1; Wed, 21 Sep 2022 09:11:27 -0400
X-MC-Unique: x4Gx6IA8NEyHoM-l46hRyQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so4178848qkp.7
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oZOCkv/SX4mKYSjkgZW7VHX8ve1HftGh3iXNHqQ34WI=;
 b=uRoGZQzmHIJItgDhSVWwKxvsaBvUTmVZzTbeV/DIcmllGUTsUu8x5vG3m3xR7TuwHU
 EyJWV5b1SUq3WlNlm8ZHiHxl8gZlBtJdUcjPp22wlDBesB9LAoaoAT/FsbQuPTWBSdGE
 5lxN7lr+n4K+DEpjpY+O/S+XTpo1vmHbYSxi5B7HnJ6pi/2kfR4+O+KfAngJwS3YerYz
 Nfv9MberZt0xT1HZoj4Zs2zvJU48u6Y+ItXcQcZSiwVYk7Rp09/AKLd0VKYF3MXe7759
 bGnAfdEaEQLAktILRPPVSFHO5zk3ZKiHDcz0etqIgXfX7YLhSOCPckZLaKpvaqTxisqX
 qANg==
X-Gm-Message-State: ACrzQf3Ij4oMjnfPuK9vJ5gXZpwGuXz73oXQdBMMk3jgcfgcVxpU3rDx
 4gtBgID/neSF6Z6tmr1air5trdrZoNpVXFxH1t2exw8u1xeAW5Yz/C46KguRRbFofIbX8ID7LSj
 zgTTK3g2SBzms98PR/DUw/O5R9t/kMhc=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23320591qtb.456.1663765886407; 
 Wed, 21 Sep 2022 06:11:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7UQUb1vouUPd7fJuzZj/+SAS43yczBl0QUJuZ9rHSrSfXpFeqNg9ahEr9/f4gauRFAOjaoUuTEYJqARBkEEz8=
X-Received: by 2002:a05:622a:1a02:b0:35b:bb29:fb86 with SMTP id
 f2-20020a05622a1a0200b0035bbb29fb86mr23320567qtb.456.1663765886109; Wed, 21
 Sep 2022 06:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-22-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-22-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:11:15 +0200
Message-ID: <CABgObfaujCVbfmC5c4ADu=drNdT7kr2-BfggAw0ei+A2fK-mvA@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
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
> With gen_jmp_rel, we may chain between two translation blocks
> which may only be separated because of TB size limits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/translate.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 7a9e533c6e..97a5f7e432 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -8740,6 +8740,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>      case DISAS_NORETURN:
>          break;
>      case DISAS_TOO_MANY:
> +        gen_update_cc_op(dc);
> +        gen_jmp_rel(dc, MO_32, 0, 0);
> +        break;
>      case DISAS_EOB_NEXT:
>          gen_update_cc_op(dc);
>          gen_update_eip_cur(dc);

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


