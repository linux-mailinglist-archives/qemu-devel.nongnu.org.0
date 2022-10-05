Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC25F5B9C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:22:14 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogBqH-0007s0-UJ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogBgI-00018u-Ga
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogBgG-0001TR-CU
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665004310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfjHjQ1EkuUw4YZiLxJtlTrnZUNhIkTwvXPHgQC4pu8=;
 b=fJOCtrMyGX1pnCBMX41soswS5GjzwZuokELUYfhTD555imeCWseONzdMTW1vA/4HbqEMss
 Tbg9XM0UihILJa3EHcdkkTQ/QDyMludXFW9H9y9QQcOetKgfrhR0wRp6X+n0qB/rdWADJ5
 gElL6sUTPxCqyXadMhe9fwkFnY1IYws=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-Qe-KsO_HNIqKtQwK9zOFUg-1; Wed, 05 Oct 2022 17:11:49 -0400
X-MC-Unique: Qe-KsO_HNIqKtQwK9zOFUg-1
Received: by mail-vs1-f72.google.com with SMTP id
 t6-20020a05610210c600b003a6d7ac7427so32562vsr.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 14:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=dfjHjQ1EkuUw4YZiLxJtlTrnZUNhIkTwvXPHgQC4pu8=;
 b=Bi2qjhoLcLaSsqLOLQZzmitsFlkNH6YhpvmrZ9DdduTuVtVLs1bhm+saSg5DgHQEVy
 MKG0mzKLx2FY0jXwTgrHzPGXRkvFdgF/TKlGXEMUSInRX5I/kDxNkM57dc2pZg6YZtLT
 u1UBdRqiRtgXEv5lgPutpWNu3NbReehVK7VWscz1/fgLb0VnldS/ZAiWVPVhjNov3yzd
 jVSvhLykcSEMQCvxZH1TKs5S6i56Eb7dzr7H//lE1xNmauIo+6vql9WVmJi2/xPNgqbr
 YheUqa6VYt4ERE5EJw98SrXUiOjeb8if+J4JRS7VFLGRV2puH8PU/V9Hv8icmsRtoI35
 nQlg==
X-Gm-Message-State: ACrzQf0pU5IM059Iqpm7WrAj7JL5QDe/LBth8KyGN0FnrDuhjl2mmO3q
 wOOfMr02q5/qVXgznUD0Tu7VdIjs0UCCcIKXhPR/M4aCh20/ZJL8sfuckZQ1UPSb+8J9ETSgpQe
 2JDsfmsO0YKEfkmrNmiYeJz9IrxVbvN8=
X-Received: by 2002:a67:c28a:0:b0:3a6:ec0d:b8ce with SMTP id
 k10-20020a67c28a000000b003a6ec0db8cemr726373vsj.27.1665004308415; 
 Wed, 05 Oct 2022 14:11:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OeIbqwKk8QntpY8ziJ7SQNWrTQQAZ/B/+GsTKCGIUkZ1kUWm4+I5As0q/zM+pksR618zr7Ojci9VYxvLj3HQ=
X-Received: by 2002:a67:c28a:0:b0:3a6:ec0d:b8ce with SMTP id
 k10-20020a67c28a000000b003a6ec0db8cemr726364vsj.27.1665004308197; Wed, 05 Oct
 2022 14:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-7-pbonzini@redhat.com>
 <Yz1dONxeQIVqysmL@redhat.com>
In-Reply-To: <Yz1dONxeQIVqysmL@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 5 Oct 2022 17:11:38 -0400
Message-ID: <CABgObfYmjrVbUmz9xtbVnzdDEPBEMZxtV-sYtNuO-0ZPBECstA@mail.gmail.com>
Subject: Re: [PATCH 06/26] blkdebug: add missing coroutine_fn annotations
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Alberto Campinho Faria <afaria@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000057130d05ea50069d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057130d05ea50069d
Content-Type: text/plain; charset="UTF-8"

Il mer 5 ott 2022, 06:32 Kevin Wolf <kwolf@redhat.com> ha scritto:

> Hm... blkdebug_debug_event() is called from bdrv_debug_event(), which is
> not coroutine_fn. And I think that it's not coroutine_fn is correct:
> For example, with 'qemu-img snapshot -c' you get img_snapshot() ->
> bdrv_snapshot_create() -> qcow2_snapshot_create() ->
> qcow2_alloc_clusters() -> BLKDBG_EVENT. I'm sure many other calls in
> qcow2 can be reached from non-coroutine context as well.
>
> It almost looks like your code analysis didn't consider calls through
> function pointers?
>

No, that is not what happened. Rather it's that the analysis goes the other
way round: because SUSPEND rules call qemu_coroutine_yield(), clang wants
all the callers to be coroutine_fn too. It is technically incorrect that
bdrv_debug_events sometimes are placed outside coroutine context, and QEMU
would crash if those events were associated with a suspend rule.

I guess I (or you) can just drop this patch?

Paolo

>

--00000000000057130d05ea50069d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 5 ott 2022, 06:32 Kevin Wolf &lt;<a href=3D"mai=
lto:kwolf@redhat.com" target=3D"_blank" rel=3D"noreferrer">kwolf@redhat.com=
</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hm... blkdebug=
_debug_event() is called from bdrv_debug_event(), which is<br>
not coroutine_fn. And I think that it&#39;s not coroutine_fn is correct:<br=
>
For example, with &#39;qemu-img snapshot -c&#39; you get img_snapshot() -&g=
t;<br>
bdrv_snapshot_create() -&gt; qcow2_snapshot_create() -&gt;<br>
qcow2_alloc_clusters() -&gt; BLKDBG_EVENT. I&#39;m sure many other calls in=
<br>
qcow2 can be reached from non-coroutine context as well.<br>
<br>
It almost looks like your code analysis didn&#39;t consider calls through<b=
r>
function pointers?<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">No, that is not what happened. Rather it&#39;s that the a=
nalysis goes the other way round: because SUSPEND rules call qemu_coroutine=
_yield(), clang wants all the callers to be coroutine_fn too. It is technic=
ally incorrect that bdrv_debug_events sometimes are placed outside coroutin=
e context, and QEMU would crash if those events were associated with a susp=
end rule.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I guess I (or =
you) can just drop this patch?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Paolo=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000057130d05ea50069d--


