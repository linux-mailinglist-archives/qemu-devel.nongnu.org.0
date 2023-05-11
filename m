Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D696FF333
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:40:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6Ux-000345-30; Thu, 11 May 2023 09:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px6Uq-00033M-OD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:38:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px6Un-0005wk-3i
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:38:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so64341335e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683812291; x=1686404291;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CUiE33tbzpElVU6nlaY81j/AcKnyfmuJEga3wIfMjCo=;
 b=h2+HrRwYBDQinl0bgmoOD/9b9/pV+BbSoITsRwGHiBTiywmtuxXIsTzj4sux0P95tP
 EJ/HY1458RxHwK1O1T+NHWH4Ik8oGpDPbrn0oM7bwOLu5f+lohFgKAS7C/arHs4TvQJO
 kha10VJJrFru0IAoKD0SSOyWiLLIG1mkWO5a4ahjjqtzvEdoblvTZ4Ei04KunmU0aVLZ
 vlyZgFWVJsUxbDxwujF7PdbCTDfeevoppTPJfJiSSJyRLYEVHc9RgRyZY2qF6lzeZmZB
 3kV5Ro+pKOgVFtlSss6G2C7WjkFqwMo+BeeiY/rvESjNFlQjEHpnw9k56C84GGWrOo5Y
 Ukqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812291; x=1686404291;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CUiE33tbzpElVU6nlaY81j/AcKnyfmuJEga3wIfMjCo=;
 b=SlOxC4d8KiHCQH9noA6LHP/zF7CdYs7AVelHsdJzgzqklTRot5aI3VSj9GN7nQANYK
 aeLlhymvd2ctChdiHvFUrrNSEVFo1/jq9PhgfqbY3olt8S/dA69pC2u2KPvKCoHq7mRe
 jOy5XZNFoXnutNl3syMONqPGxcwENB702ijTuC44yeMnTB4tp+ZJOop4KLjKrI4k88XR
 rQupP7z+6/bYxiPpKd7DGttCJ13dG/q6sPDfnPu3qi7a3wu0rav16VC3uaSuBq7v7oYu
 81JKoWNyNAQMfJiNj7gqRS8+RdSASjJW32tJAnx1upuGRHYTTz82aR0u9rAe9gbORga0
 SDRw==
X-Gm-Message-State: AC+VfDw0daVRdigTFVkmAWEdq2f27507FN6GmlRzabZ5mxt+tR+Ar0Rd
 ucJEB58D6U+M5mw7uTjC0OGphQ==
X-Google-Smtp-Source: ACHHUZ6A0E/kCi/WH4sUp74+UJxMXbc7FP8sXjQJBiR9Ud5hgPlWjyMumsIcXF/miWplHF2xtiAjjw==
X-Received: by 2002:a7b:c404:0:b0:3f0:9cc6:daf0 with SMTP id
 k4-20020a7bc404000000b003f09cc6daf0mr14829162wmi.27.1683812291176; 
 Thu, 11 May 2023 06:38:11 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003f188f608b9sm25626712wmf.8.2023.05.11.06.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:38:10 -0700 (PDT)
Message-ID: <562ade29-8ff5-f9d9-ad32-1ef6a773c595@linaro.org>
Date: Thu, 11 May 2023 14:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-84-richard.henderson@linaro.org>
 <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
 <21998b5c-43a2-f7e5-9515-45745441a12e@redhat.com>
 <b9739a63-0d87-1b74-c232-9c566ab821bf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b9739a63-0d87-1b74-c232-9c566ab821bf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/8/23 16:19, Thomas Huth wrote:
> On 08/05/2023 17.14, Paolo Bonzini wrote:
>> On 5/8/23 16:27, Thomas Huth wrote:
>>> On 03/05/2023 09.23, Richard Henderson wrote:
>>>> If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
>>>> because they are exactly opposite.
>>>
>>> I thought there was a difference ... at least in the past?
>>> But looking at meson.build they seem to be handled quite equally now:
>>>
>>> common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
>>> common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>>>
>>> Paolo, do you remember whether there was a difference in the past?
>>
>> No, I don't think so.  Really _none_ of them are okay in general, but now that we have 
>> softmmu_ss/user_ss there is a usecase for using them in "generic" sourcesets.  So 
>> perhaps we could have something like
>>
>> /* One of these is always defined in files that can use them.  */
>> #if !defined CONFIG_SOFTMMU && !defined CONFIG_USER_ONLY
>> #pragma GCC poison CONFIG_SOFTMMU
>> #pragma GCC poison CONFIG_USER_ONLY
>> #endif
> 
> That's the thing that I had in mind:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05269.html
> 
> ... so instead of removing the poison from CONFIG_SOFTMMU, we should likely rather try to 
> get CONFIG_USER_ONLY poisoned, too.

A worthy goal, but a large job, just looking at "exec/cpu-common.h".

I will defer that to another patch set, and continue with non-poisoning of CONFIG_SOFTMMU 
for now.


r~


