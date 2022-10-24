Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6D60AED2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:16:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyQl-00005s-UI; Mon, 24 Oct 2022 10:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyQk-00005e-1Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyQh-0006RG-Vy
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id j15so6007406wrq.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=of9ECKmtCKjZiL62g3dUdYEcbcjed199k6Drou/j+aA=;
 b=O/vsSMrcHyJ60/R0qrJDcziBFU+0lJn2837Ma2VYPoJXV7o33gJ4rnevDaJOqgRR2F
 63RSNsjXTN1aj2JB/isMBbn9Ac+UjtzEC7rq4BQ9vFocgAzcgug3Qu7OEou/NKTGl8Q3
 oOl4/gcYly0+C/Hw4ymdTzW2HovrfXFFgGL3B4Tk1vj33dqT40scSlRm8HQtt5PavLWG
 cxc1N3ImrZdsxP7UyOotTO4W/E2j0uZT7K/FHwmgm5ZBW/Ak61NZcPIjBxBzqv1OVUpC
 tI25cKui+WxQNcHA5LQMv0Tnr3k2omw7AN2m0ID68upRfOn2A00M+jnZg2rWsWuIezLa
 KVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=of9ECKmtCKjZiL62g3dUdYEcbcjed199k6Drou/j+aA=;
 b=cKNW5Qy5VRZnVGLCZ1SJos+Io1+tMYtIv/GMsKI1u3wnGhZsO88fMRAw4YR78Om9R7
 HJc61FoizRbil3AHEuyHt9KJCax/g7eb2KL6Rxyc5r/gzJ9GAWAJ8eYOTPQyMLUzjwF6
 SxPyOHG0nTLYmA91fM3Dx4grpEhyOMMS7wlx3sVkLd12luns9UxM3Ft8YCc+iI7y5PNt
 SV+LKZmo1M4a3q7iYkKqnXkIcPDzgLvHe7ytJGNYg9yWr3ZW4EUpxdpI9CGyCKROytXk
 C9U9Cdo21xWc0gRu+mwHvw02pcMeWyQBQvnhKWhmgLog7LUUOM5ByHW0VpTynCqcdyNH
 ojDQ==
X-Gm-Message-State: ACrzQf2HjnzVBsWjFBSxgh1QGMxiJhaf+87qVnnE991QuadgFHUT8fYB
 qcXzP74QpLJhgJl43KdmvLKTng==
X-Google-Smtp-Source: AMsMyM5zAriiBTl/YHzodAhXydI5K+Jog95AeJWKsZlGlFyF/4+CSSPExUtKPATJfPgum+y9NjRPjg==
X-Received: by 2002:a05:6000:1d82:b0:22c:ae77:c8dc with SMTP id
 bk2-20020a0560001d8200b0022cae77c8dcmr22342487wrb.413.1666621670535; 
 Mon, 24 Oct 2022 07:27:50 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bq11-20020a5d5a0b000000b002366d1cc198sm4377998wrb.41.2022.10.24.07.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:27:50 -0700 (PDT)
Message-ID: <a6ff4b1d-4b62-0e6f-a49d-40fb469cd008@linaro.org>
Date: Mon, 24 Oct 2022 16:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 06/29] target/hexagon: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/cpu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


