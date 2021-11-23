Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F045A526
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:19:03 +0100 (CET)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWdT-0004f0-4Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:19:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpWba-0003vz-Ai
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:17:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpWbY-0000dS-2o
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637677023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mCGB5PhpObxFTcz5ThilELLpZjS8G2lh7QulHQX60RE=;
 b=EEnYvFbbWlOBmT/mXqO2UZQI9v6DK/MHzlh8KBDaEWdPjWaKkwIWFppK7TlX5fF2+1ULp2
 SjoUm9H9KiUz09hAfvW5Xy6E4DjFOsw8xuRjV656YQ8sAaiMQkUxBGEfvudYcrhfq7bfnx
 qjKQDx7V6aRo8olYMkkHRoN2ZDUbVZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-YiKLh0D3P_W5_qY_dUoV7Q-1; Tue, 23 Nov 2021 09:17:00 -0500
X-MC-Unique: YiKLh0D3P_W5_qY_dUoV7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD88510168D2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 14:16:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7B479453;
 Tue, 23 Nov 2021 14:16:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BFF9A11380A7; Tue, 23 Nov 2021 15:16:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 10/12] qapi: Generate QOM config marshalling code
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-11-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 15:16:45 +0100
In-Reply-To: <20211103173002.209906-11-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:30:00 +0100")
Message-ID: <87h7c3554i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  backends/rng-random.c | 17 ++------
>  backends/rng.c        | 17 ++------
>  scripts/qapi/main.py  |  2 +
>  scripts/qapi/qom.py   | 91 +++++++++++++++++++++++++++++++++++++++++++
>  qapi/meson.build      |  3 ++
>  5 files changed, 104 insertions(+), 26 deletions(-)
>  create mode 100644 scripts/qapi/qom.py
>
> diff --git a/backends/rng-random.c b/backends/rng-random.c
> index b221308091..35738df3c6 100644
> --- a/backends/rng-random.c
> +++ b/backends/rng-random.c
> @@ -14,6 +14,7 @@
>  #include "sysemu/rng-random.h"
>  #include "sysemu/rng.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-qom-qom.h"
>  #include "qapi/visitor.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qemu/main-loop.h"
> @@ -90,7 +91,8 @@ static char *rng_random_get_filename(Object *obj, Error **errp)
>      return g_strdup(s->filename);
>  }
>  
> -static bool rng_random_config(Object *obj, const char *filename, Error **errp)
> +bool qom_rng_random_config(Object *obj, bool has_filename,
> +                           const char *filename, Error **errp)
>  {
>      RngRandom *s = RNG_RANDOM(obj);
>  
> @@ -100,17 +102,6 @@ static bool rng_random_config(Object *obj, const char *filename, Error **errp)
>      return true;
>  }
>  
> -static bool rng_random_marshal_config(Object *obj, Visitor *v, Error **errp)
> -{
> -    g_autofree char *filename = NULL;
> -
> -    if (!visit_type_str(v, "filename", &filename, errp)) {
> -        return false;
> -    }
> -
> -    return rng_random_config(obj, filename, errp);
> -}
> -

Generated replacement:

   bool qom_rng_random_marshal_config(Object *obj, Visitor *v, Error **errp)
   {
       q_obj_rng_random_config config = {0};

       if (!visit_type_q_obj_rng_random_config_members(v, &config, errp)) {
           return false;
       }

       return qom_rng_random_config(obj, config.has_filename, config.filename, errp);
   }

where visit_type_q_obj_rng_random_config_members() is

    bool visit_type_q_obj_rng_random_config_members(Visitor *v, q_obj_rng_random_config *obj, Error **errp)
    {
        if (visit_optional(v, "filename", &obj->has_filename)) {
            if (!visit_type_str(v, "filename", &obj->filename, errp)) {
                return false;
            }
        }
        return true;
    }

The handwritten version lacks a visit_optional(), I think.

