Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42A339D67
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:42:41 +0100 (CET)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0nA-0004Hh-Du
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL0lw-0003m8-4U
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lL0lu-0003BO-Dt
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615628481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnhlIRJxhgmcNwmoOko1ExoAxR9t9mJ8B5xbEzvzerM=;
 b=AoRBfEjaGD7Un4/1W5zehOpl2VUmy3722JTvpdkLMpr0yCQ7pVCQjlpGMO6vg5z6ubXC2A
 KCJ2UiplLJM3HvHONDXb8gqYYglE9zb/Gl9nKs2P0O71k0c2BOHlU9Ls9wwGzbrOOJ64+e
 JZ8WLALfYFIYPMmH0Bfjw2avfttBbno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-iwsBXTHDNwCI_p8RmxDQ1w-1; Sat, 13 Mar 2021 04:41:19 -0500
X-MC-Unique: iwsBXTHDNwCI_p8RmxDQ1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3CEA100C61A
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:41:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F735C3E4;
 Sat, 13 Mar 2021 09:41:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2ED661132C12; Sat, 13 Mar 2021 10:41:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] vl: allow passing JSON to -object
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-4-pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 10:41:17 +0100
In-Reply-To: <20210311172459.990281-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 11 Mar 2021 12:24:59 -0500")
Message-ID: <878s6rwfuq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> Extend the ObjectOption code that was added in the previous patch to
> enable passing JSON to -object.  Even though we cannot yet add
> non-scalar properties with the human-friendly comma-separated syntax,
> they can now be added as JSON.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b245e912e5..7b07f19de7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -31,6 +31,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qjson.h"
>  #include "qemu-version.h"
>  #include "qemu/cutils.h"
>  #include "qemu/help_option.h"
> @@ -1714,19 +1715,27 @@ static void object_option_parse(const char *optarg)
>      const char *type;
>      Visitor *v;
>  
> -    opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
> -                                   optarg, true);
> -    if (!opts) {
> -        exit(1);
> -    }
> +    if (optarg[0] == '{') {
> +        QObject *obj = qobject_from_json(optarg, &error_fatal);
>  
> -    type = qemu_opt_get(opts, "qom-type");
> -    if (user_creatable_print_help(type, opts)) {
> -        exit(0);
> +        v = qobject_input_visitor_new(obj);
> +        qobject_unref(obj);
> +    } else {
> +        opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
> +                                       optarg, true);
> +        if (!opts) {
> +            exit(1);
> +        }
> +
> +        type = qemu_opt_get(opts, "qom-type");
> +        if (user_creatable_print_help(type, opts)) {
> +            exit(0);
> +        }
> +
> +        v = opts_visitor_new(opts);
>      }
>  
>      opt = g_new0(ObjectOption, 1);
> -    v = opts_visitor_new(opts);
>      visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
>      visit_free(v);

Best viewed with whitespace change ignored:

   commit d13ba69a7cf33f583a22c28644c28928b120aff0
   Author: Paolo Bonzini <pbonzini@redhat.com>
   Date:   Thu Mar 11 12:24:59 2021 -0500

       vl: allow passing JSON to -object

       Extend the ObjectOption code that was added in the previous patch to
       enable passing JSON to -object.  Even though we cannot yet add
       non-scalar properties with the human-friendly comma-separated syntax,
       they can now be added as JSON.

       Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
       Message-Id: <20210311172459.990281-4-pbonzini@redhat.com>

   diff --git a/softmmu/vl.c b/softmmu/vl.c
   index b245e912e5..7b07f19de7 100644
   --- a/softmmu/vl.c
   +++ b/softmmu/vl.c
   @@ -31,6 +31,7 @@
    #include "hw/qdev-properties.h"
    #include "qapi/error.h"
    #include "qapi/qmp/qdict.h"
   +#include "qapi/qmp/qjson.h"
    #include "qemu-version.h"
    #include "qemu/cutils.h"
    #include "qemu/help_option.h"
   @@ -1714,6 +1715,12 @@ static void object_option_parse(const char *optarg)
        const char *type;
        Visitor *v;

   +    if (optarg[0] == '{') {
   +        QObject *obj = qobject_from_json(optarg, &error_fatal);
   +
   +        v = qobject_input_visitor_new(obj);
   +        qobject_unref(obj);
   +    } else {
            opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
                                           optarg, true);
            if (!opts) {
   @@ -1725,8 +1732,10 @@ static void object_option_parse(const char *optarg)
                exit(0);
            }

   -    opt = g_new0(ObjectOption, 1);
            v = opts_visitor_new(opts);
   +    }
   +
   +    opt = g_new0(ObjectOption, 1);
        visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
        visit_free(v);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


