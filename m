Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3D651C3D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7XoG-0001kC-FH; Tue, 20 Dec 2022 03:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7XoD-0001k0-Q4
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7XoB-0001KG-Ir
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671524226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qVgeryACL6aKnpZ1xGbpdztpennq7+1CBITzGStE3D8=;
 b=dLGyk6Ab4L5HC2pD25iGtZgpaqpOqnK+jOp6KE1gYLxatf3VqHhSha94ipYFuaoTxhV8JO
 8LVy+r+GP2qQq8P72Tyc53MWaDiiF/lOoIHb54AP1mO5jRwYQ+NTW2YA5sXOnMkkO87V+6
 Pa1N6LkZeJwuDRmweAdu6fs6s1ZbM7o=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-elHPpfrgMtujfLYW0umgiA-1; Tue, 20 Dec 2022 03:17:03 -0500
X-MC-Unique: elHPpfrgMtujfLYW0umgiA-1
Received: by mail-vk1-f198.google.com with SMTP id
 w6-20020a1f9406000000b00388997b8d31so3736728vkd.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 00:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVgeryACL6aKnpZ1xGbpdztpennq7+1CBITzGStE3D8=;
 b=crBKfwNM/WwTrm+CX34iBP/lVECz9wx0xRD+qI6JekR/6VQU5VcWu5KP8wnOPiDTnM
 R0GZX4XQlAvhkoM9KuVNiCowQ0IYq5SoCZA2uqv4qmHp7C3K+ZOp5iKnFkTG833L78OY
 kIEzCItHySzIDpYZCR/NRSHO98gulIpvqS45RvIVp4E4GKWGMqmufXxJHOQHtcYEUU8R
 FrQlTw2hnKTKQnfh9guJBNr5j7zBepLd8nBnK2WBtvKNQ/f48x381oI2TkuPHqdJsiXE
 tuaX3rDm71FuXrdRyKdLyUnlNnadYw651xen9r6JrDgyd/vppTUF6akOd727augSQ7Hu
 rV0Q==
X-Gm-Message-State: ANoB5plS5hRMy2lEjXmxJRAQ5rxjf4WtGeAFmSH4H8abRbTmxIpUYi8X
 rsbNYO4Cj/nym7cLGFwt5YegG/qOvTjakGKIA2rKDZ/2wGYU1xtHOc2frGSmP0RsrkGJnU6LY4S
 m+N4vapx4rVYUExUA7iDZNAxpWOl9AB8=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr47885279uao.75.1671524223068; 
 Tue, 20 Dec 2022 00:17:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7HfhjE1n5ZB8k71niLGoJ44mYwTUn6YYfn1QRx6IND+S42QXwfXDtUX32E1TCsZ/pS6CpNyxKiDKnnK3UR7Vk=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr47885276uao.75.1671524222746; Tue, 20
 Dec 2022 00:17:02 -0800 (PST)
MIME-Version: 1.0
References: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
In-Reply-To: <3ce8e739-4894-b79e-1972-f972fd763e5b@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 Dec 2022 09:16:50 +0100
Message-ID: <CABgObfaWX=x-RinK0F+XbYi1oVHF53kiahb7FLQjBuoR4eQ_UQ@mail.gmail.com>
Subject: Re: Should -overcommit cpu-pm=on|off be converted to some machine
 sugar property?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000087dcba05f03e0ff7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--00000000000087dcba05f03e0ff7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's implemented only for x86, but it is not architecture-dependent. For
example on ARM you would implement it by mapping guest WFx to the host
instructions.

Paolo

Il lun 19 dic 2022, 17:11 Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> h=
a
scritto:

