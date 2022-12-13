Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2A464AC81
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 01:36:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4tGB-0004iZ-5t; Mon, 12 Dec 2022 19:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4tG9-0004iM-2p
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4tG6-00051e-Pa
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670891697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P+hKV4cXw3fU7WQY9rJX/PoQQsCeDPwo2w46ByPNGxI=;
 b=X/YubajUqm6Or4qv9Q0k04LyQmAzXkAKSdFL7iq6A8t+fLtXMP8bJq68W615eBCBX/jUsU
 jiNPvMgjZIWvTwLklgDAYe9d8+GvlFzb8r+GKg5Y/zfORFDYUoawv6mYD22ANUXG7hVY3M
 Tlt3WQpxOZPKN1hvP4OvYKGikt5Gy0E=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-9-j9qwYGMO-FYNT2g9e0vA-1; Mon, 12 Dec 2022 19:34:56 -0500
X-MC-Unique: 9-j9qwYGMO-FYNT2g9e0vA-1
Received: by mail-vk1-f197.google.com with SMTP id
 h72-20020a1f9e4b000000b003b8453f553cso608001vke.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P+hKV4cXw3fU7WQY9rJX/PoQQsCeDPwo2w46ByPNGxI=;
 b=sy33XRu0mqbyLDJ65pM1moHfeL5dcO21PyNbgJaMACYb+ysNypwS+XnhRYjZs9WsxF
 cipdyug4g6BFlnZU8NfQj8iFdFSxvKAMVlBZUIaaTc6fl/0+WbxIRFHpZoGz9KVtsAbC
 EqFmUP0K4gG9jzWX3jZ9BB2AwncfRW3vxV1vGXLrhotv5me+eTwX2WLpM+1wBMRlhkQu
 GtulhQJPy3+7Niruo4Etu5F6wIwitJm7jNbYEdXrJ1uBEXjdFvZ2GMwopSIP2xDfNklx
 /4U0mz3/+7zLU2FeIsb/t2lmNzzEsLhgNwEzF/o09EMWbNPq7q+pPyV6wxdbtyq7olWr
 dpSg==
X-Gm-Message-State: ANoB5pmxhYOuj4PV223CNNmqqwnK2jPB2AifU3n2NghhBCQ8kqFdQpeu
 Wpm/EMn5JAIsnMgUgY0bk1Oh2ANd2yPoOMjqVk5/TdgbJrXCt1ZkZVC1eCwmRwQYMRYvov+r86N
 zq1J+tWGveoCupyH6qGUPG/vg8EvXJQs=
X-Received: by 2002:a1f:b482:0:b0:3be:12e8:e55f with SMTP id
 d124-20020a1fb482000000b003be12e8e55fmr1738678vkf.33.1670891695527; 
 Mon, 12 Dec 2022 16:34:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4y4szKY1hvQREy52XmCMITnEKsj9sir3KkUHYy5zrp3Dn6SlTvW/nMgRw1j0b/adKYKq6my40aK/u7h8858dI=
X-Received: by 2002:a1f:b482:0:b0:3be:12e8:e55f with SMTP id
 d124-20020a1fb482000000b003be12e8e55fmr1738671vkf.33.1670891695258; Mon, 12
 Dec 2022 16:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
 <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
In-Reply-To: <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Dec 2022 01:34:42 +0100
Message-ID: <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f456cc05efaac9bf"
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

--000000000000f456cc05efaac9bf
Content-Type: text/plain; charset="UTF-8"

dropped qemu-devel by mistake.

Paolo


Il lun 12 dic 2022, 23:16 Paolo Bonzini <pbonzini@redhat.com> ha scritto:

