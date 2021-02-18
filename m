Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3331EC97
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:55:50 +0100 (CET)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmaj-0002h5-Bf
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCmQv-0005nh-JX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCmQr-00079Y-I3
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613666732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GOCngTnzXQaIfNQvSW6G+BV7lwvDqnGqEymQHvaDhXg=;
 b=BNUrrPNjXHIELeg7rbCeUNW18LOX2QH54TylA65W15lERaPJy2Kzkj+44JCWBTzUDV4KK+
 esmOJiyTygquvglgx/PSCKKu6nSQ80b3t8i877rHcUpfcFHXcPhrJZz/aKNdFBlQUXhYWY
 ABCa+/rPECYWC8s9khd9aBQnpZXgJww=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-ybnmO80pPiSSRaTN0zQJ7Q-1; Thu, 18 Feb 2021 11:45:29 -0500
X-MC-Unique: ybnmO80pPiSSRaTN0zQJ7Q-1
Received: by mail-io1-f72.google.com with SMTP id x9so1712566iop.21
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOCngTnzXQaIfNQvSW6G+BV7lwvDqnGqEymQHvaDhXg=;
 b=SdElFNonO5cHTVHHk/TwFSaq+Yn8oAsCkWghjtTKdKSAiSEjMqQjzTBk0215p7GK6w
 1kriKlj2j11cFryOmnCE6tWv/CWeB9mIKM2nnrrHcVlbgWrZ0TOGXDDktsASH1UClQSa
 h/sYJHJ7eBp15ooj2/EOmy6/cN/WdeKXRtmHldisWyOp6VFOFiVlmSWuEv7RslAbuxGp
 fnfqeKlNicUyVV82F8Fazz5+k1UYmMh+YFrAbLuDg8xYf8tVjgFhjhTLjlMXZdyJ5iX7
 JWh1GR5CLrm6qJ5XZjZ/M0wCueOFvWwlS8dS5UhZxzdoaGPh16UlHfn2EzD2a81oyasW
 EmJQ==
X-Gm-Message-State: AOAM530eMe2870Yao0bEo/DI/hbuyfTtCTnCPRuD5KBnUyTxUthDHvbB
 Zkl0a8gDqHQbfR4g5pW1h1q5kEG3kLY4Va6sBDOFq3OMhxPcAynVjyN9ExBH6e48T8lqctHCK7E
 c7ivLhmi5tcfBZXkl63BIuybaCSvAQCE=
X-Received: by 2002:a6b:fa0f:: with SMTP id p15mr6851ioh.164.1613666729096;
 Thu, 18 Feb 2021 08:45:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsEzrJnRvZexZCfI3iwkzRkwU9Ggh+BbhoPrKuZZpZWRUEmo20jCJJNFgn03Ge0CgaZeRfMduaSVMkRryO0dA=
X-Received: by 2002:a6b:fa0f:: with SMTP id p15mr6841ioh.164.1613666728906;
 Thu, 18 Feb 2021 08:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20210217070944.2371327-1-marcandre.lureau@redhat.com>
 <87a6s18h3r.fsf@dusky.pond.sub.org>
