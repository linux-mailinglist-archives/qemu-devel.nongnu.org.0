Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B7664334
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEGy-00008O-Lc; Tue, 10 Jan 2023 08:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEGw-000089-E0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:02:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEGu-0005hK-OS
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:02:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ay40so8730392wmb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 05:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vzkiaxHmqKCgUO7CTbiwkeDFVR+CTQzIrxY/EHqQ6U=;
 b=xOPJXi27ifAiemBKl29ux1kgJxONC0dvtX13VmVXX2xCXW6ycvDAQE2PfTT5WY5NTn
 YBEsJTkOXxCon0H4Df+GuP0uGBRDt0N82BO1eUYqe7z30b6vF81421QxM56mXReOxdZd
 gwiH6emqVTFksgemd90/XwyWiD+UhWBzkIrl9U8N24zcLlqVRHKNNYQ1cCCGPKGpGVPq
 ZP4fRPCpnorL6LlgS7mPfdJVM9PO4nA1XKRFwARQ3cyQioHIbPBg9dn31SXaD/8XP4gQ
 3lboqeOssnDDmW9m9yKaid43F6BpYGNsHL7T89nOZBZVKYvru6PuyWvo7wH7MfoQO3id
 9q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0vzkiaxHmqKCgUO7CTbiwkeDFVR+CTQzIrxY/EHqQ6U=;
 b=2FewQm8/I97yfx7VKhO32HzLoWCOTppmxF+8CKklsk9akezXbIomMiNnXB8/5WOIbl
 IMmNpxPxpEVTtwUB6njBsqOdm80jh/8FxJt8M3iMK8fMbLFKIvBgdmxIKU+T42zo5McK
 mUKuWPfQ/cAyNjKvqQ/8Gwg5QF00/jVTypGk9s3RGd3yc61Xi23XKBrZX3EgLe8aW67q
 uQhqcpaA6h6XzdLQDiCPlSFQXylyCYkG+Nx/o82S+p63asvmhxTd7HZAKYbcIaK0SX09
 +pV9v4suLqmqY97NT5fUHFUrJShAIADED3ap5VNzwpPowW4yxQTh7PH/J62sRv5RxBox
 d5IA==
X-Gm-Message-State: AFqh2kqIQLeFxfIhPOIQZ0lBmNEthKUoIQnq3wFXU40p37+b5fwBy+/T
 Bm4l3NU211yVkWNiu2+Q+rhQww==
X-Google-Smtp-Source: AMrXdXvbWd1bDJz5KOX2ZwXQl4H/zFN4cN+vcY1siE13NSBpYAvCQF55orh0QKBTOVrt4isY+oVQsA==
X-Received: by 2002:a05:600c:2142:b0:3d5:365b:773e with SMTP id
 v2-20020a05600c214200b003d5365b773emr59384011wml.39.1673355750369; 
 Tue, 10 Jan 2023 05:02:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm22553088wms.43.2023.01.10.05.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 05:02:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E2291FFB7;
 Tue, 10 Jan 2023 13:02:29 +0000 (GMT)
References: <20230108164731.61469-1-cota@braap.org>
 <20230108165107.62488-1-cota@braap.org> <87k01voluy.fsf@linaro.org>
 <Y7zKmmCHbMWj3KdO@cota-l14>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH 4/4] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Tue, 10 Jan 2023 13:02:08 +0000
In-reply-to: <Y7zKmmCHbMWj3KdO@cota-l14>
Message-ID: <87pmbmmtju.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Emilio Cota <cota@braap.org> writes:

> On Mon, Jan 09, 2023 at 13:52:36 +0000, Alex Benn=C3=A9e wrote:
>> Emilio Cota <cota@braap.org> writes:
>> > --- a/accel/tcg/cpu-exec.c
>> > +++ b/accel/tcg/cpu-exec.c
>> > @@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
>> >      if (cc->tcg_ops->cpu_exec_exit) {
>> >          cc->tcg_ops->cpu_exec_exit(cpu);
>> >      }
>> > +    g_assert(cpu->plugin_mem_cbs =3D=3D NULL);
> (snip)
>> > +            g_assert(cpu->plugin_mem_cbs =3D=3D NULL);
>>=20
>> Can we assert this anywhere else? This fails with non-plugin enabled
>> builds:
>>=20
>>   https://gitlab.com/stsquad/qemu/-/pipelines/741478109/failures
>
> Ouch. Fixed in v2 with:

Thanks, Queued to plugins/next with me manually merging the fix.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

