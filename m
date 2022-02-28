Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28504C7B29
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:58:03 +0100 (CET)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOn5m-0007i8-DB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:58:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOn4J-0006tw-58
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:56:31 -0500
Received: from [2607:f8b0:4864:20::1032] (port=43670
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOn4H-0004L8-He
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:56:30 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso293288pjb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hq4i24p4/G5A3MmY4uXgHldckPE3a+qNT4jJs4UR96c=;
 b=Wm8AW9HG0FH9+C/TU8KpcUUhOwWQFk16gwhiDvR2sqASIA7TE2kEi+UxiiOIjamh1d
 Z1r9+TG5ERA1938uJYoN1hrQteLJHo6kRD9Yc3Npg+BKQt/wGxMX4WNQbHRRXnhC9yiR
 K39C/sqVvK72FV0kWcYOCHr7Q4dUNRePSG9CQCw6GxJv/HpHSDd3tyNm6Uxeps6sq+bw
 bAwVDH3gDil7a3pYSm9cIhFwx6waLKCbRhd5Ji4iN11sWnrJrYywhW+gocThZZIdrW7s
 0kq2c92AFFp0UzBJ4PN1lfG7o79QGpMnwp3WnnGA5c7s74NYCJxryQSTNH+3N3S2r3Y7
 ULfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hq4i24p4/G5A3MmY4uXgHldckPE3a+qNT4jJs4UR96c=;
 b=ZbgTK0r6rieiMLVHNDv2ZydBj9XDfiT2fwbbb+Wo9Y/52IiK5F/lgFlYbxbgEncdhs
 1o5xorADSHYcttmchT8iMPgG3g3mL1twJ6buEOOZxT3JCSpTbJmWqlveNVU3ymg48egq
 ljGYy+nW1iuUFdayOWTztO2IsAnXVx3AckHcGmODL20uCMriLqLkMpQCpgqRBVhb3Oih
 qtOmmKQVSqXQK8j/x2m/q6U+7+pWR+lMpIrzME/Lg9BcKdN8gTW20thCASK+HbsLXK8A
 sUoXxShxoquCzqJXEGVKHYbplEiv05blhFN2R4rri4SyXZMsOr6GPninEzpnPqqiiuSJ
 KTnQ==
X-Gm-Message-State: AOAM530v6GzUy8iUNIQl57yk/0oQB+nQmferDX69JpyeeQAEN2eRZPBb
 MESeUGFQCgM+arSpD1DVOSeiBA==
X-Google-Smtp-Source: ABdhPJxXqIOheBGFXKXapw6O1j0hepIP2DtwGT0ZVuQSaNR9AO++diun2gj24HjSaRsbpysPQb4B1Q==
X-Received: by 2002:a17:902:7d83:b0:14e:f2f4:743 with SMTP id
 a3-20020a1709027d8300b0014ef2f40743mr22229751plm.107.1646081787776; 
 Mon, 28 Feb 2022 12:56:27 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 6-20020a630006000000b0036d11540db8sm11238125pga.76.2022.02.28.12.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:56:27 -0800 (PST)
Message-ID: <5e5c7f40-3b58-4ce1-146b-63f925a7df2f@linaro.org>
Date: Mon, 28 Feb 2022 10:56:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/18] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 07:20, Alex Bennée wrote:
> +# TCG does not yet support all SSE (SIGILL on pshufb)
> +# sha512-sse: CFLAGS=-march=core2 -O3
> +# sha512-sse: sha512.c
> +# 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +

Given

ops_sse.h:void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
ops_sse_header.h:DEF_HELPER_3(glue(pshufb, SUFFIX), void, env, Reg, Reg)
tcg/translate.c:    [0x00] = SSSE3_OP(pshufb),

I'm inclined to think -cpu max might work here as well.  Yep:

static const X86CPUDefinition builtin_x86_defs[] = {
     {
         .name = "qemu64",
...
         .features[FEAT_1_ECX] =
             CPUID_EXT_SSE3 | CPUID_EXT_CX16,

does not include SSE4.


r~

