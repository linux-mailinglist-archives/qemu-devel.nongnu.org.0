Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028965F1A75
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 09:05:47 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeWZH-00065R-2y
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 03:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeWX1-0004g5-8X
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 03:03:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeWWx-0001EF-Ge
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 03:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664607802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jUl9DfnQb6CY7KktfZ+lqA8nZV5I7mToUGU7pEZZgg=;
 b=eyt0+Eo2PyMuy82ztCkxHhEhgc+F+dT42zY6mgb0fySqQBrDz+XFkYu6tGwwoBnJeTwyRw
 aD9FDqQFfZFYBPvSzBNfJh5sLDlWZYYBpFNPsN/xjM4AMpaqjtOA5PEKTN4/kqCfu5eD4+
 qYBhIEIHo1FWf3Kk/1bEU13zvxmQtXw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-IUh7fCkrPweOgcu0t1_dtQ-1; Sat, 01 Oct 2022 03:03:21 -0400
X-MC-Unique: IUh7fCkrPweOgcu0t1_dtQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 z8-20020ab05648000000b003b48415d88cso2333416uaa.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 00:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8jUl9DfnQb6CY7KktfZ+lqA8nZV5I7mToUGU7pEZZgg=;
 b=rW0zOZmbM6Vono759Oz86mP8g6oFTCve53q9meG16+/Kr9NfJ2KJfmZZQLTrATnHon
 KRQPBtuXj6ng7ON/PnywJsyVjTI8vT/X5qYkTfAfz8qprysZYRECw7nr5Xmw7v78vw6t
 2YMZkpFaWtAbJR9XwPGeReSy7LqclxuCmgcNwY2ejjSGITs8AvziuUvjIdGY05Ys78Fm
 70qdh2gbVldjFdUOmvRkEw5+nNzhbr65eue14jSbHfcvxW/Fh6FimE+JLdJFExeVxQkp
 raNhBM2urkD7vVlq7Oyz0JMgZAEFX2emFwgSbfSsyWaPqQ4PINyhIoZI2Sw6VqUloqNn
 OLFQ==
X-Gm-Message-State: ACrzQf32saTiKbmpaTcLTgg/I97GGSHM9KBz3W8rZq3Ut+DuUlYtDNgC
 6uWcEBS4160uAm5Litm5e49CjoIcAc0Pp0iatndcTIiMz7iC6UQgQGtIVL/ogmzYnCnKqxYTAyD
 rW9gjFu+YQue1Kst4Ph7SbYSyDdtb1lY=
X-Received: by 2002:a1f:1f85:0:b0:3a7:f248:ee56 with SMTP id
 f127-20020a1f1f85000000b003a7f248ee56mr5730309vkf.3.1664607800875; 
 Sat, 01 Oct 2022 00:03:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7OuTXcmMMUx6zOMzIGabu9uras4LbK1mrMztQylvib2bLfdV4UxJ8cIVtpxrQuSpf4ZhHpuUmJQfuH9Ol+hh8=
X-Received: by 2002:a1f:1f85:0:b0:3a7:f248:ee56 with SMTP id
 f127-20020a1f1f85000000b003a7f248ee56mr5730305vkf.3.1664607800608; Sat, 01
 Oct 2022 00:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-20-richard.henderson@linaro.org>
 <CABgObfa3RE3o6cfUk-7qagubCcxUO7J3sFfp63O5z08-RQHBiQ@mail.gmail.com>
 <fba2a072-e50f-4321-d923-07500d969b33@linaro.org>
In-Reply-To: <fba2a072-e50f-4321-d923-07500d969b33@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 1 Oct 2022 09:03:08 +0200
Message-ID: <CABgObfYAQQ5hVg0iDdU+Lro=4_Q=tbPS7=4MtpvJvUVp=QJynQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] target/i386: Use gen_jmp_rel for gen_jcc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Sat, Oct 1, 2022 at 3:04 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/21/22 06:09, Paolo Bonzini wrote:
> > On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > > +    gen_jcc1(s, b, l1);
> > > +    gen_jmp_rel(s, ot, 0, 1);
> > > +    gen_set_label(l1);
> > > +    gen_jmp_rel(s, ot, diff, 0);
> >
> > Might be worth a comment that jumps with 16-bit operand size truncate
> > EIP even if the jump is not taken.
>
> Hmm.  But is that correct?  That's not reflected by the pseudocode for Jcc.

No, it's not:

int main() {
        asm("clc; data16 jc 1f; 1:");
}

does not crash (it does with stc) on real hardware, but it does with
this series applied.  So the various occurrences of gen_jmp_rel(s, ot,
0, 1) or gen_jmp_rel(s, MO_32, 0, 1) should stay as gen_jmp_tb(s,
s->pc - s->cs_base, 1).

Paolo


