Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAB6D3591
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 07:15:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piq2f-0007HY-Ez; Sun, 02 Apr 2023 01:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq2b-0007HC-46
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:14:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piq2Z-00080Z-Kj
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 01:14:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id kc4so25121456plb.10
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 22:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680412446;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=reum9fwNaQgv4yHz2SmII6qdH9dQpZzI5lRaXfXpk5Y=;
 b=BhjGZTgEFUf7uIibY7SHk8RkBzu5nU5JhaJjnXzIgjnmwkObGPTi6cOxn+NKERvLOB
 apmCvipRnbhKGhSCIg0AS4tY3n5v95iE9x9zEJMBlX1pIKLolRV68xzRHhAkhTurXpkj
 HTTkWNAu1y+vwKsvFVcIpT8GM4OMM+AjtOecmApxUTCYBodjHEVqKvnHxM6Kdliv6DQF
 mbvm891nZtwLrJaE9DRQ+COFVtxlZBqhgGxa92Nr4L99OIrV8Dx1Na02xJgxSvwyOE1Q
 KEDtp15Ts1xGgVI77c6+d2jxWqblZuj7VlqLu/Vsl4gaaj+MPL3NSxnRunXe5Kv2QcgI
 /NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680412446;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=reum9fwNaQgv4yHz2SmII6qdH9dQpZzI5lRaXfXpk5Y=;
 b=NUYyexV246YMb564XJzy9QUq96voQVE6L+WI1KsTYjGf4YFPmBgUS/qG1LZBPvTL4R
 A3/H1PGSzOxwTUa57Q8WA5a2qjI9zdpikdjojdkr/zN5aUwa3PEni+IKAniY0oNaEOBV
 hSAdGzyPYLxXF6yB1A5Q4AlkKzcsqMnK65S9K/GtDmCZx8qdrw6uIj2iZTbS8CwBi/X/
 mUd76NOCUnuPUflyGig4HqbQzR7yRwiB6Ip2lIPuovxABsinTp4+S4OBl5gETuHjS6/p
 MNs1xEc69EacIX2bPb55vyyYgkf/6PAhthdDevl5QmzPQyKwnMmBK1/iYTnxr9wWdqA7
 PPJQ==
X-Gm-Message-State: AAQBX9dwyRRWY+GwAxxM1bDWHj5kCCYJQfgS+NpXlTRz4JTFW7Cl2Rye
 tJ4iI0GPNHLIXDm6a+8J2EtZfAueuqDjntSMsIE=
X-Google-Smtp-Source: AKy350YyJdmlnlLo1TuGH9eIlEp0SSayilEomeH6YxxCyAtbxhGZS8d0q8pDqHdV/i1vHtP4vAe4mw==
X-Received: by 2002:a17:902:f315:b0:19e:7f6f:8c32 with SMTP id
 c21-20020a170902f31500b0019e7f6f8c32mr24699464ple.48.1680412445649; 
 Sat, 01 Apr 2023 22:14:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170902740300b001a19f2f81a3sm4147890pll.175.2023.04.01.22.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 22:14:05 -0700 (PDT)
Message-ID: <743fc173-8030-1dea-0b6b-ba0766be22ff@linaro.org>
Date: Sat, 1 Apr 2023 22:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 32/44] target/loongarch: Implement vbitclr vbitset
 vbitrev
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-33-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-33-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> +#define DO_BITCLR(a, bit) (a & ~(1ul << bit))
> +#define DO_BITSET(a, bit) (a | 1ul << bit)
> +#define DO_BITREV(a, bit) (a ^ (1ul << bit))

ul.

Also, the *i versions should always be inline.
And it should be trivial to expand the non-i versions inline, with shl.


r~

