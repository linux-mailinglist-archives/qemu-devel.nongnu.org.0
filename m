Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6E560BE59
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:14:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6eA-000094-P6; Mon, 24 Oct 2022 19:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6e3-0007wU-Vh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:14:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6ds-0006sW-Aq
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:14:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id jo13so6119383plb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vn2wWGzyFDn1jdxz79GGqllNqthaJT+w9dQRkUISVS0=;
 b=nyIFEQOwR5Zu+MXNOAhdrUdPp9fNqBocRdN2S2Hy0N5AoqEkV2cbwriTo/QVRfj21K
 3lc6icFBZsJoaJFXHdoyFieHS8n+LtSKHiAGbADXALU9qlrP2cpOg3nUKDHvSthJjIo0
 Zo6ydm90aj1zGJr1XgByLenel7xvgnhQ4CnhBuLcqafBiEbXKI0NY3zdiu5AkBgO/iXe
 tA9R3NOKRmO5chcbXTZSunKlFXgWhTZPxmSGUwNt2dvwUYqG9cnqATVZCxdSNPWfk/2T
 ilZmvln3XZkLEqBT58apK3Bme6G7gCCiPNZwoLpzrbHQz9MuZdhSLPffcXHbGIqgkuXf
 i0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vn2wWGzyFDn1jdxz79GGqllNqthaJT+w9dQRkUISVS0=;
 b=UM9DRLrKWXkpfdQwhh9RZNQnMy+tzA9CwW2W/6ZLRi8lG6aqkVnq5cHdoDlxdzHTgo
 GVbuL/GBRZNEG53TXGsO2xqXhUcwHp96Zj+kvyjIoPee3PcIGkPFrNmnWi7fAsNbyJVn
 /o8C79Pa0Djx0b6zUCJJYH45j55vqoRJbfLHCIevTmAqSjuJwITnYO6XEkFGfgp1ovSX
 WQo5ZADI1vu4f3QI1nU/k477Elz6lLusQ+RLT9wOVBGWpGzARmqbC/CTlD3hoWSuy1Hl
 eE+ryYveZ4hxifyVzNBxLsgQeWuPxMpl1+7FAn2GdZgd4O1rQujc8Q7jHW9vp7tYtG2c
 bqpg==
X-Gm-Message-State: ACrzQf17AS8W/APz32/OeUBC32jQ4KGo9CRcVX/TpBz0JyBLmBU/a5CS
 SBsud4ucMGJM2KDG9eGoMprh6g==
X-Google-Smtp-Source: AMsMyM6Hx9cCZKqdJz0LvY1kQQ0MMfWmE/BayNT9wnuubcR/1QkRLFvKtZDZ01uBBxhcP7tB20Vsfg==
X-Received: by 2002:a17:90a:fa42:b0:212:f0d3:2ff4 with SMTP id
 dt2-20020a17090afa4200b00212f0d32ff4mr14036460pjb.104.1666653238160; 
 Mon, 24 Oct 2022 16:13:58 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a626005000000b00562677968aesm304098pfb.72.2022.10.24.16.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:13:57 -0700 (PDT)
Message-ID: <6174253f-8831-83eb-616f-72b8e04edaa8@linaro.org>
Date: Tue, 25 Oct 2022 09:13:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 04/11] io/channel-websock: Replace strlen(const_str) by
 sizeof(const_str) - 1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> The combined_key[... QIO_CHANNEL_WEBSOCK_GUID_LEN ...] array in
> qio_channel_websock_handshake_send_res_ok() expands to a call
> to strlen(QIO_CHANNEL_WEBSOCK_GUID), and the compiler doesn't
> realize the string is const, so consider combined_key[] being
> a variable-length array.
> 
> To remove the variable-length array, we provide it a hint to
> the compiler by using sizeof() - 1 instead of strlen().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   io/channel-websock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

