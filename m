Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152165A0AE8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:03:52 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7q5-00049g-QF
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oR7lX-0000YC-P1
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oR7lV-0002r2-U4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661414341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5NDkWIELAuAnyo+031qSOHi9lJIG+3TuTYwxR0SzP8I=;
 b=GEwtgKrfN9WDcW2e2nCjHeJsT+GmTU1i7/95lSvzLZtf7dwsMnCDrqG3oo3vYe+XdxIFoJ
 zT6hA9kYPbysUnhWQT32EBAzoKSL3mZCuvHtQQbZxD8Kt0P3AOaGxcd8/hjHv0PODtzypA
 H/hCW5lwy2oo/yr9NAfai+CjH65mtmU=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-DxKEnKZIMXSEhkL-6N99ow-1; Thu, 25 Aug 2022 03:58:59 -0400
X-MC-Unique: DxKEnKZIMXSEhkL-6N99ow-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-10ecd047e39so6209749fac.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 00:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5NDkWIELAuAnyo+031qSOHi9lJIG+3TuTYwxR0SzP8I=;
 b=CaqxNLZ5sesL+b2fqmCbdXLc/FVTqTwo749u5Vvr9sY58wq8lSlH+k/8Ex8DwdQI6k
 LVwNWjXp4IW9fBQYhARPrnuinnr5SdFjEmwz/rZnj83Xk/KKWp5bvBFI0JNqzVVHMGvf
 nOy7DBh0TBF7Q0FEGyYlKS48jeG1OfZvWyXM+P0llWl1xZV2DALaLUXVJSNlEZgWMwmX
 +sx462oXYPK1qn7ebSqMxCq0pXlioIDlV+4pRFYJacy8lNneln8Y+Jcs62BpNE+j5yca
 B5ApHLiNhlDnOicERQTupbboqguL5XadcwDVQ7Y4TF0o812eCP3X0tv9whEtTszHOMCR
 Mb7w==
X-Gm-Message-State: ACgBeo3CL2Amht1Yb7DjC/JTyMGOX6zSub4nKyWxqa1NYDhnNJerkROb
 eH3+ciSZ8QyFgnvJTokSHXVwhYN2gEA+e9V3EeOAMVY/5TYv2Ug6UUW9HJ2HOiM9uYQf5Fr4uk/
 RDe/AoLuLt6ECJDrAz4CSvE3VwbRJGZI=
X-Received: by 2002:a05:6870:e24e:b0:11c:d9f5:44 with SMTP id
 d14-20020a056870e24e00b0011cd9f50044mr1369478oac.53.1661414338350; 
 Thu, 25 Aug 2022 00:58:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YxDnKHcxknP6X8bhHfAhqb76/zKW2jjrq3XLJHIN4yQZShCZwGfwDPVl39+u5fDCiMz+wUwQ6/UORk99MwmM=
X-Received: by 2002:a05:6870:e24e:b0:11c:d9f5:44 with SMTP id
 d14-20020a056870e24e00b0011cd9f50044mr1369473oac.53.1661414338190; Thu, 25
 Aug 2022 00:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-41-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-41-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 25 Aug 2022 11:58:47 +0400
Message-ID: <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
Subject: Re: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi

On Wed, Aug 24, 2022 at 1:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> not allow the same file to be opened again by CreateFile() from
> another QEMU process with the same options when the previous QEMU
> process still holds the file handle openned.

opened

>
> As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
> such use case. This change makes the behavior be consisten with the
> POSIX platforms.
>

consistent

> [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---


What's the benefit to allow multiple processes write access to the
same file? It seems it could easily lead to corruption or unexpected
results.

To me, it's the other way around, the POSIX implementation should
learn to lock the file opened for write..

>
>  chardev/char-file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/char-file.c b/chardev/char-file.c
> index 2fd80707e5..66385211eb 100644
> --- a/chardev/char-file.c
> +++ b/chardev/char-file.c
> @@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,
>          flags = CREATE_ALWAYS;
>      }
>
> -    out = CreateFile(file->out, accessmode, FILE_SHARE_READ, NULL, flags,
> -                     FILE_ATTRIBUTE_NORMAL, NULL);
> +    out = CreateFile(file->out, accessmode, FILE_SHARE_READ | FILE_SHARE_WRITE,
> +                     NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);
>      if (out == INVALID_HANDLE_VALUE) {
>          error_setg(errp, "open %s failed", file->out);
>          return;
> --
> 2.34.1
>


