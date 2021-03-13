Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DD339D60
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:37:00 +0100 (CET)
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0hg-0001r8-0D
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL0g8-0001MI-6t
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:35:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL0g5-0007zp-Vn
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615628120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uy98qZvpA4ZVhtRWvRcuBmj4KYzDk8+H7VaV08O7OD4=;
 b=hFOQNt5eobHN45HFudldNIpWQaGzKGculvpD7fU0Hn937x9UggelJiEJfhrywcxeOpllDi
 ADF3GKLAZsbp8N3NwyjBaqRGuQRBBGaLlmrstnBNzPJPq7o1z+mKVR83pKKyrva9ubcR8b
 Xduz4o9TnaQiPKyD7Zkn8jn5SyGNu+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Shx5Ic3POj-BKoA89OuSdA-1; Sat, 13 Mar 2021 04:35:19 -0500
X-MC-Unique: Shx5Ic3POj-BKoA89OuSdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373128015BD
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:35:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D44B362463;
 Sat, 13 Mar 2021 09:35:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49B611132C12; Sat, 13 Mar 2021 10:35:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 10:35:16 +0100
In-Reply-To: <20210311172459.990281-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 11 Mar 2021 12:24:58 -0500")
Message-ID: <87czw3wg4r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Emulators are currently using OptsVisitor (via user_creatable_add_opts)
> to parse the -object command line option.  This has one extra feature,
> compared to keyval, which is automatic conversion of integers to lists
> as well as support for lists as repeated options:
>
>   -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
>
> So we cannot replace OptsVisitor with keyval right now.  Still, this
> patch moves the user_creatable_add_opts logic to vl.c since it is
> not needed anywhere else,

and new uses would be quite unwelcome :)

>                           and makes it go through user_creatable_add_qapi.
>
> In order to minimize code changes, the predicate still takes a string.
> This can be changed later to use the ObjectType QAPI enum directly.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qom/object_interfaces.h | 50 ++--------------------
>  qom/object_interfaces.c         | 57 +------------------------
>  softmmu/vl.c                    | 73 +++++++++++++++++++++++++--------
>  3 files changed, 60 insertions(+), 120 deletions(-)

Nice diffstat.

