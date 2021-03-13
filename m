Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86269339D78
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:59:33 +0100 (CET)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL13U-000081-JG
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL11l-0007c9-ED
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL11i-0004Kd-9E
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615629460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MK3iTDkSGQgZw6ytFKxl257evWIqXVexrbS4igeknus=;
 b=hY074piwbmYoBPE+DuuwGtxGcSyFNnN7mq5EUAhzoLFzx7npoMQ8eZwCnShMt3nV0K+jMn
 TMq+qlADxyI7syTZ8+slm5EVQlZc2URSEuz4GwG3fOnZenfs3oremDRS2/8vb0XN35ulTu
 Nx3o2ehlQnbp3Ysk1PYCU1PeuiGFVFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-aaLRfpChOeGv4UgctLpbrg-1; Sat, 13 Mar 2021 04:57:37 -0500
X-MC-Unique: aaLRfpChOeGv4UgctLpbrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A69A1846098
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:57:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FD661F59;
 Sat, 13 Mar 2021 09:57:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 571F91132C12; Sat, 13 Mar 2021 10:57:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 10:57:35 +0100
In-Reply-To: <20210311172459.990281-3-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 11 Mar 2021 12:24:58 -0500")
Message-ID: <87im5vv0j4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One more little thing...

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
> not needed anywhere else, and makes it go through user_creatable_add_qapi.
>
> In order to minimize code changes, the predicate still takes a string.
> This can be changed later to use the ObjectType QAPI enum directly.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[...]
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

The names feel awkward.

ObjectOption represents a -object option.  Fair enough.

ObjectOptions represents the "options" in its option argument.

Confusing.  Calling the whole thing and one of its parts the same is a
bad idea.

I never liked calling the key=value things in option arguments
"options".  They aren't CLI options, they are optional CLI option
parameters.

I also don't like calling so many different things "object" (QObject,
Object, ObjectOption, ObjectOptions), but that feels out of scope here.

Can we please rename ObjectOptions?

A naming convention for CLI option argument types and boxed QMP command
argument types would be nice.

[...]


