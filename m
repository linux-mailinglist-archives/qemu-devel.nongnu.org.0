Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAE608CAB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 13:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omCBi-00029f-2X; Sat, 22 Oct 2022 06:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omCBU-00029I-Ss
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 06:56:56 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1omCBQ-0006VR-D5
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 06:56:55 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 137so4238813iou.9
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+m9k7u8RE9ZHl2X4bvR6tutHPyt/3GYOXT7MsTzGk8=;
 b=ToPVdflQZl6GhTcOzJi6m/qKOflnK0p8JudDBk8Nsi0OZis8Y8duaMBxlpyFgfWkmE
 D26eyT8TFIWcyd1JNnqmXWz3GCxuvfUvDHBEveLPpX3T86IjNiXZ0ResKHwiUq97E17w
 L+A0oewOKecHpdW5aqFfnnDf/GwTteuvCEmJ7c+AzqIFv8bFChDvkET/zdk/gtwj0lAF
 QDhrKmyicECynycRFLJK4X0iI2zS7VBaS0sx/0CdF4Upx4c9SfD8o33EQwFj4s4M8e7F
 lnDEM88URMRMteeZq1I1c2Bf9oN7/kj+8tQny7B6oQRJhqbPnm9wWIGl4ZmP4KsgpwMi
 eT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+m9k7u8RE9ZHl2X4bvR6tutHPyt/3GYOXT7MsTzGk8=;
 b=xNa6ju39u2/J798EX2/Nh24Nf6AVM4XnnLfDNO35lZ4ZslYe8wgZmRWSOJYtsHBf5l
 KgOI/TVZu28FKxUSvztW08oCUAFJoLnfSAhtSZCoiiS7zgwY/QwxLRKu6vOwWyH28RfX
 xUPVGi6GAQ76c/BdWemXqseVxD3GvduPUU14QQmYQwXIchbFc4nTunxIbe4nvcGTBTzg
 p2rARs/VaSczINsWgBNePQyBgmkFIljASIYin1A7PU/1jmdrLAXelQTXX4rdj/SWHSsy
 agf5+x87K2sM/ymXTCY7eFy1Po+++H9pSmpVHAxxuwxaqY+kcvrEu3RK5P4BVA+fonTT
 gTyw==
X-Gm-Message-State: ACrzQf3qgA2ghboDLeay323Ywicwog/++GfokAeZDj7hvQG6w/dvE3wB
 t5GUHOfJUZ5zS35SZDXyiL5ZSNSrRBdOxO/vizgnRw==
X-Google-Smtp-Source: AMsMyM5bGc61egeJQMCAgu12aL00JSgmx6jsBsdyHQz30eM65czsTQcnqtK1RITmFCxDVXGF95k30pSDZ9yW5OzJehw=
X-Received: by 2002:a05:6638:12d1:b0:363:e250:9ed with SMTP id
 v17-20020a05663812d100b00363e25009edmr18051218jas.309.1666436210204; Sat, 22
 Oct 2022 03:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org> <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
 <87pmel5fm7.fsf@linaro.org>
