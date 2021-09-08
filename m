Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355A4033EA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:47:36 +0200 (CEST)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqQo-0006WH-MW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqMV-00030c-HE; Wed, 08 Sep 2021 01:43:10 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqMU-0002Jn-53; Wed, 08 Sep 2021 01:43:07 -0400
Received: by mail-yb1-xb31.google.com with SMTP id s16so954406ybe.0;
 Tue, 07 Sep 2021 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbn5yIB2Nk5OPx0d+kihgCnTLANdTIURs18O6a+hvMU=;
 b=N/5lALepnVIAaeo2ce7wNOxYiIlYhXk3XB2AfZOnBvXiD7bgGgcXNvILy1/Jqc/t4T
 kIm1kefxnS9u4eM53OE8RithPOu4joGkHo4aUkHdQ+f2riVd1s+i3EBjW52tQWROQrnY
 iJx5AKNfumRI95Q9Rgwvaz9Etj4KCG5z6F9XUFiTGYgOlV9PNBc5FQA7adIieTXiXCeh
 CvRMO+VXB24LTPvoIQXl3WER44Xyk/1i0pkDLJOePMf6Tps0fjlGmMNU8pRo9GGmuU71
 5WpidnrMUTN1nnbjXeBDl0L/+da8Rn8PbCTGCirh6jFrmzqRRPUTrXATGf1K7++TSi0w
 g1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbn5yIB2Nk5OPx0d+kihgCnTLANdTIURs18O6a+hvMU=;
 b=eaeo8PzijwiG775ro94zeTpmOwlPcTIvcOcewfCmo88mcgF6FjLm08wB98n4E86KRe
 g7ReAZK4xoBLmlVMkRtLVxeMSqxQ6MtLI6gYgPW93E7skb6nDLGEVzSr83Dx1AgVMlpL
 Fih6Ca0pX3KEO70jKfUlsqyRrrlcWDx7KEOU7q/J9tGYKs9z9G2kK3sRuKPc05V3UtCl
 kNvyr2bPtMQa1hK3LrvePtHei9OZLcXJfzjGf4eNjgs7tAOOi1H6OrMOpDGsV1Ef+S77
 0eKjc+QM3A3xPRbSETYfuDRp25V7xFHhkfkfD1VCUeHjmdLgN8H/uptueDfEdZdPKDRL
 YoMg==
X-Gm-Message-State: AOAM533SYyerEakGoGVCHioxehhkzuREC52eTMHBWQQObcadc5wKneH3
 7XYUnk2H3qHUidiM79MZLsXd+m5jXZpmPp8ZfwU=
X-Google-Smtp-Source: ABdhPJwI/N1avm9gygfCLaDUAnOG/zOBcpO6U5BnV3Rt8iKdAtOCu6H62rFZhPD2GdBlyxnzFs9PxFkYNOQpVaWKOjo=
X-Received: by 2002:a25:5956:: with SMTP id n83mr2633051ybb.109.1631079783986; 
 Tue, 07 Sep 2021 22:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
In-Reply-To: <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:42:54 +0800
Message-ID: <CAEUhbmUwLOQf_xvHEWPkOD5AYwkUdU9ROcksUdePiN_aCa9wMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 8, 2021 at 12:54 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

