Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A85BB05E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:39:29 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDR9-0004j7-Qg
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZDMV-0000M5-KD
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:34:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZDMT-00026p-Rm
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:34:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id o5so12287917wms.1
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=hc7f8qjlAkmXOqKsjHCtOoU1B2VevfmZNhctzjXohb0=;
 b=b8EvB62bIIfT1vsaMJxwYeS3/kuxOy6lbiEa8kjmZV3VyPE5qW1FjYGC6AjDeW8Kd4
 VcVkqTLTP2V32klgECsNdSxPMVTJubIYWwNwLHMjTobC9MqHfsSA0KUtXcBHHSAuD7Ve
 MqTNJ7DY6Z+TgyUEO1U9ipOOtYehA0mOb6dcWCqiX6QxOWmOOUUPjPw3vZwBOP4uaevo
 C3DJEF3KOMKPwTMTYoFNhRuZtN2dqnAcFFOQ1wIkAQ4UKa5pl0r9scah8K0yNZmKLMM7
 r+dpfkPKiF2+fHErt+Ji55ya6O3TStj0Xe5YFoRI9jW2hzlFo++NE7rJAB8dmGjOWNNG
 uO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=hc7f8qjlAkmXOqKsjHCtOoU1B2VevfmZNhctzjXohb0=;
 b=tne4LDWMBYZp7adpnY2lkvfGpW5eey2WThz4hsD7cMpLxYPAAoiHfqd25hKL2pXdy+
 6z9ccPt6DKZdksBNbLdVFHwIS7OKek+HHuYpffFb+V36TL60okOpxKuaDbcQro8J8yWK
 VARF+q9Vfqr+4BLUqfadwi/kgFvkIlZwexV78bzfbMBLRL+fc3UJVue8Uq/Qaon2egiF
 V+r0jzWrctSu6BM2dMgVS2Vy1uGUeSk+gNgxTq8ONBgsIWNVOEdYdoHlE7kJWo8+yF6C
 iHpeIR1nh1R5R1Qf9xcW1fuHd8z3Seu8UWRABJeBXY/vyq3oiF9QsbftIYvSMdwbvJln
 0A6g==
X-Gm-Message-State: ACrzQf37y10YYZfiP52o0jqIuvqY/x04sygi1EIAbGlNuNPL2/ccLQ0M
 JKA/rOLIjt4t8EfuLf8ES4UMtw==
X-Google-Smtp-Source: AMsMyM6dCTTAKKp6nVWGZqzoeb+Imo3A2KBl8elZa0ORjYh2R8751J1qePe2acYhOg6qpn0o1+gR+A==
X-Received: by 2002:a05:600c:3b8f:b0:3b4:9cdc:dbd8 with SMTP id
 n15-20020a05600c3b8f00b003b49cdcdbd8mr3810866wms.148.1663342474947; 
 Fri, 16 Sep 2022 08:34:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc34a000000b003a60f0f34b7sm2371418wmj.40.2022.09.16.08.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 08:34:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCFA11FFB7;
 Fri, 16 Sep 2022 16:34:33 +0100 (BST)
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-4-alex.bennee@linaro.org>
 <ab834948-3bd9-8e42-f13d-de0a3c573cf1@linaro.org>
 <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Fri, 16 Sep 2022 16:28:14 +0100
In-reply-to: <6aebb38e-551e-e241-bda7-4b748e672c29@amsat.org>
Message-ID: <871qsb8h9y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 15/9/22 10:16, Richard Henderson wrote:
>> On 9/14/22 17:09, Alex Benn=C3=A9e wrote:
>>> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
>>> This solves edge cases like accessing via gdbstub or qtest.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>>> ---
>>> =C2=A0 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>>> =C2=A0 1 file changed, 22 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>> index 492b2421ab..7feedac735 100644
>>> --- a/hw/intc/arm_gic.c
>>> +++ b/hw/intc/arm_gic.c
>>> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b=
, 0x00, 0x0d, 0xf0,
>>> 0x05, 0xb1
>>> =C2=A0 };
>>> -static inline int gic_get_current_cpu(GICState *s)
>>> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (!qtest_enabled() && s->num_cpu > 1) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return current_cpu->cpu_ind=
ex;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Something other than a CPU accessing the GI=
C would be a bug as
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * would a CPU index higher than the GICState =
expects to be
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * handling
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 g_assert(attrs.requester_cpu =3D=3D 1);
>> Better without "=3D=3D 1" -- this field ought to be boolean.
>
> Boolean so far, but this could get more types (such DMA...).
> Maybe we could already add an enum definitions, i.e.:
>
> typedef enum MemTxRequesterType {
>   MEMTXATTRS_CPU,
>   MEMTXATTRS_MSI,
> } MemTxRequesterType;
>
> and name the field MemTxAttrs::requester_type.

I pondered boolean but wasn't sure if that would blow up the size of
MemTxAttrs so went for the bitfield. However I can certainly rename to
requester_is_cpu and make a boolean assertion. I'd hold off adding an
enum until we actually have more than two requester types.

--=20
Alex Benn=C3=A9e

