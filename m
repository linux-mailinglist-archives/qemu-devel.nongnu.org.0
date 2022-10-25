Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B260CA24
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:32:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHDo-0006Dl-UK; Tue, 25 Oct 2022 06:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onHD3-0003h8-Qk
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:31:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onHCk-0001Ce-Us
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:30:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so5877583pji.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zGce/iq3cVZdVnhZxpIPrE4njY8J4i3KrDGTHryABAw=;
 b=Zo4qcMVhlMNVUtq35/YtVF5dG6Q76LbeTscVmJh1qf79vVqRNq487NVtDpWu0G3ruO
 vUzs53PFV6ULD98mhLoPwkRIXoBFX1ooEnT/S0Gp9tL+WCvKtZovswIVqlF71G3eKOSg
 uTK29xeCU6Cr1C8AysKKL3cPUUQSJgx6esCJF3cdwRf4nve0hML/FsrlDPoQxSJ43Io7
 H4FB+qmrr130juDT/2oHH7nwgXNWJGGMA9nzwD0G/87Tng5tdcLMDonBAPRxue4Pjpje
 Wwauuy1GtwkqzOGwQ92emD6v9/bjyl4Vv0pERqfH9r7p1fAApbgkHK50zm2r8fRPaHHv
 ctlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zGce/iq3cVZdVnhZxpIPrE4njY8J4i3KrDGTHryABAw=;
 b=Xaf1r0T5MDPLJOAGaQtZC6RdrceMOcLq8oGH5NoHUkxBx7FXZw5LZ2HBTaXMtwWEHJ
 QdBzW/GMvEnjfWcFExjbmIZZ4YCuAHVWJ0ixPJ5Urq88cqImgjdGXSf7QpdX0Qe5amsa
 4/0nio6/HDZ60XyhbHha6klpS8C0cAb0xhhtHf7qLbp6L/slPBtzXOxn65RDNF+/pA3p
 gGel+/pG8NmQenRHxh0kc+1z/By8scKIOiBA0UUCRh/4GbLMQ8pMF4/HgIwlS9abBwaF
 jIK7F6Y27ggCwPHWgMiQVgr93yrZtu5bOQ12lsReGy790jZhn4pBw8q+nzLYXisjpqdt
 q9Eg==
X-Gm-Message-State: ACrzQf2JMHyYfaUZVhbgvbGH3mFM/Mn2M0V2WYUXk5dEBuYIsiEkDUXj
 RSRJ9k1VflqKjsnXdD1ecrOw1g==
X-Google-Smtp-Source: AMsMyM74l+dNrHZ5xI/dqYvpXvQ41XHsjyt8wy8pRS74lgaEYN2T3qkyvtuZmXkAANadr5MU1u3x2A==
X-Received: by 2002:a17:90a:4607:b0:210:99f9:a915 with SMTP id
 w7-20020a17090a460700b0021099f9a915mr34444310pjg.62.1666693838853; 
 Tue, 25 Oct 2022 03:30:38 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a630a4b000000b004597e92f99dsm1008338pgk.66.2022.10.25.03.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 03:30:38 -0700 (PDT)
Message-ID: <43a73137-033c-4b20-8a03-3ddb88ed9e16@linaro.org>
Date: Tue, 25 Oct 2022 20:30:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] util/log: do not close and reopen log files when flags
 are turned off
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: groug@kaod.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025092119.236224-1-pbonzini@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221025092119.236224-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 19:21, Paolo Bonzini wrote:
> log_append makes sure that if you turn off the logging (which clears
> log_flags and makes need_to_open_file false) the old log is not
> overwritten.  The usecase is that if you remove or move the file
> QEMU will not keep writing to the old file.  However, this is
> not always the desited behavior, in particular having log_append==1
> after changing the file name makes little sense.
> 
> When qemu_set_log_internal is called from the logfile monitor
> command, filename must be non-NULL and therefore changed_name must
> be true.  Therefore, the only case where the file is closed and
> need_to_open_file == false is indeed when log_flags becomes
> zero.  In this case, just flush the file and do not bother
> closing it, thus faking the same append behavior as previously.
> 
> The behavioral change is that changing the logfile twice, for
> example log1 -> log2 -> log1, will cause log1 to be overwritten.
> This can simply be documented, since it is not a particularly
> surprising behavior.
> 
> Suggested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   util/log.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

