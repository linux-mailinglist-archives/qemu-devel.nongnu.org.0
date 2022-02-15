Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CF4B7B75
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:55:02 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7eu-0005Fy-Ua
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7dU-0004ad-Sm
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7dR-0005Em-LN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644969208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeiBt5O8Wx0z3A5vviFvDmZPUpuqlWFuy40tnovxmmI=;
 b=ZTeT1p+s5KoUHZTV/1iYZrRMUHQD0KXmmo8kfXre0cpfRti2XfG0Qeg9iVscKeUHk2MrsQ
 sZNwwOzbvvLiHcNT6wxJdmN1NQyP1c/mP518arCRElH3YaccRo8l1KxNIkcVWSYBrF+PBZ
 urS93CdUCCDTmjqcJKVC2KrgPzkAFYE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-JtYvxo5FMb2Ax0FZMRPu3g-1; Tue, 15 Feb 2022 18:53:27 -0500
X-MC-Unique: JtYvxo5FMb2Ax0FZMRPu3g-1
Received: by mail-ua1-f72.google.com with SMTP id
 a16-20020ab03c90000000b0033c71cc6a2cso290328uax.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 15:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LeiBt5O8Wx0z3A5vviFvDmZPUpuqlWFuy40tnovxmmI=;
 b=XlM6bicGMuQBal/LAN1eRLJOAMj5b6DWZ/qCJJh05CJJpIr2jdXlNinOE4QI2ItsRj
 qo27NThJ4CpUCAOGXgWU7FOghQfbFsdVlDFa3N4dpIyz7gorKZRK+etizBlmgD4KIdI7
 Y4Y3ZnIcxfoorHYqX0d80cjqOQiNy/W3DNkqK9jp7kAVkf18K6z9/+CXu0eqjsg/MaUO
 Rd6BR0g4sAQf3l1OQmWRQEd/Ku1GZhzy+ZIrzW3Jo9A/UcwV8RNMBQqfSaZP1GuinGP0
 BCqQlxnCYUIZkFGbPC2I7aF7J+kcHH4l2d1i6M0MqKYZfgLRTgVX9GcmtM7haA9p1c7n
 Vo/g==
X-Gm-Message-State: AOAM530vX2HAlq4xYKHACGh8iOLyeaWtPWInx2nYW7qqAB6vdJdWbJ7T
 oWVVwq7bAS0jY34L1PYmuK5ffhBccJVfQr8HSUIG7qIOsecVvVh2sBRYeaxcs8uToGE0IgGwmVy
 Y3nHiBh7p64H/jakL8pGrWu0oO8sgbHg=
X-Received: by 2002:a9f:3dc7:0:b0:33d:1812:15ac with SMTP id
 e7-20020a9f3dc7000000b0033d181215acmr37387uaj.79.1644969206521; 
 Tue, 15 Feb 2022 15:53:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyclthbg7wN/OX57t7HDMA6ru6Fl242+bD5mFl97xOM5pzHmxfh5iIHL+m2iZ1tPCB1+KMO4S2K8+9TtRULh04=
X-Received: by 2002:a9f:3dc7:0:b0:33d:1812:15ac with SMTP id
 e7-20020a9f3dc7000000b0033d181215acmr37380uaj.79.1644969206219; Tue, 15 Feb
 2022 15:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-2-jsnow@redhat.com>
 <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
In-Reply-To: <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 18:53:15 -0500
Message-ID: <CAFn=p-be7D7DW3cxti3oC60EjhgPAeXyDhHW4owcEWb_Mvf-gQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] python/utils: add enboxify() text decoration utility
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 5:55 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:
> > >>> print(enboxify(msg, width=3D72, name=3D"commit message"))
> > =E2=94=8F=E2=94=81 commit message =E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> > =E2=94=83 enboxify() takes a chunk of text and wraps it in a text art b=
ox that =E2=94=83
> > =E2=94=83  adheres to a specified width. An optional title label may be=
 given, =E2=94=83
> > =E2=94=83  and any of the individual glyphs used to draw the box may be=
        =E2=94=83
