Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0C34EE9AE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:22:06 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCXl-0001E0-0Q
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:22:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1naCKG-0004so-TV
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1naCKE-0005LE-ET
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OF9qc1B4ftcfm8m1hcHNJ5Z0J7KB7BFltscwFu77QT4=;
 b=J35kfZkM3GGrFhMrWd5xupUyMrB7wuWB9+PpoOQIf1rGHtTn1jAnL1MUlUV07qMlOLyIfV
 ehAXaGpLzurqRNcsiM/jvgAV8cKIaE/8oIepr9MtQQDakLzeBbqmZyhtpBRlSxrQgBrLn0
 a+ztejOrY158VCEHjlkoMEhXTcHYBkg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-QTqF5ZJZPgukN_ElYemnSQ-1; Fri, 01 Apr 2022 04:08:03 -0400
X-MC-Unique: QTqF5ZJZPgukN_ElYemnSQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 y189-20020a6264c6000000b004faecedcb81so1250349pfb.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 01:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OF9qc1B4ftcfm8m1hcHNJ5Z0J7KB7BFltscwFu77QT4=;
 b=m5yr5PT9AnPASBprqHO6aWSbUJIyh2YN7tW5zZqfU3LhS3rrKCZ+Yb8wKhkRydeVuh
 TiY5MTMd9Vtj1uNSkuVUxZM9bc+xAFIyCylt9CkK4bJSXZLGnbc4wVQvbDFMlh31t6IL
 YD/kh/VmscGRKtZmbhF9tf4bXs5JF7hlEiXnVP8J64KFLBkv/N6HAQtj99MiXN9WdmYZ
 T6PCf+vl5lot2HAZpp5g3gaLPcmI/MNEpSeLtp0iDB/g053tb2+lE0TS0xvo4jbneR5L
 k1dWD03dDrSGouRex5rd3v8J/eooLi9YT/hHmJnNBCy50xDEByGxx8FcOrvxQnYJ9237
 45hg==
X-Gm-Message-State: AOAM533NBibPLERwO5R97fpkX1CizdiLyZVRKnME7bm+vwi2ThvFj6KU
 fjoCYoaOTwRdQOK45wEUZ9wQlObaXyF8t+a0bD/4UC2XoLCtvuvtXj0HHibCmIM+TpatBF33ca9
 r1xdnNU+E0RV5GiSzB7Aa5sS4q71RvJQ=
X-Received: by 2002:a17:902:e5c3:b0:154:3776:f274 with SMTP id
 u3-20020a170902e5c300b001543776f274mr8757904plf.100.1648800482746; 
 Fri, 01 Apr 2022 01:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx4BEXz/4MQZwX4ybEuBXYhCHFG8jcWEAsUNOhdbB2MHckAbK1eherg+yf9BCD/bSzEjv9v0XjJOqqgi8qt7k=
X-Received: by 2002:a17:902:e5c3:b0:154:3776:f274 with SMTP id
 u3-20020a170902e5c300b001543776f274mr8757882plf.100.1648800482408; Fri, 01
 Apr 2022 01:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
In-Reply-To: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 1 Apr 2022 10:07:51 +0200
Message-ID: <CABgObfbu3MK6SCNGOFGGHWO72e3dYygUybgyavALKq5_pnWK0A@mail.gmail.com>
Subject: Re: use of uninitialized variable involving visit_type_uint32() and
 friends
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f4cf405db9347b6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f4cf405db9347b6
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 7:35 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Coverity warns about use of uninitialized data in what seems
> to be a common pattern of use of visit_type_uint32() and similar
> functions. Here's an example from target/arm/cpu64.c:
>
> static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char
> *name,
>                                    void *opaque, Error **errp)
> {
>     ARMCPU *cpu = ARM_CPU(obj);
>     uint32_t max_vq;
>     if (!visit_type_uint32(v, name, &max_vq, errp)) {
>         return;
>     }
>     [code that does something with max_vq here]
> }
>
> This doesn't initialize max_vq, on the apparent assumption
> that visit_type_uint32() will do so. But that function [...]
> reads the value of *obj (the uninitialized max_vq).
>

The visit_type_* functions are written to work for both getters and setters.
For the leaves, that means potentially reading uninitialized data.  It is
harmless but very ugly, and with respect to static analysis it was all but
a time bomb, all the time.

The best (but most intrusive) solution would be to add a parameter to all
visit_type_* functions with the expected "direction" of the visit, which
could be checked against v->type.

That is:

bool visit_type_uint32(VisitorType expected_type, Visitor *v, const char
*name, uint32_t *obj,
                       Error **errp)
{
    uint64_t value;
    bool ok;

    trace_visit_type_uint32(v, name, obj);
    assert (v->type == expected_type);
    if (expected_type & (VISITOR_INPUT | VISITOR_DEALLOC)) {
        value = *obj;
    }
    ok = visit_type_uintN(v, &value, name, UINT32_MAX, "uint32_t", errp);
    assert (ok || expected_type == VISITOR_INPUT);
    if (expected_type & VISITOR_OUTPUT) {
        *obj = value;
    }
    return ok;
}

Probably also renaming VISITOR_* to V_* for conciseness.  That *should*
quiesce Coverity, and also add some runtime checks.

Paolo

--0000000000000f4cf405db9347b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:x-small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2=
022 at 7:35 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Coverity warns about use of uninitialized data in=
 what seems<br>
to be a common pattern of use of visit_type_uint32() and similar<br>
functions. Here&#39;s an example from target/arm/cpu64.c:<br>
<br>
static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *nam=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque, Error **e=
rrp)<br>
{<br>
=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);<br>
=C2=A0 =C2=A0 uint32_t max_vq;<br>

