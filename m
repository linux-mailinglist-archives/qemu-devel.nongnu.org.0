Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1931CB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:51:07 +0100 (CET)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0kn-0005w5-4a
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0jA-0005NX-9V
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:49:20 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0j8-00053M-Fq
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:49:19 -0500
Received: by mail-ed1-x52f.google.com with SMTP id s11so12195422edd.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACyNmfYOa3VsP+GnCCazL/IQ3wblXbi2lSsFkJJIsSI=;
 b=sTN7dbr3q+ItXRegPZc3qV417qjwMFmiVdkpAyWTx/Scd5Ug8QwfDPsd5N/jIruVCZ
 IswmKCHsjA8ga/QIQsJpTttSElAK8jWvXIW9aLdMQa5Rsb9tNwFhrtM7wgPPTv1rp8uP
 NHkcs3yucLl1zabCvChseo/1jWzXW1GbnpqmcWzES4FsQXHGSlOKsRA7jpIoq54TfUij
 89y6pbFI2LVNrEilUlTQt3P6AaYW37OG/Rq6+1ZWsHgNAIFtyewrv9Iis/z10H+i3Myc
 JlOEvkJIoYTNMufvMnaya3ElR615AaWUqcnCAo3oNlGYGvOrtrGy12AYkflNF+qXgZaF
 pd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACyNmfYOa3VsP+GnCCazL/IQ3wblXbi2lSsFkJJIsSI=;
 b=g65Q/nOLZ5+Z65MWFBtjH/DmA+mWX5iqQLFAop5xjzuVr3orQVfnhcl2Lh32HM+iUC
 0K8kA+OKopcktxeM0l+Y+Es9o8lcYvW//kGWY6KfAKyvlIOGUKsWRuljNGw8JK79nRsa
 /+idWFLs2iAQyEd+/z0xUGjJu8toJ1dQebdiQg8hm41h5tYKVNbidw2l+zW8LGbBhq7D
 kdvXwAZB9JMW2DFE9RUL0FG70PX3jE4k3rXj/7L5o/cSrGpVSU1B6cewNDXR+EHdX0GT
 nIBCMxMS1d9fRQmTorLDB5Am5q02cqJZwmYb/RMJmYdbwI8RcQuKe5/P2tGR/ZVcUJkh
 fIHw==
X-Gm-Message-State: AOAM530Byau1e1xwRLJhkBjQ4N6Ux5LLttP95EEUp2L7J3wFlWzLkIEp
 JJwGBbLAamF8H1Y+KGhZMwnsZQxhtIcZhsQFk00MmFr1CXw=
X-Google-Smtp-Source: ABdhPJzv2tVfBm/pPabzoaTP+BA9qyE2jTAYqfr2mo0pBRfaQXH7CCO+Gs0BS8VPFdi5bDdYnMUYu6n4TjGAyDAnYRc=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr20852273edx.36.1613483356674; 
 Tue, 16 Feb 2021 05:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 13:49:05 +0000
Message-ID: <CAFEAcA81RbbnmZ8namNE0vLFkmeEvjA0vdsTDeZf9cPnH5uODQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/31] target-arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Fri, 12 Feb 2021 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v7:
>   * Fix bsd-user vs g2h_untagged.
>
>



Applied to target-arm.next (with the ifdef tweak in patches 17/18), thanks.

-- PMM

