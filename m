Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B8380BDD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:32:51 +0200 (CEST)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYry-0006cb-0i
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhYpp-0005LY-Jm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:30:37 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhYpn-0005Zb-2b
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:30:37 -0400
Received: by mail-qk1-x730.google.com with SMTP id i67so28859772qkc.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PKRr23zJWU9BwYSFZsHQNy0z3C8mc5hqa87UEbAjVy0=;
 b=rzQwgqUQp7jNWU/x7iBu8vQ0/gPWjHCPQJYatuLO8/rvM7AoYTPBifmBjynk31luiW
 7CFcc8+q0bJEjHZWvV2pvV5qItG62G3RpZWnp+Oii+suLn4DH9bRgkQsZG/zolU1u01w
 RhjnBLNUNzAM3tufpB3bYMPAf8DBsMH+Ae/YCw+Gs+Dcw5IOnLn+Qieu6uUGpIMIERGj
 r8k/605XdN7c/Pl4RGG4ub99zmMY27eqwsVdKNtayDLkM2Rg+92/XnzERr+hIFeGtSfn
 ECbx+6/bLOskcE8DGS/5VcaqYGe8tllbNCYc1UCZIccxN63UDKZJr6lMbJLiTMWicCqr
 TpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PKRr23zJWU9BwYSFZsHQNy0z3C8mc5hqa87UEbAjVy0=;
 b=XmiExkNy3X9hkBfxF+tUgh5JOFY+g+iQGFu9aMGjwz11f3mjf35T2GwAKm62UOoYiZ
 biwkwkYw1Y4HWhWK3umZKd5j+bygNx9gdr0pP29Fc3BGLLxlfoB3WRkbE4vMThrmoJbE
 y4roGdbhRWiWNb8MVrwEhYeWgjyElHqqx5dZl0+za6gnxESYUKg0XEBx6jX770UghtWa
 UUcjZYRPZ3TTo3yykQRTiT2E7F9efDEmHK5BwiNTCVWoWmNfeH/tRiJvchJLS1YPZQ0N
 K9gb7dAhOLchqFrXCqPH2Tbv84wpOYA3rp/xOI0npeHhi62NQUIDP07FXe+xEE0R6Wij
 Jgfw==
X-Gm-Message-State: AOAM531pllsItCG2HGo6kIBdIxGjhCl3olY+Pt1KHr7UyWElk6A5eKv9
 M/FDEY22V3IKuzmr5mKde7OVwA==
X-Google-Smtp-Source: ABdhPJyXV/Z4k9kTuJ7il32n7x7SdabFHlpGb8jmtE+eHroJizA3Zb+bM3vJXRECE5Pok0N1NI4ToQ==
X-Received: by 2002:a37:644e:: with SMTP id y75mr43608935qkb.129.1621002633875; 
 Fri, 14 May 2021 07:30:33 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 2sm4851402qko.28.2021.05.14.07.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:30:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/i386: Make sure that vsyscall's tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210512040250.203953-1-iii@linux.ibm.com>
 <20210512040250.203953-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29b70216-5ecc-6d7c-a38c-32aecca2ce48@linaro.org>
Date: Fri, 14 May 2021 09:30:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512040250.203953-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 11:02 PM, Ilya Leoshkevich wrote:
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For x86_64 this may happen when
> creating a translation block for the vsyscall page.
> 
> Fix by pretending that vsyscall translation blocks have at least one
> instruction.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/i386/tcg/translate.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