> Hi Paolo,
>
> I just noticed 'enable_cpu_pm' which seems architecture specific
> option that ended into common code:
>
> $ git grep -E 'cpu[_-]pm'
> accel/tcg/user-exec-stub.c:5:bool enable_cpu_pm =3D false;
> include/sysemu/sysemu.h:49:extern bool enable_cpu_pm;
> Binary file pc-bios/skiboot.lid matches
> qemu-options.hx:4196:    "-overcommit [mem-lock=3Don|off][cpu-pm=3Don|off=
]\n"
> qemu-options.hx:4199:    "                cpu-pm=3Don|off controls cpu
> power management (default: off)\n",
> qemu-options.hx:4204:``-overcommit cpu-pm=3Don|off``
> qemu-options.hx:4214:    guest) can be enabled via ``cpu-pm=3Don``
> (disabled by default). This
> softmmu/globals.c:38:bool enable_cpu_pm;
> softmmu/vl.c:350:            .name =3D "cpu-pm",
> softmmu/vl.c:3440:                enable_cpu_pm =3D
> qemu_opt_get_bool(opts, "cpu-pm", false);
> target/i386/host-cpu.c:44:static void host_cpu_enable_cpu_pm(X86CPU *cpu)
> target/i386/host-cpu.c:88:    if (cpu->max_features && enable_cpu_pm) {
> target/i386/host-cpu.c:89:        host_cpu_enable_cpu_pm(cpu);
> target/i386/kvm/kvm-cpu.c:43:        if (enable_cpu_pm &&
> kvm_has_waitpkg()) {
> target/i386/kvm/kvm.c:390:        if (enable_cpu_pm) {
> target/i386/kvm/kvm.c:2576:    if (enable_cpu_pm) {
>
> Do we want to maintain this as a generic property or
> can it be deprecated / converted to a machine-specific one?
>
> Thanks,
>
> Phil.
>
>

--00000000000087dcba05f03e0ff7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s implemented only for x86, but it is not architec=
ture-dependent. For example on ARM you would implement it by mapping guest =
WFx to the host instructions.<div dir=3D"auto"><br></div><div dir=3D"auto">=
Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Il lun 19 dic 2022, 17:11 Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hi Paolo,<br>
<br>
I just noticed &#39;enable_cpu_pm&#39; which seems architecture specific<br=
>
option that ended into common code:<br>
<br>
$ git grep -E &#39;cpu[_-]pm&#39;<br>
accel/tcg/user-exec-stub.c:5:bool enable_cpu_pm =3D false;<br>
include/sysemu/sysemu.h:49:extern bool enable_cpu_pm;<br>
Binary file pc-bios/skiboot.lid matches<br>
qemu-options.hx:4196:=C2=A0 =C2=A0 &quot;-overcommit [mem-lock=3Don|off][cp=
u-pm=3Don|off]\n&quot;<br>
qemu-options.hx:4199:=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 cpu-pm=3Don|off controls cpu <br>
power management (default: off)\n&quot;,<br>
qemu-options.hx:4204:``-overcommit cpu-pm=3Don|off``<br>
qemu-options.hx:4214:=C2=A0 =C2=A0 guest) can be enabled via ``cpu-pm=3Don`=
` <br>
(disabled by default). This<br>
softmmu/globals.c:38:bool enable_cpu_pm;<br>
softmmu/vl.c:350:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;=
cpu-pm&quot;,<br>
softmmu/vl.c:3440:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
nable_cpu_pm =3D <br>
qemu_opt_get_bool(opts, &quot;cpu-pm&quot;, false);<br>
target/i386/host-cpu.c:44:static void host_cpu_enable_cpu_pm(X86CPU *cpu)<b=
r>
target/i386/host-cpu.c:88:=C2=A0 =C2=A0 if (cpu-&gt;max_features &amp;&amp;=
 enable_cpu_pm) {<br>
target/i386/host-cpu.c:89:=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_cpu_enable_cpu_p=
m(cpu);<br>
target/i386/kvm/kvm-cpu.c:43:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enable_cpu_pm =
&amp;&amp; <br>
kvm_has_waitpkg()) {<br>
target/i386/kvm/kvm.c:390:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enable_cpu_pm) {<=
br>
target/i386/kvm/kvm.c:2576:=C2=A0 =C2=A0 if (enable_cpu_pm) {<br>
<br>
Do we want to maintain this as a generic property or<br>
can it be deprecated / converted to a machine-specific one?<br>
<br>
Thanks,<br>
<br>
Phil.<br>
<br>
</blockquote></div>

--00000000000087dcba05f03e0ff7--


