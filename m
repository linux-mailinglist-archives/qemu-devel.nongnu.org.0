Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE98339F9B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:47:12 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8M3-0003fr-Li
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8KR-0002pq-4n
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:45:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8KP-0008VZ-R5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:45:30 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so17664967wmy.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEwHIzNVeIghZLQb4bC13zr4s8opX/mcgGjF9IHv3WE=;
 b=umW3bq25Nj81jMB9ykMRWVY1YlY+33ckSZv5zE/AGhK8y3oWBdke7TNk7pMMaQv7I9
 7gwdCjR7jqFJ3S2q5RMDD0rBcU+G5BwjPUXfGcjFx6roQ9cJ1ndDwcNO+xrI3nxNAEIw
 5ITxYIoxqeJbgNX3WALzmlAaX4fCkF5HnvnL5KcZ3vjjmo797n17u4bbynR2TLB/RS/w
 OogtMjylFP3/ZQTFWOUdL/1i/L5GBmxOkX2ascoQGiicuMI9d+wxjW96ZLSNjLFHjJtj
 VHfLxf2dc0nqA7MhVJ8AxPEN0tsdxf+6qIXQD6Geyly1JP8pwjhT/p0owDXrplnPN0bM
 baUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEwHIzNVeIghZLQb4bC13zr4s8opX/mcgGjF9IHv3WE=;
 b=ZIYxUW3MJLob3zbz/c3ftniGCyHTZFuy2EYzRbhERLHoTWdQbx/Gsbr3pcVvu3TSY+
 hP9gGlNvinEcAr6huHlCt0/j8/Eymor1W4oMjZ7c9mFamM4DzsFebtXd3MEPw9oABCoR
 mS3oJWd2h2ymBEz79bvZFGu3F7I4JP+G49GUNxNgzENLTIs0/fzSLY8E1HtPrgI4dXgW
 OMICl3yayxg9lFStJ9YBci6yIIWshEMSbQhtl1v62cYsNA886j37kBSSCaDfEbfDfnKW
 5RC5qU09E2O25CUZgjjtAdhI8kXaD/qmkMZeanO3T2WQrW+lP+sik61CU11I87wHDMXO
 H3MA==
X-Gm-Message-State: AOAM530G8v13ywBDeOnoIVgJ4u8Jv6xI2f2lP0thygBtzNhZ469gylrm
 M1AC2ES/OOutU2pc43oqyFU=
X-Google-Smtp-Source: ABdhPJzeoy/nipHWLp7oTjmZ5XYIvfjXts3B53f3mebCTA807wsjLg7OCAL8AhXKA5AOPMVwRz/ExA==
X-Received: by 2002:a1c:28c1:: with SMTP id
 o184mr17949828wmo.183.1615657528193; 
 Sat, 13 Mar 2021 09:45:28 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n6sm15024409wrw.63.2021.03.13.09.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:45:27 -0800 (PST)
Subject: Re: [PATCH 14/26] accel/tcg: Pass down max_cpus to tcg_init
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eee32091-bc2d-5a78-332d-c7c1a4a1b2cb@amsat.org>
Date: Sat, 13 Mar 2021 18:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> Start removing the include of hw/boards.h from tcg/.
> Pass down the max_cpus value from tcg_init_machine,
> where we have the MachineState already.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h   |  2 +-
>  tcg/internal.h      |  2 +-
>  accel/tcg/tcg-all.c | 10 +++++++++-
>  tcg/region.c        | 32 +++++++++++---------------------
>  tcg/tcg.c           | 10 ++++------
>  5 files changed, 26 insertions(+), 30 deletions(-)

Nice cleanup.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

