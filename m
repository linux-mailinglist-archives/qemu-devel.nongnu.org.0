Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFE663006
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExZ0-0007MQ-JZ; Mon, 09 Jan 2023 14:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExYx-0007Dr-MX
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExYw-0005JR-0k
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EE1tb7ciLqruLsIGRurZitFhYxoY31qScnu4lB90hes=;
 b=UDZPtlFvS+Wq43yQNmYMRmiGkvz4adukCQUyZXS8aTpiDqvHKmTltz21MngqutbPSwotix
 Zek0boq6C84AXQZLFD/+q2J6EQgsogMlhXLfmpSM2aESHQxcRRP2w0inVN7dzBiScniw9u
 C2y1ibzeBkQ55BFSJrBTEVncbMMJGDs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-TzWk5d62MyyJfjzAioZhfw-1; Mon, 09 Jan 2023 14:12:00 -0500
X-MC-Unique: TzWk5d62MyyJfjzAioZhfw-1
Received: by mail-lf1-f71.google.com with SMTP id
 l15-20020a056512110f00b004b6fe4513b7so3481305lfg.23
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EE1tb7ciLqruLsIGRurZitFhYxoY31qScnu4lB90hes=;
 b=cpiFz8arCIOU5sOvGQAUwfjN06qlkvijxXkhYloF8dzGZK6oEVFH+dYM+epOAgKjWE
 6aqrc7+DAVmgOUhLfLGXSF7JOSdDSpngXAAeNAIsTis9py1X6BofPPP1o6WZTs7rUmOY
 BldMbRAZpOGj4LkWoLoMhT5E5bjD+2O5DDjaTa6o3basap47y/ON09pwpTU2ydL0xZAf
 4Z2qfXTXiI3a1+m7riWD7/AOt/dHmcPWbnlc2oZAs6+Y7K8FfahYj939E5DaxeA3lGnA
 RwKNs07h/lfyxCYHvmGoq8KhS0rXwnjCYgzXA3aJFcg34nEoIjIgv5QOseXQYwCayTOp
 JBkA==
X-Gm-Message-State: AFqh2kr2ZMX+zOOn6GwAxjE1ocNlhyjuI25J7im8cEOS2QuPa4Nb2QOi
 SH5SBcxGG6XZbc3dO171hWfreQhPJ9YvDXled/U285o6duWPJYm313wIr+7K+2RdwD2gCsuZfqb
 0K+iCc2CcTQDD+5nTs5JPTHN4hhfw9Aw=
X-Received: by 2002:a05:6512:280e:b0:4cb:3b24:8395 with SMTP id
 cf14-20020a056512280e00b004cb3b248395mr2092230lfb.399.1673291518879; 
 Mon, 09 Jan 2023 11:11:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs6xjAZ2lW8kdfNDRND9u4uVut2OyKIfAhHDHb3EVNj3OF0yYtPwVt5ixNvm6R3Rb9sZyLnl6Fvj5Aq2pbMl9o=
X-Received: by 2002:a05:6512:280e:b0:4cb:3b24:8395 with SMTP id
 cf14-20020a056512280e00b004cb3b248395mr2092229lfb.399.1673291518724; Mon, 09
 Jan 2023 11:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20221010085229.2431276-1-lkujaw@mailbox.org>
In-Reply-To: <20221010085229.2431276-1-lkujaw@mailbox.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 14:11:46 -0500
Message-ID: <CAFn=p-aHLW0kmOLUw6OJFYwY8a24bmb4grFYL3XE_ircmcTbJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ide/core.c (cmd_read_native_max): Avoid limited
 device parameters
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Oct 10, 2022 at 4:52 AM Lev Kujawski <lkujaw@mailbox.org> wrote:
>
> Always use the native CHS device parameters for the ATA commands READ
> NATIVE MAX ADDRESS and READ NATIVE MAX ADDRESS EXT, not those limited
> by the ATA command INITIALIZE_DEVICE_PARAMETERS (introduced in patch
> 176e4961, hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS
> command, 2022-07-07.)
>
> As stated by the ATA/ATAPI specification, "[t]he native maximum is the
> highest address accepted by the device in the factory default
> condition."  Therefore this patch substitutes the native values in
> drive_heads and drive_sectors before calling ide_set_sector().
>
> One consequence of the prior behavior was that setting zero sectors
> per track could lead to an FPE within ide_set_sector().  Thanks to
> Alexander Bulekov for reporting this issue.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1243
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>

Does this need attention?

--js

> ---
>  hw/ide/core.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 39afdc0006..ee836401bc 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1608,11 +1608,24 @@ static bool cmd_read_native_max(IDEState *s, uint8_t cmd)
>      /* Refuse if no sectors are addressable (e.g. medium not inserted) */
>      if (s->nb_sectors == 0) {
>          ide_abort_command(s);
> -        return true;
> -    }
> +    } else {
> +        /*
> +         * Save the active drive parameters, which may have been
> +         * limited from their native counterparts by, e.g., INITIALIZE
> +         * DEVICE PARAMETERS or SET MAX ADDRESS.
> +         */
> +        const int aheads = s->heads;
> +        const int asectors = s->sectors;
>
> -    ide_cmd_lba48_transform(s, lba48);
> -    ide_set_sector(s, s->nb_sectors - 1);
> +        s->heads = s->drive_heads;
> +        s->sectors = s->drive_sectors;
> +
> +        ide_cmd_lba48_transform(s, lba48);
> +        ide_set_sector(s, s->nb_sectors - 1);
> +
> +        s->heads = aheads;
> +        s->sectors = asectors;
> +    }
>
>      return true;
>  }
> --
> 2.34.1
>


