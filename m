Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2D418D30
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 02:02:22 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUe69-0005VG-GY
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 20:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe3c-0004VD-Qq
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:59:44 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mUe3b-0003dk-BR
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 19:59:44 -0400
Received: by mail-qk1-x72e.google.com with SMTP id d207so35263027qkg.0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 16:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uI+/roqNAY9v/lPmJqfFFmEQ7sUJhUuE2r0Dk7w1XLA=;
 b=DI14w9coohxa8DsPjBa08pYcVydgdcEkpeZp4huGC1HmM3DZqGvYy4ZPLfq8MEew+N
 CwyVF3UAsbf1NojMLBY/e0IFrMstC56Yfvp+DKDQDIez4O1Biobl2RwRkUNsQdW2pd+i
 eDDcuA+fx9UQGT3Qdevu/RwOmyQx4W4I8eVyqgt5cNixfnSl1liid5sVK9F4XYeMKAHz
 hssTN7Jiqn9ckkIW+IvJshLVxd+uZGS6CfTKzRn7HpVKEfPvdKXaB4dk/DrYcUh++VKm
 thCPaQPYRoe+3p9WKj9zCrMZyUpBBFEr7hu7u7aj6RpP/zolUytPsyyG1CZ9OvEMlydM
 8W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uI+/roqNAY9v/lPmJqfFFmEQ7sUJhUuE2r0Dk7w1XLA=;
 b=OZR/4p6NdE+xhyH0HKBp300FxCV6UKxpIg/Md+W0iDn/Sd1w+mSexL56zoxSyHD8cz
 ATJOu8unBAWwi9ws8KD6fFVdeLQx/ypVPkCgTUQQOzllhzTIO06H3l6k/i2Ulw0EBORl
 rBvBOf2T3CQHVN2Z2W0MN+t9vBPlw6QOxaY4jLaiMlYnUjxkzW3LCDP8K0EYi5QyIYz6
 s8U2k+5zY3PVvXujm9wlkT9FHvT+nnYb+FUPAuZpIYQq4v+5fsPLcUCHnyHNuGdY5S/R
 2dm06pTdpkMruWXyPvlRUGcbiSOPznW92DGj2vbxPtW8Fu4v9gKTucHAkQMvjWIh9n68
 /Clg==
X-Gm-Message-State: AOAM531v3kmJTV4RpoE7lEQL2qrrX1FcDjevDt7DEj7ig3WGyN6oPjmT
 P3haLgEFzWV8/CS2oQRDiYFPZ4innoPX4A==
X-Google-Smtp-Source: ABdhPJxTNZk/QIrKqsSMJbe39nBT4J9K0zufuHjIFVk3DJuNEQkrrKMRN5yan4+oGlSwVKLFwTcjpg==
X-Received: by 2002:a37:341:: with SMTP id 62mr21304072qkd.300.1632700782198; 
 Sun, 26 Sep 2021 16:59:42 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id f13sm10049978qto.63.2021.09.26.16.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 16:59:41 -0700 (PDT)
Subject: Re: [PATCH v8 05/40] accel: Introduce AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d78bbcc-1f53-6f5a-05e0-500f6d37902c@linaro.org>
Date: Sun, 26 Sep 2021 19:59:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 6:26 PM, Philippe Mathieu-Daudé wrote:
> Introduce an accelerator-specific has_work() handler.
> Eventually call it from cpu_has_work().
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/accel-ops.h | 5 +++++
>   softmmu/cpus.c             | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

