Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4747959A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:43:20 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myK4U-0000op-OU
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myK3X-00009H-Ui
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:42:19 -0500
Received: from [2607:f8b0:4864:20::1035] (port=33610
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myK3O-0005Cr-VZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:42:12 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090a2b0100b001b103e48cfaso4948215pjc.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 12:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TnIT1SwTRJB57B7WMObLeaqP7ijj7O+cjkY+Q/apN8g=;
 b=bhlmrvHvEgW3WkazcJRAksVNvHc64sLCrFc7w4Cl7ShH5fAuDhhHHMsHnat2tm0Fsw
 8X2oDLAbOFA3ZSsy24TxbiZsqPqC7bTFqKfBEa/wA8FHlWlpMvUc73HHt0IegI/LFPUx
 odZnjf+cKvBJxoU20Fvn0FF28lZ5XOPdIFhfRcJP+KeBb9XYlmC0pRLrEtZpcMEG7HVg
 EwkXtuuQD5zeSSxfAoHXqB8FTDOQehvmTOSwRRU9vn/kW8ufX4EEl5INNhi52mLlpPjJ
 YjkxMY2yfblv7w4dyb3KdH9AjfNKEVFX903MRuJGcXygUaMclNNdK0WIt4Z5dYffqyWR
 hE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TnIT1SwTRJB57B7WMObLeaqP7ijj7O+cjkY+Q/apN8g=;
 b=pRZA8zC3KziFuNmeZpICULo5srZANhHlzxr28bmM+tU7SeSIJNJNNEBEyJnMbgawEh
 Ej9rv3tpp3R6aaMbCqq6wmy6xCezfyrrkHetFU3dbG/u3mDmpgwR8P6jZYOac1LghmKc
 BduKxF5poTtg8OHj26mGg3nIItBJ8yYXVCTs9fLaQIKL63/QVxqjN7Q29AZu/uLmy4CS
 1fn5Zdfl4Rjhw4p+sYffcwQTH5Y6A69cs0a2xLPuye2mJIB7AOFhG2jm5bXeXVePa2Ir
 gkSeq2kJ4JcBU5Wf1vl96WGlWIn6KaLAe97WrNWXJMwmgv2PkZrlAcu33x69q+K+RgMB
 23LQ==
X-Gm-Message-State: AOAM532G8disD00m8Qm8AYcWl36fcrycFamvB3wV7lat8xblxfeEtBsG
 SZcT6aoGU8rOmoopwdFIfi8MomurVV4e9g==
X-Google-Smtp-Source: ABdhPJz2mNClgyhvleIaC6Nb+1vSepiTe1vsQ1uPCc8OMcw0x6xBlMR39MiDzXhTYf/vqD0ztu7XMA==
X-Received: by 2002:a17:90a:ab02:: with SMTP id
 m2mr14201136pjq.169.1639773728879; 
 Fri, 17 Dec 2021 12:42:08 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s19sm10856052pfk.105.2021.12.17.12.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 12:42:08 -0800 (PST)
Subject: Re: [PATCH 01/10] configure: simplify creation of plugin symbol list
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1291b941-ad80-d599-141f-2887f16dae0a@linaro.org>
Date: Fri, 17 Dec 2021 12:42:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> --dynamic-list is present on all supported ELF (not Windows or Darwin)
> platforms, since it dates back to 2006; -exported_symbols_list is
> likewise present on all supported versions of macOS.  Do not bother
> doing a functional test in configure.
> 
> Since stuff is being moved to meson, move the creation of the
> Darwin-formatted symbols list there, reducing the transform to a single
> sed command.  This also requires using -Xlinker instead of -Wl, in order
> to support weird paths that include a comma.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure           | 16 ----------------
>   plugins/meson.build | 13 +++++++++----
>   2 files changed, 9 insertions(+), 20 deletions(-)

Surely you'd want to be removing all of the ld_dynamic_list and ld_exported_symbols_list 
code as well?


r~

