Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C207F3C16C3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:03:47 +0200 (CEST)
Received: from localhost ([::1]:51324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WV8-0003To-RM
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Vqs-0002ev-3C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:22:10 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Vqp-00013K-RA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:22:09 -0400
Received: by mail-pg1-x536.google.com with SMTP id y4so3832892pgl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z3+Q9ODZjlDSPdw6IBnWtOgaR7okcL3u6WMzL8uhktM=;
 b=TK+EvJmx8qRhfYKj98Cx+gUzBDcQ+DyHGcsppJeLx++a6IHg4CURREFfoE5XgtsG6J
 bQR1o+K2lONhQzWuiYhBSB6D6EKjcgKS57cK32WcZpbgh+RZNVp2jxZOGe+jk/YMdPnb
 pvakJYdPz7bpsoa30EyU2U8rvchu14NymqWjL0Q8sx4y/gg2QFb/QM1vcXngf0Skg+7r
 cETAWDe0CY5Hp3iU6HS+LZYaM7NtsV+BYpg/c4lJ2aMfaMsh+rfw2RLx1HmPRkKi/hzz
 ShnL5A6+j+d8bzKZ/03SiicXnelu0tvYuOdBBk4DbK5/iTwzmWg5zBEiWAEU3sdE0HBO
 e+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z3+Q9ODZjlDSPdw6IBnWtOgaR7okcL3u6WMzL8uhktM=;
 b=eW2xXCG8G4poTzH+++0McYJ5VH07d12AOh4dINjE9v1Eb/7YNcDbo6oaoaT8tFF30Y
 mUzvs2WCDezI1a9lMWk7kj4RKF0mEjF8ULhgQtGboa/sW1rTv4vLWbXzDHnl1njwR2sY
 LJTqbBfO5D/hcIK+fI/Pd07NWIrqhZqHXOCU5CkBZRnORglks+dHAAfcfKYoqHeG67AK
 VD4iUCIKgAUd1mItn93xhMSgqZ92TntTS8w2izY6kuYf9JsX4AfyVEwHAGi+bZNyAyqw
 c6i9lWtNJMq+nLvZtx1asIgJTLdvC2s/T3WwPncd38Q3rc1oy1sTW0xS/zrDEDSKxijG
 p/nQ==
X-Gm-Message-State: AOAM531+jPuQEEaTNtTDQim8EUH4613M7BbJpWk35ssbNmvibzhrKK17
 rZ8kNzQQ6hlcXO7hb+CXPihdiA==
X-Google-Smtp-Source: ABdhPJzWKTHnsttocosGQjtRPjfaTz1zKUbtbCwB3uWhuMfWcpm51tAxUa03Ml/Fb/HwBoANJSJr4Q==
X-Received: by 2002:a65:68c1:: with SMTP id k1mr32443829pgt.335.1625757726261; 
 Thu, 08 Jul 2021 08:22:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k5sm3110066pfu.202.2021.07.08.08.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:22:05 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] target/i386: Move X86XSaveArea into TCG
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
 <20210705104632.2902400-9-david.edmondson@oracle.com>
 <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org> <m2czru4epe.fsf@dme.org>
 <m24kd5p7uf.fsf@dme.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4a048f5-cc6d-7bbe-6659-54075cafb9c6@linaro.org>
Date: Thu, 8 Jul 2021 08:22:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m24kd5p7uf.fsf@dme.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:45 AM, David Edmondson wrote:
> Actually, that's nonsense. With KVM or HVF we have to use the offsets of
> the host CPU, as the hardware won't do anything else, irrespective of
> the general CPU model chosen.
> 
> To have KVM -> TCG migration work it would be necessary to pass the
> offsets in the migration stream and have TCG observe them, as you
> originally said.
> 
> TCG -> KVM migration would only be possible if TCG was configured to use
> the same offsets as would later required by KVM (meaning, the host CPU).

And kvm -> kvm migration, with the same general cpu model chosen, but with different host 
cpus with different offsets?

It seems like we must migrate then and verify the offsets in that case, so that we can 
fail the migration.


r~

