Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAD412965
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:26:13 +0200 (CEST)
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSfs-0002ar-GV
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSeR-00011K-Iz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:24:44 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSeN-0002KW-FW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:24:42 -0400
Received: by mail-pf1-x434.google.com with SMTP id 145so3759762pfz.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WaT1o33LKDgr1uXutGKGojwc2Gn5pwlQpQZzauQj8ow=;
 b=A8RPZJrMXjnXeojBMhlbvS0YntLh2FBe/RNEElMrpmEkPony61nMQ3eqcKXa0O7Psr
 RRI/uU7MQZaXhl7r2ztOg3cGVnwicZ9Mes/kQ20BAZbkXZ4qqfRwY/oiUIYKb6aqUaMm
 h0jV1ga6Y4SRq3I5+OMXCSal4yKGtUi82eqrUYz0v1Fxpk76OsC1FeEZPtron6GAYMHh
 bASLc6fQpdj6TmhHPTC+pu3Z1Hf3U79HUGt8SNIDKifSQ6TqNXwJSvLz+kSRTq3LC+MF
 8C5YabZs8H7Y72PD0a6P17kx53Dqi2zL4kwH1c5PadH8w/kQ4GTFi6ul+7ggj8yRshlV
 dVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaT1o33LKDgr1uXutGKGojwc2Gn5pwlQpQZzauQj8ow=;
 b=4N6cAuyUh88F9b87j1kJW0/Ya6Kig/pSp7LqgFtK3NjiDz8E7MctHKB+mSeSsK6Fiy
 T02K01RiN9rH/v/HiCpZEUSMRQYzCSRko+iGB96YlcJ/u4lGxMrxRMzFkVuY7RJ/nJxE
 COOK4/tYEHCJgc4BZ8pka5kB5ZRCHTA/lhsNRJvrQcvz3HpUMCX4o9urxSGZjc6q333e
 AuTpjiJ2hfOrYbZm6czA+MKliq7sFiJdZVgYsXxWee5dYrUXoQOFfS6Uc0QTHOW3u+Uu
 /uMZg8ZdjudTl4pkPdsZbI7TblEt0beHCTPKLbHLrxbxzykacod85n+qyNGb9WyavhCz
 Lj7Q==
X-Gm-Message-State: AOAM530UdURDuXvSU7wq1UwoBS0XVN1Kr9XFiYsQpeucXe/N/xGXc9//
 gCCTEiUQCE8Zx+qomIuVt4iBZg==
X-Google-Smtp-Source: ABdhPJyjMF0PvdEjzrM/Au63lmHloAa06qcfyz/lpCQ3nlUNlKcwJAXxFGOzhYcGeQbAIFOeoB70ow==
X-Received: by 2002:a62:7dd3:0:b0:438:a22:a49c with SMTP id
 y202-20020a627dd3000000b004380a22a49cmr27206077pfc.44.1632180277873; 
 Mon, 20 Sep 2021 16:24:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c12sm14441761pfc.161.2021.09.20.16.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:24:37 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] Hexagon HVX (target/hexagon) helper overrides -
 vector splat and abs
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-22-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3772500-0f92-f8b0-85d7-134d14f2a0ff@linaro.org>
Date: Mon, 20 Sep 2021 16:24:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-22-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

