Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618347E9C3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 00:52:42 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Xt2-0001Lp-VI
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 18:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0XrE-0000V3-W4
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:50:50 -0500
Received: from [2607:f8b0:4864:20::629] (port=45999
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0XrC-0003eB-IT
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:50:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id w24so5444668ply.12
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 15:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pBlOtJrTAPkQxYDIO4/O+fyaezG8OoPMHLh/qJ9j8RQ=;
 b=fOUIiBm5fvVuoQ1d6sHDi7FOluHj2SzB6UaWPi/3UiiAB8aEUHRImSPQiHCPzWL7ye
 SRrKoy2b2mj2h9lKqHXJMwlZgU3RTqF1k1d80IEMBcsSViMncMRNCDeiiKd/VI5qrx/e
 gvdXAF7j/6Zoag9CXJQ25IfAAw6ZmaQtnQRNk/9grv9XvRGBbr0oZxdubWCVoGWn+Y0i
 zvDsg+YIxjrU5RLb9QeW6YWWPhqdRuxBo2EcEUZFe4RCJdkcQiXNe2JtBcyjE6pglBqc
 BQEa6P1yFRnlOYmTb8iZNx0kJqjwfewJofeE8W0inxBP/KYNhU2ZZIJHSOWOLPsRNTVV
 ExQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pBlOtJrTAPkQxYDIO4/O+fyaezG8OoPMHLh/qJ9j8RQ=;
 b=P2PoyAbCS42RfKcGjqkFtghUT7ggjdsM9Wl0AI0xIBrvoEdzqE44qac+/tnrk0jHwV
 XkykAW7weyf8sj137+M+ViyNj+6DzCsinpbPhUzqV324I7i9PiQLTAt+mC6zjfxRdg6m
 wvREfk4MEYWDPCO6/0XzLRp0Daf1TSP/wMfgivs1BnzCV8r2ZO5lioWG5I9fWY91/dFI
 M/17WGkBKEUcDZywFGu5BMMNrUO4UB+jt9S+JGy/E9oExXkLCOic58ht2l1fye4Qf93A
 iw28jomq9v3fBxcB1VvsZwWPf496nDY18CE1N4siJWN25y2LQ/8l1aGp2gLMMpTo4sMz
 gzng==
X-Gm-Message-State: AOAM531D+HD3RD688wTlCgcxI7dukkfBHoCzCdFSIRWLW8MefeFmlRza
 a1XQqc92kQ8O1Yy1D2F0uxQM5NgO8ghMJA==
X-Google-Smtp-Source: ABdhPJxQcPn40me5nSBNC15wNSKzjs8ToKC5UDDC4PFhE2cvgspoUNAxXGM1l/doRbHi7/zYVcDiZg==
X-Received: by 2002:a17:902:d4cd:b0:149:2d77:387b with SMTP id
 o13-20020a170902d4cd00b001492d77387bmr4477718plg.61.1640303445226; 
 Thu, 23 Dec 2021 15:50:45 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id v8sm187811pfu.68.2021.12.23.15.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 15:50:44 -0800 (PST)
Subject: Re: [PULL 03/15] user: move common-user includes to a subdirectory of
 {bsd,linux}-user/
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211223115134.579235-1-pbonzini@redhat.com>
 <20211223115134.579235-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da25ee3b-aeab-9e3e-08e5-acfa7d90eec6@linaro.org>
Date: Thu, 23 Dec 2021 15:50:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223115134.579235-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 12/23/21 3:51 AM, Paolo Bonzini wrote:
> Avoid polluting the compilation of common-user/ with local include files;
> making an include file available to common-user/ should be a deliberate
> decision in order to keep a clear interface that can be used by both
> bsd-user/ and linux-user/.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   bsd-user/{ => include}/special-errno.h              | 0
>   bsd-user/meson.build                                | 2 +-
>   linux-user/{ => include}/host/aarch64/host-signal.h | 0
>   linux-user/{ => include}/host/alpha/host-signal.h   | 0
>   linux-user/{ => include}/host/arm/host-signal.h     | 0
>   linux-user/{ => include}/host/i386/host-signal.h    | 0
>   linux-user/{ => include}/host/mips/host-signal.h    | 0
>   linux-user/{ => include}/host/ppc/host-signal.h     | 0
>   linux-user/{ => include}/host/ppc64/host-signal.h   | 0
>   linux-user/{ => include}/host/riscv/host-signal.h   | 0
>   linux-user/{ => include}/host/s390/host-signal.h    | 0
>   linux-user/{ => include}/host/s390x/host-signal.h   | 0
>   linux-user/{ => include}/host/sparc/host-signal.h   | 0
>   linux-user/{ => include}/host/sparc64/host-signal.h | 0
>   linux-user/{ => include}/host/x32/host-signal.h     | 0
>   linux-user/{ => include}/host/x86_64/host-signal.h  | 0
>   linux-user/{ => include}/special-errno.h            | 0
>   linux-user/meson.build                              | 4 ++--
>   18 files changed, 3 insertions(+), 3 deletions(-)
>   rename bsd-user/{ => include}/special-errno.h (100%)
>   rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
>   rename linux-user/{ => include}/host/arm/host-signal.h (100%)
>   rename linux-user/{ => include}/host/i386/host-signal.h (100%)
>   rename linux-user/{ => include}/host/mips/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x32/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
>   rename linux-user/{ => include}/special-errno.h (100%)

You missed loongarch64.


r~

