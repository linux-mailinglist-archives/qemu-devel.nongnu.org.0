Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F34414E5D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:51:05 +0200 (CEST)
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5Sa-0006Al-Jc
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mT57J-0008N9-TR
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mT57G-0007bW-U4
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632328142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sO/TeJZnxXfRGkBMXHoOfx8lihPRYtH3YWmNIWFlnXs=;
 b=IRg1F8h4d0Q6IGid5JYZCvns0eidPbV2iTsF4gt97mOw6NK9bSj5xAm43ZKb9GuNDVNx/T
 x+TdMCmLo2FG6rN0dqS2vZa+DiNxwJhEeRpt/+RcK6tAJ9S6k94aFjaQqdroORMfuvoXmn
 ZsvEzXRdUib7pDWt2axIIR0lJcHdLz8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-nHoVseUFOmqCq0HNH47K5w-1; Wed, 22 Sep 2021 12:29:00 -0400
X-MC-Unique: nHoVseUFOmqCq0HNH47K5w-1
Received: by mail-pj1-f69.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ce1db4eaeso5624962pjb.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sO/TeJZnxXfRGkBMXHoOfx8lihPRYtH3YWmNIWFlnXs=;
 b=MEt+RDMVTSwPzASYTn7CzozNwCdpSBL9byI11scpRiINVBBeRXP9ZIOybVe1/etFnQ
 kPM4pY0HsYvLtjOssCvkwfM+lOfGA0lFms5lFK8C0TGc3vhmsAW133cIoZq/OU9hWGDt
 dPBHMgGufmCgeEHkhJJfiXv1bWADYiendEXSptvDTL8lALnROkAYAxvXO/Hg0dTkINQD
 3m3Rsn4ObHKm8HGDpGf6jeepquxyHBKZVDLPdl+3KqxwK62rgmKyEJFPalaAvOADtSMF
 +Oa0KXdEO6S0WA/K2T8ehrW+rdfYC/RAZamLJWZRJTsppuSK3CvkfFr5swyddUwNRDiD
 ut3w==
X-Gm-Message-State: AOAM532n72y2ikHdCkfYh7q4W05gDdpryFZnNwC9lFz1gLyhprhODgwF
 BM6pLLrU0kuOYQhrKS0S9FDRE94CjAtSgD1YmzVwFnOPTLge5JQfEBW2yL4Pn7fcgmCUYibh+nH
 Ppj90VFIK3AZNC0s5ke3T4FnIsdNKyNg=
X-Received: by 2002:a05:6a00:10:b0:43e:ede6:2b7 with SMTP id
 h16-20020a056a00001000b0043eede602b7mr503300pfk.42.1632328139066; 
 Wed, 22 Sep 2021 09:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMIWzmexknIZTdC543wLC9ArNuEbFiRAiL3C1wdygvWN9Tr78+Z6seT1A1zEhb10JeAzGdG7s5d6iRF6PM2pA=
X-Received: by 2002:a05:6a00:10:b0:43e:ede6:2b7 with SMTP id
 h16-20020a056a00001000b0043eede602b7mr503272pfk.42.1632328138732; Wed, 22 Sep
 2021 09:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210922162009.125622-1-peterx@redhat.com>
 <20210922162009.125622-4-peterx@redhat.com>
In-Reply-To: <20210922162009.125622-4-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 22 Sep 2021 20:28:47 +0400
Message-ID: <CAMxuvaxPYftDCQu2cot6uA0hrvnZ3SB9sm1F1kn6fNh15q-2WQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dump-guest-memory: Block live migration
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ddce4f05cc98028f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ddce4f05cc98028f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 8:20 PM Peter Xu <peterx@redhat.com> wrote:

> Both dump-guest-memory and live migration caches vm state at the beginnin=
g.
> Either of them entering the other one will cause race on the vm state, an=
d
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
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1996609
> Signed-off-by: Peter Xu <peterx@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  dump/dump.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index ab625909f3..662d0a62cd 100644
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
> @@ -2005,6 +2009,21 @@ void qmp_dump_guest_memory(bool paging, const char
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
> +
>      s =3D &dump_state_global;
>      dump_state_prepare(s);
>
> --
> 2.31.1
>
>

--000000000000ddce4f05cc98028f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 8:20 PM Peter=
 Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Both dump-gue=
st-memory and live migration caches vm state at the beginning.<br>
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
_blank">peterx@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index ab625909f3..662d0a62cd 100644<br>
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
@@ -2005,6 +2009,21 @@ void qmp_dump_guest_memory(bool paging, const char *=
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
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0s =3D &amp;dump_state_global;<br>
=C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000ddce4f05cc98028f--


