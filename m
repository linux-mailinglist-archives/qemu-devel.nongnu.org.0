Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D473389FE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:24:29 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKey4-0005Lt-Kj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKesM-0005I7-NF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:18:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKesK-0003xe-2e
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615544309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxPW18QGEy0UdqiwyFcNaIc/LRdPkPSa1Akf2tzh58k=;
 b=fHJDkfqyzwsCWIRDWw8uiCoP6RvI6Rjofh0jfi8vvbW1sSDVh7Y4F5nfw9bUQNHEOMAhaN
 YClIrP3pEHw7zIZtswJBAaLt+bLJ/5aoKSRhOjnGxYYdCXqcLg16FmzZ6HC2F0Rqk+E8EB
 P120jbgKdUhtUU8nriGb1CPai+VddfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-8O-reVqiN0KKWgXIaVnuRw-1; Fri, 12 Mar 2021 05:18:27 -0500
X-MC-Unique: 8O-reVqiN0KKWgXIaVnuRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A6C100C61C
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:18:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F2662463;
 Fri, 12 Mar 2021 10:18:26 +0000 (UTC)
Date: Fri, 12 Mar 2021 11:18:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
Message-ID: <YEs/8NKaJpEp0bcn@merkur.fritz.box>
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311172459.990281-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.03.2021 um 18:24 hat Paolo Bonzini geschrieben:
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
>  static const char *cpu_option;
>  static const char *mem_path;
>  static const char *incoming;
>  static const char *loadvm;
> +static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
>  static ram_addr_t maxram_size;
>  static uint64_t ram_slots;
>  static int display_remote;
> @@ -1684,6 +1691,48 @@ static int machine_set_property(void *opaque,
>      return object_parse_property_opt(opaque, name, value, "type", errp);
>  }
>  
> +static void object_option_foreach_add(bool (*type_opt_predicate)(const char *), Error **errp)
> +{
> +    ObjectOption *opt, *next;
> +
> +    QTAILQ_FOREACH_SAFE(opt, &object_opts, next, next) {
> +        const char *type = ObjectType_str(opt->opts->qom_type);
> +        if (type_opt_predicate(type)) {
> +            if (!user_creatable_add_qapi(opt->opts, errp)) {
> +                return;

Technically, this leaks things, though all callers pass &error_fatal
anyway, so this branch is dead code.

Should we just drop the errp parameter and explicitly use &error_fatal
here?

> +            }
> +            qapi_free_ObjectOptions(opt->opts);
> +            QTAILQ_REMOVE(&object_opts, opt, next);
> +        }
> +    }
> +}
> +
> +static void object_option_parse(const char *optarg)
> +{
> +    ObjectOption *opt;
> +    QemuOpts *opts;
> +    const char *type;
> +    Visitor *v;
> +
> +    opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
> +                                   optarg, true);
> +    if (!opts) {
> +        exit(1);
> +    }
> +
> +    type = qemu_opt_get(opts, "qom-type");
> +    if (user_creatable_print_help(type, opts)) {

type needs a NULL check.

Before this patch:
$ build/qemu-system-x86_64 -object id=foo
qemu-system-x86_64: -object id=foo: Parameter 'qom-type' is missing

After the patch:
$ build/qemu-system-x86_64 -object id=foo
Segmentation fault (core dumped)

> +        exit(0);
> +    }
> +
> +    opt = g_new0(ObjectOption, 1);
> +    v = opts_visitor_new(opts);
> +    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
> +    visit_free(v);
> +
> +    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
> +}

Kevin


