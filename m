Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7003C1ABB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:55:35 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b3W-0003CW-4T
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oanderso@google.com>)
 id 1m1b1o-0001bZ-7I
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:53:48 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oanderso@google.com>)
 id 1m1b1l-00030V-Qb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:53:47 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4756189pjo.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhSSqyfXFkOKPNZBp7Y9bmgqaFQE/K6nOb+hHv9JUjg=;
 b=UmMA8Kbqnq0/kLKWrrLNrPIfOQ3qVONbqs6nIUTZydvHYheqPPd6/f5KvM88kfREdc
 KaXTLqy8gqx3ZUE16sV8FCG0VY0Q+epbIiUgQdaE0R/NXV38GIz7IhYBA6/p4TUCpvGA
 BmwbZ0Op99kg9BhQt6BL0BLU5xMxc/Jfr5JXeNw3X0MyWiTO+zd/506YwnukOA+7rcD1
 cXMgs6TrYnhEZEht5nS67zJ/+qCWevrx24nAIUtiNxk1IVasirbxF1L3jnLxQO1ryUY5
 tiDwy88aC2CO9gya73pxcNops+t0m8M57vR+sNQKiUD3f7ug5xi8M+5B5RQJbIX4yQEV
 OrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhSSqyfXFkOKPNZBp7Y9bmgqaFQE/K6nOb+hHv9JUjg=;
 b=Mo/OtmHksRYVvlZHKz+YGYRiHEV7SjyxW0cYA1gD1ICwkl9P6Sn804msBsk04GFf8o
 g+0apcTCuPtHN8IDZ9scMPaLsjskAMh5rEClTjAAETdSsBAy6EX9sR5kH1LOgbUkvuke
 EnLEol1ukLKV4vWbcco6WEgJ+zoFizeTnhu2Kb+uUR1kA7gspLfWFO66JAU569mHh9go
 xGHALKB5XrlrTcp1WEM6RMoTnz5GIWiSVjEpFSIJ7sK1ZJAWWCEHm/fcNTebZDPdK04Z
 LO9vQwfgOjYgpsGtg6IHEZPXsrESXs7IkL+C022P+uMCbsqsuTwAH0HDJhEWyabzFgJx
 mzpQ==
X-Gm-Message-State: AOAM533KliQ265S0uM+f5p4bzo5Q80rTefty/kLSPBPHFhBdxOOaKmTI
 UVwfJbvJMTURvtPPugqIBA6xIjiYtvljH/MtgndrQg==
X-Google-Smtp-Source: ABdhPJw5KOaCX5ybhhEhf6HaHhQ6REob+E15649jXCj1iApJDH/mp2fHtWkzuoJO2FQ1b9clzlh3kWw72y+HFk4SJDo=
X-Received: by 2002:a17:90a:d244:: with SMTP id
 o4mr6984174pjw.71.1625777622956; 
 Thu, 08 Jul 2021 13:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210701221255.107976-1-oanderso@google.com>
