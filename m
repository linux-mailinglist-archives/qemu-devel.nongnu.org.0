Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC163508CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:07:38 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCrg-0000V4-N3
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhCQu-0003ad-2x
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nhCQr-0001pl-L3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650469193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5HfuBmYpWNoofDwGnI9/MrUZyvEuNj+bGRo42Ka9G8=;
 b=Ul+hqj6zcN7VMcaFckJpvlSvtHnTnsaxYs7dCUL6e5h9Y5LA3slxr9NZa/X5WTisQc7Mwp
 VCFfZYBbm+2xLCmWrnizZc/+frJ7wiYaOYm5J1TuNXZXhZNZ6OLtYLbsP+5Vrr0mHvS9su
 0+mWH/pIrOSBpLT/f/UvEiiJe/D1mTs=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-wCVTzOCGNr2wiWKn_hYXCQ-1; Wed, 20 Apr 2022 11:39:51 -0400
X-MC-Unique: wCVTzOCGNr2wiWKn_hYXCQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 128-20020a250286000000b00641d48351fbso1762644ybc.23
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S5HfuBmYpWNoofDwGnI9/MrUZyvEuNj+bGRo42Ka9G8=;
 b=Ydi20uYZAieDAMMY2X7i132jwVShKhiSsa+tMn5cg/MW9lE9W5lrp+HOtobXzEW/oj
 Q/wvjrh3qJEWDJUZdkVBHN2ccoj/uQ+0igvOLPdLjdkjTJTPwnqCESS4E0k14TNKzkjM
 +W3LD2DmCMdAuOjEFvTfipqT337smvk/3V/19eFsrHlvRf8rnhPMhpjD5pIAEE1y3mkf
 3tITVKKdEIm9yR9eHAMxAoFEr8mWAPQnKESJnjpXzl7DmqlnGXuxzLXB5YM5XvyKn2Fu
 3IWja8pCtAG912Gk4J5r+vP3HirT8b08sMxl4WhuwRpk2tpHWB9C254vEEqdeFJ4HYub
 12Og==
X-Gm-Message-State: AOAM530/SoD88x5UuMiCAZOxxNDNBQV/nNpLsWR1MSpxGylFc+dRUK0d
 oOjbo89WIc9u51AZhkVuV6U5//H80Ik5yAIiwHZ4drjUHdmUupsBh5ReO9TLrhg0/kPEm28oVqA
 dEcyose55MuSMZUFL1fj04m7Q9TG5KTg=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr21456419ywd.445.1650469190813; 
 Wed, 20 Apr 2022 08:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznzD4/z3aZcwtmiSWyDpcRnRCbr93j60OG3MxpvU6Vjg6JuY+mtvMfYn4MfwX+YzUS2tLbh4l85QlBakoH/U8=
X-Received: by 2002:a0d:cdc6:0:b0:2f1:47b9:ce93 with SMTP id
 p189-20020a0dcdc6000000b002f147b9ce93mr21456400ywd.445.1650469190572; Wed, 20
 Apr 2022 08:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-21-marcandre.lureau@redhat.com>
 <YmAnz/Bqd5lWSxUo@redhat.com>
In-Reply-To: <YmAnz/Bqd5lWSxUo@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Apr 2022 19:39:39 +0400
Message-ID: <CAMxuvaxMnX57nUQdsvy8Uu7K=3CAvzCar2JciLtvYrbJTEYKrQ@mail.gmail.com>
Subject: Re: [PATCH 20/41] include: move qemu_msync() to osdep
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 20, 2022 at 7:33 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Apr 20, 2022 at 05:26:03PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The implementation depends on the OS. (and longer-term goal is to move
> > cutils to a common subproject)
>
> Common with what other thing(s) ?

This is down the line, but my initial focus was to make qemu-ga a
subproject() (I have a wip/poc branch, so it is possible!)

For that I moved all qapi/qmp-related stuff in another subproject().

We could further split the qapi/qmp subproject (qemu-common?). This
"common" subproject could be used by libvhost-user for example.

Various helper binaries could also become subprojects at some point. I
haven't looked at all possibilities, there is already a lot of
preliminary cleanup to take care of :)

thanks

