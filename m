Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315226B1BDF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 07:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paAC1-00072p-MM; Thu, 09 Mar 2023 01:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paABv-00072Y-VD
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 01:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paABs-0000Er-6G
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 01:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678344950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHnfH8aHMKOiahggKWMXECA3R2c2g1vYmO3ZQYGTBTc=;
 b=LjWoz3x1XynEOHle/NzUZ0SAibeb2Y8fCroumYjEgNjjtfF91/uvyf0kxBSWSMkzcG9RPA
 be+FuFl+CZdAnCgUFylqzVM2nQetvfsLiE/0uqLNuS3QytWNMO5WMzaHK0ec3R+Xi4Q9dh
 8NXTgLTOg4BJhisG5dBwzEauCCjU4Z0=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-JQnMbKTrO_iF4lbdCSJv7Q-1; Thu, 09 Mar 2023 01:55:48 -0500
X-MC-Unique: JQnMbKTrO_iF4lbdCSJv7Q-1
Received: by mail-vs1-f71.google.com with SMTP id
 t24-20020a67f158000000b0041eb81820fbso362759vsm.3
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 22:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678344947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHnfH8aHMKOiahggKWMXECA3R2c2g1vYmO3ZQYGTBTc=;
 b=xC6cbOy1fyxpNk+EqJoJnsIou9nLrPMwygyj7wv7Q5LMpOTh7cIk/dBDNZQP/V53zk
 pVV0ExqeiWWsjX+V8KjrpXwJFLk+zUTi8tWp4WMTLuLYyJuHUJecxRCJcwxMKBslVlmx
 ewGHbsqbguxjKAXJIUxNfSt1J+UH9Vs082RHD9KZynlX4V0Zyh/Iz6G3L3x6dkHYN7L7
 b3sRAYiIbD83pdJ3ityVKjQoqkp3BHQLnL7qXQtqPvy/1pgiTsIQtDL2v/PwjJnp30K1
 5SySUGeZYSvU3kXyQKUadriLXpFNINjoDaCml/HQLYLc3BxtwfBky+fYL+y374heaTdA
 pJuw==
X-Gm-Message-State: AO0yUKWiFptBoBfe2w67rkMwX1TGrmvWlWHUnz7GQG23wYVl8GC1gSZR
 Wk3BBmg1iP0YU7D3Yxl5sKZkALhNy4Ijw+sWlUg+Q2trIg/a0baTtu+n6aacyx0j7eesNTDaGgT
 BEM5qXNtKxyQOJbnoUoj9XfEG9Nfowms=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr14162470vsl.7.1678344947693; 
 Wed, 08 Mar 2023 22:55:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8xAOyQ19vFRjxswKyQSSOmxQWmrL2Uu9Tv3X1Gl78g2BaPzdlo1elG7L60OXFDAedSBr7arqBnHwI5Gbff36c=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr14162451vsl.7.1678344947334; Wed, 08 Mar
 2023 22:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20230308141204.718786-1-thuth@redhat.com>
In-Reply-To: <20230308141204.718786-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Mar 2023 07:55:35 +0100
Message-ID: <CABgObfbuMXDXpp+z3D95sf1RfDnc=6gTB60d2Fi35JquE34kOg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about the upcoming KVM Forum 2023
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000658c9b05f67222d7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000658c9b05f67222d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Il mer 8 mar 2023, 15:12 Thomas Huth <thuth@redhat.com> ha scritto:

