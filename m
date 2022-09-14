Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973675B90D3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 01:06:59 +0200 (CEST)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYbT8-0000LZ-4k
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 19:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYbMX-0006qx-9z
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 19:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYbMU-0005MX-2t
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 19:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663196404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FOJrYFD/JjggleuQHEzUpsZuCDF9od+PJpXtU0geh8=;
 b=Py5U1FRTgfZnK+JZKuaRoCcg1pDQiFRUD7KFOwi/ROEOSzL3vXzbhLE597h1k3NFcf8Jxb
 801wqvaU+/1HJnGt52qM2gOPtfICLym7Rv6k33TR0B20ELxgIAa7tMD6gk+Jn9BJcjMEtx
 vZL4ieVZ7tcKZUY9aZVE+SSKgvz0ZPw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-1G9ZigrTOfKZgupPO0VPJA-1; Wed, 14 Sep 2022 19:00:03 -0400
X-MC-Unique: 1G9ZigrTOfKZgupPO0VPJA-1
Received: by mail-lj1-f197.google.com with SMTP id
 bx10-20020a05651c198a00b0026c1cdb5b4cso2122518ljb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 16:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6FOJrYFD/JjggleuQHEzUpsZuCDF9od+PJpXtU0geh8=;
 b=h1QtjcPEwKZW2l2xBLfmVaepQ4ag70JbnXVv/nl3lN69N1729RDaix+0XwRUxGys3m
 oh6+erQZcsxWBg19drArjKRZ/HvmWGZc/JHEG9BvvJqxUU3qKBv6SWlF4uBd2JFxdkA0
 i5/xPethUoBU1av4pi5DI7uT5F4izbvFMMovrgPWuUn+wYGmBfoX9HnOUyexNCt4KZvh
 TQ8bJNM7J2rjZLu/Tm3EGC9A8yp1z/8LNAv3Bt1gnEtqs87KAM8xbkqFIpvXDAjfExuZ
 ANr8dUSNmZPZFuZmOGVCqy7vC2BleFchvhv4eM90i6t+tYTt4mTwc4IIx18sIRlQrZU2
 9j2A==
X-Gm-Message-State: ACrzQf3vyFo/VxvbU90ckCETiAK6RHIF2BnLEiZCJbQ/i/XNZ/I3lgXa
 dCFVcSXPXq0SdFv4+f7YaW44DnGJsr6TciwS3HwRGvsnDngJIh1X8cDaYOmLAyyq+Iv+ulB3Tlo
 xAa8bTKrmcHAHQCnnBkQ3bpf+RnPM1/0=
X-Received: by 2002:ac2:46e3:0:b0:49e:da0e:a353 with SMTP id
 q3-20020ac246e3000000b0049eda0ea353mr164923lfo.7.1663196402048; 
 Wed, 14 Sep 2022 16:00:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XXVXEXlcki/p90I1z2vE2PjtUdE7D5Int8Bc7p1cgnfqtHjlqJyV+tr+fjMF6bzwlonMYJqAldPQP5aPOMRY=
X-Received: by 2002:ac2:46e3:0:b0:49e:da0e:a353 with SMTP id
 q3-20020ac246e3000000b0049eda0ea353mr164918lfo.7.1663196401788; Wed, 14 Sep
 2022 16:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-28-pbonzini@redhat.com>
 <58a3c681-a46a-d433-38b5-37c03515a3c9@linaro.org>
In-Reply-To: <58a3c681-a46a-d433-38b5-37c03515a3c9@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 Sep 2022 00:59:50 +0200
Message-ID: <CABgObfamzmohqhBUa+r4nzJxmYUhfz+8H2W3B3rjWnZxux9XLA@mail.gmail.com>
Subject: Re: [PATCH 27/37] target/i386: Use tcg gvec ops for pmovmskb
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Sep 13, 2022 at 10:17 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/12/22 00:04, Paolo Bonzini wrote:
> > +    while (vec_len > 8) {
> > +        vec_len -= 8;
> > +        tcg_gen_shli_tl(s->T0, s->T0, 8);
> > +        tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
> > +        tcg_gen_or_tl(s->T0, s->T0, t);
> >       }
>
> The shl + or is deposit, for those hosts that have it,
> and will be re-expanded to shl + or for those that don't:
>
>      tcg_gen_ld8u_tl(t, ...);
>      tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);

What you get from that is an shl(t, 56) followed by extract2 (i.e.
SHRD). Yeah there are targets with a native deposit (x86 itself could
add PDEP/PEXT support I guess) but I find it hard to believe that it
outperforms a simple shl + or.

If we want to get clever, I should instead load ZMM_B(vec_len - 1)
directly into the *high* byte of t, using ZMM_L or ZMM_Q, and then
issue the extract2 myself.

Paolo


