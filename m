Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B844B5E8FA0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:24:30 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBhN-0002KN-Sd
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBgA-0000yv-HA
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:23:14 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBg8-0001up-U4
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:23:14 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so2048528qka.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ui7CoBarowYfhqHlXyGmpNtcRfmNMKB6LCcYHda8WsA=;
 b=glSNPZfjZYCBITPhPY6+FJlkymdJnhYJSKbR0GoK6t1GpXZt3xsJ0R0FNCOxOEi1B1
 Q7wdMSbHK6D88H/E9wVz0Upei+Oasl0Bqhjk6d80k2zQO5IpU62Do47Z/aaumYLPYvQ6
 Dfj+ivUIgQpqv0i4kpZ3c9EUy6OS4uT0U2YYX66pnwHIoVZrwpj8NcCOumtuBH/+ACHc
 bXmbN7Kh7N/+93Bz/LSuqG2Re2VYBKNFOsqDef6CVHLDpPARr2We0SuNB6IyD0tsmnta
 TNwrCixdu6A2tEpQ1jtiYdbJu8fC9G57Hs54VsqhWLpaD9R556G7pce81MjrXl0qIrNZ
 bizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ui7CoBarowYfhqHlXyGmpNtcRfmNMKB6LCcYHda8WsA=;
 b=cx0a6uveDyIh5pR90C1LdkXhTxgcTxFrIQzUiI8QR6s7bCu+aj7lJrgoyWbNig7qIK
 0pSo5YHO6PaZWYmtlDBlKD8mU29nm9rMjXdvl8CIop7rsB9UX99RwuWtMUy8Ov5PEACN
 cp18RSmMjLKohpuNtYtqUmSBYEUrZnuME6RVtEuLayIe6oba+PgAm53yDHaYrm5iDAxp
 k4j1s5W3QLHEZXsjcnTNLDFlMgOV4Cu1gP+h01pa1myg5MXW9uo6ewrn7RVObEQrjsZS
 /RC1Dh0uPPtP2E6OsSosSNjQXXtkJErv4UZh/U4XaGpwteIVzfML9dSiNqMRTdX/FfRs
 3NdA==
X-Gm-Message-State: ACrzQf1HNCvBrGYwc6isg9HJFQtQoeRaZvEozXvJERdBKzORWYEjzb0h
 6JjaYq5wcwI0H3tuqutOriXPTw==
X-Google-Smtp-Source: AMsMyM4o8s+hiLiaZ4u1ni+Uf0AWf4lR+cyVEaZ2YkIepq4NQH1p0SkH+PNNfjziecoGaS9M015roA==
X-Received: by 2002:a05:620a:44cb:b0:6ce:b918:2ed3 with SMTP id
 y11-20020a05620a44cb00b006ceb9182ed3mr9887420qkp.117.1664050991874; 
 Sat, 24 Sep 2022 13:23:11 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006b919c6749esm8734710qkl.91.2022.09.24.13.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:23:11 -0700 (PDT)
Message-ID: <35640cfd-f853-1fbc-7898-78d63e3bdd22@linaro.org>
Date: Sat, 24 Sep 2022 20:23:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 11/37] target/i386: validate SSE prefixes directly in
 the decoding table
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-12-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-12-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> Many SSE and AVX instructions are only valid with specific prefixes
> (none, 66, F3, F2).  Introduce a direct way to encode this in the
> decoding table to avoid using decode groups too much.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 37 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/decode-new.h     |  1 +
>   2 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