>
> IMHO alot of cutils should just go away in favour of using more glib
> APIs, and/or be split up, since its a random bag of largely unrelated
> bits.
>
>
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/cutils.h |  1 -
> >  include/qemu/osdep.h  | 13 +++++++++++++
> >  util/cutils.c         | 38 --------------------------------------
> >  util/oslib-posix.c    | 18 ++++++++++++++++++
> >  util/oslib-win32.c    | 10 ++++++++++
> >  5 files changed, 41 insertions(+), 39 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> >
> > diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> > index e873bad36674..fb47ec931876 100644
> > --- a/include/qemu/cutils.h
> > +++ b/include/qemu/cutils.h
> > @@ -130,7 +130,6 @@ const char *qemu_strchrnul(const char *s, int c);
> >  #endif
> >  time_t mktimegm(struct tm *tm);
> >  int qemu_fdatasync(int fd);
> > -int qemu_msync(void *addr, size_t length, int fd);
> >  int qemu_parse_fd(const char *param);
> >  int qemu_strtoi(const char *nptr, const char **endptr, int base,
> >                  int *result);
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index 14b6b65a5fa9..bf4f75dcde8f 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -641,6 +641,19 @@ static inline void qemu_reset_optind(void)
> >  #endif
> >  }
> >
> > +/**
> > + * Sync changes made to the memory mapped file back to the backing
> > + * storage. For POSIX compliant systems this will fallback
> > + * to regular msync call. Otherwise it will trigger whole file sync
> > + * (including the metadata case there is no support to skip that other=
wise)
> > + *
> > + * @addr   - start of the memory area to be synced
> > + * @length - length of the are to be synced
> > + * @fd     - file descriptor for the file to be synced
> > + *           (mandatory only for POSIX non-compliant systems)
> > + */
> > +int qemu_msync(void *addr, size_t length, int fd);
> > +
> >  /**
> >   * qemu_get_host_name:
> >   * @errp: Error object
> > diff --git a/util/cutils.c b/util/cutils.c
> > index a01a3a754049..c0775bb53c29 100644
> > --- a/util/cutils.c
> > +++ b/util/cutils.c
> > @@ -160,44 +160,6 @@ int qemu_fdatasync(int fd)
> >  #endif
> >  }
> >
> > -/**
> > - * Sync changes made to the memory mapped file back to the backing
> > - * storage. For POSIX compliant systems this will fallback
> > - * to regular msync call. Otherwise it will trigger whole file sync
> > - * (including the metadata case there is no support to skip that other=
wise)
> > - *
> > - * @addr   - start of the memory area to be synced
> > - * @length - length of the are to be synced
> > - * @fd     - file descriptor for the file to be synced
> > - *           (mandatory only for POSIX non-compliant systems)
> > - */
> > -int qemu_msync(void *addr, size_t length, int fd)
> > -{
> > -#ifdef CONFIG_POSIX
> > -    size_t align_mask =3D ~(qemu_real_host_page_size() - 1);
> > -
> > -    /**
> > -     * There are no strict reqs as per the length of mapping
> > -     * to be synced. Still the length needs to follow the address
> > -     * alignment changes. Additionally - round the size to the multipl=
e
> > -     * of PAGE_SIZE
> > -     */
> > -    length +=3D ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
> > -    length =3D (length + ~align_mask) & align_mask;
> > -
> > -    addr =3D (void *)((uintptr_t)addr & align_mask);
> > -
> > -    return msync(addr, length, MS_SYNC);
> > -#else /* CONFIG_POSIX */
> > -    /**
> > -     * Perform the sync based on the file descriptor
> > -     * The sync range will most probably be wider than the one
> > -     * requested - but it will still get the job done
> > -     */
> > -    return qemu_fdatasync(fd);
> > -#endif /* CONFIG_POSIX */
> > -}
> > -
> >  static int64_t suffix_mul(char suffix, int64_t unit)
> >  {
> >      switch (qemu_toupper(suffix)) {
> > diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> > index c471c5bc9f8d..161f1123259f 100644
> > --- a/util/oslib-posix.c
> > +++ b/util/oslib-posix.c
> > @@ -950,3 +950,21 @@ int fcntl_setfl(int fd, int flag)
> >      }
> >      return 0;
> >  }
> > +
> > +int qemu_msync(void *addr, size_t length, int fd)
> > +{
> > +    size_t align_mask =3D ~(qemu_real_host_page_size() - 1);
> > +
> > +    /**
> > +     * There are no strict reqs as per the length of mapping
> > +     * to be synced. Still the length needs to follow the address
> > +     * alignment changes. Additionally - round the size to the multipl=
e
> > +     * of PAGE_SIZE
> > +     */
> > +    length +=3D ((uintptr_t)addr & (qemu_real_host_page_size() - 1));
> > +    length =3D (length + ~align_mask) & align_mask;
> > +
> > +    addr =3D (void *)((uintptr_t)addr & align_mask);
> > +
> > +    return msync(addr, length, MS_SYNC);
> > +}
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index f38b06914e12..1e05c316b311 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -596,3 +596,13 @@ size_t qemu_get_host_physmem(void)
> >      }
> >      return 0;
> >  }
> > +
> > +int qemu_msync(void *addr, size_t length, int fd)
> > +{
> > +    /**
> > +     * Perform the sync based on the file descriptor
> > +     * The sync range will most probably be wider than the one
> > +     * requested - but it will still get the job done
> > +     */
> > +    return qemu_fdatasync(fd);
> > +}
> > --
> > 2.35.1.693.g805e0a68082a
> >
> >
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


