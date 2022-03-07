Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB844D08F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:54:43 +0100 (CET)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRKNO-0006Mc-QH
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRKM9-0004oP-VO
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:53:26 -0500
Received: from [2a00:1450:4864:20::629] (port=34534
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRKM8-0004vK-0C
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:53:25 -0500
Received: by mail-ej1-x629.google.com with SMTP id gb39so34648704ejc.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HQvIAiCCt/Nr2/RW8spkGn4etZmUoZQVrjp/HY6FTPg=;
 b=CL0RQlnvjkmuRy294pPPeNlGlw5gKocJgMZoBMNnoBOpccgC05tpGgYNUihT30KYaf
 hRfXJefCHbGdHxAcv+LyQ3KkMq1iR2gSGg8jrKU+Fjllk2LBnDeZj3htO/96ENQl0vwL
 XwUtS5HR/QhqbVFdiT8PcGLx3l9fHwSm7/fxzZ/aLXQUO/jdSuAG6A/UXd7+UV4m2RLY
 IKxCycl5P3YSlGd4jnvjFtGyjuCFHCR+mq1xC++3GqmYSiNgEiJpLroE869TqgOYdNsk
 5tR2A90Hc1pNsmxAAwCAolIgV+gLDdxenDCW9DWeqgbZc/Ht1fWAnLT6d1w0PT+Z5PM5
 /C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HQvIAiCCt/Nr2/RW8spkGn4etZmUoZQVrjp/HY6FTPg=;
 b=VcvlP+iCn6/rvsHu5I9T+v0oyAzw/thHlPe9mxXsLHvR8g791+2skWgJFXu7JQHDn3
 WLDCEUQ50vtknVxUTlrAszV7nf1SG0oTP5Gy3xMZiaQnQ9E//QFXW7/N7IK25DEh1Vsj
 MfW/5lRFMXXCXPJOCRufkCbNKqDwFmSUYqRLaRTj9w37y6MKG9ZxXzCM24daXAn29HIH
 7cXmbAHB98sgeR2Ks56PLhOz6m8uYPyqlCUXrLr21fCKZ+0OF5yBNtez1LFfvHAo01Mi
 YPyg5gJnpWaLGOh9z8TNCG2euE/MfM8RT2ptKMQlN3g9RWm5mNeAovUIfbDDGSzMz4pb
 eDJQ==
X-Gm-Message-State: AOAM533nHEeun7Q9oG5lhfJg18/0RlpKq8WWd51kTg2qxZA/u/7ifvOj
 NT66PcvLC/KzSQxAcaA6g4TdDQ==
X-Google-Smtp-Source: ABdhPJx5kbUvkLGczKzBlGRGSOZvQWZG/pONj/wujuhLjNIsJokV8irebnqZqWL+ylfhUBTg+7M7jg==
X-Received: by 2002:a17:906:9743:b0:6d8:632a:a42d with SMTP id
 o3-20020a170906974300b006d8632aa42dmr10479237ejy.157.1646686402180; 
 Mon, 07 Mar 2022 12:53:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 qb30-20020a1709077e9e00b006d6f8c77695sm5021795ejc.101.2022.03.07.12.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 12:53:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A4E81FFB7;
 Mon,  7 Mar 2022 20:53:20 +0000 (GMT)
References: <20220307184446.3149199-1-alex.bennee@linaro.org>
 <4a6212f0-9491-7260-01e0-e0c0659a1aab@linaro.org>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] target/i386: for maximum rounding precision for fildll
Date: Mon, 07 Mar 2022 20:48:26 +0000
In-reply-to: <4a6212f0-9491-7260-01e0-e0c0659a1aab@linaro.org>
Message-ID: <87h789fprz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,
 incoming+7b48dc26643084f29a2bbb8c07f757b1@incoming.gitlab.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/7/22 08:44, Alex Benn=C3=A9e wrote:
>> The instruction description says "It is loaded without rounding
>> errors." which implies we should have the widest rounding mode
>> possible.
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/i386/tcg/fpu_helper.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/target/i386/tcg/fpu_helper.c
>> b/target/i386/tcg/fpu_helper.c
>> index cdd8e9f947..d986fd5792 100644
>> --- a/target/i386/tcg/fpu_helper.c
>> +++ b/target/i386/tcg/fpu_helper.c
>> @@ -250,11 +250,15 @@ void helper_fildl_ST0(CPUX86State *env, int32_t va=
l)
>>   void helper_fildll_ST0(CPUX86State *env, int64_t val)
>>   {
>>       int new_fpstt;
>> +    FloatX80RoundPrec old =3D get_floatx80_rounding_precision(&env->fp_=
status);
>> +    set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_stat=
us);
>>         new_fpstt =3D (env->fpstt - 1) & 7;
>>       env->fpregs[new_fpstt].d =3D int64_to_floatx80(val, &env->fp_statu=
s);
>>       env->fpstt =3D new_fpstt;
>>       env->fptags[new_fpstt] =3D 0; /* validate stack entry */
>> +
>> +    set_floatx80_rounding_precision(old, &env->fp_status);
>>   }
>
> Yep.
>
> Need a similar fix for fildl_ST0, for the case floatx80_precision_s is
> currently set (int32_t has more than the 23 bits of single-precision).

It can't hurt to convert with:

  set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_status);

in that case as well right?

--8<---------------cut here---------------start------------->8---
target/i386: for maximum rounding precision for fildll

The instruction description says "It is loaded without rounding
errors." which implies we should have the widest rounding mode
possible.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 13 insertions(+)
target/i386/tcg/fpu_helper.c | 13 +++++++++++++

modified   target/i386/tcg/fpu_helper.c
@@ -237,24 +237,37 @@ void helper_fldl_ST0(CPUX86State *env, uint64_t val)
     merge_exception_flags(env, old_flags);
 }
=20
+static FloatX80RoundPrec tmp_maximise_precision(float_status *st)
+{
+    FloatX80RoundPrec old =3D get_floatx80_rounding_precision(st);
+    set_floatx80_rounding_precision(floatx80_precision_x, st);
+    return old;
+}
+
 void helper_fildl_ST0(CPUX86State *env, int32_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old =3D tmp_maximise_precision(&env->fp_status);
=20
     new_fpstt =3D (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d =3D int32_to_floatx80(val, &env->fp_status);
     env->fpstt =3D new_fpstt;
     env->fptags[new_fpstt] =3D 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
=20
 void helper_fildll_ST0(CPUX86State *env, int64_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old =3D tmp_maximise_precision(&env->fp_status);
=20
     new_fpstt =3D (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d =3D int64_to_floatx80(val, &env->fp_status);
     env->fpstt =3D new_fpstt;
     env->fptags[new_fpstt] =3D 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
--8<---------------cut here---------------end--------------->8---


>
>
> r~


--=20
Alex Benn=C3=A9e

