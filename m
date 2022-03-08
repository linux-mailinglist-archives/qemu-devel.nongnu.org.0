Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298B4D1E4D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 18:14:41 +0100 (CET)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRdPz-00030w-V7
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 12:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRdGY-0004eV-Pa
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:04:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRdGU-0006ap-MT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646759088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GCE6gEH84abom5510XWLmhzWB0RLr2bUs31npjvCUSc=;
 b=S40u/uSDbM6f38vzvmHqoed/gkB6UT6ebnt98NnZP6lsqf47Y8HKKt039N8BzBrCvBu9sy
 IVmtV2K0brd8jqs1wOzz84cH3JhyqHx8K5hUwvpZCuCdvtU8neqmFlQFHlur0Pgp6wZ0zb
 7e2pWTh2jDN/1DdM1ImD7Ft4WEUqIdg=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-exXtx4OXNY28lhSfBZw-oA-1; Tue, 08 Mar 2022 12:04:45 -0500
X-MC-Unique: exXtx4OXNY28lhSfBZw-oA-1
Received: by mail-vs1-f71.google.com with SMTP id
 s125-20020a675e83000000b00320c64c3205so783771vsb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GCE6gEH84abom5510XWLmhzWB0RLr2bUs31npjvCUSc=;
 b=BeOV0+l5meCnwPloCqtTIhTZAvX9gBO5Cj3MxZkTIuBDDxDcsE5oRDKIB1bJNi0Y9q
 hrjHcgN0fnVh6ay+FSYh1H7/0Rh9H41/qW3LkFW4QYN6CcpQcVnNwEcJ1VG7sgZLFcNV
 VdvrIoN2nndx4Dg0AlrE5Mt87yjBA5qFFcXxx0SnTRuLBaCuBkGDqYNJ3lsyqFaU/sNz
 DPqNL7ZCoad5zNvE/EAmN6gqJakbnFXN29k4fR26X9l6ejb8hpdGvfIYzb3X2y3sT8Ul
 UjoVlN1xywT7CfYax6nzRwDQO8+kkkDbzEtZq/YTqSfyxtTe7+zXCErZB14bUU5XoEO8
 AFYg==
X-Gm-Message-State: AOAM5325ogaTKArG8mELCWxEy+Tjv0pqSF0GPVJ8BVCGIoOTJAW58PD+
 P9nlXAnEKzfsUCibdXLyLtd/xwA0i/hvVqufQLa4UY8g9QyEvnQAr8AWv0MSckEdP9zsIXKkxEp
 Kf9TwgQs2HyF3NEjYTulfATCgk+5WAP8=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr2453012vst.11.1646759082782; 
 Tue, 08 Mar 2022 09:04:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOv7dARxCFpbLOw8mcLE/QKvKHfM/0rZtv+51tvnPjE9qWcX9CaMYaSJh8mRrV/svZo7gFURLxh06fh2BYng8=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr2452801vst.11.1646759080713; Tue, 08
 Mar 2022 09:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-4-jsnow@redhat.com>
 <20220308151554.tvew6nriqpt5i2vq@redhat.com>
In-Reply-To: <20220308151554.tvew6nriqpt5i2vq@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Mar 2022 12:04:30 -0500
Message-ID: <CAFn=p-ZMAOmgpnCQLC5GemEndn34Nr5Mw6csgbesqm7bAWydOQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] iotests: Remove explicit checks for qemu_img() == 0
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000b534f05d9b7fa3b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b534f05d9b7fa3b
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022, 10:16 AM Eric Blake <eblake@redhat.com> wrote:

> On Mon, Mar 07, 2022 at 08:57:26PM -0500, John Snow wrote:
> > qemu_img() returning zero ought to be the rule, not the
> > exception. Remove all explicit checks against the condition in
> > preparation for making non-zero returns an Exception.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> As this is a testsuite improvement rather than a new feature, I think
> it's fine for the series to go in during soft freeze.
>

Yup, I agree. I'd like to move this in sooner rather than later to guard
against rot, and to have the better failure messages during testing season.

I have followup patches that finish the audit of qemu-img calls. It's less
clear if those should also go in during soft freeze, but I suppose I can
send them and we can see how confident we feel about it.

(Also note, I am giving the same treatment to qemu-io in another branch,
too. That branch has revealed actual logical errors in our testing in
several places. That series isn't 100% ready yet, but it might also qualify
for freeze because it fixes real test defects.)


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--0000000000000b534f05d9b7fa3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 8, 2022, 10:16 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com" target=3D"_blank" rel=3D"noreferrer">eblake@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, =
Mar 07, 2022 at 08:57:26PM -0500, John Snow wrote:<br>
&gt; qemu_img() returning zero ought to be the rule, not the<br>
&gt; exception. Remove all explicit checks against the condition in<br>
&gt; preparation for making non-zero returns an Exception.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">eblake@redhat.com</a>&gt;<br>
<br>
As this is a testsuite improvement rather than a new feature, I think<br>
it&#39;s fine for the series to go in during soft freeze.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yup, I agree. I&#3=
9;d like to move this in sooner rather than later to guard against rot, and=
 to have the better failure messages during testing season.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have followup patches that finish t=
he audit of qemu-img calls. It&#39;s less clear if those should also go in =
during soft freeze, but I suppose I can send them and we can see how confid=
ent we feel about it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(A=
lso note, I am giving the same treatment to qemu-io in another branch, too.=
 That branch has revealed actual logical errors in our testing in several p=
laces. That series isn&#39;t 100% ready yet, but it might also qualify for =
freeze because it fixes real test defects.)</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.=
org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libvirt.org=
</a><br>
<br>
</blockquote></div></div></div>

--0000000000000b534f05d9b7fa3b--


