Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45F42FAF9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:28:39 +0200 (CEST)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRwc-0004Js-Nb
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbRsa-0000kK-7X
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:24:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbRsW-0007qp-Lg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:24:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 21so6879712plo.13
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2AHem3H9mHpqmYljsw/Lgpj/qB4PefcClQy6TsuUGzw=;
 b=Y2DW98i0QbYHIP7CXttHfKwWCRKORpUFhThm1JBZTVPybhbT+466Xd/UPLRUfU/AYc
 vDUCSO28hl17QPg3zBiXygTwn29VYg66IR1wGk6kYOYWnQE9/rcrW2nyc743joYbR8kS
 XR6afPfc+QsAmRF2VH+elNlc5aesc9lG9swDLLrD2iWIgslk6cYyHY7ubvpq7uX3qQhh
 ogP8UX6CGCOemQOovCApvgE/Ix/8WkAIUP/hdeu4XxE9FQDAC4rinGdD4Lsd4zMIYAsH
 KDIfqHhWVDOgQg3iwdPNe0ihP667ZpX962SbxNDBa2/n12w4+IDugwoi/+xv/ZiYRZ61
 qrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2AHem3H9mHpqmYljsw/Lgpj/qB4PefcClQy6TsuUGzw=;
 b=J3r2hmLCdPV+OoO3Lyjf98HEp0dNlg4GGRoT/E7MKx6RRUgfbWf8iLCn9lShayDf6F
 HxDxtttb5lNUEMADmOdEARTMnDZpVc1Nu35feNxVCWcUPICS6+/fudylnHWJgVjFPj92
 c5QONh6/TZbydg9Jh6j3XHl4d0lWcrPWeMRukYpCICtUKJixZ4IygGYm8xV6bdv+tTTP
 vztEdaWjb3UlSqv1FbdvVltgwjIyUu4l0o/3Ghyb7lvjZD/Uef4RBOpp0H2gM2gEBDQa
 PU7G8IzB6URg/RFJOBWARFz0Z1dWhmHz/d4TJh4K/zaDzh3rdvBqg7UWJ1hLnTEvKDi8
 fv9w==
X-Gm-Message-State: AOAM531cCB7/ahxVc5jNQVtsoJ8hgHpf7PLQ2V6N+zy/RKgCAMQRfaJ+
 tZFGMok1FQk1HTCeAwR31ocnxw==
X-Google-Smtp-Source: ABdhPJyF9pZktoYB8kubdw6/mFimu8ZbjaXQjlLmpXZONpuFZo5NSLyIcP0qWZLMBC+soX4D896gKg==
X-Received: by 2002:a17:90a:51:: with SMTP id
 17mr15304987pjb.185.1634322262882; 
 Fri, 15 Oct 2021 11:24:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o26sm5841412pfp.177.2021.10.15.11.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 11:24:22 -0700 (PDT)
Subject: Re: [PATCH 1/4] linux-user/ppc: Fix XER access in
 save/restore_user_regs
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
 <08fb20b9-4784-4dfe-2bdd-7abeae8d6a4c@linaro.org>
 <7925af5a-e8c4-0574-c131-4e86e8a0252c@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c4c402c-e9e3-f1da-2550-b28c8200a7aa@linaro.org>
Date: Fri, 15 Oct 2021 11:24:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7925af5a-e8c4-0574-c131-4e86e8a0252c@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: laurent@vivier.eu, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 7:54 AM, Matheus K. Ferst wrote:
>> While Appendix B does guarantee that "0" is and always will be an invalid instruction, I
>> wonder if the test itself would be clearer (i.e. self-documenting the intent) using
>> SIGTRAP and "trap".
>>
>>
>> r~
> 
> It would be better, but cpu_loop is currently calling cpu_abort for POWERPC_EXCP_TRAP, so 
> the test would fail. I'll see if I can fix that in another patch, and then we can change 
> the test to use trap.

Fair enough.


r~

