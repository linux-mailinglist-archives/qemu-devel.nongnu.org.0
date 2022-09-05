Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16A5AD1AE
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:41:59 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAUI-0005e0-AB
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9xY-0001b9-0D
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:08:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9xW-000583-8H
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:08:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso7618216wmc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xSBv0V4ceL/D3E9y3Z4F9CocM4Dd0Jjf5oH0xth0sxM=;
 b=KoEwn9yXmh6f604ooNXtsXc8bFFaW0pVdo/fY3lmcXH50dBY0zYsPJUkO7Et8YxpBk
 33XKFvhokKLmMST6/3EtotgBar0XBV9DxhZ2mj6MEVzUP6l4mP6h7FsWnIa8hiQZDLF2
 xVqHTmR3j+21T+BByB5O4mX37Wdg4xlxJ54YMPxt4tl11A/UdO2SfkDzKUU6dhdjHybh
 cBcNHYGH2NcNn/t0ZrKT4MKtp5B16ngVVNi1I4ZdrIlUfVowo7nhDCs1hlbbmIDZzC4E
 W3Ydw2sXr0bGSbhu718P+ERbdGhnETI3cPUJTj+y8FYAK0Ud9jxE1Tw8JLJqSz8i3qvM
 T0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xSBv0V4ceL/D3E9y3Z4F9CocM4Dd0Jjf5oH0xth0sxM=;
 b=SyNl+r4jPo3P85/rkOpy2HwwESBF3Jzx9/owL6faKWyvIKF0ACqytv0mFA8xcaKAhs
 pT/m2H6Goke+7dHiNRVeES3bIp8B0/o5kiPrw83DKBcLHEH9Sp+sZJUhGjrP3s6CBNgU
 nsZzTAYT9mNHgthOmzbQk9+g+Z2pWwj7LLAbtnoBI/OwSXYCtSZAPigOC09ehENC0i+c
 mmGiv3TSYJ+i0ATKaHzD0YgFdmr4jbSmND9tbgM3EJPg9/jb6ob0D/gPJWom7Lyo1TlC
 4k2vl07AdOaTsilPjvBNx4UGXzmkMbDw4EbCkoUSmJBH0zmwqLzC/YSHdRyFC2IymUFM
 glWQ==
X-Gm-Message-State: ACgBeo1x3YfcW6V/GO7DQHkAWKczGNTx95QNuTG2jOhwqdh1oC0sZmcm
 lEhDcFz+I9zsUTyWv5Rix1tQBw==
X-Google-Smtp-Source: AA6agR5q1QqwDSBGPX4jdCHBLWkDXrDrdL5ZYWfirCE95jkx3CP//gt32Cm8hFr14bJig6YDeC+5Ow==
X-Received: by 2002:a05:600c:1546:b0:3a6:a99:aa7 with SMTP id
 f6-20020a05600c154600b003a60a990aa7mr9888677wmg.109.1662376084751; 
 Mon, 05 Sep 2022 04:08:04 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 n9-20020adffe09000000b00226f2ab6e2asm8615360wrr.68.2022.09.05.04.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:08:04 -0700 (PDT)
Message-ID: <cf1a8dc2-a832-cc06-32b4-6573386f28d0@linaro.org>
Date: Mon, 5 Sep 2022 12:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/20] disas/nanomips: Remove disasm methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-7-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-7-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> NMD class methods with the disassembly_function type like
> NMD::ABS_D, NMD::ABS_S, etc. are removed from the class. They're now
> declared global static functions. Therefore, typedef of the function
> pointer, disassembly_function is defined outside of the class.
> 
> Now that disassembly_function type functions are not part of the NMD
> class we can't access them using the this pointer. Thus, the use of
> the this pointer has been deleted.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   disas/nanomips.cpp | 2546 ++++++++++++++++++++++----------------------
>   disas/nanomips.h   |  642 +----------
>   2 files changed, 1275 insertions(+), 1913 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

