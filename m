Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16E5B8DE5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:12:23 +0200 (CEST)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVvx-0008DC-Up
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYV57-0005FW-Gq
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYV54-0005jy-Bu
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663172258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OH7sNps7nEGOBGZMxDy5XpDQzZuvZSuH2pEBMnaF9OM=;
 b=RJUOF+f1IS8O6KlqjVarT0pkRaJPjb0nQ/1VrozuvOnM+JywivsxvC2icqNao4WHuduOGZ
 iFdx52UrXolE2doJq0KqnY518pSDYEqIrN9jgHjab2g7HIcbugJ+qByxJz4UtZQE4rAXnC
 /ztNH88EdhSiPW6WqK+A61owysrhAUI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-zGrl33mWMxif_v06QsKYQg-1; Wed, 14 Sep 2022 12:17:36 -0400
X-MC-Unique: zGrl33mWMxif_v06QsKYQg-1
Received: by mail-lj1-f200.google.com with SMTP id
 z34-20020a2ebe22000000b0026c18a910fcso2055414ljq.23
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OH7sNps7nEGOBGZMxDy5XpDQzZuvZSuH2pEBMnaF9OM=;
 b=6xBsKeI2tyuYooYjUibE/xwbUBOVGtV5KTI9wVMM6rwR3XN4NQtc8w4tF4OHNwaP09
 1TvyKV7c8JaN6sYGP7mLzfs1RydYiq87ZEEo4bVR9Po0ALCnHEnpsqaIkGLRT6f2VSIZ
 DDRqjCUOM5J1Y4TMnvt8FQsazvJhOMi/+ATb+BN38CtPNZ2HqVl0MvLCHM0v5cMoPicw
 o1k7zUTieh0+oinX+RiwiKUHVz7FsSKTfejwJFMqx1zMkYVbXCr7Yb0o1NH8DO6seYg/
 nuAZZ5oRMT7ViglANUj9oPceA8lVj3S91tDOGu+NBBDyIHFe8RLfsREEYtMbmKRhNYxz
 Havg==
X-Gm-Message-State: ACgBeo0vjIclElzSlAghMl7Ve0ukrBHwkHvnA0bu62h2XjXOnzaMvLYm
 JuHP7k3K53+31JWAP70qkYWLb9nuMo5whZ/7l6xKIA+fYUkOgubDrnMigp464WlQTWMbDyuN26E
 2Up4QuYwhrtYqWTSPjH1/RQUxX18fyaQ=
X-Received: by 2002:a2e:a7c6:0:b0:26b:e7b4:5136 with SMTP id
 x6-20020a2ea7c6000000b0026be7b45136mr7352928ljp.425.1663172255295; 
 Wed, 14 Sep 2022 09:17:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tANjX2SF11wQD7Cpkfbo7DV9eVDwmF/v3cQd0GWFBMyldlzKakxxe9puRh7fDyRGuUDJEzssnL8TSkA1PogA=
X-Received: by 2002:a2e:a7c6:0:b0:26b:e7b4:5136 with SMTP id
 x6-20020a2ea7c6000000b0026be7b45136mr7352921ljp.425.1663172255053; Wed, 14
 Sep 2022 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-24-pbonzini@redhat.com>
 <e87ec571-3d79-3a4c-ed60-51fbd0c7b005@linaro.org>
In-Reply-To: <e87ec571-3d79-3a4c-ed60-51fbd0c7b005@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Sep 2022 18:17:23 +0200
Message-ID: <CABgObfZNGnpFqD3JqEhhxnvquSX4ez=5YV4oDjPDipSbH_NS_Q@mail.gmail.com>
Subject: Re: [PATCH 23/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
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

On Mon, Sep 12, 2022 at 3:56 PM Richard Henderson
<richard.henderson@linaro.org> wrote:

> > +static void gen_SSE4a_I(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> > +{
> > +    TCGv_i32 length = tcg_const_i32(decode->immediate & 255);
> > +    TCGv_i32 index = tcg_const_i32(decode->immediate >> 8);
> > +
> > +    if (s->prefix & PREFIX_DATA) {
> > +        gen_helper_extrq_i(cpu_env, s->ptr0, index, length);
> > +    } else {
> > +        gen_helper_insertq_i(cpu_env, s->ptr0, index, length);
> > +    }
> > +    tcg_temp_free_i32(length);
> > +    tcg_temp_free_i32(index);
>
> Again, why the choice of delayed decode?  I guess it doesn't matter, but it's odd.

Mostly because I wasn't sure of which would be preferable so I tried
different things. I think now I have a better picture.

I will mostly switch to decode_by_prefix.

Paolo


