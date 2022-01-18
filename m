Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F44921AE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:55:01 +0100 (CET)
Received: from localhost ([::1]:45418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kGa-00035S-Vk
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9k0Q-0007Bx-4v
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9k0M-00071p-4q
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642495092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cr/gxYLA/Hl/gw/7fgfjPMcS2rtMupOQVHJfZTgxaNQ=;
 b=TrKRkRLQ9IlUoR0ycmnIx/0CNhqf6JI9t8W/AHyw3OVnz/sL5T4h1qo6VbFPLDttdNa1oD
 JWFaNFuH9G7UUmZRteXRQmJmgfL6qSz+hzdzdw5S0ALwvgc0ADuV8G8CZSRDn30wfp5a+d
 mSmdjNtfh+O7BeUBTFpSQaPsd/Aplmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-z3C9sovpMkGx79vyGn65NQ-1; Tue, 18 Jan 2022 03:38:08 -0500
X-MC-Unique: z3C9sovpMkGx79vyGn65NQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2758874982;
 Tue, 18 Jan 2022 08:38:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFC6660C3E;
 Tue, 18 Jan 2022 08:38:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4DCD711380A2; Tue, 18 Jan 2022 09:38:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/3] scripts/qapi/gen.py: add .trace-events file for
 module
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
 <20220117201845.2438382-2-vsementsov@virtuozzo.com>
Date: Tue, 18 Jan 2022 09:38:05 +0100
In-Reply-To: <20220117201845.2438382-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 17 Jan 2022 21:18:43 +0100")
Message-ID: <87y23dphg2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are going to generate trace events for qmp commands. We should
> generate both trace events and trace-events.

What do you mean to say with the second sentence?  "trace events" == the
calls of generated trace_FOO(), and "trace-events" == the input file for
tracetool?

> For now, add .trace-events file object, to be filled in further commit.

What is a file object?  See below.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/gen.py | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 995a97d2b8..605b3fe68a 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -251,7 +251,7 @@ def __init__(self,
>          self._builtin_blurb = builtin_blurb
>          self._pydoc = pydoc
>          self._current_module: Optional[str] = None
> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] = {}
>          self._main_module: Optional[str] = None
>  
>      @property
> @@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
>  
> +    @property
> +    def _gent(self) -> QAPIGen:
> +        assert self._current_module is not None
> +        return self._module[self._current_module][2]
> +
>      @staticmethod
>      def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
> @@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
> -        self._module[name] = (genc, genh)
> +        gent = QAPIGen(basename + '.trace-events')

Aha.  You're adding an output module FOO.trace-events for schema module
FOO.

We commonly use a single trace-events per directory, but I believe your
choice of one per module is simpler for the QAPI generator, and just
fine for tracing.

Please add

   class QAPIGenTrace(QAPIGen):
   
       def _top(self, fname):
           return (QAPIGen._top(self, fname)
                   + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n')


> +        self._module[name] = (genc, genh, gent)
>          self._current_module = name
>  
>      @contextmanager
> @@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]:
>          self._current_module = old_module
>  
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
> -        for name, (genc, genh) in self._module.items():
> +        for name, (genc, genh, gent) in self._module.items():
>              if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>                  continue
>              genc.write(output_dir)
>              genh.write(output_dir)
> +            gent.write(output_dir)
>  
>      def _begin_builtin_module(self) -> None:
>          pass


