Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AE6A0EC6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:33:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFRw-0005Ji-RE; Thu, 23 Feb 2023 12:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFRk-0005IJ-E0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:31:58 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFRi-00018h-UT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:31:56 -0500
Received: by mail-pl1-x629.google.com with SMTP id c1so14115253plg.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wdJ+i9JF6G8P+CVsV0lbJVqrJzn9qXQTb/CNPCh/Bak=;
 b=GjT/WKBPIIdFqsbtW60UskBmt2AYzaceHzeoOmH1L+HfumK7SWf0E9YERFg8XT/RJZ
 2QuGuK+Mpu885J3unJodsF6M2UAhkGWk1k16MvP77JyMYPgIcc0RROX12e4wfzSZ32XG
 +SS5EDvbgPu1lyCnBNR+uJhIFld4uzZcT9OF1G87XeORhCUDRFnPV/wgWF/V52uyKcii
 /va0S/lAuLx1A76sUy8D5BlnHIEdDxRw/uJr97XYFApwEI33lH+IZjgOwLTvLhYQIliz
 L1E63o+968LRIzDePM516HDFQtRoBqb37P/6ID6Djaoc4fWEgZD3HNIFujYHbSKyxeXl
 oNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdJ+i9JF6G8P+CVsV0lbJVqrJzn9qXQTb/CNPCh/Bak=;
 b=h14a/31WTZPXKzKJ+1T8wzHTDmphhmJ/Cte87/ex50ifVcusfMauLbF91AfHdL2Lep
 100TQ9Rw/iYeGHpnjJi7sphuoogtPwI34jWhdQ0se07XF8w36Ump4EZbqa9mlNyKLQkV
 66DQqSWDoNJeptuZjjfC0jhVfGRQ+NeWHZB+P8CQpcCF/5hpiuMNFRVMTPAajXP4OzC8
 mXHfKOT925j5kmVseEtXHGDGO1uRQelh26NCvJcCvfiu1bVu+G1eYLR+USosBO2yud8E
 1avSW0fzs3fKLuJTZbbkEyjvi2EKeOjPe8YIv6SLfshMUguOKFfVpsLYZBIsKonRZ1at
 f57A==
X-Gm-Message-State: AO0yUKWcyzDW397Vi/x7HuONlzTlLB+yMoOKgxd3JNNI+zKTLxPNtEad
 AM3gxqKOCtIfmU/Z1NAGV4QPkpJbCqCPhCAgqoRPzA==
X-Google-Smtp-Source: AK7set/XtVvCN7Tz99hp2YDJmyamOUBUny2lKXr9oaaVOTwKlipM4SdtCipn2QXhYzRSARjg+xnQPa2Ql6wP3+93Ekw=
X-Received: by 2002:a17:903:2591:b0:19a:98ea:5ef1 with SMTP id
 jb17-20020a170903259100b0019a98ea5ef1mr1877729plb.13.1677173513107; Thu, 23
 Feb 2023 09:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-17-richard.henderson@linaro.org>
In-Reply-To: <20230222232715.15034-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:31:41 +0000
Message-ID: <CAFEAcA_5rmFgBoW_k5pdi3vXQXB7v8Cpz1AmXP_FB0VMvx5fTQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/28] target/arm: Drop copies in gen_sve_{ldr,str}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Feb 2023 at 23:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since we now get TEMP_TB temporaries by default, we no longer
> need to make copies across these loops.  These were the only
> uses of new_tmp_a64_local(), so remove that as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

