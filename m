Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7573D9EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:40:39 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90ek-00069p-A9
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90dl-0004oU-GN; Thu, 29 Jul 2021 03:39:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90dj-00037N-Pl; Thu, 29 Jul 2021 03:39:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id z4so5643269wrv.11;
 Thu, 29 Jul 2021 00:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S13GllLJzPMKocpczAE18k/MtGBcKqWPu1wh+vfeF7o=;
 b=TKg5ydGlWnnkXj2a2V4cSUU25t5v+c/W1P2DSBSmfXzCtOcTA9jmBw2FGVx3P/T9nS
 lB3Zqz9vY8ExDQ6CuCOENxduQQHLGIztsKgS9w/hXLA2QjrBvYCP1mc1R+oIV/y4kZkq
 ESXbLHovU1Uzeriw7GZfM5NbQBpuja0EuAQSiMaYGCpPJEQCalF4mFYOHnSNJA7BloB4
 NDFyX65wEPO6MXv2EpWwt2jZOXHfiACoeCRGnSu6qOmO8Q9K93+Onjqj1oged5Szq09D
 LTkMCJgPvhb4W4NDRiIUSyNsFnzCn+x91OWSW7/0uo48+/kc1jZyZ1rAIQQoAVkLrdD9
 Thpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S13GllLJzPMKocpczAE18k/MtGBcKqWPu1wh+vfeF7o=;
 b=MYF33xMdQAYCntbw/8FunGBmxVSn3ZhmzvWtzfQPqwI/diA1e2ELHm1L+Z6cnfVIb2
 /xTah/6r+LdKMeG8TxsPey6CAVWRNIwbfbXGgUkyKShV7p/MycGKdVH0/K35/kt3UkUG
 m4GmZ/SNPyFx+SPh1DFLdVUhp3ba1OrjWOs96GcPRj91jFdCJ+7tLICKaq4wh3fVrVxi
 qUhl6BpJoDsBczlA6QrxHISslx5PduPxPqJ6dXRKmqsci0GQl3q4tBzezEkzKrA9GN8D
 sIprs86PAjMqc4LOOmgf43HZIVMjfcwG9eZ8PTx6738HG7+nWwiP9uScDQn5CMqIm+3o
 FV/A==
X-Gm-Message-State: AOAM533JCAYGF4lPCgJLGf5x2UTYLFlivNdyG6N7lVQrVdEp4vw3oFLr
 Bhlm+MLgBS0z8qOjCe2OLx0gsIa5rxTZTw==
X-Google-Smtp-Source: ABdhPJzoRpYNSVX4CNtJXqOfRk3n7pJIUi+wsL91CgZpbDetuja43V1yFpbev0P9GHOWPZRCDAcyQA==
X-Received: by 2002:a5d:6891:: with SMTP id h17mr3153006wru.324.1627544373869; 
 Thu, 29 Jul 2021 00:39:33 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id x16sm2352904wru.40.2021.07.29.00.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:39:33 -0700 (PDT)
Subject: Re: [PATCH for-6.2 36/43] target/s390x: Use cpu_*_mmu instead of
 helper_*_mmu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3bacce4c-fee2-7ed0-2702-3dc31b8ed672@amsat.org>
Date: Thu, 29 Jul 2021 09:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
> The helper_*_mmu functions were the only thing available
> when this code was written.  This could have been adjusted
> when we added cpu_*_mmuidx_ra, but now we can most easily
> use the newest set of interfaces.
> 
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/mem_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

