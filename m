Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79F6C331F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecHC-0005Fn-3S; Tue, 21 Mar 2023 09:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecH9-0005F2-Tu
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:43:43 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecH7-0004bf-6l
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:43:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id t5so23037495edd.7
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679406219;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVxG9K/eWEgwKFirVio54aExDEgcSpCl7i4KQkyq3Js=;
 b=JnGaJNrVbZ50rMyT2sZw7k9PiHYmy9p7UtVT5O55bn2Hmn2dsjO8auklvYhnTwgYqI
 rOlJYEa/PpxfOL1dTO3fX7gdAtM0Bwj/hwGVWO+XdzPvc26RtX09+IW57A2/leDGa5lx
 BL2lBWHID7J8yqoucu48BOWTFPuQ74QK68oIeFZzSatJZEVVaUrgJtktc4uWs+JepkHZ
 pGN33bQ3YhSzwsG2euKyCV5dLZZSTR6UtaFyCSN0S7cwbzKbs2w24CTShKk2ppbIsjOy
 SHuYAf+Sv9fdLAYsSSUga1zmY3ysWa1dKemCwxKK9bjXD0cMC8TR+uZDwKmGqpXqeRC4
 IhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406219;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVxG9K/eWEgwKFirVio54aExDEgcSpCl7i4KQkyq3Js=;
 b=zklIB2/QZnG/6CCTQY3Jx8luEvooF96ADf5gt9JyptBXvVZMmWYv13k3BHgjbDi2u0
 g7mSL+vpRqIuTFI/LWyRsgip2wRdsrz9lKTcd5lTVjK3EhrpDDKjFCB+j8XVDbiK9/rY
 k/8t+n8WC5PjNViSidjMAlLnNPVLu/CwCkw1VixSGDBPJ5LtbUcI9NnC+dn+ABJrOLqL
 V0lAahYW8XQ2prU8MecfkLKUFQ5u6quOm4SmENvvPbD9MGDR/cmtmqUsEKLvmn+PPl1z
 xIWjKvFIuPE0DLwrH3Qr/4VeFAT8aOZZX2h++XZj/oWp5EWG1fXHnU4IzD4YOBuaQBBE
 o6/Q==
X-Gm-Message-State: AO0yUKVGXXv08MAUXYC7FkWTyGaQkc2imrheik4Yey3/Xzo1AU+xdlac
 UayCOJoskeHA2C8PeaQAC0tw8Q==
X-Google-Smtp-Source: AK7set+zA4zRwj3Q8K/T420es7oO8Popjfsp8BFanqlec2JsCu0GwZMgKcGVcFjlCbR3xTQERZ7E6A==
X-Received: by 2002:aa7:d489:0:b0:4fd:2127:a8bc with SMTP id
 b9-20020aa7d489000000b004fd2127a8bcmr2967138edr.29.1679406219438; 
 Tue, 21 Mar 2023 06:43:39 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 gu12-20020a170906f28c00b008b17de9d1f2sm5954092ejb.15.2023.03.21.06.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:43:39 -0700 (PDT)
Message-ID: <1ee5b645-23db-e50a-e3bf-34f226bdbea9@linaro.org>
Date: Tue, 21 Mar 2023 14:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] hw/i2c: smbus_slave: Reset state on reset
Content-Language: en-US
To: Joe Komlodi <komlodi@google.com>, cminyard@mvista.com
Cc: qemu-devel@nongnu.org
References: <20230320221419.2225561-1-komlodi@google.com>
 <20230320221419.2225561-2-komlodi@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320221419.2225561-2-komlodi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/3/23 23:14, Joe Komlodi wrote:
> If a reset comes while the SMBus device is not in its idle state, it's
> possible for it to get confused on valid transactions post-reset.
> 
> Signed-off-by: Joe Komlodi <komlodi@google.com>
> ---
>   hw/i2c/smbus_slave.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


