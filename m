Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E326E2670
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:08:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnL1K-0002F3-NN; Fri, 14 Apr 2023 11:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL1I-0002ER-EB
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:07:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnL1G-0003MW-U8
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:07:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so17903345wmb.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681484841; x=1684076841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NL1rZ8DSBNDOvEqjjuDCZGuPFcTULC9IJPmcZh1Oa0M=;
 b=xibEvzTxjUQk09LRXuXlfy1BL26JLqr1U/3UlxagQGAHTBNhEh+kMWltiDfmSI0uwE
 4sUV+eaA3eSwFCoG4A2IMNUG+ml5DSE9twsiVNECW07T5mOYhg+AUD+dG0+iQgsSRsR1
 1peUxB8Z4xcSlxNSWkZ4N6t8wMN1yqDpTD7i9D7O3Qag3Va8KB2c0h5V0fAFgkdIt+T1
 KoUdlnlM4dhAv58BDmlyQxgKXUS8MKAxIM5xxVlWoyg/JUNW0wTMlD6AYtSsqnUcBDiV
 g+HAdAnx/1lt608npnztBytO53LgF0CbVIDd1ekrs+ndLl5taamTXL0wIFyE/9xbXRhc
 eCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484841; x=1684076841;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NL1rZ8DSBNDOvEqjjuDCZGuPFcTULC9IJPmcZh1Oa0M=;
 b=DSVXEJmU+jZCiZDyZFBTnbCzH/Wjp9evD6dx231bQ2YhWOojzwYicBqBS094tY/TlQ
 6W/qO7pijjGOaiLfe77JnE+Epu5M+9o7JWs4+dpT4hP5IKe/CzOI+SCNl0a/SkiolnY7
 SsNS3HvKC6FCBK5DD9Nmhr85POJBgViBLgHwl9PJRr0+6USx33SCcKqFjyqopZ2Ts7C4
 PHnfvc48MqlUnxz35Da/BGzmiDu15EZw5l18lTmLuX28hxYGx/+aSOSigrIvuioyzAXL
 +6F2UwNp1wC9F27pflcYs3Eeju5swSCVhN2uvQgusva0n9Pqw/fRKnr55Q65Cc2uPUnk
 O8mw==
X-Gm-Message-State: AAQBX9djE7Ts3SPs5ODyLKXHC/FcMl4O96DTCZLF6QG3ilxFYNZtSoGV
 TxaqwH3i0sJQzV2DsxNZxfFrLA==
X-Google-Smtp-Source: AKy350YW0ttwCCbWehPzVIPlZvPxLufgBbCwlRP9F0zhDZ8WM3a3QwVOP4Ms0TVhdDeqUcRnIiVsWw==
X-Received: by 2002:a1c:7408:0:b0:3f0:b1c9:25d4 with SMTP id
 p8-20020a1c7408000000b003f0b1c925d4mr1649098wmc.21.1681484841371; 
 Fri, 14 Apr 2023 08:07:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003f149715cb6sm958857wmj.10.2023.04.14.08.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:07:21 -0700 (PDT)
Message-ID: <899d3c74-d171-19b4-d54f-2cb4fa1edafa@linaro.org>
Date: Fri, 14 Apr 2023 17:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 17/40] igb: Always log status after building rx metadata
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-18-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-18-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Without this change, the status flags may not be traced e.g. if checksum
> offloading is disabled.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb_core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 5fdc8bc42d..ccc5a626b4 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1303,9 +1303,8 @@ igb_build_rx_metadata(IGBCore *core,
>           trace_e1000e_rx_metadata_l4_cso_disabled();
>       }
>   
> -    trace_e1000e_rx_metadata_status_flags(*status_flags);
> -
>   func_exit:
> +    trace_e1000e_rx_metadata_status_flags(*status_flags);
>       *status_flags = cpu_to_le32(*status_flags);
>   }
>   

So igb_build_rx_metadata() is very similar to
e1000e_build_rx_metadata()...

