Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2D6D513D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:21:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPkM-0000vC-Lb; Mon, 03 Apr 2023 15:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPkK-0000uq-Bk
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:21:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPkI-0002g8-Jk
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:21:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id l14so19909819pfc.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680549697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kGVrzsAyd/KO6EbrTARquJYHhX2kSdJNFpsez2vND4I=;
 b=fcky7GM8AnKvcnLYG4IZSlJDwMb+AiNrEZTxHpTUtbmyMf2nitR2+g5jIWXGxAm0h1
 ZPBWGzLJ1C6BuBtnb+xF8sjY86sZunaac424zr18Z/NjRI173dCjIJN/OgZkGpOu/K4s
 QoP2Wy1t7MG429oFczSPlHCDFDR632J03AUlEipv7OQG/vnJLOe28pjGlYblP5boETIi
 ZZ0/ECPp6Qou+rT0A2ux4k5IQk/XH7nIg8V7vKEzCEda1+813TKewe+3wSTh4xVs7Y7q
 3K3On+7v4eZiLi0MOHpGr2Y4mMoTMXbDHUqghxJvyXRULHswtT6xDlO2IiOfrKxsRTzg
 Tmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kGVrzsAyd/KO6EbrTARquJYHhX2kSdJNFpsez2vND4I=;
 b=n2drrXNHcWGXsgnZl0fbjudxYfHvvgWqAZFSxL5iFLUNY+OehL5I+uH9dVva9PlYhN
 1FyVw02tDuS0u0llT39oNo2WUE0wF2y7VW3zatRANsMBDQ/Bx5kSlYnhSN4rANsFuhth
 sTPJDGD0Lz9oHvx4UjW0p8nMIXuDaJaaNDUMK1DsYYF/19JBQCgp5TOTjiEofZsoGoAN
 RrTA23wmYZolQoNCxyqZ0qWbYDzqNYedk4GdvdGuhRtIjfwxEb16I4MK9reK9PiDyHZx
 X5GU7+/hCaUYGHszcW3BM3tqCbgtj1YWe5n+vwEh/VuB5/jgDre8gC3Ygayaxo+YpIGs
 VrIA==
X-Gm-Message-State: AAQBX9cu1WG7NSMimj/MqD6woriab0iBB3CRlIIWi+hFZIxVxm9B6OWm
 zr/Ko5bDsILqmS/2wuoZbfv+eQ==
X-Google-Smtp-Source: AKy350YQx3BHzbmA2IbnZEl3MtffRqpMhyVHIGCpGLQJpTeukVwTGR1O3B0lPcSTI+haoSPSdy9dWg==
X-Received: by 2002:a62:170a:0:b0:628:1862:dda6 with SMTP id
 10-20020a62170a000000b006281862dda6mr37968pfx.17.1680549696953; 
 Mon, 03 Apr 2023 12:21:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a62aa15000000b00625c96db7desm7260774pff.198.2023.04.03.12.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:21:36 -0700 (PDT)
Message-ID: <0f104a94-3d4c-c411-f740-8cebd038f42e@linaro.org>
Date: Mon, 3 Apr 2023 12:21:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 06/10] Document that -singlestep command line option is
 deprecated
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 4/3/23 07:46, Peter Maydell wrote:
> Document that the -singlestep command line option is now
> deprecated, as it is replaced by either the TCG accelerator
> property 'one-insn-per-tb' for system emulation or the new
> '-one-insn-per-tb' option for usermode emulation, and remove
> the only use of the deprecated syntax from a README.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst | 16 ++++++++++++++++
>   qemu-options.hx           |  5 +++--
>   tcg/tci/README            |  2 +-
>   3 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

