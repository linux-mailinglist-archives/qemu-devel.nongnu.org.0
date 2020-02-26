Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D2170BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 23:53:44 +0100 (CET)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j75Ym-0004Us-0A
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 17:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j75Vo-0000kv-UN
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:50:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j75Vn-0002Ra-Tq
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:50:40 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:37722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j75Vn-0002OW-M2
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:50:39 -0500
Received: by mail-pj1-x1044.google.com with SMTP id m13so279546pjb.2
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 14:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sp6GJyMSnGPLydKSQZ7pqUrPJYMkzVHdQBjQJtq3eF8=;
 b=pRLRVQ4mDh40cJEg/zHdyNwVzdr+y6oEmgBIw69g5yE1AFIPAjbyMmVl9v6NgDrla0
 NZfTQtz4LFfPN4gvZNha5SrabXKFAzC4xikwbEhU74u8k144taeZxjOpZOgN6fQvMVgU
 EsMPYt8JJlRINZXXFZx2UslT092SyYDLB2wL0yzgi/MiB9tPjSArl5RNj2fk+OIT/V3g
 R+yprZV/LpOfCJaRbn6w6TkdO7M0794ckO8+Cf1FTT0I1PzV3MzZiL0u9I+tNRLQcNGU
 ApYP0FiWwmLXP4AvYLAbWcymgca7bneTg5R9qcazc7gTzozn4m1I8kSlTOOJbgTo6HSn
 5eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sp6GJyMSnGPLydKSQZ7pqUrPJYMkzVHdQBjQJtq3eF8=;
 b=V3eMLasTZ5whqtsoEV3DDeRtIS0qnVzgiLJnef7f0zKJI1ruatDLD1UFLCgYxTOrAL
 YUX6Sot+AXnvp66UNk9nzQAfc2AV+RSGkWf0xErSi+pauZcnl7a/8Eeqqx4ojq15jkRy
 YRp+C4akYeBPeOkoJlIbWkhm+69rF2NnKkre/NKka+x1g3fAFbkpXkRx7GIEi4dMksiO
 I6fjGzJSy+JOOTW7HfoIenZur2AqNPh9kes7pEuMtwd4RH/gIJqVg2pGfiITytKbd3g+
 yuDPVydbGQ/BWPQbCQibxUPbRMnL6BlxB+C+YrC+rT12urF4lQe/rZLwUqc8vgcTAcff
 swKg==
X-Gm-Message-State: APjAAAX0vWx3VvPnI8Dt/KQU790xu3KTKIAqXxX4YsNM/LU4//qUBDba
 Ac8ae4DpGZEEfEqybqykaM4IxA==
X-Google-Smtp-Source: APXvYqzsM2XauNpgrezmHcXs+XV3GG29HyIu0RtH7SdkvIh6qP8MfEv3/o+6SXRFzAtolBMab6zSDg==
X-Received: by 2002:a17:90a:330c:: with SMTP id
 m12mr1494892pjb.18.1582757438494; 
 Wed, 26 Feb 2020 14:50:38 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 n9sm49272pfq.160.2020.02.26.14.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 14:50:37 -0800 (PST)
Subject: Re: [PATCH v1 3/4] accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32
 bit hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <902c34be-37c9-0d26-5d72-bba12b0ce8e4@linaro.org>
Date: Wed, 26 Feb 2020 14:50:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/20 10:10 AM, Alex Bennée wrote:
> There is no particular reason to use a static codegen buffer on 64 bit
> hosts as we have address space to burn. Allow the common CONFIG_USER
> case to use the mmap'ed buffers like SoftMMU.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