=C2=A0 =C2=A0 if (!visit_type_uint32(v, name, &amp;max_vq, errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 [code that does something with max_vq here]<br>
}<br>
<br>
This doesn&#39;t initialize max_vq, on the apparent assumption<br>
that visit_type_uint32() will do so. But that function <span class=3D"gmail=
_default" style=3D"font-family:monospace,monospace;font-size:x-small">[...]=
<br></span> reads the value of *obj (the uninitialized max_vq).<br></blockq=
uote><div><br></div><div style=3D"font-family:monospace,monospace;font-size=
:x-small" class=3D"gmail_default">The visit_type_* functions are written to=
 work for both getters and setters.</div><div style=3D"font-family:monospac=
e,monospace;font-size:x-small" class=3D"gmail_default">For the leaves, that=
 means potentially reading uninitialized data.=C2=A0 It is</div><div style=
=3D"font-family:monospace,monospace;font-size:x-small" class=3D"gmail_defau=
lt">harmless but very ugly, and with respect to static analysis it was all =
but</div><div style=3D"font-family:monospace,monospace;font-size:x-small" c=
lass=3D"gmail_default">a time bomb, all the time.<br></div><div style=3D"fo=
nt-family:monospace,monospace;font-size:x-small" class=3D"gmail_default"><b=
r></div><div style=3D"font-family:monospace,monospace;font-size:x-small" cl=
ass=3D"gmail_default">The best (but most intrusive) solution would be to ad=
d a parameter to all</div><div style=3D"font-family:monospace,monospace;fon=
t-size:x-small" class=3D"gmail_default">visit_type_* functions with the exp=
ected &quot;direction&quot; of the visit, which</div><div style=3D"font-fam=
ily:monospace,monospace;font-size:x-small" class=3D"gmail_default">could be=
 checked against v-&gt;type.</div><div style=3D"font-family:monospace,monos=
pace;font-size:x-small" class=3D"gmail_default"><br></div><div style=3D"fon=
t-family:monospace,monospace;font-size:x-small" class=3D"gmail_default">Tha=
t is:</div><div style=3D"font-family:monospace,monospace;font-size:x-small"=
 class=3D"gmail_default"><br></div><div style=3D"font-family:monospace,mono=
space;font-size:x-small" class=3D"gmail_default"><span class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:x-small"></span>bool=
 visit_type_uint32(VisitorType expected_type, Visitor *v, const char *name,=
 uint32_t *obj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Error **errp)<br>
{<br>
=C2=A0 =C2=A0 uint64_t value;<br>
=C2=A0 =C2=A0 bool ok;<br>
<br>
=C2=A0 =C2=A0 trace_visit_type_uint32(v, name, obj);</div><div style=3D"fon=
t-family:monospace,monospace;font-size:x-small" class=3D"gmail_default">=C2=
=A0 =C2=A0 assert (v-&gt;type =3D=3D expected_type);</div><div style=3D"fon=
t-family:monospace,monospace;font-size:x-small" class=3D"gmail_default">=C2=
=A0=C2=A0=C2=A0 if (expected_type &amp; (VISITOR_INPUT | VISITOR_DEALLOC)) =
{</div><div style=3D"font-family:monospace,monospace;font-size:x-small" cla=
ss=3D"gmail_default">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D *=
obj;</div><div style=3D"font-family:monospace,monospace;font-size:x-small" =
class=3D"gmail_default">=C2=A0=C2=A0=C2=A0 }<br></div><div style=3D"font-fa=
mily:monospace,monospace;font-size:x-small" class=3D"gmail_default">=C2=A0 =
=C2=A0 ok =3D visit_type_uintN(v, &amp;value, name, UINT32_MAX, &quot;uint3=
2_t&quot;, errp);<br>
<div style=3D"font-family:monospace,monospace;font-size:x-small" class=3D"g=
mail_default"><div style=3D"font-family:monospace,monospace;font-size:x-sma=
ll" class=3D"gmail_default">=C2=A0=C2=A0=C2=A0 assert (ok || expected_type =
=3D=3D VISITOR_INPUT);</div><div style=3D"font-family:monospace,monospace;f=
ont-size:x-small" class=3D"gmail_default"></div>=C2=A0=C2=A0=C2=A0 if (expe=
cted_type &amp; VISITOR_OUTPUT) {</div><div style=3D"font-family:monospace,=
monospace;font-size:x-small" class=3D"gmail_default">=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0 *obj =3D value;</div><div style=3D"font-family:monospace,monospa=
ce;font-size:x-small" class=3D"gmail_default">=C2=A0=C2=A0=C2=A0 }<br></div=
>=C2=A0 =C2=A0 return ok;<br>
}</div><div style=3D"font-family:monospace,monospace;font-size:x-small" cla=
ss=3D"gmail_default"><br></div><div style=3D"font-family:monospace,monospac=
e;font-size:x-small" class=3D"gmail_default">Probably also renaming VISITOR=
_* to V_* for conciseness.=C2=A0 That *should*</div><div style=3D"font-fami=
ly:monospace,monospace;font-size:x-small" class=3D"gmail_default">quiesce C=
overity, and also add some runtime checks.<br></div><div style=3D"font-fami=
ly:monospace,monospace;font-size:x-small" class=3D"gmail_default"><br></div=
><div style=3D"font-family:monospace,monospace;font-size:x-small" class=3D"=
gmail_default">Paolo<br></div></div></div>

--0000000000000f4cf405db9347b6--


