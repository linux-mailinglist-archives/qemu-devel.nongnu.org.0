Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD13883C0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 02:28:50 +0200 (CEST)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljA4u-0004jF-TD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 20:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljA2g-0002od-4j
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:26:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljA2e-0006DU-HG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:26:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id s6so13239209edu.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 17:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAQ08oYs89I4TbVNK6w+ekqo1eDIkQruE598GJs3z4A=;
 b=rUtkGTsWEda6SGNea2nfrwdIRACdI+U+xEGLfDiH+QHdSOEANyQO17P4+DaxAjTssm
 2bin2Wi2e2I21FcZ+MXoM6TdVi/ozyQcAAU+yTI3Fe2YH2dM8nCwHtfybMfsFehre2dg
 SQrcsEwXtrz6q7/+FUu5az8di4YPHrpF15mIcXSKVzFlZaWPmqaz2Df7mQKzSRiNR8CU
 vOYz74MVP/wH6wPPMYtLChFPepFJsM1tNoSbapZre4ndKQKwhipqKrBqF6gBqSsxPFXV
 /Q3qBi5QRIltFW0GAHbbZENU4HNChWeaBI9AiZCr+vTU+Cnzj4fr+eSGoUHJvfedIO8G
 37tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAQ08oYs89I4TbVNK6w+ekqo1eDIkQruE598GJs3z4A=;
 b=R+loGUmorrWY/+Lp9RA9cP4Y6/XrLnpvPtxIfQZ9uzrQgeKMoNXwAHNB7jvzyexq/U
 0WedVYnOYIyZIHshQ/X+HVeYMgql7uyctdWKZfVk4ZnM3PxdxWQpBKfy8G38tC0pC4cV
 HppsuZ3VKQww8eGoUCuK+iR1PPrfok1fn271pRchcmlRpCi8ul9WdQ1WWMC0yVjXCjgv
 a/wbwXRlES+twQdN2Fa7mOgXdArkvo2qX73R0CpOuoFXEyODKRjoG4s5v9g++9GKgJEQ
 iDMQjhNRzw57VRL7FlFta3JAKXB/vjDUUXRf1eFGTH161vBRQTAd8CJIkdaazfD/tXGF
 jvqA==
X-Gm-Message-State: AOAM530UxAKuZiIKw7GV/UREvFyj+ye+rHI9+JwxbqTa3lvRNsHVVFZr
 GTzex4DYmZXdI69ffBLq3XCWg2vK00ggBPzm8zE=
X-Google-Smtp-Source: ABdhPJx5x2XCqu+z+p3xczM6PU1AS2msc/3rinz6dg3j9snXq5NzrhbJeYGq2io7qM+vcoCo3YfCdmmeulsYuUXPmEA=
X-Received: by 2002:aa7:d801:: with SMTP id v1mr10122586edq.349.1621383984993; 
 Tue, 18 May 2021 17:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210517205259.13241-1-jcmvbkbc@gmail.com>
 <28fe6216-b6e7-36f8-cbd7-97a880ab0a44@linaro.org>
In-Reply-To: <28fe6216-b6e7-36f8-cbd7-97a880ab0a44@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 18 May 2021 17:26:13 -0700
Message-ID: <CAMo8BfLpR6-i20NhL3Oz5L26zn_mXLTEprHxPrAKXmXfEcYvPg@mail.gmail.com>
Subject: Re: [PATCH v3] target/xtensa: clean up unaligned access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On Tue, May 18, 2021 at 1:11 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 5/17/21 3:52 PM, Max Filippov wrote:
> > @@ -1784,10 +1770,11 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
> >                              const uint32_t par[])
> >   {
> >       TCGv_i32 addr = tcg_temp_new_i32();
> > +    MemOp al;
> >
> >       tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
> > -    gen_load_store_alignment(dc, 2, addr, false);
> > -    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL);
> > +    al = gen_load_store_alignment(dc, 2, addr, false);
> > +    tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, MO_TEUL | al);
>
> You're duplicating the information about the size of the alignment.
>
> I think it would be better to pass the partial MemOp into
> get_load_store_alignment and return the complete MemOp.  E.g.:

That indeed looks better. Let me make another version of this patch.
Thanks for taking a look!

-- 
Thanks.
-- Max

