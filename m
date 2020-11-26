Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CB2C4BE7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 01:16:56 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki4xz-0002iF-GQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 19:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4wz-0002BM-IV
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:15:53 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4wr-00080S-U9
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:15:53 -0500
Received: by mail-oi1-x244.google.com with SMTP id d9so359931oib.3
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lyKBLVm00segjs6AF3pu/izuFyf/nbg4x4P7HCZg+6I=;
 b=QAbIAe09oZpjl4D4TjRT6kZqydHJ2hAX3cdPjVxs1PBy7jlpOQCmi4PdfYqgEUjhtz
 6JZPkqkCWumC4R5QmxRULkljOgHOLP7LNeSpbZ7d8Lr1MAIQ56b3SW0seH6fX3EjdCy4
 k9QuEcP1RmpNDQlXE5ILHI4cC3Werv9dKKMVK/e72RR8AI1/rKb8nkoEJtDlnCU0rRRj
 J6XDSSl3e4QwzmCbLXPCxgvViUzwxwKDYDrInyYeLUvwMHtXxchyubba7FooKDM21Wo8
 KuzW1XeLKtHna+XIy71Z95bGhDQNUg5lwtu5I+5iT1vQ3iuGBGyTg5Ifv1njbFIir7y5
 u4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lyKBLVm00segjs6AF3pu/izuFyf/nbg4x4P7HCZg+6I=;
 b=s5XXlsBQXB7of0zSV/12RlgNorukiLT3avFWKHS1BVHeLujHxPXrTgYZ1QqwNDrziJ
 eLfzy24hUIRABm2FUrBjzrKMQf2vT79UPMFZ+h6O/jdrhFpUk7fZDTU26W5NUBkou07H
 C5WjLA1H7OFP/UF2s4DEMGQV7L44BpyyR0mSOxmlh0x0YZ3fqlf69d15Es8QzpqHnw8c
 9F8OT2s659jFvfC3kGjG7gMa/34y5eBTEdh5mVn9MWRfqEXrlNlDPy3K42Jp5SaclOjw
 4E0IHz2iCHTPy22cUjkFSvt7O+CCoPBbK8BmGaGTXAFSxCvKIk4kLO2d6G5bEB4yHFMw
 XevQ==
X-Gm-Message-State: AOAM530H9dJsqO/CcdPvQbxf2ElFj2FyVoVYV5pW8iQ/lr6O/6SlEGQH
 jd9cVUKe9L/lUDnMPNi/yx5aLlEa2nVcYw==
X-Google-Smtp-Source: ABdhPJy4L+FMM3/VSZFhtpKHg0RIGb8RTTP1yxDdHyypVTevfXazT05kbGEK12K5wRwTgKmvI6BD9g==
X-Received: by 2002:aca:5110:: with SMTP id f16mr444153oib.94.1606349744205;
 Wed, 25 Nov 2020 16:15:44 -0800 (PST)
Received: from [192.168.20.233] ([12.220.158.163])
 by smtp.gmail.com with ESMTPSA id s131sm2248733oie.58.2020.11.25.16.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 16:15:43 -0800 (PST)
Subject: Re: [PATCH v2 04/28] target/mips: Extract MSA helpers from op_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b09666cb-37f0-ac67-4a65-687cb26fc6ea@linaro.org>
Date: Wed, 25 Nov 2020 16:15:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> We have ~400 lines of MSA helpers in the generic op_helper.c,
> move them with the other helpers in 'mod-msa_helper.c'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mod-msa_helper.c | 392 ++++++++++++++++++++++++++++++++++
>  target/mips/op_helper.c      | 393 -----------------------------------
>  2 files changed, 392 insertions(+), 393 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


