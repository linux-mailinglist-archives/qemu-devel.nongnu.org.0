Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E46DB9D1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 11:23:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl4m3-00057q-5y; Sat, 08 Apr 2023 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pl4m0-00057I-NS
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 05:22:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pl4ly-0004On-R3
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 05:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680945733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGP0y+SaPekxP1kD3NlTbAXEbA3CZ4hH0/9Z5w5XwBo=;
 b=e4Tw1Vm7pMPgw8iNtsKELi59CRvHXWYHiu7mo0N8vN9Tw/HhGPol8gkSwmi6sotkbZbOEV
 5E7XKYbBgOp+HgO55WvxU58VR0H10Kqfa5y04Y+MgdlUlJn6oy8w0UU3WbKQf0VFGt0UE0
 cj0b3fviE08wrz+oZ0Khu1L12ydwh7U=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-ZH6_5jeYN4CHh-fpwNTczA-1; Sat, 08 Apr 2023 05:22:11 -0400
X-MC-Unique: ZH6_5jeYN4CHh-fpwNTczA-1
Received: by mail-ot1-f70.google.com with SMTP id
 h21-20020a9d7995000000b00694299f6ea9so317623otm.19
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 02:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680945731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZGP0y+SaPekxP1kD3NlTbAXEbA3CZ4hH0/9Z5w5XwBo=;
 b=T7f+Al872OroU5+2u2vtSxPk/fM5CoBGNAIt2disoBs210b2LhLqw6642vWdNVSFNV
 h9kG+O+6Aah5maN3lhjCn/iDTc7mxfy2o6QR4eK+gEkfLdJgwfx1e503eGtUppOED9bN
 hZGqWVvrtkNnR/5QluuQyC9wcNfRi9g9G9Kz/2Vtxxj1Z177YVP+tmtQ4MM4g84c7VvW
 5aX+PI7gmsuMiGW6ckItcy6erF/9mX0Im51TfpULs34OOULTbzYEXLj5REbzmzHYuGcT
 muupBdeRkUHe3WseIJ8aswVvJ3dK7LxZQFyAqzIhDe86SVKO4mKUeFh/jgv9/mGxdx0X
 pXNA==
X-Gm-Message-State: AAQBX9c8A5dCHFE/wX2tNbZb/73jy8OZu9HUXbOOT1wtBd5nabqG7EAz
 8oc/N0YhBpYJ4d3pxSzTcItWVRlNQSmhMFGG3yWn83PnBpOwjAB9N6mUrsXrtKGwtLKGQu8ittX
 gCOvIABonBiSiH0IoJm0aoyzUvMVNS2o=
X-Received: by 2002:a05:6870:971e:b0:184:2e38:c7af with SMTP id
 n30-20020a056870971e00b001842e38c7afmr439365oaq.3.1680945731012; 
 Sat, 08 Apr 2023 02:22:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZhcBD79FyMovWcOWkEuovzxMMlMqeQgkLsY/ohCbJFbNt2ielppqAiBwSrNCx+gqUfEMRku9nqutb/2N6ia1I=
X-Received: by 2002:a05:6870:971e:b0:184:2e38:c7af with SMTP id
 n30-20020a056870971e00b001842e38c7afmr439360oaq.3.1680945730719; Sat, 08 Apr
 2023 02:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230327173058.199027-1-casantos@redhat.com>
 <ZCHZjfytWZ6pPzpk@redhat.com>
In-Reply-To: <ZCHZjfytWZ6pPzpk@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Sat, 8 Apr 2023 06:21:59 -0300
Message-ID: <CAC1VKkOn-DowAnszwzV_aRgsNQUYTOSwHti1ADAm0oyr8VNSXQ@mail.gmail.com>
Subject: Re: [PATCH V2] tracing: install trace events file only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 2:59=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Mon, Mar 27, 2023 at 02:30:58PM -0300, casantos@redhat.com wrote:
> > From: Carlos Santos <casantos@redhat.com>
> >
> > It is not useful when configuring with --enable-trace-backends=3Dnop.
> >
> > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > ---
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

I updated the patch to fix the array comparison and add a missing comma.

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


