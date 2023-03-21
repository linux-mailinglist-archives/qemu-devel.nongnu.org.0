Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DDA6C35ED
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 16:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pee5D-00060k-KL; Tue, 21 Mar 2023 11:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pee5B-00060S-It
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:39:29 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pee59-0005fZ-U8
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 11:39:29 -0400
Received: by mail-pf1-x42e.google.com with SMTP id l14so9240191pfc.11
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679413166;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gej+4s2eovQNr8Nc5XlyXHxSga8R3noNqlUoW4pnmq4=;
 b=gCWqEeORb1McO7N0Hcs5YOjvtrEFH7LQXLjq1WH0MDFOg9JX967gU2kKQeyywD6Y0r
 2BxxcQ4qtDd1nUIrY/VoywDChZoJaox7CkAtnq5y8Pt1gWTzsfoHaKLm9kN84pyBJz4F
 WzqX0SgyNdQLIj5a+zjc0IQV75WKICXtbQAK7ORJ7KXr4QAwIC8zTcWjtePGw7fpj3A2
 8PAox0pJTfRoAKkOT1J/72eB4q5SZjOqoRe/pOBD9r9FboVPezATZjCk0D3FREqcANM1
 aXJmiW8nEHmEP0h3z5IRzIkADiv96aRQOG7gM3NulZUMMeENXKzAHmgBX2bRVjOCi3+8
 pqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679413166;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gej+4s2eovQNr8Nc5XlyXHxSga8R3noNqlUoW4pnmq4=;
 b=z/eqX/sNNoXIV0Y7TE/64+VuybgTLG8eDDrErHd5wej/bZGuEyeJnQ1KuUWXtKukc/
 zW8lKGqmB0Oy0BJ6hBfzp5cQybECve/oS3gg2zeZNTXo2dw18O9Zdwkb7jC497FOOkWO
 /jzMv2inNPMDCY8xzmiJv04R+G4efMkuVDNPvLyiWml5OOBYtX2SLYOrqsK97ALE/Sy/
 VuAWLmvfk4mm6YZ+OZUPqVlof5/NF54AL8pWHhH4w3UwqUO6WAwBHfIIYbral8DwltH0
 QqJDvyj1dHK1JS8MahfMdnNfGlxMjyicM2emRwmCfLcgepciJCDnt7U8q2voeI2JOT4k
 gAAw==
X-Gm-Message-State: AO0yUKWHx8N4RbnNiGn+f6mukoG7N4PEaUy4uWRHbc68/y5BmNcOKM+5
 HS+JzKO8+mFMqJZj3/R9pYgRnVHNIkpNk9oTmpE=
X-Google-Smtp-Source: AK7set/6n36Hjf+RtO0y3+Y+Jolhsfse7Z67PFDKKKhg9CiDbeZ5ltE1j4jtjGOwO81XspzpjG7Iow==
X-Received: by 2002:a05:6a00:4c10:b0:594:1f1c:3d3a with SMTP id
 ea16-20020a056a004c1000b005941f1c3d3amr204619pfb.15.1679413166192; 
 Tue, 21 Mar 2023 08:39:26 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 22-20020aa79216000000b005fdf8c06320sm8638100pfo.175.2023.03.21.08.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:39:25 -0700 (PDT)
Message-ID: <4b133e2e-7e3c-1cbd-3f72-7fbda2c4399c@linaro.org>
Date: Tue, 21 Mar 2023 08:39:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tcg/tcg: Avoid TS_DEAD for basic block ending
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230321045340.838-1-zhiwei_liu@linux.alibaba.com>
 <6a240bc1-4321-9891-3291-1320a96d1310@linaro.org>
 <ee34a299-3b57-1f97-cc08-19cebfcc0c6e@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ee34a299-3b57-1f97-cc08-19cebfcc0c6e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 3/20/23 23:44, LIU Zhiwei wrote:
> 
> On 2023/3/21 14:06, Richard Henderson wrote:
>> On 3/20/23 21:53, LIU Zhiwei wrote:
>>> TS_DEAD means we will release the register allocated for this temporary. But
>>> at basic block ending, we can still use the allocted register.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>
>> Test case?
> 
> I have run an Ubuntu image after this patch. It can boot.

That's surprising.  I would have expected an assert with --enable-debug-tcg, but this 
appears to be an oversight in tcg_reg_alloc_bb_end.  We only validate the liveness data 
for TEMP_EBB and TEMP_CONST, but not TEMP_TB or TEMP_GLOBAL.

> But I can't find a direct test case.  Because the IRs supported with flags TCG_OPF_BB_END 
> do not have  input or output parameter, such as the set_label or br.

That's exactly why we want all GLOBAL and TB to be DEAD | MEM, so that they're saved back 
to their home slots and released from their registers.

The register allocator for TCG does not work across extended basic blocks.  Importantly, 
if you have a forward branch like so:


	g1 = func(a)
	brcond ..., L1

	stuff
	g2 = func(b)	
	g1 = g2
	discard g2

L1:

What value should g1->reg have at L1?  The allocator does not do the global control flow 
and allocation required to ensure that g1->reg is the same at the brcond and at the label.

Nominally, I would have expected one value for g1->reg at the branch, a different value 
for g2->reg in the second BB, and for the assignment to steal g2->reg and move it to 
g1->reg (per tcg_reg_alloc_mov of an IS_DEAD_ARG temp).  Which would result in an 
incorrect allocation at L1.

What are you attempting to do?  Is this just guesswork?


r~

