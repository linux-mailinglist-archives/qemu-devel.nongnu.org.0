Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EF6A67B9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:50:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGHr-0007y5-JX; Wed, 01 Mar 2023 01:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1pXGHo-0007xZ-6k
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:50:00 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1pXGHl-0001Bc-4u
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 01:49:59 -0500
Received: by mail-lf1-x135.google.com with SMTP id m6so16341589lfq.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 22:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1677653395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8K0tBmXsDwmMTS0Xw/y/rJZmUaKX3ViXK6hrhD+MXW8=;
 b=2YSULTPljmh9kX8yPKXISK53yCG0FJHi9Pcpr5wqHdyhKP99sQ/QXsM4cN6QwhY113
 EDy63rqiHwGNyVuY5vxvDAmvWhtjDmu0Q3MRYp6ezGQNgcIWJ/46YRtmHTBr+bK8tRQG
 GleZi9Q8BqswrIoXxDGiiGpcbV5CZF4WirvuUIAvGR+DKx509W+G/7DndesrchMectgG
 vpdz7vQLQJBMXkDtmCyzo4+8Rl5Tue9sRGMmF1gKE+f3UttfJlw/i5bC6FmZqT69N44d
 d26rY1uANGIX72sUjCv+WNs/POApUjisrUCbfVu9HH1PaFSb/IFQ9D/OsFNE4iLsPEfX
 ttHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677653395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8K0tBmXsDwmMTS0Xw/y/rJZmUaKX3ViXK6hrhD+MXW8=;
 b=wTUmmC3X1pGQn9uJShd+W1zj0m6QmCAr7GrTPq/8VVP36qx5957/dX6tXC/kuKe8zi
 o6m25Hm4liLOg01IGHASlvQeRFE6+VYb172JURM5G+8u4XmUwXyjTdVPqkuXCx5YmG40
 tII4XeM4Y+OuaBALpcQuYxisHsKnDQ6Tjig3+bObA1PZVGqaxDAd22eF9BQmBPni8ZcJ
 TppTo0WHS4Gn7RHhMd3f1F/lH19JNvK9WPyc77KrqrSd8SCKd5+EJWIwsIkzmo3edbpI
 Peqny3nx/vKfuu91YBhen1gKCgh8wNLa3t2AqJblX9IXoE5cekqxKaTQAPltA7Ym/7y9
 u+WA==
X-Gm-Message-State: AO0yUKWNyvhFyO4S3g21u3l1ohx/4c9kq9Hk9iAzBLZYfmUDCXaj0i4c
 zY8lxgbZ1SVWRtxlCDHsi+qWJfcVNw4Nv0yYbcbqmw==
X-Google-Smtp-Source: AK7set/fkxrIJT64uXkVIV71u8CQ48Vvm5wjGguyqkQqdSk19YL9Mog2RrYUX4R2ullqUKSrhOlp33JXWqsqgYajJVw=
X-Received: by 2002:a05:6512:118d:b0:4db:37ff:f5d0 with SMTP id
 g13-20020a056512118d00b004db37fff5d0mr2925480lfr.1.1677653395197; Tue, 28 Feb
 2023 22:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com>
In-Reply-To: <Y/5CQ5md6huqNsx4@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 1 Mar 2023 08:49:42 +0200
Message-ID: <CAOEp5OdDU1PUySjUK1w9qtOtfWGnrpOAjF19AVzB0aDsX=bpiA@mail.gmail.com>
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com, 
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com, yan@daynix.com
Content-Type: multipart/alternative; boundary="000000000000ad666605f5d11e40"
Received-SPF: none client-ip=2a00:1450:4864:20::135;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-lf1-x135.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ad666605f5d11e40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 8:05=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> On Tue, Feb 28, 2023 at 11:56:27AM +0200, Yuri Benditovich wrote:
> > On Mon, Feb 20, 2023 at 11:50=E2=80=AFAM Daniel P. Berrang=C3=A9 <berra=
nge@redhat.com
> >
> > wrote:
> >
> > > On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
> > > > Added a function to check the stamp in the helper.
> > > > eBPF helper should have a special symbol that generates during the
> build.
> > > > QEMU checks the helper and determines that it fits, so the helper
> > > > will produce proper output.
> > >
> > > I think this is quite limiting for in place upgrades.
> > >
> > > Consider this scenario
> > >
> > >  * Host has QEMU 8.1.0 installed
> > >  * VM is running QEMU 8.1.0
> > >  * QEMU 8.1.1 is released with a bug fix in the EBF program
> > >  * Host is upgraded to QEMU 8.1.1
> > >  * User attempts to hotplug a NIC to the running VM
> > >
> > > IIUC this last step is going to fail because we'll be loading
> > > the EBF program from 8.1.1 and so its hash is different from
> > > that expected by the QEMU 8.1.0 that the pre-existing VM is
> > > running.
> > >
> > >   Indeed we did not take in account the in-place upgrade.
> >
> >
> >
> > > If some changes to the EBF program are not going to be back
> > > compatible from the POV of the QEMU process, should we instead
> > > be versioning the EBF program. eg so new QEMU will ship both
> > > the old and new versions of the EBF program.
> >
> > This does not seem to be an elegant option: QEMU theoretically can
> include
> > different eBPF programs but it hardly can interface with each one of
> them.
> > The code of QEMU (access to eBPF maps etc) includes header files which
> eBPF
> > of the day is being built with them.
> >
> > I see 2 options to address this issue (of course there are more)
> > 1. Build and install qemu-rss-helper-<hash> executable. Libvirt will
> always
> > have a correct name, so for the running instance it will use
> > qemu-rss-helper-<old-hash>, for the new instance it will use
> > qemu-rss-helper-<new-hash>
>
> We'll get an ever growing number of program variants we need to
> build & distribute with each new QEMU release.
>

