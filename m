Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D660DC61
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 09:43:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onb3d-0002Xr-4a; Wed, 26 Oct 2022 03:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1onb3S-0002IY-W9
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1onb3Q-0004YJ-Gk
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666770143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C5InzWrzEYDLZWYliFoCxb0G2fSwBXHTwBGrQCnZ6yM=;
 b=S1vfhCLt0Oci++/doXTbEi3CmO9HFEgZDgnwg/uq5cnZha686JKt93kRNKtW8SJHEIvEoD
 EGwKrLF3t6e0APcBo0jClxa7j9Ht4gDAp0XqwpPOB+iDBCO9ZXAkLRCjOJ7olL8xD/qmWn
 nA59VjeXz4E3KWa7G20KhvTK9y8yd+U=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120--c6cip4wOHmx_0ehEjZhjg-1; Wed, 26 Oct 2022 03:42:18 -0400
X-MC-Unique: -c6cip4wOHmx_0ehEjZhjg-1
Received: by mail-il1-f197.google.com with SMTP id
 g13-20020a056e021e0d00b002fc57cd18e3so13014871ila.11
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 00:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5InzWrzEYDLZWYliFoCxb0G2fSwBXHTwBGrQCnZ6yM=;
 b=7oOJGJUAPXFgCaqrTYNnPyPumYc9yxPVThnnX16Z6jet9GFn26yfcECk5i1z2SOuxf
 a/S2E5dwX6cduWZHT8rl1EQoyOu1yAia8jJ/vwGhFo8cNI9vEPoqkxhl8KMWhxSJm6WJ
 kY6FFhjppGUp1ZMO8ZDTHqI/6txUaBQfzt9tbrJFkpUt2VeRCg2FEi5impD9NoxleDS2
 8wIKTsoTCm8jcU9fwVswTNBIftjZbXXQ8wIEw9QjJHhI0Yo/lJ0v1SUEBxkmhBiyUO/p
 nVxTTXml9fVE/X2k+0Gbc71rvMvxWixZSHwh57LFg+R5VsZqjXBfW+OKIVELYTHanYOd
 gRcA==
X-Gm-Message-State: ACrzQf2WoZqMiyvCi+9VZ6cRXQFv6fQUGoC1OHiTPNkmYXOjAWJvgrJV
 ew9mIMlILRGOVe0gOrbAl/wC4GZpAYJnmGKksQiv7eyulf3BlJOKghCtLHsJYhQvlsTsZs/E98P
 AsPks5LQFpY5ul7m+oj1MArZyCnDcR/s=
X-Received: by 2002:a05:6602:3ca:b0:6a4:16a0:9862 with SMTP id
 g10-20020a05660203ca00b006a416a09862mr25990967iov.217.1666770135892; 
 Wed, 26 Oct 2022 00:42:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67XGeMoHLnQu/eypeN5gH+4EDtYJ++tWVCdv3K6nI1iIkYIpaSlLXYiCTtsOVw846bnQjXOu9uquH4NuUiTjw=
X-Received: by 2002:a05:6602:3ca:b0:6a4:16a0:9862 with SMTP id
 g10-20020a05660203ca00b006a416a09862mr25990959iov.217.1666770135594; Wed, 26
 Oct 2022 00:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
 <CAJSP0QUGGN7KuBzr=8q5erpUiVZUK+kvfgxwfjW6Z3TODYZwJA@mail.gmail.com>
In-Reply-To: <CAJSP0QUGGN7KuBzr=8q5erpUiVZUK+kvfgxwfjW6Z3TODYZwJA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 26 Oct 2022 11:42:04 +0400
Message-ID: <CAMxuvawBJC13Xpv4PoaU-piJWaXEBQjaXfbCRbpvOYEzrvqq5A@mail.gmail.com>
Subject: Re: [PULL v2 00/11] Dump patches
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dacf1e05ebeb2977"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000dacf1e05ebeb2977
Content-Type: text/plain; charset="UTF-8"