> On 12/8/22 15:23, Markus Armbruster wrote:
> > qemu/coroutine.h and qemu/lockable.h include each other.  Neither
> > header actually needs the other one.
>
> qemu/lockable.h wants qemu/coroutine.h because of the reference to
> qemu_co_mutex_lock/unlock in the QEMU_MAKE_LOCKABLE macro.  Said
> reference only happens when the macro is used, so strictly speaking
> only code that uses of qemu/lockable.h's functionality needs to
> include qemu/coroutine.h.  The order doesn't matter.
>
> qemu/coroutine.h similarly wants qemu/lockable.h only for a macro: it
> uses QemuLockable for the prototype of qemu_co_queue_wait_impl, but
> QemuLockable is defined in qemu/typedefs.h.  On the other hand, the
> qemu_co_queue_wait macro needs QEMU_MAKE_LOCKABLE.  Again, the order
> does not matter but callers of qemu_co_queue_wait appreciate it if
> both files are included.
>
> So, this is why the inclusion loop works.  This patch makes some
> files include qemu/coroutine.h even if they only need qemu/lockable.h
> for QEMU_LOCK_GUARD of a "regular" QemuMutex; for example, linux-user/
> does not use coroutines, so I'd like to avoid that it includes
> qemu/coroutine.h.
>
> One way is to just keep the cycle.  Another is to break the cycle is
> as follows:
>
> 1) qemu/coroutine.h keeps including qemu/lockable.h
>
> 2) qemu/lockable.h is modified as follows to omit the reference to CoMutex:
>
> diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
> index 86db7cb04c9c..db59656538a4 100644
> --- a/include/qemu/lockable.h
> +++ b/include/qemu/lockable.h
> @@ -71,9 +71,11 @@ qemu_null_lockable(void *x)
>                void *: qemu_null_lockable(x),                             \
>                QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
>                QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x,
> rec_mutex)), \
> -             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
> +             QEMU_MAKE_CO_MUTEX_LOCKABLE(x)                             \
>                QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
>
> +#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
> +
>   /**
>    * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
>    *
>
> 3) the following hack is added in qemu/coroutine.h, right after including
> qemu/lockable.h:
>
> #undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
> #define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \
>               CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),
>
>
> Neither is particularly pretty, so I vote for leaving things as is with
> a comment above the two #include directives.
>
> Paolo
>

--000000000000f456cc05efaac9bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>dropped qemu-devel by mistake.<div dir=3D"auto"><br>=
<div dir=3D"auto">Paolo=C2=A0</div></div><br><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Il lun 12 dic 2022, 23:16 Paolo Bonz=
ini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; =
ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 12/8/22 15:23, Marku=
s Armbruster wrote:<br>
&gt; qemu/coroutine.h and qemu/lockable.h include each other.=C2=A0 Neither=
<br>
&gt; header actually needs the other one.<br>
<br>
qemu/lockable.h wants qemu/coroutine.h because of the reference to<br>
qemu_co_mutex_lock/unlock in the QEMU_MAKE_LOCKABLE macro.=C2=A0 Said<br>
reference only happens when the macro is used, so strictly speaking<br>
only code that uses of qemu/lockable.h&#39;s functionality needs to<br>
include qemu/coroutine.h.=C2=A0 The order doesn&#39;t matter.<br>
<br>
qemu/coroutine.h similarly wants qemu/lockable.h only for a macro: it<br>
uses QemuLockable for the prototype of qemu_co_queue_wait_impl, but<br>
QemuLockable is defined in qemu/typedefs.h.=C2=A0 On the other hand, the<br=
>
qemu_co_queue_wait macro needs QEMU_MAKE_LOCKABLE.=C2=A0 Again, the order<b=
r>
does not matter but callers of qemu_co_queue_wait appreciate it if<br>
both files are included.<br>
<br>
So, this is why the inclusion loop works.=C2=A0 This patch makes some<br>
files include qemu/coroutine.h even if they only need qemu/lockable.h<br>
for QEMU_LOCK_GUARD of a &quot;regular&quot; QemuMutex; for example, linux-=
user/<br>
does not use coroutines, so I&#39;d like to avoid that it includes<br>
qemu/coroutine.h.<br>
<br>
One way is to just keep the cycle.=C2=A0 Another is to break the cycle is<b=
r>
as follows:<br>
<br>
1) qemu/coroutine.h keeps including qemu/lockable.h<br>
<br>
2) qemu/lockable.h is modified as follows to omit the reference to CoMutex:=
<br>
<br>
diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h<br>
index 86db7cb04c9c..db59656538a4 100644<br>
--- a/include/qemu/lockable.h<br>
+++ b/include/qemu/lockable.h<br>
@@ -71,9 +71,11 @@ qemu_null_lockable(void *x)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *: qemu_null_lo=
ckable(x),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuMutex *: qemu_ma=
ke_lockable(x, QML_OBJ_(x, mutex)),=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuRecMutex *: qemu=
_make_lockable(x, QML_OBJ_(x, rec_mutex)), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CoMutex *: qemu_make_locka=
ble(x, QML_OBJ_(x, co_mutex)),=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU_MAKE_CO_MUTEX_LOCKABL=
E(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuSpin *: qemu_mak=
e_lockable(x, QML_OBJ_(x, spin)))<br>
<br>
+#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)<br>
+<br>
=C2=A0 /**<br>
=C2=A0 =C2=A0* QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable=
<br>
=C2=A0 =C2=A0*<br>
<br>
3) the following hack is added in qemu/coroutine.h, right after including q=
emu/lockable.h:<br>
<br>
#undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)<br>
#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CoMutex *: qemu_make_locka=
ble(x, QML_OBJ_(x, co_mutex)),<br>
<br>
<br>
Neither is particularly pretty, so I vote for leaving things as is with<br>
a comment above the two #include directives.<br>
<br>
Paolo<br>
</blockquote></div></div></div>

--000000000000f456cc05efaac9bf--


