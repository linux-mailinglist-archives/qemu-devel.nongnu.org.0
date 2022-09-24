Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0115E8FC3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:09:41 +0200 (CEST)
Received: from localhost ([::1]:58774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCP5-000067-QQ
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCNz-00071G-Gj
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:08:31 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCNx-0008SX-Tp
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:08:31 -0400
Received: by mail-qv1-xf35.google.com with SMTP id l14so2135852qvq.8
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BZFYBamyd0iQvhuIfuA/jhz7UZNOoea2rsfsAFU/uSw=;
 b=duUnUHd7SHAfbnAwL4LO0GGVsGFurJv7JhUqQlxjdLE4R6aXgzscrAaxTPYS2hTrOK
 GGi0vQK/GJ1jdH3MlTMnkqVgDa30xelty4f+NmWekHudrGWRU0Ft5An5BElIkR9F6BDb
 iefd+sIT0PeU/+g0On8K+kdD0hTj7AsjAYEM4cAbBKcOeqCHqww+TKYNC4vlqZpYisNZ
 aLEqCC7hV+BY0Dvwg7sa8Ej7yCMyM+J85yIrhZAwz7yWPHo9eQeT1ETFClKmebtQfS5k
 jXkEreH+Qkv3nX8fiTkyly7J0FENpjRTQTBNGJq/8DMwYLM4cj0dCkQZVu8aJPe4CD4F
 q/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BZFYBamyd0iQvhuIfuA/jhz7UZNOoea2rsfsAFU/uSw=;
 b=6Ftf/WLVSBiTNAC7e6qBkPmJURBwfOFs5lxdW7ADukQkxX7hIskKAysHnR3tmImOoo
 0JdFDDp/Qkcnn97D+8FQ/k7Jp8cJBtkAdNAof6F2Dhsyk35UwhAWTF+bdgBKpeZHwEi4
 4KYrwtfGhrKAvEdnCRCxdQH/BCIEEg8E6a4mBamwwoaz8eZoTST5Ya1uX+NtnSHUvBYx
 HRnqYQqeo8UAsmXIByoopDa3bRJNP3Lgm/rJWIjOkw1IV23WMZDkf97UxeHbb120yqW2
 p3gzuJf6lww1ILkyIEV6QytgO55aVS3b7KTNQFbLyFOL2wr/Msj+aHGaT7m9h0aB+yBk
 CL8w==
X-Gm-Message-State: ACrzQf0Wi0DZgKOtn+s3R1iNrtmsvO4u4a0Ohf0MaUiLCOskqYyXLXJe
 lkdQlIR+ugaQFnx77gEYqSSygg==
X-Google-Smtp-Source: AMsMyM6BW+4uNRWFUOvuGEV5mROfL7FcNGQSg0auG8KufVTX6iXoHAHh1eD8PQqQj8gT27tAzfQ5mA==
X-Received: by 2002:a05:6214:23c7:b0:492:2ada:11d7 with SMTP id
 hr7-20020a05621423c700b004922ada11d7mr11933918qvb.116.1664053708852; 
 Sat, 24 Sep 2022 14:08:28 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 r13-20020ac8794d000000b003438a8e842fsm8005584qtt.44.2022.09.24.14.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:08:28 -0700 (PDT)
Message-ID: <a69eb938-dc6e-57bc-f093-b3c28cb410bf@linaro.org>
Date: Sat, 24 Sep 2022 21:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 27/37] target/i386: Use tcg gvec ops for pmovmskb
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-28-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-28-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> +static void gen_pmovmskb_vec(unsigned vece, TCGv_vec d, TCGv_vec s)
> +{
> +    TCGv_vec t = tcg_temp_new_vec_matching(d);
> +    TCGv_vec m = tcg_constant_vec_matching(d, MO_8, 0x80);
> +
> +    /* See above */
> +    tcg_gen_and_vec(vece, d, s, m);
> +    tcg_gen_shli_vec(vece, t, d, 7);
> +    tcg_gen_or_vec(vece, d, d, t);
> +    tcg_gen_shli_vec(vece, t, d, 14);
> +    tcg_gen_or_vec(vece, d, d, t);
> +    if (vece == MO_64) {
> +        tcg_gen_shli_vec(vece, t, d, 28);
> +        tcg_gen_or_vec(vece, d, d, t);
> +    }
> +}

You can drop the vece test here.  I believe I was going to try to cater for Altivec host, 
which doesn't have 64-bit vector shift, but then decide that the re-assembly of 4 pieces 
wasn't worth it.  And anyway, only ancient ppc host doesn't have VSX.


r~

