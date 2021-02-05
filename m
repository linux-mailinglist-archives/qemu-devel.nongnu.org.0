Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A465311219
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:17:33 +0100 (CET)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87Xo-0007p1-C2
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87WG-0006sO-9U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:15:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87W8-0004Dr-Sf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:15:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id fa16so3813619pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gpk004GJ+WR0mdgWcaU3G8WKvEs41j4kXDn0esGMPZQ=;
 b=AfTeE5BThdt4bXGA59UR1seoLgho+ZuTtlrkvJjkceiFp548D8falMdgKtyTjpi1pb
 pfcdh8iSgv04g9dgMntLOOdaoWXEdf6KbE892dCN3aI4Rtrm8ric9nJcs/NpKDNaMz+f
 AQfEMsMP/eYLNOYUbLG6HBvI/K62Mvbe4W1GhCkw+Z3ES+xVeo+xsGCuKHMdH2tYofQw
 FQQgLo+tWriLwWUSzqHR0Y+F/dPYRVEhLQNWX9zkJpnFtxNXmUO0IBu5LyWV11c2Utup
 WA1eURad213qWHWM/Bg1vqog5IR1cRNOiuMQeRTvE0SrUNWz4WW5/ujzEktAZmlSyVdy
 jg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gpk004GJ+WR0mdgWcaU3G8WKvEs41j4kXDn0esGMPZQ=;
 b=lRMrwRTD62JzOZBmGM89Z5Y7ATw6DzPw8k8EEfUiQ3MkqljpjXbvUmYCKBW8Kim6g7
 ksoxNXtUVlJjF0ot87Jf3QEoSZd5Fy82Cr/cn6ScE7ewm6HatA9ELG5PI6+w8zDjLpor
 N3gF5DxXIFAg9kjc1GFDNKWlanqU+z8qxcpvF7Vwu9A68Hzs6ThB0gpihgoMwxq8vSej
 jmU7urG6W1Z8ck6okuYBUoJKlArWZMoA1oDFo2z4pRnmQJ+Cxn4JnyodoBExEmS8QmXM
 cEQ9JjWWx0HjDra7bivmLQfOGTdEymNMcIJHJ5BtWvHwOUm0XO33RbmfWFFHuSPH7wxv
 Z//Q==
X-Gm-Message-State: AOAM53195+yaPlvysj5hO0uC2r5mwJyvw8IrPCELsBl5aapY1rpd5rFV
 PIXg6m2LLVXIDtX24c+LRlwYTNPjIkKlS4DB
X-Google-Smtp-Source: ABdhPJz1GtxJuYMceG2By+STkWbr53yA3f+8X5MBzY4/48xiOlmodOogkMojAHA0xubc9GOQ/CJXCA==
X-Received: by 2002:a17:90b:4c10:: with SMTP id
 na16mr5620745pjb.49.1612556147500; 
 Fri, 05 Feb 2021 12:15:47 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id f7sm9145746pjh.45.2021.02.05.12.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 12:15:46 -0800 (PST)
Subject: Re: [PATCH v16 22/23] target/i386: fix host_cpu_adjust_phys_bits
 error handling
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-23-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa60b5a9-b072-a967-879f-6cd2b3f457c1@linaro.org>
Date: Fri, 5 Feb 2021 10:15:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-23-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:39 AM, Claudio Fontana wrote:
> move the check for phys_bits outside of host_cpu_adjust_phys_bits,
> because otherwise it is impossible to return an error condition
> explicitly.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/host-cpu.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

