Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11B143D02C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:57:31 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnB3-00087Y-Lh
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfn9V-0006hF-9v
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfn9T-0001eu-83
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635357350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHbiNhg7GdvB5TMRKNsz6qCA/5pnKgaua8scWh+oN2Y=;
 b=IR/ZAXq1RovlCrIZYw+xzkNldC1+4a78SBxlR1GXvemxRlOOVSLgPbcD3WuNPFKdsjT1mF
 RaFtlsMyVxmQ4kUuU01DsiV9RBAw6RtKgRbZ9MGZ907rsCnDRYKA996OAIE3l2ZPY2xXQn
 aHqmC4IUsYJ9wqqmVKfj97ZBC6JgK1w=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-0DMXwzokNG2FB0pz6S7vEA-1; Wed, 27 Oct 2021 13:55:48 -0400
X-MC-Unique: 0DMXwzokNG2FB0pz6S7vEA-1
Received: by mail-vk1-f198.google.com with SMTP id
 46-20020a056122072e00b002a484c884c9so1217080vki.17
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHbiNhg7GdvB5TMRKNsz6qCA/5pnKgaua8scWh+oN2Y=;
 b=JKEUGhFKd9Y1jJ+tOuybJCetj+gzMXz/ykE5tGGsUljX92gRO2cUIdTsaEyRtUm7eO
 bwY+WGwRmmMWzLCBqciGsV7SNEKDJYKo/cbPCYNS+ymoDCThJe05HOfppGRUtRHEbGVd
 0gLHfV2pju6C0aW9/Gck3bm/AlyVm8MinktmHzaRCaevi6OdhQvzvxXqTCsWzBpME9VF
 i6xYrezwWHObP8BXrRLlZrU1uOPgdrv8tKg1PDvGoIj/QrnEB0ImlDac4UAIPOeTAKtf
 m5xnfSQ6udBWQ2d+xbkXPTnRNYyv4pxnmq2VOOyZd0Y4dZ1SD19+Ja1JsHseiQQ6E1DR
 bcJQ==
X-Gm-Message-State: AOAM532nBKAnYrGUh2XwW043V2F4BpqaU3TbUSx94XtqpsOENiauTGf3
 +BD20IfYnaiiRH6mU0JDsxOrBT6rLUxyQjyATSX7kd2tUwKzUrkpvDvjHe8BrcLfCI4+fK9aWnF
 oFCmL/Sx7ldI6bks7hYq+f2h6qmqRLXs=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr32694391vsp.59.1635357348530; 
 Wed, 27 Oct 2021 10:55:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuVMj2ZoDVYbAyoS1WLoxVXIgR6wJ9SmegkF/mNg2llnAV7wBp/cjYfHZoP64ZIC2orAFxGvVkNjLZI/V31Tg=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr32694366vsp.59.1635357348380; 
 Wed, 27 Oct 2021 10:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <20211026175612.4127598-7-jsnow@redhat.com>
 <YXlMjhokWt5R2cQf@redhat.com>
In-Reply-To: <YXlMjhokWt5R2cQf@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 27 Oct 2021 13:55:37 -0400
Message-ID: <CAFn=p-Z2MiL5B3HQt9bXaeB4SuXVNYVOMu_WLzWrsFWgYSaoDQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] iotests/300: avoid abnormal shutdown race condition
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d4d53e05cf594dde"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4d53e05cf594dde
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 8:56 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> > Wait for the destination VM to close itself instead of racing to shut it
> > down first, which produces different error log messages from AQMP
> > depending on precisely when we tried to shut it down.
> >
> > (For example: We may try to issue 'quit' immediately prior to the target
> > VM closing its QMP socket, which will cause an ECONNRESET error to be
> > logged. Waiting for the VM to exit itself avoids the race on shutdown
> > behavior.)
> >
> > Reported-by: Hanna Reitz <hreitz@redhat.com>
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> I think this will still expose the race I described in my comment on
> patch 2.
>
> Kevin
>
>
I wrote a long, meandering explanation of how I think things work in reply
to that comment. TLDR: I didn't see the problem.

Here in reply to this comment I'll just ask: what exactly *is* the race you
see happening here even with this patch? I'm not sure I see it.

--js

--000000000000d4d53e05cf594dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 8:56 AM Kevin=
 Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 26.10.2021=
 um 19:56 hat John Snow geschrieben:<br>
&gt; Wait for the destination VM to close itself instead of racing to shut =
it<br>
&gt; down first, which produces different error log messages from AQMP<br>
&gt; depending on precisely when we tried to shut it down.<br>
&gt; <br>
&gt; (For example: We may try to issue &#39;quit&#39; immediately prior to =
the target<br>
&gt; VM closing its QMP socket, which will cause an ECONNRESET error to be<=
br>
&gt; logged. Waiting for the VM to exit itself avoids the race on shutdown<=
br>
&gt; behavior.)<br>
&gt; <br>
&gt; Reported-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" targ=
et=3D"_blank">hreitz@redhat.com</a>&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
I think this will still expose the race I described in my comment on<br>
patch 2.<br>
<br>
Kevin<br>
<br></blockquote><div><br></div><div>I wrote a long, meandering explanation=
 of how I think things work in reply to that comment. TLDR: I didn&#39;t se=
e the problem.<br></div><div><br></div><div>Here in reply to this comment I=
&#39;ll just ask: what exactly *is* the race you see happening here even wi=
th this patch? I&#39;m not sure I see it.</div><div><br></div><div>--js<br>=
</div></div></div>

--000000000000d4d53e05cf594dde--


