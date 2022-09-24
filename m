Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0785E8DBE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 17:15:57 +0200 (CEST)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6sl-0005H0-IC
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 11:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6qa-0003sb-46
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:13:40 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6qY-0000Gk-Fd
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:13:39 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so1776590qka.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vbxEGP53D53jlaKXKwNQNK+28r43zFbG0NbVbwxsdqI=;
 b=RZBD3V5SJ6NkKffFV20cNegJAk4eycXv1LxsJdyJfvN+5Mou7R5bD5BQ6rmuN2WVXV
 5wn/EorwCUDzRBC1JCqliBpEQbmnlvx8tE4Iz+JRY2ZsS9eNBldMISi9AduNulrI5yuh
 6c9x+T6LyNBSb5w/0dyGLZfzf9tFGOOJV3kIaIkqu5lLqNgizY5Ar2Es+YzQlyKyHTcj
 tQcrNxwWBAd+n/qGauwRXvvgMA5yljWPLNYvCSRSnHU4PR+LIcVGHytGwzBy/83gbiNE
 r0v0h6CMuUplZ+DwNiummv4NTZU/A6hjRzczPRq4k42XpBw8W3nexFkhyusrh8FOrydq
 QNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vbxEGP53D53jlaKXKwNQNK+28r43zFbG0NbVbwxsdqI=;
 b=36pgp1w7aNW1qEzWv2IKlf4OrTPA9ahF8MsgaRyw6Z9oqv1+g/96raHoKFDcY8gqm7
 1KCczviVuNCa1B+23xUns1fATthO2GxgOhsp36195pDcmYx0T7BVVh0fs0+U5+4cpKzw
 gzjQnGObX1V944HBQaeY0w3ztscubwNdnWMA3ULmayoJpHMSWioIuFx3L6fAu8LlvTI7
 10UlwKwpnN1J17p4miwrP+/cPj3TArkCCfztTquhRars3K6wr486htdw28tZPQ1x0AuV
 2BwLrQUgAoPcdPFS/hZueks8tvbmXCtY0kiE0BcNEVi3D13UD0B6xCK9uIWEZrfz8w/h
 CXCw==
X-Gm-Message-State: ACrzQf2Jts2cKyTDvsM9UTdyghSmJfgL0WRLVkpp3ZCoPnpEK5YbUk0s
 WzMUiJ23r8j5KSMkWu181WjWOQ==
X-Google-Smtp-Source: AMsMyM5ztMFmBmzjto6GAhKNgXG5/xmHn7PzkvmH1Dbid6ozroWjf3QPkSf+K009BkQKYxiGKIAYFQ==
X-Received: by 2002:a37:5386:0:b0:6cf:759b:c866 with SMTP id
 h128-20020a375386000000b006cf759bc866mr5261920qkb.261.1664032417215; 
 Sat, 24 Sep 2022 08:13:37 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:1f12:b4b:2dff:20:54a0?
 ([2605:ef80:80b2:1f12:b4b:2dff:20:54a0])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac8748a000000b0034355a352d1sm7289501qtq.92.2022.09.24.08.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 08:13:36 -0700 (PDT)
Message-ID: <b6e537d7-872c-d43f-495d-40406956ba97@linaro.org>
Date: Sat, 24 Sep 2022 15:13:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/37] target/i386: add ALU load/writeback core
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-7-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
> +static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs, bool aligned)
> +{
> +    if (ot == MO_8) {
> +        gen_op_ld_v(s, MO_8, temp, s->A0);
> +        tcg_gen_st8_tl(temp, cpu_env, dest_ofs);
> +    } else if (ot == MO_16) {

switch + default assert.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

