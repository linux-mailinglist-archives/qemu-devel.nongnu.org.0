Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150E5266E0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:17:52 +0200 (CEST)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXzD-0004sn-Fv
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXqj-0006D1-Cd
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:09:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXqg-0003zK-7Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652458141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDaNB/QH2wnHiKI0SZWj6ImFauccrghhRHvvENTyj+w=;
 b=eOQ6cQKA3BAPYLTZ9rsDw02h3DKspT5/WtIbqEhLvz7jh70iORNoRfKq3EkBXcTTthN/n7
 iCksC3IAOPn7wjUKrW4eORkKU9r1upzG9faTGGy1KsZsnlem3pUmBayUNNWfIpjVmKqF3n
 JNPE9syGhOD+M7N5gi5fiNsSIPoQ/oQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-mAifF2n9NPqAEtUGvURN_g-1; Fri, 13 May 2022 12:09:00 -0400
X-MC-Unique: mAifF2n9NPqAEtUGvURN_g-1
Received: by mail-vk1-f199.google.com with SMTP id
 y198-20020a1f32cf000000b00351f84dc320so1210732vky.23
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDaNB/QH2wnHiKI0SZWj6ImFauccrghhRHvvENTyj+w=;
 b=JvInizNuE0IBZOOuGHWgbc6s+/LwONQ8Ze699el068gb/fQhz3XTwReY1dJ5S72Ogf
 +KaGTh/5794D3cjvR3rvKCnaYxJivguKO9wtwfG3rSmvPoIdhBDp+oxBCeNcRB1WfBGs
 yPdqf9h41ft4OWxCJGB2yGUWoHF7HdZKr8gE0Lffyy5Yibsmo22MB6BlbPyKr4nYdIkK
 UWqDUm1pKGPGma3ppmzsENj6N0Y4bSTxBOntvR84q2Klenz/BI+SRxhpV4JXz2VILCsm
 GMHdv4FvtdxPcgn35fYbxP983rF4x0DvTqwBLWuSdIeSZIJOEr1wLS25jqOYN1j6qhnk
 ZOmQ==
X-Gm-Message-State: AOAM533v+lrKDKcWbU9GOSwR6fCNdrDjlHWk2vk6Du+NVZ8QTlddyWRu
 XhOXZTxcE47WZbkmbb8fGdJnvX6mm/xcHVQGFwKn1RxilNszDlBmgEY5Z8hWyKpBXIhB98z+URW
 R7N+B34juKdJQFrMM642jvVRCNBgUoXQ=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr2438709uad.100.1652458139346; 
 Fri, 13 May 2022 09:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbJl8erNGWvDWzKlclN7PdwMzcBwh4KPgyXHu6EO+wahO7gxUSHbnNwXygsOiyhvD3TRaXblbn9YNZgpQEQHY=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr2438682uad.100.1652458139078; Fri, 13
 May 2022 09:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-7-jsnow@redhat.com>
 <cce38c36-30d6-2868-8e50-570216891549@redhat.com>
 <CAFn=p-ZXjaGN8Sf8+UxS9q1-xZD4_g4A6MBes2ip3JevUt1Tpw@mail.gmail.com>
 <e55f3fcc-28c7-9bd5-bc52-526106ab7eae@redhat.com>
In-Reply-To: <e55f3fcc-28c7-9bd5-bc52-526106ab7eae@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 12:08:48 -0400
Message-ID: <CAFn=p-Y4uZ8KUeq-mqWg8u9TcW9jvx4sjX-cAneGick8igFndg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] tests: add check-venv as a dependency of check
 and check-block
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000062e75105dee6e4d6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062e75105dee6e4d6
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 11:34 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 16:12, John Snow wrote:
> >
> >     I think you need instead:
> >
> >     # The do-meson-check and do-meson-bench targets are defined in
> >     Makefile.mtest
> >     do-meson-check do-meson-bench: check-venv
> >
> >     and I would even add "all" to the targets that create the virtual
> >     environment.
> >
> >     Paolo
> >
> >
> > Great, thanks! I'll try that out today.
>
> Well, check out the other suggestion of creating the venv at configure
> time, because that would remove all these complications/annoyances.
>
> Paolo
>

They also raise new annoyances and questions for me, so it might be worth
updating this "branch" of the patchset to have a basis of comparison for
what's the least annoying in the end.

(Or maybe even to serve as a basis while transitioning to the "better"
solution. It's quick to try, at least.)

Config script ideas are gonna take me a bit longer to work through.

(I'm not against developing a minimum viable patchset and having you tweak
it to your desire afterwards, if you have the time/interest. We can chat on
irc if you'd like. Otherwise, I'll just push forward.)

--js

>

--00000000000062e75105dee6e4d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 11:34 AM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 5/13/22 16:12, John Snow wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think you need instead:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0# The do-meson-check and do-meson-bench targets are=
 defined in<br>
&gt;=C2=A0 =C2=A0 =C2=A0Makefile.mtest<br>
&gt;=C2=A0 =C2=A0 =C2=A0do-meson-check do-meson-bench: check-venv<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0and I would even add &quot;all&quot; to the targets=
 that create the virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0environment.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Paolo<br>
&gt; <br>
&gt; <br>
&gt; Great, thanks! I&#39;ll try that out today.<br>
<br>
Well, check out the other suggestion of creating the venv at configure <br>
time, because that would remove all these complications/annoyances.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">They also raise new annoyances and questions for me, so it might be wo=
rth updating this &quot;branch&quot; of the patchset to have a basis of com=
parison for what&#39;s the least annoying in the end.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">(Or maybe even to serve as a basis while tran=
sitioning to the &quot;better&quot; solution. It&#39;s quick to try, at lea=
st.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Config script ideas=
 are gonna take me a bit longer to work through.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">(I&#39;m not against developing a minimum viable p=
atchset and having you tweak it to your desire afterwards, if you have the =
time/interest. We can chat on irc if you&#39;d like. Otherwise, I&#39;ll ju=
st push forward.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
</blockquote></div></div></div>

--00000000000062e75105dee6e4d6--


