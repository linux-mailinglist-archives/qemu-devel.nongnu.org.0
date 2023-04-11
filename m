Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAFB6DDA72
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCpO-00052p-0S; Tue, 11 Apr 2023 08:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCpD-0004xS-2n
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:10:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCpA-0004eg-OV
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:10:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso9214190wmr.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=X2aHfuFUQ3OHRp9J+pvvAEvoCeyOpNz48t9+ifhDaUwnCMbPs0tTQPnfQiw+a5vV4X
 8xlhczb4sCpPH7VVMjpf8dkGfvXrbbOJnFqk7vc+9F8ExEUDtEp1KWKNTf2gsPBbp/vU
 OsjqkacQgNLZ2Am7vPekislvDTXkZXo9XZvX66xm72YH2x31xHdqsW4OViE5q8g+UYI+
 xkIJctn5FpPWYiC4PuPvjfLKw5ddBoRHXwB1/g5AVgL+QnwAthyi6Aj6+LdFPBajEraE
 OuoNpqTF4NxsTEsC/k8msnKLI6UzB4yLQqwWzMMdwOfLJIAyeXeQ1ZskwFAw1dQpkRbs
 OOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=n0KP1SjCtXgXxtZ2LW4P1qqs8a5xrUYJTP2fnb4OwLysA5tRykcOoSme7zfi26z/Ew
 fX3OPJJlD3SQSGsDrgOT+qzydzA0ClkNIr/8b2OAo/4v3xXEW+h1V2Xw1hlWzy92BF3S
 Hq26IOo5HWYQAL/dEufKPj0k4KrUYTrwoToDZ55nLoi4IuPkAQN32h6PUyTb6Ezc0BIG
 aiyg6NQ9p2OcS0gOeu0WMD8YZzc2M7aciinqO34e0vTnl6GRqal+2YzvGONeG0Bi4naz
 eTJ0oRdPhrrX4RyPm1ce/gbBP1E3NZRmEs13P7khrDNQRkC0S5ZzPxO5o0F8BLBGrdCk
 /rhg==
X-Gm-Message-State: AAQBX9fnIuQQYDa6SAhcB++Dy5ih1xGgQX5koTGkN/r787+6m8iXp0RZ
 8xGgKhBeQo/qblSbeeQi4NIIiA==
X-Google-Smtp-Source: AKy350ZqXuVmeGzz3rVoYXlx3DPmZvDMn2pQRB7GAnvo59zjw353ixXcOvVgnjnOOxt+zRCM6AKMkQ==
X-Received: by 2002:a05:600c:299:b0:3ed:5d41:f998 with SMTP id
 25-20020a05600c029900b003ed5d41f998mr10262284wmk.15.1681215010419; 
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm20860047wmq.29.2023.04.11.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Message-ID: <9f598a28-da4b-14bb-c908-1f9a2861732a@linaro.org>
Date: Tue, 11 Apr 2023 14:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 19/42] tcg: Clear TCGLabelQemuLdst on allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-ldst.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


