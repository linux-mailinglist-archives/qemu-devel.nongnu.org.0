Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387793F95A1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:57:48 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWk5-0005ke-9m
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mJWXw-0004VE-MK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mJWXt-0002Y9-8s
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630050299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejHQSb1xbb/2MdZmeZwRMCUCt81brY6R6aJHA1YulEw=;
 b=cXbb8lObmyuMl3P+8+8R7OVYva/WnlPn0+43gAiKyrAiOPXeJ4wCDJVjb0zYWPZQcy8poc
 zU8HEA17CxG/G5iXVylk2liucUNLDGx6nJnJN4zZUF0VcYtnyYHXM6mITIsjZfRhBvg4ix
 Mj9vXpy9BKNMAN6YT4QadmCodzoRs6o=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-WOq-jBMBNE2sqh69zixSYA-1; Fri, 27 Aug 2021 03:44:57 -0400
X-MC-Unique: WOq-jBMBNE2sqh69zixSYA-1
Received: by mail-pl1-f197.google.com with SMTP id
 r11-20020a170902c60b00b0012d99290650so456405plr.9
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 00:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejHQSb1xbb/2MdZmeZwRMCUCt81brY6R6aJHA1YulEw=;
 b=k7xMHHHKmq3kj2CUnFHj+O2lb+NGG2tT0oX12QNGjVAChUoeTZnyMAxxfOBK4zH2Ix
 IcSIl36C/uzNKG6b6nBnxrPhem4Ak3H2lAbYJ56uSN7nIt9qIbc5gaYh6RuWeF+iryQe
 DsHtot5VG+kKRQIC1+XBgPqQVcYXuyKvc3+9D4yDVBtYu3nTZslG2Dw9XsC+1fyhSIr/
 7SibByhJia062V3c8HsVwIYGk/oONmbRGS2JQ7icLxssBcniAzXzb5lO2UnANRg/HzLF
 RlYJJUs9S22uk4jAllmhXNqFyF7vTFPNcbXC1CUimdNGFDO8nYtitiQl0c3cPsWqro+8
 Za4Q==
X-Gm-Message-State: AOAM530Au3mcLqKUKUspBJWAG6R5RZlOI/Hu0nQgIY7Bo7OZwnaluQXH
 Yzw7+0Y4jraz08wKgX9wTY3jvrsC6wgclJNlKMtopxFZtXYrgHLo7qKkUEavVhl8EtXDG7ITP5B
 sdfAxRlng9ywBsmZenba2EH+3c6AO1tg=
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr6705714pjb.200.1630050296347; 
 Fri, 27 Aug 2021 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpu1WaSf/JCRw/McpGuBxncW0eumuihlzZayojdYMgyq5WyiGMczskCgoQZhne8CXKN7MKdjsSGK722krM7W8=
X-Received: by 2002:a17:90a:fe8e:: with SMTP id
 co14mr6705692pjb.200.1630050296072; 
 Fri, 27 Aug 2021 00:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210826185813.248441-1-peterx@redhat.com>
 <20210826185813.248441-4-peterx@redhat.com>
In-Reply-To: <20210826185813.248441-4-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 27 Aug 2021 11:44:45 +0400
Message-ID: <CAMxuvayocGDRH-PDf3LQPjcCh-XD1Sor2aHUAi1DEfFPHmjrKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dump-guest-memory: Block live migration
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dd1f2005ca85a81e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dd1f2005ca85a81e
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Aug 26, 2021 at 10:58 PM Peter Xu <peterx@redhat.com> wrote:

