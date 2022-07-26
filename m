Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A215819AF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:27:46 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPHV-00058g-R0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGPCx-0000ah-3h
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:03 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGPCv-0001bb-JD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id 72so13868083pge.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/tiQs6g9ta2YRq84Uoz5Bacm9WHxFxqymykjMT8vquI=;
 b=xiV9PecmuFzqgFslDgX+jF+rhmdW1vGOF3z77MHj8TFvs+qwBWmnycxAnFcUyQRZGY
 qVG2sgbc0sAEI8bH3cOvBhfvho15hi3UTMwVh7DTsOjDxcKVBD8WyNByk2wieuL6MVyc
 gI1STfiSBFgtTTYtpG/BAAF7Z4y6KfkDqe3nfAVOP8ojq1ELrZ9SQ/6JtoGNe1oRAe6D
 dRc8vw/d5nuJQTgIvvlngO5i8xxl0FrkloFZy77QspVnQDOvWWUNCtJMLhiYgdlvU2az
 OwcBFIc9tKr5459LNg/TVh/l+KuunzmKKqoazyCzx8Yc9f5osBm1yThLzlusgqy8PNsb
 ckow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/tiQs6g9ta2YRq84Uoz5Bacm9WHxFxqymykjMT8vquI=;
 b=AeiiEPIlaPmAq0oZZ6E/dMiK4kqUG4Mb7z91IXhZj/PguRt1xjJLrs078Ay2xAEH57
 55VDjCu9lFFzB4fUjT7Jxw69qP55f6tEjXoSyynpoudoxx/pIA8PdQhXmiPrSpplbf2J
 pD6cNAu5nmz9oevtgPXjpa5QNjRtwEL5EiKC9WxVVNWw4ZqmSBailm/L659XTKd7uHa9
 byM7JXdCNIHRTpByFgOzSt4jsLKCxMktG7NQlPdeY7dtt/T+ppE7PhdhqIDr8aO/zIyT
 y8gUlA7AYuwN97CF2PsYEr7HyB1qOQZ+5l+SbCzW2F4mIwwH0HUa/eDP1ZgZMBT8QMXT
 EacA==
X-Gm-Message-State: AJIora/O1bluzndV7U9dkEexYQCO8xuj5sipedH8jYvsVr94zBAxRSoI
 37elvsa6Wel/7Z/ZhdP3OahMnA==
X-Google-Smtp-Source: AGRyM1tmGa4AEszMR4LSvXemsScmGpzxuFmX+TwfhRY/se62Ip0JBAAJeRF/CA7dE65MjvdY8r9b1g==
X-Received: by 2002:a65:5cc4:0:b0:41a:ae9f:5642 with SMTP id
 b4-20020a655cc4000000b0041aae9f5642mr15523950pgt.542.1658859780001; 
 Tue, 26 Jul 2022 11:23:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ec8500b0016c4f0065b4sm2224011plg.84.2022.07.26.11.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 11:22:59 -0700 (PDT)
Message-ID: <8ffc86b3-4ad6-1ab6-7b7d-a297bc3023d3@linaro.org>
Date: Tue, 26 Jul 2022 11:22:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: hexagon docker test failure
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
 <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <15ff8390-a822-f904-457b-0647104fab54@linaro.org>
 <SN4PR0201MB88082B3DC160E3D4F40729B9DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB88082B3DC160E3D4F40729B9DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

On 7/26/22 11:00, Taylor Simpson wrote:
> So, instead of putting those in CFLAGS, put them in EXTRA_CFLAGS.
> 
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -20,6 +20,7 @@ EXTRA_RUNS =
>   
>   CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
>   CFLAGS += -fno-unroll-loops
> +EXTRA_CFLAGS += -mv67 -O2
>   
>   HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
>   VPATH += $(HEX_SRC)

Ah, ok.

> Do I understand correctly that putting the flags in Makefile.target is the proper way and cross_cc_cflags is obsolete?

cross_cc_flags is intended to handle using one compiler for multiple targets, e.g. arm vs 
armbe.

Which is not what you're attempting to do; you're trying to test a particular isa. 
Compare tests/tcg/aarch64/Makefile.target:

bti-1 bti-3: CFLAGS += -mbranch-protection=standard

pauth-%: CFLAGS += -march=armv8.3-a

mte-%: CFLAGS += -march=armv8.5-a+memtag


where we set specific isa extensions for specific tests.


r~

