Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229746EBDAB
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 09:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqUBZ-0004OU-7D; Sun, 23 Apr 2023 03:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBX-0004Nn-6B
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 03:30:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBU-0001r8-Ha
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 03:30:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso1902421f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=l2DfMTJpr+oNZoik/8D6RORvbvrQw4ZFJvFpzuhX4SXM8huNXM5KcKiTOymGVFCIPi
 rg01xNMz4yfc0rRXE6Jhsa2epLnZhTZZQeVr/VijVZG7ZHX8O5Qh2DTC/C/i6zqCMU+5
 U22cGEi7087UhMvJJ+1biPser2E+OVJ9oKW9q365z/alzM2RENZLYzNGd3udqJfYGkbX
 ueaTi3ciQJzX2EitrIiWEFOS3Zvm2qq9b8x13i39eaNIgTFClcXiq4vnqQHTuwLxe8vg
 VF1djDqZ6Y1o1MtFjW6/vCDLfV3cFdF8766ldrdCdP1mtfNRJLWrO7EMO+QcEw0rryzS
 0bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=Do/KpMDjFGtSHqueEAWVsGJ8OU1C11SeRx0y96fTsheGT+YEiAQdVmEl8FVN2ckzRx
 shE8jterOYkuUFTSe5zwbt+O19gssTuvnBSiyfbuOn57doJqOrtgIQcJaI95X0fs6JEE
 XXTGsx7ArKELS8h03ouBynORk6jjhfpjf0Nq1/WW8BTEpvNy+QB2X8p/XAZCn2NcrJNf
 +yiaWa/RXmErTinkdm+2uMMPxHi7u/28VCG9myHE0MUGXrKmWmDzPu2+V/hq4BJsahbu
 oBCElmUJ3Giw+/9NGJKZLxXGEbUMOQWFgBUJ3P6zTj9NOpg5/MYUzYv8G9hpUDC0n+qS
 VQ6w==
X-Gm-Message-State: AAQBX9eQOM/K7pWDNFTHWf9SbGlLL3lNXYae/gX21khUI/mxy2yerRbs
 0KgD5rF9XfF6mz1VlMMejW2+Mw==
X-Google-Smtp-Source: AKy350Z6oBqvUqrf5glxd9wdB8xsV8KfNrqCkGkwyN4G9kYsw/ghde+lOKWoPrOg7UEQyMPkOYOuWA==
X-Received: by 2002:adf:f209:0:b0:2f5:ace2:8737 with SMTP id
 p9-20020adff209000000b002f5ace28737mr7817660wro.32.1682235054927; 
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm7198959wrs.115.2023.04.23.00.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Message-ID: <db8c5197-74b4-497a-587f-994b100d4344@linaro.org>
Date: Sun, 23 Apr 2023 08:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-32-richard.henderson@linaro.org>
 <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/21/23 23:29, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> This will shortly be used by sparc64 without also using
>> TCG_TARGET_NEED_LDST_LABELS.
> 
> Is that in this series?

No.  I've been cherry-picking patches here.


r~