In-Reply-To: <87pmel5fm7.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 22 Oct 2022 16:26:38 +0530
Message-ID: <CAARzgwyz3uEvV-kgprzxefEYFji0E9tUG6vWi22Yxa7C8=fJfw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000059b40705eb9d6a41"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000059b40705eb9d6a41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 9:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
> >
> >  On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <alex.bennee@linaro.or=
g>
> wrote:
> >
> >  Ani Sinha <ani@anisinha.ca> writes:
> >
> >  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >  >>
> >  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
> >  >> >
> >  >> > Ani Sinha <ani@anisinha.ca> writes:
> >  >> >
> >  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <
> mst@redhat.com> wrote:
> >  >> > >>
> >  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> >  >> > >> > And have multiple platform specific branches in bits that
> have fixes for those
> >  >> > >> > platforms so that bits can run there. Plus the existing test
> can be enhanced to
> >  >> > >> > pull in binaries from those branches based on the platform o=
n
> which it is being
> >  >> > >> > run.
> >  >> > >> >
> >  >> > >>
> >  >> > >> What a mess.
> >  >> > >> Who is going to be testing all these million platforms?
> >  >> > >
> >  >> > > I am not talking about branches in QEMU but branches in bits.
> >  >> > > If you are going to test multiple platforms, you do need to
> build bits
> >  >> > > binaries for them. There is no way around it.
> >  >> > > bits is not all platform independent python. It does have binar=
y
> executables.
> >  >> > >
> >  >> > > Currently bits is built only for the x86 platform. Other
> platforms are
> >  >> > > not tested. I doubt if anyone even tried building bits for arm =
or
> >  >> > > mips.
> >  >> >
> >  >> > I'm not worried about test bits on other targets, but we do run x=
86
> >  >> > targets on a number of hosts. The current reliance on a special
> patched
> >  >> > host build tool for only one architecture is the problem. If  we
> just
> >  >> > download the iso that problem goes away.
> >  >>
> >  >> =F0=9F=91=8Dwhat he said.
> >  >
> >  > Yes, in that case the problem is that upstream bits does not pass al=
l
> >  > the test out of the box. Hence we are taking this approach of keepin=
g
> >  > some test scripts in QEMU repo and modifying them. Then generating t=
he
> >  > iso with the modified scripts. It also helps developers who want to
> >  > write new tests or make enhancements to existing tests.
> >  > If modifications need to be made to tests, they need to be versioned=
.
> >  > We have gone through the route of not using submodules and I am not
> >  > going to open that can of worms again.
> >
> >  We have added a mirror of biosbits to the QEMU project so there is no
> >  reason why we can't track changes and modifications there (we do this
> >  for TestFloat which is forked from the upstream SoftFloat code).
> >
> >  The whole idea was that say an acpi developer added support for a new
> table in QEMU, he should write a
> >  corresponding test for bits so that the same table is exercised during
> run time. Making those changes from a single
> >  repo (either directly or through a submodule)  makes things lit simple=
r
> and also keeps things in sync with each
> >  other. If we use separate repos for acpi bits test, it will be another
> mess when comes to developers adding changes
> >  and keeping things in sync.
>
> For people that care about ACPI it shouldn't be that hard. Most QEMU
> developers have separate repos of test cases that aren't directly
> integrated into QEMU for various things (e.g. RISU, semihosting,
> baremetal, kvm-unit-tests, LTP).
>
> > Not only this. let's look at the developers workflow.
> >
> > (A) check out bits repo.
> > (B) write new test.
> > (C) build the bits iso.
> > (D) get back to QEMU repo.
> > (E) point the test to the new iso so that the test gets executed.
>
> This seems like a long winded workflow. Usually you test your binaries
> before integrating them into the acceptance tests. All you need is a
> script to launch qemu (either system or point at a developer binary) and
> run directly. Only once you are happy with the final ISO


And how would you know which iso is the final iso? You need several trial
runs with added test and building bits iso with it. Each time an iso is
generated, it must be launched with a qemu using the right command line
which the test automatically generates for the developer. Hence you either
need to examine what command line the test uses or use the test script
directly with the iso you generated and collect the logs. The test script
is in one repo, the bits is in one repo. Since bits is not a sub module,
the developer has to check out both repos separately and go back and forth.

And how are you supposed to explain all this to a guy who submitted a acpi
patch? You don't need to because you don't review acpi patches but I do.

My last 2 cents.


>

--00000000000059b40705eb9d6a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 9:32 PM Alex Benn=C3=A9e &lt;<a hre=
f=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank">ani@anis=
inha.ca</a>&gt; writes:<br>
<br>
&gt; On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, &lt;<a href=3D"mailto:ani@ani=
sinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, &lt;<a href=3D"m=
ailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&=
gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blan=
k">ani@anisinha.ca</a>&gt; writes:<br>
&gt;<br>
&gt;=C2=A0 &gt; On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrot=
e:<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=
=A9e wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" t=
arget=3D"_blank">ani@anisinha.ca</a>&gt; writes:<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; On Fri, Oct 21, 2022 at 2:02 PM Michael S. Ts=
irkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.co=
m</a>&gt; wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; On Fri, Oct 21, 2022 at 05:45:15AM +0530,=
 Ani Sinha wrote:<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; And have multiple platform specific =
branches in bits that have fixes for those<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; platforms so that bits can run there=
. Plus the existing test can be enhanced to<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; pull in binaries from those branches=
 based on the platform on which it is being<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt; run.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; What a mess.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;&gt; Who is going to be testing all these mill=
