Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00FB31EC64
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:42:14 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmNZ-0003Wz-Ra
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCmLp-0002aw-NI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:40:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCmLk-0004eu-Ci
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613666417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiXbU/BCZzvuYyBZPzoe9glIJzwl7UbYgGzef6hz02c=;
 b=FZ5Rfoo/OBc+BwxES/qkZr0+ghIUjkVHYBnfXaf3OgbDmuGUP1lD5bXaqRe8kgHPKRNZwl
 owJBjlE3VgirHRpHGhoyZeyx8KCYXpbTPVPzO7mvirCAYnoXEuw6sZaFXci+Pd2ESRKMdt
 FYY+KcY1B4IwcQhIb1yXMwlsZIxxGT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-D5nfmOHmMTW7RsYzyCeoPw-1; Thu, 18 Feb 2021 11:40:15 -0500
X-MC-Unique: D5nfmOHmMTW7RsYzyCeoPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88BDF80364D;
 Thu, 18 Feb 2021 16:40:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 764745D9C2;
 Thu, 18 Feb 2021 16:40:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EDDD8113860F; Thu, 18 Feb 2021 17:40:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2] qga: return a more explicit error on why a command
 is disabled
References: <20210217070944.2371327-1-marcandre.lureau@redhat.com>
Date: Thu, 18 Feb 2021 17:40:08 +0100
In-Reply-To: <20210217070944.2371327-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 17 Feb 2021 11:09:44 +0400")
Message-ID: <87a6s18h3r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> qmp_disable_command() now takes an enum for the reason, to be able
> to give more explicit error messages.
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1928806
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> v2:
>  - replace string with an enum for disabling reason
>  - remove trailing dot
>
>  include/qapi/qmp/dispatch.h | 12 ++++++++++--
>  monitor/qmp-cmds-control.c  |  2 +-
>  qapi/qmp-dispatch.c         | 10 +++++++++-
>  qapi/qmp-registry.c         | 16 +++++++++-------
>  qga/main.c                  |  4 ++--
>  5 files changed, 31 insertions(+), 13 deletions(-)
>
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 1486cac3ef..fda9ffad73 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -28,6 +28,13 @@ typedef enum QmpCommandOptions
>      QCO_COROUTINE             =3D  (1U << 3),
>  } QmpCommandOptions;
> =20
> +typedef enum QmpDisabled
> +{
> +    QMP_DISABLED_NONE,
> +    QMP_DISABLED_GENERIC,
> +    QMP_DISABLED_FROZEN,
> +} QmpDisabled;
> +

I strongly dislike baking QGA-specific things into the generic
dispatcher.  I believe it's easy enough to avoid; see below.

>  typedef struct QmpCommand
>  {
>      const char *name;
> @@ -35,7 +42,7 @@ typedef struct QmpCommand
>      QmpCommandFunc *fn;
>      QmpCommandOptions options;
>      QTAILQ_ENTRY(QmpCommand) node;
> -    bool enabled;
> +    QmpDisabled disabled;
>  } QmpCommand;
> =20
>  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
> @@ -44,7 +51,8 @@ void qmp_register_command(QmpCommandList *cmds, const c=
har *name,
>                            QmpCommandFunc *fn, QmpCommandOptions options)=
;
>  const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
>                                     const char *name);
> -void qmp_disable_command(QmpCommandList *cmds, const char *name);
> +void qmp_disable_command(QmpCommandList *cmds, const char *name,
> +                         QmpDisabled disabled);
>  void qmp_enable_command(QmpCommandList *cmds, const char *name);
> =20
>  bool qmp_command_is_enabled(const QmpCommand *cmd);
> diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
> index 509ae870bd..94a8e133b6 100644
> --- a/monitor/qmp-cmds-control.c
> +++ b/monitor/qmp-cmds-control.c
> @@ -107,7 +107,7 @@ static void query_commands_cb(const QmpCommand *cmd, =
void *opaque)
>      CommandInfo *info;
>      CommandInfoList **list =3D opaque;
> =20
> -    if (!cmd->enabled) {
> +    if (!qmp_command_is_enabled(cmd)) {
>          return;
>      }
> =20
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 0a2b20a4e4..b65f670152 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -155,11 +155,19 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QOb=
ject *request,
>                    "The command %s has not been found", command);
>          goto out;
>      }
> -    if (!cmd->enabled) {
> +    switch (cmd->disabled) {
> +    case QMP_DISABLED_FROZEN:
> +        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> +                  "The command %s has been disabled after fsfreeze",
> +                  command);
> +        goto out;
> +    case QMP_DISABLED_GENERIC:
>          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
>                    "The command %s has been disabled for this instance",
>                    command);
>          goto out;
> +    case QMP_DISABLED_NONE:
> +        break;
>      }
>      if (oob && !(cmd->options & QCO_ALLOW_OOB)) {

v1 put an optional error message template into struct QmpCommand, and
set the error with

         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                   cmd->err_msg ?: "The command %s has been disabled for th=
is instance",
                   command);

Peter Krempa pointed out that this defeats the compiler's format string
checking.

I feel the proper way to avoid this is to keep an optional string in
QmpCommand that explains the disablement, and use it like this:

    if (!cmd->enabled) {
        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                  "Command %s has been disabled%s%s",
                  command,
                  cmd->disable_reason ? ": ", "",
                  cmd->disable_reason ?: "");
        goto out;
    }

If we make the string mandatory, we can ditch cmd->enabled, and say

    if (cmd->disabled) {
        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                  "Command %s has been disabled: %s",
                  command, cmd->disabled);
        goto out;
    }

[...]


