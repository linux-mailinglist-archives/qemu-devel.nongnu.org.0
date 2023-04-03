Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB36D4B34
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLcA-0003aJ-IO; Mon, 03 Apr 2023 10:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pjLc8-0003Zh-Kt
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pjLc7-0002vs-0t
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680533813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cB4IacgendvZBH8lnkHxUuF8l6Lb6xvVolrGMogLLtE=;
 b=G1AhCm45ZiUwIyBbBYWkRWaZvJkTM9WtMvWO+Hxhfkbmerd5wTG6M8WhsCqUwX8C06yb0v
 5qxRQQZMhJC2eXVsyIaTi1RJ/XNmlcPWK8RusFK3V7y2VrpuT5tNNmoOsdi2hzvNmW96hE
 9+aXDqoUa/4rVmgLzgVHXf7CWXvsB7c=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-Ag7ZHRz1PySzHMj4yciWmA-1; Mon, 03 Apr 2023 10:56:50 -0400
X-MC-Unique: Ag7ZHRz1PySzHMj4yciWmA-1
Received: by mail-yb1-f197.google.com with SMTP id
 4-20020a251904000000b00b7f75c3cafdso13754042ybz.16
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cB4IacgendvZBH8lnkHxUuF8l6Lb6xvVolrGMogLLtE=;
 b=GxTPwN7s0sjcT1CNWDfJ5ijA5kAWEh8onnjcF+FPp1djIuCKe79eVjny4XWa2UJIGi
 yMbJEod+LNRgJ1aO54dcbNRGT5lV5cZAXu7l1YxTl6o4URkmd+3jH2f8XmX9cdSBRoWJ
 lMnP6yVnDSGSBjJDI48GB478BUGf1+bYemyDvFAfUC+t/ko550p1iEw95RGvtRIh0uIH
 ZXiI0tngsYsWwg3DUUKkRiXnrAS3fY0Uscwui7D0uOLwh9MpHyKZmpZhc1nXoxvbyBE/
 sVQAwR2PYFK61l2kCJtONzAVaY7HiNZGj8C+F3i7W5Q9XDs5Yp/TY6oa+2lZ9mj7TXY6
 Rnrw==
X-Gm-Message-State: AAQBX9fu5AZmtHuefLj/HWeo/7Vk5lQIRrfzDh3BSNvSNLkNPWrlaRcJ
 0dzgJEW3UrXooky+eBPIbe6Dnt4HJl5dTRG4ieSyYQwJt34wWKDC4nUoyIEwVJRyF1td7qqYNK0
 9Skrulp+4/g6hpMRwlp9t25l6rV2BQ5E=
X-Received: by 2002:a05:6902:920:b0:b76:ae61:b68b with SMTP id
 bu32-20020a056902092000b00b76ae61b68bmr18480734ybb.5.1680533809898; 
 Mon, 03 Apr 2023 07:56:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTyeoh6fKmFSjc+qkOQJS5u3By+dUo2w9U1YTbwYFoy89FZ6kW0Ld9ffis63T9JKUupraTfPJTOYtP0WVJyYY=
X-Received: by 2002:a05:6902:920:b0:b76:ae61:b68b with SMTP id
 bu32-20020a056902092000b00b76ae61b68bmr18480730ybb.5.1680533809712; Mon, 03
 Apr 2023 07:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679530587.git.dxu@dxuuu.xyz>
 <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
 <ZBwbQCxg+aDuofY+@redhat.com>
 <4d1cc7a0-54a6-4a7c-87a9-5bc643a0162f@app.fastmail.com>
In-Reply-To: <4d1cc7a0-54a6-4a7c-87a9-5bc643a0162f@app.fastmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Apr 2023 17:56:38 +0300
Message-ID: <CAPMcbCrgXv69jtomStPsUcWPWKc8iYRFochh5gUSyjQ8dFTmUA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 michael.roth@amd.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c2e38805f86fc434"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000c2e38805f86fc434
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I will merge this series after the 8.0 release.

Best Regards,
Konstantin Kostiuk.


On Fri, Mar 31, 2023 at 11:24=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:

> Hi Daniel,
>
> On Thu, Mar 23, 2023, at 3:26 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Mar 22, 2023 at 06:19:27PM -0600, Daniel Xu wrote:
> >> Currently, any captured output (via `capture-output`) is segregated in=
to
> >> separate GuestExecStatus fields (`out-data` and `err-data`). This mean=
s
> >> that downstream consumers have no way to reassemble the captured data
> >> back into the original stream.
> >>
> >> This is relevant for chatty and semi-interactive (ie. read only) CLI
> >> tools.  Such tools may deliberately interleave stdout and stderr for
> >> visual effect. If segregated, the output becomes harder to visually
> >> understand.
> >>
> >> This commit adds a new enum variant to the GuestExecCaptureOutputMode
> >> qapi to merge the output streams such that consumers can have a pristi=
ne
> >> view of the original command output.
> >>
> >> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> >> ---
> >>  qga/commands.c       | 25 +++++++++++++++++++++++--
> >>  qga/qapi-schema.json |  5 ++++-
> >>  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Is there anyone in particular I should CC to get this series merged?
>
> Thanks,
> Daniel
>
>

--000000000000c2e38805f86fc434
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div><div>I will merge this=
 series after the 8.0 release.<br></div><div><br></div><div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></d=
iv></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Mar 31, 2023 at 11:24=E2=80=AFPM Daniel Xu &lt;<=
a href=3D"mailto:dxu@dxuuu.xyz">dxu@dxuuu.xyz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Daniel,<br>
<br>
On Thu, Mar 23, 2023, at 3:26 AM, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Wed, Mar 22, 2023 at 06:19:27PM -0600, Daniel Xu wrote:<br>
&gt;&gt; Currently, any captured output (via `capture-output`) is segregate=
d into<br>
&gt;&gt; separate GuestExecStatus fields (`out-data` and `err-data`). This =
means<br>
&gt;&gt; that downstream consumers have no way to reassemble the captured d=
ata<br>
&gt;&gt; back into the original stream.<br>
&gt;&gt; <br>
&gt;&gt; This is relevant for chatty and semi-interactive (ie. read only) C=
LI<br>
&gt;&gt; tools.=C2=A0 Such tools may deliberately interleave stdout and std=
err for<br>
&gt;&gt; visual effect. If segregated, the output becomes harder to visuall=
y<br>
&gt;&gt; understand.<br>
&gt;&gt; <br>
&gt;&gt; This commit adds a new enum variant to the GuestExecCaptureOutputM=
ode<br>
&gt;&gt; qapi to merge the output streams such that consumers can have a pr=
istine<br>
&gt;&gt; view of the original command output.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Daniel Xu &lt;<a href=3D"mailto:dxu@dxuuu.xyz" targ=
et=3D"_blank">dxu@dxuuu.xyz</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 qga/commands.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++++=
+++++++++--<br>
&gt;&gt;=C2=A0 qga/qapi-schema.json |=C2=A0 5 ++++-<br>
&gt;&gt;=C2=A0 2 files changed, 27 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@re=
dhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
Is there anyone in particular I should CC to get this series merged?<br>
<br>
Thanks,<br>
Daniel<br>
<br>
</blockquote></div>

--000000000000c2e38805f86fc434--


