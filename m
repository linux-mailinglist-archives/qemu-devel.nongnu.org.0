Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E755F85EF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 17:46:58 +0200 (CEST)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohC2T-0003yZ-Tn
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 11:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohBzc-0002Rr-09
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:44:00 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohBza-0001Yz-DC
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:43:59 -0400
Received: by mail-qt1-x830.google.com with SMTP id f22so448661qto.3
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 08:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zI+RIP0fo9nZSagkZN97VHwHnX5FW6Ghm+pZkCvl3Rc=;
 b=v3UTKX7cOGkxfq65jQFdOvmqBfFuKXIcJsHWVPOP4YzPwAhMaJ0a0uQptQEbARt5wR
 Hth+inF1PCiEH3JHlhjr1oYbKLKdiXuep3usCDEb+UJobEwUXJPh/kSoH4MMcPZQR8x8
 W0wQwsi4tHAPf9NBDr3zjXsb2B0JMIUcKZbL3Jm9OyzOrP684pUpqXCVzJ4qHas/tMAd
 4e+NXgwsIhyCeco5xMoh9h3BPlfznFi4kqP4L/dcFnICO69iZiszd4DwQlyuIi/uEMG/
 A1OTCkO0SWfRGCmcdJ/A4TRTLpGptj8mcncTqTkOG+cR+JhsfJ2/w40q+QizGJ38C1W4
 QO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zI+RIP0fo9nZSagkZN97VHwHnX5FW6Ghm+pZkCvl3Rc=;
 b=2VKX69ht/tQLrmREzrRCPETDmzo5F4lgc9pI5BKzVaTYw+8AyTmpFSRjPuFLQcHayT
 5FYswyHmcExRf3/yVreZV3SMrS9KmEyNjgly/KI9MsJHCWUvMfyqwRnlDZJzBbEx/ZSZ
 4i5WbVZR+hs1sgstYXKk9DfbqllpSXMNe9w8dd7tm8LUt2rLndXOuSvFUFTJRBwr2kgb
 FIK0pIlw/1Bm5IWZc6Z59snBXVtg0bORnPlY7W7wlrSBEM3rDzMouS7ts+3KRMDwq4wd
 7JkzvjDRSLN5MEkOB/dmhaMQ4SdWcqk2xCAH3dFvIPqS+/3OX2hnYlguRR/QgqFAxdnI
 +CRg==
X-Gm-Message-State: ACrzQf2+wJuQgnKGq0LlFE7BU7vzGWpCzjbgbVU7Zf4G0yCm+0YsOtjg
 NAJkSWl2dKJULR7pfGsjfir2b8kXE1ZV9A==
X-Google-Smtp-Source: AMsMyM7RyVr5mUAQirXcOLuZbUSPLz7d3ySprF+o0ej9oSp8Q7V8KCYCrRRA71uqgCK55kwbeA8Okw==
X-Received: by 2002:ac8:584a:0:b0:35c:bf11:9e42 with SMTP id
 h10-20020ac8584a000000b0035cbf119e42mr8548664qth.425.1665243837365; 
 Sat, 08 Oct 2022 08:43:57 -0700 (PDT)
Received: from [10.11.66.157] ([50.204.134.210])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006cf3592cc20sm5466835qkn.55.2022.10.08.08.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 08:43:56 -0700 (PDT)
Message-ID: <b843a6fd-dc27-d3dd-70ad-2861124de510@linaro.org>
Date: Sat, 8 Oct 2022 08:43:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] include/qemu/atomic128: Support 16-byte atomic read/write
 for Intel AVX
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20221008153646.1504760-1-richard.henderson@linaro.org>
In-Reply-To: <20221008153646.1504760-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.588,
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

On 10/8/22 08:36, Richard Henderson wrote:
> Intel has now given guarantees about the atomicity of SSE read
> and write instructions on cpus supporting AVX.  We can use these
> instead of the much slower cmpxchg16b.
> 
> Derived from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Paolo, we probably ought to modify gen_ld[oy]_env_A0 to match,
> at least with CF_PARALLEL set.

Or, rather, just gen_ldo/sto.
Curiously, there are no guarantees at all for

   vmovdqa mem, %ymmN


r~

