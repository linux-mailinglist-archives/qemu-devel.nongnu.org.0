Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8755369F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:50:14 +0200 (CEST)
Received: from localhost ([::1]:46152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3g8r-000130-57
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3g64-00005Q-W0
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:47:21 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3g63-0001sQ-Bc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:47:20 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id i7so7488413ybe.11
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82zHlXjdD6WhdPKQtoOwwdS6o4mNXOg3EycCenNFa98=;
 b=u9HXGwBKqKSfg9dEFCOsJ/G+6sjeeIXBalJ3/xM98ST9+wwviP2Vcl6uxBjYevPC3A
 4K/hxaAQYGUs13TBiBu6HlrTy7fWyDi51MBaxQObjlo9f7TE/3HCMgmDnv7QaCLhTP1V
 RyCJNIfedx9vUUsFPWMhXcRMIQJmvuQaZb//ELhYV/a4p2YzotOSQtqpdGy1P7XiT+Se
 EXiHLkh0Mic6eyJE6SCkhwpWpLC7L3re0XM/3egFHXG6hQgIPHKT8ZAMjWbi8pRCzkXt
 b5qLKJaMD0KTR2QCVY1rMvViLlJun8NzM9cgy3uJY8TTscTTYPFnTdTNqiov0h09J2ey
 tnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82zHlXjdD6WhdPKQtoOwwdS6o4mNXOg3EycCenNFa98=;
 b=K3AvlXuHn4ijp2cNA2ojJheVGd8UQZkOmlDgcPd5tvbvhOXTc2SWYF2cJJZJQc1WJH
 uwThtMj9xmcCel7GdzFrfkxWlSskhl7mYyezFnEvW07C119d/h35mgReHNwApT6doHqL
 AgtmNnzmgn+DGGCqtQd22mNQhUydGw2xScJU1P9bn3tyW+kRRcku+QrjCCUTaipeMMom
 NrPbINLaQ1UTioXqXaaGtKwdPy9vIjvZjBnXEUitISyjr0HpaMH/SDLvR0d26NqdyChI
 mtdIHza09nqJZefoQ2KV9ndg9MddOwGoyRMCgkIy2blJz/yZhMqAhrLd0jnolrzMcTiM
 VJwA==
X-Gm-Message-State: AJIora9TVqCbkiSHHco+cfIGU07Lp4Tt7m2ikMsJVbXkfCbVr3ss1NCq
 zt0g7HzK+6cvIioDRM1s3y5bS6vmxNq1bs+yewEB4A==
X-Google-Smtp-Source: AGRyM1vsKcJaPjMoesqTUQildVqZQDrKlN/Wm3hHrpwOmJJUS3Uz425PZJ92OjlAGIRbRhbbNIC4o6Bjw+QBZ7AZv2M=
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr21772644ybu.140.1655826437065; Tue, 21
 Jun 2022 08:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220621153829.366423-1-richard.henderson@linaro.org>
In-Reply-To: <20220621153829.366423-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:46:39 +0100
Message-ID: <CAFEAcA_SRK59SYLa9CnMTvAvKMT_5P2vjGXAMquTq8zPLSKw8w@mail.gmail.com>
Subject: Re: [PATCH v2] softmmu: Always initialize xlat in
 address_space_translate_for_iotlb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jun 2022 at 16:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The bug is an uninitialized memory read, along the translate_fail
> path, which results in garbage being read from iotlb_to_section,
> which can lead to a crash in io_readx/io_writex.
>
> The bug may be fixed by writing any value with zero
> in ~TARGET_PAGE_MASK, so that the call to iotlb_to_section using
> the xlat'ed address returns io_mem_unassigned, as desired by the
> translate_fail path.
>
> It is most useful to record the original physical page address,
> which will eventually be logged by memory_region_access_valid
> when the access is rejected by unassigned_mem_accepts.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