> Both dump-guest-memory and live migration caches vm state at the beginning.
> Either of them entering the other one will cause race on the vm state, and
> even
> more severe on that (please refer to the crash report in the bug link).
>
> Let's block live migration in dump-guest-memory, and that'll also block
> dump-guest-memory if it detected that we're during a live migration.
>
> Side note: migrate_del_blocker() can be called even if the blocker is not
> inserted yet, so it's safe to unconditionally delete that blocker in
> dump_cleanup (g_slist_remove allows no-entry-found case).
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  dump/dump.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index ab625909f3..9c1c1fb738 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -29,6 +29,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "hw/misc/vmcoreinfo.h"
> +#include "migration/blocker.h"
>
>  #ifdef TARGET_X86_64
>  #include "win_dump.h"
> @@ -47,6 +48,8 @@
>
>  #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
>
> +static Error *dump_migration_blocker;
> +
>  #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
>      ((DIV_ROUND_UP((hdr_size), 4) +                     \
>        DIV_ROUND_UP((name_size), 4) +                    \
> @@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
>              qemu_mutex_unlock_iothread();
>          }
>      }
> +    migrate_del_blocker(dump_migration_blocker);
>
>      return 0;
>  }
> @@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>      Error *local_err = NULL;
>      bool detach_p = false;
>
> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> -        error_setg(errp, "Dump not allowed during incoming migration.");
> -        return;
> -    }
> -
>      /* if there is a dump in background, we should wait until the dump
>       * finished */
>      if (dump_in_progress()) {
> @@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>          return;
>      }
>
> +    if (!dump_migration_blocker) {
> +        error_setg(&dump_migration_blocker,
> +                   "Live migration disabled: dump-guest-memory in
> progress");
> +    }
> +
> +    /*
> +     * Allows even for -only-migratable, but forbid migration during the
> +     * process of dump guest memory.
> +     */
> +    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
> +        /* Remember to release the fd before passing it over to dump
> state */
> +        close(fd);
> +        return;
> +    }
>

I would move it earlier.  Why not leave it at the beginning of the function
as it was?

Then dump_in_progress() is probably redundant too.

+
>      s = &dump_state_global;
>      dump_state_prepare(s);
>
> --
> 2.31.1
>
>

--000000000000dd1f2005ca85a81e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 10:58 PM Pe=
ter Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Both dump-=
guest-memory and live migration caches vm state at the beginning.<br>
Either of them entering the other one will cause race on the vm state, and =
even<br>
more severe on that (please refer to the crash report in the bug link).<br>
<br>
Let&#39;s block live migration in dump-guest-memory, and that&#39;ll also b=
lock<br>
dump-guest-memory if it detected that we&#39;re during a live migration.<br=
>
<br>
Side note: migrate_del_blocker() can be called even if the blocker is not<b=
r>
inserted yet, so it&#39;s safe to unconditionally delete that blocker in<br=
>
dump_cleanup (g_slist_remove allows no-entry-found case).<br>
<br>
Suggested-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.=
com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
Bugzilla: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1996609"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D1996609</a><br>
Signed-off-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"=
_blank">peterx@redhat.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c | 24 +++++++++++++++++++-----<br>
=C2=A01 file changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index ab625909f3..9c1c1fb738 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;hw/misc/vmcoreinfo.h&quot;<br>
+#include &quot;migration/blocker.h&quot;<br>
<br>
=C2=A0#ifdef TARGET_X86_64<br>
=C2=A0#include &quot;win_dump.h&quot;<br>
@@ -47,6 +48,8 @@<br>
<br>
=C2=A0#define MAX_GUEST_NOTE_SIZE (1 &lt;&lt; 20) /* 1MB should be enough *=
/<br>
<br>
+static Error *dump_migration_blocker;<br>
+<br>
=C2=A0#define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)=C2=A0 =C2=A0\<b=
r>
=C2=A0 =C2=A0 =C2=A0((DIV_ROUND_UP((hdr_size), 4) +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((name_size), 4) +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
@@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock_iothread(=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 migrate_del_blocker(dump_migration_blocker);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
<br>
-=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_INMIGRATE)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Dump not allowed during=
 incoming migration.&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* if there is a dump in background, we should wait unt=
il the dump<br>
=C2=A0 =C2=A0 =C2=A0 * finished */<br>
=C2=A0 =C2=A0 =C2=A0if (dump_in_progress()) {<br>
@@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char *=
file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!dump_migration_blocker) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;dump_migration_blocker,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Live migration disabled: dump-guest-memory in progress&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Allows even for -only-migratable, but forbid migrati=
on during the<br>
+=C2=A0 =C2=A0 =C2=A0* process of dump guest memory.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (migrate_add_blocker_internal(dump_migration_blocker, err=
p)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember to release the fd before passing i=
t over to dump state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>I would move it earlie=
r.=C2=A0 Why not leave it at the beginning of the function as it was?</div>=
<div><br></div><div>Then dump_in_progress() is probably redundant too.<br><=
/div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0s =3D &amp;dump_state_global;<br>
=C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000dd1f2005ca85a81e--


