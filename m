Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C706C4F6E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:30:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0O2-0002vq-Re; Wed, 22 Mar 2023 11:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pf0O1-0002vf-01
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pf0Ny-0003es-Cq
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679498901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ff4a6K6wgC2XdVM/KxOAbUlwV5TGxDxmCGpnoUKmzb4=;
 b=b9vz6t7/fs6tN/Q37SEB1kPoYDBvRT6CXljLMxgoX03GFh5qa2lqshgyJ+wqUs2TjG+g8d
 hAQqWoxcV50bvRjbCRpX+VY3YB4eEor3gaGFQkVv8LqGQXjY+7Y9CRjq/A65onNFNQWLvL
 JlRlN1Xt8dzAdrvOge5p4eGmbnsxV0M=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-96NvENDJP_SHRpfU869C8g-1; Wed, 22 Mar 2023 11:28:19 -0400
X-MC-Unique: 96NvENDJP_SHRpfU869C8g-1
Received: by mail-pg1-f197.google.com with SMTP id
 k1-20020a632401000000b0050beb8972bfso4712030pgk.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679498899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ff4a6K6wgC2XdVM/KxOAbUlwV5TGxDxmCGpnoUKmzb4=;
 b=Xp1CgeqrkC5879fVWVBVAJ7w/urhI0aIsrps4ETdQi0TtBGRVzyCqD7DOhGJaaHlLl
 umAZNyhb5dlk58ewfu7qxbSDizEAX47dxnaKRrjtQwf4a3ITg0wOX9bkC/9ux97u2aKp
 cznEuWcNIl8GCHqyl5VKLRs1BB3bZOOSrAfH+7rgz9TDabguP3kCTiD/YSoIDV8Cwj8Y
 DlM3OjqsxEIODOUAb7ynpN3B5xKpctFrj15O6ZfdONGG3h7a6uu8FWRTbdINb/vy0Djb
 sjtATw0EKXj9S2dOHEAiS5yQT9CKZIzIjKBP+XdiR7gS869Dd2IuIL29Q6SEs4pIWC8f
 3yQQ==
X-Gm-Message-State: AO0yUKVWNpsaxi358+yRSsLmy+iEyRxX1D3kwV3jnY5147oSlR2HuU2a
 fIznpTklUrFBUcq4KLrTDfZV4u27dacs+eoN007ZqWEnR+m6+P2BT0N8JyhGxYSRRuIEpWAM4E0
 +I/jyhGSM1xXGoddM+gw9zlRYJXBBW5A=
X-Received: by 2002:a05:6a00:1791:b0:624:3ff:db10 with SMTP id
 s17-20020a056a00179100b0062403ffdb10mr2051877pfg.5.1679498898915; 
 Wed, 22 Mar 2023 08:28:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bHp/PPDvl4flVpp6/sNifIvtCpHqqA1LJGW0koi88+6TNtuQKXHuTE2U2FwSbXDTfRwfsluNqKltoBAnE6GU=
X-Received: by 2002:a05:6a00:1791:b0:624:3ff:db10 with SMTP id
 s17-20020a056a00179100b0062403ffdb10mr2051864pfg.5.1679498898629; Wed, 22 Mar
 2023 08:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230322142132.22909-1-aesteve@redhat.com>
 <20230322142132.22909-3-aesteve@redhat.com>
 <d2562114-ba21-a1ad-ab84-17693e2d3f24@redhat.com>
In-Reply-To: <d2562114-ba21-a1ad-ab84-17693e2d3f24@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 22 Mar 2023 16:28:07 +0100
Message-ID: <CADSE00+jkAUk3XGzVx89q22DbtAmxU5BcTgn8V9OKr_oFPx6Yg@mail.gmail.com>
Subject: Re: [PATCH 02/12] MAINTAINERS: Add virtio-video section
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fmartine@redhat.com, 
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000040feff05f77ecf8d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000040feff05f77ecf8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 3:46=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:

> On 22/03/2023 15.21, Albert Esteve wrote:
> > From: Peter Griffin <peter.griffin@linaro.org>
> >
> > Add myself as maintainer of the virtio-video files added
> > in this series.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >   MAINTAINERS | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9b56ccdd92..c6cc04c4f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2176,6 +2176,14 @@ F: hw/virtio/vhost-user-gpio*
> >   F: include/hw/virtio/vhost-user-gpio.h
> >   F: tests/qtest/libqos/virtio-gpio.*
> >
> > +virtio-video
> > +M: Albert Esteve <aesteve@redhat.com>
> > +S: Supported
> > +F: hw/display/vhost-user-video.c
> > +F: hw/display/vhost-user-video-pci.c
> > +F: include/hw/virtio/vhost-user-video.h
> > +F: tools/vhost-user-video/*
>
> Please add tests/qtest/libqos/virtio-video.* here, too.
>
>   Thomas
>
>
>
Right. Will do for the next version, thanks!

--00000000000040feff05f77ecf8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 22, 2023 at 3:46=
=E2=80=AFPM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 22/03/2023 15.21, Albert Esteve wrote:<br>
&gt; From: Peter Griffin &lt;<a href=3D"mailto:peter.griffin@linaro.org" ta=
rget=3D"_blank">peter.griffin@linaro.org</a>&gt;<br>
&gt; <br>
&gt; Add myself as maintainer of the virtio-video files added<br>
&gt; in this series.<br>
&gt; <br>
&gt; Signed-off-by: Peter Griffin &lt;<a href=3D"mailto:peter.griffin@linar=
o.org" target=3D"_blank">peter.griffin@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS | 8 ++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 9b56ccdd92..c6cc04c4f7 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -2176,6 +2176,14 @@ F: hw/virtio/vhost-user-gpio*<br>
&gt;=C2=A0 =C2=A0F: include/hw/virtio/vhost-user-gpio.h<br>
&gt;=C2=A0 =C2=A0F: tests/qtest/libqos/virtio-gpio.*<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +virtio-video<br>
&gt; +M: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=3D"=
_blank">aesteve@redhat.com</a>&gt;<br>
&gt; +S: Supported<br>
&gt; +F: hw/display/vhost-user-video.c<br>
&gt; +F: hw/display/vhost-user-video-pci.c<br>
&gt; +F: include/hw/virtio/vhost-user-video.h<br>
&gt; +F: tools/vhost-user-video/*<br>
<br>
Please add tests/qtest/libqos/virtio-video.* here, too.<br>
<br>
=C2=A0 Thomas<br>
<br>
<br></blockquote><div><br></div><div>Right. Will do for the=C2=A0next versi=
on, thanks!</div></div></div>

--00000000000040feff05f77ecf8d--


