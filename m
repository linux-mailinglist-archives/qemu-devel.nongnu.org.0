Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E56E8D5E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:57:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQ6E-0001Xx-B4; Thu, 20 Apr 2023 04:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ6C-0001Xb-I8
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:57:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQ6A-0007YN-SQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:57:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so812935e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981020; x=1684573020;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KpuIcmkmN2dpilpi9+bamzXYHTWcmDmXcL4m3FGDS8U=;
 b=w1N5ERTYBOtWru/Y8XXlgVkPYfuWOt+CKcSD3R6RLKHpqc1Mpv87xEWhz5oj4vbQQE
 meiNK6xLqfNGoq/A4q3fnWQst/+6eQdj8M7GdvbO1P2BJJCaxwk4ijy9pDbMqMhQeppY
 dyZquXCRabwjHpOEflbdDeMbRhSrjFPKt51qUguezqexCD/KGrC6L6dr85BNAs0tI7LG
 rd3743lV10pfF8QrY1ZiC15XOTAnMWNnrAdF2+6wKbmbMacTzqkmy1PxUf/fwKvr6kdJ
 Mhq2PWXZm3BFBJxVYgWCH8pjb380i9IMJ7sMZn2/VjQh7PWu4HgafGqkvkvvSlO3nbCI
 ZQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981020; x=1684573020;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KpuIcmkmN2dpilpi9+bamzXYHTWcmDmXcL4m3FGDS8U=;
 b=DZARxhZBxb4Ip3epvPZ9aRdaS6dQkTJwYACuv8TWjnDRpThidYwvyG52x2jWth+MeS
 wh4e36JPOQN0X3oJvBIF8GnZ+wMYOCfnNHm0uAKTMJ+/kWxFiB+sIhz7XsZ6+iW9wtri
 VKAQKg7yBLdbFM+QJv6P60tKYXIeQSplk0MA2e13tV2swuVqVyWkPsOC2IJGH0o5O5FG
 LlLLNaqrVA19rJbRIeb+MRHEE7UgJRwY20iv1NCEVgi9jCi4UQeRn+TXBkjMEs+3GhI2
 /ubMXP0AvcVGp8ukDPUVl/ZmDjXt8I4g72C6cvD4e+3aXXgLx2JY/Kyvg3UAFQ4r1Cfi
 7pKA==
X-Gm-Message-State: AAQBX9cJblH0oVwd68wgh9NtHxndkscomDmqrAVAHy09qt50uVxJd9si
 5LZTWQH5h/dpXFG9PNX5Sy8/kQ==
X-Google-Smtp-Source: AKy350aGmmIfSZatpQJfQXxTEAdufWdfrJw0XorxlcxuYS8lCzbuhoNVKsuKU7LBDC40zYwgXOwvvA==
X-Received: by 2002:adf:fad0:0:b0:2fe:e435:4a17 with SMTP id
 a16-20020adffad0000000b002fee4354a17mr692177wrs.65.1681981020546; 
 Thu, 20 Apr 2023 01:57:00 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056000010400b002fa67f77c16sm1368053wrx.57.2023.04.20.01.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:57:00 -0700 (PDT)
Message-ID: <5d687f01-ff41-e677-a943-4bccc5c4900f@linaro.org>
Date: Thu, 20 Apr 2023 10:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 06/10] Document that -singlestep command line option is
 deprecated
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/4/23 18:40, Peter Maydell wrote:
> Document that the -singlestep command line option is now
> deprecated, as it is replaced by either the TCG accelerator
> property 'one-insn-per-tb' for system emulation or the new
> '-one-insn-per-tb' option for usermode emulation, and remove
> the only use of the deprecated syntax from a README.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   docs/about/deprecated.rst | 16 ++++++++++++++++
>   qemu-options.hx           |  5 +++--
>   tcg/tci/README            |  2 +-
>   3 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


