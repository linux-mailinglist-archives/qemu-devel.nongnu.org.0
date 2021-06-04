Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625C39B477
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:00:07 +0200 (CEST)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4kQ-0006ie-19
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lp4ja-000643-Q0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:59:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lp4jY-0000Cn-KO
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:59:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id h8so8308653wrz.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1vPZWtTk1XpQ+dOLNYS/cdav0ifwDEI4Fy5thNTdWz0=;
 b=iqWbbuZxpXoz43xgQiq44XFOd0GI9c17u0+qx8J8T98s9DypK/sQLgmMGlg+2rBkqS
 J9rNMwsAIrC6HlM2yHSSW8FtPOSugHl0uvlguHoEknc1LVqBp/VzkrbhSA5t8EPM5uTx
 Rr+nF+Wd98EE8rEn4qIV1lbkSlPKc7Hv2iZxrqRnSmzmdbr82m/JX4MSFXePFChz3SB7
 q33CLG4DSuyskARIyVHWlgK3Nmx+O8uongaFi8a001EjQ3FWxuEMAGeiHYCUtle21z9a
 1RkOZgdLyGp2fr0DhV4IJ9vUVplRFS9ra/zoi3U7++KwdHmsCJd1h2oaZX2nAPQdfOdA
 gf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1vPZWtTk1XpQ+dOLNYS/cdav0ifwDEI4Fy5thNTdWz0=;
 b=iFbcGLBPMu6AFYFCrcV6J7CTnvM4PsLAW/2twPSU7ZpvtE+f2U1CFWcU//+Flq4aqc
 HmHApt541+spmSd+cW14vjW+nOFPO0XxXZPQ/FD68Kv7i9AgkVWDplM2kHV2gPKNVo5k
 M3KZp7iq5sUVAVhLPHEj/U4EXzCcCdlYGxZfaXyUEiKgDJJj+e3Se9Ia+hcuisCcOk3o
 XtXMIXnba+1XY/7h5SF0NiZ5EDZCBZagXeD2OOohnOXb2c5Ae8f0Fzpq022xoPM5kKcm
 vgOlyKjOgud2J8Kna+HMcOxfBagFdJ3yR78iu3zUyw2MoMUWQl8jP6Ys/GrnsIIL1PNT
 5x7A==
X-Gm-Message-State: AOAM532SPtZgX9BT/Itq5MlKHCfjIcPHF43OwI7GVM724sd/iJW4o+I+
 Ic1xZTZN9bdwFi3vLiLvvieo4Q==
X-Google-Smtp-Source: ABdhPJwF+bnComuyFsm9PFUy7+MZ9r2g6JlcfD2PaQEHJEng0FUBJsJoy4eAG9IY1hP4CSI3mJ6jLw==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr2458493wru.312.1622793551228; 
 Fri, 04 Jun 2021 00:59:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s62sm8079196wms.13.2021.06.04.00.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 00:59:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E1111FF7E;
 Fri,  4 Jun 2021 08:59:09 +0100 (BST)
References: <20210525164541.17985-1-alex.bennee@linaro.org>
 <76648788-26c3-f957-ac39-eee1600e57f7@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] accel/tcg: change default codegen buffer size for
 i386-softmmu
Date: Fri, 04 Jun 2021 08:42:42 +0100
In-reply-to: <76648788-26c3-f957-ac39-eee1600e57f7@linaro.org>
Message-ID: <87o8cm6oxe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 1896298@bugs.launchpad.net, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/25/21 9:45 AM, Alex Benn=C3=A9e wrote:
>> There are two justifications for making this change. The first is that
>> i386 emulation is typically for smaller machines where having a 1gb of
>> generated code is overkill for basic emulation. The second is the
>> propensity of self-modifying code (c.f. Doom/edit) utilised on i386
>> systems can trigger a rapid growth in invalidated and re-translated
>> buffers. This is seen in bug #283. Execution is still inefficient but
>> at least the host memory isn't so aggressively used up.
>> That said it's still really just a sticking plaster for user
>> convenience.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: 1896298@bugs.launchpad.net
>> ---
>>   accel/tcg/translate-all.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 640ff6e3e7..f442165674 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -951,9 +951,13 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pa=
ge_addr_t phys1,
>>    * Users running large scale system emulation may want to tweak their
>>    * runtime setup via the tb-size control on the command line.
>>    */
>> +#ifdef TARGET_I386
>> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>> +#else
>>   #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
>>   #endif
>>   #endif
>> +#endif
>>     #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>>     (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
>>=20
>
> I'm not thrilled, as it is ultra-hacky.

I don't disagree.

> (1) I've got a re-org of this code out for review:
> https://patchew.org/QEMU/20210502231844.1977630-1-richard.henderson@linar=
o.org/

OK I'll have a look at that.

> (2) I'm keen to reorg TCG such that it gets compiled once.  There's
> currently nothing standing in the way of that except work.  But this
> would introduce a use of a target-specific define for the first time
> into tcg/.  I guess I could leave the default sizing back in
> accel/tcg/ and pass in the default.
>
> Other options?

Some random thoughts in no particular order:

 - a separately flushable translation region for code we detect as SMC heavy

 - a front-end interpreter for SMC code

 - smarter code generation that dynamically loads values from codemem
   (usually the SMC code is just tweaking an #imm value)

None of these seem particularly amenable to a clean non-complex
implementation though. A front-end interpreter would be useful for other
things though - it could even be incomplete and handle only common code
patterns falling back to full generation for anything it can't handle.

>
>
> r~


--=20
Alex Benn=C3=A9e

