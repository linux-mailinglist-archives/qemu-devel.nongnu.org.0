Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3530E62F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:42:33 +0100 (CET)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Qr1-0007gx-Dp
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7QhT-0000iN-Rz
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:32:39 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l7QhS-0006vN-9O
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:32:39 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id n18so719662vsa.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CcKLayz/6twqYwx7cnQSZyf0gNLojWBopqUY7VAPIm0=;
 b=klLReYUj3ooGTsF1EtG+DC8LZasFQyIEBmERRJJuXeNa1TuUUTY1m5y8cHAn87qVtS
 H/oUSYH/nhFSk+sOfaYeYEzJofFMGk8ok4wwQoCHf9Fid37gigwDFwlFx4kB+aCok5tl
 lCP6eS8iTJoU5duHLj7tloP6AnDxILXMbExSSTILYcAeFLzxJtkhdra1Umcog9DWk24Q
 UmSNzmbHa3yMVcb1mK3iCfStKXRlWE5T6qN1f39zWTvVAQRLBNCd+Ug/ORMg/jtt5t6t
 8nk1ols1IwYdD5S4yDYmvTY+zVtKeee8uanhIkJoonJ0Amve+/8DwQNt6GP20aCKpCW0
 pCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CcKLayz/6twqYwx7cnQSZyf0gNLojWBopqUY7VAPIm0=;
 b=RhNSOzh/+Zeo6GA5tg9kzGbnREcYqejmBrP3PIcmwlzpRSXzM3sEk3XXv3DjiHPJK1
 z/hYH7bXW/KM7jGuCsuAdPsdxg+7rv2/NCyZJM0M9AbF4oVbIhqb+iNsPWn6SX9ODguk
 /kQLtOo+IKoimMVoGstSSl5HAQLVSAFGp3zPdWGs5DkknQh/WrMTAxij2joZLuo3cHvB
 5VIgVyg7/a0UMVcnhgXHAHVX22iw6OUCbVLrbQuexVhyrQC6REqrWbF7xcUqigMhdQ77
 iyZf1jGyvMAKuOlIutnpQxh7OAExPdamyOSj0ibmDZEboF3q6yooQvlmcEqb3UkkNoHj
 9zlg==
X-Gm-Message-State: AOAM532bLEaQGenGZUB3QQAIfBCpkBWKYfFepxU8rnfL7O82IoQ1omZe
 cwefwjKbT2MJ0pk0viNLJm4MIUq+dOEuKmPq0qtAJg==
X-Google-Smtp-Source: ABdhPJye19ay28QDm3c1nYq1KAqvnouTpPzO8olVPIoeQkBVKzP4wBk6JTaz5A+YMSg4IpbzpzyEy+dVqrKOUOJENjM=
X-Received: by 2002:a05:6102:2e5:: with SMTP id
 j5mr3139138vsj.29.1612391556628; 
 Wed, 03 Feb 2021 14:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-2-dje@google.com>
 <20210203221535.hvweujukawirjyuj@begin>
In-Reply-To: <20210203221535.hvweujukawirjyuj@begin>
From: Doug Evans <dje@google.com>
Date: Wed, 3 Feb 2021 14:31:58 -0800
Message-ID: <CADPb22RWrwno7VR7eA9Lb4XVBbm+ahNfNF5E=35fgbrHjeBKnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f91af905ba76297b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=dje@google.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f91af905ba76297b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2021 at 2:15 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Doug Evans, le mer. 03 f=C3=A9vr. 2021 13:37:28 -0800, a ecrit:
> > ... in preparation for adding ipv6 host forwarding support.
>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
> except
>
> > diff --git a/slirp b/slirp
> > index 8f43a99191..358c0827d4 160000
> > --- a/slirp
> > +++ b/slirp
> > @@ -1 +1 @@
> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> > +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
>
> Which, I would say, deserves its own commit?
>


Yep. Still getting used to patch submission in the presence of submodules
...

--000000000000f91af905ba76297b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Feb 3, 2021 at 2:15 PM Samuel Thibault &lt;<a href=3D=
"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Doug Evans, le mer. 03 f=C3=A9vr. 2021 13:37:28 -0800, a ecri=
t:<br>
&gt; ... in preparation for adding ipv6 host forwarding support.<br>
<br>
Reviewed-by: Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@ens-lyon=
.org" target=3D"_blank">samuel.thibault@ens-lyon.org</a>&gt;<br>
<br>
except<br>
<br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..358c0827d4 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 358c0827d49778f016312bfb4167fe639900681f<br>
<br>
Which, I would say, deserves its own commit?<br></blockquote><div><br></div=
><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Yep.=
 Still getting used to patch submission in the presence of submodules ...</=
div></div></div>

--000000000000f91af905ba76297b--

