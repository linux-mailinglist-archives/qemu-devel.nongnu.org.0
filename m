Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B39414CB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:07:40 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3qV-00022L-7V
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mT3ob-0008I7-Ma
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:05:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mT3oY-0004W7-P9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:05:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id t18so7925828wrb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SndzXqSOfOA8dWfOJFHUbwBvaix5hsWflCASiMU6O6I=;
 b=U5/GFfUl/bC8vjjpMWFZGS8gcufWlfPeLqHgtrpnAzq5/b3YpvbdcoNk5oxx+CTPZK
 v79gPvGRdZwIITIf+86bQny7YRD3JlktLiYr7qzykivZv2rhl5ZZLbszamdVjkeQK58U
 GrBT6mkbeK2k2JdrKZKB9Pm59TTX6XT6+syGw48gp1XCCZFQQwOIz1fTCiv+pFlSGfSb
 KJbyyEuBdXq4JsumrJeSztigaHw5XAEZAokxvr8wnkBjVGvriP07RXZ6dnlZcE1EZNDH
 AKxn6wbBHSaRVLUle3+UP8MY2Z2XUOySxpy17Pmcu8SXWnx0N2AonY9byX3UTQLwyj7e
 mIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SndzXqSOfOA8dWfOJFHUbwBvaix5hsWflCASiMU6O6I=;
 b=cC6SHYgjKVOz60nIkR0p7r61ak5ktCyofs2Ui5y0hwiU5eDbW6fKJy1KUZZg0Sjp+Q
 OR1ggv5BM/mVmByjEYztt5ufrHmn6VTcVt2ze5izh3D+IPC7+FF/NpWD4gzUdppNIQLr
 Pv10anUCNz2eA+O/XI0KV1/87J//Wwr5gSnfSO4O0KwBb+hLnCw13/PHQMAkkFaXRDbu
 2VAZxC7LEv9/1pomESDd+4Ti1WiNAa2fOJKBZG1TpmD6VCLtnX9Vss+8CV12/VSiPImo
 Zn3DqGU5nFhnwRVBpg/lc9ZEvPXny+bo6OxIjxYqhQaooBNYYxcJNVgEzEFgZhdZY6hr
 yMhg==
X-Gm-Message-State: AOAM533x7hQ0ZpUA48QI1rI6p+DQImsFLqeI0HgWD7scSiGHhxQS6UUi
 pOWkJLLU/is1iwCQThXrxkmDlT48m8k6cS9Um24=
X-Google-Smtp-Source: ABdhPJzVsHu+hKQwV0ElD+eqOhrAtJwBfAc76ZqVA28eydpxv1eRaEk5VEZW8DWn2B2smg3SgHLA7VLprZm6Rx2pZew=
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr76600wrw.70.1632323134778;
 Wed, 22 Sep 2021 08:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210826185813.248441-1-peterx@redhat.com>
 <20210826185813.248441-2-peterx@redhat.com>
In-Reply-To: <20210826185813.248441-2-peterx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Sep 2021 19:05:23 +0400
Message-ID: <CAJ+F1CK6AwBBvg40DyYKE+nhy2vOTHnG3dMAjXxVNX_u79mgcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] migration: Make migration blocker work for
 snapshots too
To: Peter Xu <peterx@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b727b05cc96d889"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b727b05cc96d889
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 11:00 PM Peter Xu <peterx@redhat.com> wrote:

> save_snapshot() checks migration blocker, which looks sane.  At the
> meantime we
> should also teach the blocker add helper to fail if during a snapshot, ju=
st
> like for migrations.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  migration/migration.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 041b8451a6..f476e2101e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2062,15 +2062,16 @@ int migrate_add_blocker(Error *reason, Error
> **errp)
>          return -EACCES;
>      }
>
> -    if (migration_is_idle()) {
> -        migration_blockers =3D g_slist_prepend(migration_blockers, reaso=
n);
> -        return 0;
> +    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM
> too. */
> +    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
> +        error_propagate_prepend(errp, error_copy(reason),
> +                                "disallowing migration blocker "
> +                                "(migration/snapshot in progress) for: "=
);
> +        return -EBUSY;
>      }
>
> -    error_propagate_prepend(errp, error_copy(reason),
> -                            "disallowing migration blocker "
> -                            "(migration in progress) for: ");
> -    return -EBUSY;
> +    migration_blockers =3D g_slist_prepend(migration_blockers, reason);
> +    return 0;
>  }
>
>  void migrate_del_blocker(Error *reason)
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009b727b05cc96d889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 11:00 PM Pete=
r Xu &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">save_snapsho=
t() checks migration blocker, which looks sane.=C2=A0 At the meantime we<br=
>
should also teach the blocker add helper to fail if during a snapshot, just=
<br>
like for migrations.<br>
<br>
Signed-off-by: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"=
_blank">peterx@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0migration/migration.c | 15 ++++++++-------<br>
=C2=A01 file changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/migration/migration.c b/migration/migration.c<br>
index 041b8451a6..f476e2101e 100644<br>
--- a/migration/migration.c<br>
+++ b/migration/migration.c<br>
@@ -2062,15 +2062,16 @@ int migrate_add_blocker(Error *reason, Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EACCES;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (migration_is_idle()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 migration_blockers =3D g_slist_prepend(migrati=
on_blockers, reason);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 /* Snapshots are similar to migrations, so check RUN_STATE_S=
AVE_VM too. */<br>
+=C2=A0 =C2=A0 if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle(=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate_prepend(errp, error_copy(reaso=
n),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disallowing migration blocker =
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(migration/snapshot in progres=
s) for: &quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 error_propagate_prepend(errp, error_copy(reason),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disallowing migration blocker &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(migration in progress) for: &quot;);<br>
-=C2=A0 =C2=A0 return -EBUSY;<br>
+=C2=A0 =C2=A0 migration_blockers =3D g_slist_prepend(migration_blockers, r=
eason);<br>
+=C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
=C2=A0void migrate_del_blocker(Error *reason)<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009b727b05cc96d889--

