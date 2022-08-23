Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995859EE55
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:42:39 +0200 (CEST)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbfS-0006pq-5h
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbdW-0005Fy-8Z
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:40:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbdU-0006U3-2s
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:40:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id w13so8283897pgq.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YTp4DwPNd+Zw6/iLLv9xLa833uQ8Vjaz3Pg9cG/mACY=;
 b=UZx5Br/f0kT/rwv2erHoNODvdhIHD13qumeqqSx9hYE7EsxSOkamV0pjWwvl2/xC8w
 qjILnZv68u8C0iPluyVaRrl/EDUnbaPcaxCF62HKCLM/yjfRg+ms2zygByEpysS9aXjx
 ugdeA8lajhiWlAz83sFYBBb2KnJSQN0Z4eZya25GS7zIc5pc1YieC2r/LQHG4IEnbMKY
 voKu/sOMnI6lSKNZ1vaKph4bP9EoY11XGPVtSy0iase6UqxYa/bHDBoku3S7DtfJUFFc
 Hd4ytDUBLUG7bY81SaEYpQ4mfS+M+d8nWvHyuV7UQktl+fVUdsT7fdOkcTu90PzVnaQo
 5BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YTp4DwPNd+Zw6/iLLv9xLa833uQ8Vjaz3Pg9cG/mACY=;
 b=bAUR2jnJ76Cw3r0PLtpCgdcj4jlHt924S88d7i8kNyIm14h7boY+U6KIl39qNrSd+a
 YPY7qbTAAAjNLwBuiq0Yl7fLEaeslCmliwaKa9x1DrSrztxmj4rFmgXUTcE5o5Y1Cei1
 FzO3ZMRPerzjl0gk4liC+TjlytUk6NyuXGeoizIjNS02oRd474ivAfMBaJeBZTepJ6CC
 JgCnW1PQ693vdS6yMQ4jRcCbhmrCpoG3E3h18V6aIVzlA4IVSR8LaqjWFlThI35Lqix5
 JfvsUCpwDWFQv14gp0AQWaqOI49jhItZ1Qgz8Y2n3EsZIdltpnngTXhUFZo7llBKNPfz
 5MQQ==
X-Gm-Message-State: ACgBeo2j+Lv8rzLH8GsowxgscXtvFmsPsC7RIvlZCOyEmDU211XHp6/S
 uHyJkg///BHghqgID3TYa+KbpQ==
X-Google-Smtp-Source: AA6agR4KvG1A/NBDAuLvcx3TjrHINjTeTxDgv8n9hPpsQ3QVR6gqmujLyOZHOefxTFZuZqqApV4BfA==
X-Received: by 2002:a05:6a00:a8f:b0:530:3c05:4644 with SMTP id
 b15-20020a056a000a8f00b005303c054644mr27179506pfl.79.1661290834502; 
 Tue, 23 Aug 2022 14:40:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a17090ae4cd00b001fabcd994c1sm11824969pju.9.2022.08.23.14.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:40:33 -0700 (PDT)
Message-ID: <cc3bac11-3806-780b-70f1-9ea10c51fb64@linaro.org>
Date: Tue, 23 Aug 2022 14:40:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] target/arm: Add cortex-a35
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Joe Komlodi <komlodi@google.com>
References: <20220819002015.1663247-1-wuhaotsh@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819002015.1663247-1-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/18/22 17:20, Hao Wu wrote:
> Add cortex A35 core and enable it for virt board.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>
> ---
>   docs/system/arm/virt.rst |  1 +
>   hw/arm/virt.c            |  1 +
>   target/arm/cpu64.c       | 80 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 82 insertions(+)

Thanks, queued to target-arm.next.


r~