New release of the qemu-rss-helper-<new-hash> will be created in fact only
when the eBPF binary is updated.
This does not happen on each release. But yes, this looks like versioning
of all the shared libraries.


>
> > 2. Build the helper executable and link it inside qemu as a blob. Libvi=
rt
> > will always retrieve the executable to the temporary file name and use
> it.
> > So the retrieved helper will always be compatible with QEMU. I'm not su=
re
> > what is the most portable way to do that.
>
> QEMU is considered an untrusted process, so there's no way we're going
> to ask it to give us an ELF binary and then execute that in privileged
> context.
>
> > Does one of these seem suitable?
>
> Neither feels very appealing to me.
>
> I've been trying to understand the eBPF code we're dealing with in a
> little more detail.
>
> IIUC, QEMU, or rather the virtio-net  driver needs to receive one FD
> for the BPF program, and one or more FDs for the BPF maps that the
> program uses. Currently it uses 3 maps, so needs 3 map FDs on top of
> the program FD.
>
> The helper program that is proposed here calls ebpf_rss_load() to
> load the program and get back a struct which gives access to the
> 4 FDs, which are then sent to the mgmt app, which forwards them
> onto QEMU.
>
> The ebpf_rss_load() method is making use of various structs that
> are specific to the RSS program implementation, but does not seems
> to do anything especially interesting.  It calls into rss_bpf__open()
> which eventually gets around to calling rss_bpf__create_skeleton
> which is where the interesting stuff happens.
>
> This rss_bpf__create_skeleton() method is implemented in terms of
> totally generic libbpf APIs, and has the actual blob that is the
> BPF program.
>
> Looking at what this does, I feel it should be trivial for a mgmt
> app to implement equivalent logic to rss_bpf__create_skeleton in a
> generic manner, if we could just expose the program blob and the
> map names to the mgmt app. eg a simple json file
>
>   {
>      "maps": [
>         "tap_rss_map_configurations",
>         "tap_rss_map_indirection_table",
>         "tap_rss_map_toeplitz_key",
>      ],
>      "program": "....the big blob encoded in base64..."
>   }
>
> if we installed that file are /usr/share/qemu/bpf/net-rss.json
> then when a QEMU process is started, the mgmt app capture the
> data in this JSON file. It now has enough info to create the
> EBPF programs needed and pass the FDs over to QEMU. This would
> be robust against QEMU software upgrades, and not tied to the
> specific EBPF program imlp. We can add or remove maps / change
> their names etc any time, as the details in the JSON descriptor
> can be updated.  This avoids need for any special helper program
> to be provided by QEMU with the problems that is throwing up
> for us.
>

If I understand correctly, the libvirt will have the same problem in the
in-place update scenario with the JSON file
Let's say that there is no virtio-net device at the initial start and the
libvirt does not need to load the JSON file.
On the later hot plug of virtio-net it will go to the JSON file after the
update, correct?


>
> What am I missing ?  This seems pretty straightforward to
> achieve from what I see.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000ad666605f5d11e40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 28, 2023 at 8:05=E2=80=AF=
PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berra=
nge@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, Feb 28, 2023 at 11:56:27AM +0200, Yuri Benditovich wr=
ote:<br>
&gt; On Mon, Feb 20, 2023 at 11:50=E2=80=AFAM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrot=
e:<br>
&gt; &gt; &gt; Added a function to check the stamp in the helper.<br>
&gt; &gt; &gt; eBPF helper should have a special symbol that generates duri=
ng the build.<br>
&gt; &gt; &gt; QEMU checks the helper and determines that it fits, so the h=
elper<br>
&gt; &gt; &gt; will produce proper output.<br>
&gt; &gt;<br>
&gt; &gt; I think this is quite limiting for in place upgrades.<br>
&gt; &gt;<br>
&gt; &gt; Consider this scenario<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 * Host has QEMU 8.1.0 installed<br>
&gt; &gt;=C2=A0 * VM is running QEMU 8.1.0<br>
&gt; &gt;=C2=A0 * QEMU 8.1.1 is released with a bug fix in the EBF program<=
br>
&gt; &gt;=C2=A0 * Host is upgraded to QEMU 8.1.1<br>
&gt; &gt;=C2=A0 * User attempts to hotplug a NIC to the running VM<br>
&gt; &gt;<br>
&gt; &gt; IIUC this last step is going to fail because we&#39;ll be loading=
<br>
&gt; &gt; the EBF program from 8.1.1 and so its hash is different from<br>
&gt; &gt; that expected by the QEMU 8.1.0 that the pre-existing VM is<br>
&gt; &gt; running.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Indeed we did not take in account the in-place upgrad=
e.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; If some changes to the EBF program are not going to be back<br>
&gt; &gt; compatible from the POV of the QEMU process, should we instead<br=
>
&gt; &gt; be versioning the EBF program. eg so new QEMU will ship both<br>
&gt; &gt; the old and new versions of the EBF program.<br>
&gt; <br>
&gt; This does not seem to be an elegant option: QEMU theoretically can inc=
lude<br>
&gt; different eBPF programs but it hardly can interface with each one of t=
hem.<br>
&gt; The code of QEMU (access to eBPF maps etc) includes header files which=
 eBPF<br>
