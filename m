Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E558ACF3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:16:37 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJz3m-0004Pp-PQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz1t-0002qD-6r
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:14:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz1r-0006Ka-PQ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:14:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso8560364pjf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iBTp0Z+lFhZCg0QBr7Rr34Tb471MiBFEJQKr/WriRQE=;
 b=Mv/YfUf2Iq6vExm/u20a/gdtsjRRxo6JF/UCRAFhJWGmjVdsRMQ0Heh0Cv3HoNTqmp
 cnbhcWvex8BgsOVgPjUgAJkiQk9oPr3PdqX6DX5CvvpRjcJ7LCCQ/RH5dWqXJt3ZM95T
 r0i4aKqAh0IXT0OPUGOBt0TaOzqMLVhyJU6ypqKcw4VxC/mwEcBslHfnU8n/NDaFBomm
 FAM/aHMOJYNXE14Sdnono6KqXNEpGg9DlKZZodbMYchAFSy0ZJLTdsgrrtSkf2fhWzG+
 fNREi7Y6XUOb4gAW0MPHIWOWDQ/dFMFwFjJgfknJqDFiExwRN8n41v/9ig5/hs/nRSHP
 S3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iBTp0Z+lFhZCg0QBr7Rr34Tb471MiBFEJQKr/WriRQE=;
 b=GxuQT7fbyxz5VEPRUuQPuN3umFftqaXclD+sGPu5OmCHhkHMbTzFP5uAA5HkKml3ZN
 rLTMRc9zBCf7dsCUfU7zAVrCOFbW84LTdJAt0I8wo7+HJ4fzlv/Tsd62IJgfV0uO7f4y
 p8JMqc08WO3dtbf/oDQTz+lrypE5INuC9HJMc4mARkollwEkj36gkHWJMcgJ4S3pCbn/
 MnhWbg2Yw9PFFw4LRNQwTzeFVcQ8CZNXfa68ZeJBJqN3Tp2w7bkdQGrYDXhoYKr7YBiR
 x/bj5qVIJSKjJ8rmkkF0BpLQhO+sXC5RoHCOQDUtV3h72TIaLMTmP+tgeuzrnJ4+NLoK
 3p/Q==
X-Gm-Message-State: ACgBeo207cJsmh/5WwfFpE/XRLux6h6s/Q3glIp+ZK3dCsMqLUG7Ng3w
 6k/9PWR5Gx9s9LtU/MGRoLubcw==
X-Google-Smtp-Source: AA6agR60OAAtfsXDV3itXQ3Z2002FW7B7d+ZuM8wNa8H4qIfuEqhbSje4yMU9Zjpx4GJnQs423+8CQ==
X-Received: by 2002:a17:90a:4a04:b0:1f2:583c:3de5 with SMTP id
 e4-20020a17090a4a0400b001f2583c3de5mr8227498pjh.67.1659712462118; 
 Fri, 05 Aug 2022 08:14:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 65-20020a621744000000b0052d36feb7fcsm3086721pfx.198.2022.08.05.08.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:14:21 -0700 (PDT)
Message-ID: <ef86ec72-41a7-97bb-4cc3-8bdff9368cbb@linaro.org>
Date: Fri, 5 Aug 2022 08:14:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 v2 5/5] target/loongarch: Update gdb_set_fpu() and
 gdb_get_fpu()
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220805033523.1416837-1-gaosong@loongson.cn>
 <20220805033523.1416837-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805033523.1416837-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 8/4/22 20:35, Song Gao wrote:
> GDB LoongArch fpu use fcc register,  update gdb_set_fpu() and gdb_get_fpu() to match it.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   linux-user/loongarch64/signal.c | 24 ++---------------------
>   target/loongarch/gdbstub.c      | 34 ++++++++++++++++++++++++++-------
>   target/loongarch/internals.h    |  3 +++
>   3 files changed, 32 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

