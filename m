Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA648479D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:15:01 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oKr-0007Y0-2d
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4oIG-0005rS-VT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:12:20 -0500
Received: from [2607:f8b0:4864:20::62f] (port=37591
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4oIF-0007tA-B7
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:12:20 -0500
Received: by mail-pl1-x62f.google.com with SMTP id j13so27639022plx.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y7JpSgdH23C/bbNwpmyo7W94YzU1BmUOYf12VTSIF60=;
 b=pGRbXaF5pFEF4Sid1HOyTB5W28Jhsw3v2RfXdqdOeXLrYFU3oZyVTXtnLN1dfcwt0/
 G3hhKqaAq5ZN5LlMimR4cKQOZ20ulk86D99lKILVNay1GB1n8yyJFGJKn66mSzGisqMy
 /TsEUmKevX9Ky8Q85y9mEAkwKpxKWgNEmvvBfLE1gLz1u7nZaMh1+F9fcCY8jhoClKKB
 P0+5nYza4Xi0KxZd51xXK/G3LDPdaqmEnLTapKqVj58jy3eFmpTeQjtLI9Swuk8AuM1d
 iBfcaOIiXvPCTvuNS3oIYe6L9SIAOuGbn9nBDC/0UWfrvRX3MaiPKLqZ3YbCNVJgTs2n
 ay6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y7JpSgdH23C/bbNwpmyo7W94YzU1BmUOYf12VTSIF60=;
 b=LEaR8pnjW8H+pTAYwNKoRvXm8dWZK1xcRdLLlTvX52NL9tAHur2toQwUiJBPaMvPvW
 MS1JX0nD/KOxi7CkGEKtwI3EdL6VAx5mmhV947mRTqdmdIJSIUXMMDj3IN1shj9bxMjA
 5PCxZWLDzh2Hpgc+r6T1Vn87BnUkQqpEkXx8dwFvE4UF/jiTcA5JpPFG9b3HGoIBi7D3
 2uxzNkRgKr0QiUWsQSrApIE2ZozecOTXhM69W5ffxZw71LvQn6tlhueUJ3y6EMFi5U5D
 k3/c9VNeVerGP4yfMl++KX8RgClqghYopKecIfaA7UFY/Oa1Abgq1MYP3d3R/Jg6xx/o
 YGHg==
X-Gm-Message-State: AOAM533lx/EqMbUCxVdcRuN90W86T3zehZV8P/Z/mCedniGiD7ZJK0si
 lBXZSGPl6KzSjidksY2vD9ePMJ+BMaLsUw==
X-Google-Smtp-Source: ABdhPJxnliI0b8EgDa+CriV66R4SeIOmGMCWjJ3sNh+b5o7q/mdeTDNMshFm1jg4jf7aJRmXFlInTQ==
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr61544165pjb.212.1641319936882; 
 Tue, 04 Jan 2022 10:12:16 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e11sm53837pjh.14.2022.01.04.10.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:12:16 -0800 (PST)
Subject: Re: [PULL 02/15] linux-user: Move syscall error detection into
 safe_syscall_base
To: Laurent Vivier <laurent@vivier.eu>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
 <20211220202500.111897-3-richard.henderson@linaro.org>
 <69f6a9fc-d2b3-661c-38d7-1991b34c55ca@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28475541-89ef-031e-adf5-b1c2fef97195@linaro.org>
Date: Tue, 4 Jan 2022 10:12:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <69f6a9fc-d2b3-661c-38d7-1991b34c55ca@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 5:51 AM, Laurent Vivier wrote:
> This patch breaks command execution in bash command line interface:
> 
> - if I run "chroot chroot/powerpc/jessie ls", it works
> 
> - if I run "echo ls |  chroot chroot/powerpc/jessie", it hangs
> 
> - if I run "chroot chroot/powerpc/jessie bash invalid_command",
>    it does nothing whereas it should return "bash: invalid_command: No such file or 
> directory".

Thanks.  I've reproduced this (or something close enough):

Host:
openat(AT_FDCWD, "asdf", O_RDONLY) = -1 ENOENT (No such file or directory)

Guest:
502138 open("asdf",O_RDONLY|O_LARGEFILE) = 100


r~

