Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0EF409622
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:48:42 +0200 (CEST)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnGD-0005bY-Pg
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmqz-0000A5-4H
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:22:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPmqx-00066n-Lo
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:22:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id y132so6807066wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35uQoY4Q4y9EDz8ZvvpU8PTgWIzZndf4tiLrgn2j7u0=;
 b=GNS/8mKSPvabsksf6/5dBY1tRPtODceSEGsQYwa+YJEnWdqbymnA6ljeqs8loQjbGS
 3yuRWBaA9e4QIDCnldzeyTq0GfPxDfpy+FCzC49Ed08dkXujyAoYgcdVuiIM7hk0mvCK
 p++EDq5LihVRwUoFFBv6vtJiv3TisgpVaRdt0UZWQylUQKT66d2RKxS0RgHyj7l3El8+
 weJQ9+8aUZ4rpuzftmJ2A3FRosJNr66GzclwdYsn6HlHHm8OXJmmOrYF7GOGx2HvVDuB
 w1KurvYdTG5fICCz71cs75xlxvNlh3CUV5RqKywEtD12njFInI7Ituds3aql0AZO1EpJ
 rLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35uQoY4Q4y9EDz8ZvvpU8PTgWIzZndf4tiLrgn2j7u0=;
 b=lTI+/QHlq+iWYaxqaMFS948oJfTorJ28lvanVFuV3h0up2uH8/BScGB/mTh1OfKNgf
 NbsKpK9JkGhbmXR6aqulMqNvT957A736gWdsF/2wMJe/aPC6TKK53Ot5tqvJREwQKaFo
 VGChYYSaSzPkwrZHiOyrSB4uAmhDOkmf4569wY7rVYDlpBkhVfzMoltISV8RMu5za+Dt
 jvtG5zFp+SmGu5NWxeDRFSPw9le381VktIURDxeK1VKVuOLwxretJlQFnohhslc7QqHd
 RAtWfCYmDNWIWwQNcOooQ544GfzRf27DU6rDgnL9HmE43tAYZiQyOL1BV29HZmZilkVr
 Dhpg==
X-Gm-Message-State: AOAM532RvJLQCk2MhQDdmBJ3uCMo/8eVexPpx9Wu+i72dEe+pRUPEex6
 tEs2B5zDeFhxqYO9mkFLq4S0wYxBpx9LmqRv0SEE9w==
X-Google-Smtp-Source: ABdhPJyw7i9nNJG/qE+UuY2AypFF6LBfi87iynneRLHRLmcDkymQNvM3tgojMD3s12Jt31S92N6Jv967XGljqGYPjgA=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr11536164wmj.37.1631542954165; 
 Mon, 13 Sep 2021 07:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
In-Reply-To: <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:21:43 +0100
Message-ID: <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL,
 VSHR immediate forms
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 14:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/21 2:54 AM, Peter Maydell wrote:
> > +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
> > +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
> > +{
> > +    /*
> > +     * We get here with a negated shift count, and we must handle
> > +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
> > +     */
> > +    shift = -shift;
>
> You've already performed the negation in do_2shift_vec.

Here we are undoing the negation we did there, so as to get a
"positive means shift right" shift count back again, which is what
the instruction encoding has and what tcg_gen_gvic_shri() wants.

> > +    if (shift == (8 << vece)) {
> > +        shift--;
> > +    }
> > +    tcg_gen_gvec_sari(vece, dofs, aofs, shift, oprsz, maxsz);
> ...
> > +    if (shift == (8 << vece)) {
> > +        tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, 0);
> > +    } else {
> > +        tcg_gen_gvec_shri(vece, dofs, aofs, shift, oprsz, maxsz);
> > +    }
>
>
> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.

I'm not convinced the resemblance is close enough to be worth the
effort...

-- PMM

