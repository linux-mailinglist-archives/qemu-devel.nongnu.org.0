Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2036158C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:35:27 +0200 (CEST)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXAa6-0003tS-2r
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAY4-0002mB-7R
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:33:20 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAY2-0001vX-Nf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:33:19 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a85so16594849pfa.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aa3fLmQalcCAaQ8X+Npv2Q+VeXUNMwkbQrfl3s2KGSY=;
 b=MBd/nwi0FjCOBsVik2nZCnhk99T8aXxA1JbvVeaU4z1y30N/7Kb3TtMUlPgeuHL3AD
 Ic1souU1w6IcQI1q8szPzrfcw5SMXnPGZmtzG22/Nv+ZJdhlSs/cE735xLYed0HDe0Zx
 IeqB2JAxg0S4gdy0kuk4OgmjVEX49H6onaUzZ5809pNjn5C90yCP9NIikLK3D2a2Q3Hm
 r4s6somLCed7Qeq9rEpca10ET14EK4OZp5RCNUOp7fIl0nVx0gV4rYHdbg7UmLoFlkGz
 xGtqLSOTfyoEcCrkduMyBvz2q8wLqtWoXCY2XUjLhll9pXlbb0XpxVTqIBbBlTCLSsdE
 43Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aa3fLmQalcCAaQ8X+Npv2Q+VeXUNMwkbQrfl3s2KGSY=;
 b=mKH4ZukLFScDT0T/rCGEyoZFGZpJWIw/TIW7O4SWw2Aaj2NTkjuNKQ0hWEXWGR+pLb
 wPVr9UwERpumhgqx05k71lDgByB7l42DlPpHHKJWXnrYdvjRdenXOabO1ywCmKHIBlIL
 nbsOxpCdNwj2l4QIK88T+3r5/0QKCPFHdYgzO4CARTQDF/4YL42xbMGLmeItM0iO6zNo
 u+0bdtkpPRaDwTV/hNyFssejTdHG6/Yoqw1Em7Rf7eMTi2pyykYAxTemAXv2ZrgtxU56
 e6E4CQRTw2eVgk3i+3huivTmazImBcpBGI6nSsUVVUFG+EI7UDQwhIAcwXDdax1Sq5pZ
 CE6w==
X-Gm-Message-State: AOAM5323JK90Ncq3vy85u/RXrClkO/zkH5EO3DCTx7rMTt0kjL1cNB7Z
 YObqlEri99UCoRFZaYc/b9shYA==
X-Google-Smtp-Source: ABdhPJxSMFEWz+15FiWw+8M7TS3ECZM6draXDD8faE0frwTPZpg+gUvSmMyg/Lc936YgdjWtxZ75Jg==
X-Received: by 2002:a05:6a00:2343:b029:258:558b:83d0 with SMTP id
 j3-20020a056a002343b0290258558b83d0mr3724871pfj.33.1618525997440; 
 Thu, 15 Apr 2021 15:33:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c21sm3204953pgl.71.2021.04.15.15.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 15:33:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] hw/elf_ops: clear uninitialized segment space
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a895763-6dc2-ee9b-7a60-4b22098bcfa6@linaro.org>
Date: Thu, 15 Apr 2021 15:33:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 3:04 AM, Philippe Mathieu-Daudé wrote:
> From: Laurent Vivier<laurent@vivier.eu>
> 
> When the mem_size of the segment is bigger than the file_size,
> and if this space doesn't overlap another segment, it needs
> to be cleared.
> 
> This bug is very similar to the one we had for linux-user,
> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
> where .bss section is encoded as an extension of the the data
> one by setting the segment p_memsz > p_filesz.
> 
> Signed-off-by: Laurent Vivier<laurent@vivier.eu>
> Message-Id:<20210414105838.205019-1-laurent@vivier.eu>
> [PMD: Use recently added address_space_set()]
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/elf_ops.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

