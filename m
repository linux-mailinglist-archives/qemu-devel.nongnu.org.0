Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE762FD281
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:22:10 +0100 (CET)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EN7-0001xc-98
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2EM2-0000ce-Aj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2ELy-0004pH-2S
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611152456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHKbUDRpUO33/k4vhwdk/jnmx9shW3wZwr2iHRaonFY=;
 b=QnhlzBMg5+Coe7G6S5TFazIrdfmLCUUS8SWDRLkj5+DJ0hjlP0vF7/5r+GgTUB+4phB0ff
 shpcukX3JqrWvfXsubIUCcZVf6WMO2/A9w/3eOZsGby4qkAt4QUdjVJIMz4H6CXBQBhrT+
 nnMD2cgw8t7KaCmyK4UbbCqzlACsWJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-_fpExbnfPlq6xmL7Xth4wg-1; Wed, 20 Jan 2021 09:20:47 -0500
X-MC-Unique: _fpExbnfPlq6xmL7Xth4wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4561B835DE2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 14:20:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E33531A3D8;
 Wed, 20 Jan 2021 14:20:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74C95113865F; Wed, 20 Jan 2021 15:20:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 10/17] qapi/gen: Combine ._add_[user|system]_module
References: <20210119180242.1570753-1-jsnow@redhat.com>
 <20210119180242.1570753-11-jsnow@redhat.com>
Date: Wed, 20 Jan 2021 15:20:41 +0100
In-Reply-To: <20210119180242.1570753-11-jsnow@redhat.com> (John Snow's message
 of "Tue, 19 Jan 2021 13:02:35 -0500")
Message-ID: <87y2gnpu4m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> From: Markus Armbruster <armbru@redhat.com>
>
> QAPISchemaModularCVisitor attempts to encapsulate the way it splits
> the module name space between user modules (name can't start with
> './') and system modules (name is None or starts with './') by

Is this still accurate?

> providing separate ._add_user_module() and ._add_system_module(),
> where the latter prepends './' to names other than None.
>
> Not worthwhile.  Dumb down to a single ._add_module().
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/commands.py |  2 +-
>  scripts/qapi/events.py   |  2 +-
>  scripts/qapi/gen.py      | 20 +++++++-------------
>  3 files changed, 9 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index fc5fe27c472..49111663394 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -286,7 +286,7 @@ def _begin_user_module(self, name: str) -> None:
>                               types=types))
>  
>      def visit_end(self) -> None:
> -        self._add_system_module('./init', ' * QAPI Commands initialization')
> +        self._add_module('./init', ' * QAPI Commands initialization')
>          self._genh.add(mcgen('''
>  #include "qapi/qmp/dispatch.h"
>  
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index 26faa829898..079c666ec69 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -191,7 +191,7 @@ def _begin_user_module(self, name: str) -> None:
>                               types=types))
>  
>      def visit_end(self) -> None:
> -        self._add_system_module('./emit', ' * QAPI Events emission')
> +        self._add_module('./emit', ' * QAPI Events emission')
>          self._genc.preamble_add(mcgen('''
>  #include "qemu/osdep.h"
>  #include "%(prefix)sqapi-emit-events.h"
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 55acd7e080d..b5505685e6e 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -272,22 +272,15 @@ def _module_filename(self, what: str, name: str) -> str:
>                              self._module_basename(what, name))
>  
>      def _add_module(self, name: str, blurb: str) -> None:
> +        if QAPISchemaModule.is_user_module(name):
> +            if self._main_module is None:
> +                self._main_module = name
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
>          self._module[name] = (genc, genh)
>          self._genc, self._genh = self._module[name]
>  
> -    def _add_user_module(self, name: str, blurb: str) -> None:
> -        assert QAPISchemaModule.is_user_module(name)
> -        if self._main_module is None:
> -            self._main_module = name
> -        self._add_module(name, blurb)
> -
> -    def _add_system_module(self, name: str, blurb: str) -> None:
> -        assert QAPISchemaModule.is_system_module(name)
> -        self._add_module(name, blurb)
> -
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>          for name in self._module:
>              if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
> @@ -303,9 +296,9 @@ def _begin_user_module(self, name: str) -> None:
>          pass
>  
>      def visit_module(self, module: QAPISchemaModule) -> None:
> -        if module.system_module:
> +        if module.builtin_module:

Looks like you're fixing a slip-up in PATCH 06.  If yes, squash.  If no,
I'm confused.

>              if self._builtin_blurb:
> -                self._add_system_module(module.name, self._builtin_blurb)
> +                self._add_module(module.name, self._builtin_blurb)
>                  self._begin_builtin_module()
>              else:
>                  # The built-in module has not been created.  No code may
> @@ -313,7 +306,8 @@ def visit_module(self, module: QAPISchemaModule) -> None:
>                  self._genc = None
>                  self._genh = None
>          else:
> -            self._add_user_module(module.name, self._user_blurb)
> +            assert module.user_module, "Unexpected system module"

The string provides no value.

> +            self._add_module(module.name, self._user_blurb)
>              self._begin_user_module(module.name)
>  
>      def visit_include(self, name: str, info: QAPISourceInfo) -> None:


