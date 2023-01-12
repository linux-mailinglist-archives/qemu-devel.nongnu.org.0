Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BA666EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuHM-0001Qv-8G; Thu, 12 Jan 2023 04:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFuHJ-0001Qc-5p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:53:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFuHH-0003TZ-8a
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:53:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so14555282wms.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBPfJ7u9o8cL1se5ARmeIwoMxlzImXcgMLQKIXQ+FiU=;
 b=bDAbZ1s+JUO6RRnwbxhRRdJFio6UgvSuTjiQn19RJqjplrb5cACpd/G0N7A9EVrAC4
 ES7pmAtSeiIRRMdtxqAFUYbZFRaf6xf7kdItGPjFg/3Tj7cCYoLrGtGXiHXUF00fvcrA
 7NaaiH/CS0mva1TTNsb+6cAQylStpCO6/bvFyZYSXLH/puZkkBmqkxspEPnc6QYsxf+m
 11aI/JgiY7srNCA6YnbBZAUrT1iLSfdA/uY93vVQUMz7pwF+jj6O7FsnM8xhDi1LUfcm
 PJXpA8rDc9/LtQGdfV5hnFY+V6+Lq/RFz0v8HoLwNEdwoOoRWy7YyTkvVOb0JQdCRIVM
 Mgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBPfJ7u9o8cL1se5ARmeIwoMxlzImXcgMLQKIXQ+FiU=;
 b=jbBaRSgYEHuo/X03+HHTUtoULiyyUlJNr80lcDA+YMRMjoy71RE/XfU+6IKm2G/708
 lMaN6WYvkmPsDGTHJn52LX99ekE4PPc95cSRWbI2wCV1g4s9nTKwck+n6qXceGQXTc34
 dK1rCjUr5P6cQ1CPWDNnSedgkkeiC63Dubv9Ads3mCvYCHqQ8G6ssGmysiqyRL+0TfDw
 9cuJ/S/udlxtDRb2w2HxEICMxnJLKTnAqhdkRkQX42drPEbp8kccvyxMZ1bjaWRQ9K2I
 T8t3Klq6YWw7LLG5EbR0ae4SLCYWIJk5fVKIHP//vq+p0BNYVTHWTtytP7FdrLQVPJtu
 7N1Q==
X-Gm-Message-State: AFqh2kq2y6aHNhowmUcACTFRgpjv/qbX7v6HeilW1OV66FGQ8cPRfhip
 JlUcLEAiCgUnQC7mFb5jRg1X7g==
X-Google-Smtp-Source: AMrXdXvSZxZ5VE9LV4WVcKm1ePsH0mrjhS4lfUKObSywX5S/8FAFUr0BVp0mvYJVq2621e4+IKlsKw==
X-Received: by 2002:a05:600c:4f54:b0:3d9:f04c:f58f with SMTP id
 m20-20020a05600c4f5400b003d9f04cf58fmr11172638wmq.40.1673517221038; 
 Thu, 12 Jan 2023 01:53:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003d9fba3c7a4sm7927551wmg.16.2023.01.12.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:53:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 098DC1FFB7;
 Thu, 12 Jan 2023 09:53:40 +0000 (GMT)
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-26-alex.bennee@linaro.org>
 <8f016b06-5f09-b14c-a3a1-6d2b93f516e7@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
Subject: Re: [PATCH 25/26] tcg: exclude lookup_tb_ptr from helper
 instrumentation
Date: Thu, 12 Jan 2023 09:52:31 +0000
In-reply-to: <8f016b06-5f09-b14c-a3a1-6d2b93f516e7@linaro.org>
Message-ID: <87o7r4m63g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/10/23 09:39, Alex Benn=C3=A9e wrote:
>> From: Emilio Cota <cota@braap.org>
>> It is internal to TCG and therefore we know it does not
>> access guest memory.
>> Related: #1381
>> Signed-off-by: Emilio Cota <cota@braap.org>
>> Message-Id: <20230108164731.61469-4-cota@braap.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tcg/tcg.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index da91779890..ee67eefc0c 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int =
nargs, TCGTemp **args)
>>       op =3D tcg_op_alloc(INDEX_op_call, total_args);
>>     #ifdef CONFIG_PLUGIN
>> -    /* detect non-plugin helpers */
>> -    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_",=
 7))) {
>> +    /* flag helpers that are not internal to TCG */
>> +    if (tcg_ctx->plugin_insn &&
>> +        strncmp(info->name, "plugin_", 7) &&
>> +        strcmp(info->name, "lookup_tb_ptr")) {
>>           tcg_ctx->plugin_insn->calls_helpers =3D true;
>>       }
>>   #endif
>
> I think this should be detected with
>
>   !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)
>
> i.e., side-effects, which in this case is the possibility of a fault.

That implies that:

DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64=
, ptr)

should be the _SE variants as well right? They do have side-effects but
not in guest state and they shouldn't cause a fault.

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

