Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223B3C1A82
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:23:32 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aYV-0002Dy-8n
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1aBt-0001O2-1g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:00:09 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1aBp-0003J6-Ig
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:00:08 -0400
Received: by mail-io1-xd2f.google.com with SMTP id q2so9655168iot.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRnj42TRBTz4rdyXOVF4HeyK0o7qDeYNhKQQAOzXK34=;
 b=T7djNK71nFajrR89q/IowrIbnA9EC7VC48J+a6AJpKNFjj1v/YMTmr7IWGVWdY86s5
 OtDKGAXufxLHLe0S/Awov0xd34VOCVv+m1T1AABz73fsik3AKkjBID2yhsJMsEyxDxEK
 ecXnTZZ9sVjQicAgFyPkmPtLfFV+FLqNyY/UM+ugS26rkx33k6uQWEuenz7JuQhIi5Dl
 +H8eLaMNj+hVwF7ZLfQuJrVnaeUb7dYp63pvCrXaDl9EADvoVZxb+8PIP9HLT9PxcvVw
 6s9FRCaqsU7Z5Iq9Y3TvB7i+UvhP41RDYk8lDQ8797YtyeEm1qdq8vjQXMApZm2nXGGq
 /PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRnj42TRBTz4rdyXOVF4HeyK0o7qDeYNhKQQAOzXK34=;
 b=WHJVJRHuqIh4mNGhO8WTh/HDjR6fT9XHBgJwxN5Huib60USNa70agWQpNxwwIuayPX
 sr6xxLk636gDs/2zm7c9935mrRcXTtoGh5/iItkeNZKt/5HXf5MwHar4YZsfU82SctIU
 SGYUy1qNtdebiJ8bGAC8p3x1oYFd9ho5h9yrkVspiSns+8JZDKZWI9GIEtEi5DhsarHO
 axuu9GN8xUiFX8DPIoAJy70XFjpihxPIIhhSyh0pdBcsgaW3H+xVhX5wQdiLyLPs65sK
 MFUmQdIrvFYzrpIFV7kBU7f7yc/chVlSu+3xY25QvcPDBLM8YXtq1PAarMr1ci7QkPJS
 I4rQ==
X-Gm-Message-State: AOAM530igmER6zUFcgyIHsS/mJyhcJ6Aw7cps8ly2ebdqmEYrYI2a6NC
 qbyfjaLVs+A2EyJ5PDt0IVdRgLBxLEHiF3+7gHo=
X-Google-Smtp-Source: ABdhPJzFCI/+qRiwP7t50uLO+AV+sSsjmuxs99W2TWJDASWRPbP3/4zdKiV+inAmO9dmwqcllMzHHdN8cwwjjE1wz+4=
X-Received: by 2002:a6b:d00b:: with SMTP id x11mr9416925ioa.167.1625774403895; 
 Thu, 08 Jul 2021 13:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210708115157.6907-1-yang.zhong@intel.com>
In-Reply-To: <20210708115157.6907-1-yang.zhong@intel.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 8 Jul 2021 21:59:52 +0200
Message-ID: <CAM9Jb+hxMHC395_H-o-tf6NS+xa3TeDpnOGJja2yvJp6ySStdw@mail.gmail.com>
Subject: Re: [PATCH v2] remote/memory: Replace share parameter with ram_flags
To: Yang Zhong <yang.zhong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
> qemu_ram_alloc_from_fd()")
>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/remote/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 472ed2a272..6e21ab1a45 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>          subregion = g_new(MemoryRegion, 1);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       RAM_SHARED, msg->fds[region],
>                                         sysmem_info->offsets[region],
>                                         errp);
>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

