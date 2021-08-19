Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6D3F1AC6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:41:01 +0200 (CEST)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiI0-0006Ng-Nr
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiEu-0001gc-PG
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:37:49 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiEs-0002Sj-6k
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:37:48 -0400
Received: by mail-ej1-x62f.google.com with SMTP id b15so12952867ejg.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfJCObmEGkvFyp2DjbtgejYNsDF6rAIfOCms2Hq3mKY=;
 b=m2mlo+nGzeC9Z7UEhl6Dp2UUIeD7jpEvmXF/4yLCz7/BTROjpGDe3kqni2b5bmjKHh
 y/w3gOZNeShjA85DPjA3QPeWzuB81FiCtjizfH+uFP7GfQxfhKWzRpDr+TbqtZsRQUrU
 LcHNH+lWTxjiuUx4zZgVLifp89LORjJf3o8z7gtRpqQ5iPpqJli2YUi0UUPyM9YDiAp/
 VMDrnzlfiaxCB+zxnSXUdP6zF1DbrnJd3B07yHRLtI4L44ekVS3NibsxwkxAXqmnNgxq
 i6bwC0P9P9E3f1nQLSU2F3LMA85Pk08MlCo3KzmCfnZ0zOPjqXUIJzcNC5mvSBq12hx+
 A+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfJCObmEGkvFyp2DjbtgejYNsDF6rAIfOCms2Hq3mKY=;
 b=OvoMo9hvSoSyIUfgNkylO/g2lpxFSdDqg6ZAKH1kPG4hmpsKUezHasBV9eA55BVYet
 yOIGaC4z+bDH6F8qQadOWHYxgvlNWxZ3YUELnZbZDy1ZWiwmcU9tnPFsYz+roj8EiSBp
 Y1PynXmi+XhthV8KbHYwhMQkmlDo/C2N06wUFB82ycuZF2f6nL7HVCL6FT9UMFwVZECe
 dDxD3aeJkvHcgO6bUhJ8nU4pemSs8Imab1wSVbulHeEfHy8ts9q7wm9yCZ7KWXL7/psm
 VnkLjwk1GIB8E20PsCr8Ato/1CPUDWB5R/0vC1h/hDfl+WUmFvQGPo+NuM26NUdPCrDg
 rsxg==
X-Gm-Message-State: AOAM530zh6jeNTQnIRm6Fd4QnpcSYJ9iqF/gxDP3uCWD4sguabdupSaT
 A8wVbJgyxDCWPvItFeC5EVD3YC0paGbW2ECk2vyjcg==
X-Google-Smtp-Source: ABdhPJwZl6y5/b0ptjkA0V8nkEJSehTMJZ/1l4IR3vPeRbJn27jq23Ns0hMvWIzxkTgvw4vFX4astajysF4WRvhzbiA=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr15965084ejf.85.1629380264709; 
 Thu, 19 Aug 2021 06:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-3-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:36:58 +0100
Message-ID: <CAFEAcA9XR8MebdL7+GXLjeHvyayvGL+u__e6Go7wq-wiDfFS_w@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Merge disas_a64_insn into
 aarch64_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 02:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It is confusing to have different exits from translation
> for various conditions in separate functions.
>
> Merge disas_a64_insn into its only caller.  Standardize
> on the "s" name for the DisasContext, as the code from
> disas_a64_insn had more instances.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

