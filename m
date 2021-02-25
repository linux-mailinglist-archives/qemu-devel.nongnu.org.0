Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FF324884
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:27:44 +0100 (CET)
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5RP-00021a-6l
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5P4-0001Cg-Hi
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:25:19 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5P1-0008Bu-2k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:25:18 -0500
Received: by mail-pl1-x636.google.com with SMTP id a24so2274535plm.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M4hqchPMXoW396/0K+JyDwdaCLQBCftO+i2UIsptxGo=;
 b=MG+P9Z/SvscHP0Pq53q89yNIJff7qiZ0bn8Gi6IA+kkFKbVZhcfTUkZITpCMHw9jHH
 tYIaffAnvehezJJFBFQDrjo7l+7CG7tkwz+rvlXaz3WQfAbkoBKKE9n0t6DPHHg3cnhd
 W591Z4M/vErEJpUVQa3WItoSZzzfUFlemBmQa+pQRdoHGXtcawGuvZ3ns31Gr7uRd/fx
 YyW36cziWqBikDT3OAyo+gP3Dmkir4PjLMWyM+3poWTmp9YWDxesSxWKH5DImDczwpPW
 hIW0F06SgUcfFXH/kO5xMLBrCVEUpnbYYt7BX1h/mOYCQhisMeLivOvo8mZA6E/Gtjad
 McZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M4hqchPMXoW396/0K+JyDwdaCLQBCftO+i2UIsptxGo=;
 b=cOu6JnDtqIvkxm/f4lxplRXlYgVOyO4GDUAZcrhXfSlNhJee8hg/FvW+fA3Fu5g3T4
 qzV2L7rHmmeLW+NJk4hVlpRbx9nq7k3npdRSbpWqzyu1U8hQazPr8mnQCjLQiYLfYQzP
 z0lYqdhM8+RTAQfkFZEJp4RuU8zEseOOVEz5t65ffur7hGuEZIEQJEVv+17NgCGKbuIK
 hiupfhhDr6ENN8CNQA8/ErF2CwidpIMydKYyHV3v+X1f4pUAo4MhZEQHsM0z8qF1YAVz
 keo+/11mHgurFR3cxPq54oow/H4MV1TD+Ygh2xCugRZ8XpCIQD7FJtT/p6qgXAdKlg5P
 yJlw==
X-Gm-Message-State: AOAM533/FuEGnwo9Q5JcXO6fvQ/IpxBBJQ4WBnADfhvweAeq7Db/4/yI
 qusSThl+OscttN086QJ9PraBBkwDuSOFoQ==
X-Google-Smtp-Source: ABdhPJy2jyg1lphPYpRT/aOtgZG4gtdUm4S9VIbcbIM/v1qzd4l/fHA1n/+boI+/6H8fpOJQLW0ebQ==
X-Received: by 2002:a17:90b:1194:: with SMTP id
 gk20mr668198pjb.155.1614216313259; 
 Wed, 24 Feb 2021 17:25:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id g8sm3780121pfv.140.2021.02.24.17.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:25:12 -0800 (PST)
Subject: Re: [PATCH v22 02/17] cpu: call AccelCPUClass::cpu_realizefn in
 cpu_exec_realizefn
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1503ed73-b6fe-b1cc-c653-cf68f74214be@linaro.org>
Date: Wed, 24 Feb 2021 17:25:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-3-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
> move the call to accel_cpu->cpu_realizefn to the general
> cpu_exec_realizefn from target/i386, so it does not need to be
> called for every target explicitly as we enable more targets.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  cpu.c             |  6 ++++++
>  target/i386/cpu.c | 20 +++++++-------------
>  2 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

