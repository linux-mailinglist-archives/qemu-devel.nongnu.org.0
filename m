Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9E3FC7F2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:13:38 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3a5-00064Z-7e
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL36q-0007UN-Sv
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL36o-00079x-LU
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPyOvXzmWNqu1zBeIHlrxSjj48CxnYXRaZKrkaYUyFE=;
 b=h73rTyNx0thHBC42X67tcJT7wxDgbpRpt0U4F2xFG7Q+CIlt9urVD50RmL2vvPE5WFoLTo
 YKzpQlLZyarT1M6DGb+Ycb6TCrsI/AjX9W8pXIpzJN2hI726ZDepVnHksFtPvo40if1Khe
 V5optrKqEvmvNr2giT2uQELIW7L5EcI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-8vp_Xcc_Nxeqn2zlWd7LgA-1; Tue, 31 Aug 2021 08:43:18 -0400
X-MC-Unique: 8vp_Xcc_Nxeqn2zlWd7LgA-1
Received: by mail-pf1-f198.google.com with SMTP id
 199-20020a6215d0000000b003f957128f82so307963pfv.18
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 05:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPyOvXzmWNqu1zBeIHlrxSjj48CxnYXRaZKrkaYUyFE=;
 b=bkTyGlFlxIRkqnrnp1MfEkQpzeP1Av+GfnZMI6hnWMXAm8J9TLvVRjFbpNUYb4ngaL
 omxm8vyNeTdULgHT+VPIYS+f9seSK8hD7eFdlMKRVfWxctOHapG8wlG6HGoSYa+FDOtj
 noeNh89WGGzJ7kST2IBxr23SIkNBymAuws+IFcqP8Q0ftNgV3jopEWDHWdnaru2JbNe1
 sx+DyhRSV2w/MDWE0rXNbsIFW/vxj2Rcl/011GNe4a3nEpJBcumLUL9G6u/288I9tEtF
 DGdQGMs5amLx9NyGx5us19Aky+xIClNmSULTz0YNca6+idib1asBq+FTXj5TlTAMBROB
 NyOQ==
X-Gm-Message-State: AOAM531cYtyMmKpR7piYE8mrRpBV36oP8L5b/SEXxYHG+bTAVlaxnPJx
 ir8ZPMUoY+YIdFQcy1ORIAJQYPI7CzoCALFDZENoCOo2K4nu0NsV30A4Hq6xJz4NN0CRQzl5iwF
 rlCJGY1wGLlZVQSwsx6Tsbcla6gO12A8=
X-Received: by 2002:a17:902:7203:b0:133:ec6b:6c16 with SMTP id
 ba3-20020a170902720300b00133ec6b6c16mr4511111plb.67.1630413797781; 
 Tue, 31 Aug 2021 05:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzRACOxcOlVEzDQzpVTAtvx5GlBYCHk8FbAN7AnbfIC49dfVpR6k6V55OZ13wfZiHKQOhtHR6S+suyESFey14=
X-Received: by 2002:a17:902:7203:b0:133:ec6b:6c16 with SMTP id
 ba3-20020a170902720300b00133ec6b6c16mr4511091plb.67.1630413797476; Tue, 31
 Aug 2021 05:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
 <20210724085453.16791-9-pbonzini@redhat.com>
 <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
 <CAFEAcA-az0rOTQ1wcvseCqr3qy7Gq64VxzvnRZPVHurqunVWAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-az0rOTQ1wcvseCqr3qy7Gq64VxzvnRZPVHurqunVWAQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Aug 2021 14:43:05 +0200
Message-ID: <CABgObfbtV=hh19VUG+f4Yurt2CP96BDXOen_qQUvDE2seVsL6w@mail.gmail.com>
Subject: Re: [PULL 8/9] qapi: introduce forwarding visitor
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003c5d1705cada4bab"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c5d1705cada4bab
Content-Type: text/plain; charset="UTF-8"

Will look at it next week.

Paolo

