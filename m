Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F25FED05
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:12:52 +0200 (CEST)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojIcU-0006nB-9a
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojIYv-00021b-C4
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojIYs-00066K-9A
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665745745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GK16KxKH/4R0damwu0r4Xq6FHv1nKkVWPiLe/yzOmZg=;
 b=GlINqIn08NGQ0SPc6jcWt1LyWhc4RudDCFdWF417xwvumlQntcSBRBHL1PAOGr/Wno8Ueu
 jguiCLq7vB/6oJ21E68RwOOKmT4svDm3MTwkW9CShf+QFesI9Cbs/TDwAardYWh/1sh+8I
 NlugAKTljmLvTIcFQY14Bh9hmrCeKdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-TNS9kt8jNQ2BPlI3iFvK1Q-1; Fri, 14 Oct 2022 07:09:02 -0400
X-MC-Unique: TNS9kt8jNQ2BPlI3iFvK1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC9CE185A7A3;
 Fri, 14 Oct 2022 11:08:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6444C85799;
 Fri, 14 Oct 2022 11:08:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D80921E691D; Fri, 14 Oct 2022 13:08:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  afaria@redhat.com,  qemu-block@nongnu.org
Subject: Re: [PATCH v2] qapi-gen: mark coroutine QMP command functions as
 coroutine_fn
References: <20221013095053.601937-1-pbonzini@redhat.com>
Date: Fri, 14 Oct 2022 13:08:49 +0200
In-Reply-To: <20221013095053.601937-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 13 Oct 2022 11:50:53 +0200")
Message-ID: <878rlislvi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Coroutine commands have to be declared as coroutine_fn, but the

Reminder, because I had to look this up...

A "coroutine command" is a command that has flag coroutine set, like so:

    { 'command': 'block_resize',
      'data': { '*device': 'str',
                '*node-name': 'str',
                'size': 'int' },
-->   'coroutine': true,
      'allow-preconfig': true }

This flag means "safe to run in coroutine context".

The QMP dispatcher runs in coroutine context (except for OOB commands,
but let's ignore those).  It executes coroutine commands directly, and
the others in a bottom half outside coroutine context.

See commit 04f22362f1 "qapi: Add a 'coroutine' flag for commands" and
commit 9ce44e2ce2 "qmp: Move dispatcher to a coroutine".

Only two coroutine commands exist so far.

> marker does not show up in the qapi-comands-* headers; likewise, the
> marshaling function calls the command and therefore must be coroutine_fn.
> Static analysis would want coroutine_fn to match between prototype and
> declaration, because in principle coroutines might be compiled to a
> completely different calling convention.  So we would like to add the
> marker to the header.
>
> Unfortunately, doing so causes lots of files to fail to compile because
> they do not include qemu/coroutine.h; which in principle is legitimate
> because the files could be only dealing with non-coroutine commands.
> There are three ways to deal with this:
>
> - include qemu/coroutine.h in all the files that include the qapi-commands-*
>   headers.  This would be a large change and in many case unnecessary,
>   because only very few files deal with coroutine commands
>
> - include qemu/coroutine.h from the headers themselves.  This is
>   ugly for the same reason, and also because headers-including-headers
>   make it harder to avoid world rebuilds

Headers should be self-contained, i.e. include everything they need to
compile (except for qemu/osdep.h, which the .c include first).  The
first way would violate this.

> - only define the affected prototypes if coroutine_fn is defined,
>   meaning that the .c file has already included qemu/coroutine.h.
>   This is what the patch goes for.

Why can't we include qemu/coroutine.h only when the header actually
needs it?  I.e. when it declares a coroutine command.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