In-Reply-To: <87a6s18h3r.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 18 Feb 2021 20:45:17 +0400
Message-ID: <CAMxuvay9qGfWV+_SuSVOCMkq5xajN060wtn0Y2pJ6kyEtDdGOQ@mail.gmail.com>
Subject: Re: [PATCH v2] qga: return a more explicit error on why a command is
 disabled
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000029acc105bb9f106d"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: michael.roth@amd.com, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000029acc105bb9f106d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 18, 2021 at 8:40 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > qmp_disable_command() now takes an enum for the reason, to be able
> > to give more explicit error messages.
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1928806
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >
> > v2:
> >  - replace string with an enum for disabling reason
> >  - remove trailing dot
> >
> >  include/qapi/qmp/dispatch.h | 12 ++++++++++--
> >  monitor/qmp-cmds-control.c  |  2 +-
> >  qapi/qmp-dispatch.c         | 10 +++++++++-
> >  qapi/qmp-registry.c         | 16 +++++++++-------
> >  qga/main.c                  |  4 ++--
> >  5 files changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> > index 1486cac3ef..fda9ffad73 100644
> > --- a/include/qapi/qmp/dispatch.h
> > +++ b/include/qapi/qmp/dispatch.h
> > @@ -28,6 +28,13 @@ typedef enum QmpCommandOptions
> >      QCO_COROUTINE             =3D  (1U << 3),
> >  } QmpCommandOptions;
> >
> > +typedef enum QmpDisabled
> > +{
> > +    QMP_DISABLED_NONE,
> > +    QMP_DISABLED_GENERIC,
> > +    QMP_DISABLED_FROZEN,
> > +} QmpDisabled;
> > +
>
> I strongly dislike baking QGA-specific things into the generic
> dispatcher.  I believe it's easy enough to avoid; see below.
>
> >  typedef struct QmpCommand
> >  {
> >      const char *name;
> > @@ -35,7 +42,7 @@ typedef struct QmpCommand
> >      QmpCommandFunc *fn;
> >      QmpCommandOptions options;
> >      QTAILQ_ENTRY(QmpCommand) node;
> > -    bool enabled;
> > +    QmpDisabled disabled;
> >  } QmpCommand;
> >
> >  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
> > @@ -44,7 +51,8 @@ void qmp_register_command(QmpCommandList *cmds, const
> char *name,
> >                            QmpCommandFunc *fn, QmpCommandOptions
> options);
> >  const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
> >                                     const char *name);
> > -void qmp_disable_command(QmpCommandList *cmds, const char *name);
> > +void qmp_disable_command(QmpCommandList *cmds, const char *name,
> > +                         QmpDisabled disabled);
> >  void qmp_enable_command(QmpCommandList *cmds, const char *name);
> >
> >  bool qmp_command_is_enabled(const QmpCommand *cmd);
> > diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
> > index 509ae870bd..94a8e133b6 100644
> > --- a/monitor/qmp-cmds-control.c
> > +++ b/monitor/qmp-cmds-control.c
> > @@ -107,7 +107,7 @@ static void query_commands_cb(const QmpCommand *cmd=
,
> void *opaque)
> >      CommandInfo *info;
> >      CommandInfoList **list =3D opaque;
> >
> > -    if (!cmd->enabled) {
> > +    if (!qmp_command_is_enabled(cmd)) {
> >          return;
> >      }
> >
> > diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> > index 0a2b20a4e4..b65f670152 100644
> > --- a/qapi/qmp-dispatch.c
> > +++ b/qapi/qmp-dispatch.c
> > @@ -155,11 +155,19 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
> >                    "The command %s has not been found", command);
> >          goto out;
> >      }
> > -    if (!cmd->enabled) {
> > +    switch (cmd->disabled) {
> > +    case QMP_DISABLED_FROZEN:
> > +        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> > +                  "The command %s has been disabled after fsfreeze",
> > +                  command);
> > +        goto out;
> > +    case QMP_DISABLED_GENERIC:
> >          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> >                    "The command %s has been disabled for this instance"=
,
> >                    command);
> >          goto out;
> > +    case QMP_DISABLED_NONE:
> > +        break;
> >      }
> >      if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
>
> v1 put an optional error message template into struct QmpCommand, and
> set the error with
>
>          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
>                    cmd->err_msg ?: "The command %s has been disabled for
> this instance",
>                    command);
>
> Peter Krempa pointed out that this defeats the compiler's format string
> checking.
>
> I feel the proper way to avoid this is to keep an optional string in
> QmpCommand that explains the disablement, and use it like this:
>
>     if (!cmd->enabled) {
>         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
>                   "Command %s has been disabled%s%s",
>                   command,
>                   cmd->disable_reason ? ": ", "",
>                   cmd->disable_reason ?: "");
>         goto out;
>     }
>
>
Works for me, I'll send a v3.
thanks

If we make the string mandatory, we can ditch cmd->enabled, and say
>
>     if (cmd->disabled) {
>         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
>                   "Command %s has been disabled: %s",
>                   command, cmd->disabled);
>         goto out;
>     }
>
> [...]
>
>

