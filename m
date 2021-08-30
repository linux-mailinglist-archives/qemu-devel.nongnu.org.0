Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062143FBE8A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:50:51 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpB3-0001AD-Ne
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp7y-0008Ro-3x
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:47:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKp7r-0007zw-K4
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:47:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id i3so9731374wmq.3
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uIYP3CbymaNacXujYh22sr5Tmu2kEJ0ukIXLPBUms8I=;
 b=m9BRkSt4wNg+jupdplgTOwOE7T5e/ob/CH9p9QP6IkbjTbK15iHDinC7k7x2jiMHb5
 tI0k+IqZyrq1l/7UKXfynDnyor2tkri6YlagY43sjeTOydoSzZpkfpIeQzhbz7btKQQZ
 SQQzgGLfrwjDBo+L9X6aiwYCI2afmlJFU+Blsq4IBhvdYXHj62CIL1vI7Tv1eD8TkIAS
 WELcSUvf8UNbON9YgnOXf1oPM+22T+/Ky4G3G7ULx9SSWuBX8Z7NeIQD80p2DrHKuZWS
 JW1qYuTWlBS5ne9staLVtEp5lAHQh2qcQDz2fzr1GKdychFyP5uMyshWPO0tSiouDzCp
 ETaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uIYP3CbymaNacXujYh22sr5Tmu2kEJ0ukIXLPBUms8I=;
 b=uhNNjLiCqORCeT68FoB3AzA1xW8BeOLYrngZTpVthCFqtE4PfpGzsLnm3fX+gd3vLv
 qpueFDe7CnQi2LbGmpODA1lqquejQQ//FlCUGzU/bA9mr1BXGHjSvJNawLM/FEsXorRN
 nxwFW7Ks4pY6+poqAcmC+9Aq9IGT5TE28XvbM1WfYSE2fBuz2wk77faVOxbhw/I/ozC3
 YXqHnrieHus4iQdmgziCpXUi1BVXND3mvujPkL1iDlrq8WW8+KEPPytRv9ntIZi58JJ6
 MIkL07HSVMC0+3pFDflel+oX/5SFuYxFlbkClgLmldBi2DuOrYc+RIN8sdoMPgxOas59
 0gig==
X-Gm-Message-State: AOAM532kHBgMqaGonNqGtCf2SiBy8v8hxlyw0++sTlvuGIkT4XIf1vVR
 /RMFDugnIr2V950lpxTjUAeYl2+1jkQ=
X-Google-Smtp-Source: ABdhPJyBpC9jkGYrBxg/sv/XJq86NDJqaqFpmhhI+0ZSU6HXpd1Vb2OxVSu4nKF62motc0y3KdRmlA==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr985741wml.121.1630360049436; 
 Mon, 30 Aug 2021 14:47:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g138sm673768wmg.34.2021.08.30.14.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:47:28 -0700 (PDT)
Subject: Re: [PATCH 40/48] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-41-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <118b24a2-947c-dec7-1687-47b5ecc332ef@amsat.org>
Date: Mon, 30 Aug 2021 23:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Rename to fold_addsub2.
> Use Int128 to implement the wider operation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 64 +++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

