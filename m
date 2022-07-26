Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6658124E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:49:46 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGJ4G-00020G-Bi
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIso-0003be-9Q
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIsk-00088F-Ag
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658835465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlKYOBSxKQylXqNGELKFnaG3nWvlj69KMN+KrzoU1GM=;
 b=AAvT4WiN08yuR4GH1ps9WP9yhiKOTbSaT3kqRp2BHWrBvAXOUCWYYOCjgV171ArAJUPsDD
 MB4GXRiQd4/W9tMl6Rvm2zaU8Q7RAaiesTA4sEsypJbU3/E4uZAMx6JAzD+Bm66xdVs10h
 wFC/dFPxFdGdEysJ+Xfgf2nT4SM7SIw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-45z8lqRRMoOSfa_l0w_Dtg-1; Tue, 26 Jul 2022 07:37:44 -0400
X-MC-Unique: 45z8lqRRMoOSfa_l0w_Dtg-1
Received: by mail-oi1-f200.google.com with SMTP id
 s19-20020a056808209300b0033ac2da4062so3935190oiw.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LlKYOBSxKQylXqNGELKFnaG3nWvlj69KMN+KrzoU1GM=;
 b=Quzqiy4ROKCGIUhrhF+8Dk4f4G1RSUYcBpA/W0kJj4FE0SlnuispzTyTuGz2EJEPpt
 /WbyiyauOgCBWhPESj3C+XwWQHpz81aYx5j6XKE/Zi+Y2WYCNtN14jtkfTKUrKALP5so
 NGNziboLDPPI93G9PDS3BRa4YgdDBOlvaRvRmtDkYx3oqU5TnIqO2q3xobE6aO1hlsDA
 4ZPMiVN2hfrJSxGDCIPYV9j+vVGOFdEQ4olb0VId5I9h1+FSqpXzMCoFdqhOT4c5t8DG
 uKFZVrVPyVMO2jj4Isd2IVXuAotOBrlkAf7XRjr/B70f0E3k76KfXrRKawOn09QdaN/y
 w/jA==
X-Gm-Message-State: AJIora9G4jTrpRYiEvw0hSipTf/6mQ67jbmGyDBD4cmZoF/kSPj3WNUf
 SDM1jewyuZ2eqMyFfOOVoaWmdzDUSZ8TGKeOzVaY1eJ+FWmxyEF2EWKIvhhGJ4EsPIbYTGMgHdv
 jSQolykskhNHgZUqYg5fiWlVomo7L2gk=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6186685otp.38.1658835463313; 
 Tue, 26 Jul 2022 04:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQqKAzYbnPtwf8GuPLmWhz5z2y3iUGGbX9+lsBNSH35wxjoAa3RaVs9UPZuCF6X7mf4F51jI24utVMxceEIOc=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6186671otp.38.1658835463114; Tue, 26
 Jul 2022 04:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-5-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-5-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:37:32 +0400
Message-ID: <CAMxuvazsOKrqZwU4RUcbPAdvk8+Kd7U4TRA0WbPYPoZAg=mPiw@mail.gmail.com>
Subject: Re: [PATCH v4 04/17] dump: Rework get_start_block
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> get_start_block() returns the start address of the first memory block
> or -1.
>
> With the GuestPhysBlock iterator conversion we don't need to set the
> start address and can therefore remove that code. The only
> functionality left is the validation of the start block so it only
> makes sense to re-name the function to validate_start_block()
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 35b9833a00..b59faf9941 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1498,30 +1498,22 @@ static void create_kdump_vmcore(DumpState *s, Err=
or **errp)
>      }
>  }
>
> -static ram_addr_t get_start_block(DumpState *s)
> +static int validate_start_block(DumpState *s)
>  {
>      GuestPhysBlock *block;
>
>      if (!s->has_filter) {
> -        s->next_block =3D QTAILQ_FIRST(&s->guest_phys_blocks.head);
>          return 0;
>      }
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        /* This block is out of the range */
>          if (block->target_start >=3D s->begin + s->length ||
>              block->target_end <=3D s->begin) {
> -            /* This block is out of the range */
>              continue;
>          }
> -
> -        s->next_block =3D block;
> -        if (s->begin > block->target_start) {
> -            s->start =3D s->begin - block->target_start;
> -        } else {
> -            s->start =3D 0;
> -        }
> -        return s->start;
> -    }
> +        return 0;
> +   }
>
>      return -1;
>  }
> @@ -1668,8 +1660,8 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,
>          goto cleanup;
>      }
>
> -    s->start =3D get_start_block(s);
> -    if (s->start =3D=3D -1) {
> +    /* Is the filter filtering everything? */
> +    if (validate_start_block(s) =3D=3D -1) {
>          error_setg(errp, QERR_INVALID_PARAMETER, "begin");
>          goto cleanup;
>      }
> --
> 2.34.1
>


