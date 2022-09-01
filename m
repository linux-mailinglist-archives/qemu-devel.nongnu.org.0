Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ABF5A8D61
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:32:00 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTco2-0002X3-Op
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTckk-000151-5Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:28:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTcki-00080o-35
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:28:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso751148wmb.2
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=tmVtNctNFMhPuTDxOiXRvhLOvJQd+DlvD7T79OJ8Whc=;
 b=loGDvviCqUS4xo0CFEzTLhvdZWtXqN7JuXVgDMwkSHcvuunbWLohUFaGoIMDOnLcUK
 uRx1m6jH3db1skBt+42x68l0GgCkvonLrSGhQzjHqz8dxiU106XG7UEL+NARMI86QEl0
 hER4AN1pFzL5xV05j2plGTW6hLzuA/SS6LL1CgRqS83gqO49uBRjWQjzQC0+a8F8VyxF
 MdGAginFRu6fXYe/MS4MhBG4SOODYrlrkbF1XSmTyrx+Rs8qt9MmuuoMSRwtWS8gwx/1
 Er2zi6wRWeK3GNswDQng5JKNt0le4TiiYOWDdIfa31L17i98EBAz3kGvegUFikHyrljS
 vBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=tmVtNctNFMhPuTDxOiXRvhLOvJQd+DlvD7T79OJ8Whc=;
 b=2LU9hLfowM8JKM2cN1XzVVnE1bG4hbH3aBw3E7wgvEkBl57dfIry3xvvsR9q0iKOOi
 Nj/tiHYn3eSq90b1b1BEUDvWCZWU9lV0dfy0NpSxmFd/iWgVFPULAPZJSplpwlT6bObX
 6WujeNkQ3oGafVj0wzl9GlqTzmyuZkS7qsAKelw81tvw76L7/xfTgbATHuPvGFjevfCF
 ZNgcfKfiFl+CtXYe5Vrk1lp37YlJEr6iBgPeLD0xW0O+2O1y27A0Sn2tbEO5bQ8ri5Jc
 znfM2d9wjF7qw0+R4dGKjq9l0ywZvXgSbWQa197NcjIivgL3f8drP1Yi9v4ftX5RV/t7
 FEMw==
X-Gm-Message-State: ACgBeo39lhKIp7U188s8Z2GiBaRW5IhdQ4XZF1Ow6DhheF4N/YSrIexa
 5DQAdvFuU0bn6Jei7yyesdJQVA==
X-Google-Smtp-Source: AA6agR7uRmIp0u86ixrxIW4/z9KbSwxIBE97M+Ok1WKJ06nne/aTMSOgjDxLAYhv8ScwCwamHy9K5w==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id
 k7-20020a05600c0b4700b003a5a431ce36mr3984633wmr.89.1662010110087; 
 Wed, 31 Aug 2022 22:28:30 -0700 (PDT)
Received: from [192.168.30.105] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d55c2000000b00226dd738b9dsm8525000wrw.46.2022.08.31.22.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 22:28:27 -0700 (PDT)
Message-ID: <9c064eed-b862-8055-3a8b-663387318302@linaro.org>
Date: Thu, 1 Sep 2022 06:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: TCG IR extraction
Content-Language: en-US
To: Tom Clark <tsc288@gmail.com>, qemu-devel@nongnu.org
References: <CAA_GOyF3YxqT4-9gv-u-3pSK7zPZq7YiGCpsUUvmYbuE_h33_w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAA_GOyF3YxqT4-9gv-u-3pSK7zPZq7YiGCpsUUvmYbuE_h33_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/22 19:11, Tom Clark wrote:
> I've done a lot of digging in the source and found the code_gen_buffer and determined 
> that's where the IR generation is being written to

That's not IR generation, but the JIT compiler output.

There's no sequential "byte" format.  There's struct TCGOp, which is the double-linked 
list of operations and its parameters, which are (encoded) TCGTemp and constants, and you 
need tcg_op_defs[] to interpret them.

See e.g. tcg_optimize() for how to iterate through the list and interpret each opcode.


r~

