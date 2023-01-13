Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E766A576
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGRz9-0008SU-Q5; Fri, 13 Jan 2023 16:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRz7-0008Rk-Ce
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:53:13 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRz5-00017B-SY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:53:13 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bj3so20491129pjb.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 13:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yjPEazlwvwtxjBRpRghWMaaT7Vhs9FH+tDBK1Pp/uMY=;
 b=bxw8E+STomA8T4dNH6I56QGbe2CwYFtrCU+NdcWjTglb1sLTSKlqIhWCD5E+CqfdTk
 FLQmYAtV0F74YkikzoMA0lsikmhG4n/wAyBysEgXyIHQnMsvljWtRhmbSVQ+DycueWR/
 +GrhkXS7OP0vDhwCwXoQZ7aIJrzj4ZAA0MVN5YvatrIkaiLZaUdVFqopNhIVmYBj86ax
 O1pVib/HG84lSgn2nWz4nKefNspcm/liu2F4qrQGDm5varFZB5XeCqSQnFdesAudjzLt
 PJCr5/Ofe9Pac+N+l8dUOgiQu3wxvtNKuGKt18jFr4Y3UPYcC1cvNt01LpS55yH4Ixd0
 OrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjPEazlwvwtxjBRpRghWMaaT7Vhs9FH+tDBK1Pp/uMY=;
 b=ehkpOPzRKerJRzL85378uDO5GaLzaroCvrpa2bV8hXpYThsQdgfHdc5O8Q1vHWDMhG
 NLQyyHKSLowV0CxK5A9UPbhmBZOc4A+h/ShQb8R2cFJgRuiCzkVRL8trwyK6q/m40+U1
 iM4tHXaLC60p2IZn55ffqxnm0icLD+yoW3axtGcA5n5fDrmdq2sJfuP847E6Z92gLcHq
 KhEyTAYgxXnI7YW+mU4gV4YIdJuANENfmti9Xxh+JOybyFNt/N44OLwoSoQRSYnGqLwC
 X5Xnc/eTRA0YzIHZay7FBiSplX2GiDKwHl/03N+amAweUFnoDm1cRZuOvkwWeFAlGLPu
 AAhQ==
X-Gm-Message-State: AFqh2koUH5YjHlaUKzuID08fbqYMBUEJjKvz2qv9hC32683LJa43aApK
 tv+oljOJl0RZBMsb4aXY7UMsEg==
X-Google-Smtp-Source: AMrXdXtQuhcN05zTrUAUDPROH2w0lnHblenDRb5j0w2niSkg+0bD2lhIzKeVYn50RC440VnKV/HZ7Q==
X-Received: by 2002:a17:90a:1b6c:b0:225:e016:e2fe with SMTP id
 q99-20020a17090a1b6c00b00225e016e2femr13133241pjq.31.1673646790410; 
 Fri, 13 Jan 2023 13:53:10 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p3-20020a17090a868300b002132f3e71c6sm28604pjn.52.2023.01.13.13.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:53:09 -0800 (PST)
Message-ID: <d815d52d-ee1e-a7fc-7214-6d30d38cc447@linaro.org>
Date: Fri, 13 Jan 2023 11:53:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 08/28] target/arm: Wrap breakpoint/watchpoint
 updates with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-9-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/13/23 06:03, Fabiano Rosas wrote:
> This is in preparation for moving debug_helper.c into a TCG-specific
> directory.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu.c     | 6 ++++--
>   target/arm/machine.c | 7 +++++--
>   2 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

