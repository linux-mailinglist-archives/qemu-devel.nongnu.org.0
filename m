Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17D43BB74
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:17:48 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfStH-0005oE-AK
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSqn-0004lE-IC
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:15:13 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSqe-0001qk-Ff
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:15:13 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so407494pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G5Au0KhyjDWZEimJ14AfsHb8NYnEoK6FbHzMhiIqKpw=;
 b=Qtp2OI/GHIF5jqZM3A+C+ir+ftil5jihgoZKdIGNdx7+TuZlA5hnKprM7Tn+U4J5Gk
 MgaaBzYEZynzvZsUfclLaGRm9chRIia0OdDyZwwjej0EfAV9jK17i6g/AZ+4mL909Q2s
 CLTEh5uQXDSFo02tIyJLZxuuKbLFvx8dZvhi5LJGbi9P3uJcmfNjkWWc08HiPBJ8BrSd
 IH0dPsnyQuAAEjnYJvt8+oupbzjd5XqiuhrOQR6Gc11dr24B4lzZoOVkgBQzP//h6AeN
 a4csOihc3kSqBJGqFWRYz7UdyGeVr4bUvN4HZsJKdK5kHPZF/uCvwmFepAOtSovmPbqz
 SuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G5Au0KhyjDWZEimJ14AfsHb8NYnEoK6FbHzMhiIqKpw=;
 b=wZI2/QjPVDubSN4pzm4ph4A1Gzfaz4okKFC7yfR7F/CuunG2suKlBzd2fc1uz12k1s
 sQj15kMjC2lgJlQcbZsoN83kcN4OJQPbp5jVoSGmgs64ojOq67ecsUWUVBTy0RilS6Rl
 pYhnhEOS0kDK6Rigs3LtNX2/p8I+waHUzrhs/cCAJOo3arnj5m1a17L+UD8UHWgWntwy
 ytjp+U0rcS9eZZj0tTLKq5mgCzCIfa2YbjfozkMkG5gqY2KLzHfELdD6gwEyc18APx7z
 V4tUsi2MzRHe/msoCH5Rizoxf/+gmdH7IsXbwPVfmdvlUUdYB3FnPTpKELfw5Z8eBRjx
 9kZA==
X-Gm-Message-State: AOAM531Xn/niM5Fk+p60R53Ps5omevSNzQt+HS0cfZyPQpNbF3G4Qu/3
 6jg5hAaPLQ2lKjAF7QrD/pPU5g==
X-Google-Smtp-Source: ABdhPJykeSSoJ6sPtTp6GbVk4wIpjzLBKUrqfxrdazIoSG2f5ZH5Z1sQAajtid5bApXmFAHz8p/SNA==
X-Received: by 2002:a17:90a:a88e:: with SMTP id
 h14mr1004681pjq.41.1635279302422; 
 Tue, 26 Oct 2021 13:15:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h22sm3384345pfo.150.2021.10.26.13.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:15:01 -0700 (PDT)
Subject: Re: [PATCH v1 22/28] tracing: remove TCG memory access tracing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd670a7f-3daf-7a7c-2ea8-1c28c8ea59c6@linaro.org>
Date: Tue, 26 Oct 2021 13:15:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Riku Voipio <riku.voipio@iki.fi>, f4bug@amsat.org,
 robhenry@microsoft.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> @@ -950,7 +948,6 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
>       uint32_t ret;
>   
>       validate_memop(oi, MO_BEUL);
> -    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
>       haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
>       ret = ldl_be_p(haddr);
>       clear_helper_retaddr();
> @@ -965,7 +962,7 @@ uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
>       uint64_t ret;
>   
>       validate_memop(oi, MO_BEQ);
> -    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
> +
>       haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
>       ret = ldq_be_p(haddr);
>       clear_helper_retaddr();
> @@ -980,7 +977,6 @@ uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
>       uint16_t ret;
>   
>       validate_memop(oi, MO_LEUW);
> -    trace_guest_ld_before_exec(env_cpu(env), addr, oi);
>       haddr = cpu_mmu_lookup(env, addr, oi, ra, MMU_DATA_LOAD);
>       ret = lduw_le_p(haddr);
>       clear_helper_retaddr();

In that one instance you add an extra line.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