>
> Why do these two lines have a leading space,
>
> > =E2=94=83 replaced or specified as well.                               =
        =E2=94=83
>
> but this one doesn't?  It must be an off-by-one corner case when your
> choice of space to wrap on is exactly at the wrap column.
>

Right, you're probably witnessing the right-pad *and* the actual space.

> > =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/utils/__init__.py | 58 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__=
.py
> > index 7f1a5138c4b..f785316f230 100644
> > --- a/python/qemu/utils/__init__.py
> > +++ b/python/qemu/utils/__init__.py
> > @@ -15,7 +15,10 @@
> >  # the COPYING file in the top-level directory.
> >  #
> >
> > +import os
> >  import re
> > +import shutil
> > +import textwrap
> >  from typing import Optional
> >
> >  # pylint: disable=3Dimport-error
> > @@ -23,6 +26,7 @@
> >
> >
> >  __all__ =3D (
> > +    'enboxify',
> >      'get_info_usernet_hostfwd_port',
> >      'kvm_available',
> >      'list_accel',
> > @@ -43,3 +47,57 @@ def get_info_usernet_hostfwd_port(info_usernet_outpu=
t: str) -> Optional[int]:
> >          if match is not None:
> >              return int(match[1])
> >      return None
> > +
> > +
> > +# pylint: disable=3Dtoo-many-arguments
> > +def enboxify(
> > +        content: str =3D '',
> > +        width: Optional[int] =3D None,
> > +        name: Optional[str] =3D None,
> > +        padding: int =3D 1,
> > +        upper_left: str =3D '=E2=94=8F',
> > +        upper_right: str =3D '=E2=94=93',
> > +        lower_left: str =3D '=E2=94=97',
> > +        lower_right: str =3D '=E2=94=9B',
> > +        horizontal: str =3D '=E2=94=81',
> > +        vertical: str =3D '=E2=94=83',
> > +) -> str:
> > +    """
> > +    Wrap some text into a text art box of a given width.
> > +
> > +    :param content: The text to wrap into a box.
> > +    :param width: The number of columns (including the box itself).
> > +    :param name: A label to apply to the upper-left of the box.
> > +    :param padding: How many columns of padding to apply inside.
> > +    """
>
> Where's theh :param docs for the 6 custom glyphs?
>

Omitted as kinda-sorta-uninteresting. I can add them if we decide we
want this series.
(It's admittedly a bit of a "Hey, what do you think of this?")

> > +    if width is None:
> > +        width =3D shutil.get_terminal_size()[0]
> > +    prefix =3D vertical + (' ' * padding)
> > +    suffix =3D (' ' * padding) + vertical
> > +    lwidth =3D width - len(suffix)
> > +
> > +    def _bar(name: Optional[str], top: bool =3D True) -> str:
> > +        ret =3D upper_left if top else lower_left
> > +        right =3D upper_right if top else lower_right
> > +        if name is not None:
> > +            ret +=3D f"{horizontal} {name} "
> > +
> > +        assert width is not None
> > +        filler_len =3D width - len(ret) - len(right)
> > +        ret +=3D f"{horizontal * filler_len}{right}"
> > +        return ret
> > +
> > +    def _wrap(line: str) -> str:
> > +        return os.linesep.join([
> > +            wrapped_line.ljust(lwidth) + suffix
> > +            for wrapped_line in textwrap.wrap(
> > +                    line, width=3Dlwidth, initial_indent=3Dprefix,
> > +                    subsequent_indent=3Dprefix, replace_whitespace=3DF=
alse,
> > +                    drop_whitespace=3DFalse, break_on_hyphens=3DFalse)
>
> Always nice when someone else has written the cool library function to
> do all the hard work for you ;)  But this is probably where you have the =
off-by-one I called out above.
>

Yeah, I just didn't want it to eat multiple spaces if they were
present -- I wanted it to reproduce them faithfully. The tradeoff is
some silliness near the margins.

Realistically, if I want something any better than what I've done
here, I should find a library to do it for me instead -- but for the
sake of highlighting some important information, this may be
just-enough-juice.

--js


