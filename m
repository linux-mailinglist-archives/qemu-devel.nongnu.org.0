Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B53480F4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:51:39 +0100 (CET)
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8bR-0007uv-Vo
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Wm-0004gM-IQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:46:51 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Wk-0001il-8R
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:46:47 -0400
Received: by mail-oi1-x22c.google.com with SMTP id c16so12973486oib.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PG+THLRh9lBOFFhsnImK9KGxJUF8gfrWUmvYXVXNspA=;
 b=A8iTzuoUNm24ZwH7Lff8AQIpCpedh/lit3iRSdRh7fEave8VuMRKTxnsqVYpf31tF6
 he+izricmD5JAW3HZMMOZZSSUTNV/+D8UHAk5s1K1XMlipk6x2QlGpBVP0RDUr9WAJiE
 5ojNpCA+nmooOmNiiX6DAKehEHONSZRh+p5Pyi3v4L5/24MjA5EJUEkqWCAAmLGd2Vxy
 I9+krDOz+8giaup/hCArzxdMMwjbkSZCFydu4Uadedt6f6VOdtU88aaeh0sw0dKFNKER
 sjf42+SirX5zf7kcgYPr+HMbTVNYkNZSOuucxu3TRiY2bOoV7BYRYZzHYYR1JAc28xI7
 M7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PG+THLRh9lBOFFhsnImK9KGxJUF8gfrWUmvYXVXNspA=;
 b=Ic5MSqqllUICx2K4oKi47dvDPKf9uDPAFabOvToybzo6SL6Ma/le3BCzN8KeGK+Hgh
 kqlcYqqzkw7IDbBrDEXwHl36qop2hsqhsEKGLAQHY6C1jMuc58fhWtztAr5dTzfF0CMG
 cEJsmZWzAKk5s6AvmPDxVQcUPUfb+ivhjUnt2J/cmkoJMtuoNPccOG4GVlTO6ijj1YbO
 U8WbSdKmKagf2MguOsGiUKW+TAG3msQDD02O5okJiuxkfo69k1q0vUeTzANX4W2wP6SV
 jw5QSPRWCtK3Z/pam5VY8lq6Xts+mmTaBxga+UWEuRpiWmbfpyGA6gXptT4EZz1tWwfM
 SEJQ==
X-Gm-Message-State: AOAM531CVykBG21WdmNWYvXarOUwRAxkN1nQLISHAfl1HiBmWqtvJK3Q
 LStoVxFUaBRFt9RRufa7gYgeWQ==
X-Google-Smtp-Source: ABdhPJxq1eOhGKhnpPQ+5cBzfIijjV+p8OJDzNfqK2V+IqgTXtHY9QiNXmkUmLKE0z4PmmaJtAIFmw==
X-Received: by 2002:aca:4bc5:: with SMTP id y188mr3317933oia.136.1616611603910; 
 Wed, 24 Mar 2021 11:46:43 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g2sm712044otn.32.2021.03.24.11.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:46:43 -0700 (PDT)
Subject: Re: [RFC v11 17/55] target/arm: kvm: add stubs for some helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-10-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ff24a3a-39d5-30a1-62a5-e11f04de082c@linaro.org>
Date: Wed, 24 Mar 2021 12:46:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-10-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> at least the armv7m one should go away with proper
> configuration changes (only enabling possible boards for KVM).
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/kvm/helper-stubs.c | 27 +++++++++++++++++++++++++++
>   target/arm/kvm/meson.build    |  3 +++
>   target/arm/meson.build        |  1 +
>   3 files changed, 31 insertions(+)
>   create mode 100644 target/arm/kvm/helper-stubs.c
>   create mode 100644 target/arm/kvm/meson.build
> 
> diff --git a/target/arm/kvm/helper-stubs.c b/target/arm/kvm/helper-stubs.c
> new file mode 100644
> index 0000000000..8e952c91fa
> --- /dev/null
> +++ b/target/arm/kvm/helper-stubs.c
> @@ -0,0 +1,27 @@

Hmm.  Is this really kvm-specific, or should it just be tcg/tcg-stubs.c, added 
with: 'CONFIG_TCG', if_false: ?


r~

