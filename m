Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5A49CC48
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:25:58 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjFF-0000rK-Dt
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:25:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCitf-0003ts-SX
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCitc-0003fI-9c
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643205814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgYDXbiJ/o8vtuJKE9NisqitBO4y11bVa+NfDqF8Rsg=;
 b=ABlJzRB+vFg/3I251adlpP1QFKf3+b8yWSMOokCicSboCUOiRiUPQZJuDmogOQWS4wpyax
 eu4479ChsqaMmQi/k3E5nNLN5lUrrDJg4cFXU6D4soJcilNT4ethr+TCDWpB4UaaM9bJbI
 HCrQ/ws8SI7HAo1cFg0WgOSQ0mEyXiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-JA2Jo8bgNZyFg3N9dX2VhQ-1; Wed, 26 Jan 2022 09:03:33 -0500
X-MC-Unique: JA2Jo8bgNZyFg3N9dX2VhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0478F190B2A0;
 Wed, 26 Jan 2022 14:03:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C2922E10;
 Wed, 26 Jan 2022 14:03:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1CD9113864A; Wed, 26 Jan 2022 15:03:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 1/7] scripts/qapi/gen.py: add FOO.trace-events output
 module
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-2-vsementsov@virtuozzo.com>
Date: Wed, 26 Jan 2022 15:03:05 +0100
In-Reply-To: <20220125215655.3111881-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Jan 2022 22:56:49 +0100")
Message-ID: <87pmoetx0m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's tweak the title to more closely match existing commits:

    qapi/gen: Add FOO.trace-events output module

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are going to generate trace events for QMP commands. We should
> generate both trace_*() function calls and trace-events files listing
> events for trace generator.
>
> So, add an output module FOO.trace-events for each FOO schema module.
>
> Since we're going to add trace events only to command marshallers,
> make the trace-events output optional, so we don't generate so many
> useless empty files.
>
> Currently nobody set add_trace_events to True, so new functionality is
> disabled. It will be enabled for QAPISchemaGenCommandVisitor
> in a further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/gen.py | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 995a97d2b8..a41a2c1d55 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -192,6 +192,11 @@ def _bottom(self) -> str:
>          return guardend(self.fname)
>  
>  
> +class QAPIGenTrace(QAPIGen):
> +    def _top(self) -> str:
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
> +                 gen_trace_events: bool = False):

Let's rename to @gen_trace for consistency with PATCH 3's --gen-trace.

Hmm, PATCH 7 replaces it by --no-trace-events.  I'm going to suggest
--suppress-tracing there.  @gen_tracing?

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
> +        self._gen_trace_events = gen_trace_events
>  
>      @property
>      def _genc(self) -> QAPIGenC:
> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
>  
> +    @property
> +    def _gent(self) -> QAPIGenTrace:
> +        assert self._gen_trace_events
> +        assert self._current_module is not None
> +        gent = self._module[self._current_module][2]
> +        assert gent is not None
> +        return gent
> +
>      @staticmethod
>      def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
> @@ -293,7 +309,14 @@ def _add_module(self, name: str, blurb: str) -> None:
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
> -        self._module[name] = (genc, genh)
> +
> +        gent: Optional[QAPIGenTrace]
> +        if self._gen_trace_events:
> +            gent = QAPIGenTrace(basename + '.trace-events')
> +        else:
> +            gent = None

A bit more compact:

           gent: Optional[QAPIGenTrace] = None
           if self._gen_trace_events:
               gent = QAPIGenTrace(basename + '.trace-events')

> +
> +        self._module[name] = (genc, genh, gent)
>          self._current_module = name
>  
>      @contextmanager
> @@ -304,11 +327,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
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


