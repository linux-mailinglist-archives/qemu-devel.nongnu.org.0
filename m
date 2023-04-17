Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95A6E4761
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:16:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poNlS-0004sl-14; Mon, 17 Apr 2023 08:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poNlF-0004sa-TZ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:15:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poNlD-0002AM-Ls
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:15:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso2149690wms.4
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681733704; x=1684325704;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5npjBE2KuY5R/qbsZ1i8mFbD334lAgFA1WPFX4wiGs=;
 b=N8iSMSEwfGsUVDTglUGROuOQdRguoEhX/R0Ndi+wzIlq+tywMIncDxIo568L3OR+hG
 8xNcoUsOlHrckOZmyW+IQJWws4WbRYxmVYguhNEROJ8KFzC5B3nyc+9Qx4vX7w+ey+2d
 9ZVb7FzH/IJ9ym8GMPtYrfFN1gkNJOHC3aX31IZXRI0zGxWn4bj5VkOyauFZ53daNsUQ
 n2rbUKY66bH3iNyfy3y8e6BOFn4/eSu2FXgx4pRMa7bdh2spSIiQ9vsv87vnF0UAO6mQ
 hM4SY7vtMuMLATZGZS5pOvAPjgUGdfJ+TNpjWEw3DDbti5Evm/KPHrPcv4QuZZVBO5h2
 lBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681733704; x=1684325704;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e5npjBE2KuY5R/qbsZ1i8mFbD334lAgFA1WPFX4wiGs=;
 b=Cvo+mrcYDygdtZ9RZZFN2uE2TpCvNwNYtPA3HBEM9ev4PJSufg34nwE4hXR/uArD4n
 nT+2xg0srF55Zr6oSSP4wdvCJqVOrxUpB124uapOne4iScYblnso7Y4tZ7/r5TtqWJx3
 8Zyul9Sg77Uher2vnbGG1huRR1/nNjjkBrupQP2KHALkFH9Quxq5BEWVwPAD3t2xy+pr
 MkD2oVrw7n7F5UTNmUxcrqOdrW5f/F6F1PsFupP1KQRt3WNvEdtGpUPngaxGDvtwqZOH
 oUcTpvwNQHN2SZJCW2l3b+O0CqmrbJVoNwYTBGfpRRvldsksBhuwNVRMbZ4tkfxKA4n+
 4CtA==
X-Gm-Message-State: AAQBX9f2Pgh34PuC41HxaIEMx6GO8hFmYTLyPW9wcb0O4NKT3t6b4EFx
 R/T41qeBOBuN2d0WA5waQQTZ3g==
X-Google-Smtp-Source: AKy350ZV2Gm9imHbigY0IL/Dx91MMfnDTAlD8oXEGwNsWlx5L9McaiauHziXNN4Tt/D3Src4xt8OAA==
X-Received: by 2002:a1c:750a:0:b0:3f1:70d5:1be8 with SMTP id
 o10-20020a1c750a000000b003f170d51be8mr3968523wmc.15.1681733703761; 
 Mon, 17 Apr 2023 05:15:03 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d4e0d000000b002f4cf72fce6sm10407348wrt.46.2023.04.17.05.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 05:15:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E01E51FFB7;
 Mon, 17 Apr 2023 13:15:02 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
 <87ttxoc8wq.fsf@linaro.org>
 <0f237ccb-dcbe-87c7-d9f2-653962d30520@intel.com>
 <87v8i2ri3w.fsf@linaro.org>
 <6ac7805f-8fc5-f598-258c-b0b55a1a35d6@intel.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Mon, 17 Apr 2023 13:11:06 +0100
In-reply-to: <6ac7805f-8fc5-f598-258c-b0b55a1a35d6@intel.com>
Message-ID: <87y1mqemd5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


"Wu, Fei" <fei2.wu@intel.com> writes:

> On 4/11/2023 3:27 PM, Alex Benn=C3=A9e wrote:
>>=20
>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>=20
>>> On 4/10/2023 6:36 PM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>
>>>>> On 4/6/23 00:46, Alex Benn=C3=A9e wrote:
>>>>>> If your aim is to examine JIT efficiency what is wrong with the curr=
ent
>>>>>> "info jit" that you can access via the HMP? Also I'm wondering if its
>>>>>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>>>>>> extra data it collects is that expensive.
>>>>>> Richard, what do you think?
>>>>>
>>>>> What is it that you want from CONFIG_PROFILER that you can't get from=
 perf?
>>>>> I've been tempted to remove CONFIG_PROFILER entirely.
>>>>
>>>> I think perf is pretty good at getting the hot paths in the translator
>>>> and pretty much all of the timer related stuff in CONFIG_PROFILER could
>>>> be dropped. However some of the additional information about TCG ops
>>>> usage and distribution is useful. That said last time I had a tilt at
>>>> this on the back of a GSoC project:
>>>>
>>>>   Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integr=
ation
>>>>   Date: Mon,  7 Oct 2019 16:28:26 +0100
>>>>   Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>
>>>>
>>>> The series ended up moving all the useful bits of CONFIG_PROFILER into
>>>> tb stats which was dynamically controlled on a per TB basis. Now that
>>>> the perf integration stuff was merged maybe there is a simpler series =
to
>>>> be picked out of the remains?
>>>>
>>>> Fei Wu,
>>>>
>>>> Have you looked at the above series? Is that gathering the sort of
>>>> things you need? Is this all in service of examining the translation
>>>> quality of hot code?
>>>>
>>> Yes, it does have what I want, I suppose this wiki is for the series:
>>>     https://wiki.qemu.org/Features/TCGCodeQuality
>>=20
>> Yes.
>>=20
>>>
>>> btw, the archive seems broken and cannot show the whole series:
>>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
>>=20
>> I have a v10 branch here:
>>=20
>>   https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>=20
>> I think the top two patches can be dropped on a re-base as the JIT/perf
>> integration is already merged. It might be a tricky re-base though.
>> Depends on how much churn there has been in the tree since.
>>=20
> I have rebased the patches to upstream here:
>     https://github.com/atwufei/qemu/tree/tbstats
>
> I try to keep the patches as possible as they are, but there are lots of
> changes since then, so changes are inevitable, e.g. CF_NOCACHE has been
> removed from upstream, I just removed its usage in the corresponding
> patch, which might not be preferred.

Yeah that fine. CF_NOCACHE was removed to avoid special cases in the
generation code - we simply don't link or store the TBs in the QHT
anymore. As long as the guest isn't executing a lot of non-RAM code we
won't run out of translation buffer too quickly.

>
> I did some basic tests and they worked (the output of info goes to qemu
> console, instead of telnet terminal), including:
>     * tb_stats start
>     * info tb-list
>     * info tb 10
>
> Alex, would you please take a look?

That looks pretty good, glad it wasn't too painful a re-base.

The next question is do you want to pick up the series and put through a
review cycle or two to get merged? It would probably be worth checking
the last posting thread to see if their are any outstanding review
comments.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

