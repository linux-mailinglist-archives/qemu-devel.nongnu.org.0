Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE7459FBE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:05:52 +0100 (CET)
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSgQ-0008JT-PR
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpSe5-0007Pm-Iz
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:03:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpSe0-0004z2-8U
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637661790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZxXQCrjN9bJvJhMV9hfoSv9zM4V6dDswOUpIGSwu+pg=;
 b=Afvmn6ddFUE6zTGChd3Kn96aNq6QvrzfcNBrJn14EC9KrSP+kTOa3ZXeAmdf86R5ILgtbs
 yatKMkzMge1/6TIMZdzwi45yaxMJx4QIuAjtBrS2sn49qZ+Wp9GwheGcAi05vK/5nuK3BG
 tEeo6AIEHe0+dgfK3VrzUtE6nCSMxbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-OUgkoKLiNcKKbqzzBl-olg-1; Tue, 23 Nov 2021 05:03:02 -0500
X-MC-Unique: OUgkoKLiNcKKbqzzBl-olg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 405471DDF9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 10:03:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4370FCFFA;
 Tue, 23 Nov 2021 10:02:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AAA5511380A7; Tue, 23 Nov 2021 11:02:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 07/12] qapi: Allow defining QOM classes
References: <20211103173002.209906-1-kwolf@redhat.com>
 <20211103173002.209906-8-kwolf@redhat.com>
Date: Tue, 23 Nov 2021 11:02:57 +0100
In-Reply-To: <20211103173002.209906-8-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 3 Nov 2021 18:29:57 +0100")
Message-ID: <871r379oku.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 eblake@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  scripts/qapi/expr.py   | 28 +++++++++++++++++-
>  scripts/qapi/schema.py | 66 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)

Missing: docs/devel/qapi-code-gen.rst update.  I understand why, but it
does make review harder.

>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 3cb389e875..77550629f3 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -181,6 +181,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
>      """
>      if meta == 'event':
>          check_name_upper(name, info, meta)
> +    elif meta == 'class':
> +        check_name_str(name, info, meta)

This permits arbitrary QAPI names.  I figure we'll want to define and
enforce a suitable naming convention.

>      elif meta == 'command':
>          check_name_lower(
>              name, info, meta,
> @@ -557,6 +559,24 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
>          check_type(value['type'], info, source)
>  
>  
> +def check_class(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Normalize and validate this expression as a ``class`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI schema source file information.
> +
> +    :raise QAPISemError: When ``expr`` is not a valid ``class``.
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
> +    config = expr.get('config')
> +    config_boxed = expr.get('config-boxed', False)
> +
> +    if config_boxed and config is None:
> +        raise QAPISemError(info, "'boxed': true requires 'config'")

You check 'config-boxed', but the error message talks about 'boxed'.

> +    check_type(config, info, "'config'", allow_dict=not config_boxed)
> +
> +
>  def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
>      """
>      Normalize and validate this expression as a ``command`` definition.
> @@ -627,7 +647,7 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>              continue
>  
>          metas = expr.keys() & {'enum', 'struct', 'union', 'alternate',
> -                               'command', 'event'}
> +                               'class', 'command', 'event'}
>          if len(metas) != 1:
>              raise QAPISemError(
>                  info,
> @@ -671,6 +691,12 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>                         ['struct', 'data'], ['base', 'if', 'features'])
>              normalize_members(expr['data'])
>              check_struct(expr, info)
> +        elif meta == 'class':
> +            check_keys(expr, info, meta,
> +                       ['class'], ['if', 'features', 'parent', 'config',
> +                        'config-boxed'])
> +            normalize_members(expr.get('config'))
> +            check_class(expr, info)
>          elif meta == 'command':
>              check_keys(expr, info, meta,
>                         ['command'],
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index b7b3fc0ce4..ebf69341d7 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -155,6 +155,9 @@ def visit_object_type_flat(self, name, info, ifcond, features,
>      def visit_alternate_type(self, name, info, ifcond, features, variants):
>          pass
>  
> +    def visit_class(self, entity):
> +        pass
> +
>      def visit_command(self, name, info, ifcond, features,
>                        arg_type, ret_type, gen, success_response, boxed,
>                        allow_oob, allow_preconfig, coroutine):
> @@ -766,6 +769,50 @@ def __init__(self, name, info, typ, ifcond=None):
>          super().__init__(name, info, typ, False, ifcond)
>  
>  
> +class QAPISchemaClass(QAPISchemaEntity):
> +    meta = 'class'
> +
> +    def __init__(self, name, info, doc, ifcond, features, parent,
> +                 config_type, config_boxed):
> +        super().__init__(name, info, doc, ifcond, features)
> +
> +        assert not parent or isinstance(parent, str)

I can't see what ensures this.

> +        assert not config_type or isinstance(config_type, str)
> +        self._parent_name = parent
> +        self.parent = None
> +        self._config_type_name = config_type
> +        self.config_type = None
> +        self.config_boxed = config_boxed
> +
> +    def check(self, schema):
> +        super().check(schema)
> +
> +        if self._parent_name:
> +            self.parent = schema.lookup_entity(self._parent_name,
> +                                               QAPISchemaClass)
> +            if not self.parent:
> +                raise QAPISemError(
> +                    self.info,
> +                    "Unknown parent class '%s'" % self._parent_name)
> +
> +        if self._config_type_name:
> +            self.config_type = schema.resolve_type(
> +                self._config_type_name, self.info, "class 'config'")

"class's 'config'" for consistency with other uses of .resolve_type().

> +            if not isinstance(self.config_type, QAPISchemaObjectType):
> +                raise QAPISemError(
> +                    self.info,
> +                    "class 'config' cannot take %s"
> +                    % self.config_type.describe())
> +            if self.config_type.variants and not self.boxed:

self.config_boxed?

> +                raise QAPISemError(
> +                    self.info,
> +                    "class 'config' can take %s only with 'boxed': true"

'config-boxed'?

> +                    % self.config_type.describe())
> +
> +    def visit(self, visitor):
> +        super().visit(visitor)
> +        visitor.visit_class(self)
> +
>  class QAPISchemaCommand(QAPISchemaEntity):
>      meta = 'command'
>  
> @@ -1110,6 +1157,23 @@ def _def_alternate_type(self, expr, info, doc):
>                                      QAPISchemaVariants(
>                                          None, info, tag_member, variants)))
>  
> +    def _def_class(self, expr, info, doc):
> +        name = expr['class']
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
> +        features = self._make_features(expr.get('features'), info)
> +        parent = expr.get('parent')
> +        config_type = expr.get('config')
> +        config_boxed = expr.get('config-boxed')
> +
> +        if isinstance(config_type, OrderedDict):
> +            config_type = self._make_implicit_object_type(
> +                name, info, ifcond,
> +                'config', self._make_members(config_type, info))

Does QAPISchemaMember.describe() need an update for this?

> +
> +        self._def_entity(QAPISchemaClass(
> +            name, info, doc, ifcond, features, parent, config_type,
> +            config_boxed))
> +
>      def _def_command(self, expr, info, doc):
>          name = expr['command']
>          data = expr.get('data')
> @@ -1161,6 +1225,8 @@ def _def_exprs(self, exprs):
>                  self._def_union_type(expr, info, doc)
>              elif 'alternate' in expr:
>                  self._def_alternate_type(expr, info, doc)
> +            elif 'class' in expr:
> +                self._def_class(expr, info, doc)
>              elif 'command' in expr:
>                  self._def_command(expr, info, doc)
>              elif 'event' in expr:


