Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FA323AA7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:40:08 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEraR-0003o4-6f
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErZI-0003Ny-UA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErZE-0003Yn-Dx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614163131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C50vrkTaX6k6gco3GBAYudA3yXty6RcSYIpD3hSWnu8=;
 b=Rs2aAwb9kYTQGpEhhO3JJQxVUNeS3BJ1WZy4oVhfh/mnSUAO3oVDQqWFvN9SYYiKUhxUt3
 EkKCEAu7QgKqvzg3QGwfHGVO/en4COduPZxOxjrVzrXSPRECXyXi4J5CGgqCj2OZLaQmhL
 X8tXz2EnDAPy4counmltp6m9gpFsjqQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-fICGEwksOgSHUcrwQOiD8Q-1; Wed, 24 Feb 2021 05:38:49 -0500
X-MC-Unique: fICGEwksOgSHUcrwQOiD8Q-1
Received: by mail-io1-f72.google.com with SMTP id c4so1097817ioq.15
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C50vrkTaX6k6gco3GBAYudA3yXty6RcSYIpD3hSWnu8=;
 b=XDgxfcreCTRHz4RYD5lU/NSfQ5cNieyFi9rovAC832rB08j0+EivOtzo/5mpYJX+EJ
 Pnvw/9Rb2ZJHzOS+4rS/76/4U+tJY6qQblm1+wle/CqpZeZpgOTmbacTZd6X+Rj5+b1Y
 VFtA9x1zNMHGaeoSUOFZKiwMKR+tsHVFtdb3wtvSsriLTv3AIELHgsl1Zt/PL5iAnvdy
 smB9ngSMHvz0rk2WB1W8An9/WKhx5hoXt+LZ9nkGQLMVSNzNnoB05OaQTRhYdb8apBuQ
 fZSKN9SOeY78OJYOtyTga3X6NnMHtezT0ZIUCWd2gbLDitNOrXgS583oWsdsobZ8MGHB
 fffg==
X-Gm-Message-State: AOAM533A+SdhE8xMO036kemSNKheazgcFB07q6pQFY4TXF76u5OphuFa
 uP1mgk+bu2t+tPxOZkL7lGwThl4bmsJD6BH3IDMPPVGuMx4WMlRYiqVM9JZbcOW+GLbn9k3Z82b
 yRf9IHunyxse11xCz//1yL8bgpvqQbhg=
X-Received: by 2002:a05:6e02:194a:: with SMTP id
 x10mr23412401ilu.165.1614163128874; 
 Wed, 24 Feb 2021 02:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8LjYSqVop7Fy2JlpdCFpK7MIVGFatuJBJgrsYMd7aBI+yTx0jhqleyzMqDQNqH/5PF4YuQLd4tGsOBpe27VQ=
X-Received: by 2002:a05:6e02:194a:: with SMTP id
 x10mr23412392ilu.165.1614163128744; 
 Wed, 24 Feb 2021 02:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-4-stefanha@redhat.com>
In-Reply-To: <20210222161017.570837-4-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 24 Feb 2021 14:38:37 +0400
Message-ID: <CAMxuvazAaAMUF2p8oQfD1doRMV39BiS3SGmu0+P-Rf66jHn35A@mail.gmail.com>
Subject: Re: [PATCH 3/3] vhost-user: warn when guest RAM is not shared
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e6177405bc12a3cd"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e6177405bc12a3cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 8:11 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:

