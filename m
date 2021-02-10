Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5553164A1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:08:31 +0100 (CET)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nME-0002Gz-My
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9nJt-0001cf-Vi
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:06:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9nJr-0001Fb-UI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:06:05 -0500
Received: by mail-ej1-x634.google.com with SMTP id lg21so3393252ejb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Ai1mCkMtxl9xOP6gPo0HZ1C6o+xO6kBZT3XwK9Tc+k=;
 b=n6Bp97fqLvcyJ3lX28AFjZQz56rVKUh7dDLvX3ouGkkSOpVsSZJe55k7iE44dTr2ns
 w1cYnZ/nfwjD/O1K8SmzlS2uwqtPONFT9f+gBjzuxfGIUNzYoJV/tc22EsyG1wKIzI8T
 SzBX6vqC2nm0S0m7J5c30ZBX+PBoeGkQcvivxOzXIfoWH/M3J2E4AgEnCrQLk93HslVD
 3YxljXZz1Oek8LRYLcFHbnKT90n2nOkUaXSnO6GaHeV+rrV2bK6QjDKdnyecsVcGVC3r
 BexSh8n0m8ipDB674cHxm4bns37GmE+XvBmrIoobhG2VTge4dLwYS4TadU6sd9thRUqj
 K97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ai1mCkMtxl9xOP6gPo0HZ1C6o+xO6kBZT3XwK9Tc+k=;
 b=o4tD5Ub3YlPyaReRM9okWrB275/GFX4xave5K2tTaLSh9IEd7NfmtJ55CQ3JGwXFJP
 7QHrKkdnP2Vj88xajryb7/bIwYYezWQFNOzxpUyKEGUSALwS4x1dvDxFYXBjg8zc4hnI
 AG16phn9rsU6I+/OCSbwdp6X7RMbPifujNiALkc0qjyMzN1p77ZY9fgOJ/OFb1qVWUEq
 AGSEIiVrs+5J3lr1H7QzrQG1PO95nk0RX2v/6c40hOP/XAO8n5jFfa8QPZW3Y/knA3hC
 dKrNIsERa1mwkMTtK8A+A+oRxadVQl0XfwXodU1ZVgIrRMdCFIt9ieWKQbmQ0Iznsg1o
 crow==
X-Gm-Message-State: AOAM5311lw39lcvjPxymhcUhQzW79yh/9BHx11/3q87oDBG00LQFyhuC
 IciN1hTMr4gDhSBXvZ/BdSMowq6592j2XZGJOZRGOw==
X-Google-Smtp-Source: ABdhPJzOtnCbEYYU3lHf5QlK75/5hmAe9fcBl+xUxKkWKUu8K8AXRvVN/IHhwAB/UVqqlFHfjVDqH71GGKSMKfiEvSI=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr2330312ejg.382.1612955162198; 
 Wed, 10 Feb 2021 03:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20210210000223.884088-1-richard.henderson@linaro.org>
 <20210210000223.884088-20-richard.henderson@linaro.org>
In-Reply-To: <20210210000223.884088-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 11:05:51 +0000
Message-ID: <CAFEAcA8h8Ojqm4MQM260=JUaC_HuU3P=y+Au4dDB5ogmY5W5Mg@mail.gmail.com>
Subject: Re: [PATCH v6 19/31] linux-user: Handle tags in lock_user/unlock_user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Wed, 10 Feb 2021 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Resolve the untagged address once, using thread_cpu.
> Tidy the DEBUG_REMAP code using glib routines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/uaccess.c | 27 ++++++++++++++-------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

