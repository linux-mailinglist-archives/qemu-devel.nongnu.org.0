Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF84702A76
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:30:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVSa-0005rm-RR; Mon, 15 May 2023 06:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVST-0005rb-SX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyVSE-0006po-HM
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684146561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EJKGIWVoS4G4yQF7qyWjSqSwhcDSTo+tDOgtbXnhTAk=;
 b=eezuTOQQog4z/CHiuej8MeW+JP+/m0k95gX66H8wiLEINLaUHjHxs4HbEGUbvP4Ya3uUej
 A3CESYGOO4O9lISYlvXMnyr9zvt418cv6afKNYDqeW+9dydn9fLAq9q6iSUlVn7/Z7aRw8
 MDnqzU5D5OQxXf0oV4hzezNULwf1qbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-DwH4YOCwOLSL2QNzAoALmA-1; Mon, 15 May 2023 06:29:18 -0400
X-MC-Unique: DwH4YOCwOLSL2QNzAoALmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1365D867955;
 Mon, 15 May 2023 10:29:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFA3814152F6;
 Mon, 15 May 2023 10:29:16 +0000 (UTC)
Date: Mon, 15 May 2023 11:29:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 5/8] migration: converts exec backend to accept
 MigrateAddress struct.
Message-ID: <ZGIJehrjvkchRbeX@redhat.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-6-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512143240.192504-6-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 12, 2023 at 02:32:37PM +0000, Het Gala wrote:
> Exec transport backend for 'migrate'/'migrate-incoming' QAPIs accept
> new wire protocol of MigrateAddress struct.
> 
> It is achived by parsing 'uri' string and storing migration parameters
> required for exec connection into strList struct.
> 
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/exec.c      | 58 ++++++++++++++++++++++++++++++++-----------
>  migration/exec.h      |  4 +--
>  migration/migration.c | 10 +++-----
>  3 files changed, 50 insertions(+), 22 deletions(-)
> 
> diff --git a/migration/exec.c b/migration/exec.c
> index c4a3293246..210f4e9400 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -39,22 +39,51 @@ const char *exec_get_cmd_path(void)
>  }
>  #endif
>  
> -void exec_start_outgoing_migration(MigrationState *s, const char *command,
> +/* provides the length of strList */
> +static int
> +str_list_length(strList *list)
> +{
> +    int len = 0;
> +    strList *elem;
> +
> +    for (elem = list; elem != NULL; elem = elem->next) {
> +        len++;
> +    }
> +
> +    return len;
> +}
> +
> +static void
> +init_exec_array(strList *command, const char **argv, Error **errp)
> +{
> +    int i = 0;
> +    strList *lst;
> +
> +    for (lst = command; lst; lst = lst->next) {
> +        argv[i++] = lst->value;
> +    }
> +
> +    argv[i] = NULL;
> +    return;
> +}
> +
> +void exec_start_outgoing_migration(MigrationState *s, strList *command,
>                                     Error **errp)
>  {
>      QIOChannel *ioc;
>  
> -#ifdef WIN32
> -    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
> -#else
> -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
> -#endif
> +    int length = str_list_length(command);
> +    const char **argv = g_malloc0(length * sizeof(const char *));

g_malloc0 is almost never desirable to use, instead:

        g_new0(const char *, length);

>  
> -    trace_migration_exec_outgoing(command);
> +    init_exec_array(command, argv, errp);
> +    char *new_command = g_strjoinv(" ", (char **)argv);

Never freed - use

   g_autofree char *new_command...
   
> +    trace_migration_exec_outgoing(new_command);


>      ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
>                                                      O_RDWR,
>                                                      errp));
>      if (!ioc) {
> +        g_free(argv);
>          return;
>      }

argv needs freeing in success too. Simpler to declare it
with

    g_auto(GStrv) argv = .....



>  
> @@ -72,21 +101,22 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
>      return G_SOURCE_REMOVE;
>  }
>  
> -void exec_start_incoming_migration(const char *command, Error **errp)
> +void exec_start_incoming_migration(strList *command, Error **errp)
>  {
>      QIOChannel *ioc;
>  
> -#ifdef WIN32
> -    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
> -#else
> -    const char *argv[] = { "/bin/sh", "-c", command, NULL };
> -#endif
> +    int length = str_list_length(command);
> +    const char **argv = g_malloc0(length * sizeof(const char *));
> +
> +    init_exec_array(command, argv, errp);
> +    char *new_command = g_strjoinv(" ", (char **)argv);
>  
> -    trace_migration_exec_incoming(command);
> +    trace_migration_exec_incoming(new_command);
>      ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
>                                                      O_RDWR,
>                                                      errp));
>      if (!ioc) {
> +        g_free(argv);
>          return;
>      }

All the same comments as the outgoing case.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


