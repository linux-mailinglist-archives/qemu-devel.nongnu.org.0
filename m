Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1F3E22C3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 07:05:30 +0200 (CEST)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBs2y-0002CJ-W3
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 01:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBs27-0001UZ-KG
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:04:35 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mBs26-0006NR-3K
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:04:35 -0400
Received: by mail-io1-xd34.google.com with SMTP id l20so7536951iom.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 22:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bUnBY6tAWP/ifZnbFHHZE0yO2YP/vTEYhaaUurb66vE=;
 b=KaXMay33b2ei8eyEIwxLwhI+w/XyCGFBLgLprpaaTBRHotpBhdHH0syVdXgnjz9vwJ
 ewBa+avFx/PLZeDSzZwhYorJ7Tn0crblOPMVwcmMzeLJUhGGPa/DsvhobrZPKy3mL1Hj
 mwg0QkyZ0a2oQ8uX1Vjn4vW5Iyxp3rFdBqggdYoeqQtHbyBQpZ+UcvvMlNQjWMWLJXd6
 fGd5hq3vyMg//ZlGSVBtcpfjKXQt54OJyjjZbX4YzKFxmfgdrfEiQnfbITDlEDf8drp1
 RCcYeuJag0BekckSMSz+ogiSyQ+kZ2GhYWwuvwWuKK/lz5h+e99/qQjS/OYbnwVE49Hv
 /KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bUnBY6tAWP/ifZnbFHHZE0yO2YP/vTEYhaaUurb66vE=;
 b=tVsXZAW9Qzuwx9miy2x8aCOZywgoAipqqIDeiTOgMXWVtPpibP9yzeb4TYNs+uDFH1
 bn0c4V8Gjd2KHISvDovP/EMqqWv9TjF6fbMW1iSzzzx5/af4VfN9VdcMJGrTB4cpialM
 +vmdBXbQUFBnfi77Vp/s5jhT/vEGp1ZJMtXJpWvp9hwfDjWKdfz4tlds81Ibri5ysH7m
 fCf4fG1jfhi8XLfXqlaHi+JzawSLHt/h7wiWjGvANMfJWv8GL47UKx0NKhOdy+Os63Ky
 DL9QmDYXIVM35pc3FvMrbA/js4y5pMRIixvPvTRPgtLT/tPGIl/ne9IQUwrMmqEjvG5o
 JfVg==
X-Gm-Message-State: AOAM5339D+97kFXCUUhXH9aXMKlBi0DhHERBDmtp1Tumxk4Elwimc7xj
 2HXIa/u4u6M5FkG5uSEKpZyoehNsqJrXWos2QNM=
X-Google-Smtp-Source: ABdhPJwHeKQZWW7etUF/4LmzUQY8JpW5qZLpvhBVyi1s9pXDV8+xJhkDAQyYN0QIFkI5XbMgf2ADhUcQR7Z4R4rMST4=
X-Received: by 2002:a5d:9304:: with SMTP id l4mr339179ion.167.1628226272996;
 Thu, 05 Aug 2021 22:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210805092350.31195-1-david@redhat.com>
In-Reply-To: <20210805092350.31195-1-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 6 Aug 2021 07:04:22 +0200
Message-ID: <CAM9Jb+jfUSz1573-qNb7E-1rcv4+91NxKSgqNO_AAnifa6Jomg@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd34.google.com
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
 Qemu Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> When adding RAM_NORESERVE, we forgot to remove the old assertion when
> adding the updated one, most probably when reworking the patches or
> rebasing. We can easily crash QEMU by adding
>   -object memory-backend-ram,id=3Dmem0,size=3D500G,reserve=3Doff
> to the QEMU cmdline:
>   qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>   Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>   =3D=3D 0' failed.
>
> Fix it by removing the old assertion.
>
> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in q=
emu_ram_mmap()")
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>
> v1 -> v2:
> - Added rbs
> - Tagged for 6.1 inclusion
>
> ---
>  softmmu/physmem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3c1912a1a0..2e18947598 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, =
ram_addr_t max_size,
>      RAMBlock *new_block;
>      Error *local_err =3D NULL;
>
> -    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) =
=3D=3D 0);
>      assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
>                            RAM_NORESERVE)) =3D=3D 0);
>      assert(!host ^ (ram_flags & RAM_PREALLOC));
> --
> 2.31.1

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

>
>

