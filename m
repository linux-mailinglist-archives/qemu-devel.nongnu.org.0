Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C7563391
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:41:02 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7FxF-0000JT-06
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o7Fpg-0002oh-I3; Fri, 01 Jul 2022 08:33:12 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o7Fpc-0005iU-2e; Fri, 01 Jul 2022 08:33:12 -0400
Received: by mail-qv1-xf36.google.com with SMTP id cs6so3970702qvb.6;
 Fri, 01 Jul 2022 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gym33DNpzXjPn6EwvarraFZ2ITiZNMrSpyA57FKB5II=;
 b=IZOOdeRNt0Qm09yTmRsMyeNsbKf/OzmMuMMLe5UYKkeyNuJ2QFAnJ+wl8XZcPKZTGR
 nd9miV5qbKaRTNagBqbz6AP/xbRs/q9qjbL9uqWLqJzmABygX0OYbw2G8eNyWe7Z7SMQ
 ftVZuFvPYHH12o+3iCqE5FwZRWjH5JwK9CA0R0zGvJAWnsDvEH3tXnKrqrBoQRCWsIvl
 w5pdZV8kBLd2PehgI5e70qEqgiIThfXtYTt0K+j+bJ7whbqqKpcfv8IxNNubBY4DSPjU
 v99mpkaUiYozyv/TOXAayEKLgtqCaB31u6NP96gWcdpMi9jxWEE3O4FhKwkdpN05esqN
 ygeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gym33DNpzXjPn6EwvarraFZ2ITiZNMrSpyA57FKB5II=;
 b=4Q3NP6heF4iMpJK35f7VDf9gH1fuiPO7CUVtc4phbSsj2d16yfXoM0nN0Tt5ePuhHU
 6YblJYm+f4SAPNDipr48WXNd1nX4adt9MGlEw1vcY82Vypo5TmnRNEg9wa+G6xlXTgz7
 aN6FXiZTIOfD6JhtN2hIB9dcjbNTxL5vLIdb/mjhir8wVnyVSaXOpxAzdFAxWAOLiRkn
 SmYcJECf8vCleUj/ZQbt8eWPcEhvEd8KsyGyRfI4bQKXfQLozj3QHVlPQLbtaZKUuL8p
 dOvOJOWbrb0RVITP+aK+2K4MWcJWR1Wt4CWc0zyYyNlIqBvwA7f69PfNO1x3XiJGtcw6
 kp+w==
X-Gm-Message-State: AJIora+fBIdjry00+6jPfPyMT3lO7ki0Kcv1WuUKCP8XSgitkpk1rt8k
 jy5vVSdvarBNI8cDXca5uulPaPrq8KYVSAQe018=
X-Google-Smtp-Source: AGRyM1ueR7/qWJc79fYQ0faTZdnQDYwWIpylzEZprqS45/DrCFoKEBI5PmBjOMBgBJMU2P+xrUAMMuUODFnnMzzd3ek=
X-Received: by 2002:a0c:e54b:0:b0:470:b52e:a469 with SMTP id
 n11-20020a0ce54b000000b00470b52ea469mr17080392qvm.85.1656678785978; Fri, 01
 Jul 2022 05:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
 <20220629233102.275181-3-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220629233102.275181-3-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 1 Jul 2022 20:32:52 +0800
Message-ID: <CAEUhbmU3YWP1MLJgHqcY-A51byHQt6bF38WWFmR=FOG7o58XTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Ibex: Support priv version 1.11
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jun 30, 2022 at 7:31 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The Ibex CPU supports version 1.11 of the priv spec [1], so let's
> correct that in QEMU as well.
>
> 1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

