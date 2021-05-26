Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA98390D9C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:57:43 +0200 (CEST)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhri-0006rb-IB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llhlG-0005XQ-51
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:51:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llhlE-0004xo-3f
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:51:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id q16so1477742pls.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 17:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zkAEwDHhAsom+6rBtODViIuiliXdA9/gM93EyK+S3xQ=;
 b=cNIeH81dLAgvAHzNn3hyZq57JYMzGJtcOLCg2TjS3jp2ar0Z05drQkJRmcQsMpCFOS
 gzBQ0YHdyL+F8/FZ2VVRcLWp6+ypQCEqqGA6GBObg2ceG66+1w7lhiOzQuccaKFpiF7h
 95wUGHaDk3Ww6zL/uLuFYOcyIAcDiqoQiB/PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zkAEwDHhAsom+6rBtODViIuiliXdA9/gM93EyK+S3xQ=;
 b=rTbscJxP8jYJv4dNYHLMAFx3WlvpI2wH+nrsi7xFb/QdGwpzG7ec3CtpY0pqz9kHRo
 83pxbo6bZmvZTbzU/adLG7sU3i15bmGfi6b34aKWViRPvOQY39r4RVkLOQMxzGckvSgC
 miFbfY9qgPQ7XapNm0X74thWvjdKsKSR77SIQlAer1RMaQnogvKPoSRlxXR3yJqFSYKJ
 sdgcheSnGxk3rCoOPGy9qWfWNwoU7JDtgyhayjUify3iHyv+dkmotM34XiLjUeXi2wQU
 t9QQ27kHz3UivmeAAGQIrQF2A6iZhZa564XKowzoKi80hBGUkCtMR5+9NEdZz9kFC4i9
 uOQA==
X-Gm-Message-State: AOAM531xepNgTGbPKnGMXyfq1IVbK+P/H+C7REGcl3eyqka8ihNQz52Y
 BtRF2CGnx4nybr5GE6PIzFfWIMQZEF6cWaE+p/ubKmFh0OQ=
X-Google-Smtp-Source: ABdhPJxQEr9UNRti3bJitus+dXsat2M7EoGMo569rUUls4krqQjOjgHlQKyCgD8QRKMAhuNhwH7ZwSTcpyzI0dB/6cY=
X-Received: by 2002:a17:90a:4545:: with SMTP id
 r5mr1104729pjm.51.1621990257587; 
 Tue, 25 May 2021 17:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-6-yamamoto@midokura.com>
 <7e603e70-00f6-2a73-48cc-ea70212a531f@vivier.eu>
In-Reply-To: <7e603e70-00f6-2a73-48cc-ea70212a531f@vivier.eu>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Wed, 26 May 2021 09:50:46 +0900
Message-ID: <CAH=wFzSBxJzCeZ_0pCV5SZVwT_c0oJF8tv26pu=3t81DLd44pQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] linux-user: Implement pivot_root
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 5:22 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 24/05/2021 =C3=A0 06:54, YAMAMOTO Takashi a =C3=A9crit :
> > Used by runc.
> >
> > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > ---
> >  linux-user/syscall.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 2947e79dc0..e739921e86 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -35,6 +35,7 @@
> >  #include <sys/prctl.h>
> >  #include <sys/resource.h>
> >  #include <sys/swap.h>
> > +#include <sys/syscall.h>
>
> we don't need that include, see below
>
> >  #include <linux/capability.h>
> >  #include <sched.h>
> >  #include <sys/timex.h>
> > @@ -8254,6 +8255,11 @@ static int host_to_target_cpu_mask(const unsigne=
d long *host_mask,
> >      return 0;
> >  }
> >
> > +static int pivot_root(const char *new_root, const char *put_old)
> > +{
> > +    return syscall(SYS_pivot_root, new_root, put_old);
> > +}
>
> Better to use:
>
> #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
> _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
> #endif

ok. i haven't noticed the _syscall2 macro in this file. thank you.

>
> > +
> >  /* This is an internal helper for do_syscall so that it is easier
> >   * to have a single return point, so that actions, such as logging
> >   * of syscall results, can be performed.
> > @@ -13222,6 +13228,23 @@ static abi_long do_syscall1(void *cpu_env, int=
 num, abi_long arg1,
> >          return ret;
> >  #endif
> >
> > +#if defined(TARGET_NR_pivot_root)
> > +    case TARGET_NR_pivot_root:
> > +        {
> > +            void *p2;
> > +            p =3D lock_user_string(arg1); /* new_root */
> > +            p2 =3D lock_user_string(arg2); /* put_old */
> > +            if (!p || !p2) {
> > +                ret =3D -TARGET_EFAULT;
> > +            } else {
> > +                ret =3D get_errno(pivot_root(p, p2));
> > +            }
> > +            unlock_user(p2, arg2, 0);
> > +            unlock_user(p, arg1, 0);
> > +        }
> > +        return ret;
> > +#endif
> > +
> >      default:
> >          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> >          return -TARGET_ENOSYS;
> >
>
> Thanks,
> Laurent
>

