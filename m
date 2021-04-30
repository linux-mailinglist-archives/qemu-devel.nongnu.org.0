Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B136F512
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 06:27:31 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcKkU-0001lF-0O
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 00:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKj4-0001F0-G1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 00:26:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcKj1-0008EE-Qg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 00:26:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id p12so48602663pgj.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 21:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KNKtGnBZ3E6wzPJ03gJ3XFr/MY81caJmnajG9tB+Rfg=;
 b=oH+xl088AqKhY9i7qHC8YJfwXC+PygvyKMEJJD5AocBmaDDRwIEoV56oc3/S2XILu1
 F6kgScI8IlrVw8IdsdPVnwIPmbPmo6OPVoVI/kT//0kYHiwCWx3q8iXepOdaZYKAVc8L
 fCq+V7xYrUs+PLMbosKIXYr8JRMuE9/xnWrP8MA6csV+lhkKF3Dp1+tieem6PVLxS3ks
 NBSpMy4Qy3qkmjBtxiFzgXtUczR2wk5co4+2d5BsP9u34uUp7KB8mD2VKc91JzCeUMm1
 Vn5iaFWOGZ9s4Uv8EDG4olnrRw1KmaT5RPF/PqXeVwF2j9txenniYOkmgJ1hxk7Fvn87
 jRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KNKtGnBZ3E6wzPJ03gJ3XFr/MY81caJmnajG9tB+Rfg=;
 b=aNA2zG5891DKHu2uq1tntyYsYAPwPs/t1HLlNpmFSvfIetG556w6R7ERmYShwSkeP4
 xwA21kToQ6Ypjnhv6f8jBFLPtNP18lEkgm6sFy2x15Xm10/9Hs6T1PxRfb5PhoK0dOR/
 oaqQMsiXTjFRCa06IFPM1rir1UdeGI9cg58pZdSF0vmExawkw2yqyn7Z6vTyHD+GYNrb
 XZQscvkf0i6ijVboUygVbAgIy26GzU9neZ9UyXGDXstsJwul3Uj2KdxoznhUqhXjwbrz
 QZeIwMZ84aG698ZcxLyZdXkDFLV0Z4iimFgObBzbBFzwZ5E7lgJsOJdqOxbcoRFUXyPn
 bR2Q==
X-Gm-Message-State: AOAM531Ef24jc8SxdMyVEUOfRGZ1qFC8+DLC8tWKv2+t5+HJFviyExeU
 q8AQ/eW9yqpkIE4/twpZBi7ScQ==
X-Google-Smtp-Source: ABdhPJx8rZ9lW21RaFRI4eFr03kUd2CLmEu45W87HIJzhLxTxodkJEDvX5aY2LpnsKtDS2GmH/OzUw==
X-Received: by 2002:a63:5910:: with SMTP id n16mr2908832pgb.351.1619756757991; 
 Thu, 29 Apr 2021 21:25:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h17sm689479pfo.54.2021.04.29.21.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 21:25:57 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] target/ppc: isolated cpu init from translation
 logic
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27263531-91ed-b051-ca43-b105ec44d19e@linaro.org>
Date: Thu, 29 Apr 2021 21:25:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> @@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>   {
>       /* Altivec always uses round-to-nearest */
>       set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
> -    helper_mtvscr(env, val);
> +    /*
> +     * This comment is here just so the project will build.
> +     * The current solution is in another patch and will be
> +     * added when we figure out an internal fork of qemu
> +     */
> +    /* helper_mtvscr(env, val); */
>   }

(1) this is a separate change to splitting out cpu_init.c.
(2) you can't even do this without introducing a regression.


r~

