Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F939CBB7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 01:29:36 +0200 (CEST)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpfjT-0002xC-KA
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 19:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfiU-0002ER-Qa
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:28:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfiT-0003cy-1z
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:28:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so757577pjb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 16:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jSudxbqvXIdVPxrfCfrlnmYcyUO6QNQ/iNhcb9u1970=;
 b=qDsIie2BepqPUaXn2/XkWZF3UZGhP4YE6SIh5yWcXw3v3lYESgu5moriSMipvVizef
 L17Y7fx61ABsW7Jub5gZr0FqmJlujwHQoxMcLdMrsXAJP5Qw4nhFUrnTVO6KSVMbpyKq
 UtE7dyYqonFSUmVnDZTWL1/r79FYGy7e8tDAaQ6M2SM2DCawdJ+dESDFmd3/itjD3j8b
 +eSBlVsdvJBZu44AWEOivnv5NL3+QdCkaY3UHU3FqYlA201V4CCsNRmvJRXjQQyhIt1B
 e8BclLhdzPQtX+vmeaOu+amy8g1UYyZPWvT7mZ7HJnW8CbioJl9i4fQyx7zfUYiY8eEZ
 FFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSudxbqvXIdVPxrfCfrlnmYcyUO6QNQ/iNhcb9u1970=;
 b=QtEk6VNwdQx5y5IVx/s1qnLj5KlAZv2vhlQxYxASbMg02dADDcuW/ErE6zjwvzeG17
 3/yuz7ZxZxYUFhYhX2ggUK0MKZbTfBYdSPbTeHBDZLLyGq+i1gO31k2jDUnnpdSwftM6
 t9p/2/pQYlQcKZCdO+6qRupI7pZp4KnQeVKSnwB1RFT/kb99anO+g2TRCG0Dz0edrPvf
 tolsxbosQpw6drtPnFGedQwQ3G3mJvxbd12GS6sw438suXBU2jZ4pw87yxjn4bOy/uge
 ijcjvWHHcu3KXZtsinwI7ccEJum/i1MFOP3YweJirigXrAracGblA916rnIAfDdGz4Kb
 nvmQ==
X-Gm-Message-State: AOAM532QUlnT3VwI+2IBNsBFbHMH7hEb1pTA1X8iYMjmnB+LCs44pEns
 wLqv0BgazSpam7b4CoE/gm8c0VTSkfIRlA==
X-Google-Smtp-Source: ABdhPJyhPFpca65dmHvuk1f+9o3SZqJCfvRvX6X3qpapxB9WEr0/tICC7rHM2Tl0IK+iSIYsP/7Kjg==
X-Received: by 2002:a17:902:e80f:b029:f5:fc21:7833 with SMTP id
 u15-20020a170902e80fb02900f5fc217833mr10925192plg.76.1622935711364; 
 Sat, 05 Jun 2021 16:28:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y27sm4717585pff.202.2021.06.05.16.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 16:28:31 -0700 (PDT)
Subject: Re: [PATCH 2/8] Fix delivery of unaligned access exceptions.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-3-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2215af07-b6f2-5e50-050c-943b19395aa1@linaro.org>
Date: Sat, 5 Jun 2021 16:28:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-3-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> In the unaligned access exception vector, actually pass the return PC
> in the exception frame.  This is required in order for unaligned access
> fixup handlers in the operating system to work.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   pal.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Ouch.  Good catch.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

