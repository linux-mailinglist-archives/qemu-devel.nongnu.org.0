Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA03587CF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:07:02 +0200 (CEST)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWFH-0005wj-Gy
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUWDs-00058w-KY
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:05:32 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUWDq-0007WI-Sz
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 11:05:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id d8so1188304plh.11
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kp/K36LPcceZnEzoGJm1Ckb4/TJ/49ACoLX/qS7yYwY=;
 b=TPXYJf+wO1vBjBJFnmoqnELjsBSvZ5eAbJRxB3jker6l5iCgrpXXmdYCpXNFjOjV7S
 jxbR22qgmEtFMFe57XhUBVjukl+Tgu1+AyHO7jAwA/QaSSP8ZimBvoBCeLBrrgRHlm9K
 3bY1+J5UnTc8gZnmlQmKXdhTqA+ZfYMmnAaq+3o7BYbrlHWGWzwezzIuzM6CKGcfN0Ye
 De9EM/giNBQ7Sfemjfr0zSNwIlLJu+dHnASmvtfuRjyBDESYKUTrliHecaxgSYMhLlVL
 A7pb4T5h/7rMNfZwM0RKYnyZ1EsmzTzjO3FW+r8o7sZeUldFjb0b9IwjEK+XnWaRdwuZ
 URfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kp/K36LPcceZnEzoGJm1Ckb4/TJ/49ACoLX/qS7yYwY=;
 b=bIhZDMAKl4CUsa+6sdftqoqzwLwBMCZlUpPqUyURUuO2iTqNuXIqu86pkOjMXaAL/L
 zMdfUzuNGHOZKK4cHRLMoU5lYTSytgymRuwo5su33xQGSGpwDC52nXCRLdhZesY6rD9F
 Lf8I7pKrzH7S+F1Ie9aylfPsz4GMYtpR6R2SHRhPhey7YNYSGObN7/HRVDIef1tYpVEi
 EGE5bKudWX8z7qsO4EmEw3WBi4V+3MLEvf0TPQLxoTo3MaJU/fqakCwxecSl2sehrZxs
 lLuue2/7IhNspOrE/DrFL2BfwP37DV4c16BiAA58qpnZ/puXd3OYyFxo0tRzVnVUzCyb
 N3Sg==
X-Gm-Message-State: AOAM533gzcuzxGu6/+2GW9TyNMVuQu0TWZYudMygmH1UPSYi+OcZXUZM
 CUwFML3My4IFF/QCyiij4ZIw4Q==
X-Google-Smtp-Source: ABdhPJxSfuPf4WbhSSzLjRO6u+R8F+HNpUNOWlfvlvrIoUkgWZKzX+YfBxSjheYFzmpjs+c6mePaUA==
X-Received: by 2002:a17:902:a589:b029:e9:21cc:4aac with SMTP id
 az9-20020a170902a589b02900e921cc4aacmr8208462plb.21.1617894326594; 
 Thu, 08 Apr 2021 08:05:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t19sm25762129pfg.38.2021.04.08.08.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 08:05:26 -0700 (PDT)
Subject: Re: [RFC v12 31/65] target/arm: move exception code out of
 tcg/helper.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-32-cfontana@suse.de>
 <fe889df8-c11a-8e29-0ef5-84a89b449b36@linaro.org>
 <2e19f3f4-f8cf-645e-1d9d-13e3b208438d@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad612e6c-6a19-aa17-a0e7-55979017d6a0@linaro.org>
Date: Thu, 8 Apr 2021 08:05:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2e19f3f4-f8cf-645e-1d9d-13e3b208438d@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 3:56 AM, Claudio Fontana wrote:
> It is a struggle to balance making TCG-only symbols "invisible" to kvm-builds, so one developing for KVM only can forget about them,
> and keeping TCG things contained,
> 
> and on the other side opening up the ability to use tcg_enabled(), which requires those prototypes to be visible.
> 
> Where do you see that balance?

The short answer is I'd keep the prototypes available, always.

The longer answer is that I'd make more use of QEMU_ERROR().

I think I described this off-hand before, but let me develop this thought more 
completely.  Let's put some defines in a handy common header file:

#ifdef CONFIG_TCG
#define REQUIRE_TCG
#else
#define REQUIRE_TCG  QEMU_ERROR("tcg function is reachable")
#endif

and so on for all of the other accelerators, as well as

#ifdef CONFIG_USER_ONLY
#define REQUIRE_USER_ONLY
#define REQUIRE_SYSEMU QEMU_ERROR("sysemu function is reachable")
#else
#define REQUIRE_USER_ONLY \
   QEMU_ERROR("user-only function is reachable")
#define REQUIRE_SYSEMU
#endif

Then, in target/foo/bar.h, instead of

#ifdef CONFIG_TCG
void some_function(...);
#endif

we write

void some_function(...) REQUIRE_TCG;

which is self-documentary, and also generates a compile error when the function 
call has not been eliminated by a guard such as tcg_enabled (as opposed to 
waiting until link time for the missing symbol).


r~

