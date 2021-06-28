Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD63B63AA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:57:10 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxshA-0004mn-5K
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsfX-0002oR-CB
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:27 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsfU-0004Sp-2V
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:27 -0400
Received: by mail-ej1-x631.google.com with SMTP id o11so17298420ejd.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkX9Ewr6D7LGQNycIsMkpMHL+QSDTjfmW4WxWsgv3t4=;
 b=NJYl1IRxm4lGcRthirtBQKFyR3STvIjLM3LzDXnj8FdY2v0OvrUZiggzfiIyW3nWzb
 K7LAzdU3psS+6PsZIJKUORicT8jN3g0JQ1+UDX6txUAbKFj6C2enySMA99SALL6z3zv1
 W8V8wCyf6s+Q1gTKnVSfXKUrhWuLny1fc19WIml+fg8WhRj6FWTqCA4kIrtgOEUVn7my
 v/HicdnUCvhJfcnezR+Jv8mlfFCuEUKfMKwAojNvlP7ZlcmL/W+2M4FP9HhTmQfOuqRI
 X6NqH7YhBo5wZGUcEpToo3h0dJ6m/iVT5l8CEawtizM2N9zCoxoR8C5u4ZtJxGjclr6/
 u91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkX9Ewr6D7LGQNycIsMkpMHL+QSDTjfmW4WxWsgv3t4=;
 b=mlQc7qvWHv9PENScmYZOmYYKa77PBWXsuohdePSxT1afdASGL35sVNORU1EE8hnC3C
 +cxiwOoPt+lEg5DNDkUkFyueQP+i/xKq2q2o8Wh+ZqNbjzjoPSyd36mySdGfZA7gje90
 uOHzBKw92jDJ5uKNKbKBuS/KdDfT8meNK5f1pJJl7gKrAMnbd/neCAH6Tqb0C4nnst5B
 NV3Lgu5MPUuXJR75BUY+UVIa3qPnhoxy7A2WsNj8xXe/ZXWG9EllPqHLwdCqjRYcq4i5
 WPCtw6un0D/EowaU94CTyf+8Qaoup/bb5pC2Q73VWmBYp60RYd2ud5iqPcdWvTnLczyt
 ZScA==
X-Gm-Message-State: AOAM530qkTMukXQszyn7diIDDN7F45zTJZCEeS4rqdckqrDSfh9SmTik
 rJNGZ8fYz5TBIXtZfjpTFYxDCywuzhhogWw5NdhcRg==
X-Google-Smtp-Source: ABdhPJwOoG1Dnrn/K4HlxDXLLsfjvZJjuy36cnZcDxgrD0H3SpA10cllHWPIlP8xjuC13taxeDrviNMwDThYabnepDg=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr24927342ejc.482.1624892122426; 
 Mon, 28 Jun 2021 07:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:54:45 +0100
Message-ID: <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Jun 2021 at 00:04, Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> Hi all,
>
> This fixes an assertion that occurs when executing FRSQRTE, FRECPE, or FRECPX
> on a signaling NaN when the CPU has default NaN mode enabled.
>
> When attempting to silence the NaN, we hit an assertion that ensures that the
> CPU FPU status does not have default_nan_mode set.
>
> To avoid this, we check if default_nan_mode is set before trying to silence the
> NaN.
> What happens then is the instruction sets any flags because of the signaling
> NaN, then gets the default NaN value due to default_nan_mode being set.

Richard, Alex: what is the assertion trying to achieve ? It doesn't
seem entirely obvious to me that because we're in default-NaN mode
(which is a property of the *output* of FPU insns) that we should
blow up on calling float*_silence_nan() (which is typically an action
performed on the *input* of FPU insns).

This used to work fine, because we would have seen the assertions
when we tested the implementation of all these Arm insns...

If we do want to keep the assertion, somebody should audit the
other frontends that use float*_silence_nan() (i386, m68k, s390x)
to see if they also need updating.

thanks
-- PMM

