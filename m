Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17F6D2E73
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:54:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piUBK-0005ci-PO; Sat, 01 Apr 2023 01:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piUBF-0005cV-2f
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:53:37 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piUBB-0006CE-81
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:53:36 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 184so43621pga.12
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680328411;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wfzv5H3thvpSz5/WDD4vzoeZEaeU4ei6mdAhvrz2T6E=;
 b=W+TdL5C7gS1QJ0XEVoJV3lk8HeBDZOlDfW6u3gQWSwpbySOFyNLVfgIIp8Rda8asQN
 qgoTyJSDCGdyd7VZ7T01hMIOADsl22Rra4DGQ7NRAKO1MwLn75v58T5lKHvWld9bOck5
 5raEwMWIWFQAgEFXu2JCHgJThwgSmXTOBINYMj/bIGk2kdmrR3UxBLwdRsqt/aYjR/6u
 gM1+kEVQix1fL4wRF5QDq/OYTBGmH3Y03P8i41GTmwQib3vNDcXMN0E1n8oktnG+JwOM
 I2QQnOSawY04Z52oQJsidetrGHFBxcrzbpy4yXYLq0FC7nY/QPosYhi9fLGwSA7Qm/C7
 xUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680328411;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wfzv5H3thvpSz5/WDD4vzoeZEaeU4ei6mdAhvrz2T6E=;
 b=bdwE0YK0KQ53r4K1t1bXiYikv3Fc6KWiQ/+Fto5Lx0RZqr6CtZpl37YkLVg/4toUJI
 P6xV9NR31NMdoiegB6qsEYmABsjT2J+4JyC2xV0CLralZlst7WaGUMvZM2UDAm5qXbbm
 OnAsHIm784Cu2jFD7IdxFTzjMVPjQjYusZn0mkURzBFDKZWJc32N88VLZlAMen7FcGoc
 A0Upaj77ltKWcz3hPGdEc7jh7IoykW3JodXhoMBmGlNbmpfNiXcQ9Klt9L/A1xTxRKpP
 nJdJw8c9UXQsu7eF8Z87ya51+VKKdrtBAoFLGJledGJrbaviHZdMaXMdok/Z5R+Vauq/
 S6mQ==
X-Gm-Message-State: AAQBX9fjHcc5AejSGjkTiqAa4thszItRFuCwz6HZzOvCukyNfdlE+9Sr
 jGzo6PEXD9xTt4P404AMAO6hFw==
X-Google-Smtp-Source: AKy350aNYzkOhxtwKPC5oYrDKsO6XJ0zajI5ok7msaZZVOTZX3BBKgIFPUnOYR+k8UYg7xrGi7t6QQ==
X-Received: by 2002:a62:17c9:0:b0:625:ce21:3b1b with SMTP id
 192-20020a6217c9000000b00625ce213b1bmr26650871pfx.3.1680328411251; 
 Fri, 31 Mar 2023 22:53:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b005d92c9afbd4sm2754613pff.33.2023.03.31.22.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:53:30 -0700 (PDT)
Message-ID: <02d78005-6382-e116-1f5a-1b4b950e8d1f@linaro.org>
Date: Fri, 31 Mar 2023 22:53:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 27/44] target/loongarch: Implement vsrlrn vsrarn
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-28-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-28-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> +        temp.D(1) = int128_getlo(Vd->D(0));

Typo here.

You should build i386 host.  E.g.

   make docker-test-build@fedora-i386-cross


r~

