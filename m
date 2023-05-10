Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27C6FE0B0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:44:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwl3L-0006e9-SR; Wed, 10 May 2023 10:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl3J-0006bY-TL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:44:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwl3I-0004vn-9r
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:44:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f315712406so250179005e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683729862; x=1686321862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cPBhGIjwi1sHxmJKbwxUPARbnHcHdZzCTW01NcW0QlU=;
 b=orr7r7beUxvCZooPhUnVT5nwTqNOt0vjVzn7Rp6OsXNbxz0QNxO+Rde3aYbtyef+d/
 G/MZaRnAuUJc4CuSGELixa3GDSwuyi7b888ZEVAptfwN3iCJfqnI+38cnu4CMCNngZQL
 E4ynR64ig8OlapIAI4W0cEEAdbay4JAkxpf8uobaw/5UJqsbNZfXoIELFyga2F2hxiLz
 afUCxg4OZDDphvi59RtZ20sZSIZi+2/XwxNyXIMw8zqSxa1lGU156dyWCGvj9FczAXz+
 +NLuSwF2q6LhjbgiWBsd22lv2Ob+ITrRDPv2nEQRlpKI+ttnAJVPeZ+7rQtB4jiMd5n0
 C+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729862; x=1686321862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPBhGIjwi1sHxmJKbwxUPARbnHcHdZzCTW01NcW0QlU=;
 b=FhJv6pteDsTtONHekCnDNSHWSvvE6WQJhsa6pdgfUvTxhGXOcXoMZKJ5X/whJNnI8B
 WYfaAFEbx9Bd/895pnMnAMT8XydHVNSNoDc40HtNjaHvE7k0J6kReeDmE1tF2UK7+rdi
 TzT1qaVhthK27wMmowVpZj5IMa8ITYt5+S49Zksu1SdkOho6FlE/Cbshm5msrKehLKiH
 g2Nsa+GLWfgoO8sTL8bI+/PlyGdmFxSxNABG3xWkSNOQcfC9yvcU6MG8IpI3iZlUPWgV
 muNfamrk6gn43Ni9K5HS2q/Q+M8uJBgF4e+0Wy0WbyvfLs6sv5w/dN5EAkSUSBKG3jQ6
 wuHw==
X-Gm-Message-State: AC+VfDz87Osyz21TFklfhe/17W6jskXMzyiuQbNMHbEmHyOa19Esj74J
 rLpCx/hz9TkvPQ0X6Ra/cI814g==
X-Google-Smtp-Source: ACHHUZ6A8rZQ7euGhcD7Mx6VDEx5cv3K9aa2qphTVIrmzwO1Fgr6XzXfZmEV5uglvt4XaJbQL5z54w==
X-Received: by 2002:a05:600c:540b:b0:3f1:6fb4:5645 with SMTP id
 he11-20020a05600c540b00b003f16fb45645mr13663936wmb.1.1683729862713; 
 Wed, 10 May 2023 07:44:22 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003f427687ba7sm8100926wmr.41.2023.05.10.07.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:44:22 -0700 (PDT)
Message-ID: <606079a0-66cc-1e70-e648-ebe453cdf368@linaro.org>
Date: Wed, 10 May 2023 16:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 12/16] target/sh4: Remove TARGET_ALIGNED_ONLY
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230502160846.1289975-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 2/5/23 18:08, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/sh4-linux-user.mak   | 1 -
>   configs/targets/sh4-softmmu.mak      | 1 -
>   configs/targets/sh4eb-linux-user.mak | 1 -
>   configs/targets/sh4eb-softmmu.mak    | 1 -
>   4 files changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


