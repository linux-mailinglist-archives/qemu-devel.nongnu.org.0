Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4A3F2B93
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 13:53:01 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH352-00040U-Br
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 07:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH33W-0002h1-CO
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:51:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH33U-0001fP-RL
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 07:51:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id bt14so19723133ejb.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 04:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cp4N0zQRGFf9fUH1YfxOEa4d9atF8Gd1sjwJMf9AmSc=;
 b=AEroXsCB+GWQuLrqUptOqa8ctDnjXIIwFKm3MRQkuRwin5ngra76ESG4fe5XWxmqaw
 2Znnh63EUTWXc7DLQQ3zmgPB7PIjOfhEvfmPTOUHejOigLYWl7EoTKE/0RdOot/AOQi2
 wys8obKCp5JUXSADWQ3UMSu4kGZGdHIEpxPZUwPDkCJe1Aw1M3inTTdYZceAmfGRKso2
 bTtzjohEn/MzVsQsHZIoM6X50yV8XUhdK8bSz3TMtaGlHiYf64snXMrxLFlNBycRbYuC
 dNZLGrh1zsFLOgqSwfg6z8Om3amkpk+Z3IDp2Rcp+iKDDJP0d6Ex6EThUYz64uzIJ/Xz
 vN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cp4N0zQRGFf9fUH1YfxOEa4d9atF8Gd1sjwJMf9AmSc=;
 b=Cr50Tq3y5MZHW48rVirafpwdM0WxpjKV9df7QX+TxwvUEBXdq3FGLbNfyB0fGeWH3V
 JacAjQb9QbSStVEk8S9rgxEMcI8FaLDJ+IFlGtQCNFlXE8KLxrK40ssSjAgqDPeDQU0K
 2G12vfcWxHY6S8LXyM3rXqj22abUl2gTMG6vFhj2P0SboJmtV9Bhzjmy4pMmpURQItyN
 wZ1saX/Ijhh22vb0khHZXy2ZNAl9xu85Bzq/aB6hqZelf+3sUdyUfX+Oc1wuXACY5v6f
 vlMQX/kVl2nAoJZQVlnO2uNi14LXqMdaztWkCPyHOqYXlLe0mdexfmKW0tXmwjg9UF6a
 ZMZw==
X-Gm-Message-State: AOAM533STSTzxqF4s8nbE1xborvC/ZgSVNV+KNpEtwa86BB93ShHgbQ9
 Yu1vN54UxzOhCPDjQTTL62WNS+mGmkf8PIiT9B+F4g==
X-Google-Smtp-Source: ABdhPJzs5c2dX45PcocM1ClsVz7c6cTN1adF0Aztj2kQ72z3cilz8QzkKFStqJHgo3afqvobwpAYQ07mA8WIKgKCCHw=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr21906676ejn.56.1629460283358; 
 Fri, 20 Aug 2021 04:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-9-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 12:50:37 +0100
Message-ID: <CAFEAcA-2pXVqR+fBJhqBJTtgRGyCaJSLdG-UwDFzt8j0mv=z9Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] tcg/arm: Simplify usage of encode_imm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have already computed the rotated value of the imm8
> portion of the complete imm12 encoding.  No sense leaving
> the combination of rot + rotation to the caller.
>
> Create an encode_imm12_nofail helper that performs an assert.
>
> This removes the final use of the local "rotl" function,
> which duplicated our generic "rol32" function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 141 +++++++++++++++++++++------------------
>  1 file changed, 77 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

