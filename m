Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E936B4F1251
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:47:05 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJIf-0004FR-1S
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:47:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbJDC-00006D-PZ
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nbJD9-0001he-Ou
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649065281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMhKVoA1/0t5QinVrpKceN3l5W3fu1SnzqSYYdEsKdQ=;
 b=eJprK4uYLvmuSDVKGI2Urwg/q0eUP3a0bzVHWZEVJaZYTk+NNAJC6cJopgr339hT0JoTuQ
 aZ/wrEp7z9z9VctrEJfDxe2OLg4tIUMioceIKwPy46J1mwitdFPZ0MmQgESHfZP7GsQNrS
 goXN36I+6qruoHDLEoJ4UGrFQKRLhYw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-6Ro2HQbiM0-eywoGazMhnQ-1; Mon, 04 Apr 2022 05:41:17 -0400
X-MC-Unique: 6Ro2HQbiM0-eywoGazMhnQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 c9-20020a17090a1d0900b001caaf769af6so485498pjd.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 02:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMhKVoA1/0t5QinVrpKceN3l5W3fu1SnzqSYYdEsKdQ=;
 b=MqWBAhUCy+qTYToCqxufD94LOr6KWvO12Kdme4vR3H8/13j7O2RanUHqeYrxzeDhGN
 7mt+3AA86OSo5emKzhYb4MD/35HS1IsFmqZ2FnpOL/gfWePOjsu7hNBv/jKrlobUgqpg
 rOi+XcC3s263tnoHJQiweEOkJLXpKeCagFyIWxi/KWBh4b1T1rlbi54yDqZ2i+t7prvi
 zGNc8ITAlr8hmx5iacf5Qj0Gii3Q466jKDaMJGSbkB74lUuI1Uc1EGjmIqp4g7+llAKa
 H7HQ09xyEEk4XhmDOT75DT/TB+4BZzGJZlJqLoX2GjzWtSSIz6XNsCoz9sN5ejhi66lm
 s3AA==
X-Gm-Message-State: AOAM532pLqpTLpskvgHwxLeISAbWFklqQTpughS55nTjbUEKm0sAyWWh
 Jkx4ePCqVjOOiWOUtGqPMZHbsyn+ZuL/N0nXZWrrterL/rCWmXHRowfGBAbi4Eu+tHqVqQxKjDs
 S24jZiyZCdTiNEqam0jNH+s+Dsjf4ZQg=
X-Received: by 2002:a63:185d:0:b0:398:f5e4:62cc with SMTP id
 29-20020a63185d000000b00398f5e462ccmr9330750pgy.442.1649065276563; 
 Mon, 04 Apr 2022 02:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTQWL4Q7BoRLCOv22oYYwkeDNISmrOLEKHFGfRePQuH4Z8WJ1ff8U9wfiOqlFOYFGwqLm3IpuIPSYHS4tUhx4=
X-Received: by 2002:a63:185d:0:b0:398:f5e4:62cc with SMTP id
 29-20020a63185d000000b00398f5e462ccmr9330729pgy.442.1649065276270; Mon, 04
 Apr 2022 02:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
In-Reply-To: <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 4 Apr 2022 11:41:04 +0200
Message-ID: <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000001060605dbd0eeb9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001060605dbd0eeb9
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 4, 2022 at 11:25 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> - The new API doesn't stop more I/O requests from being submitted, it
>   just blocks the current coroutine so request processing is deferred.
>

New I/O requests would not complete until the write-side critical section
ends. However they would still be accepted: from the point of view of the
guest, the "consumed" index of the virtio ring would move forward, unlike
bdrv_drained_begin/end().

- In other words, is_external is a flow control API whereas the new API
>   queues up request coroutines without notifying the caller.
>

Yes, I think this is the same I wrote above.

> - The new API still needs to be combined with bdrv_drained_begin/end()
>   to ensure in-flight requests are done.
>

I don't think so, because in-flight requests would take the lock for
reading. The write side would not start until those in-flight requests
release the lock.

- It's not obvious to me whether the new API obsoletes is_external. I think
> it probably doesn't.
>

I agree that it doesn't. This new lock is only protecting ->parents and
->children. bdrv_drained_begin()/end() remains necessary, for example, when
you need to send a request during the drained section. An example is
block_resize.

