Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B36DB89B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:35:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkzLP-0001KM-Gp; Fri, 07 Apr 2023 23:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkzLN-0001K2-J0
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:34:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkzLM-00074L-1J
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:34:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id b3so296274pjq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680924862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FhpZTbHOLYHRrMdR6zU3uiK2jQ07sEm3OzhQkxiSO5U=;
 b=TfQnf9cPTvfXpI/xLbiCT4bCo6VoiiIhE5VQ897Wshfvf1eAASmLNe8sELwyNo0Huz
 UnJAIrFT51iQrkHLZ9V5PQXD5Fk5sIDiY4JWXJ3xQ5c/6JifYszzJA9fdhWdnTaUuI8P
 balChhxdh3ofYHi09BxvYwWY+N1Sf0EgLxvWVUzz3jefOMmk+uGny54LLDqJkohFuzfV
 87karV8X9LrNH9tq9mLodtyCEPu1Iuzjh4E6nitPUQXS3XJSX+SNoVzxDJbI7BGrnRaq
 46WOrPISue4xH0Z6uGOeIRlxYUeryxrbaXSeZ2yp1bq2Wy9X3IyEMKwLMjl9poo4f0Pk
 ivHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680924862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhpZTbHOLYHRrMdR6zU3uiK2jQ07sEm3OzhQkxiSO5U=;
 b=gh4W5hNPMCpxG4UKrbReX1J2wPv2EQIcpmQZNpEtWOsgQgqdCDqJ7NC9zBb9/ECc8i
 5iPfUsiFRooYbZNtyFyEeC+o8DzgOnGNh2qJaKt4S2POHWn6GpKZrBVS6z6MS4mEX89n
 2udew0DwNbLoGTrf/d6jN6qn4dZSgKEv+PB8mNlttQIbVzEm0DZBdFbGbx+ol6TZpYXa
 XvXKNt00DxB1PsPJRw32ZhyeWlnbnMji5T7VzfqzcqJilfdSpI0C+j3dbwf0PZg1eX/T
 I83aEh2i6rkqEqwxX4I1VhVnK4Ho5+f7e6Q9dQFjSQKKQ4fRqmpkQWc2KJ8aoDqlYY7I
 0k6g==
X-Gm-Message-State: AAQBX9fNOQEUl+N4uUq4Yt/WIjEfH2DqKp3CayqBy18Oq8dwhVzYiG9t
 JOvDov6U2e++8O/35fHnGspsHA==
X-Google-Smtp-Source: AKy350b4360iSZFz88RPBfnA49y3p6PPV+kOdYKSqdU4XI5LO497hYEUgTs49F7/KQ7bkvWDslt6Ng==
X-Received: by 2002:a17:902:e1cc:b0:1a4:fe85:ab05 with SMTP id
 t12-20020a170902e1cc00b001a4fe85ab05mr589367pla.48.1680924862042; 
 Fri, 07 Apr 2023 20:34:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a63da01000000b0050bd4bb900csm3410534pgh.71.2023.04.07.20.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 20:34:21 -0700 (PDT)
Message-ID: <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
Date: Fri, 7 Apr 2023 20:34:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Fei Wu <fei2.wu@intel.com>
Cc: pbonzini@redhat.com, erdnaxe@crans.org, ma.mandourr@gmail.com,
 qemu-devel@nongnu.org
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8i9jviv.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 4/6/23 00:46, Alex Bennée wrote:
> If your aim is to examine JIT efficiency what is wrong with the current
> "info jit" that you can access via the HMP? Also I'm wondering if its
> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
> extra data it collects is that expensive.
> 
> Richard, what do you think?

What is it that you want from CONFIG_PROFILER that you can't get from perf?
I've been tempted to remove CONFIG_PROFILER entirely.


r~

