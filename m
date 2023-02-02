Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257F6885C4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:56:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdom-0003gu-LG; Thu, 02 Feb 2023 12:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdok-0003gQ-Pk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:56:14 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdoj-0001Yw-5V
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:56:14 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 7so1906915pga.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iziUtdqSsWJQ/ygZsKW7yo2pKc/YOnYp5A3Tiwe/6mg=;
 b=TGVUM3SzaJG+UNZw+RE1+tsd7BzhyJ/uqKbvQV7jjNn2d6gpRyrspsO2H4uo0KqWt5
 X22DfWUBERlwHUHFWj6FsbcnYWf7LUWASSn9v0tweYg+r0ALmPQHOxmalNj1z56XKjfa
 sTUWox2bpKY7RRe04tfDcFcWv4AuYbe3fFw58fLAo4CYolE5eB1dv8Ssd6gh3BeKzQ0v
 at88ueS6/TEjrYdQZRwiocum+MRhfylARQhnS10gGNKM4QzdPclTLAoVCcs230zQ2iST
 74IGZUvEGqU5QUvImKdw8d4AuwizzdVuVSeqEGcEzGx4I92FP6X1e4CnYwLkYqIgEkBS
 MhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iziUtdqSsWJQ/ygZsKW7yo2pKc/YOnYp5A3Tiwe/6mg=;
 b=jQXnYBXsnahQCAjd0mI/aL1p5kKGO765xlbqTRQyySMV1vP6S+6Id2Snt8HWQ3riti
 xZsA/bahtZVCDm0Uc2FjeYsyJXDhHJ0oREMlkqtVPxj9nVOSxrhJqKisOlmUoZ8WCjpp
 U3vFPF6af+XmsblAaFXSntq6y28vfdYYBJGrlXXX0QzRvRu3h8sTVB83CsUQQfI4rmxq
 vTkcpImbIKw/6cCrlEkLwYzqxcbrg7dD/cK8zkFizkiB7YaZXqRgB1BWbi16pLRiZrgE
 ismjw0DBeN1iDzVJHj51Kx87xnF6uhhgdLgZuOcpA4jXvwrvBcAm4yY6DNL6qHu8Xzz4
 CnoQ==
X-Gm-Message-State: AO0yUKWs/jMpg4X1kh+9iXsuZuHmJ5vclLNiq0H572x0Lut7CsL5aLw4
 oCo03FkLDCSX1lipbMmXn9VTn0SmskRMwUNHWTxLTF57C04MMw==
X-Google-Smtp-Source: AK7set/hM36e9sTouWjpCM2Dqur6ohExbEoOSk2mXLP9HKoY/gYQQhoI0Nx6L0DR5Ep4h6fjf55T72vwxJX768QZlv8=
X-Received: by 2002:a05:6a00:130d:b0:58d:a84a:190b with SMTP id
 j13-20020a056a00130d00b0058da84a190bmr1658759pfu.48.1675360571372; Thu, 02
 Feb 2023 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20230128224459.70676-1-agraf@csgraf.de>
In-Reply-To: <20230128224459.70676-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:56:00 +0000
Message-ID: <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, osy <osy@turing.llc>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Sat, 28 Jan 2023 at 22:45, Alexander Graf <agraf@csgraf.de> wrote:
>
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functions.
>
> This patch adds support for HVF to call into the TCG callbacks for GICv3
> system register handlers. This is safe because the GICv3 TCG code is generic
> as long as we limit ourselves to EL0 and EL1 - which are the only modes
> supported by HVF.
>
> To make sure nobody trips over that, we also annotate callbacks that don't
> work in HVF mode, such as EL state change hooks.
>
> With GICv3 support in place, we can run with more than 8 vCPUs.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---



Applied to target-arm.next, thanks.

-- PMM

