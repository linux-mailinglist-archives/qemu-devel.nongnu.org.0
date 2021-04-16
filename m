Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF0F3627D9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:39:54 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTNh-0003WZ-HM
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXTG0-0001YS-0t
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXTFx-0004Dk-Ht
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618597912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MerynAwfnaWYhBvNBAO0tT0lkCPQcygijoyA2GTlY4k=;
 b=b8rKMCh73N0cWTbKPrXEdennV3iY6j4arzPmuYfyl5j2SO8JLk05/UoE67emTiQ3rYtMJd
 GfIHOxuCqYHT4F3dG6N7bHll2krLUBsINFgtX7nTYy246SsB68zk+zVD9mXIfFSvk56wd0
 WFcZkdax/WMyLKCabXOBtScOyZZlp2A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-c41MqSi8NLyMfbJI7-rX0A-1; Fri, 16 Apr 2021 14:31:49 -0400
X-MC-Unique: c41MqSi8NLyMfbJI7-rX0A-1
Received: by mail-pf1-f200.google.com with SMTP id
 t17-20020a056a001391b02902472d81c024so4721276pfg.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MerynAwfnaWYhBvNBAO0tT0lkCPQcygijoyA2GTlY4k=;
 b=b9HZ30/RJDimPpM3xUx/l2zQqcyV1NFPvUvZuwwq/DKlsfw+v4VKC+PDnSN1argMC8
 pHH85ea9S7prH4W/JLcxUEptcNFG9FW6b8At8ZpXxWluXQQl7EahosExEUDO6OVcwl1x
 oEz5IwR/A42kAtR4w+Kx+rZrwqti75hRzcgMUzMY4DvNiE8NP86X5e7HZbZAUGnsVUNY
 3Ro4Yh0zNhq9NByBYUsf+wtVb6esEd1dJvr9Alk3K4ZY0lyxt5oncrb3njV04J9wlIBZ
 MWud486xsIqhSHbtgm27pAEXxr8/DexgF/59ZXAHlcszHMS8PADx77aZQDWAVEY8WjOB
 HymQ==
X-Gm-Message-State: AOAM530VroBx1gsr++R8cp4rPtUei3RR6vOXwFbJkdBk+6UeWEYszP4H
 sj7M+09M/cDhyYHoQqgc48kJkqRhPAhnWIkBXE829+1jNYGGk/J6jOU3jUMyck0ALK0bhQxaidG
 FE6nqSxS3Zt3UbrLDK38X8tCHaWWjLkk=
X-Received: by 2002:a17:902:a988:b029:eb:679:462b with SMTP id
 bh8-20020a170902a988b02900eb0679462bmr10913071plb.67.1618597908692; 
 Fri, 16 Apr 2021 11:31:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSLuKJa9b6/Hd7cpMki6ZLvm90nMwG9lm5IshvOjaSgZ+xbq416kymagC3ojmOcRPUuG/6b2QPz/OfENaJYgo=
X-Received: by 2002:a17:902:a988:b029:eb:679:462b with SMTP id
 bh8-20020a170902a988b02900eb0679462bmr10913049plb.67.1618597908365; Fri, 16
 Apr 2021 11:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <63df4bb6-77ae-b8fe-770e-6eb8efa7699d@redhat.com>
 <CAFEAcA9nJmPfcOx7dkF050-cXF6Qf1+5nXWAEkysy-2cn4iTFg@mail.gmail.com>
In-Reply-To: <CAFEAcA9nJmPfcOx7dkF050-cXF6Qf1+5nXWAEkysy-2cn4iTFg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 16 Apr 2021 20:31:36 +0200
Message-ID: <CABgObfYaByKBWr8oQUQv_QVkoWZT_vV57CVY0w2MKi74FuqgNQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005cd6c505c01b31f0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cd6c505c01b31f0
Content-Type: text/plain; charset="UTF-8"

Il ven 16 apr 2021, 19:08 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> > I think at least 1-3 are 6.0 material because build on a supported
> > distro (Fedora 34, due for release on April 27) is broken right now.
>
> We don't support not-yet-released distros, because there's no way
> to do that: they might always spring new surprises on us that we
> don't have time to react to. But I agree that the weight of stuff
> we've built up justifies an rc4.
>

Also we can expect that other distros will have the same issue over the
next 4 months. (In fact rolling release distros like Debian testing and
Arch might be already broken for what we know).

Is patch 3 also required? I thought 1 and 2 would suffice, but
> I don't have a system which has the newer glib.
>

Yes, they do.

Paolo


> -- PMM
>
>

--0000000000005cd6c505c01b31f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 16 apr 2021, 19:08 Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; I think at least 1-3 are 6=
.0 material because build on a supported<br>
&gt; distro (Fedora 34, due for release on April 27) is broken right now.<b=
r>
<br>
We don&#39;t support not-yet-released distros, because there&#39;s no way<b=
r>
to do that: they might always spring new surprises on us that we<br>
don&#39;t have time to react to. But I agree that the weight of stuff<br>
we&#39;ve built up justifies an rc4.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Also we can expect that other distros=
 will have the same issue over the next 4 months. (In fact rolling release =
distros like Debian testing and Arch might be already broken for what we kn=
ow).</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Is patch 3 also required? I thought =
1 and 2 would suffice, but<br>
I don&#39;t have a system which has the newer glib.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, they do.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--0000000000005cd6c505c01b31f0--


