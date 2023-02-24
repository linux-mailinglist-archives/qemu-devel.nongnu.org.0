Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5DA6A1DD3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZQs-0003nT-O6; Fri, 24 Feb 2023 09:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZQC-0003Ui-CB
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:51:40 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZQ4-0004b5-FZ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:51:33 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p6so7703197pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=13AMWkYVkTsfPmSEiA29LWtZf+Sd+WLTZopN8iRQg4M=;
 b=Yzrw3FDf+h5wWig1ZGcrkkP1mDs9mAH5M/0b7932R1swBPLrWDpYa0cNQHB9uGC58A
 ZuLFkiOVMTGnKiNkqlRgZN73/AN24KU1hvZyCEQaryQ//Bwb8WngEwjgSxCxXEMq3Km1
 jJ315wa4i/+5rg2Js5RnX569KhbvJsOamwstkV7mBDaeFvkYMe7H56dX4XmCc+ldPeY2
 gC3rm1WP51a/LIslA8FBJhAszQp2MW+XEItK9iuvIEcmYBeNpRaIUm/zwFkkIb8IsbP5
 gxnwzED4pykoOYlRBrC3AShvxcqq7GUpC1NQMnDzRykZFx2FuiP0c0OmeH7y2QXd/o+m
 bCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13AMWkYVkTsfPmSEiA29LWtZf+Sd+WLTZopN8iRQg4M=;
 b=gg2D4cRUqTn9U8exLA/T/LQnCI8I1W6hFCHcjPm/sa/5QiJyy61l05ntg0jsceLP4F
 bko/eEmj7vcWGsjbHypFNLiHM+17FXMfQL3K3BnfJGx3KMuyTeDQQehHAvSMj2UJ+RtL
 nv+TLZkhlh10dctXGPzNPzLGy7LNQsGiYyf3Oc59mDYj5JAK70Oh5sk+bgK6qDLHohWq
 uR/jcCY0FN+NDFhaFY2mnAqv48zSFXi5V/o0Ibpp3z7Gycx+CDVNQqtPiCFah27mDCAf
 AJvhd9HczjXGD/RJ+EHv0fp07OhL0x/nIb+wX/mDH+LQhuq0p5LIEqeeoYa4/dm9l+tZ
 zdWQ==
X-Gm-Message-State: AO0yUKUolrpqlKQ1q+tgQpXKUM/YGC1fGmgD0/frF43g4/ZEfdNT+h7u
 KGZRFAGM7FGKy9n281xSi1SAu9PpfcwYBcXRc6mxdg==
X-Google-Smtp-Source: AK7set/ziNq61r/PaWGLvx+Aq+zvmYE7Tg15bmVc1t+E6qrTJdoAgmeBRrwNKDH6AhTAFym1z53MwrPw4kn8nb6ZNmk=
X-Received: by 2002:a63:8c55:0:b0:502:f5c8:a00c with SMTP id
 q21-20020a638c55000000b00502f5c8a00cmr1672851pgn.9.1677250290745; Fri, 24 Feb
 2023 06:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-17-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:51:19 +0000
Message-ID: <CAFEAcA-E5kEbYL06xSuT2j1daD=kmZu4OBev+5uXBs0mxhOLOw@mail.gmail.com>
Subject: Re: [PATCH v3 16/25] target/arm: Handle Block and Page bits for
 security space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With Realm security state, bit 55 of a block or page descriptor during
> the stage2 walk becomes the NS bit; during the stage1 walk the bit 5
> NS bit is RES0.  With Root security state, bit 11 of the block or page
> descriptor during the stage1 walk becomes the NSE bit.
>
> Rather than collecting an NS bit and applying it later, compute the
> output pa space from the input pa space and unconditionally assign.
> This means that we no longer need to adjust the output space earlier
> for the NSTable bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

