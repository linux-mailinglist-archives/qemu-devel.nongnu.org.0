Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE3343647
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 02:32:16 +0100 (CET)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO9QU-0003tm-V2
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 21:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9Nn-0002zp-Ee; Sun, 21 Mar 2021 21:29:27 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lO9Nl-0000j0-5E; Sun, 21 Mar 2021 21:29:27 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id j2so4874863ybj.8;
 Sun, 21 Mar 2021 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4OXZVP/FLtVeSgnPntXjHLfhe5/b2sKPPE2axHVYFJk=;
 b=UUtNEQ6jiE3yhcZgh50WRlOEhR1vE/Zar9p+0j4ZQepXFDpigQqVcpjEdigKkPO5od
 pt9utu684dLprLJlQ+hHzHJg0dIOmaURTt6nZuc3rTjkkQkFK23S+T0gKuLYSFTPwTqO
 025Jcm/ZIWjb5v63i3fmzz6tnQn0A4goXjbEIvoHsBsTmtGAI3Hlf6kS3ok86/VPT3TK
 Z48DAWGyZdKyQyfdTjbdEdLzXbaZm4hnbop1+5rzYz3g70N/Kx1JgA94fbTMJ1Tl31rD
 CCXjTdHK7Rmr77fQMJ10m6JAwrk3taiAgVIjP7AkX3Jn0T91aFFHj6E2HnwBRU2qAvrk
 KcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4OXZVP/FLtVeSgnPntXjHLfhe5/b2sKPPE2axHVYFJk=;
 b=ZMuwoEpZe+BbkqARklv8mV8YmKhDeyF+ge40y/g24woDNhMimGLuOmQSYMs3d34bp3
 PUcTgKk2wMF2x7Nvd6rPvbaArO05i2XLr8o68LCpYlCujZPqz1jV4StWLVZq4UCqG+aT
 bFF+DIqpr39ZZu2IDFrwHqCwL5jbWmlU5F95zY8rll/SeB8o0VU1ig6fWQZbzasAMHts
 qsTdbTHUJnZdwRpWX61nnyLuZWVMLYcY+hPYrwO7IMywoe5C3iLgp3iOSAFon/S+SiFU
 s4emWxnp012rzyiZ7iw6jvxJElsvAb/cvBJdeIB1+EmuvThmrMHDUMrbD0Fn6G44gQtN
 l+4Q==
X-Gm-Message-State: AOAM530ZlRD1MBuwtQp7nHoCXWBX55RK0/vSzrEpllQzDBb9YsUvsC2d
 WDIujas9jDSE9XqDZUDv7EphY8WAz/q8zUm3KKno1+Ni
X-Google-Smtp-Source: ABdhPJwX3QxOHzirg0q6dVBtdLh+tS9tQVZDL1nXWvWaP0CL4n34Dkvt3VwJT9kDoM/0zDKzL8tbxCJbv2hmti7RR4M=
X-Received: by 2002:a25:8712:: with SMTP id a18mr21649525ybl.306.1616376563696; 
 Sun, 21 Mar 2021 18:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210316081505.72898-1-bmeng.cn@gmail.com>
In-Reply-To: <20210316081505.72898-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 09:29:12 +0800
Message-ID: <CAEUhbmXPvyLT-ZTr+aSECLvmosyVnYASNZa=YAKcU0v4a7-Aaw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Tx padding length should exclude CRC
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 4:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> As the comment of tx_padding_and_crc() says: "Never add CRC in QEMU",
> min_frame_len should excluce CRC, so it should be 60 instead of 64.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/net/fsl_etsec/rings.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?