> Based on the announcement e-mail that Paolo sent to the qemu-devel
> mailing list two days ago - let's spread the word via the blog, too!
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  _posts/2023-03-08-kvm-forum-cfp.md | 62 ++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 _posts/2023-03-08-kvm-forum-cfp.md
>
> diff --git a/_posts/2023-03-08-kvm-forum-cfp.md
> b/_posts/2023-03-08-kvm-forum-cfp.md
> new file mode 100644
> index 0000000..8daf934
> --- /dev/null
> +++ b/_posts/2023-03-08-kvm-forum-cfp.md
> @@ -0,0 +1,62 @@
> +---
> +layout: post
> +title:  "KVM Forum 2023: Call for presentations"
> +date:   2023-03-08 13:45:00 +0100
> +categories: [presentations, conferences]
> +---
> +
> +[KVM Forum](https://kvm-forum.qemu.org/2023/) is an annual event that
> presents
> +a rare opportunity for KVM and QEMU developers and users to discuss the
> state
> +of Linux irtualization technology and plan for the challenges ahead.
> Sessions
> +include updates on the state of the KVM virtualization stack, planning
> for the
> +future, and many opportunities for attendees to collaborate.
> +
> +This year's event will be held in Brno, Czech Republic on June 14-15,
> 2023.
> +It will be in-person only and will be held right before the
> +[DevConf.CZ](https://www.devconf.info/cz/) open source community
> conference.
> +
> +June 14 will be at least partly dedicated to a hackathon or "day of BoFs=
".
> +This will provide time for people to get together and discuss strategic
> +decisions, as well as other topics that are best solved within smaller
> groups.
> +
> +## Call for presentations
> +
> +We encourage you to submit presentations via the
> +[KVM Forum CfP page](https://kvm-forum.qemu.org/2023/cfp).
> + Suggested topics include:
> +
> +* Scalability and Optimization
> +* Hardening and security
> +* Confidential computing
> +* Testing
> +* KVM and the Linux Kernel:
> +  * New Features and Ports
> +  * Device Passthrough: VFIO, mdev, vDPA
> +  * Network Virtualization
> +  * Virtio and vhost
> +* Virtual Machine Monitors and Management:
> +  * VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
> +  * Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon
> +  * QEMU without KVM: Hypervisor.framework and other hypervisors
> +  * Managing KVM: Libvirt, KubeVirt, Kata Containers
> +* Emulation:
> +  * New Devices, Boards and Architectures
> +  * CPU Emulation and Binary Translation
> +
> +The deadline for submitting presentations is April 2, 2023 - 11:59 PM PD=
T.
> +Accepted speakers will be notified on April 17, 2023.
> +
> +## Attending KVM Forum
> +
> +Admission to KVM Forum and DevConf.CZ is free. However,
> +[registration](https://kvm-forum.qemu.org/2023/register/) is required
> and the
> +number of attendees is limited by the space available at the venue.
> +
> +The DevConf.CZ program will feature technical talks on a variety of
> topics,
> +including cloud and virtualization infrastructure=E2=80=94so make sure t=
o register
> +for DevConf.CZ as well if you would like to attend.
> +
> +Both conferences are committed to fostering an open and welcoming
> environment
> +for everybody. Participants are expected to abide by the
> +[Devconf.cz code of conduct](https://www.devconf.info/coc/)
> +and [media policy](https://www.devconf.info/media-policy/).
> --
> 2.31.1
>
>

--000000000000658c9b05f67222d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini=
@redhat.com">pbonzini@redhat.com</a>&gt;</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 8 mar 2023, 15:12 Thomas Hut=
h &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Based on the announcement e-mai=
l that Paolo sent to the qemu-devel<br>
mailing list two days ago - let&#39;s spread the word via the blog, too!<br=
>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0_posts/2023-03-08-kvm-forum-cfp.md | 62 +++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 62 insertions(+)<br>
=C2=A0create mode 100644 _posts/2023-03-08-kvm-forum-cfp.md<br>
<br>
diff --git a/_posts/2023-03-08-kvm-forum-cfp.md b/_posts/2023-03-08-kvm-for=
um-cfp.md<br>
new file mode 100644<br>
index 0000000..8daf934<br>
--- /dev/null<br>
+++ b/_posts/2023-03-08-kvm-forum-cfp.md<br>
@@ -0,0 +1,62 @@<br>
+---<br>
+layout: post<br>
+title:=C2=A0 &quot;KVM Forum 2023: Call for presentations&quot;<br>
+date:=C2=A0 =C2=A02023-03-08 13:45:00 +0100<br>
+categories: [presentations, conferences]<br>
+---<br>
+<br>
+[KVM Forum](<a href=3D"https://kvm-forum.qemu.org/2023/" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://kvm-forum.qemu.org/2023/</a>) is an =
annual event that presents<br>
+a rare opportunity for KVM and QEMU developers and users to discuss the st=
ate<br>
+of Linux irtualization technology and plan for the challenges ahead. Sessi=
ons<br>
+include updates on the state of the KVM virtualization stack, planning for=
 the<br>
+future, and many opportunities for attendees to collaborate.<br>
+<br>
+This year&#39;s event will be held in Brno, Czech Republic on June 14-15, =
2023.<br>
+It will be in-person only and will be held right before the<br>
+[DevConf.CZ](<a href=3D"https://www.devconf.info/cz/" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://www.devconf.info/cz/</a>) open source c=
ommunity conference.<br>
+<br>
+June 14 will be at least partly dedicated to a hackathon or &quot;day of B=
oFs&quot;.<br>
+This will provide time for people to get together and discuss strategic<br=
>
+decisions, as well as other topics that are best solved within smaller gro=
ups.<br>
+<br>
+## Call for presentations<br>
+<br>
+We encourage you to submit presentations via the<br>
+[KVM Forum CfP page](<a href=3D"https://kvm-forum.qemu.org/2023/cfp" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://kvm-forum.qemu.org/202=
3/cfp</a>).<br>
+ Suggested topics include:<br>
+<br>
+* Scalability and Optimization<br>
+* Hardening and security<br>
+* Confidential computing<br>
+* Testing<br>
+* KVM and the Linux Kernel:<br>
+=C2=A0 * New Features and Ports<br>
+=C2=A0 * Device Passthrough: VFIO, mdev, vDPA<br>
+=C2=A0 * Network Virtualization<br>
+=C2=A0 * Virtio and vhost<br>
+* Virtual Machine Monitors and Management:<br>
+=C2=A0 * VMM Implementation: APIs, Live Migration, Performance Tuning, etc=
.<br>
+=C2=A0 * Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon<br=
>
+=C2=A0 * QEMU without KVM: Hypervisor.framework and other hypervisors<br>
+=C2=A0 * Managing KVM: Libvirt, KubeVirt, Kata Containers<br>
+* Emulation:<br>
+=C2=A0 * New Devices, Boards and Architectures<br>
+=C2=A0 * CPU Emulation and Binary Translation<br>
+<br>
+The deadline for submitting presentations is April 2, 2023 - 11:59 PM PDT.=
<br>
+Accepted speakers will be notified on April 17, 2023.<br>
+<br>
+## Attending KVM Forum<br>
+<br>
+Admission to KVM Forum and DevConf.CZ is free. However,<br>
+[registration](<a href=3D"https://kvm-forum.qemu.org/2023/register/" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://kvm-forum.qemu.org/202=
3/register/</a>) is required and the<br>
+number of attendees is limited by the space available at the venue.<br>
+<br>
+The DevConf.CZ program will feature technical talks on a variety of topics=
,<br>
+including cloud and virtualization infrastructure=E2=80=94so make sure to =
register<br>
+for DevConf.CZ as well if you would like to attend.<br>
+<br>
+Both conferences are committed to fostering an open and welcoming environm=
ent<br>
+for everybody. Participants are expected to abide by the<br>
+[Devconf.cz code of conduct](<a href=3D"https://www.devconf.info/coc/" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://www.devconf.info/coc/<=
/a>)<br>
+and [media policy](<a href=3D"https://www.devconf.info/media-policy/" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://www.devconf.info/media=
-policy/</a>).<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000658c9b05f67222d7--


