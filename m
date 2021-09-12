Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478D407EA8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:37:25 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSTs-0000Jp-Dq
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSS4-0007uG-LM
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:35:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSS2-0003Bn-QN
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:35:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id j1so4633347pjv.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nwlwcWCDsVk2SbHKWzdRVt9TnWHMlhJWLKoJDMqVep0=;
 b=bzhLL5TZ12xdL8D2lCqSLJCkYxEJwpO1qvmi5Er2VyVbUT3tHS7bqpXAowoknPQNf0
 /Bra/6l0OInhuidJCPV3mNoUxulYy6Gs+HuaQ6a60V+Lbaqk0fCbZg7g0TUU8QNPhuLM
 RzNRoOjtoShABsCn7X/vijQg+lgzrAKcXZPwDI1IrO9DtMUNc00rmsu7QGPszxJg5xUm
 oq/dGrza/wAOVQruimDXgOm75fRGTQ94vlyayFqTGmB+EY+sslAZFlwNSDu2jP/OkC78
 cB+TC59RMuTv0Tdcnj9iZUT7Ed0lVMY8i7ULM2y5z1edH1pbKOAkQO0xg6U9EmsBpHNc
 mPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwlwcWCDsVk2SbHKWzdRVt9TnWHMlhJWLKoJDMqVep0=;
 b=gJGzNMvTNLFAJHgHz2VdF7SBnOBNSH69uxQdTKCim1AurGHETqUttg3kk172FSXyuw
 /jlweAlyIY4Kgyw3eMuy45qU3KB6kTXTUNpyTJSc3E4qawKscqLGxrnggbpfulLsfbeI
 Jz0HtXWzBYKBW8QqCKz9m56eI5iEZ7UHYB71o6kkbbuwYOsueig5L0b1lxGatI9W3dOq
 Eodf5lC//EUq5SVNbX+jHTb7MwTt9BXxhMJ2WGspVP7xNpnLn7CR4hqd+kcyUiVruVP7
 dYBJzn8WIeiK3AYpDW7KkXBbUBetRlVqyKlrh7RMjY9RxKsnf2bYP3Pu6qEHed+++7sQ
 VRkQ==
X-Gm-Message-State: AOAM530P5hz8KmV+mF1yFCHefYUSmdIQ6Su+lN3Skzwfi8+G7Rh1IpHW
 uV1j3T7ysJAClsegTYbh/hcqfw==
X-Google-Smtp-Source: ABdhPJwxgPUB5gQhgGK2SRr3u+yjpm8MNXS+WjTMWLJ+0KCRRwlD8S4TK/CO+P+eWFjTp4of1MkiFQ==
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr8284878pjb.228.1631464529538; 
 Sun, 12 Sep 2021 09:35:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h7sm4432148pfe.125.2021.09.12.09.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:35:29 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] linux-user: Don't include gdbstub.h in qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d95592c2-9e95-0dfb-229c-a2351561d056@linaro.org>
Date: Sun, 12 Sep 2021 09:35:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> Currently the linux-user qemu.h pulls in gdbstub.h. There's no real reason
> why it should do this; include it directly from the C files which require
> it, and drop the include line in qemu.h.
> 
> (Note that several of the C files previously relying on this indirect
> include were going out of their way to only include gdbstub.h conditionally
> on not CONFIG_USER_ONLY!)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

