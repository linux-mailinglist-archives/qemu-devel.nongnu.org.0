Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2105C056C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:43:50 +0200 (CEST)
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3lF-000103-Kb
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3gH-0005DJ-5Y
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:38:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3gF-0006wj-Hj
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:38:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id b75so6646388pfb.7
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=wjdr9qF+caAjwURuMh2JxbjJHbSWs1wlwPT805YV3rc=;
 b=i1AQlOCA4wkOgp6JLxI7Ib3aoh3/X/sCcLdlUfUEaYmTzEFQG7g0bESsjgX7wJXRrN
 aV9W/a8+5yL8zmfbKBrbXv4PSy3IfJVlDszCv/JBn/AcBJf/fWrgbRWiD4ZZotItwOUT
 CwPsqehPayarVua1zum1pss91QCyYiasxfaQyYcU/+EtzlYdDEwpJZDFkTmCMFHs6K1x
 8EF8BxNBxGsUuBugo2z23mG7d8kVhVCeVjvrm5VkZe/mbSePk9pwe+54I8rVNqnwcpYf
 y78Q62TEuBMBAFWIJ2hiPFEwmCXfgNfLnFGaDG2SgcMLgdec6HQxFs+9BzlNC3iDWUly
 qXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=wjdr9qF+caAjwURuMh2JxbjJHbSWs1wlwPT805YV3rc=;
 b=tPYWHPkHjorMSzr85jNjENc5sJ8inUoGZOt6WgO9m5zhO30NLTplG0BEHDXuVWslyA
 z+caArvUfQnDevNAnHtJyuZ2nRmo769T9c84phi6NV23Vd6HaKJUGTr0W6s7uY6OyeUG
 rOT83pZXzhcPnO7LJuWmHpUaLhpwl2xd8aWXViUAT1bqN6g41WQ6z712zg1RVmV3t3C4
 3V0Cnahpbsp63M9yhnqzpboa4KGU6zmxZn9YpIRucrMGYwSIXFLZM2Q+8pHOP98Rf1lT
 DkehuTlRPxQ74LFzUJXhuZzt8yFZFf78l7nXPGUA0f0kS9UqlimbHX1sL3GpMyH35XSJ
 yp4g==
X-Gm-Message-State: ACrzQf1zh85KBUVZ5gBjt/c3SCsQIhMX0hFY7vsQ7AAZgZ9Kzfw10etX
 C3SLxRCtMImZckr4ITYEa1sj5BiWz3A=
X-Google-Smtp-Source: AMsMyM6GPrYUb/ElhX3jTmOQ51JhycBkDmrvI6XgfeUtupTZPJlHX7/445+EUaUwBG3l3w/Cbu7toA==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr24641405pgs.502.1663781918051; 
 Wed, 21 Sep 2022 10:38:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902e84b00b0016d1b70872asm2367103plg.134.2022.09.21.10.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:38:37 -0700 (PDT)
Message-ID: <720625a5-2ff5-d451-58a4-e22cff678dd7@amsat.org>
Date: Wed, 21 Sep 2022 19:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 09/10] contrib/plugins: reset skip when matching in
 execlog
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-10-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/9/22 18:08, Alex Bennée wrote:
> The purpose of the matches was to only track the execution of
> instructions we care about. Without resetting skip to the value at the
> start of the block we end up dumping all instructions after the match
> with the consequent load on the instrumentation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Alexandre Iooss <erdnaxe@crans.org>
> ---
>   contrib/plugins/execlog.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

