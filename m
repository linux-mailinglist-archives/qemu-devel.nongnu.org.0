Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9955BFCF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:39:11 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67gc-0004Vq-2g
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o67dR-0000aD-Mb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:35:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o67dP-0007ue-Ut
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:35:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so6364835wmp.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fsbTZ4A+B2PXhDP3sNDOQgQqoUp7jw73U/vNBsyo9qQ=;
 b=o3rdgkVOrML/2jyfUiNtCOhirtZZmuh2TiWDK7l8AVdeZsUd5VffR9JfklwFpPEkhe
 GVZaZgprHHW8msNzI21T8ieVi4GB8DaN/arbiXXopShqpXaanr+WtuaeDPaBVzVfap/r
 8Er5c7/Hv/Y/5v7Z6c/KYfaimTrrux8dGZLRGhWnI0PE/knxocFgJzNIhS5OZ0mOKw6p
 xKnJLEaqU5IgK7qUauM0BI6S/d9/Ut0+4vILiF2fNWuyHo+vOBJBzlnvArI1OFmuNZ4h
 x8z+gVI9tAhJp6+a7mMYV1Zd15LEbnc2F5AbB8KAs9/7+8cVlhif0D+AAu19Rh20Ehap
 /Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fsbTZ4A+B2PXhDP3sNDOQgQqoUp7jw73U/vNBsyo9qQ=;
 b=sMnwC97Ye5drpeONgQZajSQHWMlpoNBwQ7WguG9JdFNIA7Iwz+X7qnsSiEm5rR62/d
 xuNQM7QOuswIQzHWSQbJ7SJi756kBrwRdUZGWloB++swg3D/FZivis8sHY6s9sRsCTJi
 JzkCEcwj+NTzA02NdGP4cnpVJ0lAfZjujZyL78XLEjdkDLMP+qlL1jUvwlp+kNY+NWGH
 ke1CtZrI10vPIxCXJRl0yMVTZ1yTydpJfNARB4SAncHPOLiMBc1Lz4drlU2tZDuTtjMI
 dy+haYCRv6wU7KBj4ekNwEPuv5Afn0oPAWXAPMHc95QUr+RVhr94KA2zoo6sII3vZjO8
 BGxw==
X-Gm-Message-State: AJIora81bRt1GyV150ITKmwpvzwBDlXlvW/jbvk3jXZOBKPuUt4Pua5C
 Iu9fM4flAdiNGcPjigl/N5q32w==
X-Google-Smtp-Source: AGRyM1v9QsaD+hYtqFi7VLcB0Z5Q0ALa1jHm7ST1/n/cNaVVpiIVhY8KILoymHSS8pWq3SNZ6bYSVQ==
X-Received: by 2002:a05:600c:4f13:b0:39d:b6c5:ce4e with SMTP id
 l19-20020a05600c4f1300b0039db6c5ce4emr25928157wmq.34.1656408949892; 
 Tue, 28 Jun 2022 02:35:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k1-20020adff5c1000000b0020d07d90b71sm12856887wrp.66.2022.06.28.02.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 02:35:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46BEE1FFB7;
 Tue, 28 Jun 2022 10:35:48 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-49-richard.henderson@linaro.org>
 <87bkuelbil.fsf@linaro.org>
 <b99c86d9-2a64-54df-cfdf-96c9ef6e9db9@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 48/53] semihosting: Use console_in_gf for SYS_READC
Date: Tue, 28 Jun 2022 10:35:43 +0100
In-reply-to: <b99c86d9-2a64-54df-cfdf-96c9ef6e9db9@linaro.org>
Message-ID: <87tu85jfkb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/27/22 14:37, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
>>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-sem=
i.c
>>> index 20e99cdcc0..4c8932ad54 100644
>>> --- a/semihosting/arm-compat-semi.c
>>> +++ b/semihosting/arm-compat-semi.c
>>> @@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t r=
et, int err)
>>>       common_semi_cb(cs, ret, err);
>>>   }
>>>   +static void
>>> +common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
>>> +{
>>> +    if (!err) {
>>> +        CPUArchState *env G_GNUC_UNUSED =3D cs->env_ptr;
>> Why do you even both extracting env here if it's not being used?
>>=20
>>> +        uint8_t ch;
>>> +
>>> +        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
>
> It is used in here, for system-mode, but not user-mode.
> It's ugly, I know, but that's the interface we inherited.
> The simplest non-ifdef solution is to mark the variable unused.

Fair enough.

>
>
> r~


--=20
Alex Benn=C3=A9e

