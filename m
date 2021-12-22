Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8347D932
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 23:13:51 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n09rq-0002kw-Ig
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 17:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n09px-0000eG-2r
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n09pu-0003le-6b
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640211109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6qPSAtpOAImAvRiidbOon+xm6zVl14NT0GIWuhRcEk=;
 b=EqYSuRg6KnF9JDah5mQYb1K9Wwlfdr/sETtb61IONj1sGReGiLGhe4V734yCbIsrsVYA/H
 UH59TpGBEcjQuW2cQiLgQxS0clp/vp4WhH+GTqGkp6SgimClwsbn4b4vmRQRJt9HKwtySP
 lpiDGcRuDdNQjWIqjBIPK8RLq1YGqvI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-6RIPuEX9NdenwmNmo7UnGA-1; Wed, 22 Dec 2021 17:11:47 -0500
X-MC-Unique: 6RIPuEX9NdenwmNmo7UnGA-1
Received: by mail-pf1-f198.google.com with SMTP id
 c6-20020aa781c6000000b004a4fcdf1d6dso2259522pfn.4
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6qPSAtpOAImAvRiidbOon+xm6zVl14NT0GIWuhRcEk=;
 b=NQrzIvJsl5nYYwtoaRQOa5ah9f6KqwY4lqc285emkRhPknwCnINanYqfvytHpAV5Vj
 iWqL4x/QSjrgmoCyq4EH4PKkes6hNtui4JrzahA3BlW4OAr9yI1B+G2fYFx59Xchrc7P
 T0xWiX8LRYeRzdV8TlbMp8GTU09flUnUWnKmJtyDo34ofcY0LXXdbSJfXb03e/Fdsev5
 dRp+53/4QIxc3yQDi+wiOHHqoTCbtfJkjyuQ2oamdCwP500UFrb1vLyOnxNXV0O0QKRs
 wBHyNFcP6cNisx8FdB1uPWEG5hZwgY2Gmie4CRjAXbEryM86i14Ohv4uedHEpuT3j/yB
 K7Yg==
X-Gm-Message-State: AOAM5312eqGXZo3bmecbahAZWA5D3P0FLlDJwNkxKDpspHHP0e6xKY2X
 IoGeUAjCeE0WzuMWiKzR2s3JWNtWSYXrtuG53lm+aD+E8fOLHfb3jKA9rabySv2DPsEu1P1m1A7
 8ZUZaIBTV/kuCesyoZJuKYP7IhgeKRxU=
X-Received: by 2002:a17:903:41ca:b0:149:2afe:48aa with SMTP id
 u10-20020a17090341ca00b001492afe48aamr4325539ple.100.1640211106457; 
 Wed, 22 Dec 2021 14:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJvdU0COeuLvjXjbMTqkWoSBzX407jiXNTDBw6kXGS0KfFeSu626I8vBzpayb+yoXzo6zWKYyVz8+fqQ4IpBo=
X-Received: by 2002:a17:903:41ca:b0:149:2afe:48aa with SMTP id
 u10-20020a17090341ca00b001492afe48aamr4325518ple.100.1640211106164; Wed, 22
 Dec 2021 14:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
 <20211221193502.114296-4-vsementsov@virtuozzo.com>
In-Reply-To: <20211221193502.114296-4-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Dec 2021 23:11:34 +0100
Message-ID: <CABgObfYqiLwfNf4_p2_HYQPvAHKAQ=4DNr1y2OMecoO6kpovzg@mail.gmail.com>
Subject: Re: [PATCH 3/3] meson: generate trace points for qmp commands
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000570a7705d3c368c3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000570a7705d3c368c3
Content-Type: text/plain; charset="UTF-8"

Il mar 21 dic 2021, 20:35 Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> ha scritto:

--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,10 +2,14 @@
 specific_ss.add(files('control-target.c'))

 trace_events_files = []
-foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.project_source_root() / dir / 'trace-events'
+foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
+  if path.contains('trace-events')
+    trace_events_file = meson.project_build_root() / 'qapi' / path



Just using "trace_events_file = 'qapi' / path" might work, since the build
is nonrecursive.

If it doesn't, use the custom target object, possibly indexing it as
ct[index]. You can use a dictionary to store the custom targets and find
them from the "path" variable.

Paolo


>
>

--000000000000570a7705d3c368c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Il mar 21 dic 2021, 20:35 Vladimir Semen=
tsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsementsov@v=
irtuozzo.com</a>&gt; ha scritto:</div><blockquote style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">--- a/tra=
ce/meson.build<br>+++ b/trace/meson.build<br>@@ -2,10 +2,14 @@<br>=C2=A0spe=
cific_ss.add(files(&#39;control-target.c&#39;))<br><br>=C2=A0trace_events_f=
iles =3D []<br>-foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>-=
=C2=A0 trace_events_file =3D meson.project_source_root() / dir / &#39;trace=
-events&#39;<br>+foreach path : [ &#39;.&#39; ] + trace_events_subdirs + qa=
pi_trace_events<br>+=C2=A0 if path.contains(&#39;trace-events&#39;)<br>+=C2=
=A0 =C2=A0 trace_events_file =3D meson.project_build_root() / &#39;qapi&#39=
; / path</blockquote><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><br></blockquote><div dir=
=3D"auto"><br></div>Just using &quot;trace_events_file =3D &#39;qapi&#39; /=
 path&quot; might work, since the build is nonrecursive.<div dir=3D"auto"><=
br></div><div dir=3D"auto">If it doesn&#39;t, use the custom target object,=
 possibly indexing it as ct[index]. You can use a dictionary to store the c=
ustom targets and find them from the &quot;path&quot; variable.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo<br><div dir=3D"auto"><br><div=
 class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br>=
</blockquote></div></div></div></div>

--000000000000570a7705d3c368c3--


