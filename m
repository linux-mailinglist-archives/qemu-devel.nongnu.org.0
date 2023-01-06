Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE4660A2F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvyV-0000qD-6Y; Fri, 06 Jan 2023 18:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvy6-0000l0-RI
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:17:46 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvy3-0003MR-8t
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:17:45 -0500
Received: by mail-pg1-x534.google.com with SMTP id g68so1067047pgc.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNQa36Qj97i4mtA4/uju5ksQcR33y80Cj407Vcoccs0=;
 b=vKCPhQynl0EbI9jU7WMV0jSmNMrnLZVwYmHvDGRDb0ZZ9aiS0OpC7wvQWYoGlFWYhQ
 znpGiHeoz5VMO5/fbcWZz8HZ5T0E4k+/9LoJZeYmY8sRLtusdOd52MTYF4e9RQL3ingM
 5BG7H/PbyExqV01yC6YrmZJ/coq042eTz/dHVnsU8KThgwS8y3y0GlawAtXzhVoAn6GG
 WPt1aMlklq3xXNk5fAWDPkdBg4ZZeKqcmjdkMsIfZQSnkDwLI6y26Ihy2XoZ1ah7HrhE
 C2IrQdKDXy5VE4xu8KPa0kgkzyPH7/veyktV6PjpuiQDQp8aet3Y3j3JQk8TQWBd5C82
 tEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNQa36Qj97i4mtA4/uju5ksQcR33y80Cj407Vcoccs0=;
 b=nAUuCihfWYjiBj4r+n9/hzgfZ9aThoeOsDLRlZUBMR5a2n+nAvn2OqTTYeju0+VUNT
 l3HmrFcsac2Yuou+wjSmcz/YXv4QQKKt4ma230OnBDyqtd+9bledZ16g0E9g53ZphMQf
 RKc0H6BdPJOv+K7aCo1nRnzM6iWy8tHE8ZzZh63wBhWPlnVsHnqs9A61ufxau+qIPVC2
 JLE3o27pzQX/IYNLfOHh/cP2dbPb4gYgjwJ918TxqRmb1xLRlDxNxcO7qnHio+WOSsaK
 1JDov2xN1gOe1PnKGrha1X7TW3gGF2tDsLFiE0HjEdRSzcQ8NqNq9UyUkfahZNYZ5pXb
 qQMg==
X-Gm-Message-State: AFqh2kr21zkcbvAlvHBxSMl6H90W62RO1UbH4pBbEmQxN/k2qREPfCih
 /RzjfCc8z7RhH9YcJc1FBU5sUw==
X-Google-Smtp-Source: AMrXdXueSR5nzJhsUuMK4PdXKIeTq+JvEkBAqcmeIPYixz4Klx3uuAK/6fJaxaD8a4nF85ttpIz7+w==
X-Received: by 2002:a62:1d96:0:b0:575:e8c5:eb14 with SMTP id
 d144-20020a621d96000000b00575e8c5eb14mr55743796pfd.18.1673047061609; 
 Fri, 06 Jan 2023 15:17:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm1649993pfb.0.2023.01.06.15.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:17:41 -0800 (PST)
Message-ID: <9e1ba204-0872-02fd-c4c4-6786800c54a0@linaro.org>
Date: Fri, 6 Jan 2023 15:17:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 16/21] gdbstub: specialise stub_can_reverse
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> Currently we only support replay for softmmu mode so it is a constant
> false for user-mode.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  1 +
>   gdbstub/gdbstub.c   | 13 ++-----------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

