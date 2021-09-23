Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8034171AE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:20:41 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkBz-0001SP-Vc
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjry-0006S5-IT
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:58 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrw-0002fr-TB
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:58 -0400
Received: by mail-qv1-xf29.google.com with SMTP id cv2so7623qvb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cGt7cN2axKdt4OozFPNAXRfdmKbEPDJHcPL0NR/Uz0o=;
 b=frUCkBqAdLxUrIRrVyE/5lXuYMzSkhf/T7C4PP1DBP+0s2RJ3EjCd0Im9gTyrpHqjO
 9JxOo29mbhjWvQZo86BmWmGQdi+cVFoPI2xfCSRb9OxTFRm+CxwX2YuQQAupAa4RPqmQ
 B8gyAqVHNveB+O4JmESBHi1hAKlUazrid0G0No0AojoppSVfeS3hn7Tq+dwCFeKsPueX
 NguKNtLfDhQ+T992ONnbxEYX0XrB5vk8kOP/iJYjXP7ChnFHdNUaqbBfg6ZPhuwomxFQ
 gZi+Jv/T7YXp1i5XsHmMK5dyPnQODJEtH+QetD/wT6KQ75R6rhOvlloNtRakjaD27pPv
 FOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cGt7cN2axKdt4OozFPNAXRfdmKbEPDJHcPL0NR/Uz0o=;
 b=NNN8ftCnqPbxXC9PZCIIVznJzFjZ3rgM7FSQMcWaupcPUXzT1soD50I9fuUIRvLGYB
 MFA4Xh5bKFlQmWUzkAh8EmYQab9ZGe/nM9sJUzFX63sr25YiklrqZJ027jmKfjltPaK0
 Kz767qcCet0Cq8BSoryDDrwYKZHXGhjpxwjPy6KHiYCra033422dLUEgx7ofOETUIP4C
 pDK6fWxUbK1XdpxLI2sF0mvE8KRjklt2gK1kLGuUZibi2qN9/La+zXUFGYIQSy3HJxMH
 HtN07FRy6vWSBdDKyZ3difNuNd6OvLF1pIwx6FTACZYSlSgVoX7JKhD85jIlbaFQvPMH
 f9Mg==
X-Gm-Message-State: AOAM533p4Kzi0Yu8JW+BjcRu7WHgLnreVZDsIZD6u538u8rSJuW8eY05
 8j8bNMj1ObgABzr3apRYk43AYY1zURlTPg==
X-Google-Smtp-Source: ABdhPJzooIwgEzlYajrjnpn8KN41i4dvdqt6eqe+a1C2qfZC7cJYrWtXdb8UytCpLnlOm/rnqVPQ1A==
X-Received: by 2002:a05:6214:40d:: with SMTP id
 z13mr9293786qvx.38.1632484795991; 
 Fri, 24 Sep 2021 04:59:55 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id x9sm996483qkm.102.2021.09.24.04.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:55 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2b63a27-e87e-9366-103e-d137ca2df98f@linaro.org>
Date: Thu, 23 Sep 2021 10:38:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922045636.25206-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:56 PM, Warner Losh wrote:
> MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
> the file is now a confusing mix of the two.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   bsd-user/mmap.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

