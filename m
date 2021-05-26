Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3125392018
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:03:52 +0200 (CEST)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyop-0005DI-Jj
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llymO-0003SL-5p
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:01:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llymM-00080M-IL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:01:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id g24so1329558pji.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hQf238pEXonvbZsg2GR5pssT9T1h4Mhb3NgP1p6I9lA=;
 b=YHhC94nzn0owuBRopyqQljoPkFnJiu8v9y1sO5kt7YmM08R/ufvOreJOXc9UroNdAB
 6ucx1P8C9j86SaxZamdec8hD4tlnU2P4Y5S5NobHs1nVmlVac5MF61A9aVZtwqrWfJy0
 jGw7IyQp/eBh9IVI2U0eVMZsl+e6DcUwPM8s38ylNrrKK1kn85bdO5aaAMPd+nUVOvHr
 Ms3IBCFHzfs95aIMpFaShLX19loLZUfaawohDXZH93Hwais2s8OnUTRHxxwkoHhBKr+4
 c2/+I6dQWrLLcYjxtyVswCKkQWnkXEWcD4e6f1lc9SJ0CPT7JjKl9bPEV2nHOOAb2PqB
 iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQf238pEXonvbZsg2GR5pssT9T1h4Mhb3NgP1p6I9lA=;
 b=m5ca5oam8aULv/sp/kkuC6XPbqujDfnDE7gWPof4Vw9sI2y7hW/EEe2YUsNXF3hg7n
 YQD9hul1YkoXymdKMlKIy5foHX9ikKsrl/zaCt0OrQxiVTDl9Ddbk7kL97Oh8KhB74bO
 EE0FeLd108ELh899jr9IVQVLcP7Mkju5NdQFOkJKg/qv5BHg9dKVXaNejkdPKC106F3W
 0QBw9u0ye+UrymDJAxD02/jlX+Kw0wgeS9zG4GSr/VKoC/XAAGFDzTvbAyiksnNuqY4i
 JqSdgQVh+qkNgyQpvucohVFcJ0PH/QIEspd43iSZugDyMWRc56FIrXZk+C049w3bBnSy
 qHCg==
X-Gm-Message-State: AOAM530tln5vNVW5gVzfVi8PwDwHbbd84s4ffUjuJPw/FIJrljUdKTpz
 P6yRkMjqAXVs3OlQK05Xnr3YKw==
X-Google-Smtp-Source: ABdhPJxdc9pfGCOv+u+St2XFyZD/lJeF3ralw0Pb9dh5HoTtEXxpH73hGzL8fnpS/lKvIgvH6R2BWA==
X-Received: by 2002:a17:902:8c91:b029:f3:b4da:4600 with SMTP id
 t17-20020a1709028c91b02900f3b4da4600mr37634948plo.30.1622055676841; 
 Wed, 26 May 2021 12:01:16 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f16sm19069pju.12.2021.05.26.12.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:01:15 -0700 (PDT)
Subject: Re: [RFC PATCH 11/15] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
Date: Wed, 26 May 2021 12:01:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> cpu_address_space_init() and cpu_reloading_memory_map() don't
> have to be target specific. Remove this limitation to be able
> to build softmmu/cpus.c once for all targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/exec/cpu-common.h | 23 +++++++++++++++++++++++
>   include/exec/exec-all.h   | 25 -------------------------
>   2 files changed, 23 insertions(+), 25 deletions(-)

It's not clear to me why the declarations moved file, instead of just droppig 
the surrounding ifdef.

If there's a good reason, fine, but the reason belongs in the commit message.

r~

