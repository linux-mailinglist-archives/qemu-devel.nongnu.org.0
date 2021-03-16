Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B433E221
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:32:01 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJAO-0002Qj-K2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ85-00017b-1w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:29:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ83-0006XF-Ju
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:29:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id v15so11362954wrx.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pn5vZooAo2XW3GHmTAY5Dck4nDWAQELNm1Y0jyu8Bi8=;
 b=V5q0ef6U4JBfGTUrgB6k9r6O32zIC7fJF+JKtJh5pMDWn4yqpR0CskADMqKYrPdgBa
 X53hq5WL0+9B9Q5xuSr6ybCnLybcyc6OzfQBZ50EZSPkLxqGkVZr5PBqmbEHkA2SPNuC
 Y2/QNhCy2tYpupIRRHNkdd1vi3VhILh8RR/e1+jBmAnhS9tm2DGDZPQMgciUp//hEN5M
 PF8LDyZ2MI/yjZEbLfXG32nLy+7Ofj2yzhGtzAWPBJjyvlNwZwbG3BV+1HhT03sGgSs8
 WcgmGX8lTgCu/z1FuieIJPfUmLbLA26++m5Qe7T71jV+Ejw4UfMjL24vSl6DXuUEqq1P
 XOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pn5vZooAo2XW3GHmTAY5Dck4nDWAQELNm1Y0jyu8Bi8=;
 b=TdBDN88qnJmluasHPd5FBdLDekPbnEnBzD7HkIxT563etBLxK/lmRnDQo/Y060pK67
 eHPxubnw4TxMOBVM4Svr4xkSXJ2ioAxctsZuNhHlN273P//YNYVqUuPfrFbyAQIt1vW8
 LAIy1yiZSSMiUIKcDcBYteit1l8K/upocw6M0kgjAsXhIVC+t/eHtDCM5wudD07BevF7
 WnAI4y9cU/3gXlsV5MXh/KkqbmoxHH/5JIJbtYFFwVAPe1I0QcLarhb3bRlvUMqVfABx
 AsBZ3ASe92R1tMw6TV02y7YnIt3XU+9qLjQn3mxn7NIhb6J15dY6qOtIUbC3g5PF9OcI
 cybQ==
X-Gm-Message-State: AOAM533aJaz8v4k2OugCRCAh2d+W2C+LwPiJKa1D45xZ7QPEG3KrGsPQ
 zclpYXZnVJ+2NCPHqGOzqks=
X-Google-Smtp-Source: ABdhPJwjOJHHvi7/3uNzQtjQcOn1gI4He1TpLJQIwGSAnYVG6WBOBqrWXwKW5ZUYKkgJ1E6ktJzsug==
X-Received: by 2002:adf:f743:: with SMTP id z3mr1365369wrp.304.1615937374186; 
 Tue, 16 Mar 2021 16:29:34 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o7sm23463424wrs.16.2021.03.16.16.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:29:33 -0700 (PDT)
Subject: Re: [PATCH v5 34/57] tcg/tci: Split out tcg_out_op_rrrbb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <09643c09-21ff-ee99-2a26-04ebdb38adad@amsat.org>
Date: Wed, 17 Mar 2021 00:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
>  tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

