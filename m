Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55848411A60
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:48:03 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMSU-0001g9-L5
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMGV-0001W1-C7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:35:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMGT-0005fd-Qg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:35:35 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso15658839pjj.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ge8H2Jt3QFQCwtBf/0ZZrrVxn4z2hz7dBWf3LWFj+Mo=;
 b=ue3U+FlBr4N3lRImDVa8pzf5jlfCmO6n8NdSyFcRNJzm0H7jFp3fdF+CrsrRzHvRKN
 BIWbZq6HriaVIxRqrol+myaVwgLh6VU0Pts21G2xF1jv/vx5F80LJVVm3xuFIZD10tH8
 cFkHM3QtaJORgLge+xFAmRtTWZOdfFZ0TCpTGKeZ5xWY1R4fWjGrWMnFO4tOzjWgCDFK
 VNkMyzPvdKCCbV7Wutbim95iuQ5jvynOof9UEVq0kfUKN150A2ABsAtmN0qAaEhtRsWY
 i/XnPjzjQJ4i4yd2vjr8vUN5Ef3W8ZsJCICS1zH0S5UmFqeys3sA+p4qcw8jxQgYoAtf
 +ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ge8H2Jt3QFQCwtBf/0ZZrrVxn4z2hz7dBWf3LWFj+Mo=;
 b=O8dmuK82isFU1R8Ln1VTdHGry0C6WBoNkkNAJcOzk0ilKOkrm8VWes8/t8fejT5Ud3
 2KiXsKi8lRD/Mq3656boveELKOXf0jJ+BPB7Hr2N76MVEUH+As7i+G0ZCY7J5AsgHBGr
 2O4tGrcste5KVzlXE1OlM0TxebFXlYRn/sWx40IAcFo0DzgsXrEXTObFUeE2OfM37Ypn
 t6gzKj2v6k2BczeU7Wdm1lORY/hHdEgczIeEf14PNdOa/DikxkwJpMPe2mR2bW7j+ZpC
 PBVsII+gcbHoGV7uVBSgyN44NvBd/kwjt3xibW8l2mve644HIeCauU6Sd1PmkKOPhU93
 pdkQ==
X-Gm-Message-State: AOAM533ORyLNOY3IovWW9ue9Wa4Kh8PSTl1a+bqlyTr08qb/JBUj2Lal
 UXLAs2dDk+S/xtS9mv9jgKVDaM6tQjjHaQ==
X-Google-Smtp-Source: ABdhPJyNOXuRjqkWczCIZpU/1ToCJ/b+c8yL+o11tUL8jD2JJMa3TZh3vVxS7qYDC6MFQTM+By3Gow==
X-Received: by 2002:a17:90b:2344:: with SMTP id
 ms4mr39256336pjb.3.1632155732495; 
 Mon, 20 Sep 2021 09:35:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g12sm5798pja.28.2021.09.20.09.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:35:32 -0700 (PDT)
Subject: Re: [PATCH 22/30] tcg/loongarch: Implement simple load/store ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-23-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6138a6e-a422-fb94-3b5e-aa224c9bd6e8@linaro.org>
Date: Mon, 20 Sep 2021 09:35:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-23-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target-con-set.h |   1 +
>   tcg/loongarch/tcg-target.c.inc     | 131 +++++++++++++++++++++++++++++
>   2 files changed, 132 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

