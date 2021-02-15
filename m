Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0431C43A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 00:16:54 +0100 (CET)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBn6r-0003LH-8G
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 18:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBn5G-0002bK-V2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBn5E-0004bP-Oi
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613430911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4u6inT5X3qTIeA807N/eIeiurNzjYzDxX5jLLqTX+fk=;
 b=Q4Z6M+NpVClhX8yvUjIdOtuehxx3O2k7ANNeAuNL5gX7kQVs+7gJmSFc9UM3KpDijf9YME
 C+fYWJdZcgGhd6d6LUv/DBmIKaaRN7lMOb+/xbryJ++vGWmkJ+K+j5QW+XjgvtPOsqKsDU
 qoBfgDiq9gCv/jI6MX0DJxsGDn53l40=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-ZHq_BSvCNlqQch_lv95eTA-1; Mon, 15 Feb 2021 18:15:08 -0500
X-MC-Unique: ZHq_BSvCNlqQch_lv95eTA-1
Received: by mail-pg1-f198.google.com with SMTP id f16so7688352pgh.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 15:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4u6inT5X3qTIeA807N/eIeiurNzjYzDxX5jLLqTX+fk=;
 b=E8R9JcMF3y6NBSgU+sj8+kTkWSERlKOAhkQk4jfpgyVL9tV324po0cLRTYrrnbzA+y
 UoapS26HWi9QgJTk33yqQRu4dO6CSSgbmusjduIDWoM6psaFpdRIsMRyxn50H/dtcICI
 Wvdl0r3L1v2CGiDr7sBOC5bUo39TcQBuChFqrf6/ROGPw7pcA9UWZCHwF9Ykw5uyJUPQ
 7cTECGcxJwhG5SOus30pMar/Vni8nmSBcpQNEq1WWKRynG/L3ETJRNBNYLqndgUk+iMg
 UDayzAgbkvHY5JybMSg/LuLSStdPFVBeH4SQjBpgMO1n4NgjvBiD749RhmzreB7CyVsq
 MyyA==
X-Gm-Message-State: AOAM533VjeyqrxcFFbz8eTBwcOZhsRpsWhURVY5VYnTDbMxy3gpnfpG/
 FGqgov7/nry+ex+T0OvlAFb8hhciWGM86m6w5Qg048MYodnQkcKUG2Y/GsWou5z/DCjoL7IaOJt
 RWz2aoyw8tETpI+pWu3Wi7opLOHAxQoY=
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr17664063plg.14.1613430906973; 
 Mon, 15 Feb 2021 15:15:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyInTND0ats4GZC91Y1Ajus6xfz7NrWLj5v8utLM7/zE3rp7CQID0AvpdhjMhl8/ci80CysbYVIsbBjRoAUcYY=
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr17664047plg.14.1613430906625; Mon, 15
 Feb 2021 15:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
In-Reply-To: <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Feb 2021 00:14:54 +0100
Message-ID: <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000f570805bb68284f"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f570805bb68284f
Content-Type: text/plain; charset="UTF-8"

Il lun 15 feb 2021, 20:56 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> Alternatively, maybe we could not deprecate this really common syntax
> pattern that's going to be in lots of peoples' examples, tutorials,
> shell scripts and command lines ?
>

Unfortunately there is no way to change the code to distinguish okay uses
from broken ones. The fundamental issue is that QemuOpts is sometimes typed
and sometimes not, so it lacks the information to say that "-chardev
socket,server" is fine but "-device virtio-blk-pci,noserial" ("set serial
number to the string 'no'") is not.

I don't plan to remove the syntax altogether from QemuOpts, but I want to
keep open the possibility of switching some options (especially -machine
and -object) to a parser which doesn't support it.

Paolo


> thanks
> -- PMM
>
>

--0000000000000f570805bb68284f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il lun 15 feb 2021, 20:56 Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritto:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Alternatively, maybe we could not depre=
cate this really common syntax<br>
pattern that&#39;s going to be in lots of peoples&#39; examples, tutorials,=
<br>
shell scripts and command lines ?<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Unfortunately there is no way to change th=
e code to distinguish okay uses from broken ones. The fundamental issue is =
that QemuOpts is sometimes typed and sometimes not, so it lacks the informa=
tion to say that &quot;-chardev socket,server&quot; is fine but &quot;-devi=
ce virtio-blk-pci,noserial&quot; (&quot;set serial number to the string &#3=
9;no&#39;&quot;) is not.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I don&#39;t plan to remove the syntax altogether from QemuOpts, but I want=
 to keep open the possibility of switching some options (especially -machin=
e and -object) to a parser which doesn&#39;t support it.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--0000000000000f570805bb68284f--