--00000000000029acc105bb9f106d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 18, 2021 at 8:40 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; qmp_disable_command() now takes an enum for the reason, to be able<br>
&gt; to give more explicit error messages.<br>
&gt;<br>
&gt; Fixes:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1928806" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1928806</a><br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;<br>
&gt; v2:<br>
&gt;=C2=A0 - replace string with an enum for disabling reason<br>
&gt;=C2=A0 - remove trailing dot<br>
&gt;<br>
&gt;=C2=A0 include/qapi/qmp/dispatch.h | 12 ++++++++++--<br>
&gt;=C2=A0 monitor/qmp-cmds-control.c=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++=
+++-<br>
&gt;=C2=A0 qapi/qmp-registry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++=
+++-------<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 5 files changed, 31 insertions(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h=
<br>
&gt; index 1486cac3ef..fda9ffad73 100644<br>
&gt; --- a/include/qapi/qmp/dispatch.h<br>
&gt; +++ b/include/qapi/qmp/dispatch.h<br>
&gt; @@ -28,6 +28,13 @@ typedef enum QmpCommandOptions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QCO_COROUTINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D=C2=A0 (1U &lt;&lt; 3),<br>
&gt;=C2=A0 } QmpCommandOptions;<br>
&gt;=C2=A0 <br>
&gt; +typedef enum QmpDisabled<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QMP_DISABLED_NONE,<br>
&gt; +=C2=A0 =C2=A0 QMP_DISABLED_GENERIC,<br>
&gt; +=C2=A0 =C2=A0 QMP_DISABLED_FROZEN,<br>
&gt; +} QmpDisabled;<br>
&gt; +<br>
<br>
I strongly dislike baking QGA-specific things into the generic<br>
dispatcher.=C2=A0 I believe it&#39;s easy enough to avoid; see below.<br>
<br>
&gt;=C2=A0 typedef struct QmpCommand<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt; @@ -35,7 +42,7 @@ typedef struct QmpCommand<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QmpCommandOptions options;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_ENTRY(QmpCommand) node;<br>
&gt; -=C2=A0 =C2=A0 bool enabled;<br>
&gt; +=C2=A0 =C2=A0 QmpDisabled disabled;<br>
&gt;=C2=A0 } QmpCommand;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;<=
br>
&gt; @@ -44,7 +51,8 @@ void qmp_register_command(QmpCommandList *cmds, cons=
t char *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 QmpCommandFunc *fn, QmpCommandOptions options);=
<br>
&gt;=C2=A0 const QmpCommand *qmp_find_command(const QmpCommandList *cmds,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *n=
ame);<br>
&gt; -void qmp_disable_command(QmpCommandList *cmds, const char *name);<br>
&gt; +void qmp_disable_command(QmpCommandList *cmds, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0QmpDisabled disabled);<br>
&gt;=C2=A0 void qmp_enable_command(QmpCommandList *cmds, const char *name);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 bool qmp_command_is_enabled(const QmpCommand *cmd);<br>
&gt; diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c<b=
r>
&gt; index 509ae870bd..94a8e133b6 100644<br>
&gt; --- a/monitor/qmp-cmds-control.c<br>
&gt; +++ b/monitor/qmp-cmds-control.c<br>
&gt; @@ -107,7 +107,7 @@ static void query_commands_cb(const QmpCommand *cm=
d, void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CommandInfo *info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CommandInfoList **list =3D opaque;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (!cmd-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 if (!qmp_command_is_enabled(cmd)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
&gt; index 0a2b20a4e4..b65f670152 100644<br>
&gt; --- a/qapi/qmp-dispatch.c<br>
&gt; +++ b/qapi/qmp-dispatch.c<br>
&gt; @@ -155,11 +155,19 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, =
QObject *request,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;The command %s has not been found&quot;, command);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (!cmd-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 switch (cmd-&gt;disabled) {<br>
&gt; +=C2=A0 =C2=A0 case QMP_DISABLED_FROZEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(&amp;err, ERROR_CLASS_COMMAND_N=
OT_FOUND,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
The command %s has been disabled after fsfreeze&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comman=
d);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 case QMP_DISABLED_GENERIC:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(&amp;err, ERROR_CLASS_COMM=
AND_NOT_FOUND,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;The command %s has been disabled for this instance&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
ommand);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 case QMP_DISABLED_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (oob &amp;&amp; !(cmd-&gt;options &amp; QCO_ALL=
OW_OOB)) {<br>
<br>
v1 put an optional error message template into struct QmpCommand, and<br>
set the error with<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_set(&amp;err, ERROR_CLASS_COMMAND_N=
OT_FOUND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&g=
t;err_msg ?: &quot;The command %s has been disabled for this instance&quot;=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comman=
d);<br>
<br>
Peter Krempa pointed out that this defeats the compiler&#39;s format string=
<br>
checking.<br>
<br>
I feel the proper way to avoid this is to keep an optional string in<br>
QmpCommand that explains the disablement, and use it like this:<br>
<br>
=C2=A0 =C2=A0 if (!cmd-&gt;enabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(&amp;err, ERROR_CLASS_COMMAND_NOT_FOU=
ND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Comman=
d %s has been disabled%s%s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;disa=
ble_reason ? &quot;: &quot;, &quot;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&gt;disa=
ble_reason ?: &quot;&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 }<br>
<br></blockquote><div><br></div><div>Works for me, I&#39;ll send a v3.</div=
><div>thanks</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
If we make the string mandatory, we can ditch cmd-&gt;enabled, and say<br>
<br>
=C2=A0 =C2=A0 if (cmd-&gt;disabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(&amp;err, ERROR_CLASS_COMMAND_NOT_FOU=
ND,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Comman=
d %s has been disabled: %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command, cmd=
-&gt;disabled);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 }<br>
<br>
[...]<br>
<br>
</blockquote></div></div>

--00000000000029acc105bb9f106d--


