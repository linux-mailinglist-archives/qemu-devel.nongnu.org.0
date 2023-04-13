Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2EC6E11DC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:11:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzWs-0005Td-77; Thu, 13 Apr 2023 12:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmzWq-0005TK-Gc
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pmzWi-0001mB-5Z
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681402219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzI5Djihiamq4UONUlRddj95cHV/F1kzqEokFZjiCEY=;
 b=JxdUSWBPcT8mBSjwkSnOemWdT3paWAtMpCSmXv0QZ7zrKgIcEYgFGV4VOoCwCXCDXIkKXs
 KCZPkLc0eIru7N14m3XN5m1v+vyChG2eqQ8mrjtvONKrluFyy4YHNvfYsZ4XKqczABYNjj
 PPCSIa7FaHWAjypdEyi3Omo8M1RjMVE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-0RHt2VzZPf-fYV1QXFeHyA-1; Thu, 13 Apr 2023 12:10:17 -0400
X-MC-Unique: 0RHt2VzZPf-fYV1QXFeHyA-1
Received: by mail-pg1-f198.google.com with SMTP id
 j192-20020a638bc9000000b0051b10b20cebso4740098pge.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681402217; x=1683994217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzI5Djihiamq4UONUlRddj95cHV/F1kzqEokFZjiCEY=;
 b=HMuEsSFN1klE2C0PJsFIXHbcRZvsS3GM2Omu1+ho5G/4G8acvwaDLU/SqqnPnJ/RWu
 XFKEXhOJRH4S8pVeN/28IBMtPbthN3bYsq5f3Hnzsk+HLP5weNLzaiE4JnjgE2Gax56E
 0rxsZJR0jsMGz83eS/VAalbw0EYzbUZrojnbPXBs2d4hlDBZHA1lpiedTI59kCRwL2Fv
 uj2v3M2iCOhWBHeeZs//bZwCFUmx+NCoow6ei9eBdsTwTUToui2b/Go3PYDlvj0QtMN3
 2Iawn0JVHHDCQUKthoEn4rGo8yhaWv+zVdSgvZAOcxMT7mWI2XJMGHEU2nSpK7fgGmEr
 R9Rg==
X-Gm-Message-State: AAQBX9dK/1Re/RMWre2gLVp12Qpb8Bsk97SjFXX43kreIXHRQcLcx/Ge
 O/poB8elI1l1epx29oWIg2dV1pxKfu8WVSP99Hku3TAhkrVHN5tuwSvtz3gMFPK5c0jbBJDtLrM
 HlaXbOwjgfFYSj5ekXyGjHIadvdyiIxQ=
X-Received: by 2002:a17:903:4051:b0:1a2:6e4d:7831 with SMTP id
 n17-20020a170903405100b001a26e4d7831mr823019pla.12.1681402216788; 
 Thu, 13 Apr 2023 09:10:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350bOKYQ7giD/5ToBmpehUy6rKF9dh1woUA+S6zk1atu4hmmoXgaWfoT4OBt0ErSnsvfBxfFw/H8BaoyyMko0pRk=
X-Received: by 2002:a17:903:4051:b0:1a2:6e4d:7831 with SMTP id
 n17-20020a170903405100b001a26e4d7831mr823001pla.12.1681402216424; Thu, 13 Apr
 2023 09:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <20230328211119.2748442-2-jsnow@redhat.com>
 <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
In-Reply-To: <d49d0152-ff58-a317-7eca-a243ed080ca0@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 13 Apr 2023 12:10:05 -0400
Message-ID: <CAFn=p-bWE7Qyc0POiYrbJROVZK_MeW=gCotq6Y+93FRTjzCWLQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] python: add mkvenv.py
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Wed, Mar 29, 2023 at 8:56=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On 3/28/23 23:11, John Snow wrote:

> > +            for entry_point in entry_points:
> > +                # Python 3.8 doesn't have 'module' or 'attr' attribute=
s
> > +                if not (hasattr(entry_point, 'module') and
> > +                        hasattr(entry_point, 'attr')):
> > +                    match =3D pattern.match(entry_point.value)
> > +                    assert match is not None
> > +                    module =3D match.group('module')
> > +                    attr =3D match.group('attr')
> > +                else:
> > +                    module =3D entry_point.module
> > +                    attr =3D entry_point.attr
> > +                yield {
> > +                    'name': entry_point.name,
> > +                    'module': module,
> > +                    'import_name': attr,
> > +                    'func': attr,
>
> What about using a dataclass or namedtuple instead of a dictionary?
>

I suppose what I meant was: Once 3.8 is our minimum, we can delete
most of this compat code anyway, so there may not be a point in
creating a new type-safe structure to house it. I can definitely add
that in if you'd like, but I suppose I felt like a dict was "good
enough" for now, since 3.7 will also get dropped off the face of the
earth soon, too.

Before I send a non-RFC patch I'll get everything scrubbed down with
the usual pylint/mypy/isort/flake8 combo, and if I wind up needing to
for type safety I will add something.

Or if you are requesting it specifically. :~)

> >
> > +
> > +    try:
> > +        entry_points =3D _get_entry_points()
> > +    except ImportError as exc:
> > +        logger.debug("%s", str(exc))
> > +        raise Ouch(
> > +            "Neither importlib.metadata nor pkg_resources found, "
> > +            "can't generate console script shims.\n"
> > +            "Use Python 3.8+, or install importlib-metadata, or setupt=
ools."
> > +        ) from exc
>
> Why not put this extra try/except inside _get_entry_points()?

Hm, no good reason, apparently. O:-) I've fixed this one up.


Unrelated question I'm going to tuck in here:

For the script generation, I am making another call to mkvenv.py using
the venv'ified python to do final initializations. As part of that, I
pass the binpath to the script again because I wasn't sure it was safe
to compute it again myself. CPython seems to assume it's always going
to be env_path/Scripts/ or env_path/bin/, but I wasn't 1000% sure that
this wasn't patched by e.g. Debian or had some complications with the
adjustments to site configuration in recent times. I'll circle back
around to investigating this, but for now I've left it with the dumber
approach of always passing the bindir.


