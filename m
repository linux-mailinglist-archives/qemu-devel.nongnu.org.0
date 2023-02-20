Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426969D3F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:13:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBbC-0002Bs-O4; Mon, 20 Feb 2023 14:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBb6-0001rM-F9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:13:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBb5-0002Us-0S
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:13:12 -0500
Received: by mail-pl1-x62b.google.com with SMTP id ky4so3764793plb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fv+WXWs1tGpWUknosuFMIg9ONGApYw8WK069pmI4Md4=;
 b=c8U4DjwyGTalIST0IjSFKsRGCIWN/D8qGbQXW174J30PmcyWyzM6QO5Fez7yx/Swls
 qm5zkEnVnTFRlWZF7wJfFt0QDBEEqVZ850cN/EhyEHOikxXC4ks9h41Hn1zCgFUdboy8
 lgWL3yTEPOjSDb3hFBEiFefBN97MDbHAgXHxi3gga+xONRokJALrQ5AqlbVWg8YJG1ui
 99i34hxhGZKlVLgAtjoI4PRhYjF6wa5Z1SiEWCPfDGQvW4gXWUtTrk96uuw4nPmCYnZ0
 +wWNGWxmy3a7Vk0v0GRgA+BqJ7mUIliu/aB/s28O1iAFo7I/HsG7PfRYm430vnlQSq8I
 LnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv+WXWs1tGpWUknosuFMIg9ONGApYw8WK069pmI4Md4=;
 b=LIhV+4yclJN4oMOIjyEYfFT7U6h1ZryWabIFt4rq/MgU7Br6OBx4HkgFqqG/BS+Buq
 5UDeDsMsMDcTnvHRsaZj2CfNKl84EdvOAc/w3nWHIW5+5o68K8Y2tBRankZBLsB5EdRm
 r2GCN3yDIXtFdvw0f0sZLgzCcYKv6a5VRYANYq9BbYmWLRVfijeJUzOhmrcNBfkZUUzn
 Mc2N4DVAvz9jphRXVOflPPnZfcpb4NcftBri3k9vdx06E27ElndCQtNVklY9LRKw8mK5
 G8Grfn8G5lvcLREDwSrJhSfwVkb6oipKPWCcQCCues0LJfX/OrLekhwNxfhsSE4n+EJx
 VlXA==
X-Gm-Message-State: AO0yUKVS2b7qS0xOFSJApv0jVPCrHXWfr4yqLCHAsZmi6EMmXoDvNQQI
 KHX821BsMBhbg349CHpNg1S30w==
X-Google-Smtp-Source: AK7set9/uq9Ia2lehSeMDkW33Nzz908rYMqSzxaqbMc4EPruIlZnngzrQnIVFkJvugWrsVuHPIRV3w==
X-Received: by 2002:a17:902:d4c3:b0:19c:17d1:28a4 with SMTP id
 o3-20020a170902d4c300b0019c17d128a4mr2971939plg.67.1676920389422; 
 Mon, 20 Feb 2023 11:13:09 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 n21-20020a170902969500b0019607547f29sm2038657plp.304.2023.02.20.11.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:13:08 -0800 (PST)
Message-ID: <b1ac3529-318a-c716-fb10-d528d4d0ebf4@linaro.org>
Date: Mon, 20 Feb 2023 09:13:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/9] hw/usb/hcd-xhci-nec: Replace container_of() by
 NEC_XHCI() QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-xhci-nec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

