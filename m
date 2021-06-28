Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91E3B67D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:40:41 +0200 (CEST)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvFQ-0000pS-Lp
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvD5-0007ru-6K
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:38:15 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxvD2-00013j-5z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:38:14 -0400
Received: by mail-pf1-x435.google.com with SMTP id d12so7056996pfj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iQCXj19JJpLq0zkZXuw6mb7LWL46DWKXo3whe4d2RQQ=;
 b=FjqAy990BK+E+hXuKch7VCmvpgf2lSvULwLbh83hh9w1ckUKiDA3E+EepkFGuC4kpY
 PXLgJ2Jq+tww6inf+4XTiHQEJSmrtIl7w6jVnsQ23pvVSf0j+eX+qzRTSIo1e9loQ4QI
 bJ5bYpCet8EXLBFBhYhrneRFpVWkQeis5hpLc+Ay1RV49MuF96HxWzSwzKCWLcfTs9OX
 yCekZEXhse5XfBHbnOp5689bVxzyRyuK/tmIyVtyGg7xNb5a8QvO3zxTHQEANg7yE8/Z
 TOrB3jCXMYqFFKcr9FIc+ktMs9Y0w1Or4DSG3d0A4hwZgJBzL1VpaG9SkKhtpdiUBEc0
 iK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQCXj19JJpLq0zkZXuw6mb7LWL46DWKXo3whe4d2RQQ=;
 b=nzLyxSWVlyNqtm/OL8AOpk70NvSFdksuO/10p6cxnEsg3KeAW4oxEg4tFNZspAOgOR
 EpRsFZh+66t9Dmz6C+3cmbaKzROILkCUD4cK6XVdetDrRYgBSxVxIsuAxE5op9oEP2wL
 flm6xjcYLs9lcR0WqS2sd6zE35x8aJ59TEkWHGA6yieczyRybrnQOAFnVmRt9jh2lDhl
 XHAlkLGtBY4BriCxZv8t3rAr+7x9KJP4aaIfdIE8MTl5Or3CrDVsgQuODNUmPrZUzT9O
 N5BeZMXaxYtpqrfqBu6RlZGHUxylZbNS7KlSHC0xemd4sJnh2gkjRM4QWC6k/jCNoJdR
 LbTQ==
X-Gm-Message-State: AOAM530HPJtqCOcNo4JgGCCbSo3cSfiNyUErNagOxJyDpBPLyExD9G7v
 36WqoiomQJxnluVGA2xrPz+Jf6PVtoOuzw==
X-Google-Smtp-Source: ABdhPJy4FwxboG448Wh2+iY0zD+/8qmwNmO3heF53syxvvuS93aSunI4NPLZhNHbsqXb+pGRN7gVNg==
X-Received: by 2002:a62:bd05:0:b029:30a:dc6:88b7 with SMTP id
 a5-20020a62bd050000b029030a0dc688b7mr15465941pff.51.1624901890630; 
 Mon, 28 Jun 2021 10:38:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm15604544pgh.34.2021.06.28.10.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:38:10 -0700 (PDT)
Subject: Re: [PATCH 17/18] target/arm: Implement MVE shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1e88871-0c55-8ee4-4f1d-6aa11b6d52dd@linaro.org>
Date: Mon, 28 Jun 2021 10:38:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> +  UQSHL_ri       1110101 0010 1 .... 0 ... 1111 .. 00 1111    @mve_sh_ri
> +  URSHR_ri       1110101 0010 1 .... 0 ... 1111 .. 01 1111    @mve_sh_ri
> +  SRSHR_ri       1110101 0010 1 .... 0 ... 1111 .. 10 1111    @mve_sh_ri
> +  SQSHL_ri       1110101 0010 1 .... 0 ... 1111 .. 11 1111    @mve_sh_ri

Again with the [].

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

