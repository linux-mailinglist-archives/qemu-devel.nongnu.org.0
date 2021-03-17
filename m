Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4833EFC7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:49:30 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUg5-0005wd-AD
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMUfD-0005PH-5g
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMUf9-0007Sx-O7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615981710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ao9Rzi3KAol5qnb9F49xj1rBNe6HIVcD6HaSUcOHwh0=;
 b=dao0c7LJ92wcaSspVuldeJAdD1+WVMdJ6Mg8aNqdsvqbZgu6WbZTKrC/euftVIMcZtG01I
 Q/3feoqgS2b4rmbCaMPHgzI9dg5ozrzbXnugwzEPCRyXyRQ2yYPRVKu2Y880RH19mdmpEu
 2FPq0zDpxSTgZFwr6j3FPRi7tnhlafo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-sI3gEpZZNQaOTarrHook2Q-1; Wed, 17 Mar 2021 07:48:28 -0400
X-MC-Unique: sI3gEpZZNQaOTarrHook2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932421084CA4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 11:48:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-202.ams2.redhat.com [10.36.114.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4AA1017CF5;
 Wed, 17 Mar 2021 11:48:26 +0000 (UTC)
Date: Wed, 17 Mar 2021 12:48:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
Message-ID: <YFHsiQFjqbRqlN2w@merkur.fritz.box>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312173547.1283477-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.03.2021 um 18:35 hat Paolo Bonzini geschrieben:
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
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7..ae017de46c 100644
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
> @@ -1684,6 +1691,49 @@ static int machine_set_property(void *opaque,
>      return object_parse_property_opt(opaque, name, value, "type", errp);
>  }
>  
> +static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
> +{
> +    ObjectOption *opt, *next;
> +
> +    QTAILQ_FOREACH_SAFE(opt, &object_opts, next, next) {
> +        const char *type = ObjectType_str(opt->opts->qom_type);
> +        if (type_opt_predicate(type)) {
> +            user_creatable_add_qapi(opt->opts, &error_fatal);
> +            qapi_free_ObjectOptions(opt->opts);
> +            QTAILQ_REMOVE(&object_opts, opt, next);

I added a g_free(opt) here to fix CI failures (LeakSanitizer error).

> +        }
> +    }
> +}

Kevin


