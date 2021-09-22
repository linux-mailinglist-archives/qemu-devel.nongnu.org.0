Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5721415071
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:24:54 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7rR-0001O8-KW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT7iH-0005sO-RF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT7iF-0002C0-F0
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632338122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXnux09JI4hDK4azp02tpAGhnUl9TPuHr/rlssKhzL4=;
 b=ieHxY7/yKXAPL1XtAee7qw8r5RIxAA7z3PzzPPwhHDYC6cXPl21XMLV8RsoYc+5iXfRlZm
 p/GLUmV5rNY5m523sfkrDdlWuY+GvPelYJyvfEXsHG2sY4kcyecANQOzydc3joku3MHVnd
 1PBeoCm545jHXtkQTQ6hhBoyQ/xs5nE=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-en7P4ZvJPX-xuF2lWjPnqA-1; Wed, 22 Sep 2021 15:15:21 -0400
X-MC-Unique: en7P4ZvJPX-xuF2lWjPnqA-1
Received: by mail-oi1-f198.google.com with SMTP id
 bd4-20020a056808220400b00268fe826fffso2350546oib.13
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXnux09JI4hDK4azp02tpAGhnUl9TPuHr/rlssKhzL4=;
 b=1YKN8m9xjQ0v8cE+Z8qSGCUKuQLpUPTbl/rItKjGalmafr8mX9lRa7903UsIPBE52A
 i8Crjd+FOy1tdal+eiIuCXvISUtWGlDM4Jm1AF5KIH5yghHMBfj7fI1RUyG4/MfAxZK+
 3gjy3rrO+wSPywyw54w2YiJ8hJmz8xs9wrX7aFa16T8+/TxTCeV8txK7oyXy66QZIxW7
 ceO/ksFPGzoOvmZMnKuwiM4lAApDvzztw70lo391vHRMswkVmw9m1fnUv2ezLqNAr28O
 OGRKGyJ/WTMMrm8J5Hlrja0/xRtcyV70JHz9USdAn4YMSlx8B1IGYrJfUmoA78y9Y/e0
 XObA==
X-Gm-Message-State: AOAM530dG5by+lwD9MafAl1pJIX9Ro/y6xP6zRDExTRWLnv3bODK3Act
 BIJKOsmYGrwBFMScx5Bssa4N3dmR6MOnTGyvaEnJphkOu0NOc0dbzYww+gv3aPv7dGx4PBBPZ5z
 I1hElfG/RXsX9CfF2umt7oRINhMpSktA=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr731940ots.252.1632338120348; 
 Wed, 22 Sep 2021 12:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8nVnRZYEZRh5Z+p5OcDclVXgN6IC0+Rg1wH/logFFoS7we6o+EJdCVabMkMvdJAP1owgdj0XSSUHAJey/28E=
X-Received: by 2002:a05:6830:310c:: with SMTP id
 b12mr731924ots.252.1632338120154; 
 Wed, 22 Sep 2021 12:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-4-jsnow@redhat.com>
 <5d44034d-d629-95cb-4a54-8e2785d94439@redhat.com>
In-Reply-To: <5d44034d-d629-95cb-4a54-8e2785d94439@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 15:15:09 -0400
Message-ID: <CAFn=p-ZMgTLK4aGrO-T8=1Z-CZ7fayE+XOHpqxYOnPZg_w0teg@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] iotests/migrate-bitmaps-postcopy-test: declare
 instance variables
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ce374005cc9a5535"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ce374005cc9a5535
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 4:37 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> > index 00ebb5c251..9c00ae61c8 100755
> > --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> > +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> > @@ -115,6 +115,9 @@ class
> TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
> >           self.vm_a_events =3D []
> >           self.vm_b_events =3D []
> >
> > +        self.discards1_sha256: str
> > +        self.all_discards_sha256: str
> > +
> >       def start_postcopy(self):
> >           """ Run migration until RESUME event on target. Return this
> event. """
> >           for i in range(nb_bitmaps):
>
> Isn=E2=80=99t this obsolete after e2ad17a62d9da45fbcddc3faa3d6ced519a9453=
a?
>
> Hanna
>
>
Yes, my apologies.

--js

--000000000000ce374005cc9a5535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 4:37 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.09.2=
1 06:09, John Snow wrote:<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3=
 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/=
tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test<br>
&gt; index 00ebb5c251..9c00ae61c8 100755<br>
&gt; --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test<br>
&gt; +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test<br>
&gt; @@ -115,6 +115,9 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMP=
TestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm_a_events =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm_b_events =3D []<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.discards1_sha256: str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.all_discards_sha256: str<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def start_postcopy(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Run migrati=
on until RESUME event on target. Return this event. &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in range(nb_bitmaps):<br=
>
<br>
Isn=E2=80=99t this obsolete after e2ad17a62d9da45fbcddc3faa3d6ced519a9453a?=
<br>
<br>
Hanna<br>
<br></blockquote><div><br></div><div>Yes, my apologies.</div><div><br></div=
><div>--js<br></div></div></div>

--000000000000ce374005cc9a5535--


