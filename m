Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D115E484B41
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:41:57 +0100 (CET)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tRE-0004Ak-C7
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:41:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tQ9-0003QP-4D
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:40:49 -0500
Received: from [2607:f8b0:4864:20::431] (port=42779
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tQ7-0000IM-Bz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:40:48 -0500
Received: by mail-pf1-x431.google.com with SMTP id t19so33538716pfg.9
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JzsXDhr8Kn2HoBrGX+OB3brUsal+5Oar2qZhnnqHtnU=;
 b=CfXhQEl0fCA4PaWNOPgenuNU7+fNcjEnfJJbDEux5aRLiIdO8XGZaS/BeQrLvSuWHq
 bN4YyAiBi+HH2pqk6ejQ9tkgGZ8gVnmnSO+r1Fw2oyoigHTOLVPH2HOGqU4Fp054RXT7
 D0QffR2spM7IBG3zJHpkXRN8DKQKBLqdAcIwoxpSzlyMOH1fBV6X6oum8ASt77OYF09n
 vJq6vfK44nqoJ4cseuAqLBYxl/v7dPwTDlkbVdhqF4tDuwiCZ8W4/M0d5C7ZWduqcHIT
 V8DgxSIpZr20omFkDsAcYyD2IzHdXzQoMGTjKeyVN4SEoG/wopiga5JJ2uUeZzkR3Ppf
 i8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JzsXDhr8Kn2HoBrGX+OB3brUsal+5Oar2qZhnnqHtnU=;
 b=csB0deFduxGNW95FgQRwOm2sJ3pn0qKiRE0bDxH/SQMfsIfQRr++FXeJOgQq0Tbe5v
 H/OZ/HkZgGbDeNbE9lRQqyG9DRgCFa2G7MeEOpT65sHrgaNMnxDC41qQiY7Hn+oNQU+s
 zlHzLV9M6uXcFGpbLjg7oZTyAX4yPsqg/hQ6mzpqUPcjhwurRqdZNpisYpVMfhLTKiff
 6nqfTC2I8rO/kY6w4ZGhRbZFSwc1oAa2fsZ9RXGymkc16gZOHWuWRvv5xwTHH1yfxgtq
 YTIAVIsoPucIUwm9jRjl3o7MMOc3s+hxuTGaDYq3CElEny1PY5m0ktf4oxHsG6jfBSdK
 39Uw==
X-Gm-Message-State: AOAM531tGP7MAMNR//npCaoI5WUkxphojJBZyK/yKNTACcJ84mMAxmGi
 fRcnUoCSPJk2MgrhRcmlaVAk9g==
X-Google-Smtp-Source: ABdhPJzUH83SNZKFVphXG3Qa8ucNJatEzm/kuQASWcmT2hJoH0I/nGH5B1SRzZzwn5Q7Gc8xH5nheA==
X-Received: by 2002:a63:9207:: with SMTP id o7mr45815275pgd.430.1641339645898; 
 Tue, 04 Jan 2022 15:40:45 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e16sm40848526pfd.38.2022.01.04.15.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:40:45 -0800 (PST)
Subject: Re: [PATCH] common-user: Fix tail calls to safe_syscall_set_errno_tail
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220104190454.542225-1-richard.henderson@linaro.org>
Message-ID: <ec288f1c-8d92-c470-6a00-283600ea6d8f@linaro.org>
Date: Tue, 4 Jan 2022 15:40:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104190454.542225-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 11:04 AM, Richard Henderson wrote:
> For the ABIs in which the syscall return register is not
> also the first function argument register, move the errno
> value into the correct place.
> 
> Fixes: a3310c0397e2
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   common-user/host/i386/safe-syscall.inc.S   | 1 +
>   common-user/host/mips/safe-syscall.inc.S   | 1 +
>   common-user/host/x86_64/safe-syscall.inc.S | 1 +
>   3 files changed, 3 insertions(+)

Queued to tcg-next.

r~

