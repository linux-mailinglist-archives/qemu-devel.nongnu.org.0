Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B366234BD39
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:20:03 +0200 (CEST)
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQY8w-0004DU-Oq
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY7w-0003lq-4U
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:19:00 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY7u-00042z-AV
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:18:59 -0400
Received: by mail-oi1-x22e.google.com with SMTP id i81so10870186oif.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=exC/QbdEHuulcmp0vbK9k5ga87rHXg2/4WNCmNpJbss=;
 b=kncYW2pZjhQrZbLqlrVQ25JsiBQHs+/zOYq+kEtczAWIHo4aJKTANYJTNnVXrX3zYV
 DH+NvcnY+OXf4mXSYCYyIDI0eSTa+RGCqybl8NleuZRCCPOvi3yctuQYyx7Q+VGHoYzk
 ivwkxXDAVqXxKd6TgsdSmod43Sie+Xdvmy2gJSKIxnQOJz1G/dlLc+rLiVTF7gmPgvs8
 GarKmPtwTIl+g6QGV8VEYQcWpC8zEGp4R4DNP6ihAgEkVIH0TG2o0HsFcBiVxtbbPRc7
 egcP9jxDeF4uWHewpcrflohJkFBqHDEiliE8qKSwU4J2uYT3FmbYWVZvnDg+lY0FWa0z
 aBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=exC/QbdEHuulcmp0vbK9k5ga87rHXg2/4WNCmNpJbss=;
 b=CRVSxCKrTIuLFo2aCbGnoBncCII8SuhR96T+5VnyuvcS+LaZbRBBetwUpsvKPnbwls
 e7ceQ7jTU0AIo3R+4sjkUF5AzgaRaZXXa3WkMFjFuf+W6lFewN63kH4QUT4GpT5SLLYN
 jpkVD69ipbm1bfOOUmJuk6ys337oKfa+bRGb1eUT4BP5iQyi0txbW6KKfC481mqBSu1w
 3n+U6tUqAFdS3aa7rsYSt18xlOvCXJwc63NzrrXL2k+upVgxFgwqLutG1jFT/biN8oLg
 u6esJENnXydC/dPcT9su8G41zkhRklrEq6ByAE0D2ufCzJAcXzHVbGfGoMQ01TSBKWpr
 /8wg==
X-Gm-Message-State: AOAM533ElDH3NfFySwdhDRD8Rz2wV6nK/KwxltYz3vTJIHPNeBsiTRM5
 BazNE8cqf7cLduLTv3JaMqi0iA==
X-Google-Smtp-Source: ABdhPJwDv+mBq2r+mIsC1f2ZfKvxRWLyay7eTbbJyE3G6nCW/Yyb32nXS92S08iMGQTgV9Z+3E/Szg==
X-Received: by 2002:aca:530e:: with SMTP id h14mr16320207oib.79.1616948336985; 
 Sun, 28 Mar 2021 09:18:56 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id g5sm3028228oiy.24.2021.03.28.09.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:18:56 -0700 (PDT)
Subject: Re: [RFC v12 27/65] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-28-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e49aa062-0958-1d4e-c682-28d0a2897493@linaro.org>
Date: Sun, 28 Mar 2021 10:18:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-28-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
> provide helper functions there to initialize 32bit models,
> and export the a15 cpu model.
> 
> We still need to keep around a15 until we sort out the board configurations.
> 
> cpu.c will continue to contain the common parts between
> 32 and 64.
> 
> Note that we need to build cpu32 also for TARGET_AARCH64,
> because qemu-system-aarch64 is supposed to be able to run
> non-aarch64 cpus too.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Dump state has nothing to do with a15 or the 32-bit models.
Moving that should be a separate change.

The gdbstub changes are also a separate change, afaics.

I don't understand the a15 comment above.  Is it really relevant to moving the 
32-bit cpu models?


r~