>
> diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
> index fb32330901..454fe4435b 100644
> --- a/include/qom/object_interfaces.h
> +++ b/include/qom/object_interfaces.h
> @@ -95,54 +95,10 @@ Object *user_creatable_add_type(const char *type, const char *id,
>   * Create an instance of the user creatable object according to the
>   * options passed in @opts as described in the QAPI schema documentation.
>   *
> - * Returns: the newly created object or NULL on error
> - */
> -void user_creatable_add_qapi(ObjectOptions *options, Error **errp);
> -
> -/**
> - * user_creatable_add_opts:
> - * @opts: the object definition
> - * @errp: if an error occurs, a pointer to an area to store the error
> - *
> - * Create an instance of the user creatable object whose type
> - * is defined in @opts by the 'qom-type' option, placing it
> - * in the object composition tree with name provided by the
> - * 'id' field. The remaining options in @opts are used to
> - * initialize the object properties.
> - *
> - * Returns: the newly created object or NULL on error
> - */
> -Object *user_creatable_add_opts(QemuOpts *opts, Error **errp);
> -
> -
> -/**
> - * user_creatable_add_opts_predicate:
> - * @type: the QOM type to be added
> - *
> - * A callback function to determine whether an object
> - * of type @type should be created. Instances of this
> - * callback should be passed to user_creatable_add_opts_foreach
> - */
> -typedef bool (*user_creatable_add_opts_predicate)(const char *type);
> -
> -/**
> - * user_creatable_add_opts_foreach:
> - * @opaque: a user_creatable_add_opts_predicate callback or NULL
> - * @opts: options to create
> - * @errp: unused
> - *
> - * An iterator callback to be used in conjunction with
> - * the qemu_opts_foreach() method for creating a list of
> - * objects from a set of QemuOpts
> - *
> - * The @opaque parameter can be passed a user_creatable_add_opts_predicate
> - * callback to filter which types of object are created during iteration.
> - * When it fails, report the error.
> - *
> - * Returns: 0 on success, -1 when an error was reported.
> + * Returns: true when an object was successfully created, false when an error
> + * occurred
>   */
> -int user_creatable_add_opts_foreach(void *opaque,
> -                                    QemuOpts *opts, Error **errp);
> +bool user_creatable_add_qapi(ObjectOptions *options, Error **errp);
>  
>  /**
>   * user_creatable_parse_str:
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 62d7db7629..2e50698075 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -117,7 +117,7 @@ out:
>      return obj;
>  }
>  
> -void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
> +bool user_creatable_add_qapi(ObjectOptions *options, Error **errp)
>  {
>      Visitor *v;
>      QObject *qobj;
> @@ -138,60 +138,7 @@ void user_creatable_add_qapi(ObjectOptions *options, Error **errp)
>                                    options->id, props, v, errp);
>      object_unref(obj);
>      visit_free(v);
> -}
> -
> -Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
> -{
> -    Visitor *v;
> -    QDict *pdict;
> -    Object *obj;
> -    const char *id = qemu_opts_id(opts);
> -    char *type = qemu_opt_get_del(opts, "qom-type");
> -
> -    if (!type) {
> -        error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
> -        return NULL;
> -    }
> -    if (!id) {
> -        error_setg(errp, QERR_MISSING_PARAMETER, "id");
> -        qemu_opt_set(opts, "qom-type", type, &error_abort);
> -        g_free(type);
> -        return NULL;
> -    }
> -
> -    qemu_opts_set_id(opts, NULL);

These things are now checked by visit_type_ObjectOptions() below.

> -    pdict = qemu_opts_to_qdict(opts, NULL);
> -
> -    v = opts_visitor_new(opts);
> -    obj = user_creatable_add_type(type, id, pdict, v, errp);
> -    visit_free(v);
> -
> -    qemu_opts_set_id(opts, (char *) id);
> -    qemu_opt_set(opts, "qom-type", type, &error_abort);
> -    g_free(type);
> -    qobject_unref(pdict);
> -    return obj;
> -}
> -
> -
> -int user_creatable_add_opts_foreach(void *opaque, QemuOpts *opts, Error **errp)
> -{
> -    bool (*type_opt_predicate)(const char *, QemuOpts *) = opaque;
> -    Object *obj = NULL;
> -    const char *type;
> -
> -    type = qemu_opt_get(opts, "qom-type");
> -    if (type && type_opt_predicate &&
> -        !type_opt_predicate(type, opts)) {
> -        return 0;
> -    }
> -
> -    obj = user_creatable_add_opts(opts, errp);
> -    if (!obj) {
> -        return -1;
> -    }
> -    object_unref(obj);
> -    return 0;
> +    return obj != NULL;
>  }
>  
>  char *object_property_help(const char *name, const char *type,
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7..b245e912e5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -117,6 +117,7 @@
>  #include "qapi/qapi-commands-block-core.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-misc.h"
> +#include "qapi/qapi-visit-qom.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/iothread.h"
> @@ -132,10 +133,16 @@ typedef struct BlockdevOptionsQueueEntry {
>  
>  typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
>  
> +typedef struct ObjectOption {
> +    ObjectOptions *opts;
> +    QTAILQ_ENTRY(ObjectOption) next;
> +} ObjectOption;
> +
>  static const char *cpu_option;
>  static const char *mem_path;
>  static const char *incoming;
>  static const char *loadvm;
> +static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
>  static ram_addr_t maxram_size;
>  static uint64_t ram_slots;
>  static int display_remote;
> @@ -1684,6 +1691,48 @@ static int machine_set_property(void *opaque,
>      return object_parse_property_opt(opaque, name, value, "type", errp);
>  }
>  
> +static void object_option_foreach_add(bool (*type_opt_predicate)(const char *), Error **errp)
> +{
> +    ObjectOption *opt, *next;
> +
> +    QTAILQ_FOREACH_SAFE(opt, &object_opts, next, next) {
> +        const char *type = ObjectType_str(opt->opts->qom_type);
> +        if (type_opt_predicate(type)) {
> +            if (!user_creatable_add_qapi(opt->opts, errp)) {
> +                return;
> +            }
> +            qapi_free_ObjectOptions(opt->opts);
> +            QTAILQ_REMOVE(&object_opts, opt, next);
> +        }
> +    }
> +}
> +
> +static void object_option_parse(const char *optarg)
> +{
> +    ObjectOption *opt;
> +    QemuOpts *opts;
> +    const char *type;
> +    Visitor *v;
> +
> +    opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
> +                                   optarg, true);
> +    if (!opts) {
> +        exit(1);
> +    }
> +
> +    type = qemu_opt_get(opts, "qom-type");
> +    if (user_creatable_print_help(type, opts)) {
> +        exit(0);
> +    }

You move help printing from creation to parse time.  Makes sense, but
I'd make it a separate patch, or mention it in the commit message.

> +
> +    opt = g_new0(ObjectOption, 1);
> +    v = opts_visitor_new(opts);
> +    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
> +    visit_free(v);
> +
> +    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
> +}
> +
>  /*
>   * Initial object creation happens before all other
>   * QEMU data types are created. The majority of objects
> @@ -1691,12 +1740,8 @@ static int machine_set_property(void *opaque,
>   * cannot be created here, as it depends on the chardev
>   * already existing.
>   */
> -static bool object_create_early(const char *type, QemuOpts *opts)
> +static bool object_create_early(const char *type)
>  {
> -    if (user_creatable_print_help(type, opts)) {
> -        exit(0);
> -    }
> -
>      /*
>       * Objects should not be made "delayed" without a reason.  If you
>       * add one, state the reason in a comment!
> @@ -1815,9 +1860,7 @@ static void qemu_create_early_backends(void)
>          exit(1);
>      }
>  
> -    qemu_opts_foreach(qemu_find_opts("object"),
> -                      user_creatable_add_opts_foreach,
> -                      object_create_early, &error_fatal);
> +    object_option_foreach_add(object_create_early, &error_fatal);

Unlike the old code, the new code removes the entries where
object_create_early() is true from the set of stored -object options.

>  
>      /* spice needs the timers to be initialized by this point */
>      /* spice must initialize before audio as it changes the default auiodev */
> @@ -1846,9 +1889,9 @@ static void qemu_create_early_backends(void)
>   * The remainder of object creation happens after the
>   * creation of chardev, fsdev, net clients and device data types.
>   */
> -static bool object_create_late(const char *type, QemuOpts *opts)
> +static bool object_create_late(const char *type)
>  {
> -    return !object_create_early(type, opts);
> +    return !object_create_early(type);
>  }
>  
>  static void qemu_create_late_backends(void)
> @@ -1859,9 +1902,7 @@ static void qemu_create_late_backends(void)
>  
>      net_init_clients(&error_fatal);
>  
> -    qemu_opts_foreach(qemu_find_opts("object"),
> -                      user_creatable_add_opts_foreach,
> -                      object_create_late, &error_fatal);
> +    object_option_foreach_add(object_create_late, &error_fatal);

Likewise.

Before and after the patch, object_create_late(opt) ==
!object_create_early(opt).  Your patch provides us with an opportunity
to assert this: object_opts must be empty now.  Suggestion, not demand.

>  
>      if (tpm_init() < 0) {
>          exit(1);
> @@ -3398,11 +3439,7 @@ void qemu_init(int argc, char **argv, char **envp)
>  #endif
>                  break;
>              case QEMU_OPTION_object:
> -                opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
> -                                               optarg, true);
> -                if (!opts) {
> -                    exit(1);
> -                }
> +                object_option_parse(optarg);
>                  break;
>              case QEMU_OPTION_overcommit:
>                  opts = qemu_opts_parse_noisily(qemu_find_opts("overcommit"),

Only suggestions, so:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


