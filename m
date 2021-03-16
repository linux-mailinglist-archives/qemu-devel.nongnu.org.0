Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288333E219
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:29:14 +0100 (CET)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJ7h-0008IP-ET
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ6V-0007X5-By
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:27:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ6U-0005iM-4b
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:27:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k8so8283444wrc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=TwvsXIONL0mD5324HiKZddIkoArJg95eAExvh+rZZ342tEiMXdivQbUGMixRfzO2Nq
 gkXhVCDSxHkzXDgPXeaspwLQbtqEWoFnOQCORbfUDtleZUH5TXtUYNHb8ADsT+mc8GKw
 3SArUeEvqwW/SDXZ0nFd0KTlMBPvO1o1Co7yAnSHmrUrrXd0xDmydwzqmVRFkKaWJwSR
 GUkAftbDRfYkthkfG/lrsPMmf28RTtJsPtXJXBcNRtQdf0ytMw/XmurK3uI1ENTVtW9/
 7SFJ6w4P0DdSYnBrCF60VBeJqqwgvgNdg5zsBarPR6+Pbxy7bg00hFwMScmrhOJ4yLcH
 hZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8XQmFINXjY+Rf09bPwsimI/ESsroTxnO6BJnDShlZo=;
 b=AWiNhTadq5rLqCfZXL5CN+WwVXYqbkMCY65jcNWFn/LlUv8FKBAJUMEKv+oMPyDA5g
 QxYvJ3DxH3OX3Qin3veSCVU/7GfL9xA+Qb1Zz6SRBAiiunQa8M+Ffs4+da34vev+1QyG
 lRd/75cJD7ZqxZnHnl3471c80jo/EDtP/mvYBEwnzMbxfXTdqGadnmDIXVjAX5/KcjaO
 rE3CwtrJeTCYoljRu6mu9EACDMPyV+FEHecr+X42H0oHFYcG3tpQmT52nMX81HjrRvCN
 XuqZMI4uSOWKmFOcKzxfxb4XcUQo4iUd7KlqGH9MZoE3g6CTRIrpYh6KvklV1OwucP82
 4Sew==
X-Gm-Message-State: AOAM533TypwWNpAUI1VXkGybG+pZLCIQ/LWMAz+KzRVXvwsSvVIe0Rbr
 9707ExHvQd7FbUnSkyxXwjM=
X-Google-Smtp-Source: ABdhPJykTg4XId5e2xeoEBomKWEXDlYK2WXgJ1HpNV0fU5H54hibXwrTLQ0PShJsN5ePEcxcVz2YkA==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr1320765wrn.59.1615937276922;
 Tue, 16 Mar 2021 16:27:56 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm31037771wrd.9.2021.03.16.16.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:27:56 -0700 (PDT)
Subject: Re: [PATCH v5 32/57] tcg/tci: Split out tcg_out_op_rrrc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c0a96544-420e-c01d-931d-adae57c6e41d@amsat.org>
Date: Wed, 17 Mar 2021 00:27:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

