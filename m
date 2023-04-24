Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A06EC592
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:53:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp6Y-0002AQ-Vg; Mon, 24 Apr 2023 01:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp3d-0005S7-Bc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:48:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp3b-0006KZ-Rm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:48:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so9391605e9.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315290; x=1684907290;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RtdZ0wcJYv3VlV0pRjw9fCMU9C8MDsVCiOHVHrkWsWs=;
 b=k4ljU00T1RJ4cOF1BV0QZ5XistQAyKrVUTfFHs7AaQryADdLasavG/WKffsKZc3Exp
 GpyQ32PMOrnUGWb1PpjMDUhyF8oqd9p33SYG8GpKRG89EuG84L6c+nRGmc7TwRs3/k6W
 F+5VOHeKHfvtDy1IpQE1hiSthNphMFMg9Ry0XFEN1OHDoCOuFf01NjTov70VpZxFxBlj
 ESksgt1dObYgUs7Ovf9pI6x1v2f1ZAKMCKttuGa7vpJqDRK387iFoehm4prMZhEgmg36
 nvBdRdtBuAQXonqhD6EonakA8gPAQFcMN0a8ByZ7uESC8aJir48Ji+IFLYSV4zpyrIK9
 /MZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315290; x=1684907290;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RtdZ0wcJYv3VlV0pRjw9fCMU9C8MDsVCiOHVHrkWsWs=;
 b=mCOeula9j0bKiwHpXeQLeRrsP/YN3QDJSSMe6roI4/i4cP+oGWXegmE6aOxZWcS5Yc
 Cy8BUkiDFp0JAG6BPydGsMeIbTgnLRQclw1JPV8rNG+z1ucNN3u1FkiVidYNlNinrA3s
 cJSlZ9YwixeONPynlyAhe+M0zCapkx+yBD5yKh8KpqOHPMNhaKaQyPx17qq2PkJU3Ffw
 9xDhUSqyPxngPO3dL8zBXcAV295leOYy83AhJClZONBRlRLO6SdRslzhGC8loz6A/CAw
 xH7EPfkS0GSiJAxg+falfFajncFjseBp5nsopypr9XwOY9xaYPDFyeBmky1f9K87gmBD
 7X2Q==
X-Gm-Message-State: AAQBX9dwwLyg1MFKmFJJQ2yjVLlijimiSorf8dlpddwSiqCNY9oGxhMa
 vjn06oVgRjE2x9ksqFBlVmgWeA==
X-Google-Smtp-Source: AKy350ZpDvHvVAsz8UMI+TvRrGGLItboAe215rFL8NEN6h94vzfSOEzT7WEtgCYKC2O4sI3j8MEzwg==
X-Received: by 2002:a7b:cd07:0:b0:3f1:9489:6deb with SMTP id
 f7-20020a7bcd07000000b003f194896debmr5940030wmj.20.1682315290500; 
 Sun, 23 Apr 2023 22:48:10 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 i40-20020a05600c4b2800b003ee6aa4e6a9sm14513568wmp.5.2023.04.23.22.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 22:48:10 -0700 (PDT)
Message-ID: <5a0d29ad-be05-56e4-7f2e-3feab825e642@linaro.org>
Date: Mon, 24 Apr 2023 06:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 03/44] target/loongarch: Add CHECK_SXE maccro for
 check LSX enable
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 09:06, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c                      |  2 ++
>   target/loongarch/cpu.h                      |  2 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 11 +++++++++++
>   3 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

