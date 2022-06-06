Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867E53E5A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:10:56 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFJe-00021y-DK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyEkj-0004yJ-Hu
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:34:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyEkh-0002El-SN
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:34:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id j7so13092532pjn.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2pxUER877bksVDKxjipSeKyZNdFLyQt3sHDqnYAEJcg=;
 b=CPfR8sAJoKsd6sjMTjHCuOZvs0wLUKf4gWS7At4aCalOYlUx/G2v5iB/5PU1BgWE43
 eMhFAsC5DUldRaD1aWKsvHSN49WRTgxgC+0xhSjbcDn3PbSASRPl1q+wA/wRS5kVYkLI
 i4rckKJii7NOtxJZuTz29IwgNFlQKCZLNc5BEkVgg5xTxWy8Wp1SZGg1koUBCVgbmWDO
 CWS4Qu9I8bUN4X79uw32udZtMINRYaz6arRrDcHhFxVezIIzvju8pXmPHwRSPw2crbwG
 eZtCcFxgXpwhbdCVvqEG2EXm3eMcZPaIEzXYo9HW+/VtMjlpIX1+bVubkbifwBeDHV3N
 gC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2pxUER877bksVDKxjipSeKyZNdFLyQt3sHDqnYAEJcg=;
 b=PXbpy+7ekGCr1oOVGwKKnH0Ojl14wArO6Zmwdyq47M56y0p8bpnkAkkkbEGlC1L3ql
 WJCxg+U5skQ/uvQrYod5rIyy21D1T7/Dl0Y3wFBnOFZ5RHY2snt+66ChaPbDFDlcHe3Y
 BjYFzwpVtcllZ3AYDO4T7h8Ry1aYaeHrCGoDNY49GRtrODp1Z4hNABENL9lL7cCHenvv
 kA2AuMdp7/fqq70CvjFmQ3w/HZN0gN4I3XKDVM8IfGq75ia3e50CHmH8N3Itup1OGo9Q
 QyY9p7/CfhFm0ikEYYoQVkd2U7qckvrDicTY3IrJP3OC1pgcTii0qq8EQz0uB2lu9Weh
 Qmkw==
X-Gm-Message-State: AOAM5324HR4dYiHplf2PZ53CFl0s1b2eOObANqWpXQBzJdYoHHMm7BuT
 ZRPgfslcPukHmhAfIusfwXixyA==
X-Google-Smtp-Source: ABdhPJygLermdiSIN3TXZ4nagFbM8xB+2fe1Mah0TPd1xFNi+MJsAZuYlKjbpGh1cm5zvJFAM3GYBg==
X-Received: by 2002:a17:902:7c90:b0:167:8898:f82b with SMTP id
 y16-20020a1709027c9000b001678898f82bmr2788151pll.171.1654529686325; 
 Mon, 06 Jun 2022 08:34:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a17090302c500b00163506d51e7sm10766180plk.125.2022.06.06.08.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 08:34:45 -0700 (PDT)
Message-ID: <74a08158-79e5-98ac-2e9a-b7a1e31ed626@linaro.org>
Date: Mon, 6 Jun 2022 08:34:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, maobibo@loongson.cn
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
 <20220606124333.2060567-35-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220606124333.2060567-35-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 6/6/22 05:43, Xiaojuan Yang wrote:
> This patch realize the EIOINTC interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                    |   3 +
>   hw/intc/loongarch_extioi.c         | 312 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   hw/intc/trace-events               |   6 +
>   hw/loongarch/Kconfig               |   1 +
>   include/hw/intc/loongarch_extioi.h |  62 ++++++
>   6 files changed, 385 insertions(+)
>   create mode 100644 hw/intc/loongarch_extioi.c
>   create mode 100644 include/hw/intc/loongarch_extioi.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

