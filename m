Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DC4FCBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:12:00 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne54Y-0005Qr-UV
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ne53O-0004gx-Qs
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:10:46 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ne53N-0007rO-9r
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:10:46 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ec04a2ebadso65690987b3.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 18:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgX1T7dih9PAXVi4vbxp6hXvoByToakykuzz4aDkn6w=;
 b=Bgx7Sq+pPuDNn9D9W1yf6mBAfRwFOaHQ9vZ8vq4L/al/oF173XatXy4bxbcZZwrdhK
 ChTKU9U1vcU046vHDRlrk9Hi16+X+OBTprsH/ybuAgJsMttio/ETyDelqrSYWqWYeBIb
 pk2QVx3cmrIP/+PQ8WQdD5ELqVEtConEkEyRyBhA43HdTVUUYaEWlxJNUDLUweGJF+0Q
 kdhVOYZO+lz9+9tlERkelfShoJ1tWvdxE+ruhHjm+k9QYyPn3OUUze4YvPr4upEZbL9h
 nG2uNUlHmJRhRiwl9IoMEcp8LKod+/6rnxNorWMpjIZXJoAz262BktBg23GEJPllIoYP
 e/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgX1T7dih9PAXVi4vbxp6hXvoByToakykuzz4aDkn6w=;
 b=Z1SpJ7OjRgkMeQY3YRxopxb79t2MTJGkXn9dce1K8MVaWdX3EjrTa5a1uq9U6QtOLD
 6Jy72xN4GL6ikdPOp6LoNVQqOnBC573qxI0RuxdAykGVplkc2HRHSaAauf3lFsbJjjSk
 RPIsn6e6JDHZKjTpaw6Z48Ix4mAhFavohDVgYJ3GU5P8skUpnAUojFboDE7LsrHXcbiR
 LoZKGwg5bZ/2TGSBjoATF052gkwl65Isudd0l9Mn3iznWXHGIIm21yEUfo4mgAmln9z8
 S70nRnHCqwhJ9G1Vo9kOZP7BQ64EzyRw5fozXUZ+oYg+YuzKsxu3D+4sc9OE/+DuZfxQ
 er3Q==
X-Gm-Message-State: AOAM531oMPVj40+5lSO89jphyRiYT9Rj6bRjXjy1VXpdAilsXBa5mmIb
 hsn0GE1GinyQbvg+lHFo9iLSEW+cwmFIETZT8Wo=
X-Google-Smtp-Source: ABdhPJz/NHC1IGm5/rUTRtv5R2V8SZZXLsNW6/JRUBWdTWbdkGi+bXu8zNZ/FCVnUiDTw5L+8Fc0uPchQRJF3VV8gDU=
X-Received: by 2002:a81:108f:0:b0:2ec:23c9:70c3 with SMTP id
 137-20020a81108f000000b002ec23c970c3mr6572199ywq.153.1649725843662; Mon, 11
 Apr 2022 18:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 12 Apr 2022 09:10:33 +0800
Message-ID: <CAEUhbmU9aofswa2AUBKgCKdvy3EQjJ+h4b22_MQy3rwJ2S0wOQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Alistair Francis <alistair23@gmail.com>, Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 8:19 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Better exit in that case to not confuse the user.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  hw/riscv/virt.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

