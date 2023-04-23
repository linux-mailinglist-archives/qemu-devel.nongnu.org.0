Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA96EC0A9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 17:01:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqbD6-0005l7-BR; Sun, 23 Apr 2023 11:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqbD3-0005ex-05
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 11:01:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqbCz-0000Gl-Q3
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 11:00:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso19110045e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682262056; x=1684854056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fK86PY255A2S7ePGcO47lsLbWGQFZM07SBZ5mnrpQY0=;
 b=ZvS3eLg8d00gzYhQGIazTo/oqJDpuiZZUQ7rFeveidiV9r1AS+G7q8jPAQ78TPiR8h
 mBOIsaSMYJqbHy4v77+q85GXdpBiMGj6yIb5493AQpVqogGrYZhLgEpVmBFUj9FMXll8
 O49qEywDzJXSWNsBuJlNgH+bZMmkSzyCD272fjW4NZPRkttk5a0ThMEMHNYs49h1DXEG
 aJWIngGJMGDK+AWFJ2cYltC+uBpTa200HRMVSrRNuuIAP+XAeXoRYtmz+bedJe1wbwef
 220hFoP6Ie5L0HHArgxxe7QpTsee4AOjv9e2YWBQcWX5l46lKMnnM9Ou5zsHzHTXLYLe
 nMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682262056; x=1684854056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fK86PY255A2S7ePGcO47lsLbWGQFZM07SBZ5mnrpQY0=;
 b=QMLT2FN+pN3XkfqivvWF+CCYteqCLKh8R0q93GaQ6OmJNuT1HYB4DpQEBQmsPcGrIu
 H2sIS95fVmCckUFQ0klEBZlPLu0DymGzKTJI9z2ksxdml004PX5uwelDQSUC14wD9dQx
 U7tH8PlnWeZGSTp5Y035Sfgam2UxPPEOA8aIbZoVMmxAkDGRnY9hKWcJqQVUBbmqgJJO
 WK9i0cUCe/EZJLVJsVtsrFxAshCM3hV7MijQH085YCRNDn5qqAxomREhpS51ur/BlL5d
 +5BYzxuUU6VnHYRTGgFg+vXbQNt2afFDxEid4VjjJ49HpG08hXm50OXJCWj9FBQDBuFA
 2ltg==
X-Gm-Message-State: AAQBX9chrtdE4r0U48x4dfi1Sey7vGk/EblcSahsv9NvQrhBeQp5im32
 5rauVMRwmhGLgeCQqSkbCaPsdw==
X-Google-Smtp-Source: AKy350bPHHRPvhzJ6Uf292pqyfYyAtOe6HT5gEvPGO64My3LF0F+TZRaRS+k5f/Hep+X3niDvqFqpg==
X-Received: by 2002:a5d:4603:0:b0:2fa:a8ad:c49b with SMTP id
 t3-20020a5d4603000000b002faa8adc49bmr7624310wrq.1.1682262055928; 
 Sun, 23 Apr 2023 08:00:55 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d5402000000b002da75c5e143sm8804551wrv.29.2023.04.23.08.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 08:00:55 -0700 (PDT)
Message-ID: <3ef7b062-d1b3-acf4-4015-6f77f337a1bd@linaro.org>
Date: Sun, 23 Apr 2023 16:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/20] Migration 20230420 patches
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
 <0c8413a9-99b6-dfff-3c80-534048738c19@linaro.org>
 <87y1mke0hb.fsf@secure.mitica>
 <cf72042a-ecb2-bdb6-d4a4-3b45ab9b3cd8@linaro.org>
 <87pm7vdj93.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87pm7vdj93.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 4/23/23 10:45, Juan Quintela wrote:
> This is the kind of trouble that I don'k now what to do.  I am pretty
> sure that nobody is goigng to migrate a host that has so much RAM than
> needs a 64bit counter in that two architectures (or any 32 architectures
> for what is worth).

Does it really need to be a 64-bit counter? Should it be size_t instead?
Given that a 32-bit host can't represent more than say 2**20 pages, we shouldn't need to 
count them either.


r~


