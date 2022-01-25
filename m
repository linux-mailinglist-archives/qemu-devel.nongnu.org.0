Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB3349AF5B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:11:44 +0100 (CET)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHrZ-0005W6-PG
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCHnn-000324-6G
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCHnj-0001Iu-T5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643101663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zBaTer/6ca8r+OeW+KCpMn8mxNFug+dm216Q8X94cEo=;
 b=MEm+mLnWpnTJ1t0vdo2y78p+ONN9w5xrPHIeNL6V1JmQWvliaFopd7hFTrQwpNINK0J0cj
 Y0cS7OaT2a4t8E7104PgBy8WTOjsC12F6HkDbxbHzFiuGckrtZ9SSf15JDF3Ndt21E0p26
 gR4jnQs3ZGy36ILlGcKjxry96r3/4Rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-ZVN-nCTrNbynXdO9l1y-1A-1; Tue, 25 Jan 2022 04:07:39 -0500
X-MC-Unique: ZVN-nCTrNbynXdO9l1y-1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 945361091DA5;
 Tue, 25 Jan 2022 09:07:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ACD510589DC;
 Tue, 25 Jan 2022 09:07:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE7DC1138640; Tue, 25 Jan 2022 10:07:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 1/3] scripts/qapi/gen.py: add FOO.trace-events output
 module
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-2-vsementsov@virtuozzo.com>
Date: Tue, 25 Jan 2022 10:07:21 +0100
In-Reply-To: <20220121162234.2707906-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 21 Jan 2022 17:22:32 +0100")
Message-ID: <87sftc420m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are going to generate trace events for qmp commands. We should

QMP

> generate both trace_*() function calls and trace-events files listing
> events for trace generator.
>
> So, add an output module FOO.trace-events for each FOO schema module.
>
> Still, we'll need these .trace-events files only for
> QAPISchemaGenCommandVisitor successor of QAPISchemaModularCVisitor.
> So, make this possibility optional, to avoid generating extra empty
> files for all other successors of QAPISchemaModularCVisitor.

Suggest to make this slightly less technical for easier reading:

  Since we're going to add trace events only to command marshallers,
  make the trace-events output optional, so we don't generate so many
  useless empty files.

> We can't simply add the new feature directly to
> QAPISchemaGenCommandVisitor: this means we'll have to reimplement
> a kind of ._module / .write() functionality of parent class in the
> successor, which seems worse than extending base class functionality.

Do you mean something like

  The alternative would be adding the the new feature directly to
  QAPISchemaGenCommandVisitor, but then we'd have to reimplement the
  ._module / .write() functionality of its parent class
  QAPISchemaModularCVisitor, which seems worse than extending the parent
  class.

?

If yes: I'm not sure about "worse".  But keeping it in the parent class
feels right to me anyway, as trace events could be useful in other child
classes, too.

> Currently nobody set add_trace_events to True, so new functionality is
> formally disabled. It will be enabled for QAPISchemaGenCommandVisitor

Drop "formally".

> in further commit.

"in a further commit", or "in the next commit".

>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 995a97d2b8..def52f021e 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -192,6 +192,11 @@ def _bottom(self) -> str:
>          return guardend(self.fname)
>  
>  
> +class QAPIGenTrace(QAPIGen):
> +    def _top(self):
> +        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
> +
> +
>  @contextmanager
>  def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
>      """
> @@ -244,15 +249,18 @@ def __init__(self,
>                   what: str,
>                   user_blurb: str,
>                   builtin_blurb: Optional[str],
> -                 pydoc: str):
> +                 pydoc: str,
> +                 add_trace_events: bool = False):

I'd prefer naming this gen_trace_events.  Happy to tweak this in my tree.

>          self._prefix = prefix
>          self._what = what
>          self._user_blurb = user_blurb
>          self._builtin_blurb = builtin_blurb
>          self._pydoc = pydoc
>          self._current_module: Optional[str] = None
> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
> +                                      Optional[QAPIGenTrace]]] = {}
>          self._main_module: Optional[str] = None
> +        self.add_trace_events = add_trace_events

By convention, names of private attributes start with a single _.

>  
>      @property
>      def _genc(self) -> QAPIGenC:
> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
>  
> +    @property
> +    def _gent(self) -> QAPIGenTrace:
> +        assert self.add_trace_events
> +        assert self._current_module is not None
> +        gent = self._module[self._current_module][2]
> +        assert gent is not None
> +        return gent
> +
>      @staticmethod
>      def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
> @@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
> -        self._module[name] = (genc, genh)
> +        if self.add_trace_events:
> +            gent = QAPIGenTrace(basename + '.trace-events')
> +        else:
> +            gent = None
> +
> +        self._module[name] = (genc, genh, gent)
>          self._current_module = name
>  
>      @contextmanager
> @@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
>          self._current_module = old_module
>  
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
> -        for name, (genc, genh) in self._module.items():
> +        for name, (genc, genh, gent) in self._module.items():
>              if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>                  continue
>              genc.write(output_dir)
>              genh.write(output_dir)
> +            if gent is not None:
> +                gent.write(output_dir)
>  
>      def _begin_builtin_module(self) -> None:
>          pass

I wonder whether we really need a new __init__() parameter.  Could we
have ._gent() create the module on demand?  This is *not* a demand.