In addition, bdrv_drained_begin()/end() ensures that the callback of
blk_aio_*() functions has been invoked (see commit 46aaf2a566,
"block-backend: Decrease in_flight only after callback", 2018-09-25).  This
new lock would not ensure that.

As an aside, instead of is_external, QEMU could remove/add the ioeventfd
handler in the blk->dev_ops->drained_begin and blk->dev_ops->drained_end
callbacks respectively. But that's just a code cleanup.

Paolo

--00000000000001060605dbd0eeb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:x-small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 4, 20=
22 at 11:25 AM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
- The new API doesn&#39;t stop more I/O requests from being submitted, it<b=
r>
=C2=A0 just blocks the current coroutine so request processing is deferred.=
<br></blockquote><div><br></div><div style=3D"font-family:monospace,monospa=
ce;font-size:x-small" class=3D"gmail_default">New I/O requests would not co=
mplete until the write-side critical section ends. However they would still=
 be accepted: from the point of view of the guest, the &quot;consumed&quot;=
 index of the virtio ring would move forward, unlike bdrv_drained_begin/end=
().</div><div style=3D"font-family:monospace,monospace;font-size:x-small" c=
lass=3D"gmail_default"><br></div><div style=3D"font-family:monospace,monosp=
ace;font-size:x-small" class=3D"gmail_default"></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">

- In other words, is_external is a flow control API whereas the new API<br>
=C2=A0 queues up request coroutines without notifying the caller.<br></bloc=
kquote><div><br></div><div style=3D"font-family:monospace,monospace;font-si=
ze:x-small" class=3D"gmail_default">Yes, I think this is the same I wrote a=
bove.</div><div style=3D"font-family:monospace,monospace;font-size:x-small"=
 class=3D"gmail_default"></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">

- The new API still needs to be combined with bdrv_drained_begin/end()<br>
=C2=A0 to ensure in-flight requests are done.<br></blockquote><div><br></di=
v><div style=3D"font-family:monospace,monospace;font-size:x-small" class=3D=
"gmail_default">I don&#39;t think so, because in-flight requests would take=
 the lock for reading. The write side would not start until those in-flight=
 requests release the lock.</div><div style=3D"font-family:monospace,monosp=
ace;font-size:x-small" class=3D"gmail_default"><br></div><div style=3D"font=
-family:monospace,monospace;font-size:x-small" class=3D"gmail_default"></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">

- It&#39;s not obvious to me whether the new API obsoletes is_external. I t=
hink it probably doesn&#39;t.<br></blockquote><div><br></div><div style=3D"=
font-family:monospace,monospace;font-size:x-small" class=3D"gmail_default">=
I agree that it doesn&#39;t. This new lock is only protecting -&gt;parents =
and -&gt;children. bdrv_drained_begin()/end() remains necessary, for exampl=
e, when you need to send a request during the drained section. An example i=
s block_resize.</div><div style=3D"font-family:monospace,monospace;font-siz=
e:x-small" class=3D"gmail_default"><br></div><div style=3D"font-family:mono=
space,monospace;font-size:x-small" class=3D"gmail_default">In addition, bdr=
v_drained_begin()/end() ensures that the callback of blk_aio_*() functions =
has been invoked (see commit 46aaf2a566, &quot;block-backend: Decrease in_f=
light only after callback&quot;, 2018-09-25).=C2=A0 This new lock would not=
 ensure that.<br></div><div style=3D"font-family:monospace,monospace;font-s=
ize:x-small" class=3D"gmail_default"><br></div><div style=3D"font-family:mo=
nospace,monospace;font-size:x-small" class=3D"gmail_default">As an aside, i=
nstead of is_external, QEMU could remove/add the ioeventfd handler in the b=
lk-&gt;dev_ops-&gt;drained_begin and blk-&gt;dev_ops-&gt;drained_end callba=
cks respectively. But that&#39;s just a code cleanup.<br></div><div style=
=3D"font-family:monospace,monospace;font-size:x-small" class=3D"gmail_defau=
lt"><br></div><div style=3D"font-family:monospace,monospace;font-size:x-sma=
ll" class=3D"gmail_default">Paolo<br></div></div></div>

--00000000000001060605dbd0eeb9--


