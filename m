Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA473611A2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:02:35 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6K1-0002WU-Nn
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX622-0008NW-UN
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:44:00 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lX61z-0004l5-2m
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:43:57 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso1751128pjb.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e2bQLxkyK6e3Kk2nLdEQ46l861Wy2SMGwWIy44j7jrM=;
 b=z2/wdTBYpoC+WSGFy4VmW5NIwwm+OoxMeEWwdKJsVH1Apjuhf97wq0wG8Qax5ARCYC
 IxsmPRjg+7UgamU/RhE6wT3zTfIcSTSfrl55Qn0tXZkILRMOBS/ZP/5zMfr5s44JiU3J
 IJp+l7zjkJNK5JfVsca/6pbx4+tKEfuwsbRV9TU6FPk0tV/Unv4CJ1rZif2QEdIYd5Mv
 5STAWU0IeviwKigAJSJV/XfYFxEUm61maqAWJQpGA2YdCU+BLrXPxj1RSyRK4vi7JUd6
 TkZ+urqxmgUhi8w+ePtU0LT4tq1smOhQPfhLXXvv6GVZSURf5DhlZ0k3RNxox40L+1Ey
 Kblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2bQLxkyK6e3Kk2nLdEQ46l861Wy2SMGwWIy44j7jrM=;
 b=C+y56qorXPFskCq+SaOXyG/0dtWO6/fGdUsnfIA2JWGQwAeIoitGRxrkJgzNttVP2L
 fslvMorm8q9hSgzOmCqLJn15RLURUMdgmcMQ9w0W2kMxEoLBbHg88fTIkSGpt6IZwJ7x
 VPu6kuoA+NFYbuP/d64KGBKyTQQZBBheIAFV2dmNto/M2V6sW6Ao0lEJX5nz5eyeUqOM
 8Pk+wnqr7yIiSth0ET8umG9z3Lfaw+2gQ1SCIik3qHdE6YfwHle5QNXAkOWlNPXatDga
 bO9BcTAwFev5EasvDIKSIO2W/0nX6AfVl+9tp4/eIVS4PVDs6s1AH509BvnftAmE45H7
 iq3w==
X-Gm-Message-State: AOAM531LsJt2JmSDNHN9Hxv7Up0UjuG7wf+Rv5fZxVKsn3MnKQZ/OnSG
 ZyaPi+cPPOzhXWfWtOEyyzCuig==
X-Google-Smtp-Source: ABdhPJzMuDAntGnfpHfsDXdlW1Em3qWFh1XB1rWC/9tQ5cOqmt34pyjceau6uxMq7HuJ2/5r2JB5/A==
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr4927105plh.47.1618508632878; 
 Thu, 15 Apr 2021 10:43:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 205sm2721597pfc.201.2021.04.15.10.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 10:43:52 -0700 (PDT)
Subject: Re: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210415162454.22056-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24c3af00-b29b-fc63-9540-044c59128436@linaro.org>
Date: Thu, 15 Apr 2021 10:43:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415162454.22056-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:24 AM, Alex Bennée wrote:
> By definition a single instruction is capable of being an IO
> instruction. This avoids a problem of triggering a cpu_io_recompile on
> a non-recorded translation which then fails because it expects
> tcg_tb_lookup() to succeed unconditionally. The normal use case
> requires a TB to be able to resolve machine state.
> 
> The other users of tcg_tb_lookup() are able to tolerate a missing TB
> if the machine state has been resolved by other means - which in the
> single-shot case is always true because machine state is synced at the
> start of a block.
> 
> Reported-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

