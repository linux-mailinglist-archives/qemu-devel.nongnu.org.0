Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A235E44AD14
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:05:25 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkPsS-0004kB-Qj
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:05:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPpk-0003HV-LJ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:02:37 -0500
Received: from [2a00:1450:4864:20::430] (port=40474
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkPpj-0000B7-85
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:02:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id r8so32452473wra.7
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 04:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HUGAoUSiht4QRf+afFt8KJVmsPuMd9N1Ag5ZQaLGeO4=;
 b=c3v7hbmLMZoiC8v2vAyCZ535vGunZPtXaslxV6HTJxdAX4aJf5GVyIsCJUCNbV2kxx
 NB+koIt9HbwAvqNWt137O8QyKQUoDK+IcvcWv9z+AQXKd0mp83uXRTR2uSATF5mBAyJr
 O+p0Gbl/hJw9z3caUlmG0uDA9DyYRNo94zKl5WYgmL47KS2dU14eenHNnvcz8oL2OHFX
 1PhgkqHwYi0lBVvo8+AQOY1UYbrce013MfRPIU11FolBLEVGKYzAU6ySfpVylkA6Npar
 wNLQu3Opuy2Pd/2mlbByw+e7iGwqVtd0BuzYsbeIO+AcwQjiwAIVxX3R8YsuZSdXeyma
 7dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HUGAoUSiht4QRf+afFt8KJVmsPuMd9N1Ag5ZQaLGeO4=;
 b=TY6A29G0l9sQly2cFORW3Vq0u1fRoEDCH7cYjbVopTKiKG+dXgRA5noRdqrw+TVo0n
 +LL6tcQo7pUzSi+KrVbwA7j1nz+pgG9yRXCqQHJCgujvGSgvjbEOXe4mO6jS6MsN3IoO
 yVY2964MgOAZ6WU/niaDe/9eiiGEWd+GihUHdKB3Q5gEl9+Al8xaIzfhyS2ianBlZmM7
 FkvYuVqv/uwKYmpvtv/auI7giqMm9m/OlqFPsoOhPBU1zxnsevskcyc369Pa3Jkgbkq8
 kbb0HUGUHuDchXvWfiSBiSWaF8BUoPfnd2m0LbzSf/P+ecbCNwflYzehZjOZKwMjdw4U
 JK7w==
X-Gm-Message-State: AOAM533rHKmyFpCosOhMSjUXqBaWlBmjq/vKu53q2w/4aAaGa5EwdIDL
 puP/ghgX8SBcu+bHVnA+LL1xjC2dYSjgUKwdG1Q=
X-Google-Smtp-Source: ABdhPJzxtGBn+jNx0SBlb6/up98af2+VT0P58/iZGvmuO77S/rKdV1T1n5LomjLRlWXxaK7/2rNcwg==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr8520046wrq.44.1636459352857; 
 Tue, 09 Nov 2021 04:02:32 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id o25sm2390243wms.17.2021.11.09.04.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 04:02:32 -0800 (PST)
Subject: Re: [RESEND PATCH v9 16/28] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
 <1636340895-5255-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4dc04be-191e-6a89-a955-ade95eb2174b@linaro.org>
Date: Tue, 9 Nov 2021 13:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636340895-5255-17-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 4:08 AM, Song Gao wrote:
> This patch adds support for disassembling via option '-d in_asm'.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

BTW, I did not ack this patch.

I had acked a previous patch in which you imported some other disassembler from elsewhere. 
  This is not that patch.


r~

