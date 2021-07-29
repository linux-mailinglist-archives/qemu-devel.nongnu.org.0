Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842743D9DB4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:35:17 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zdU-0004CK-Hc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbn-0002lX-Ft; Thu, 29 Jul 2021 02:33:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbl-0008Dv-49; Thu, 29 Jul 2021 02:33:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so582107wms.2; 
 Wed, 28 Jul 2021 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LKN4eh0LZYndKf8o2ne9FkuCnym3uDg+cV4f5+CEnW8=;
 b=aSOaAOU5wBRA6IZS6NXYlkK7WaTykWMFIeDa4M2Hdl+8khNFFI+OOzP+GpsjZzzbAS
 +1sWJtP0Z5huZoZ1/iV8xwtu7DiL5HlJUHGB4TT6cgtKevsCpPH1Xdo7Q5ERrLkWGJeq
 DBAQgrchrp8YKTwOboqin9elQzoBLYEdZdvyctKoftNm2L+yxqoEElB6KLFY5uV0xA90
 Bl7Gk0BGthYVotfbGwwgsuvoTObGinOCvtXjizlzVF+BOIu9as68PirqHQg2pkNPTFxX
 znrEcYXz3P+5VcEZqya0uun3i4prlShCmw7+Oq/tExx7IJaiTgUuUp/BeJrslTnqemlm
 k8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LKN4eh0LZYndKf8o2ne9FkuCnym3uDg+cV4f5+CEnW8=;
 b=U64ZZGgrG4kzIWQ8x1fkg6/Rnzh6cxNrVyxmYwKg79iB2erhBNVTYQtILinzHvOPqh
 0JVp7LV3tZ486iyHmj+fcTFZvg3FtHpc62m7siXoKO2lP4giwhvcaVgak/HktHU+b67f
 +ZOfoNilKx0HDKDPYOFjMPbHQUYEbiQj8y68uB/HNBBRYvo2QivszRvCRnHu9cQVD3sb
 VKIghgOS2qNILlIQjCBA6MAB63V7GG0rH2PTjruBCx4A/1modGEJGptFFUmrmK6v3lso
 94ot3y3TVQY/WjLknOuGuEAOZbxCduHVLMZslBBeT/wlwKD2gAY7BVVOE3GsAtFHi59X
 CDlw==
X-Gm-Message-State: AOAM530BcILUcpZot0TaQN4bBQ+SEiit3M/TtUvBsTDa9TLkXf0h3or3
 B9OChGX/x6XEkL/syIDP8nAM3oZ4uWTj8Q==
X-Google-Smtp-Source: ABdhPJxLVNrynsVL4V/3nxtaXu78cX3TKMD/qt86jDWBIjScAlgI0VO48o+/MmCTyYmQW7dGCQYCSw==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr12789453wmk.97.1627540406780; 
 Wed, 28 Jul 2021 23:33:26 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id v15sm8607981wmj.39.2021.07.28.23.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:33:26 -0700 (PDT)
Subject: Re: [PATCH for-6.2 30/43] target/s390x: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <573b81c7-15ca-df20-6702-7726c553eff9@amsat.org>
Date: Thu, 29 Jul 2021 08:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

