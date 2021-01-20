Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445432FD21D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:59:09 +0100 (CET)
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2E0q-0003gv-9k
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2Dyw-0002ea-2w
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2Dyt-0004rh-Bz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611151026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECnmTwBKD0iSJHCgJ5LNh1OI6YiJM55bUCJE0xzGpK8=;
 b=Spz7HwVeJVcrdoK+1k6TgFSy0bm5hEY2jcw8+Zq12OC1XWoN0R1/GBNEHzEP4gO+PN5chS
 pB1IwEWUifqGATSsB/naoYlnpqP/9yMjsconGYNrW1+AelH+2BZ4tip9UnB5DU+hwyf7IT
 UTIeeLCWDdMbnmh9Jsx6wYbE1Pnv3UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-5um2mEECOTGOyyLaOpmd0A-1; Wed, 20 Jan 2021 08:56:57 -0500
X-MC-Unique: 5um2mEECOTGOyyLaOpmd0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA091800D42
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:56:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 678A460C6C;
 Wed, 20 Jan 2021 13:56:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EACB6113865F; Wed, 20 Jan 2021 14:56:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/17] qapi: centralize
 is_[user|system|builtin]_module methods
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-7-jsnow@redhat.com>
Date: Wed, 20 Jan 2021 14:56:51 +0100
In-Reply-To: <20210119180242.1570753-7-jsnow@redhat.com> (John Snow's message
 of "Tue, 19 Jan 2021 13:02:31 -0500")
Message-ID: <87turbr9ss.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Define what a module is and define what kind of a module it is once and
> for all, in one place.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py |  2 +-
>  scripts/qapi/gen.py    | 21 +++++++--------------
>  scripts/qapi/schema.py | 28 ++++++++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index f754f675d66..08b9439de2b 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -464,7 +464,7 @@ def __init__(self, env, qapidir):
>          self._qapidir = qapidir
>  
>      def visit_module(self, module):
> -        if module.name:
> +        if module.user_module:
>              qapifile = self._qapidir + '/' + module.name
>              self._env.note_dependency(os.path.abspath(qapifile))
>          super().visit_module(module)

Cleaner:

           qapifile = module.source_filename()
           if qapifile:
               self._env.note_dependency(os.path.abspath(qapifile))

Observation, not demand.

> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index e73d3d61aac..3b7eddc1c21 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -250,21 +250,14 @@ def __init__(self,
>          self._main_module: Optional[str] = None
>  
>      @staticmethod
> -    def _is_user_module(name: Optional[str]) -> bool:
> -        return bool(name and not name.startswith('./'))
> -
> -    @staticmethod
> -    def _is_builtin_module(name: Optional[str]) -> bool:
> -        return not name
> -
> -    def _module_dirname(self, name: Optional[str]) -> str:
> -        if self._is_user_module(name):
> +    def _module_dirname(name: Optional[str]) -> str:
> +        if QAPISchemaModule.is_user_module(name):
>              return os.path.dirname(name)
>          return ''

No use of self left.  @staticmethod?

Or maybe ...

>  
>      def _module_basename(self, what: str, name: Optional[str]) -> str:
> -        ret = '' if self._is_builtin_module(name) else self._prefix
> -        if self._is_user_module(name):
> +        ret = '' if QAPISchemaModule.is_builtin_module(name) else self._prefix
> +        if QAPISchemaModule.is_user_module(name):
>              basename = os.path.basename(name)
>              ret += what
>              if name != self._main_module:
               if name != self._main_module:
                   ret += '-' + os.path.splitext(basename)[0]
           else:
               name = name[2:] if name else 'builtin'
               ret += re.sub(r'-', '-' + name + '-', what)
           return ret

       def _module_filename(self, what: str, name: Optional[str]) -> str:
           return os.path.join(self._module_dirname(name),
                               self._module_basename(what, name))

... replace this by

           return os.path.join(module.source_dirname(),
                               self._module_basename(what, name))

Requires plumbing @module from visit_module() to here.

Again, not a demand.

> @@ -286,7 +279,7 @@ def _add_module(self, name: Optional[str], blurb: str) -> None:
>          self._genc, self._genh = self._module[name]
>  
>      def _add_user_module(self, name: str, blurb: str) -> None:
> -        assert self._is_user_module(name)
> +        assert QAPISchemaModule.is_user_module(name)
>          if self._main_module is None:
>              self._main_module = name
>          self._add_module(name, blurb)
> @@ -296,7 +289,7 @@ def _add_system_module(self, name: Optional[str], blurb: str) -> None:
>  
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>          for name in self._module:
> -            if self._is_builtin_module(name) and not opt_builtins:
> +            if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>                  continue
>              (genc, genh) = self._module[name]
>              genc.write(output_dir)
> @@ -309,7 +302,7 @@ def _begin_user_module(self, name: str) -> None:
>          pass
>  
>      def visit_module(self, module: QAPISchemaModule) -> None:
> -        if module.name is None:
> +        if module.system_module:
>              if self._builtin_blurb:
>                  self._add_system_module(None, self._builtin_blurb)
>                  self._begin_system_module(module.name)
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 69ba722c084..44a9232c881 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -141,6 +141,30 @@ def __init__(self, name):
>          self.name = name
>          self._entity_list = []
>  
> +    @classmethod
> +    def is_system_module(cls, name: Optional[str]) -> bool:
> +        return name is None or name.startswith('./')
> +
> +    @classmethod
> +    def is_user_module(cls, name: Optional[str]) -> bool:
> +        return not cls.is_system_module(name)
> +
> +    @classmethod
> +    def is_builtin_module(cls, name: str) -> bool:
> +        return name == './builtin'

The names suggest these are predicates on modules, but they're actually
predicates on module *names*.

@staticmethod would suffice.  Actually, *functions* would.  All the
"classiness" buys us here is having to write
QAPISchemaModule.is_FOO_module(name) instead of is_FOO_module(name), and
...

If you *want* classy, have a class QAPISchemaModuleName.

> +
> +    @property
> +    def system_module(self) -> bool:
> +        return self.is_system_module(self.name)
> +
> +    @property
> +    def user_module(self) -> bool:
> +        return self.is_user_module(self.name)
> +
> +    @property
> +    def builtin_module(self) -> bool:
> +        return self.is_builtin_module(self.name)

... module.FOO_module instead of module.is_FOO_module.

Any particular reason for the @property decorator?

> +
>      def add_entity(self, ent):
>          self._entity_list.append(ent)
>  
> @@ -871,8 +895,8 @@ def resolve_type(self, name, info, what):
>          return typ
>  
>      def _module_name(self, fname):
> -        if fname is None:
> -            return None
> +        if QAPISchemaModule.is_system_module(fname):
> +            return fname
>          return os.path.relpath(fname, self._schema_dir)
>  
>      def _make_module(self, fname):
           name = self._module_name(fname)
           if name not in self._module_dict:
               self._module_dict[name] = QAPISchemaModule(name)
           return self._module_dict[name]

I got one more issue.

Before the patch:

* QAPISchemaModule deals with the user's modules and a single, special
  module for built-ins.  The former's name is the schema module filename
  relative to the main schema's directory, the latter's name is None.

* QAPISchemaModularCVisitor supports both kinds, and adds a third kind:
  system modules.  Their name begins with './', which cannot clash.
  These guys are used for generated code that doesn't fit anywhere else.

Your patch drags system modules into QAPISchemaModule.  Somewhat
awkward.  Could use comments (but then, much of scripts/qapi/ could).

Subtyping QAPISchemaModule is yet another possible way to avoid putting
knowledge about QAPISchemaModularCVisitor's doings into
QAPISchemaModule.


