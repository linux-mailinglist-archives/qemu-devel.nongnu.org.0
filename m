Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630834BD21
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:09:01 +0200 (CEST)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXyF-0005f1-OZ
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXvL-0004LT-0A
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:05:59 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXvJ-0006lb-CW
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:05:58 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9973052otk.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dvY9hDeAsrZXl831Brhgqagd+MRLaSZS9S5TQK4tb0I=;
 b=ss0/MSvPUwawJxSCCpPQBU70QkobNM/VjSqr7h84yvm3OYM+4oPHj8+1ijQnzC7gNf
 ArSiGBjrTNdAZXg+NbflDpVjOA68ANg41/dRhZo3KsD0TVcHz+PZJPxImizRfnIM6Wug
 9k536nY5mzZPWuySdUDVJdMUY80JKNoOrrU5fJfDmrODqnLLT0ovYkRqYaAchuhpI1LH
 4ZcmXNpqVHZJLkwKO36Agj9q/hoF/jWKAwbD4tGsJ/JT3YVyux09Dz8C6jwhx9zcD/8D
 KU152omwKpceWRCUAU04FQiY+dIpHNybdIrRii9hDNGAYUiy5Va/vMgYS9dvUlZLhFuL
 J/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dvY9hDeAsrZXl831Brhgqagd+MRLaSZS9S5TQK4tb0I=;
 b=P0NE2qTMjD2MyKLX4JXfyOIaZCMIsLwNhLx71ivVVT8UEFjyPqMIbRkiysq+pEfSMY
 JV5cvH1fu4UPhY6KPSsAUlKtlGsfGQ6pdGwI6bn0Y0/CXtPd4PrOUY9Juejh2dD6QTTB
 IWbEpbWg/KvPVfCL77RdvdtFwxX5MfzJQwkQ2ndQwXb8NV0wJ/uB89xnKPxjiBHxbWq3
 TLIfwKsXGo5EhXRFAY4vhiDbstrhtjNgemn3EOyWfTzGOjLZwCjwmFAsBOUjJl47/ws8
 cZmBhc+1hc3NeVb69kPq+aVJM3NlyHALBeeH3xHudKZweABMcJK9eJZno9plqWfdGcp+
 43LA==
X-Gm-Message-State: AOAM5337jqIio03/Oy9tpzrQUutdinzWxc7WpgXPD2X4Mhx2EbIciJxC
 +U3UnpQ/RMTminOcw8FYhTALVQ==
X-Google-Smtp-Source: ABdhPJyyGcM4E1QlhIhnDEE6hVzQ8hHdPlmiAtIS6n++MoBogSM3GaV95MgrUoyO4bx+heWNIL0nQg==
X-Received: by 2002:a05:6830:18c6:: with SMTP id
 v6mr19259866ote.120.1616947556092; 
 Sun, 28 Mar 2021 09:05:56 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id h59sm3723082otb.29.2021.03.28.09.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:05:55 -0700 (PDT)
Subject: Re: [RFC v12 20/65] target/arm: move arm_hcr_el2_eff from tcg/ to
 common_cpu
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-21-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e8565b0-206b-c9cd-e907-4cc921adacf3@linaro.org>
Date: Sun, 28 Mar 2021 10:05:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-21-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
> we will need this for KVM too, especially for Nested support.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-common.c | 68 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper.c | 68 -----------------------------------------
>   2 files changed, 68 insertions(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