&gt; of the day is being built with them.<br>
&gt; <br>
&gt; I see 2 options to address this issue (of course there are more)<br>
&gt; 1. Build and install qemu-rss-helper-&lt;hash&gt; executable. Libvirt =
will always<br>
&gt; have a correct name, so for the running instance it will use<br>
&gt; qemu-rss-helper-&lt;old-hash&gt;, for the new instance it will use<br>
&gt; qemu-rss-helper-&lt;new-hash&gt;<br>
<br>
We&#39;ll get an ever growing number of program variants we need to<br>
build &amp; distribute with each new QEMU release.<br></blockquote><div><br=
></div><div>New release of the qemu-rss-helper-&lt;new-hash&gt; will be cre=
ated in fact only when the eBPF binary is updated.</div><div>This does not =
happen on each release. But yes, this looks like versioning of all the shar=
ed libraries.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; 2. Build the helper executable and link it inside qemu as a blob. Libv=
irt<br>
&gt; will always retrieve the executable to the temporary file name and use=
 it.<br>
&gt; So the retrieved helper will always be compatible with QEMU. I&#39;m n=
ot sure<br>
&gt; what is the most portable way to do that.<br>
<br>
QEMU is considered an untrusted process, so there&#39;s no way we&#39;re go=
ing<br>
to ask it to give us an ELF binary and then execute that in privileged<br>
context.<br>
<br>
&gt; Does one of these seem suitable?<br>
<br>
Neither feels very appealing to me.<br>
<br>
I&#39;ve been trying to understand the eBPF code we&#39;re dealing with in =
a<br>
little more detail.<br>
<br>
IIUC, QEMU, or rather the virtio-net=C2=A0 driver needs to receive one FD<b=
r>
for the BPF program, and one or more FDs for the BPF maps that the<br>
program uses. Currently it uses 3 maps, so needs 3 map FDs on top of<br>
the program FD.<br>
<br>
The helper program that is proposed here calls ebpf_rss_load() to<br>
load the program and get back a struct which gives access to the<br>
4 FDs, which are then sent to the mgmt app, which forwards them<br>
onto QEMU.<br>
<br>
The ebpf_rss_load() method is making use of various structs that<br>
are specific to the RSS program implementation, but does not seems<br>
to do anything especially interesting.=C2=A0 It calls into rss_bpf__open()<=
br>
which eventually gets around to calling rss_bpf__create_skeleton<br>
which is where the interesting stuff happens.<br>
<br>
This rss_bpf__create_skeleton() method is implemented in terms of<br>
totally generic libbpf APIs, and has the actual blob that is the<br>
BPF program.<br>
<br>
Looking at what this does, I feel it should be trivial for a mgmt<br>
app to implement equivalent logic to rss_bpf__create_skeleton in a<br>
generic manner, if we could just expose the program blob and the<br>
map names to the mgmt app. eg a simple json file<br>
<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0&quot;maps&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tap_rss_map_configurations&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tap_rss_map_indirection_table&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tap_rss_map_toeplitz_key&quot;,<br>
=C2=A0 =C2=A0 =C2=A0],<br>
=C2=A0 =C2=A0 =C2=A0&quot;program&quot;: &quot;....the big blob encoded in =
base64...&quot;<br>
=C2=A0 }<br>
<br>
if we installed that file are /usr/share/qemu/bpf/net-rss.json<br>
then when a QEMU process is started, the mgmt app capture the<br>
data in this JSON file. It now has enough info to create the<br>
EBPF programs needed and pass the FDs over to QEMU. This would<br>
be robust against QEMU software upgrades, and not tied to the<br>
specific EBPF program imlp. We can add or remove maps / change<br>
their names etc any time, as the details in the JSON descriptor<br>
can be updated.=C2=A0 This avoids need for any special helper program<br>
to be provided by QEMU with the problems that is throwing up<br>
for us.<br></blockquote><div><br></div><div>If I understand correctly, the =
libvirt will have the same problem in the in-place update scenario with the=
 JSON file=C2=A0</div><div>Let&#39;s say that there is no virtio-net device=
 at the initial start and the libvirt does not need to load the JSON file.<=
/div><div>On the later hot plug of virtio-net it will go to the JSON file a=
fter the update, correct?</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
What am I missing ?=C2=A0 This seems pretty straightforward to<br>
achieve from what I see.<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--000000000000ad666605f5d11e40--