In-Reply-To: <20210701221255.107976-1-oanderso@google.com>
From: Owen Anderson <oanderso@google.com>
Date: Thu, 8 Jul 2021 13:53:31 -0700
Message-ID: <CAKs3XfJnFTOTT76cPZ+vbF8UA2itL7V6nrii5ha5bXtA52z=Pw@mail.gmail.com>
Subject: Re: [PATCH] fd-trans: Fix race condition on reallocation of the
 translation table.
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b3a53005c6a2d931"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=oanderso@google.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -180
X-Spam_score: -18.1
X-Spam_bar: ------------------
X-Spam_report: (-18.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3a53005c6a2d931
Content-Type: text/plain; charset="UTF-8"

Gentle ping.

--Owen

On Thu, Jul 1, 2021 at 3:12 PM Owen Anderson <oanderso@google.com> wrote:

> The mapping from file-descriptors to translator functions is not guarded
> on realloc which may cause invalid function pointers to be read from a
> previously deallocated mapping.
>
> Signed-off-by: Owen Anderson <oanderso@google.com>
> ---
>  linux-user/fd-trans.c |  1 +
>  linux-user/fd-trans.h | 55 +++++++++++++++++++++++++++++++++++++------
>  linux-user/main.c     |  3 +++
>  3 files changed, 52 insertions(+), 7 deletions(-)
>
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 23adaca836..86b6f484d3 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -267,6 +267,7 @@ enum {
>  };
>
>  TargetFdTrans **target_fd_trans;
> +QemuMutex target_fd_trans_lock;
>  unsigned int target_fd_max;
>
>  static void tswap_nlmsghdr(struct nlmsghdr *nlh)
> diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
> index a3fcdaabc7..1b9fa2041c 100644
> --- a/linux-user/fd-trans.h
> +++ b/linux-user/fd-trans.h
> @@ -16,6 +16,8 @@
>  #ifndef FD_TRANS_H
>  #define FD_TRANS_H
>
> +#include "qemu/lockable.h"
> +
>  typedef abi_long (*TargetFdDataFunc)(void *, size_t);
>  typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);
>  typedef struct TargetFdTrans {
> @@ -25,12 +27,23 @@ typedef struct TargetFdTrans {
>  } TargetFdTrans;
>
>  extern TargetFdTrans **target_fd_trans;
> +extern QemuMutex target_fd_trans_lock;
>
>  extern unsigned int target_fd_max;
>
> +static inline void fd_trans_init(void)
> +{
> +    qemu_mutex_init(&target_fd_trans_lock);
> +}
> +
>  static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->target_to_host_data;
>      }
>      return NULL;
> @@ -38,7 +51,12 @@ static inline TargetFdDataFunc
> fd_trans_target_to_host_data(int fd)
>
>  static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->host_to_target_data;
>      }
>      return NULL;
> @@ -46,13 +64,19 @@ static inline TargetFdDataFunc
> fd_trans_host_to_target_data(int fd)
>
>  static inline TargetFdAddrFunc fd_trans_target_to_host_addr(int fd)
>  {
> -    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
> +    if (fd < 0) {
> +        return NULL;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    if (fd < target_fd_max && target_fd_trans[fd]) {
>          return target_fd_trans[fd]->target_to_host_addr;
>      }
>      return NULL;
>  }
>
> -static inline void fd_trans_register(int fd, TargetFdTrans *trans)
> +static inline void internal_fd_trans_register_unsafe(int fd,
> +                                                     TargetFdTrans *trans)
>  {
>      unsigned int oldmax;
>
> @@ -67,18 +91,35 @@ static inline void fd_trans_register(int fd,
> TargetFdTrans *trans)
>      target_fd_trans[fd] = trans;
>  }
>
> -static inline void fd_trans_unregister(int fd)
> +static inline void fd_trans_register(int fd, TargetFdTrans *trans)
> +{
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_register_unsafe(fd, trans);
> +}
> +
> +static inline void internal_fd_trans_unregister_unsafe(int fd)
>  {
>      if (fd >= 0 && fd < target_fd_max) {
>          target_fd_trans[fd] = NULL;
>      }
>  }
>
> +static inline void fd_trans_unregister(int fd)
> +{
> +    if (fd < 0) {
> +        return;
> +    }
> +
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_unregister_unsafe(fd);
> +}
> +
>  static inline void fd_trans_dup(int oldfd, int newfd)
>  {
> -    fd_trans_unregister(newfd);
> +    QEMU_LOCK_GUARD(&target_fd_trans_lock);
> +    internal_fd_trans_unregister_unsafe(newfd);
>      if (oldfd < target_fd_max && target_fd_trans[oldfd]) {
> -        fd_trans_register(newfd, target_fd_trans[oldfd]);
> +        internal_fd_trans_register_unsafe(newfd, target_fd_trans[oldfd]);
>      }
>  }
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 2fb3a366a6..37ed50d98e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -48,6 +48,7 @@
>  #include "target_elf.h"
>  #include "cpu_loop-common.h"
>  #include "crypto/init.h"
> +#include "fd-trans.h"
>
>  #ifndef AT_FLAGS_PRESERVE_ARGV0
>  #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
> @@ -829,6 +830,8 @@ int main(int argc, char **argv, char **envp)
>      cpu->opaque = ts;
>      task_settid(ts);
>
> +    fd_trans_init();
> +
>      ret = loader_exec(execfd, exec_path, target_argv, target_environ,
> regs,
>          info, &bprm);
>      if (ret != 0) {
> --
> 2.32.0.93.g670b81a890-goog
>
>

--000000000000b3a53005c6a2d931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gentle ping.<div><br></div><div>--Owen</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 1,=
 2021 at 3:12 PM Owen Anderson &lt;<a href=3D"mailto:oanderso@google.com">o=
anderso@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The mapping from file-descriptors to translator functions=
 is not guarded<br>
on realloc which may cause invalid function pointers to be read from a<br>
previously deallocated mapping.<br>
<br>
Signed-off-by: Owen Anderson &lt;<a href=3D"mailto:oanderso@google.com" tar=
get=3D"_blank">oanderso@google.com</a>&gt;<br>
---<br>
=C2=A0linux-user/fd-trans.c |=C2=A0 1 +<br>
=C2=A0linux-user/fd-trans.h | 55 +++++++++++++++++++++++++++++++++++++-----=
-<br>
=C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A03 files changed, 52 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c<br>
index 23adaca836..86b6f484d3 100644<br>
--- a/linux-user/fd-trans.c<br>
+++ b/linux-user/fd-trans.c<br>
@@ -267,6 +267,7 @@ enum {<br>
=C2=A0};<br>
<br>
=C2=A0TargetFdTrans **target_fd_trans;<br>
+QemuMutex target_fd_trans_lock;<br>
=C2=A0unsigned int target_fd_max;<br>
<br>
=C2=A0static void tswap_nlmsghdr(struct nlmsghdr *nlh)<br>
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h<br>
index a3fcdaabc7..1b9fa2041c 100644<br>
--- a/linux-user/fd-trans.h<br>
+++ b/linux-user/fd-trans.h<br>
@@ -16,6 +16,8 @@<br>
=C2=A0#ifndef FD_TRANS_H<br>
=C2=A0#define FD_TRANS_H<br>
<br>
+#include &quot;qemu/lockable.h&quot;<br>
+<br>
=C2=A0typedef abi_long (*TargetFdDataFunc)(void *, size_t);<br>
=C2=A0typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);<b=
r>
=C2=A0typedef struct TargetFdTrans {<br>
@@ -25,12 +27,23 @@ typedef struct TargetFdTrans {<br>
=C2=A0} TargetFdTrans;<br>
<br>
=C2=A0extern TargetFdTrans **target_fd_trans;<br>
+extern QemuMutex target_fd_trans_lock;<br>
<br>
=C2=A0extern unsigned int target_fd_max;<br>
<br>
+static inline void fd_trans_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_mutex_init(&amp;target_fd_trans_lock);<br>
+}<br>
+<br>
=C2=A0static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (fd &gt;=3D 0 &amp;&amp; fd &lt; target_fd_max &amp;&amp;=
 target_fd_trans[fd]) {<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 if (fd &lt; target_fd_max &amp;&amp; target_fd_trans[fd]) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return target_fd_trans[fd]-&gt;target_to_=
host_data;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
@@ -38,7 +51,12 @@ static inline TargetFdDataFunc fd_trans_target_to_host_d=
ata(int fd)<br>
<br>
=C2=A0static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (fd &gt;=3D 0 &amp;&amp; fd &lt; target_fd_max &amp;&amp;=
 target_fd_trans[fd]) {<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 if (fd &lt; target_fd_max &amp;&amp; target_fd_trans[fd]) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return target_fd_trans[fd]-&gt;host_to_ta=
rget_data;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
@@ -46,13 +64,19 @@ static inline TargetFdDataFunc fd_trans_host_to_target_=
data(int fd)<br>
<br>
=C2=A0static inline TargetFdAddrFunc fd_trans_target_to_host_addr(int fd)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (fd &gt;=3D 0 &amp;&amp; fd &lt; target_fd_max &amp;&amp;=
 target_fd_trans[fd]) {<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 if (fd &lt; target_fd_max &amp;&amp; target_fd_trans[fd]) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return target_fd_trans[fd]-&gt;target_to_=
host_addr;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-static inline void fd_trans_register(int fd, TargetFdTrans *trans)<br>
+static inline void internal_fd_trans_register_unsafe(int fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TargetFdTrans *trans)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unsigned int oldmax;<br>
<br>
@@ -67,18 +91,35 @@ static inline void fd_trans_register(int fd, TargetFdTr=
ans *trans)<br>
=C2=A0 =C2=A0 =C2=A0target_fd_trans[fd] =3D trans;<br>
=C2=A0}<br>
<br>
-static inline void fd_trans_unregister(int fd)<br>
+static inline void fd_trans_register(int fd, TargetFdTrans *trans)<br>
+{<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 internal_fd_trans_register_unsafe(fd, trans);<br>
+}<br>
+<br>
+static inline void internal_fd_trans_unregister_unsafe(int fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0 &amp;&amp; fd &lt; target_fd_max) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_fd_trans[fd] =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static inline void fd_trans_unregister(int fd)<br>
+{<br>
+=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 internal_fd_trans_unregister_unsafe(fd);<br>
+}<br>
+<br>
=C2=A0static inline void fd_trans_dup(int oldfd, int newfd)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 fd_trans_unregister(newfd);<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;target_fd_trans_lock);<br>
+=C2=A0 =C2=A0 internal_fd_trans_unregister_unsafe(newfd);<br>
=C2=A0 =C2=A0 =C2=A0if (oldfd &lt; target_fd_max &amp;&amp; target_fd_trans=
[oldfd]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_trans_register(newfd, target_fd_trans[oldfd=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 internal_fd_trans_register_unsafe(newfd, targe=
t_fd_trans[oldfd]);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index 2fb3a366a6..37ed50d98e 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -48,6 +48,7 @@<br>
=C2=A0#include &quot;target_elf.h&quot;<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
=C2=A0#include &quot;crypto/init.h&quot;<br>
+#include &quot;fd-trans.h&quot;<br>
<br>
=C2=A0#ifndef AT_FLAGS_PRESERVE_ARGV0<br>
=C2=A0#define AT_FLAGS_PRESERVE_ARGV0_BIT 0<br>
@@ -829,6 +830,8 @@ int main(int argc, char **argv, char **envp)<br>
=C2=A0 =C2=A0 =C2=A0cpu-&gt;opaque =3D ts;<br>
=C2=A0 =C2=A0 =C2=A0task_settid(ts);<br>
<br>
+=C2=A0 =C2=A0 fd_trans_init();<br>
+<br>
=C2=A0 =C2=A0 =C2=A0ret =3D loader_exec(execfd, exec_path, target_argv, tar=
get_environ, regs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info, &amp;bprm);<br>
=C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
-- <br>
2.32.0.93.g670b81a890-goog<br>
<br>
</blockquote></div>

--000000000000b3a53005c6a2d931--

