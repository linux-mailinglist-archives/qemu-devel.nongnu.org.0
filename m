Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78094446CC4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 07:48:55 +0100 (CET)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjFVW-0007lk-8f
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 02:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFU2-0006ng-GD
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mjFU1-0007QF-1r
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 02:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636181240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHL6sFGBhTbmtq5+bOM1xMu7YSyQXKymidsSZqIY/CE=;
 b=YaBdi3pU42i2vQqP5eQ8jOGn0a0BNyCzp2iW9UiMlEgCOaeVTd0L9GYgsLQcKLNRT8DqEZ
 YUT7/lalmqnCrf8ATfcBuv74Pbr35QXKJXzJLcq2d075405aYtgI3IxagCdtG+nRmTGdtg
 PXdOXeCSX1sKI07StTTSzxej6d7ASIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-W45dxtA8P7KwoerKgCKD3Q-1; Sat, 06 Nov 2021 02:47:15 -0400
X-MC-Unique: W45dxtA8P7KwoerKgCKD3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85145800053;
 Sat,  6 Nov 2021 06:47:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B345360C17;
 Sat,  6 Nov 2021 06:47:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 328A211380A7; Sat,  6 Nov 2021 07:47:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH v4 5/7] blockdev: Add a new IF type IF_OTHER
References: <20211103220133.1422879-1-wuhaotsh@google.com>
 <20211103220133.1422879-3-wuhaotsh@google.com>
Date: Sat, 06 Nov 2021 07:47:11 +0100
In-Reply-To: <20211103220133.1422879-3-wuhaotsh@google.com> (Hao Wu's message
 of "Wed, 3 Nov 2021 15:01:31 -0700")
Message-ID: <87a6ihvl00.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, bin.meng@windriver.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hao Wu <wuhaotsh@google.com> writes:

> This type is used to represent block devs that are not suitable to
> be represented by other existing types.

Hinting at intended use wouldn't hurt: ", such as <mumble>"

>
> Signed-of-by: Hao Wu <wuhaotsh@google.com>
> ---
>  blockdev.c                | 3 ++-
>  include/sysemu/blockdev.h | 1 +
>  meson                     | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index b35072644e..c26cbcc422 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -80,6 +80,7 @@ static const char *const if_name[IF_COUNT] = {
>      [IF_MTD] = "mtd",
>      [IF_SD] = "sd",
>      [IF_VIRTIO] = "virtio",
> +    [IF_OTHER] = "other",
>      [IF_XEN] = "xen",
>  };
>  
> @@ -739,7 +740,7 @@ QemuOptsList qemu_legacy_drive_opts = {
>          },{
>              .name = "if",
>              .type = QEMU_OPT_STRING,
> -            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
> +            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio, other)",
>          },{
>              .name = "file",
>              .type = QEMU_OPT_STRING,
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 32c2d6023c..bce6aab573 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -24,6 +24,7 @@ typedef enum {
>       */
>      IF_NONE = 0,
>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
> +    IF_OTHER,
>      IF_COUNT
>  } BlockInterfaceType;
>  
> diff --git a/meson b/meson
> index b25d94e7c7..776acd2a80 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
> +Subproject commit 776acd2a805c9b42b4f0375150977df42130317f

Oopsie :)


