Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1938C8C4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:54:58 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5c9-0005N9-5M
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5aE-0002cZ-VL
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:59 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5aD-0008Fa-G0
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:58 -0400
Received: by mail-qt1-x82e.google.com with SMTP id y12so15249190qtx.11
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CsrmXCyCcTmIPHgB+rXBQZL1xH3MxG2ZsyQKAU9bWtQ=;
 b=q61OSfngmdA+xsyv4wrbGtSEF+Kjvz6mwlB3Oj3RFNqOux93AgbajErXBivkQ6rBvh
 HJZMWH7LHNj26rNUp5pskBnSH+uoHIGtadqyogCVefRhh3xv1DoEcVv9i1H45LcD29Ux
 dEUJTl/L7GPRu7SuB4g5RQFbic+hn7+PqUu17aF5a0Nv1/ockzYsndmqAFF3zCfy2Izr
 cRJbRcHSJwowVdRQ0v44gNh8jFBuxRlDbFFFUi65b+iZjxzXMlNf9HEQy4HZJXZodM5f
 tux2dLAqRl18AEAsb7mGh6PBdjxBMGFUxycVNz/w/EAqHxN2dVTIxV/BuwltWtEJJYUm
 2fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CsrmXCyCcTmIPHgB+rXBQZL1xH3MxG2ZsyQKAU9bWtQ=;
 b=FK6RmnBPdcW6cr9k1tI8/hrWdD+U3k0Cx1VKwwdK00Krxl40FrgGfFsAqzD/ffLasw
 //XSfIrL9FzYAnF7Q4SbruR6gFwKEswqnsRqrK4dFzzkNRi66sPrVo09jEgV1eeoLeFm
 8rf4PpK5lcSaBqWS3J5KbyRSb60gKF7hJaQasBqXyX+XDKOFbu1M8v79LaeOAQ0adfyr
 /H/6bCoVGuYNajuOm/NKbnXMZ4kR74+z/ZEa5v74zgXnO1+8qzzhoAIExSs2ODx7xGdK
 3aRZ5dJIfpUsg7ZXjrQVPwVjQDI6slb8khbvMEMAcZrYctMMXA/w0K6E0ga7uunpNvmA
 /Bjw==
X-Gm-Message-State: AOAM532zjGKzFKMNynYK/ghujF1izgAVOou9pcoODPWR5VX3y3uqV2wa
 tggRPI+DqCiWhGBH4x9nH93vsLCQMpUZfkFd
X-Google-Smtp-Source: ABdhPJwoAS9iwYozruWgztFGO1j7VgJkJJAMPjZmH04eTQP16GRT+3h4Pv61hN8hlu+hOOyQNfyohw==
X-Received: by 2002:ac8:5bd5:: with SMTP id b21mr11047421qtb.317.1621605176714; 
 Fri, 21 May 2021 06:52:56 -0700 (PDT)
Received: from [172.16.23.44] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id e20sm4407688qto.88.2021.05.21.06.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:52:56 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/m68k: introduce gen_singlestep_exception()
 function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
 <20210519142917.16693-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f16a2b12-ea24-cf94-4f44-59ecb8718be9@linaro.org>
Date: Fri, 21 May 2021 08:52:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519142917.16693-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:29 AM, Mark Cave-Ayland wrote:
> Introduce a new gen_singlestep_exception() function to be called when generating
> the EXCP_DEBUG exception in single-step mode rather than calling
> gen_raise_exception(EXCP_DEBUG) directly. This allows for the single-step
> exception behaviour for all callers to be managed in a single place.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/translate.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

