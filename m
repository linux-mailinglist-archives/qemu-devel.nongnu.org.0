Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA06E8AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 08:57:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppOCe-0003kC-Ti; Thu, 20 Apr 2023 02:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppOCX-0003jm-O9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 02:55:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppOCV-0008UG-KW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 02:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681973720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bkKVWVbyemvd8yYPEdyT3Yd792HDtU+z0swSrxXjx0g=;
 b=H9++6AON+s4stGjEEEBUrDGvdOENqBmx0GgsWe0z0rNxkvtwwF0zlrhiEsaZhrRkraCIdH
 yA4tbcT5bvJeHW1qGqY8bpl7TuCdrjGvFXu0s/1KVa8jqb0S3DZ+8bShScUk6a2Ay1wq3Y
 aCHnX1PvHgdkEAoV389Q5tMDniwkM6k=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-6Dd_rFfjNyqXYK5-ZOYk4w-1; Thu, 20 Apr 2023 02:55:18 -0400
X-MC-Unique: 6Dd_rFfjNyqXYK5-ZOYk4w-1
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-4408d2d0959so255811e0c.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 23:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681973717; x=1684565717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bkKVWVbyemvd8yYPEdyT3Yd792HDtU+z0swSrxXjx0g=;
 b=h/VgL1swoSS/yMTNQMbnf6Xr36DT3hoof/gtzB0JnBNwz7CoxUVaZomlu6TvUB28S7
 d6lRk8bNeRoXWuGhthp5wRvkY1xDWmSLa6NlDybhi8MKrzaC6OUUWHHA6Mum2hNqrf6r
 LeI2aK0lCnUmzyTfVAkvcJOazUf7eny+IeNgew8NJ+WG9mD21EeKXnMKSRVdcDU0IQIB
 A2hrDt79R2bgJu0UABoyfARdcXZNbJSaGKWKeuaFdC1LTMWbC9RlmdnRqFJ2gP9IFKd8
 DkOI+RWwaZyTXlOo+Fq4GE2SU2K80SnBBOPrquhhCNNohQ4Pemc6aWDfXXELg4yZMseI
 7fxw==
X-Gm-Message-State: AAQBX9cVB0FINgtebr0uJEwZOnl/NUmF5gsCM4Vg9iDxu1LNaaK+hiDt
 9cxtaQAOq9SFdFoOddxCq3QAovu7UYJA2RVXqp8vskNRlYv0YvaE5TwtleLM0NA5/VD+ywxSHng
 bp0uli1T4gJtLK9VI956xGd7Nd8DAe+c=
X-Received: by 2002:a67:c10e:0:b0:42e:3b77:b77 with SMTP id
 d14-20020a67c10e000000b0042e3b770b77mr446595vsj.1.1681973717772; 
 Wed, 19 Apr 2023 23:55:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0w47o9GQCalcSmf1cvS2eL/jaP6iyww/0HrJhPA+Vi3ORzkB0b/v3BhGqKqHFBh7/xQP68H/gzsW97kfRs2w=
X-Received: by 2002:a67:c10e:0:b0:42e:3b77:b77 with SMTP id
 d14-20020a67c10e000000b0042e3b770b77mr446585vsj.1.1681973717517; Wed, 19 Apr
 2023 23:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
In-Reply-To: <877cu7gk1g.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 20 Apr 2023 08:55:06 +0200
Message-ID: <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
To: Markus Armbruster <armbru@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f4649005f9bf05b2"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f4649005f9bf05b2
Content-Type: text/plain; charset="UTF-8"

Il gio 20 apr 2023, 08:11 Markus Armbruster <armbru@redhat.com> ha scritto:

> So, splicing in a bottom half unmoored monitor commands from the main
> loop.  We weren't aware of that, as our commit messages show.
>
> I guess the commands themselves don't care; all they need is the BQL.
>
> However, did we unwittingly change what can get blocked?  Before,
> monitor commands could block only the main thread.  Now they can also
> block vCPU threads.  Impact?
>

Monitor commands could always block vCPU threads through the BQL(*).
However, aio_poll() only runs in the vCPU threads in very special cases;
typically associated to resetting a device which causes a blk_drain() on
the device's BlockBackend. So it is not a performance issue.

However, liberal reuse of the main block layer AioContext could indeed be a
*correctness* issue. I need to re-read Fiona's report instead of stopping
at the first three lines because it's the evening. :)

Paolo

(*) Some of you may remember that when migration ran under the BQL it was
also a very effective way to ensure that vCPU threads were slowed down, so
it helped migration converge. Once that hurdle was removed, we had to add
manual sleeping in the vCPU threads!



>

--000000000000f4649005f9bf05b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 20 apr 2023, 08:11 Markus Armbruster &lt;<a hre=
f=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">So, splicing in a bottom half unmoored mo=
nitor commands from the main<br>
loop.=C2=A0 We weren&#39;t aware of that, as our commit messages show.<br>
<br>
I guess the commands themselves don&#39;t care; all they need is the BQL.<b=
r>
<br>
However, did we unwittingly change what can get blocked?=C2=A0 Before,<br>
monitor commands could block only the main thread.=C2=A0 Now they can also<=
br>
block vCPU threads.=C2=A0 Impact?<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Monitor commands could always block vCPU t=
hreads through the BQL(*). However, aio_poll() only runs in the vCPU thread=
s in very special cases; typically associated to resetting a device which c=
auses a blk_drain() on the device&#39;s BlockBackend. So it is not a perfor=
mance issue.</div><div dir=3D"auto"><br></div><div dir=3D"auto">However, li=
beral reuse of the main block layer AioContext could indeed be a *correctne=
ss* issue. I need to re-read Fiona&#39;s report instead of stopping at the =
first three lines because it&#39;s the evening. :)</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(*) Some of you may remember that when migration ran under the BQ=
L it was also a very effective way to ensure that vCPU threads were slowed =
down, so it helped migration converge. Once that hurdle was removed, we had=
 to add manual sleeping in the vCPU threads!</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000f4649005f9bf05b2--


