Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3C69844A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:17:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNHR-0006sb-4U; Wed, 15 Feb 2023 14:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNHM-0006jl-96
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:20 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNHJ-0002bq-3N
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id i18so12829019pli.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tvgNYasYLOJgorSDLxgGXgiVicQIzHbLXfwc4gaBZZ4=;
 b=SnX+rW2PXhBo2HNFqFhGWS4WHgZHM519A/OOp1IZgYoaZ2/mwlEbyXaCZ/F4roFl62
 RW9cMTYo7IPM5QUUoWquvk/5Yx+D4+0ve3Mzs/nqgSJ7w92/ybkKEVzeTY7ElehNuaGu
 0FHN8T9hg+0KhhB2MNTO9ALxFnkBSXPJ+zT2XjO4M7UgPPIfNYAQPK/nTlN56/d28j69
 GgPr4YCJbd1mJ/2OpXBxF8UFM66tY6Uzbolf3mleYIbUIhpu3ChfVg7yhVNgiEnINYBz
 lUgTlV8M1uwT8NuLnpbWm0i2D7RKjUN5KUbDiN4oIueviDQFOwjNyqdHk39aUbIe014p
 0Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvgNYasYLOJgorSDLxgGXgiVicQIzHbLXfwc4gaBZZ4=;
 b=6GbTqColHu/lTFRwD+sPZvW5xdg8c4/3EsY9v/6RL2Ub3GDDq0VftsaZ5jCd6HVBoE
 hLePwso1cjNXcyapiV0gamNOyHGZpuIFt/Jk7/RGdF23o5pg2Es2AyKuVcMX5l0byGAv
 iuO2rfmis+HZWvcVIfBTFHqi7mXFv1MBUGNU+2NRTAl3Hn4hEgHhQ/UZ02Opb3qAH4R9
 CPqUokt7hmKY1CRSPzJtraZkbN6ufbgz00bUkmDd3RBX5vxcVjkeeij32++/A0Ai6vEx
 9XfXCKUhkcorSz9m8XmHcuE23O7/JLL3t0OL0lVU6nI5w35jfvmaMpP4crKByAY7bAzr
 Rwrg==
X-Gm-Message-State: AO0yUKWWYMbFu9bumuyRvcW0VF40hW1Sl3dw9kuv0jZkCoXVrPPKOjwW
 6J+1Ps0xDiRJJ6sCBSpaYw+zrQ==
X-Google-Smtp-Source: AK7set/5DBEWefJJiti6iAb9seiCL/n+idDz8n8Xoa4T35YZamqquoCl1uMwEwFQ8UlHMau2jqgXYw==
X-Received: by 2002:a17:902:f28d:b0:196:6577:5a96 with SMTP id
 k13-20020a170902f28d00b0019665775a96mr2774409plc.30.1676488635597; 
 Wed, 15 Feb 2023 11:17:15 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d2-20020a170902654200b0019919b7e5b1sm12467950pln.168.2023.02.15.11.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:17:14 -0800 (PST)
Message-ID: <e15614b5-267a-c465-c16c-d321808586bf@linaro.org>
Date: Wed, 15 Feb 2023 09:17:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 16/20] hw/ide/ioport: Remove unnecessary includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-17-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ioport.c | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