>  static void rng_random_init(Object *obj)
>  {
>      RngRandom *s = RNG_RANDOM(obj);
> @@ -148,7 +139,7 @@ static const TypeInfo rng_random_info = {
>      .instance_size = sizeof(RngRandom),
>      .class_init = rng_random_class_init,
>      .instance_init = rng_random_init,
> -    .instance_config = rng_random_marshal_config,
> +    .instance_config = qom_rng_random_marshal_config,
>      .instance_finalize = rng_random_finalize,
>  };
>  
> diff --git a/backends/rng.c b/backends/rng.c
> index 840daf0392..d560bd7b5d 100644
> --- a/backends/rng.c
> +++ b/backends/rng.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/rng.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-qom-qom.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
> @@ -77,24 +78,14 @@ static void rng_backend_complete(UserCreatable *uc, Error **errp)
>      rng_backend_prop_set_opened(OBJECT(uc), true, errp);
>  }
>  
> -static bool rng_backend_config(Object *obj, bool opened, Error **errp)
> +bool qom_rng_backend_config(Object *obj, bool has_opened, bool opened,
> +                            Error **errp)
>  {
>      ERRP_GUARD();
>      rng_backend_prop_set_opened(obj, opened, errp);
>      return *errp == NULL;
>  }
>  
> -static bool rng_backend_marshal_config(Object *obj, Visitor *v, Error **errp)
> -{
> -    bool opened;
> -
> -    if (!visit_type_bool(v, "opened", &opened, errp)) {
> -        return false;
> -    }
> -
> -    return rng_backend_config(obj, opened, errp);
> -}
> -

Generated replacement:

   bool qom_rng_backend_marshal_config(Object *obj, Visitor *v, Error **errp)
   {
       RngProperties config = {0};

       if (!visit_type_RngProperties_members(v, &config, errp)) {
           return false;
       }

       return qom_rng_backend_config(obj, config.has_opened, config.opened, errp);
   }

where visit_type_RngProperties_members() is

   bool visit_type_RngProperties_members(Visitor *v, RngProperties *obj, Error **errp)
   {
       if (visit_optional(v, "opened", &obj->has_opened)) {
           if (visit_policy_reject(v, "opened", 1u << QAPI_DEPRECATED, errp)) {
               return false;
           }
           if (!visit_policy_skip(v, "opened", 1u << QAPI_DEPRECATED)) {
               if (!visit_type_bool(v, "opened", &obj->opened, errp)) {
                   return false;
               }
           }
       }
       return true;
   }

The handwritten version lacks a visit_optional(), and neglects to check
policy.

