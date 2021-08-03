Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F73DF8AA
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 01:55:21 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB4Fj-0002rN-KN
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 19:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB4Es-000280-W7
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 19:54:27 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mB4Er-0006Jq-Cx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 19:54:26 -0400
Received: by mail-pl1-x636.google.com with SMTP id j3so1015907plx.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 16:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0UMhOzG7Sj5C78mmKAMJQjH2EWSri0mjZwbKwW3xuVc=;
 b=U5kLH0vsWlKwWVCA64wCL0RJOjIwRujQK7wzw8VA7hGj6zFwH9KtmzvDGunvvTOOv7
 XjbuHLzOW6zXeasIABfBU+CtR5q0cvwkGcSIyThOyKbjY0RabzfgobppzIWlRmJ60zHR
 A7STKLKsWkVcpbZMHkqX4m29iVBjhh374pwylGAYfeMzedEGGPIb6mCIAYSZzBotb9qM
 /1gnQyAQEytvstrbkwZCnyqttOImTvcGUCb/oWjD9WaoyJ52rgiTh9SWvxlADshit9Wf
 AkCj/0F6/UbnZjhB/ZEI2m2FObyijyaclDaXoKkNvXahzEuNrazALDg+fB4Y6mQfOZwn
 Qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0UMhOzG7Sj5C78mmKAMJQjH2EWSri0mjZwbKwW3xuVc=;
 b=QIAY8y4dbMurtm8np2eSlEJzVoTiK49t8ICX4NY/nUhiLdajG2Ym3d9J3KfnHbDcHw
 NgRG/KgEqymUXTyDOT9/MUgDiot9IDRwcXvGuEVwq0QdIcx9m+vRQROUUkl50cnD+2Tt
 p3BHOyBQ3lS73FcyxFNMXZB0pKKT6HuTorrm7vFMY5LHkZfxRCfZ7nJUdDJ5C7JO8b3Y
 g8m3yVaQBeMl7+ONDmZyOkElm+KIfrM4yJK+UKPBPYaxh1clGnaGs9JrJ/v6JnCql5wX
 RHpx50kYgj292di9UXlFxWUnhmmR5nZC3ZwJME78sMuI8qRlWlEPrnXP/47I9r9ZFlTC
 kEEQ==
X-Gm-Message-State: AOAM532jCeLduZuOGJJTOgnw4ee6GyY8TQUKBa6q1vyi1gB+VbQ4b3+b
 L0d4XJVMwDPKIYLNTzS2s/GAag==
X-Google-Smtp-Source: ABdhPJypc2p9BhHxhm7chBCxq//gJOmy5Lu8QNytMI4jDP+dIz1CzwEZZc0+gMPtlUtjdnaDwgKsxg==
X-Received: by 2002:a17:902:8506:b029:12c:76a8:d1b8 with SMTP id
 bj6-20020a1709028506b029012c76a8d1b8mr8399012plb.14.1628034863712; 
 Tue, 03 Aug 2021 16:54:23 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id h21sm322161pfq.130.2021.08.03.16.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 16:54:23 -0700 (PDT)
Subject: Re: [PATCH v2] accel/tcg/user-exec: Fix read-modify-write of code on
 s390 hosts
To: Ilya Leoshkevich <iii@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210803221606.150103-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af3b1aad-42fa-10cc-70e9-b74e2918f1c2@linaro.org>
Date: Tue, 3 Aug 2021 13:54:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803221606.150103-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 12:16 PM, Ilya Leoshkevich wrote:
> x86_64 dotnet/runtime uses cmpxchg for code patching. When running it
> under s390x qemu-linux user, cpu_signal_handler() does not recognize
> this as a write and does not restore PAGE_WRITE cleared by
> tb_page_add(), incorrectly forwarding the signal to the guest code.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
> 
> v1:https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00464.html
> v1 -> v2: Fix comment style, fix CSST detection (Richard).
> 
>   accel/tcg/user-exec.c | 48 ++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 41 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

