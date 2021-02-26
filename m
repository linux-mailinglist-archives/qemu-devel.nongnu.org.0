Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245E532650A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:56:16 +0100 (CET)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfTS-0002KN-MU
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfRs-0001t1-Ng
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:54:36 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfRr-0001Ii-42
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:54:36 -0500
Received: by mail-pf1-x42d.google.com with SMTP id j12so6492951pfj.12
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 07:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YrmYXP8ctzyKIcUcsxmqed0xl+fjBvWydmZtexJ47wo=;
 b=F/XlZuQR5ao29lO3pP8jHPuBwVTjVJ5lHBJonPC7DSf56Gt572NwS/faWWL/uC37cI
 s98KX+x5vrYBF4Rkh97VglCwzbdHF/a7DCqc/V/Tp5z5ODOfBZcx3GZ9FXJHjUxM4+fe
 GQkdQLTcEKfZUlJJ8V+OZoyYcPd41vStFWhe6xlq2JqOIpdYGydqttS14ycyARkCCRlJ
 ER+qjRbc5KMvwlngxZviKW5nSxPlEALFJtIvviKrjSAbQkN0AQHk3lpvCMo428y3Pv/2
 HjJio39cLmOcimkUn5BJWw1d0ygqdZQ8M95Ky0U3JNlryzP0N6UuOLGsB38IVtDze2dT
 CL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YrmYXP8ctzyKIcUcsxmqed0xl+fjBvWydmZtexJ47wo=;
 b=o9L9XVynJJhldwaDmd5i8qhYQQdC6VG/n9VAIs/DTELG01WghDXg972xJRqiqm3Mzt
 p4uCyFvNkkpFG3uKHgKJv6Wc8pHmhPJ+kYGgMJx8cU+LRx1X7mS13EboBFHkQqAVWmcn
 z0RxGPeq/GNnarrUvb7fXabadrp6A4CuOOSsNQ7WapW5JLAHwdq3nUR+2MmEa+0tFUMZ
 xuKJXlN7lhOkWgH79l/v6uV0w9V5hHHaZrUuc6fUfDkGvQaVN3mF4jbPE57uC8KV02VZ
 TRgz8k6869Kc7lox5kjMFLoVN15A82dqBY44LJFVJVTtZ42o0bArvOg8AulbBMjRQEKT
 cFag==
X-Gm-Message-State: AOAM531rymUOejAl8famfnQKrJEjGWjka97O/ZB/bRFE6H64QDXYl12r
 5jmuOXH3UFIADdLw19ok+m7LYoPM4McBiA==
X-Google-Smtp-Source: ABdhPJy1fb67P/0ZJJLBxkwdFX9fv6VkPs1aTkFf/OTRbxGHn4jVR7/Pbalaj9ITseKyj7oNhTpLzw==
X-Received: by 2002:a62:f844:0:b029:1ed:264b:2020 with SMTP id
 c4-20020a62f8440000b02901ed264b2020mr3940104pfm.61.1614354873508; 
 Fri, 26 Feb 2021 07:54:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y72sm10128791pfg.126.2021.02.26.07.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:54:33 -0800 (PST)
Subject: Re: [PATCH v24 12/18] i386: separate fpu_helper into user and sysemu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-13-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94aba487-7ff8-fc87-bde2-8295676818c5@linaro.org>
Date: Fri, 26 Feb 2021 07:54:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-13-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> +/*
> + * XXX in helper_fsave() we reference GETPC(). Which is only valid when
> + * directly called from code_gen_buffer.
> + *
> + * The signature of cpu_x86_foo should be changed to add a "uintptr_t retaddr"
> + * argument, the callers from linux-user/i386/signal.c must pass 0 for this
> + * new argument (no unwind required), and the helpers must do
> + *
> + * void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
> + * {
> + *    cpu_x86_fsave(env, ptr, data32, GETPC());
> + * }
> + *
> + * etc.
> + */

I'll send a patch to fix this rather than document it.

It will mean that you can't split out these little helpers to a new file, at
least not reasonably.


r~

