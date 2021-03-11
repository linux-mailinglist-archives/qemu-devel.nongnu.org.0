Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5E336DB3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:20:50 +0100 (CET)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGYr-0003FT-VI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKGX3-00022x-Ds; Thu, 11 Mar 2021 03:18:57 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKGX1-0005mb-U8; Thu, 11 Mar 2021 03:18:57 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id p193so20846706yba.4;
 Thu, 11 Mar 2021 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJHZ/I1taX87aQi8hWkjWKQfuEnfavktVblmx1jQZLM=;
 b=A0u8kWt334c+nYqWdAli+kA+GUcblx1NHbfV4CPCT5yPs944hqFgcetGynXEfPxHGP
 7At1WwF2FTtrnZ2ohHeGDsQHfSi5XC6QiyjGaN2evqfqY/blgzJlnqWNSrXuz5hFF6AI
 IhJdAnfhJzpqZDOeZeqY9q7kM8S8kJaBYB7Xd61oU0uhU//MTiJnF32q4eAeF5XpUDjN
 ewHCXpXhBCeAYNXSZCbsuQJWgmB4Axo/ZGXl8GSVTs+aZx06Dq/FOxYMrbxv42y7qN49
 b58mrGWRGtVfLlnVvbr/Iyi3C/kxYRLJPu8X6J8y4BoAItJArJuhVBA4RujyTczb1mA8
 gDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJHZ/I1taX87aQi8hWkjWKQfuEnfavktVblmx1jQZLM=;
 b=W54JwY7lF+Z+eJCRDfRSiHNy8Wr7dtAWk/cZo1Zv3ZQDMpOa2Su7+Q0WSj3m8O7zj3
 HPO4u+gJjV7uzB+LEuquOciui978f9vwVxpNn2+VHUsuDQol4MKCbwIhKbsDMaSk/D2i
 yHIBsCZjz6/BeFYBcUcmb6Hpap+hkEb8lZRJmjUYfUkDX+8esPYw8f/zAjMyOkAaczUO
 AykVaiRydiE/JUEWiRy/OLR5sEeWruqF/VHM1iH92EYUi2qT+9ysU67R+X6uvDlL7o76
 QRR7vYsMmmf6AG/sDessBtCeTWXt7PVasZwgIY3xlfkjcjidjUPsm9qZB5/oAUoxNgHD
 LuLA==
X-Gm-Message-State: AOAM531VVQgrZzTrnsimUDVfPE+O9+vgx74iaLrIkdP5iBW7Z52xvuoh
 x4RmDfuZchSO5gCY0ZIVmbmlOF/fHihsDKfW2Sw=
X-Google-Smtp-Source: ABdhPJzEZ+kNKuC4yQCyF6+Qp6onlehY2sAD6GUxgwOawu0gIxrZ5b/LpXR6ICrpdnqKGGaURugTbhqEG6E+Zu0rsU8=
X-Received: by 2002:a25:8712:: with SMTP id a18mr10086936ybl.306.1615450734520; 
 Thu, 11 Mar 2021 00:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20210306060152.7250-1-bmeng.cn@gmail.com>
In-Reply-To: <20210306060152.7250-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 16:18:43 +0800
Message-ID: <CAEUhbmVQZpT1bXkmV==rXqaq5u+oqPd4fT5LROUCwGUhmx_XCA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: m25p80: Support fast read for SST flashes
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 6, 2021 at 2:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
> the address bytes. Note only SPI mode is supported by SST flashes.
>
> [1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>
> ---
>
> Changes in v2:
> - rebase on qemu/master
>
>  hw/block/m25p80.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Ping?

