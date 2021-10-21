Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E8435D66
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:55:09 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTqv-0002ss-1R
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpE-00004t-EW; Thu, 21 Oct 2021 04:53:24 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpD-0001Bj-58; Thu, 21 Oct 2021 04:53:24 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bp7so6811550qkb.12;
 Thu, 21 Oct 2021 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iZbm64b7QMtLrvBfZoEFXdxZHapSbuYXRUV1tSEZJ8=;
 b=ZvAa2lu9PTS7zmWfL4MuT5iynuR/5V4WcnB0bqe0V2EDV6P3SynYMAl1mO5fmwtL4E
 xKP13ZCmWT9PZ15by+kE+Hq7aWu2XGA7rHF2C8fCf1NmuPgoSJhfgEpngpckyqLMEJcW
 Qmvlbfnze5NU1f7hx4rZ6X1AiS2Ig7eaaYdPD0rcsdwwNRJcwPftA+PTtaToysjQu8+z
 Akb2XrRGHm8OwENz778s3cyVZqynUmjgEbWKi4iwSytu1CK2TBZGVRdcSXvzdolaTA4g
 2KhmL1O+WLDuK0Q8esCS350s9VOnBHkAQQXZ81EV7l9yFANLlsNpaNkoyTCWIVW32UNg
 ltyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iZbm64b7QMtLrvBfZoEFXdxZHapSbuYXRUV1tSEZJ8=;
 b=mD+vfj7wXKDdG3qk0A+vNWaZiz38RugrogwLjIGe9a8RexbHPY5eGAjchyI/OlTG6c
 z2FREU9LhBfg0w0b6cnDjMte1TWsQlqbaPCnEEm/RH3AgiVstXJSDerkC1yomwO7fjex
 QwV9RMaqACQYeKhIexzhbE9o1mG7fdIyqtQGbTghuAw6SCGgr2S148JshK4vmOZnJDrx
 8edhEqGoPybL1o2NXN/09JufFN106laIkCUk87NeSf0mtedq0ura7eX39ltr4e3V+e+z
 rqLiFbPtqyihgI5oDXqnbQa7sZpvogzOQkmqmHhFS1PmEFLFAGkfy36+/FMoEWINOW3z
 TSFg==
X-Gm-Message-State: AOAM530BoQbvqB1s13O+ex01uHeJQLAhayrtVEzMaCwW41CF8ATuFhdp
 Sp5akYfFdI6dg3z8K1ZiFpUUjOleiWbKYPw4Tt0=
X-Google-Smtp-Source: ABdhPJz+nOzem+ZfkIZB3vuSEadcZ/m17VeuMCBnWOC4p5f/JgPRGXpkThtMyMDXEldMLdkUgTt4ZkWTwIy9ohKj1/c=
X-Received: by 2002:a25:9741:: with SMTP id h1mr4217113ybo.293.1634806400996; 
 Thu, 21 Oct 2021 01:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <e4d22f1fd96cf821f6c400736a5dc20334e932b5.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <e4d22f1fd96cf821f6c400736a5dc20334e932b5.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 16:53:09 +0800
Message-ID: <CAEUhbmVOgfLwa4EP+faTwSWypPRqjxiWa5aCVKj22wixhCqzhQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] hw/intc: sifive_plic: Cleanup the read function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
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

On Mon, Oct 18, 2021 at 10:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 55 +++++++++----------------------------------
>  1 file changed, 11 insertions(+), 44 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

