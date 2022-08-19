Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D55599D9B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 16:38:17 +0200 (CEST)
Received: from localhost ([::1]:36510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP38Y-00015y-NJ
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 10:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP379-00083v-Mt
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 10:36:47 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oP378-00056x-4S
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 10:36:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p9so3409684pfq.13
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=IIVTklJlOGXokAFr22MAaD031R6IglKOO9kkEJ3f220=;
 b=pTmuZYS4zNgrwj/F4pwSMYZR8lOauCyU+P+GrAikrkQBbUE2gUp7JE/44Cn9qdFIDw
 Q6DEoE6XrgGVelLm3BFPVXGC6GmGj7iEj8BGK2xUH2dqjhHxBlY6KMu6kEt92VTZXIBU
 HYWgWk9fnwd/jpGBXPqcs9jd7o2u3/DJ++HGzICpf5jMwbSTKpjzefya8lzvKU4FkFmN
 715UWEeoT9XS3E5qZkAm5rXt9hVNg6FZHBRymd4N/06pchL0C8TI0SKDHbqEQPzXi/vG
 OQv881H7wSyl32p9BGAXvt25INpz/XrPLYw6O8QuGSCtYcpgg6MI8bdryl0wfKsifDK+
 JowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=IIVTklJlOGXokAFr22MAaD031R6IglKOO9kkEJ3f220=;
 b=v7O3IFqZo1W7YYSaMVrLLUK9pGfnlGvWSIIJzUXw9TXrrsV3lQrTEAxuVY/U8EgSeL
 rwzp3lTSdq5ZRh7VTy0jJM+E+oWbOpNR7nvbYFR4yH6SPEEWpbh/0v/auwhYhizponkw
 fLHlVagOt80Sjqb04RAy2QXjM2ScpzLV4WJf7W+ce8Lwc93h9lKxkwWa3HBK15PohIPA
 UCcRlCoVEbEGNlcc81AzvaU4enDJcdxhJgfQCHd5np35j3l8lkrItSJkQXX+IGwULnf3
 B+g2lPTjqEeOXRSDOerHyeMzHXDu3BUQy8yoOrMTfjx85DmEJtjh19WDGjPkKu3tuGnt
 Sejg==
X-Gm-Message-State: ACgBeo0MRwlwoQBU6fZ5vClYdBX6d5lHlxosYHEX7q/NupwHEqDzMdcX
 cmetocRU8cPXTq9JpEyz27Hjrg==
X-Google-Smtp-Source: AA6agR7g0Gb8wT99Iz6U5Qkxf14XaGLWZlVFB+hEU6OP8lZlkzWZH8V+eAY/QDZHWEZ+Kgk2lwTiWA==
X-Received: by 2002:a63:c1f:0:b0:41a:9b73:a89e with SMTP id
 b31-20020a630c1f000000b0041a9b73a89emr6464183pgl.342.1660919804217; 
 Fri, 19 Aug 2022 07:36:44 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 li2-20020a17090b48c200b001f320faea95sm3321993pjb.2.2022.08.19.07.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 07:36:43 -0700 (PDT)
Message-ID: <d12b9a18-499a-dec8-8015-4ec0a4f4dcdf@linaro.org>
Date: Fri, 19 Aug 2022 07:36:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 1/3] linux-user: un-parent OBJECT(cpu) when closing thread
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-2-alex.bennee@linaro.org>
 <3402017d-7088-6902-61b8-4e61cea6db58@linaro.org> <87h7284ofo.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h7284ofo.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 8/19/22 01:37, Alex Bennée wrote:
>> This has caused a regression in arm/aarch64.
>>
>> We hard-code ARMCPRegInfo pointers into TranslationBlocks, for calling
>> into helper_{get,set}cp_reg{,64}.  So we have a race condition between
>> whichever cpu thread translates the code first (encoding the pointer),
>> and that cpu thread exiting, so that the next execution of the TB
>> references a freed data structure.
> 
> What is the test case that breaks this? I guess a multi-threaded
> sysregs.c would trigger it?

E.g. tests/tcg/aarch64-linux-user/signals.


r~

