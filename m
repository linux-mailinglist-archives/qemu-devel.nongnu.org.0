Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E125E339D10
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 09:42:55 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKzrK-00052I-Cy
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 03:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKzqS-0004Un-C0
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 03:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKzqP-0001PG-29
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 03:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615624914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12zxkmgqEBq38MxXRnVsuUEFqqIQph0PHUwFYS8QZd0=;
 b=H/0VILe7PgXdR0a8v9cSs9o64G8UGC+w+bwBpDCdH0DTG4bpU8q6JZSu+qon5PwjEvjdQm
 VSWL98kqQGFSrRQPqfmsPO6YQ6bPs8JZ+17JJX/m3z1W0WTU5IEleFmaZuBW+OY52pZYkX
 Q15DXsSq47QolU8iR9laJI2ek0haCq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-G_ijTLnwOxmzR37pm_bZkA-1; Sat, 13 Mar 2021 03:41:53 -0500
X-MC-Unique: G_ijTLnwOxmzR37pm_bZkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43DC48189C7;
 Sat, 13 Mar 2021 08:41:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB65A620DE;
 Sat, 13 Mar 2021 08:41:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F2361132C12; Sat, 13 Mar 2021 09:41:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 22/30] qom: Factor out user_creatable_process_cmdline()
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-23-kwolf@redhat.com>
Date: Sat, 13 Mar 2021 09:41:42 +0100
In-Reply-To: <20210308165440.386489-23-kwolf@redhat.com> (Kevin Wolf's message
 of "Mon, 8 Mar 2021 17:54:32 +0100")
Message-ID: <87h7lfwim1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> The implementation for --object can be shared between
> qemu-storage-daemon and other binaries, so move it into a function in
> qom/object_interfaces.c that is accessible from everywhere.
>
> This also requires moving the implementation of qmp_object_add() into a
> new user_creatable_add_qapi(), because qom/qom-qmp-cmds.c is not linked
> for tools.
>
> user_creatable_print_help_from_qdict() can become static now.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Acked-by: Peter Krempa <pkrempa@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qom/object_interfaces.h      | 41 +++++++++++++++--------
>  qom/object_interfaces.c              | 50 +++++++++++++++++++++++++++-
>  qom/qom-qmp-cmds.c                   | 20 +----------
>  storage-daemon/qemu-storage-daemon.c | 24 ++-----------
>  4 files changed, 80 insertions(+), 55 deletions(-)
>
> diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
> index 5299603f50..1e6c51b541 100644
> --- a/include/qom/object_interfaces.h
> +++ b/include/qom/object_interfaces.h
> @@ -2,6 +2,7 @@
>  #define OBJECT_INTERFACES_H
>  
>  #include "qom/object.h"
> +#include "qapi/qapi-types-qom.h"
>  #include "qapi/visitor.h"
>  
>  #define TYPE_USER_CREATABLE "user-creatable"
> @@ -86,6 +87,18 @@ Object *user_creatable_add_type(const char *type, const char *id,
>                                  const QDict *qdict,
>                                  Visitor *v, Error **errp);
>  
> +/**
> + * user_creatable_add_qapi:
> + * @options: the object definition
> + * @errp: if an error occurs, a pointer to an area to store the error
> + *
> + * Create an instance of the user creatable object according to the
> + * options passed in @opts as described in the QAPI schema documentation.
> + *
> + * Returns: the newly created object or NULL on error
> + */
> +void user_creatable_add_qapi(ObjectOptions *options, Error **errp);
> +
>  /**
>   * user_creatable_add_opts:
>   * @opts: the object definition
> @@ -131,6 +144,21 @@ typedef bool (*user_creatable_add_opts_predicate)(const char *type);
>  int user_creatable_add_opts_foreach(void *opaque,
>                                      QemuOpts *opts, Error **errp);
>  
> +/**
> + * user_creatable_process_cmdline:
> + * @optarg: the object definition string as passed on the command line
> + *
> + * Create an instance of the user creatable object by parsing optarg
> + * with a keyval parser and implicit key 'qom-type', converting the
> + * result to ObjectOptions and calling into qmp_object_add().
> + *
> + * If a help option is given, print help instead and exit.
> + *
> + * This function is only meant to be called during command line parsing.
> + * It exits the process on failure or after printing help.
> + */
> +void user_creatable_process_cmdline(const char *optarg);
> +
>  /**
>   * user_creatable_print_help:
>   * @type: the QOM type to be added
> @@ -145,19 +173,6 @@ int user_creatable_add_opts_foreach(void *opaque,
>   */
>  bool user_creatable_print_help(const char *type, QemuOpts *opts);
>  
> -/**
> - * user_creatable_print_help_from_qdict:
> - * @args: options to create
> - *
> - * Prints help considering the other options given in @args (if "qom-type" is
> - * given and valid, print properties for the type, otherwise print valid types)
> - *
> - * In contrast to user_creatable_print_help(), this function can't return that
> - * no help was requested. It should only be called if we know that help is
> - * requested and it will always print some help.
> - */
> -void user_creatable_print_help_from_qdict(QDict *args);
> -
>  /**
>   * user_creatable_del:
>   * @id: the unique ID for the object
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 02c3934329..2eaf9971f5 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -2,10 +2,13 @@
>  
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-qom.h"
> +#include "qapi/qapi-visit-qom.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qmp/qjson.h"
>  #include "qapi/qobject-input-visitor.h"
> +#include "qapi/qobject-output-visitor.h"
>  #include "qom/object_interfaces.h"
>  #include "qemu/help_option.h"
>  #include "qemu/id.h"
> @@ -113,6 +116,29 @@ out:
>      return obj;
>  }
>  
> +void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
> +{
> +    Visitor *v;
> +    QObject *qobj;
> +    QDict *props;
> +    Object *obj;
> +
> +    v = qobject_output_visitor_new(&qobj);
> +    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
> +    visit_complete(v, &qobj);
> +    visit_free(v);
> +
> +    props = qobject_to(QDict, qobj);
> +    qdict_del(props, "qom-type");
> +    qdict_del(props, "id");
> +
> +    v = qobject_input_visitor_new(QOBJECT(props));
> +    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
> +                                  options->id, props, v, errp);
> +    object_unref(obj);
> +    visit_free(v);
> +}
> +

Observation, not objection:

1. QMP core parses JSON text into QObject, passes to generated
   marshaller.

2. Marshaller converts QObject to ObjectOptions with the QObject input
   visitor, passes to qmp_object_add().

3. qmp_object_add() wraps around user_creatable_add_qapi().

4. user_creatable_add_qapi() converts right back to QObject with the
   QObject output visitor.  It splits the result into qom_type, id and
   the rest, and passes all three to user_creatable_add_type().

5. user_creatable_add_type() performs a virtual visit with the QObject
   input visitor.  The outermost object it visits itself, its children
   it visits by calling object_property_set().

I sure hope we wouldn't write it this way from scratch :)

I think your patch is a reasonable step towards a QOM that is at peace
with QAPI.  But there's plenty of work left.

[...]


