Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A4324893
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:36:18 +0100 (CET)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5Zi-0006Ag-04
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5Vp-00050a-9s
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:32:17 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5Vm-00032z-Sq
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:32:16 -0500
Received: by mail-pl1-x62e.google.com with SMTP id g20so2312758plo.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SyOT17jyzgHgW/jX/UwRrk117meKVGY5BOWir/klOg0=;
 b=Shmfs6Ac8D75HumFCAyGikMcsTAp9jYCpMUH55wiMkFE5AFKJYn1FMYyhWQjy7V8me
 1p+dfmLvtLtJ2O+PVCVeQgD6t2SguBw55RADtXj2JqI4XwEdxAOG5OjS2H7lS0chI2UK
 Zrw0c305iv5HN0tCImjvCRmaiyoyhEoFO8KdjruWgVCC00CUvmGM4MtrYfVx1hvB3hlg
 gq7uXXYk7/8OTbtIfraurDOeBgysSSVeMnzbEf3IdUWwMfVzhQ1Ag6sHLOKisv6e2LzX
 08qVaLF6ERa2e30gvQujqvdTYE3yVpUhN8E8YIu3hnXmGLDWAEZ/Fgiq1LildUkrIfO9
 s0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SyOT17jyzgHgW/jX/UwRrk117meKVGY5BOWir/klOg0=;
 b=SlAmrPv+GhgQaSMIreOmZ/Hy/PHzw4KPoBhUVrvjW0JF07hC/Y/KVXap1i0aJZOPRU
 urWPZdF6VANM/VH8Q+dNw/t5ci1PGQMXafAtwJaWvS7bHa64J4XRpj6F28QI6y1RyzLU
 0/a/qWMAfIeUrj7KzMuYuCyYs5HuXBGgFPOAnrk0p5MVK5xnKdHwx8h92tDFr7WqPEi4
 vYkG4fLYHOseBRfevKEc6edPn+PFj+m9UctUo+9rlxmrW87dGkdCAfuROaiKbGt+QjqC
 B9/igxm2cTpV+ahxJTEdXQDHBDFs31prqfyhHTy8TGCOh4Huv73Pjtjtg16Z1asWzSqi
 6+PQ==
X-Gm-Message-State: AOAM533o2L4NNJAvHTZzXZ73kd7d69ptaMoXHqEByYMFrVLLVzEwDkaa
 yCt1rhElVlI3F923NqCdYyhWF99Yhq2N/w==
X-Google-Smtp-Source: ABdhPJyrOH6G94ed/725OEhnqEGfSgdOOBnMCfw8Avcz88MX3cHdnHUZM5Ql/58Re5OJQp5qo/Yd6w==
X-Received: by 2002:a17:902:ab93:b029:df:f681:cdf3 with SMTP id
 f19-20020a170902ab93b02900dff681cdf3mr621025plr.28.1614216733055; 
 Wed, 24 Feb 2021 17:32:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j3sm3624462pgk.24.2021.02.24.17.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:32:12 -0800 (PST)
Subject: Re: [PATCH v22 08/17] i386: split smm helper (sysemu)
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a688084f-b188-91e6-8dc8-7e2777cae0e9@linaro.org>
Date: Wed, 24 Feb 2021 17:32:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> smm is only really useful for sysemu, split in two modules
> around the CONFIG_USER_ONLY, in order to remove the ifdef
> and use the build system instead.
> 
> add cpu_abort() when detecting attempts to enter SMM mode via
> SMI interrupt in user-mode, and assert that the cpu is not
> in SMM mode while translating RSM instructions.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/helper.h                      |  4 ++++
>  target/i386/tcg/seg_helper.c              |  4 ++++
>  target/i386/tcg/{ => sysemu}/smm_helper.c | 19 ++-----------------
>  target/i386/tcg/translate.c               |  5 +++++
>  target/i386/tcg/meson.build               |  1 -
>  target/i386/tcg/sysemu/meson.build        |  1 +
>  6 files changed, 16 insertions(+), 18 deletions(-)
>  rename target/i386/tcg/{ => sysemu}/smm_helper.c (98%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