ion platforms?<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; I am not talking about branches in QEMU but b=
ranches in bits.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; If you are going to test multiple platforms, =
you do need to build bits<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; binaries for them. There is no way around it.=
<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; bits is not all platform independent python. =
It does have binary executables.<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; Currently bits is built only for the x86 plat=
form. Other platforms are<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; not tested. I doubt if anyone even tried buil=
ding bits for arm or<br>
&gt;=C2=A0 &gt;&gt; &gt; &gt; mips.<br>
&gt;=C2=A0 &gt;&gt; &gt;<br>
&gt;=C2=A0 &gt;&gt; &gt; I&#39;m not worried about test bits on other targe=
ts, but we do run x86<br>
&gt;=C2=A0 &gt;&gt; &gt; targets on a number of hosts. The current reliance=
 on a special patched<br>
&gt;=C2=A0 &gt;&gt; &gt; host build tool for only one architecture is the p=
roblem. If=C2=A0 we just<br>
&gt;=C2=A0 &gt;&gt; &gt; download the iso that problem goes away.<br>
&gt;=C2=A0 &gt;&gt;<br>
&gt;=C2=A0 &gt;&gt; =F0=9F=91=8Dwhat he said.<br>
&gt;=C2=A0 &gt;<br>
&gt;=C2=A0 &gt; Yes, in that case the problem is that upstream bits does no=
t pass all<br>
&gt;=C2=A0 &gt; the test out of the box. Hence we are taking this approach =
of keeping<br>
&gt;=C2=A0 &gt; some test scripts in QEMU repo and modifying them. Then gen=
erating the<br>
&gt;=C2=A0 &gt; iso with the modified scripts. It also helps developers who=
 want to<br>
&gt;=C2=A0 &gt; write new tests or make enhancements to existing tests.<br>
&gt;=C2=A0 &gt; If modifications need to be made to tests, they need to be =
versioned.<br>
&gt;=C2=A0 &gt; We have gone through the route of not using submodules and =
I am not<br>
&gt;=C2=A0 &gt; going to open that can of worms again.<br>
&gt;<br>
&gt;=C2=A0 We have added a mirror of biosbits to the QEMU project so there =
is no<br>
&gt;=C2=A0 reason why we can&#39;t track changes and modifications there (w=
e do this<br>
&gt;=C2=A0 for TestFloat which is forked from the upstream SoftFloat code).=
<br>
&gt;<br>
&gt;=C2=A0 The whole idea was that say an acpi developer added support for =
a new table in QEMU, he should write a<br>
&gt;=C2=A0 corresponding test for bits so that the same table is exercised =
during run time. Making those changes from a single<br>
&gt;=C2=A0 repo (either directly or through a submodule)=C2=A0 makes things=
 lit simpler and also keeps things in sync with each<br>
&gt;=C2=A0 other. If we use separate repos for acpi bits test, it will be a=
nother mess when comes to developers adding changes<br>
&gt;=C2=A0 and keeping things in sync.<br>
<br>
For people that care about ACPI it shouldn&#39;t be that hard. Most QEMU<br=
>
developers have separate repos of test cases that aren&#39;t directly<br>
integrated into QEMU for various things (e.g. RISU, semihosting,<br>
baremetal, kvm-unit-tests, LTP).<br>
<br>
&gt; Not only this. let&#39;s look at the developers workflow.<br>
&gt;<br>
&gt; (A) check out bits repo.<br>
&gt; (B) write new test.<br>
&gt; (C) build the bits iso.<br>
&gt; (D) get back to QEMU repo.<br>
&gt; (E) point the test to the new iso so that the test gets executed.<br>
<br>
This seems like a long winded workflow. Usually you test your binaries<br>
before integrating them into the acceptance tests. All you need is a<br>
script to launch qemu (either system or point at a developer binary) and<br=
>
run directly. Only once you are happy with the final ISO </blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">And how would you know which iso i=
s the final iso? You need several trial runs with added test and building b=
its iso with it. Each time an iso is generated, it must be launched with a =
qemu using the right command line which the test automatically generates fo=
r the developer. Hence you either need to examine what command line the tes=
t uses or use the test script directly with the iso you generated and colle=
ct the logs. The test script is in one repo, the bits is in one repo. Since=
 bits is not a sub module, the developer has to check out both repos separa=
tely and go back and forth.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">And how are you supposed to explain all this to a guy who submitt=
ed a acpi patch? You don&#39;t need to because you don&#39;t review acpi pa=
tches but I do.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">My=
 last 2 cents.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br></blockquote></div></div>

--00000000000059b40705eb9d6a41--