Il lun 30 ago 2021, 17:37 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Mon, 9 Aug 2021 at 11:40, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Sat, 24 Jul 2021 at 10:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >
> > > This new adaptor visitor takes a single field of the adaptee, and
> exposes it
> > > with a different name.
> > >
> > > This will be used for QOM alias properties.  Alias targets can of
> course
> > > have a different name than the alias property itself (e.g. a machine's
> > > pflash0 might be an alias of a property named 'drive').  When the
> target's
> > > getter or setter invokes the visitor, it will use a different name than
> > > what the caller expects, and the visitor will not be able to find it
> > > (or will consume erroneously).
> > >
> > > The solution is for alias getters and setters to wrap the incoming
> > > visitor, and forward the sole field that the target is expecting while
> > > renaming it appropriately.
> > >
> > > Reviewed-by: Eric Blake <eblake@redhat.com>
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Hi; Coverity complains here (CID 1459068) that the call to
> > visit_optional() is ignoring its return value (which we check
> > in 983 out of the other 989 callsites).
>
> Ping? It would be nice to either confirm this is a false
> positive or else fix it.
>
> > > +static void forward_field_optional(Visitor *v, const char *name, bool
> *present)
> > > +{
> > > +    ForwardFieldVisitor *ffv = to_ffv(v);
> > > +
> > > +    if (!forward_field_translate_name(ffv, &name, NULL)) {
> > > +        *present = false;
> > > +        return;
> > > +    }
> > > +    visit_optional(ffv->target, name, present);
> > > +}
> >
> > Is it right, or is this its "looks like this is returning an error
> > indication" heuristic misfiring again ?
> >
> > My guess is the latter and it's caused by a mismatch
> > between the prototype of visit_optional() (returns a
> > status both by setting *present and in its return value)
> > and the Visitor::optional method (returns a status only
> > by setting *present, return void). I guess ideally we'd
> > standardize on whether these things were intended to return
> > a value or not.
>
> thanks
> -- PMM
>
>

--0000000000003c5d1705cada4bab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Will look at it next week.<div dir=3D"auto"><br></div><di=
v dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Il lun 30 ago 2021, 17:37 Peter Maydell &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha =
scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 9 Aug 2021 at 11:4=
0, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"=
_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 24 Jul 2021 at 10:00, Paolo Bonzini &lt;<a href=3D"mailto:pbon=
zini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</=
a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This new adaptor visitor takes a single field of the adaptee, and=
 exposes it<br>
&gt; &gt; with a different name.<br>
&gt; &gt;<br>
&gt; &gt; This will be used for QOM alias properties.=C2=A0 Alias targets c=
an of course<br>
&gt; &gt; have a different name than the alias property itself (e.g. a mach=
ine&#39;s<br>
&gt; &gt; pflash0 might be an alias of a property named &#39;drive&#39;).=
=C2=A0 When the target&#39;s<br>
&gt; &gt; getter or setter invokes the visitor, it will use a different nam=
e than<br>
&gt; &gt; what the caller expects, and the visitor will not be able to find=
 it<br>
&gt; &gt; (or will consume erroneously).<br>
&gt; &gt;<br>
&gt; &gt; The solution is for alias getters and setters to wrap the incomin=
g<br>
&gt; &gt; visitor, and forward the sole field that the target is expecting =
while<br>
&gt; &gt; renaming it appropriately.<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">eblake@redhat.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi; Coverity complains here (CID 1459068) that the call to<br>
&gt; visit_optional() is ignoring its return value (which we check<br>
&gt; in 983 out of the other 989 callsites).<br>
<br>
Ping? It would be nice to either confirm this is a false<br>
positive or else fix it.<br>
<br>
&gt; &gt; +static void forward_field_optional(Visitor *v, const char *name,=
 bool *present)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 ForwardFieldVisitor *ffv =3D to_ffv(v);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!forward_field_translate_name(ffv, &amp;name, =
NULL)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *present =3D false;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 visit_optional(ffv-&gt;target, name, present);<br>
&gt; &gt; +}<br>
&gt;<br>
&gt; Is it right, or is this its &quot;looks like this is returning an erro=
r<br>
&gt; indication&quot; heuristic misfiring again ?<br>
&gt;<br>
&gt; My guess is the latter and it&#39;s caused by a mismatch<br>
&gt; between the prototype of visit_optional() (returns a<br>
&gt; status both by setting *present and in its return value)<br>
&gt; and the Visitor::optional method (returns a status only<br>
&gt; by setting *present, return void). I guess ideally we&#39;d<br>
&gt; standardize on whether these things were intended to return<br>
&gt; a value or not.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div>

--0000000000003c5d1705cada4bab--


