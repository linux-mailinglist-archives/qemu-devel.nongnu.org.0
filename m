Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708242D4459
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:31:37 +0100 (CET)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0VC-0007SW-M7
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0NX-0004Aj-25
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:23:39 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0NT-0001fu-2l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:23:37 -0500
Received: by mail-ot1-x344.google.com with SMTP id d8so1486805otq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tTA1IsTePYgWBdPx8ZpBk1dZ/WLITOHitvV89Vv4cK8=;
 b=eEMeJIf65WDmKi1a2IMyImAncMn91rnSXwgZ75dvh6Lm1LPygqlUUGu0p3a3qZKw61
 d4w0sque1DWrby9tBt/3JUOACHTy6sBcQs2inJTd1jj/PUlCObXfMOqoPgtDnnH+5ESl
 ndoCj4ARJCd/Lr2GftJIRSl4E4quGzuhsgFpEghSAKgz9hrYjXVzFl48t/qQf0gxxdHY
 P5NyB44oc45VcNSnD9c9LYDlNYOoSR3PGdFWPg3pAO52Dabjtr9JjlKSp/g4S9v1SW+8
 CU5MX15lVXWXp9eNQ86w2f3HCJT03OAOif7cnZhTPR7E6JKkKw+3YDzJzlE3w5v7Ym17
 DIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tTA1IsTePYgWBdPx8ZpBk1dZ/WLITOHitvV89Vv4cK8=;
 b=PcQ1tUN+0hjqFjnBhkUhpdlVsmusgGhUU8cy0Zbw2h2BoszCtqSINjOCLxYPzojW4W
 tQHHyLx8NxGAijrkG4GqguJ4fbWfZGCnjzTraDZ66AAMr41+lVNNrNBzHvRhoZ0W+h9Z
 7g4+dhKw8sLxNiYcsw9NgfLR1wkb+XJ4VnpN5FA7wLaEexzkgXqZda38IeNF5eyoxPcu
 +rzRV39T96SkZdjjjJJozAsS9EG6xjid8KIgJkqOQX7US2rGSrEc7ZejhFc4BAxvDlao
 3hNzw9+GkidMY4Rr9/uTbbJOQIDlrTYn2OuYiAuYqeGuH6SIES6N0eS/ff8p1qNhXaXh
 NQ5g==
X-Gm-Message-State: AOAM532rIHj/2cipkyDBOkWXDZKf+0jxS6Ryk3UpJ0DYT6NRHlybcs9B
 a7JRAHmuxed8LuHEbxDAAhJrrQ==
X-Google-Smtp-Source: ABdhPJwsxcQjXsWwKjz03k94ARr21LEW8PrwIgjUvL49fqEXXL834KabVeCpGCGM8L3gfnEEAQ1G1A==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr1900791ott.223.1607523813903; 
 Wed, 09 Dec 2020 06:23:33 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b91sm407342otc.13.2020.12.09.06.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:23:32 -0800 (PST)
Subject: Re: [PATCH 06/13] target/mips: Convert Rel6 Special2 opcode to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b83b1c3-4e1e-9c68-3320-33c406962c21@linaro.org>
Date: Wed, 9 Dec 2020 08:23:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> Special2 opcode have been removed from the Release 6.
> Add a single decodetree entry for all the opcode class,
> triggering Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode       | 2 ++
>  target/mips/isa-mips_rel6_translate.c | 7 +++++++
>  target/mips/translate.c               | 2 --
>  3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

