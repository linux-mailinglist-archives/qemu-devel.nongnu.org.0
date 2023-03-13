Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8E6B81DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboA1-0006xk-2c; Mon, 13 Mar 2023 15:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbo9z-0006xV-F7
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:48:43 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbo9x-0002fx-Jx
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 15:48:42 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 32-20020a9d0323000000b0069426a71d79so7288241otv.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678736920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pz2uueUBACXMqWuZlpIgrQQ0BC3ocKBqHIVNDVqZhpY=;
 b=tRvly6eSmqxJgjJj3Qp8Nv7TZYOPXleq9skDKSP8h9/gAgkO2x6lAWop5zr91x9kKU
 3D9p/rSuJUE6lWsMzFHIjh8Mp2JL5a9DXKGbVjsRLumvdIzmqNscvXjal/sNWXQn2I49
 Fbv41RPggrBlILPXGRvY4/I4Bi9WmDxXbC7NFcpa8Pdg86gUX5PCQ5/vJAgMIH2Ssq+V
 kzaO9aXF+AO+HYvaiQ6w+UDPCXqiTRzac3K2V7oOyhlo5fO2p4WT+iQhrfwFRrZ8gRCk
 gFggtU3pd5TORyrG5c+u1Een+Y0HoBarx4XGFoUqXJV9uErQNzWDST/uNJF3EM0a9rk5
 U8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678736920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pz2uueUBACXMqWuZlpIgrQQ0BC3ocKBqHIVNDVqZhpY=;
 b=wUMiz4QwxrwBaNgFi4fs5Cu84vWmy5uSjXgOC/dOAyriSHanZ4d4aWP55BVAsmXRzk
 0ufuHHmGvPx83q1a+k4qFyMntwKphKaqgaetdnzW67tbQCIueC9FnoK2s/AM9kcuVIsx
 S3pJB/9/C5+sGZqHK8ht0hlYsppJSUHlJdoCCiO0sMA/gNcG1Ov5ZCepkSrje/wu+LM0
 DjrGwttETokpGn/xtxoGq4FCCcNXffCoRsojtPYE2tPyLDCUlJLKkUX40RILpT6PJOks
 aKWyrrWN3dcoc/rabOia1ZQf3U8Mjd8jOKHucX87gTlWX2cxT810GtN0Ohgjx+bd954+
 J9JQ==
X-Gm-Message-State: AO0yUKUNV0M1+r3GI+oaClnYz+x7k/oBsfVsjGS3d6u41ACixBprlKNo
 CC2Ent6m6nJe8qhnQ++q+uPbWg==
X-Google-Smtp-Source: AK7set93bQUoC4OuKfUjmny0vQhEUZnFeUE11hdHPP3492inZ0TtHuZ930xSQNtz2l9ubae9OCx2dg==
X-Received: by 2002:a05:6830:3141:b0:693:c3bb:863f with SMTP id
 c1-20020a056830314100b00693c3bb863fmr18941472ots.36.1678736919988; 
 Mon, 13 Mar 2023 12:48:39 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a9d4783000000b0068bc48c61a5sm356614otf.19.2023.03.13.12.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 12:48:39 -0700 (PDT)
Message-ID: <cd714314-d1cf-675b-0678-98e19ec4edee@linaro.org>
Date: Mon, 13 Mar 2023 12:48:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] MAINTAINERS: Mark the Nios II CPU as orphan
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>
References: <20230313183352.274744-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313183352.274744-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/13/23 11:33, Thomas Huth wrote:
> Marek and Chris haven't been active for Nios II since years
> (the last time seems to have been in 2017), and we've got
> unhandled severe Nios II bug tickets in the bug tracker since
> a long time, so to avoid wrong expectations of people who are
> looking at the MAINTAINERS file, it's maybe best to mark the
> Nios II entry as orphan nowadays.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   Suggested by Richard here:
>   https://lore.kernel.org/qemu-devel/cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org/
>   
>   And bugs like this sound like the linux-user target is in a bad shape, too:
>   https://gitlab.com/qemu-project/qemu/-/issues/261
> 
>   See also:
>   https://bugs.launchpad.net/qemu/+bug/1791796 (comment 3)
> 
>   ... nobody tried to fix nios2 linux-user in years, maybe we should
>   deprecate it?
> 
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 95c957d587..9780430626 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -257,9 +257,9 @@ F: docs/system/cpu-models-mips.rst.inc
>   F: tests/tcg/mips/
>   
>   NiosII TCG CPUs
> -M: Chris Wulff <crwulff@gmail.com>
> -M: Marek Vasut <marex@denx.de>
> -S: Maintained
> +R: Chris Wulff <crwulff@gmail.com>
> +R: Marek Vasut <marex@denx.de>
> +S: Orphan
>   F: target/nios2/
>   F: hw/nios2/
>   F: disas/nios2.c


