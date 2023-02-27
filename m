Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A956A4716
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgSJ-0002um-CC; Mon, 27 Feb 2023 11:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWgSF-0002l2-T3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWgSD-00059E-7d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677515653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T81GTvH+jYMvlyNStXMKmqhiUAkJHMM2pEdT6Zr4cgg=;
 b=a/yAWuR0LKfCNYSSx3ukkgVF7OidiWNBR/QM34OfyYOP//eqve4KpWryvlLVMbaYvlzi8l
 t5rXWZxANX7tbSTwyy+5QCI3dfyY4+VGD+sRl2AVRDZ8cJQWjaA+UilLrk++w+HvFiofPk
 z6T/fLdwtRwe+fVSt0SRigsDkwMH7eM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-zGpvr8EHN3ug47nQ2tGHnA-1; Mon, 27 Feb 2023 11:34:11 -0500
X-MC-Unique: zGpvr8EHN3ug47nQ2tGHnA-1
Received: by mail-io1-f71.google.com with SMTP id
 g21-20020a6be615000000b0074cb292f57dso4281480ioh.17
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T81GTvH+jYMvlyNStXMKmqhiUAkJHMM2pEdT6Zr4cgg=;
 b=D63Ysva072DOrDQw2aSw6rL0QrLoxSWHGQdoCvEKlUXxYgrh3CTgXJsqV8uS8YZQmJ
 lTqi2b9kkuSLEMXqFVKwdWuu21ETCPO6Spz2cQ9Rl/VE+NZ6uivecQfCIWdgDUWVpAsu
 klJtFZqxS1ch7ep4el0s6FAMbdNaIvWKja8gDk5Rtxbb4s4juKWgKI2KRd6lmr5d66Fm
 3OcdVEg3Ye4BWdk4HYcaJVS45dSH3dfX03O5gja0fHdcjHvvQU2qMfKhc2RrPTd1/vQy
 FkesRQoYqFQ4NMQc0/OHq2Gcz+JQv82+Dz6IJb1SLkJD5RTXC0mOErLljxea68ccFVJW
 VZaA==
X-Gm-Message-State: AO0yUKWXn7dfiLBfypedaLiRc3iBh0Z8IcgH/4rf4rJ6gFv8SRKNWMim
 6ddihwayMMkOu12ANfJ7H6UJyMefq0VFTZUwD6DnBN/whOMdWP5L6jH/yect/AYl9cE232/i3o2
 +738jSfgOFoUE9m8=
X-Received: by 2002:a05:6e02:152a:b0:315:4793:f7b3 with SMTP id
 i10-20020a056e02152a00b003154793f7b3mr72722ilu.13.1677515650666; 
 Mon, 27 Feb 2023 08:34:10 -0800 (PST)
X-Google-Smtp-Source: AK7set96L3NnFB+9lgUFdQm1QdMt2Zme0MeQs8dIjGW1XjriKGHwUr+ED9Q70ZYFpFUk4U1FzQL4Ag==
X-Received: by 2002:a05:6e02:152a:b0:315:4793:f7b3 with SMTP id
 i10-20020a056e02152a00b003154793f7b3mr72701ilu.13.1677515650429; 
 Mon, 27 Feb 2023 08:34:10 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m7-20020a924a07000000b00312f2936087sm2072991ilf.63.2023.02.27.08.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:34:09 -0800 (PST)
Date: Mon, 27 Feb 2023 09:34:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Message-ID: <20230227093409.2ad3abb2.alex.williamson@redhat.com>
In-Reply-To: <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
 <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 27 Feb 2023 16:04:16 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 27 Feb 2023 at 15:46, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> >
> > On Mon, 27 Feb 2023 11:32:57 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> > =20
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> =20
> >
> > Empty commit logs are a pet peeve of mine, there must be some sort of
> > motivation for the change, something that changed to make this
> > possible, or perhaps why this was never necessary.  Thanks, =20
>=20
> I generally agree, but "this file doesn't actually need to
> include this header" seems straightforward enough that the commit
> subject says everything you'd want to say about it.
> The underlying reason is going to be one of:
>  * this used to be needed, but somewhere along the line the
>    thing the file needs moved to a different header
>  * this used to be needed, but the code in the file changed
>    and no longer uses the thing the header was providing
>  * this was never needed, and the include was just cut-n-pasted
>    from a different file when the file was originally written
>=20
> Tracking down which of those is the case for every single
> "file is including unnecessary headers" cleanup seems like
> a lot of work trawling through git histories and doesn't
> really provide any interesting information.

OTOH, not providing any justification shows a lack of due diligence.
Even a justification to the extent of "This passes gitlab CI across all
architectures after removing the include" or copying from the cover
letter to explain that this include is the only reason the file is
built per target would be an improvement.

I find that empty commit logs create a barrier to entry for
participation in a project, there is always some motivation that can
help provide a better commit that doesn't force an undue burden on the
submitter.  Thanks,

Alex


