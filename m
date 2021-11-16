Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC14453AD1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:20:28 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4wN-0004Pm-1U
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:20:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4vU-0003XX-3g
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:19:32 -0500
Received: from [2a00:1450:4864:20::435] (port=40540
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4vS-0001kl-J2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:19:31 -0500
Received: by mail-wr1-x435.google.com with SMTP id r8so114887wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 12:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMPomJZFY13K7tAKVfm9YLhauB0H1d36Rn3Wgp4Dl6M=;
 b=hUO+GaDJQMTExeq1pDunh1kWtWzfozweqYuE2gknjpDkF/ppfCfoNjkiNTS0IAMgXa
 /gzZxjoY3u4uaNDXEqEAp2g1oy4ycNYDXdG401Soed+3PEw+pyvMr83Yjmhsvp9lPDvJ
 7Qviq64fJy7sI8VDLUnxbxReYmVcAr6EkBhLPx4B0Oiw7/xJe7FDhaTycmB3q4AZBcME
 O/H1CIOoKDk8xEyRkR1JcIdzBvUAVLv3HuvMrNilIluuICF3bWtjakjf0hMQmarpuyT1
 ahYZpkMQ4CV/Mtx6tMwCgFnq6EcKa2iOYC5SjAu5su4X/cCoRhVkqmK9gEP+NB35/SIG
 VdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMPomJZFY13K7tAKVfm9YLhauB0H1d36Rn3Wgp4Dl6M=;
 b=hbmkhQGLMFDMDX2/NvZCMwdCFZEMHyzwH8QT0ccAHicWWjixCV+T76h74G/oLE1VcO
 ++OJmw78upOqlUOLURmm1Dg/0pmyiFqu2B4hYHCNQIx4QSBlkLEorXkJ5+qknScm0qjM
 62xG9Bcmne7FPIDpCSBpZok1MQ5xcwnSEjhiZPqKsgVFR6OBxCi3zgi5EkBf2iQA1Rkm
 tI3rm4kJwYbJQelZetZ7VmXWysEsdEVvmFxxHgpebxiF/jD2NtGZCR0499Jeyq/lJthe
 oQFjHXl4ywB8CsEcK+0eeBTiM06CV3dQLySaOWwQduTSu0KWNvaoh9PASVG6dwnP+gCu
 nGNQ==
X-Gm-Message-State: AOAM530ytGpiG6DqlO7LaaTSAiExLdnC1+diULh9cuuGF0x/Nvv/jV6K
 kMFq+cB1jwZ3fDB/bYDqk/eN4g==
X-Google-Smtp-Source: ABdhPJwrid7kWuZi0Os4I48lNe2Tg9bUykZ63UCszaXLkydXpv4tCayDpavmdbyPCYcvWQSoVo550A==
X-Received: by 2002:adf:f947:: with SMTP id q7mr12558641wrr.260.1637093968902; 
 Tue, 16 Nov 2021 12:19:28 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id t8sm3197057wmn.44.2021.11.16.12.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:19:28 -0800 (PST)
Subject: Re: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211116193955.2793171-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2628496-ff7a-e684-ee5e-93531790e998@linaro.org>
Date: Tue, 16 Nov 2021 21:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116193955.2793171-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 8:39 PM, Philippe Mathieu-Daudé wrote:
> QEMU coding style mandates to not use Linux kernel internal
> types for scalars types. Replace __u32 by uint32_t.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

