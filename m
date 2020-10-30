Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632DD29FE7A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 08:31:54 +0100 (CET)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYOt7-0002Md-Ff
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 03:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYOr0-0001N1-6b; Fri, 30 Oct 2020 03:29:42 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kYOqy-0003kd-ER; Fri, 30 Oct 2020 03:29:41 -0400
Received: by mail-ed1-x542.google.com with SMTP id p93so5573693edd.7;
 Fri, 30 Oct 2020 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G5Y2ybGQFFg/Q1IWxTbgDWrthNCdA5cUZUHcaXIADVo=;
 b=juU6YdlGOZQXGNSlK6wUIxSw0U6XVMJQsmW5ibCAI622UsHp5E6SjA0yRhdlz6lAIP
 evU517XRKe2S5Fpk9P4VTTju9LQenjJZCPfj3qXLMcjWjYOJTEqL1xZ6oQPcG38NwdHc
 Dh5K7GdPUEmgCh9cOtdLqayGtqbpm5xHi1sS6WWttMqRk+PBBF2s3rw2tQEZw16vsGCs
 PtSBs1A4BvvkqG+sdoFmuTaTPoAchM4twXNwVJQsrRmNuIFvnCTPViRnYIK4Dv8HbhPN
 fmBS+HcBbGvyYgBJNzao06S9VzmPgMFMyTJ7FkhjmEmwWtArTT+zlkYGm5wS8/qIPiCp
 lF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5Y2ybGQFFg/Q1IWxTbgDWrthNCdA5cUZUHcaXIADVo=;
 b=pUiLlTroSlVNSjXfT2VjRWpaIZR7Ijgg1e/Ya7AgUs6H0FdsJneOvYz6vqJNGufgJo
 4GmjZx+/Jqc3CERg7kcZmHL0yf4eR6fOWmJj2zTdeEx1GTkTnNrdIMriW7BjMLc5h7w9
 xnENRkrA8SgvxqGjM8u3zpjvcKpemwg1B2IfxdImupQrNaqaG2B47IH1K7S1fyaE4F03
 TT251ipVFtxCpMWLdb6CQo2RB/suhMHISRkVY3N4ulkOzH1/gQ3vau9NF9M7uHtgrktj
 A9MQWIjyNlABsVzidbopCPkolYEtkDxa3PymEzyPobUTMydJm2e1FOfEmUU99Xat72ZT
 JghQ==
X-Gm-Message-State: AOAM530Zq1T/IJN9xx1ckJN0YGKcnnn4o2H1DPgN0V9XZPqzFtbFIKQ1
 Dk+cGAmJC6CHyeZv14huxCVxkoesbtdla3GgxBI=
X-Google-Smtp-Source: ABdhPJzgtC+eSdWPUt4jhEkUAj9Oql/sHSTe5c6CKejoOmRHDQyaVOsgc0U8MOpXF2K9JdY6i3DC7Y1XTKxw/FXy4f4=
X-Received: by 2002:a50:a441:: with SMTP id v1mr905994edb.30.1604042977710;
 Fri, 30 Oct 2020 00:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-10-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Oct 2020 11:29:25 +0400
Message-ID: <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
Subject: Re: [PATCH 09/36] qdev: Make qdev_get_prop_ptr() get Object* arg
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e41a3005b2de5b99"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e41a3005b2de5b99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 2:07 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> Make the code more generic and not specific to TYPE_DEVICE.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

Nice cleanup!, but fails to build atm

../hw/block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (fir=
st use in this
function); did you mean =E2=80=98vdev=E2=80=99?
  403 |     if (dev->realized) {

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e41a3005b2de5b99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:07 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ma=
ke the code more generic and not specific to TYPE_DEVICE.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Nice cleanup!, but fails to build atm</div><div><br></div><div>../hw/=
block/xen-block.c:403:9: error: =E2=80=98dev=E2=80=99 undeclared (first use=
 in this function); did you mean =E2=80=98vdev=E2=80=99?<br>=C2=A0 403 | =
=C2=A0 =C2=A0 if (dev-&gt;realized) {</div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e41a3005b2de5b99--

