Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A254B896F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 14:19:20 +0100 (CET)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKKDH-0001kY-65
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 08:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nKK98-0000Ht-GB
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nKK93-0008GW-6E
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 08:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645017296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4hpcN4BbhJULEcIDvbShbG9YPPs+Ctq2rocmrcOmQQ=;
 b=aR6TaAaq7hGLPWIMKlmKpHITYTNrgj8vgG2G506YP7Itga5uCi+c+xHX+JbpLl0Ed+sbJJ
 GeiFM+hP/HbccX03u6F9+pzxoQqFQzFkgjRoVOvoA9R8BbH1zm2m8TMO4uiHp5GZGo8TIt
 mwsH9IgzqhRgnnuu4qwl53G59TvJELI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-Bcd0k7A9M321vXB7F_Y6lw-1; Wed, 16 Feb 2022 08:14:54 -0500
X-MC-Unique: Bcd0k7A9M321vXB7F_Y6lw-1
Received: by mail-lj1-f198.google.com with SMTP id
 c31-20020a2ebf1f000000b0022d87a28911so945728ljr.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 05:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4hpcN4BbhJULEcIDvbShbG9YPPs+Ctq2rocmrcOmQQ=;
 b=jtOhnIKkSJQpUhZ2fcPM37u9WQuQ06EFHS7VhQQYXFoy2DCqF/pug7ggK82lDo+i+y
 IfXF073Wr+MZ4ptI0MFruJ0qG+V0gArstrGmfZi5h0MFMLNfTOhHSLyYuDyNJ3klycpD
 oqdVtEUkKzCs1zQntZkJFUgb8/na47dme40KRLoFds5QWgJqX5i6/B5MoDwOlKaaxw/B
 varEr+GD7KfDx0xCqI6KhPWn5S6Qx0VBOUlfy0FCoGUU3o5Z5T+Fe3i4PjiBOXmlNRqL
 z3Z49KWhbw+QIfPX/VUwPmg/jBIv2lyxIL9OtmA8grnkUxDM5ajbWWJb5p2zRVZifkIP
 gAcQ==
X-Gm-Message-State: AOAM530FCR7jRRd32qCbYz/4z4si8+4G2GRSywKaXdmMBx5hft7w14yJ
 Jt1oOGtBCapOofTUtK27DgfpgQnWjZG3TMchqYhP88WsRJCLd8gW6Tq9clGQrPPIU28AZjKgfIo
 gqmLak34J2rBxW3xcLA61QDn0fobHXmA=
X-Received: by 2002:a05:6512:c0c:b0:443:7b05:40ef with SMTP id
 z12-20020a0565120c0c00b004437b0540efmr1947685lfu.325.1645017293135; 
 Wed, 16 Feb 2022 05:14:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjVfg7p9xFBSPBNwwriTWN3ma4kFOxidW4mBFyyS1+VEd0EdUCWcRmVT6aD/ECXoW9e0cAJDUurKDZuvDXXE0=
X-Received: by 2002:a05:6512:c0c:b0:443:7b05:40ef with SMTP id
 z12-20020a0565120c0c00b004437b0540efmr1947656lfu.325.1645017292751; Wed, 16
 Feb 2022 05:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
 <20220216101254.GI1127@redhat.com>
In-Reply-To: <20220216101254.GI1127@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 16 Feb 2022 15:14:36 +0200
Message-ID: <CAMRbyytRzjinK1OiV157cw+dWAWabzvrSV0FWPC0OTDby8nASw@mail.gmail.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
To: "Richard W.M. Jones" <rjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000062623905d8226f7e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062623905d8226f7e
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 16, 2022 at 12:13 PM Richard W.M. Jones <rjones@redhat.com>
wrote:

> On Tue, Feb 15, 2022 at 05:24:14PM -0600, Eric Blake wrote:
> > Oh. The QMP command (which is immediately visible through
> > nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)
> > gains "multi-conn":"on", but you may be right that qemu-nbd would want
> > a command line option (either that, or we accellerate our plans that
> > qsd should replace qemu-nbd).
>
> I really hope there will always be something called "qemu-nbd"
> that acts like qemu-nbd.
>

I share this hope. Most projects I work on are based on qemu-nbd.

However in oVirt use case, we want to provide an NBD socket for clients to
allow direct
access to disks. One of the issues we need to solve for this is having a
way to tell if the
qemu-nbd is active, so we can terminate idle transfers.

The way we do this with the ovirt-imageio server is to query the status of
the transfer, and
use the idle time (time since last request) and active status (has inflight
requests) to detect
a stale transfer that should be terminated. An example use case is a
process on a remote
host that started an image transfer, and killed or crashed in the middle of
the transfer
without cleaning up properly.

To be more specific, every request to the imageio server (read, write,
flush, zero, options)
updates a timestamp in the transfer state. When we get the status we report
the time since
that timestamp was updated.

Additionally we keep and report the number of inflight requests, so we can
tell the case when
requests are blocked on inaccessible storage (e.g. non responsive NFS).

We don't have a way to do this with qemu-nbd, but I guess that using
qemu-storage-daemon
when we have qmp access will make such monitoring possible.

Nir

--00000000000062623905d8226f7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 16, 2022 at 12:13 PM Richard =
W.M. Jones &lt;<a href=3D"mailto:rjones@redhat.com" target=3D"_blank">rjone=
s@redhat.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, Feb 15, 2022 at 05:24:14PM -=
0600, Eric Blake wrote:<br>
&gt; Oh. The QMP command (which is immediately visible through<br>
&gt; nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)<br>
&gt; gains &quot;multi-conn&quot;:&quot;on&quot;, but you may be right that=
 qemu-nbd would want<br>
&gt; a command line option (either that, or we accellerate our plans that<b=
r>
&gt; qsd should replace qemu-nbd).<br>
<br>
I really hope there will always be something called &quot;qemu-nbd&quot;<br=
>
that acts like qemu-nbd.<br>
</blockquote><div><br></div><div>I share this hope. Most projects I work on=
 are based on qemu-nbd.</div><div><br></div><div>However in oVirt use case,=
 we want to provide an NBD socket for clients to allow direct</div><div>acc=
ess to disks. One of the issues we need to solve for this is having a way t=
o tell if the</div><div>qemu-nbd is active, so we can terminate idle transf=
ers.</div><div><br></div><div>The way we do this with the ovirt-imageio ser=
ver is to query the status of the transfer, and</div><div>use the idle time=
 (time since last request) and active status (has inflight requests) to det=
ect</div><div>a stale transfer that should be terminated. An example use ca=
se is a process on a remote</div><div>host that started an image transfer, =
and killed or crashed in the middle of the transfer</div><div>without clean=
ing up properly.</div><div><br></div><div>To be more specific, every reques=
t to the imageio server (read, write, flush, zero, options)</div><div>updat=
es a timestamp in the transfer state. When we get the status we report the =
time since</div><div>that timestamp was updated.</div><div><br></div><div>A=
dditionally=C2=A0we keep and report the number of inflight requests, so we =
can tell the case when</div><div>requests are blocked on inaccessible stora=
ge (e.g. non responsive NFS).</div><div><br></div><div>We don&#39;t have a =
way to do this with qemu-nbd, but I guess that using qemu-storage-daemon</d=
iv><div>when we have qmp access will make such monitoring possible.</div><d=
iv><br></div><div>Nir</div></div></div>

--00000000000062623905d8226f7e--


