Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2B5E6B40
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:50:34 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRHN-0006M1-O2
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obPBT-0002OY-UU; Thu, 22 Sep 2022 12:36:20 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obPBO-0005Vn-8W; Thu, 22 Sep 2022 12:36:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 77383CE22B7;
 Thu, 22 Sep 2022 16:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBA4C433D6;
 Thu, 22 Sep 2022 16:36:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mTIp5zLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663864566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5btsL7T9dzOBYg12OD1NNGxACn1Aa20hqoQLedh7ts=;
 b=mTIp5zLMYWUTBoPfaNska+0keHYvIpEWCr6Hor6+KpJxhc9mJhP8XPRAAML6yuBdu/2xd4
 qh6MaUf8fDdvT8fTYMymy4qi0F5EhpYLt3uoDQf++llSRO/+51BK3XN531wv/7r9n1OMmf
 hhB9zWsZOV5byBMLnHcJDZS5qJ2U6qY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0bb110e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 22 Sep 2022 16:36:06 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id z14so3871099uam.10;
 Thu, 22 Sep 2022 09:36:06 -0700 (PDT)
X-Gm-Message-State: ACrzQf0az/4h31tNEakP6wrZh5h7aecJjJjKEapp30ddcqqwIH6+xc7o
 G5RR5kJGFDb4we8QZ1w6r6mJyxP4tx0mEejcksQ=
X-Google-Smtp-Source: AMsMyM6yUllYIOSO3bLtXGcQ0Kz9vqipnI9N/e+8nKlSWJG0SaXPjbIunboT2l/+PFU3OAvDXvknDlOqrbSAdGzY6Y0=
X-Received: by 2002:ab0:6035:0:b0:3bf:2e26:699 with SMTP id
 n21-20020ab06035000000b003bf2e260699mr1916590ual.102.1663864565240; Thu, 22
 Sep 2022 09:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
In-Reply-To: <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 18:35:53 +0200
X-Gmail-Original-Message-ID: <CAHmME9pqFvYfat1yki86_x1k0A7x4eA0f9q=UeLaf+AOGV=Taw@mail.gmail.com>
Message-ID: <CAHmME9pqFvYfat1yki86_x1k0A7x4eA0f9q=UeLaf+AOGV=Taw@mail.gmail.com>
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Thu, Sep 22, 2022 at 5:55 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 22/09/2022 17.38, David Hildenbrand wrote:
> > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> >
> > In order to fully support MSA_EXT_5, we have to support the SHA-512
> > special instructions. So implement those.
> >
> > The implementation began as something TweetNacl-like, and then was
> > adjusted to be useful here. It's not very beautiful, but it is quite
> > short and compact, which is what we're going for.
> ...
> > @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
> >               cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
> >           }
> >           break;
> > +    case 3: /* CPACF_*_SHA_512 */
> > +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
> > +                            &env->regs[r2 + 1], type);
>
> I have to say that I liked Jason's v8 better here. Code 3 is also used for
> other instructions with completely different meaning, e.g. PCKMO uses 3 for
> TDEA-192 ... so having the "type" check here made more sense.
> (meta comment: maybe we should split up the msa function and stop using just
> one function for all crypto/rng related instructions? ... but that's of
> course something for a different patch series)

Maybe just commit my v8, and then David's changes can layer on top as
follow ups? Checking len alignment, for example, is a separate patch
from the rest.

Jason

