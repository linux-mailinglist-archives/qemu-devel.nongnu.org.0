Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2750ED32
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 02:07:46 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8k5-0007lh-3g
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 20:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj8iY-00074F-RS
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 20:06:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj8iW-0003A3-3T
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 20:06:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so755562pjn.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 17:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4edOecocKA9IyE06HTL+44+gp53Qmas0E39fHk4iqPM=;
 b=hVml7plgTk5ShdQgsZb08fBjNBZXRR27XN8SoDHXCGR7ZDsKeGvCufsWr5+cRaDxzB
 m4TX+Ex0coDouP1fnEiM57MhiB9rnH0hXaCZuzELUWsxoQ8uGSiFwXKt+B8PiH4nhZtN
 GrRqE6PcfHAq2VXdh+lncFBwinodwwNCX/F2Ohb8SgvEA5yGaLDq2JjcDKBLjcr1i2Qc
 VHwxd3oS+r/u3v5lLqv7ev/zQ78Ch0sbgFDrkQ4krVGufk/XrtPVT9k4JrByMexSLid6
 1Cd2H0EX7aR5zVfakCVzcdJyfLzWTSzIM2EGViyDstkuyJTdo6JePfn682pTePOxdgfc
 79tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4edOecocKA9IyE06HTL+44+gp53Qmas0E39fHk4iqPM=;
 b=S0bf8vsB3nWeVsC9p+SEEXwzrcQXNK6dDtmE8VK3cQlh0d0BOg/ou1KDN4LHOTiGDh
 GY/7/BoX7R4hfdl8w0SXU/BFYfz671bXwJKAc2+/ImyOL1aQA4k70CgODyVtmSrehoiW
 rBZW8/fAk8vqrupfsTYQOXNXdJVJEXmxZswDjFxv8o4S7cmYtR0AQoWX+vNt1Fqquc8t
 qYdS6tFOLhdItjU2tH2Xo+vIzaXpoDuX/2tVNi2BToH9EFXMn7g7BDEld/rRAD58Ac8E
 uhWzO03ueehFF0srNQeKPlWvoLp2RmlaEgaMeFEGjsvY275ofRO406OZw3ZiEjeFsXSb
 w5dA==
X-Gm-Message-State: AOAM531FBJEnbiMm1R1p9qGGLYJHYLNAOFCXNWv/0eMuVaHIFr1N9T6H
 vBMoUnf9vrkaSg2E9fev/QJKTw==
X-Google-Smtp-Source: ABdhPJxoWm1pfu3EKr6fy+RHqmnxMDMUeuq9xfbeGtCYbRr0Ee4oDjlBFRB6eZo4/1f3ogXWGYHCew==
X-Received: by 2002:a17:902:ea53:b0:15b:1bb8:ac9e with SMTP id
 r19-20020a170902ea5300b0015b1bb8ac9emr19992202plg.45.1650931566287; 
 Mon, 25 Apr 2022 17:06:06 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x123-20020a628681000000b0050d4614a535sm3509935pfd.170.2022.04.25.17.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 17:06:05 -0700 (PDT)
Message-ID: <628c4138-1638-ef54-c292-64f4cb8a1353@linaro.org>
Date: Mon, 25 Apr 2022 17:06:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 29/43] target/loongarch: Add timer related instructions
 support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-30-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-30-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> This includes:
> -RDTIME{L/H}.W
> -RDTIME.D
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                      |  3 ++
>   target/loongarch/helper.h                     |  2 ++
>   target/loongarch/insn_trans/trans_extra.c.inc | 33 +++++++++++++++++++
>   target/loongarch/insns.decode                 |  3 ++
>   target/loongarch/op_helper.c                  | 13 ++++++++
>   target/loongarch/translate.c                  |  2 ++
>   6 files changed, 56 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

