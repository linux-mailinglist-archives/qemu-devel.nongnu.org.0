Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72B66460A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGtd-000657-48; Tue, 10 Jan 2023 10:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFGtJ-00064I-DD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:50:22 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFGtH-0002va-Qt
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:50:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id n12so12828417pjp.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 07:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3I0wAjkkv5YuzdaU7zVSaT06w8B19S752oyxY94nW+M=;
 b=pPd9GGpULF4+eMFYIMwVFt56hgdSEnmPVBe1xcYdOyG7AGlBRA18nuKVP31Th4fmgo
 l63kErxAPgK7EDahteOepma6n0Ez44PLKEU1xPMFzjaDwEs5xt6xzyt5QE5AggK0BH1I
 MimGyZBWISheUsTbNqRGGqgTSpl+sckpyFJO6q8J8s6KfkD2cbEEc2x5+Q8a8ZEtSWWQ
 6QwzJjo5FY9fDiq7Coe6sZybY2C42okLalbZvmaoKTkYLSobEo6Kp/SQYqGOhgYea1AR
 vgt0RXj/ihjwF4TcrlfN+a4EH9du/S/VuTIXDK8aUt+TE93GX0+rcv+fow5wRGlaQuUv
 HQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3I0wAjkkv5YuzdaU7zVSaT06w8B19S752oyxY94nW+M=;
 b=OEkuOSNdEdtIqtnpNKvxxSLXQWQRB5wmSC5ssm2RYXczrmMamcus27uI6I+XUk7iMg
 RWm+qc13t9NWgUVBDYUmYa/e71qsLeaDd53obXacgXhxA2Avq5ah2Qeo460nZ3f9BXkx
 emCeFH1qYuifs3qZwSQxd6rKUL6AJ/VANHVrvGCtJEclOyYBY+FwNmjBXUhCIX6Da6JW
 /fMK16EMDp88xiRVG+3V/ri8GZiGUdRnW7gzK04YA9gIjX88K4vz8l/OZ4cHVCCE9x1c
 e2w0M3j1zm3DLyIx1Hgd0Agwh8sPs9xJovEuWxdSPRW3q5tZKpqQMOOe9PY5xhZ7pMLv
 dSXg==
X-Gm-Message-State: AFqh2kp/1qvcVyAifHtdGRejtbi/HHHprUl+S8ussfIecCt93jx5uqzo
 LZWCkjikO8KvZFb1VcZ3e32YSw==
X-Google-Smtp-Source: AMrXdXsSRuQY23b5Cur3cAmTe3u81dTUuaor+TRwNxPZF5J+5mXbJUaJqdAVvFEbAY9XUWpbLX//jQ==
X-Received: by 2002:a17:90a:ba84:b0:225:df28:fecf with SMTP id
 t4-20020a17090aba8400b00225df28fecfmr55096607pjr.13.1673365818048; 
 Tue, 10 Jan 2023 07:50:18 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:8117:35c5:a167:7030?
 ([2602:47:d48c:8101:8117:35c5:a167:7030])
 by smtp.gmail.com with ESMTPSA id
 4-20020a17090a08c400b002262dd8a39bsm6280874pjn.49.2023.01.10.07.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 07:50:17 -0800 (PST)
Message-ID: <aa4da899-ea7b-780b-f380-0456eb55777e@linaro.org>
Date: Tue, 10 Jan 2023 07:50:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/5] tsan fixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230109224954.161672-1-cota@braap.org>
 <87y1qamtu3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1qamtu3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/10/23 04:55, Alex Bennée wrote:
> 
> Emilio Cota <cota@braap.org> writes:
> 
>> Changes since v1:
>>
>> - call g_free_rcu on tb_jmp_cache directly, and call
>>    tcg_exec_unrealizefn after calling cpu_list_remove(cpu)
>>
>> - add patch to de-const qemu_spin_destroy
>>
>> - remove wrappers for qht_do_if_first_in_stripe
>>
>> Thanks,
>> 		Emilio
> 
> Queued to plugins/next, as there is some intersection with plugins.
> 
> Richard,
> 
> Please shout if you want to pull this stuff in directly.
> 
Please go ahead.


r~

