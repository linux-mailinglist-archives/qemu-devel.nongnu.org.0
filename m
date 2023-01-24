Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D867A47B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:00:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQNc-0006Ku-7G; Tue, 24 Jan 2023 15:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pKQNW-0006Ka-Rk
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pKQNV-0003Vh-2x
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674593927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DG15zjdn50RjsTnEWGlhKPR0wYDfAxWcPTh2H8KzWqE=;
 b=M4RyiisOpCXGG5k/qqvS0YgkiFvQOowZAq9iCGasN5amscg98JJC3b3lFDiJ9EBBaAP4H6
 MJXlgbLLl15LafPtT2pTZ16mzvTrjIL3U/Pcybeq3zLfs7aCJidjJUMpEqAP6DCTgCxgZx
 nr+L/MLyRoAX4puuGdwJHOzy7kDJZ/U=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-A7vth9GEO5iYBkCgj8AP1A-1; Tue, 24 Jan 2023 15:58:46 -0500
X-MC-Unique: A7vth9GEO5iYBkCgj8AP1A-1
Received: by mail-vk1-f200.google.com with SMTP id
 x22-20020a1f3116000000b003c67dc01d12so6541337vkx.17
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DG15zjdn50RjsTnEWGlhKPR0wYDfAxWcPTh2H8KzWqE=;
 b=KyGbs8m9BqcPQ74mKdIwf7a4d57m5DolvhHYmt+ufXeSNai6mdhLew2m0cxKSkMrpT
 zMIWgHxqJi+jVEYzQHNrTT2jP2xVh7AaO6w6VRGR8pGntkz+T+bSj8j9f6YUKO9dvn/W
 u6KM9du7olY5V1SdDQ/Fv/q4Uvt+Q+pS4bLLyYNjIa22K4PoRy9zQtD52jw/+JpWP+xR
 g6W73q258gIxSJqEm/TkhnsMkI/mJ8XmuHzNAH1nT38m+fwlX+DJOE/oAILNA9lUwkJr
 KXP6Xzm/k5WPofLgdmd6V/9tbm8yLlQo0TdjiIKgFWdMuXdBHmloCBu+nbpDTzsd1ooI
 4c+A==
X-Gm-Message-State: AFqh2koT8Qv7gSs/5H7S159E4pGQI2IZczImsoAbE/HtUmNh1LFb9SV+
 bz057cd5UOq05IbhbzUVXIgbsvDGuuR1qJDg3fvYP/SBPhZlzHMXH78l6F7Dh0vHn+ZFpxcKMDo
 VMcoplmi2FcpxLHgipApz80NpfnDdOyw=
X-Received: by 2002:a05:6102:3203:b0:3d0:a51c:58cc with SMTP id
 r3-20020a056102320300b003d0a51c58ccmr3929582vsf.51.1674593925680; 
 Tue, 24 Jan 2023 12:58:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskJCRGaQXnm8PPX33irFZRJ6Eb0ewN3YJtFtN79sA4UhU2REZY+t5p/zMZXFhO/8B7qolSOpU6rWz5KQ7Q138=
X-Received: by 2002:a05:6102:3203:b0:3d0:a51c:58cc with SMTP id
 r3-20020a056102320300b003d0a51c58ccmr3929578vsf.51.1674593925472; Tue, 24 Jan
 2023 12:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20221222172915.671597-1-mcascell@redhat.com>
In-Reply-To: <20221222172915.671597-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 24 Jan 2023 21:58:34 +0100
Message-ID: <CAA8xKjWhdUBrr59ih7OkfW-ZUfnmCtmCAfh8EaApO=5d8-qj_w@mail.gmail.com>
Subject: Re: [PATCH] nubus-device: fix memory leak in nubus_device_realize
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
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

On Thu, Dec 22, 2022 at 6:29 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Local variable "name" is allocated through strdup_printf and should be
> freed with g_free() to avoid memory leak.
>
> Fixes: 3616f424 ("nubus-device: add romfile property for loading declaration ROMs")
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/nubus/nubus-device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 0f1852f671..49008e4938 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -80,6 +80,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>                                 &error_abort);
>          ret = load_image_mr(path, &nd->decl_rom);
>          g_free(path);
> +        g_free(name);
>          if (ret < 0) {
>              error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
>              return;
> --
> 2.38.1

Hi, any updates here? Is this patch going to be merged?

Thanks,

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


