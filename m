Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5C5B8E34
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:32:42 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYWFc-0006sS-Is
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYVoj-00055y-Li
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 13:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYVog-0004sp-2l
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 13:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663175084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wynrFe8HhEAkqMprKpntfTuWdN4/7aWsklxGAJaYxdY=;
 b=XlfXqi448Gu4HdgiDsFf4r4AwDCej52SEdD+QRI377VCY+J0clyD5M1Jfluhr4zMl71oET
 CCZ6FSyLv/fshtsyKnWpp2YP/kr1cmG4TOdnhzqoQYWs9zWiBw7WrUivPf1wLO06uacile
 JcsdNiI8XHH/L56HhpkC7n0II7z6J+I=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15-60edXQhXMZinz5FFelYaIA-1; Wed, 14 Sep 2022 13:04:42 -0400
X-MC-Unique: 60edXQhXMZinz5FFelYaIA-1
Received: by mail-lf1-f69.google.com with SMTP id
 a24-20020ac25e78000000b00497ad54b081so4734016lfr.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 10:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wynrFe8HhEAkqMprKpntfTuWdN4/7aWsklxGAJaYxdY=;
 b=skIiDUXY9NwGyzm+tC5RgDKp6QKI8ppluWiSW2cTH12GF52BiTpTZMQWuLpEz9BZM/
 ZoCW9O707xT2fWdaIXjbAKtERU36r+FShEYp4d96UrHCGAbllGFrFeJKvaUEhOzwNVHC
 picxBr/F6z7AX/tVfYiTfGW6Ms7Xi/VH7YlzFIFBhlNp8+9qTB+dSCZhK3my6bsFJUyn
 7yR9zXuoxqoQsCRQ3efMGR/rv0xxgoXg/Ghq6KZhiY38s16UszH7NERx9dFOs6HMtDNZ
 49RVuIE9SCPI0WEF4Uar/uDMw0EzfgrkGun9Arr9+IUCcMdWZS1winjyQE56yUKGtpQx
 kUSQ==
X-Gm-Message-State: ACgBeo1wM2rqRefMAw/vanoQ3N6I7Xow/zb+Oq8cK4XLhuATvVl9YHNm
 lhbOsL6xnx3fhLcZPZ1Au9k4boFTewAxSxR3PqURlP86acWfA1FNP1Hmh+RcIwpJx2K/4j2mFeY
 Me4vWHhg70Q0ga/IQzPYgl6iMNVFAsvk=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr11408113ljq.205.1663175081396; 
 Wed, 14 Sep 2022 10:04:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5HqrMKE9dyQQMw8KEgueppQQJV73TUfNzfuuOSjKoqK33ySzXFWwpSJa8+OQKlykEnzqExUiL5URtgAM50OP8=
X-Received: by 2002:a2e:a98b:0:b0:25f:d9e9:588d with SMTP id
 x11-20020a2ea98b000000b0025fd9e9588dmr11408106ljq.205.1663175081139; Wed, 14
 Sep 2022 10:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-29-pbonzini@redhat.com>
 <ca5cdbf4-81c3-78ef-c395-b9ccc3cd20f1@linaro.org>
In-Reply-To: <ca5cdbf4-81c3-78ef-c395-b9ccc3cd20f1@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Sep 2022 19:04:29 +0200
Message-ID: <CABgObfaLms4s-YhbGhOmCQ_S0UWSggHvVEFDXPZsXcX16Lv3aA@mail.gmail.com>
Subject: Re: [PATCH 28/37] target/i386: reimplement 0x0f 0x38, add AVX
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

On Tue, Sep 13, 2022 at 11:31 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
> > +void glue(helper_vpmaskmovq_st, SUFFIX)(CPUX86State *env,
> > +                                        Reg *v, Reg *s, target_ulong a0)
> > +{
> > +    int i;
> > +
> > +    for (i = 0; i < (1 << SHIFT); i++) {
> > +        if (v->Q(i) >> 63) {
> > +            cpu_stq_data_ra(env, a0 + i * 8, s->Q(i), GETPC());
> > +        }
> > +    }
> > +}
>
> Any idea if hw will write incomplete data if the pieces cross page boundaries, and the
> second page is invalid?  We're not good at that for any other vector sized write, though,
> so not critical.

No, I will check.

> > +void glue(helper_vpgatherdd, SUFFIX)(CPUX86State *env,
> > +        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
> > +{
> > +    int i;
> > +    for (i = 0; i < (2 << SHIFT); i++) {
> > +        if (v->L(i) >> 31) {
> > +            target_ulong addr = a0
> > +                + ((target_ulong)(int32_t)s->L(i) << scale);
> > +            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());
> > +        }
> > +        v->L(i) = 0;
> > +    }
> > +}
>
> Better to not modify registers until all potential #GP are raised.

This is actually intentional: elements of v are zeroes whenever an
element is read successfully, so that values are not reread when the
instruction restarts. The manual says "If a fault is triggered by an
element and delivered, all elements closer to the LSB of the
destination zmm will be completed".

Paolo


