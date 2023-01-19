Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2866740E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZc3-0004Dv-GF; Thu, 19 Jan 2023 13:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZc1-0004Dd-DT
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:26:09 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZbw-0002Kd-J4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:26:09 -0500
Received: by mail-pj1-x102d.google.com with SMTP id g10so790379pjb.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T275S6iMhVfCltfIXrqYgQw4JRtUAxG8ZhwXcQ65nLk=;
 b=eXkgfvBqtpscFey0gyZo0g25KWNnedRHFqdbYnMHjXOI4qEzVt/8bNLbV2fcIeVODs
 kQsbMwN9rIz0sfkwmB6j1f89HefOHCU9CekKxF7J5mUtYWnt7uizdVaqN3bZfl+TSa6Q
 7kf1LOv4Sc+j9jr/LxeygZOkCAQV2Lbi44WBMQeG+QebyFd4hFbUBpiJQsIiVBqLcemq
 E4fJZ5EvxxRdluKYwAHb2F25PImEvryeEbvWRJoWgHbjq3AOwpJzuMZraHQz4oXxGBhd
 tv8/BmhyVRhAAJux2mD5vVbtIzOB+GUIfoHj6plZdKN1Ggxg5GXCC4MDTpjyp1Hlmcky
 TQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T275S6iMhVfCltfIXrqYgQw4JRtUAxG8ZhwXcQ65nLk=;
 b=uUNBD+cUnAa4XUiJbCVnM+WVGeQ3VR4TzKasMSdHLy2aF2KC1E/cUbU2T+9fZO1jHj
 J1QmpFWrLOlc+boLNxw+SLeFAQHl5sHaoJLS4vIUWTZXhBEhJWd0xMMmH16B0ZQOY86H
 5B55oTVID9B6pJV8D2coEffY5SqbiHINK+u5TIsvG/d+oZINI2i31ohmwKslFKAjQjPp
 Tj8Fpdiwdgv5LRReyLnoHQfaRZnTEn5GKJzaRW4xhSbBhjhV2JY+Pj7ssF9GBz+mjBzB
 LimLP5oaWyJ/Ec5NRY5P6EQJZUOy/xyd2hBB83DURlxIwtvGYXHgs+4YbEuNkvFoVRkq
 QXSQ==
X-Gm-Message-State: AFqh2kqwUtjBGHuiN2OW6XXaYW2n6qwQUnoBE8KrulHpNsEwK0u3IX+B
 PAEELMPnVNLExvV1bJFA+Sw2zw==
X-Google-Smtp-Source: AMrXdXsOpSwnCN3syh7iFxcUxxLGEIX0pCyiivXjLROxBsh2aJCqhBu4HbI1ByCE3atUlTKKAgzN1g==
X-Received: by 2002:a17:902:7049:b0:194:c241:f604 with SMTP id
 h9-20020a170902704900b00194c241f604mr5643284plt.57.1674152763047; 
 Thu, 19 Jan 2023 10:26:03 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b3-20020a1709027e0300b0017f74cab9eesm971776plm.128.2023.01.19.10.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:26:02 -0800 (PST)
Message-ID: <87e834cb-fa19-2df3-aa04-42d23984788e@linaro.org>
Date: Thu, 19 Jan 2023 08:25:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/5] target/avr: fix avr features processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, philmd@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412017939.3110454.772171621078654245.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167412017939.3110454.772171621078654245.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/18/23 23:22, Pavel Dovgalyuk wrote:
> Bit vector for features has 64 bits. This patch fixes bit shifts in
> avr_feature and set_avr_feature functions to be 64-bit too.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Michael Rolnik<mrolnik@gmail.com>
> ---
>   target/avr/cpu.h |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

