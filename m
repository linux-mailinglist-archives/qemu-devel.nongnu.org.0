Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890D6DB6BF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkv57-0003Xn-1P; Fri, 07 Apr 2023 19:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv55-0003Xa-Lb
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkv54-0006rr-4J
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:01:19 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso2591269pjs.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FM1IoSWydLocj7jgKW9MEFCM/UyoS3Vw58k8MbYXpPI=;
 b=VQRL/jwZ/iwhTjW4uDgB/xQLypDFRo9dz1YtZKQWTGVtHNnhpUq2Kgr4tJlXpVc9Qj
 KBbQLfG2Z5FHXSI2VMMAmE9q1dOQk2iWj8kn9Q3lFDBbsPO0CVUPQMhVWuKl2kkGhFG/
 8Zx43AFsVbKUnCTXY9xLDWzf05mzNP0m7zfiIrbp+mM1baQPyagVzxLIe6pjmdO2GbAF
 FeHj3l+btpKL7NfDJ58MeRoUTWNwI8jp8DY7i9J3B7PBjUoMr2KbS1QbvXFBz9wfhpPH
 DHITQUJiwZ2kYMJ1/oiVdG61WqG2rvBx9o0dwXq2wqhvT0EMxe8M67t1dsAj1odQ8rE9
 zrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908477;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FM1IoSWydLocj7jgKW9MEFCM/UyoS3Vw58k8MbYXpPI=;
 b=TfTtF4TnSsK6Ube5ld5Wxf/wFIk+Hg0pUyhOA7FvwrmSPkyMBMuhlXAVDX8rYocl8n
 k+BZULyhCD0+/mP/tDAoX6OqPibKVK8ZdDq1cYaJAXEc3vFgYLSGTLHWmX0HYv1VIZTe
 1K1+EwlxLZhkMqBW1GdP8pPJYdZrT3VSmmSB4n6llk/3bTmhOESRhQk4h6opocrIWL6Y
 iZpxnXVRABSiNBclIqLFuyTFHWBl6dB895bRcud1upoRvfIrXdiwmfOPKLUMJpwC5CSk
 ATYzZdQT+I8I22IcTON9n4ZpwzPiTJB8WoQIZAem9EVkMx6vOQIFC6SjU6krN66tZ7Ri
 hZzA==
X-Gm-Message-State: AAQBX9cFn2QANu57D4B1EXn3uNp81JIe1eDUZI8j1wgYFesoBjTW2Frp
 9NJzpboYX+dkbU2D4RuMWoDqyzKCbmfb4gtyuLI=
X-Google-Smtp-Source: AKy350bRqvhbX5rOLuwqRdImyfLdTcBcyn1BquKHrKT2CT3Zjs0A2Q1f98kdBv1POsH49ZV8G3BXyw==
X-Received: by 2002:a17:902:d2c9:b0:1a0:50bd:31a8 with SMTP id
 n9-20020a170902d2c900b001a050bd31a8mr5700663plc.26.1680908476761; 
 Fri, 07 Apr 2023 16:01:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902968a00b0019f3cc463absm3447735plp.0.2023.04.07.16.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:16 -0700 (PDT)
Message-ID: <af0397ba-f714-427f-c050-10b423cc772e@linaro.org>
Date: Fri, 7 Apr 2023 16:01:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/14] accel: Remove unused hThread variable on TCG/WHPX
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:17, Philippe Mathieu-Daudé wrote:
> On Windows hosts, cpu->hThread is assigned but never accessed:
> remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c   | 4 ----
>   accel/tcg/tcg-accel-ops-rr.c      | 3 ---
>   target/i386/whpx/whpx-accel-ops.c | 3 ---
>   3 files changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

