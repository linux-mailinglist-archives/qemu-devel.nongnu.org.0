Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BA7027A4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:55:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTzM-0008A0-Ut; Mon, 15 May 2023 04:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTzJ-00084F-Ey
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTzD-0006Y2-K9
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684140918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lxCFLeb/CJjEAlJNk9ShHxl5KY9C6nTvh827u5t2YA=;
 b=KZxDZAHTJ47OD8n2KvjAawuc75pN6qAFTGSAWbwLFwlMGUIuj9QnbKqdcKY9uhN5mlzrqM
 C55yyvMoZHpnfW1b4E/1ukAZlfJm88Rwms+9JR0WfuYjNSuuXd3LKwJxuOyq776q+OxJuc
 0TBMF1bZouNuRA6wErYOinQ2WFywGI0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-vmZHfBmCNMuFfPHuok5qAw-1; Mon, 15 May 2023 04:55:17 -0400
X-MC-Unique: vmZHfBmCNMuFfPHuok5qAw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f33f8ffa95so46409385e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684140916; x=1686732916;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lxCFLeb/CJjEAlJNk9ShHxl5KY9C6nTvh827u5t2YA=;
 b=OQuLxw8IzdZTiFTPTkBU++uq2YKaLcPwSIOWHm+giJMdI1I9uZDJpuc9D9ZxduUeXi
 edNcX4vbE8OAtfg2pKW3XiXFpVgdfU4564qLJc+ULKSvt/xP6fNs6+0AIg4z9izymmhg
 dTMRj1BWHtn+bgh2dvl/pSfsV7v+VGckH/rF/mtAg4nEW2Fq9xYfoZt9K8unoZ/tOL08
 C4lbwkanG2AF9KLlwnSUxsgZADmrt5Ao+h1XY7xO+d4RVKXGMeJD3ofreoCIauVGTD4E
 91OxVlWzUwMq08tvrgvecON7vhNZ+8u17WetbqtDgZ/eQ5XjKlqwMPDStVRabEgKuroA
 ugzA==
X-Gm-Message-State: AC+VfDzRhkTzendq3NL6U83X6JKxZDxNdZ8acUQbhEguxBrIpnNSAAQ1
 EKQqz8CgMZljL74pM9j/fOfN8evoCaq+uoNmNvS2uoizbRS54hKkigRlU0rsVBfL5ct4f2u5Vtb
 fGHCPMzeV6AEj3F4=
X-Received: by 2002:a1c:cc19:0:b0:3f5:bc8:e395 with SMTP id
 h25-20020a1ccc19000000b003f50bc8e395mr1241648wmb.11.1684140915941; 
 Mon, 15 May 2023 01:55:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5u5RMXbskyZ0qmC/SsgufhD1DZqLGr9zO1lmTSWgvpJTr1yyl0mw2NKFfKtyft88NK3TrWrQ==
X-Received: by 2002:a1c:cc19:0:b0:3f5:bc8:e395 with SMTP id
 h25-20020a1ccc19000000b003f50bc8e395mr1241638wmb.11.1684140915636; 
 Mon, 15 May 2023 01:55:15 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b003078cd719ffsm26636180wrr.95.2023.05.15.01.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:55:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 3/8] migration: converts socket backend to accept
 MigrateAddress struct
In-Reply-To: <20230512143240.192504-4-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:35 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-4-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 10:55:14 +0200
Message-ID: <87wn1a0ya5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> Socket transport backend for 'migrate'/'migrate-incoming' QAPIs accept
> new wire protocol of MigrateAddress struct.
>
> It is achived by parsing 'uri' string and storing migration parameters
> required for socket connection into well defined SocketAddress struct.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/exec.c      |  4 ++--
>  migration/exec.h      |  4 ++++
>  migration/migration.c | 44 +++++++++++++++++++++++++++++++------------
>  migration/socket.c    | 34 +++++----------------------------
>  migration/socket.h    |  7 ++++---
>  5 files changed, 47 insertions(+), 46 deletions(-)
>
> diff --git a/migration/exec.c b/migration/exec.c
> index 2bf882bbe1..c4a3293246 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -27,7 +27,6 @@
>  #include "qemu/cutils.h"
>=20=20
>  #ifdef WIN32
> -const char *exec_get_cmd_path(void);
>  const char *exec_get_cmd_path(void)
>  {
>      g_autofree char *detected_path =3D g_new(char, MAX_PATH);

Make this and related chunks it its own patch.


> @@ -40,7 +39,8 @@ const char *exec_get_cmd_path(void)
>  }
>  #endif
>=20=20
> -void exec_start_outgoing_migration(MigrationState *s, const char *comman=
d, Error **errp)
> +void exec_start_outgoing_migration(MigrationState *s, const char *comman=
d,
> +                                   Error **errp)
>  {
>      QIOChannel *ioc;
>=20=20

Drop this bit.  If you want to cleanup longer that 80 chars lines, do it
in a sperate patch.


> +    if (local_err) {
> +        qapi_free_SocketAddress(saddr);
> +        error_propagate(errp, local_err);
> +        return;
> +    }

Aha, I see what you want to do here, but I=20

From include/qapi/error.h

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.
 *


I think that what you have to do here is drop local_err and just change

socket_start_incoming_migration() and fd_start_incoming_migration() to
return a bool.

> -void socket_start_outgoing_migration(MigrationState *s,
> -                                     const char *str,
> -                                     Error **errp)
> -{
> -    Error *err =3D NULL;
> -    SocketAddress *saddr =3D socket_parse(str, &err);
> -    if (!err) {
> -        socket_start_outgoing_migration_internal(s, saddr, &err);
> -    }
> -    error_propagate(errp, err);
> -}

And here we are.  This function got it wrong, and you copied from here.
My understanding is that this function should have been written as:

void socket_start_outgoing_migration(MigrationState *s,
                                     const char *str,
                                     Error **errp)
{
    SocketAddress *saddr =3D socket_parse(str, &err);
    if (!saddr) {
        socket_start_outgoing_migration_internal(s, saddr, &err);
    }
}


> -void socket_start_incoming_migration(const char *str, Error **errp)
> -{
> -    Error *err =3D NULL;
> -    SocketAddress *saddr =3D socket_parse(str, &err);
> -    if (!err) {
> -        socket_start_incoming_migration_internal(saddr, &err);
> -    }
> -    qapi_free_SocketAddress(saddr);
> -    error_propagate(errp, err);
> -}

Exactly the same here.

Not your fault, but can you do the changes, please?

Later, Juan.