>  static void rng_backend_free_request(RngRequest *req)
>  {
>      g_free(req->data);
> @@ -148,7 +139,7 @@ static const TypeInfo rng_backend_info = {
>      .parent = TYPE_OBJECT,
>      .instance_size = sizeof(RngBackend),
>      .instance_init = rng_backend_init,
> -    .instance_config = rng_backend_marshal_config,
> +    .instance_config = qom_rng_backend_marshal_config,
>      .instance_finalize = rng_backend_finalize,
>      .class_size = sizeof(RngBackendClass),
>      .class_init = rng_backend_class_init,
> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> index f2ea6e0ce4..b6b4a4a74d 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -16,6 +16,7 @@
>  from .error import QAPIError
>  from .events import gen_events
>  from .introspect import gen_introspect
> +from .qom import gen_qom
>  from .schema import QAPISchema
>  from .types import gen_types
>  from .visit import gen_visit
> @@ -52,6 +53,7 @@ def generate(schema_file: str,
>      gen_commands(schema, output_dir, prefix)
>      gen_events(schema, output_dir, prefix)
>      gen_introspect(schema, output_dir, prefix, unmask)
> +    gen_qom(schema, output_dir, prefix)
>  
>  
>  def main() -> int:
> diff --git a/scripts/qapi/qom.py b/scripts/qapi/qom.py
> new file mode 100644
> index 0000000000..1cca94890f
> --- /dev/null
> +++ b/scripts/qapi/qom.py
> @@ -0,0 +1,91 @@
> +"""
> +QAPI QOM boilerplate generator
> +
> +Copyright (c) 2021 Red Hat Inc.
> +
> +Authors:
> + Kevin Wolf <kwolf@redhat.com>
> +
> +This work is licensed under the terms of the GNU GPL, version 2.
> +See the COPYING file in the top-level directory.
> +"""
> +
> +from .common import c_name, mcgen
> +from .gen import (
> +    build_params,
> +    QAPISchemaModularCVisitor,
> +)
> +from .schema import (
> +    QAPISchema,
> +    QAPISchemaClass,
> +)
> +
> +
> +def gen_config_decl(c: QAPISchemaClass) -> str:
> +    params = build_params(c.config_type, c.config_boxed,  'Error **errp')
> +    return mcgen('''
> +bool qom_%(name)s_marshal_config(Object *obj, Visitor *v, Error **errp);
> +bool qom_%(name)s_config(Object *obj, %(params)s);
> +''', name=c.c_name(), params=params)
> +
> +
> +def gen_config_call(c: QAPISchemaClass) -> str:
> +    if c.config_boxed:
> +        argstr = '&config, '
> +    else:
> +        assert not c.config_type.variants
> +        argstr = ''
> +        for m in c.config_type.members:
> +            if m.optional:
> +                argstr += 'config.has_%s, ' % c_name(m.name)
> +            argstr += 'config.%s, ' % c_name(m.name)
> +
> +    return f'qom_{c.c_name()}_config(obj, {argstr}errp)'

Duplicates part of gen_call() from commands.py.  Let's not worry about
that right now.

> +
> +def gen_config(c: QAPISchemaClass) -> str:
> +    return mcgen('''
> +bool qom_%(qom_type)s_marshal_config(Object *obj, Visitor *v, Error **errp)
> +{
> +    %(config_name)s config = {0};
> +
> +    if (!visit_type_%(config_name)s_members(v, &config, errp)) {
> +        return false;
> +    }
> +
> +    return %(call)s;
> +}
> +
> +''', qom_type=c.c_name(), config_name=c.config_type.c_name(),
> +     call=gen_config_call(c))
> +
> +
> +class QAPISchemaGenQOMVisitor(QAPISchemaModularCVisitor):
> +
> +    def __init__(self, prefix: str):
> +        super().__init__(
> +            prefix, 'qapi-qom', ' * Schema-defined QOM types',
> +            None, __doc__)
> +
> +    def _begin_user_module(self, name: str) -> None:
> +        qom = self._module_basename('qapi-qom', name)
> +        types = self._module_basename('qapi-types', name)
> +        visit = self._module_basename('qapi-visit', name)
> +        self._genc.add(mcgen('''
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "%(qom)s.h"
> +#include "%(types)s.h"
> +#include "%(visit)s.h"
> +
> +''', types=types, visit=visit, qom=qom))
> +
> +    def visit_class(self, c: QAPISchemaClass) -> None:
> +        if c.config_type:
> +            self._genh.add(gen_config_decl(c))
> +            self._genc.add(gen_config(c))
> +
> +
> +def gen_qom(schema: QAPISchema, output_dir: str, prefix: str) -> None:
> +    vis = QAPISchemaGenQOMVisitor(prefix)
> +    schema.visit(vis)
> +    vis.write(output_dir)
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c356a385e3..10c412f1ad 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -87,6 +87,7 @@ qapi_nonmodule_outputs = [
>    'qapi-init-commands.h', 'qapi-init-commands.c',
>    'qapi-events.h', 'qapi-events.c',
>    'qapi-emit-events.c', 'qapi-emit-events.h',
> +  'qapi-qom.h', 'qapi-qom.c',
>  ]
>  
>  # First build all sources
> @@ -111,6 +112,8 @@ foreach module : qapi_all_modules
>        'qapi-events-@0@.h'.format(module),
>        'qapi-commands-@0@.c'.format(module),
>        'qapi-commands-@0@.h'.format(module),
> +      'qapi-qom-@0@.c'.format(module),
> +      'qapi-qom-@0@.h'.format(module),
>      ]
>    endif
>    if module.endswith('-target')


