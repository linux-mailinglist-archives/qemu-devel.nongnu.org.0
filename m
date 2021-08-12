Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6C3EA311
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:46:40 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8EP-0001hO-OM
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mE8DO-0000wN-1T
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mE8DK-0001gW-B1
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628765128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/oparS1ssZbM/UO19iJZCESE3tHRK2rJT92WXtqkgQ=;
 b=ib7Zf2lJhCw8B7Cr1o1ywufNiMbgANgDMzKxtv33KMaXLFbApe9QGHcd6KWJnt4zftHNrP
 odRWLgZrvBPr2jiMtx2gxtXbAifl543nJDeJqPx9vQ8CR8jABeIIjHGTBd5BUELEm3LHUZ
 8PSaii+onYj4Tk0Zr4Cm5RsJmn9h6AM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-mnLkZNEFNnq0fE0BPQtXkQ-1; Thu, 12 Aug 2021 06:45:25 -0400
X-MC-Unique: mnLkZNEFNnq0fE0BPQtXkQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 61-20020a17090a09c3b029017897f47801so7753795pjo.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7/oparS1ssZbM/UO19iJZCESE3tHRK2rJT92WXtqkgQ=;
 b=BbFW7W2vVnPDHE+zwD5E7BTt3OgAVMGE9V7L9iKHE32Lh2OebeoD/Ypo+luNqJOavE
 QEbyIgTvIFFino2/UUjCMpcR65nF1DJnJJHZGuxG0/oLydDxcBeu7Sj8x4zZqI/Yd0oN
 OAgGVnW/QCUJ8sW+ijh+pw4Z52/EElsHjUslaURcZ5hNpJQKUBAYxm1byZivznLXAQre
 x0j607BMeM13wGfd+3qYty0Oqxju04Trtu9v1KcUuYfjn2I2hKJCiW+FDtCncBHJYmc/
 411x5iYqUAARFoJ5SRxgu3u69EJyBYWtxD7QLv8xBbgK/bx3Y7zAHZgVMuVp7FmCVJPM
 zX5A==
X-Gm-Message-State: AOAM533XS/jZQr7E2XAgb5y7dPJtHpSm5FEhA9yiyc/d4BQiF8Ii1nS0
 b6H9siS+TWFc3ZLBI7osS+1gJ2UH4Q0GCfXrpqM/Js6QNmhR60SNCRPG0knJ5/URrvXm7h9jQEh
 Z0WQwyso5M2dJQQ18DCrI21ZesgYZiJg=
X-Received: by 2002:a17:902:7406:b029:12d:3bc1:3812 with SMTP id
 g6-20020a1709027406b029012d3bc13812mr3065629pll.67.1628765124224; 
 Thu, 12 Aug 2021 03:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/H9v9KETnzjlhYHCdbZzpUmnE3i+03FwY4xN/+AumKRy49Eo9HhUPrMklCby+MZf9NcgO3kmTpR86Ixuyzak=
X-Received: by 2002:a17:902:7406:b029:12d:3bc1:3812 with SMTP id
 g6-20020a1709027406b029012d3bc13812mr3065607pll.67.1628765123997; Thu, 12 Aug
 2021 03:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210811100550.54714-1-pbonzini@redhat.com>
 <875ywb6lxu.fsf@linaro.org>
In-Reply-To: <875ywb6lxu.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Aug 2021 12:45:12 +0200
Message-ID: <CABgObfYW2acs4upbm7mjfhGhvK+sSLKNPC4LJUNQF9OGi8xM7g@mail.gmail.com>
Subject: Re: [PATCH for 6.1] plugins: do not limit exported symbols if modules
 are active
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a38d2305c95a6e1f"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: "Maydell, Peter" <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a38d2305c95a6e1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 12 ago 2021, 11:40 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

>   ERROR: glib-2.56 gmodule-noexport-2.0 is required to compile QEMU
>
> Should it be gmodule-no-export? Hopefully the different distros aren't
> packaging different .pc files.
>

My bad. :( It's correct with the dash.

Does this mean --enable-modules would allow plugins to access more of
> the API space than we intended in the first place?
>

Yes, but before it would do so even without --enable-modules due to using
gmodule and not gmodule-no-export.

Paolo


> --
> Alex Benn=C3=A9e
>
>

--000000000000a38d2305c95a6e1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 12 ago 2021, 11:40 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">=C2=A0 ERROR: glib-2.56 gmodule-=
noexport-2.0 is required to compile QEMU<br>
<br>
Should it be gmodule-no-export? Hopefully the different distros aren&#39;t<=
br>
packaging different .pc files.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">My bad. :( It&#39;s correct with the dash.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Does this mean --enable-modules would allow=
 plugins to access more of<br>
the API space than we intended in the first place?<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, but before it would =
do so even without --enable-modules due to using gmodule and not gmodule-no=
-export.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--000000000000a38d2305c95a6e1f--


