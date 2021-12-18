Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C84797D3
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 01:29:22 +0100 (CET)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myNbF-0002nt-7l
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 19:29:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNZr-00022i-0O
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:27:55 -0500
Received: from [2607:f8b0:4864:20::1036] (port=35757
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myNZp-0002zQ-Cj
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 19:27:54 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso7179968pji.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 16:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=H9fS1GirEK+BY++QUxzfQ98RMwlhnbqztpwZcN51LyI=;
 b=IfLOabXI8Pm7sZ/yNQIzePwh+JG09TGDOlYPOHaASym2g3HxUj/eulE0EJCJYGwdT8
 RgAEu0SEfQiO7jw5weCX0HWJEUBY9MR+5fXf7X+typPhDZQYODPICxpCr3jprpek2nRG
 EK6uGr4v+bNpV37WMvvlUExkxeBXL09OTe92AyiqWp3ynM3OeUHq0yVdTY7xyzaPltZ9
 NtY5wR9/HkVY+979iO4nqXqszPwGMnjCrbZrL2S8GbNJJ7nAQ+gkhpwJNfTrw0IasbJE
 sDZTyCh/Bxwwu31d9Ohpa+ogMK2DXrjPh0RoU2Io4YeHkAyYvkxY0RkxcVZX8/VAyxnD
 u8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H9fS1GirEK+BY++QUxzfQ98RMwlhnbqztpwZcN51LyI=;
 b=uj5mHt6OlIwqMcgSH9eElFwqzbY3LGM3mx6tj/TklSSqskqaVQb1wo4uI9Btb9sViM
 N+z8u9EOo+9PAS1UBipC1Z4qZgCSeFS2d9m0lbMfbAZmwbY4/vOvFixrWqditM73sBKS
 GM9iTMRwk4l9GDZxlJMO96dJA7QQCCg9QoAyc7nt01Bt6Xskk1r1Hx7PndQfnBEd3iFV
 rw/ib6hzmIvpd9UEtbRpfWJM+cWdGQI99IxH7cU2BJqCcpVRNp3LFkBQSCmFoEC7bZBD
 vqjvoLNonio0wBLKPbVqfNGbr5MCDcNUl5ZUOxGHxGbwlZlEZMjpiXHAVRXWwxw5IneA
 CjGA==
X-Gm-Message-State: AOAM533NypQAebcFyv302kxTVNGBFeO2E8LDCKFORegGjWE2v2U8dK6n
 NiS5iRtACXXZUPEUI6qKtplpteVCWphmUA==
X-Google-Smtp-Source: ABdhPJxam27LgI66tcwleXLlooeZpJrbdN0XN71W7LHWp8rfW9Z12RaqJCnDNqImrww4tSleakmg2w==
X-Received: by 2002:a17:902:8208:b0:148:df0a:b1da with SMTP id
 x8-20020a170902820800b00148df0ab1damr4610656pln.161.1639787271718; 
 Fri, 17 Dec 2021 16:27:51 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ls14sm14322672pjb.49.2021.12.17.16.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 16:27:51 -0800 (PST)
Subject: Re: [PATCH] cpu: remove unnecessary #ifdef CONFIG_TCG
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211217104941.179823-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c007b0f-ffa9-cfd4-52ac-6fc4800c75fc@linaro.org>
Date: Fri, 17 Dec 2021 16:27:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217104941.179823-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 2:49 AM, Paolo Bonzini wrote:
> "if (tcg_enabled())" allows elision of the code inside it; we only need
> the prototype to exist, so that the code compile even for the --disable-tcg
> case.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

