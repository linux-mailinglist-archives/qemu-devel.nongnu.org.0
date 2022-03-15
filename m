Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FD4DA4DA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 22:49:56 +0100 (CET)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUF3C-00046U-Vl
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 17:49:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUF2J-0003Kx-Rw
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:49:00 -0400
Received: from [2607:f8b0:4864:20::1033] (port=54785
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUF2I-0001p8-6t
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:48:59 -0400
Received: by mail-pj1-x1033.google.com with SMTP id b8so587232pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TkjFBHMJDjXpNSJ0cILeKeqg3TkAQfQE30mfXeRGjEM=;
 b=JuTFymzbbF7Mgv130+HdY0SR6mjAPZl9ZSExL3iG6HazrtyL96D+v9CMg9IsgD54ca
 OrOzEpijsmSCV0hY/joCoBzY9ZiNODoz1iow06cwsEGYhw1ktRpGBJesDs+3TRlqBa5U
 4gENrVGQxbbqk/ebOw/7A4YGw0ax2p3eclzZUzkutoQTrU73FUNX+4wAlFNywADhrGgr
 qBmPSEbhKQ8qwSpQizZGNJ+NNCU4GWtgGZ7pE9WHw/y3SZQ2WnF/3Q2Gt4xDJDWCENZZ
 scOPOdONGv6aAEeSPe2spEDs8lXNODZfsdBGvhRNIiX2W+VzWoft4zictTdkTGEKtPiW
 44cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TkjFBHMJDjXpNSJ0cILeKeqg3TkAQfQE30mfXeRGjEM=;
 b=3CENw1CyaGCaNfeKEvkLGuWGrxJeon5k7nU7NIZXHAVAA0DmlzvbgU+MTJOMXYXu+i
 nAdLQmMUgCktr0bHuwVTp2Hmawxara0CrW7HomZRVVVgiCtk0UnqyD9/sZ+eF5udkMa9
 fUhzYQxn55JYVXnXps9m/9FvAOgiIlNpvAvfAE6Urs+It419Av4xTgJ4X0tDxEySSpUf
 kQM4n0eUoDwvkZjJvI7dY1ijFashLcOYhldL+3e4ndkrG9UrNJcgQys2QMjlmHEHGAe8
 PEJr9ytgaWVaQVSIB+w+JwrZBrQNyB79glk0yzKIZE3Ivb9E2EFpslHn+MqeIKBvgLOY
 N9Lw==
X-Gm-Message-State: AOAM530LCgCuuFmokD3T2Oj3XExm4PYJqJ0PM6963n95tcx76fky9QVg
 2xsLrHsL7rLNbk2rA/rjHi59Tw==
X-Google-Smtp-Source: ABdhPJyGJN28WjpF0epXkhV2j6j4eJ3opb2pGhu3maFpcisOe2XCiUlU8l24rhHWo7S0Jm2SIszYuQ==
X-Received: by 2002:a17:90a:4214:b0:1bf:6ae9:f62a with SMTP id
 o20-20020a17090a421400b001bf6ae9f62amr6816040pjg.64.1647380936780; 
 Tue, 15 Mar 2022 14:48:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a056a000bd900b004f7bcb1cda5sm46681pfu.189.2022.03.15.14.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:48:56 -0700 (PDT)
Message-ID: <e9f23437-a0c9-3b7d-20e8-9dee7c49f89a@linaro.org>
Date: Tue, 15 Mar 2022 14:48:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] gitlab: include new aarch32 job in custom-runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220315121251.2280317-9-alex.bennee@linaro.org>
 <20220315121954.2283887-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315121954.2283887-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 05:19, Alex Bennée wrote:
> Without linking it in it won't be presented on the UI. Also while
> doing that fix the misnamed job from 20.40 to 20.04.
> 
> Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

