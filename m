Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93059E520
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:32:38 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUxJ-00027a-8S
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oQUud-000057-Nr
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oQUuZ-0008HD-FS
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661264979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qo2ativMqFLTzKX182imyjELyKBlN0+K24Geey/C9f4=;
 b=FiIssDvLQkw2tXI7xV25X67Rm6dmqLGy5inIL5vHi+KEIMAYscbuvnu9pXxaBaiolUMxd4
 FwH5FkXD7PwOvu8y+j45fXAPqtF7w9C+SK1u8LdmJVe5sg40tuwoi4J7wLJ4lWbmsT/wWU
 oqTMTaYW5ADxOoQHGnEjQlzbqf8uNeE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-FwiADgoSNiaqsllBiHkIQQ-1; Tue, 23 Aug 2022 10:29:38 -0400
X-MC-Unique: FwiADgoSNiaqsllBiHkIQQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 67-20020a671546000000b0038ab6223414so3478004vsv.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 07:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Qo2ativMqFLTzKX182imyjELyKBlN0+K24Geey/C9f4=;
 b=Y+cU++3wat8vhiI5a80fQo31D1SA/QUVT6mY7vru2FL3Cva5mSSklv7R6jxXD+SUC1
 2EUVLszXvZXXDaK1AIgOMfClVRulgFo7RvW0YzrAPmtJnOANDXraRy2Zfx6Q0S8oUWp0
 fTxyrZZVaFJmU7VVBs6WYTDzFopWR1fncdfc66IbEv4uzvxXO6GVjQXrW69S/G1/nZod
 9LuD0s52V8YtH5FiPGaATe9qEphDBJdZju+lSF4dY0fozutK3arU2W3/1MvaX6KiuNPQ
 XdZZcA2DQjz59JpSI4uvXIt4ak6gz5/v9ZlI2Pr2xeyr+TyyHhjvOZW11M75jLGQA7+B
 2Puw==
X-Gm-Message-State: ACgBeo09hOEOhkT7LvgaolvjV8mBdnsPrrCEEgkzLbr9p4/Rq5AWsj6T
 iHUo7FHKssKpS4F1qzbPhjlje2mCvus2/xDTqlcBF7kJ1Y4DBRAkPQD5F8inUNWCCNkeQ+1kBzR
 fVaniIiHxa6xwLGjeXCIrcAbsRvVk/O4=
X-Received: by 2002:a05:6102:3e1f:b0:388:9dab:9bef with SMTP id
 j31-20020a0561023e1f00b003889dab9befmr8642540vsv.38.1661264978072; 
 Tue, 23 Aug 2022 07:29:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6wBl+cvgcX2AP4zLVyKG9ZKUl4I4BMn5cC6JVzAUuXgFL2H+WZuvjF0vKa3909PXo7i1QidPR5lh1gpib0x+M=
X-Received: by 2002:a05:6102:3e1f:b0:388:9dab:9bef with SMTP id
 j31-20020a0561023e1f00b003889dab9befmr8642531vsv.38.1661264977824; Tue, 23
 Aug 2022 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220818165358.217613-1-jsnow@redhat.com>
 <CABJz62M8_197kahaNtBC1eSda5WJo6i7B1tsKF5+uMD+HXfj_A@mail.gmail.com>
In-Reply-To: <CABJz62M8_197kahaNtBC1eSda5WJo6i7B1tsKF5+uMD+HXfj_A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 23 Aug 2022 10:29:26 -0400
Message-ID: <CAFn=p-ZDaxx978qHGTJnxYnja0hn8RF8d9fbnGYZtRO5GJO=-w@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add signing pubkey for python-qemu-qmp package
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e1a4b605e6e9646d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

--000000000000e1a4b605e6e9646d
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022, 5:16 AM Andrea Bolognani <abologna@redhat.com> wrote:

> On Thu, Aug 18, 2022 at 12:53:58PM -0400, John Snow wrote:
> > Add the pubkey currently used for signing PyPI releases of qemu.qmp to a
> > stable location where it can be referenced by e.g. Fedora RPM specfiles.
> >
> > At present, the key happens to just simply be my own -- but future
> > releases may be signed by a different key. In that case, we can
> > increment '1.txt' to '2.txt' and so on. The old keys should be left in
> > place.
> >
> > The format for the keyfile was chosen by copying what OpenStack was
> > doing:
> >
> https://releases.openstack.org/_static/0x2426b928085a020d8a90d0d879ab7008d0896c8a.txt
> >
> > Generated with:
> > > gpg --with-fingerprint --list-keys jsnow@redhat.com > pubkey
> > > gpg --armor --export jsnow@redhat.com >> pubkey
>
> You might want to pass
>
>   --export-options export-minimal
>
> to the second command in order to obtain a significantly smaller file
> that can still serve the intended purpose.
>

OK, I'll test with this option. Thanks!

((Doesn't know anything about gpg))


> --
> Andrea Bolognani / Red Hat / Virtualization
>
>

--000000000000e1a4b605e6e9646d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 23, 2022, 5:16 AM Andrea Bolognani &lt;<a =
href=3D"mailto:abologna@redhat.com">abologna@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, Aug 18, 2022 at 12:53:58PM -040=
0, John Snow wrote:<br>
&gt; Add the pubkey currently used for signing PyPI releases of qemu.qmp to=
 a<br>
&gt; stable location where it can be referenced by e.g. Fedora RPM specfile=
s.<br>
&gt;<br>
&gt; At present, the key happens to just simply be my own -- but future<br>
&gt; releases may be signed by a different key. In that case, we can<br>
&gt; increment &#39;1.txt&#39; to &#39;2.txt&#39; and so on. The old keys s=
hould be left in<br>
&gt; place.<br>
&gt;<br>
&gt; The format for the keyfile was chosen by copying what OpenStack was<br=
>
&gt; doing:<br>
&gt; <a href=3D"https://releases.openstack.org/_static/0x2426b928085a020d8a=
90d0d879ab7008d0896c8a.txt" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://releases.openstack.org/_static/0x2426b928085a020d8a90d0d879ab7008d=
0896c8a.txt</a><br>
&gt;<br>
&gt; Generated with:<br>
&gt; &gt; gpg --with-fingerprint --list-keys <a href=3D"mailto:jsnow@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a> &gt; pubkey=
<br>
&gt; &gt; gpg --armor --export <a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a> &gt;&gt; pubkey<br>
<br>
You might want to pass<br>
<br>
=C2=A0 --export-options export-minimal<br>
<br>
to the second command in order to obtain a significantly smaller file<br>
that can still serve the intended purpose.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">OK, I&#39;ll test with this optio=
n. Thanks!</div><div dir=3D"auto"><br></div><div dir=3D"auto">((Doesn&#39;t=
 know anything about gpg))</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Andrea Bolognani / Red Hat / Virtualization<br>
<br>
</blockquote></div></div></div>

--000000000000e1a4b605e6e9646d--


