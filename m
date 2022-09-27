Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA67B5EC089
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:06:42 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8QA-0001yR-5w
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od7zG-000060-1Q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od7z9-0007Mx-PV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664275122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQW6LOBGPc+Yz3hy/ACoB86PrrfaqaEJkTLJ82jpikQ=;
 b=KkymrDqHmdB1Eicn/eUBNoXNWBffXwxrTA7pLM8R9jNZ0U4K1gM+LybWxfC9e2QuzLPwr4
 bUQXzUDKkm4MqvmfZf3uHEanLg0geg2K2eU4FQXNe4Lipj31yUFh0kfKFil8ZQ+niaiaIe
 hjelWE8LCiElyr3t+P3Bc9oEB38hSwY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-XkmRld44P2ONU_axniGS4Q-1; Tue, 27 Sep 2022 06:38:35 -0400
X-MC-Unique: XkmRld44P2ONU_axniGS4Q-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-130ee3fa853so2544062fac.22
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TQW6LOBGPc+Yz3hy/ACoB86PrrfaqaEJkTLJ82jpikQ=;
 b=VxpHr3M7cLEBZ4Ly5yhK5mcO05t4ZJ3CA/OVSIG5ql+f8GcvEtJS+KTrlzAOiz5U7m
 enuUiGda0RMd0s3eGSHYhdLf7HeFGG4UgM346CdW5lF2yhxIIJqJPxuo4DtRs6rASWPA
 7S98hJi+Op7BNxBeUhYDoHEhcc/zBCEffM9VdKCshqXH0O6yMQ7GvaMH2S27vFmUHeBx
 vxTukcW4qCP6hl3kYHgy8AGFP+4YxTCJ/66MHQjxGhC1pwUCduE4Jvq/1rC767B08fgA
 a3hhA2uMlR1Yu17o8FAmLLu9zS3RQ5708IlQ9mPPbGOXCvr8nfJ4zM4YVVe30sKqjvyU
 aYaw==
X-Gm-Message-State: ACrzQf2gezzphhevATvy0OadRQM7hEcBxYfhnyu0kFqIBwx+XkkPumPl
 PTBe+itmc80+xfV1YzskBoVDIFbSE8VqViCBzAaQ08e2nWJp9xRV4a/jadO/jsd/xC6VbjXKydI
 m5zMuRFeoHbuPvD+vWhNlkiRWf3yTb34=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1450466oib.53.1664275114510; 
 Tue, 27 Sep 2022 03:38:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4r5OO9HeL5PbsQQGtLoNYkoV6Tl0rkPpHU3Q7P+jLcaz+YMKWa+F8KtYDDS1PCLAxMoTW0zJG3p1zicgHUfqo=
X-Received: by 2002:a05:6808:1687:b0:347:cbd3:3dcf with SMTP id
 bb7-20020a056808168700b00347cbd33dcfmr1450461oib.53.1664275114334; Tue, 27
 Sep 2022 03:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-2-pbonzini@redhat.com>
In-Reply-To: <20220927095921.261760-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 14:38:23 +0400
Message-ID: <CAMxuvazxcvB8VpTfpjfUTzbbYuJPYvM9zSLa3qsC6iW3ZwD9HA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ui: fix path to dbus-display1.h
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 1:59 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> While the source directory is always included in the include path,
> the corresponding directory in the build tree is not.  Therefore,
> custom_targets (e.g. ui/dbus-display1.h) must be referred to using
> the full path.
>
> This avoids a build failure when ui/dbus-chardev.c is not built as
> a module:
>
> In file included from ../ui/dbus-chardev.c:32:
> ../ui/dbus.h:34:10: fatal error: dbus-display1.h: No such file or directo=
ry
>    34 | #include "dbus-display1.h"
>       |          ^~~~~~~~~~~~~~~~~
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/qtest/dbus-display-test.c | 2 +-
>  ui/dbus.h                       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-t=
est.c
> index 8be5974763..cb1b62d1d1 100644
> --- a/tests/qtest/dbus-display-test.c
> +++ b/tests/qtest/dbus-display-test.c
> @@ -3,7 +3,7 @@
>  #include <gio/gio.h>
>  #include <gio/gunixfdlist.h>
>  #include "libqtest.h"
> -#include "dbus-display1.h"
> +#include "ui/dbus-display1.h"
>
>  static GDBusConnection*
>  test_dbus_p2p_from_fd(int fd)
> diff --git a/ui/dbus.h b/ui/dbus.h
> index c001c11f70..9c149e7b41 100644
> --- a/ui/dbus.h
> +++ b/ui/dbus.h
> @@ -31,7 +31,7 @@
>  #include "ui/console.h"
>  #include "ui/clipboard.h"
>
> -#include "dbus-display1.h"
> +#include "ui/dbus-display1.h"
>
>  typedef struct DBusClipboardRequest {
>      GDBusMethodInvocation *invocation;
> --
> 2.37.3
>


