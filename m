Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F276EB923
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 14:20:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqCCU-0003Tc-Qg; Sat, 22 Apr 2023 08:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqCCS-0003Sm-UJ
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 08:18:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqCCR-00040c-6y
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 08:18:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-506bf4cbecbso3785509a12.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682165920; x=1684757920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olq2Iw1bu3q4xAYIhVO2KrCUAoToZDpug6n30m7Mu64=;
 b=aSe778bXwBHBF3DvFn0Vb8CE5D8kDDWlMkYPQVa7CV700TZbkL8qvtQp72sCkiS0QH
 DZQQrfs5ROVrPOvyqELnUM8S7b7gPFBSNrGksUzIAvwMbwFz5tmldw1Hxi4YlZVqpY5k
 cw+NrHTRrAd8/WxajOk5bdLCNJdf36LbDSA9D11b1/2O/pYGRfvDKK6M0ghYawETQSfd
 XiipBfzn/f7HGh03+getmfuuGH5ylULsmc0JDOaHctYaPoP58Cv6rpr6HGZQpq+48kGR
 BSA5tP/+Ss4/nTRRdCm5odXMN7M06lPUlOYAKEsRPgPhsxzdk2nRuAUtPCmKWSx1rUHl
 Ylxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682165920; x=1684757920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olq2Iw1bu3q4xAYIhVO2KrCUAoToZDpug6n30m7Mu64=;
 b=N0U1wSttn1vBc59X0J7/uUot/28bcI5YkPgGBplPTtkjRCo+epXRJqQk4p0N/QBJc3
 dYw5PGlHzFIikTaVGN9KJH7eSewm1gkgFEcFHtLFQzMNYzfEpLHsKGPkUsGPJzGnGvGm
 Ed3VEnfE4kavRfBdqAafaDGcMsAKH5aVxp1EeQXiS4P6DJK15gNf6i94VYgRWCL4CiKY
 ZaBTZ+SHbQjsaHq7yboJSGLfOkrRj+0aj81kcpQqmWDyt9kfcNTv6hNYViwToS9ptLZI
 X86GOrLzuZTy4RMgPB44Ydg33qJ83dXOz+hBjhMJk0x94/78Ovz5PgvFfd9S3cNVH1ST
 phmg==
X-Gm-Message-State: AAQBX9ecVTqbdsWAsm8XqToCpITxDqeHK3ut0y6UUqELcRx+aZPPRhVN
 FkeisCFu64jCd0z1g/DTZmt2vvE0O3BUf8ujE8NRgw==
X-Google-Smtp-Source: AKy350YnEu77RPxELJti94c5a5HR3MLv7YhFZci/RXk3KRRyUbURTIBXPCJF9uq5UH5iNF9F6iBvyyN57azvCKdbPQU=
X-Received: by 2002:aa7:d699:0:b0:502:6e48:65ea with SMTP id
 d25-20020aa7d699000000b005026e4865eamr7117972edr.12.1682165920295; Sat, 22
 Apr 2023 05:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230422005808.1773015-1-iii@linux.ibm.com>
 <20230422005808.1773015-2-iii@linux.ibm.com>
 <d3aa2548-cf1f-4cd0-8be8-80d376981969@t-8ch.de>
In-Reply-To: <d3aa2548-cf1f-4cd0-8be8-80d376981969@t-8ch.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Apr 2023 13:18:28 +0100
Message-ID: <CAFEAcA_Sjgb=DYKmfreBGdwnymxs0tw7pqJsM14260++8+RdiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/tcg/multiarch: Make the system memory test work
 on big-endian
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 22 Apr 2023 at 12:03, Thomas Wei=C3=9Fschuh <thomas@t-8ch.de> wrote=
:
>
> On 2023-04-22 02:58:07+0200, Ilya Leoshkevich wrote:
> > Make sure values are stored in memory as little-endian regardless of
> > the host endianness.
> >
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/multiarch/system/memory.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/=
system/memory.c
> > index 214f7d4f54b..8ef6666b440 100644
> > --- a/tests/tcg/multiarch/system/memory.c
> > +++ b/tests/tcg/multiarch/system/memory.c
> > @@ -121,6 +121,9 @@ static void init_test_data_u16(int offset)
> >      for (i =3D 0; i < max; i++) {
> >          uint8_t low =3D count++, high =3D count++;
> >          word =3D BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
> > +#if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> > +        word =3D __builtin_bswap16(word);
> > +#endif
>
> These looks like a usecase for cpu_to_le16() and friends.

I'm not sure this test code has direct access to those, but
the general principle is right.

It is particularly odd that we carefully manually put
together a word by shifting-and-ORing together the
various bytes in it, and then separately do a byteswap.

thanks
-- PMM