Hi Janosch

On Wed, Oct 26, 2022 at 1:37 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Please solve this CI failure:
>
> c++ -o qemu-system-s390x ...
> /usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in
> function `arch_sections_add':
>
> /home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s390x/arch_dump.c:392:
> undefined reference to `kvm_s390_get_protected_dump'
> /usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in
> function `cpu_get_dump_info':
>
> /home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s390x/arch_dump.c:452:
> undefined reference to `kvm_s390_get_protected_dump'
> collect2: error: ld returned 1 exit status
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3226673649
>
>
Ok to squash this with "s390x: Add protected dump cap" patch ? that should
solve it hopefully.

diff --git a/target/s390x/kvm/stubs.c b/target/s390x/kvm/stubs.c
new file mode 100644
index 0000000000..5fd63b9a7e
--- /dev/null
+++ b/target/s390x/kvm/stubs.c
@@ -0,0 +1,12 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "kvm_s390x.h"
+
+int kvm_s390_get_protected_dump(void)
+{
+    return false;
+}
diff --git a/target/s390x/kvm/meson.build b/target/s390x/kvm/meson.build
index d1356356b1..aef52b6686 100644
--- a/target/s390x/kvm/meson.build
+++ b/target/s390x/kvm/meson.build
@@ -1,6 +1,8 @@

 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
   'kvm.c'
+), if_false: files(
+  'stubs.c'
 ))

--000000000000dacf1e05ebeb2977
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Janosch<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 1:37 AM Stefan =
Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please=
 solve this CI failure:<br>
<br>
c++ -o qemu-system-s390x ...<br>
/usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in<br>
function `arch_sections_add&#39;:<br>
/home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s39=
0x/arch_dump.c:392:<br>
undefined reference to `kvm_s390_get_protected_dump&#39;<br>
/usr/bin/ld: libqemu-s390x-softmmu.fa.p/target_s390x_arch_dump.c.o: in<br>
function `cpu_get_dump_info&#39;:<br>
/home/gitlab-runner/builds/Y1MP9VSY/0/qemu-project/qemu/build/../target/s39=
0x/arch_dump.c:452:<br>
undefined reference to `kvm_s390_get_protected_dump&#39;<br>
collect2: error: ld returned 1 exit status<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/3226673649" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/32=
26673649</a><br>
<br></blockquote><div><br></div><div>Ok to squash this with &quot;s390x: Ad=
d protected dump cap&quot; patch ? that should solve it hopefully.</div><di=
v><br></div><div>diff --git a/target/s390x/kvm/stubs.c b/target/s390x/kvm/s=
tubs.c<br>new file mode 100644<br>index 0000000000..5fd63b9a7e<br>--- /dev/=
null<br>+++ b/target/s390x/kvm/stubs.c<br>@@ -0,0 +1,12 @@<br>+/*<br>+ * SP=
DX-License-Identifier: GPL-2.0-or-later<br>+ */<br>+<br>+#include &quot;qem=
u/osdep.h&quot;<br>+<br>+#include &quot;kvm_s390x.h&quot;<br>+<br>+int kvm_=
s390_get_protected_dump(void)<br>+{<br>+ =C2=A0 =C2=A0return false;<br>+}<b=
r>diff --git a/target/s390x/kvm/meson.build b/target/s390x/kvm/meson.build<=
br>index d1356356b1..aef52b6686 100644<br>--- a/target/s390x/kvm/meson.buil=
d<br>+++ b/target/s390x/kvm/meson.build<br>@@ -1,6 +1,8 @@<br>=C2=A0<br>=C2=
=A0s390x_ss.add(when: &#39;CONFIG_KVM&#39;, if_true: files(<br>=C2=A0 =C2=
=A0&#39;kvm.c&#39;<br>+), if_false: files(<br>+ =C2=A0&#39;stubs.c&#39;<br>=
=C2=A0))<br>=C2=A0<br></div></div></div>

--000000000000dacf1e05ebeb2977--


