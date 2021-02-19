Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49A31F33B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:07:12 +0100 (CET)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtKB-0002Pj-OT
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtIk-0001d0-Qp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:05:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtIi-0003wW-O8
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:05:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id r21so4824943wrr.9
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 16:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RThfRyKKEEKxl2oYBlN+woV09I6MfiVeNffGItUl8aU=;
 b=ta4BjZ+mdV9YlueO4E2JweBVVnS9cPZSNbgrlWcZjd97jZXRRCQycljEPZ1DggjSmT
 VTSVMMuQ9M/xMsu5o7/WFlygH2dvkO5a8a7ylVe7XRwLFvVJxdfykk9bak31fzpCWdFM
 MnTVdUO/fOslpPS3yt/FaA6gnpAxOAOJgyzGoE5gtjuigvM5h2kW6SBgCsqtAYgYgdHH
 uIdA2KiHRSvFN8WR50UXQNNdkPUzkajOhbZ5eTOM621erBNOXIvDICtznw2OA1HXAE4+
 I1UuQx6VoxDWIIafaCdKhyxQMBuQ/IuvmTTguMJE9gXV2e/dLGLyf2i2uZMkuOIQEYMx
 FdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RThfRyKKEEKxl2oYBlN+woV09I6MfiVeNffGItUl8aU=;
 b=VlSwLZDXfgvyk1jAYge0IHdMEzuqFVdhMDaHBSxDUug0QxABC8EmsiyKwZML4W/O3T
 WWf/gP8dejInCkBYeOFmqM6Cz8F1DyR3nLvkOYfdLuF2zHG54WHeGLNefDTeMiTVif6o
 RV4RvaCsHErCPhz1jFi+3nASXpeAU5CZUrz2EeqjMx/436idXlmUfITaQbfLbXeX6t4d
 zYU1LC6UozEExTnBmfcfxCvRSW643x0/0fGP4sc4hxhUCfGBc4aztNlm2iMWa5oScDi2
 GSqfp8VR3YhYRYE2t+HTGEC/XTp8yg8OYjGf3ATpHC5sBT2Tr2jNnt4IIc9mbEFewAX+
 TOBg==
X-Gm-Message-State: AOAM5301g1al0XMBXd5j5yq94J9Xeg0cJqruOpMHWP9DY7X4AALruQX8
 +YVXLiD9qzA2jDlomCd416c=
X-Google-Smtp-Source: ABdhPJxvAEFf81Y7OJPHOweb5JGtrOzeEBw12crGx29uCPNoFr08AN6ADxlGgd4XE9yOoqGLXOsFnw==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr6302198wrt.130.1613693139006; 
 Thu, 18 Feb 2021 16:05:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w8sm10913232wrm.21.2021.02.18.16.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 16:05:38 -0800 (PST)
Subject: Re: [PATCH v4 11/71] tcg/tci: Reduce use of tci_read_r64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c146f98a-c95d-8aa8-a310-29a7b5f6b8fb@amsat.org>
Date: Fri, 19 Feb 2021 01:05:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> In all cases restricted to 64-bit hosts, tcg_read_r is
> identical.  We retain the 64-bit symbol for the single
> case of INDEX_op_qemu_st_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 93 +++++++++++++++++++++++++------------------------------
>  1 file changed, 42 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

