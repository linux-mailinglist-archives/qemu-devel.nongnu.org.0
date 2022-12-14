Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45064CD09
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Tcg-0007yy-0v; Wed, 14 Dec 2022 10:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Tcb-0007yH-8p
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:24:37 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5TcZ-0006tB-NM
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:24:36 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso1900914otl.13
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3DY8JTqNZf91c05M7+WZfeZeLbWpU19DuEVkMH9eV0A=;
 b=lhB1w8IT5e0EaKCKlYcJSHEzTv5byZ7hjupglpRXX4dNr7BxorimxTJp7E6iy6LNCF
 BE4i3I9klRRLpu4KRmobUVKHdkW32cNXmrnCZctVBKfTg97Ilg8PKfF3b2AEgY7oILib
 7WOxxtGUwf4z6ia0bgbqLxkY+BfH4TqIUwOPjrjSy7Ho1lU22MEM7dGdl0nGUfSDHEf3
 tgnYSaw92cgFIPXoOyylcKyy0y3Pxah37TX6kIwVbTWplR+LbLn5TffkOfW387nllvDu
 x0LAIPkRjBK2SXOSrQUUvV7cuu1FmNGHrrTwVcpiH2mg62uFlvHr0ilEHGGpV9b3Qu7Z
 snhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3DY8JTqNZf91c05M7+WZfeZeLbWpU19DuEVkMH9eV0A=;
 b=syEyOKX9ZgaJTlvoDIiUnpA/6W3rKfo8hX7ohwtWZ8s6J4QRgq7ZcU59Yz7RVUxEGW
 HMAM0bk0lfScFvzfS15lK8+4IEvkraQez8BL0TljLTjku35kpzZDwZJBLv8fXEy3JXXJ
 xSOS3MgWm64LTTEbf6wTJeoqUwxDZwJ8IzNcRM8LWwVB5h9e/hQKpinJgoF4DpNI8/PX
 N7VJAihldxjPGTNa3OJ301cALvRbHdyyGkdxH9AmmCJflxFrkgP7a4+wSoXdfoNtD7f4
 X7Bup3oyCz2pus1ZOOqpXJEnxGrS2P4XutMxI1G5CyWOSH0eNhBczbGNP5bg91k/8JOx
 p5DA==
X-Gm-Message-State: ANoB5pn5wFLYXkGfYooY5eCxL7ClpHY1Q8cOE1S5x/c+iaog6ccWpcTT
 64wVU6qLmPlVSrzoW2TylkdORQ==
X-Google-Smtp-Source: AA0mqf6n/36g11PFBA7UodKh5p+dbyw96nkLNEHKQ6Ei8EiDIK2licZwlCSlfGTLRBQDq9eNf+U4hw==
X-Received: by 2002:a9d:6e02:0:b0:670:5ae2:3e71 with SMTP id
 e2-20020a9d6e02000000b006705ae23e71mr14888609otr.37.1671031472551; 
 Wed, 14 Dec 2022 07:24:32 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:2f7e:778a:5d07:f03c?
 ([2806:102e:18:2efc:2f7e:778a:5d07:f03c])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a9d7c85000000b00670763270fcsm2439886otn.71.2022.12.14.07.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:24:32 -0800 (PST)
Message-ID: <6af3a197-e9b3-5474-5dad-cbb1d0a294b0@linaro.org>
Date: Wed, 14 Dec 2022 09:24:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] gdbstub: Have syscall_complete/[gs]et_reg to target
 agnostic typedefs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221214143659.62133-1-philmd@linaro.org>
 <0506350d-c999-9f99-6a55-da45f6949abf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0506350d-c999-9f99-6a55-da45f6949abf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

On 12/14/22 08:40, Philippe Mathieu-Daudé wrote:
> On 14/12/22 15:36, Philippe Mathieu-Daudé wrote:
>> Prototypes using gdb_syscall_complete_cb() or gdb_?et_reg_cb()
>> don't depend on "cpu.h", thus are not target-specific.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/gdbstub.h | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Subject should be:
> "gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs"

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

