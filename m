Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104F326706
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 19:44:15 +0100 (CET)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFi62-0007Nh-3Q
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 13:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFi4n-0006wL-7j
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:42:57 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFi4l-0006Ch-M5
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 13:42:56 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q20so6826113pfu.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VEvWqr6DjJ+wXL+uAcfAdGGd9Cj4PIClIp0d9HchIfs=;
 b=zEj78fI5FTLs/mr/yZxO7wosoKMERQMf28zsf2fvi8eRmAOC47gDWIAEQxhJn7I41U
 i4gjOpcfjcMHD90KEu9kJTW5hhmvcyg5mkyb46wdYIS4D6HNJT7xbvzLlI4Aa0LJ9v3d
 ZFKCewYPAVDJULYwIB+BP1LR25uzjOJqe01ZGyO4aMZFuvqNmJlkBHla++1cOMghNZud
 aifgzDsQ6f2mc7TEkotug6EZOf7g63D142ynoQNwrgARa7VAXcvuw3xYFODkLwLoF6RV
 ZxxxbebkY1NHsqZMBpE5Sq8bXsDolE/H2nS6Gp33jmcQuordOgNKOK1ds5MTreZ4nSzU
 a6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VEvWqr6DjJ+wXL+uAcfAdGGd9Cj4PIClIp0d9HchIfs=;
 b=MhuAgfsUa2gPFsVhgsg2jZwqYX+VrYbSIii1D0vRAqDI4NPrO1LjTEJop4SAaBqSBu
 rympPvjW72KX6vDC8tmBbhSbCpB20dC83d1k7ztJgrip3KJdTSOdwTicWlpA8po1vTYB
 yXvOc6CBb/++hSO5eePIQ43YN2oMqsvWzX0Kz+JXZnd0k3tqzsc+GeBsm7rcDioLxdP8
 UhfFsLL5WVidLMrjo4cmMZVM7ZUeOdRcNKSPeK2ugnmZkHuhe5KJMTFAp9nOMyZaw6cb
 SMB7U+gxIZM//gA3q0cK0UDK7486DwRiqk4q313gDMPedL/uURw6OU78HxfNzwvwSsmv
 ufpw==
X-Gm-Message-State: AOAM5324uEnH1p20MgkDoCgWxAJIrZPWrhfryrPKDYZxKVO2/1YN6gEM
 Kg90J/5CaG2FmKNhOQdBoVObFOzR40Qtlw==
X-Google-Smtp-Source: ABdhPJw+E+ne7sx9SlaOU8erok2XFE8dUNc7D4lYdBbrlzHQtsfV2ijoABIZ+KA6vaGTy8se+GOqkg==
X-Received: by 2002:aa7:961d:0:b029:1ed:c1d7:b57d with SMTP id
 q29-20020aa7961d0000b02901edc1d7b57dmr4595349pfg.9.1614364973781; 
 Fri, 26 Feb 2021 10:42:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id t23sm6098007pgv.34.2021.02.26.10.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 10:42:53 -0800 (PST)
Subject: Re: [PATCH v25 14/20] i386: separate fpu_helper into user and sysemu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226175143.22388-1-cfontana@suse.de>
 <20210226175143.22388-15-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d08e847d-8332-5526-7b92-04ed7379f2fd@linaro.org>
Date: Fri, 26 Feb 2021 10:42:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226175143.22388-15-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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

On 2/26/21 9:51 AM, Claudio Fontana wrote:
> +/* fpu_helper.c */
> +
> +void do_fsave(CPUX86State *env, target_ulong ptr, int data32, uintptr_t ra);
> +void do_frstor(CPUX86State *env, target_ulong ptr, int data32, uintptr_t ra);
> +void do_fxsave(CPUX86State *env, target_ulong ptr, uintptr_t ra);
> +void do_fxrstor(CPUX86State *env, target_ulong ptr, uintptr_t ra);

Is this really worth it?  It means that we unnecessarily expose these functions
in system mode, where they are still not safe.

I had thought about doing something like

#ifdef CONFIG_USER_ONLY
#define SYSEMU_STATIC
#else
#define SYSEMU_STATIC static
#endif

SYSEMU_STATIC void
cpu_x86_fsave(...)
{
  ...
}

void helper_fsave(...)
{
    cpu_x86_fsave(..., GETPC());
}

but I thought the existing example of "do_" functions within that file to be
compelling.  I think small sections of this CONFIG within a file should be
fine, especially where it interacts with other functions like this.

I guess either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