> Memory regions must be mmap(MAP_SHARED) so that modifications made by
> the vhost device backend process are visible to QEMU and vice versa. Use
> the new memory_region_is_mapped_shared() function to check this and
> print a warning if guest RAM is not shared:
>
>   qemu-system-x86_64: -device vhost-user-fs-pci,chardev=3Dchar0,tag=3Dmyf=
s:
> warning: Found vhost-user memory region without MAP_SHARED (did you forge=
t
> -object memory-*,share=3Don?)
>   qemu-system-x86_64: Failed to read from slave.
>
> This warning makes it clear that memory needs to be configured with
> share=3Don. Without this patch the vhost device is initialized and the
> device fails with vague error messages caused by inconsistent memory
> views. The warning should make it easier to troubleshoot QEMU
> command-lines that lack share=3Don memory.
>
> I couldn't figure out how to make this a vhost_dev_init() error, because
> memory regions aren't necessarily final when it is called. Also, hotplug
> can add memory regions without MAP_SHARED in the future, so we still
> need to warn about that.
>
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/virtio/vhost-user.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 2fdd5daf74..17c2fb81be 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2223,11 +2223,23 @@ vhost_user_crypto_close_session(struct vhost_dev
> *dev, uint64_t session_id)
>  static bool vhost_user_mem_section_filter(struct vhost_dev *dev,
>                                            MemoryRegionSection *section)
>  {
> -    bool result;
> +    /* An fd is required so we can pass it to the device backend process
> */
> +    if (memory_region_get_fd(section->mr) < 0) {
> +        return false;
> +    }
>
> -    result =3D memory_region_get_fd(section->mr) >=3D 0;
> -
> -    return result;
> +    /*
> +     * It must be mmap(MAP_SHARED) so memory stores from the device
> backend
> +     * process are visible to us and vice versa.
> +     */
> +    if (!memory_region_is_mapped_shared(section->mr)) {
> +        static bool warned;
> +        warn_report_once_cond(&warned, "Found vhost-user memory region "
> +                "without MAP_SHARED (did you forget -object "
> +                "memory-*,share=3Don?)");
> +        return false;
> +    }
> +    return true;
>  }
>
>  static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
> --
> 2.29.2
>
>

--000000000000e6177405bc12a3cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2021 at 8:11 PM Stefa=
n Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Me=
mory regions must be mmap(MAP_SHARED) so that modifications made by<br>
the vhost device backend process are visible to QEMU and vice versa. Use<br=
>
the new memory_region_is_mapped_shared() function to check this and<br>
print a warning if guest RAM is not shared:<br>
<br>
=C2=A0 qemu-system-x86_64: -device vhost-user-fs-pci,chardev=3Dchar0,tag=3D=
myfs: warning: Found vhost-user memory region without MAP_SHARED (did you f=
orget -object memory-*,share=3Don?)<br>
=C2=A0 qemu-system-x86_64: Failed to read from slave.<br>
<br>
This warning makes it clear that memory needs to be configured with<br>
share=3Don. Without this patch the vhost device is initialized and the<br>
device fails with vague error messages caused by inconsistent memory<br>
views. The warning should make it easier to troubleshoot QEMU<br>
command-lines that lack share=3Don memory.<br>
<br>
I couldn&#39;t figure out how to make this a vhost_dev_init() error, becaus=
e<br>
memory regions aren&#39;t necessarily final when it is called. Also, hotplu=
g<br>
can add memory regions without MAP_SHARED in the future, so we still<br>
need to warn about that.<br>
<br>
Reported-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D"_=
blank">kwolf@redhat.com</a>&gt;<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/virtio/vhost-user.c | 20 ++++++++++++++++----<br>
=C2=A01 file changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c<br>
index 2fdd5daf74..17c2fb81be 100644<br>
--- a/hw/virtio/vhost-user.c<br>
+++ b/hw/virtio/vhost-user.c<br>
@@ -2223,11 +2223,23 @@ vhost_user_crypto_close_session(struct vhost_dev *d=
ev, uint64_t session_id)<br>
=C2=A0static bool vhost_user_mem_section_filter(struct vhost_dev *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MemoryRegionSection *section)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool result;<br>
+=C2=A0 =C2=A0 /* An fd is required so we can pass it to the device backend=
 process */<br>
+=C2=A0 =C2=A0 if (memory_region_get_fd(section-&gt;mr) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 result =3D memory_region_get_fd(section-&gt;mr) &gt;=3D 0;<b=
r>
-<br>
-=C2=A0 =C2=A0 return result;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* It must be mmap(MAP_SHARED) so memory stores from th=
e device backend<br>
+=C2=A0 =C2=A0 =C2=A0* process are visible to us and vice versa.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!memory_region_is_mapped_shared(section-&gt;mr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 static bool warned;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report_once_cond(&amp;warned, &quot;Found=
 vhost-user memory region &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;without MAP_=
SHARED (did you forget -object &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;memory-*,sha=
re=3Don?)&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
<br>
=C2=A0static int vhost_user_get_inflight_fd(struct vhost_dev *dev,<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--000000000000e6177405bc12a3cd--


