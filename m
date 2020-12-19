Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7C2DF0FF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 19:24:26 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqgu0-0003cc-Lx
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 13:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqgsg-000305-NM
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:23:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqgsf-0000rm-6s
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 13:23:02 -0500
Received: by mail-wr1-x431.google.com with SMTP id r7so6514786wrc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 10:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53ruxNCK/zp5laH9ruYoXrroklImj4s7w8KxWFgrvOE=;
 b=eKPoxNYSxwy0i4SoO5V6LP+OEht8hwAWVhywEOv/eIQzJMf5QWss7eqQocA7YCPpqs
 sSzBWek2HMV4uZmECfKPu5QzpFlv4Rq2j2ecKLaUna+JR6NhMvtyAcyDwi9utiRrBoul
 29QjfaSBTr8w8y/eY0cdNEhk/q7ONaxzuU60RK82PFXvEYV8OitZx7fYWc5FEUPE3irn
 hFq1peEoVaqvQr+weRD6mDG/F34Nm2VeOQpURPzMKtybma4vcRsgsYAdkGjNSqOt57XG
 HkVtDKu+dQxOvpBkulVcLtfg1XEg3jILMCvetNB6Q27zTSjYKtiOdgLo4YrbTPoGNhlA
 pXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53ruxNCK/zp5laH9ruYoXrroklImj4s7w8KxWFgrvOE=;
 b=UDsMT6bFk9QPYLgKNqpbckYJjryuguOZy8RuJoe9uWP8ka//iWbkeU2/g62j1+tSpR
 Q/1b5ge7vFD70//vRLbj4teuT/fAo46r1DHDNSbObNWaL17l/gvq+B+kHgswncN+aEQx
 QdqXOU2BMBZ2fKTd4Um/XHSZHaxMptKs15ynO6/oVcHy1FT67DG7R5fSSgylupwICSa5
 JYwqxJRK2A8HiLABaLYuhxcF6yuZ8r1fw91Y8H7AR4fHmrIy3y06lkSGsTdNcXomA7Fx
 diCjjdfOCikEXL3ErJpZFQlrNzxwborUiDg6AKQsl8Q6qI7nCfrvYfCZ8W4sK+G9B8Y9
 OfcQ==
X-Gm-Message-State: AOAM531hT4aRXZc06oMbhsdjJzNcQeWjU4ouWjFJlU+DOR6ML3VT9X5u
 URgf8L08ot6/bFPwGsCIzO4=
X-Google-Smtp-Source: ABdhPJzaTs/9hjhLrOcbOx0W4Yy1VGiNs1bJnBbzO4xuPaOaBEVJdoTE4KRDylXEtpmY6u0NYEP8ZA==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr10257356wru.201.1608402179555; 
 Sat, 19 Dec 2020 10:22:59 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id r7sm11942216wmh.2.2020.12.19.10.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 10:22:58 -0800 (PST)
Subject: Re: [PATCH v2 6/8] hw/mips/fuloong2e: Correct cpuclock env
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072139.39347-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7cd691f9-cad9-ebdc-6eed-4ef9eef13ec0@amsat.org>
Date: Sat, 19 Dec 2020 19:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219072139.39347-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:21 AM, Jiaxun Yang wrote:
> It was missed in 3ca7639ff00 ("hw/mips/fuloong2e:
> Set CPU frequency to 533 MHz"), we need to tell kernel
> correct clocks.
> 
> Fixes: 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency to 533 MHz").
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

