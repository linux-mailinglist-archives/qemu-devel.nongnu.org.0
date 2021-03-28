Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E534BDD5
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:56:45 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZeW-0006Rc-Rj
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZct-0005tn-Rd
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:55:04 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:34638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZcs-00044a-3z
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:55:03 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so10167013otn.1
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dKsG6LMobjM4xv/MvEm1Kfj0eDUO23Y6LfZEKjogEX0=;
 b=Gcd9RRgROQL8Wmtxxy76KTk6wMTTYGhs3hYbHJoFIQ+gHULORz7RFiZthy7R7OLLmP
 ywx1VaR6UNPki1jdL19+WrvwUQ7IEAJlauYWb+G1evWQrKHs+Q1AP0URtyI0j6joQO4t
 VciCszM/5PxwCC7eH7OtDWaccvtdkBrkbVX2jgaiXeAUuyPd5AXeXv3RXCuyjdyHctVs
 u5KNAYiJ+VHsdN9Clq+ndrQ4CS/m6YxFp2CLqiUw6RWKxcIwzcrtHWkhnOemO7aJM5pO
 3nz07QHO7XJhhYykywVblIUxC4rNAwPG4QbRqqO73PosqrM3AImbj6i2mpEGRi+gLysD
 1kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKsG6LMobjM4xv/MvEm1Kfj0eDUO23Y6LfZEKjogEX0=;
 b=HE63qJFUjmmf8OMqG3M8LLxi/GWF6tVSmw0k39aUCi7seoEFI35RQy3O4OhEf4gV8K
 K0hOXHhRiXQTlgaKi9hIHaVV0/tGYxVOYCNwvapgCAr4J939dVlO/o35VnwxdhlNP/Q8
 t0V1X+cRDmzvbmIaz9pTZORHWwQR2uJxWqqEVB+1kMH71r3BqJFeHLD0PXCOQ1nEyQd8
 F9j8mhamzOv9wUw97zp31zp118w18IpIdZTZLs+ABWFwIAZYGgLguml9jjvryMgNtr8B
 E8xzEJUMoz+RDuYFNsNY4pGDMKitIpeVhF9p07sJLsvz094A/b0iUzhoeGtnmPjcEHo5
 7DBw==
X-Gm-Message-State: AOAM533i8ErZuT7vWwBo8ITVwz1qd28AaHzpRqUMn59vO63WX8upVwZj
 RkXQveeTcbU9hyAvqANEa1bjvCimbMoUBcZb
X-Google-Smtp-Source: ABdhPJzcSJi9yBoSatuIQQgC+q+tSq7S2NzUODx/ycHctp5I0OL2NQbs/aTSYiVpXgk5UmX4ri86AA==
X-Received: by 2002:a9d:7453:: with SMTP id p19mr19642166otk.271.1616954100993; 
 Sun, 28 Mar 2021 10:55:00 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id n12sm3912964otq.42.2021.03.28.10.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:55:00 -0700 (PDT)
Subject: Re: [RFC v12 49/65] target/arm: move TCG gt timer creation code in
 tcg/
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-50-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88da5b04-b1a7-50eb-d925-b6e1bc75fdb0@linaro.org>
Date: Sun, 28 Mar 2021 11:54:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-50-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> we need to be careful not to use
> 
> if (tcg_enabled())
> 
> here, because of the VMSTATE definitions in machine.c,
> which are only protected by CONFIG_TCG, and thus
> it would break the --enable-tcg --enable-kvm build.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/tcg-cpu.h        |  1 +
>   target/arm/cpu.c                | 28 +++--------------------
>   target/arm/tcg/sysemu/tcg-cpu.c | 40 +++++++++++++++++++++++++++++++++
>   3 files changed, 44 insertions(+), 25 deletions(-)

A little bit surprising this, but ok.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

