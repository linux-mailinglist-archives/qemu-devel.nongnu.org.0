Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040D337CD5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:44:12 +0100 (CET)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQI7-0004PT-C8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQD4-0000bv-2y
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQCx-0000od-VV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLNFxFIR5Ikcbt2h/kx0CvcnF5y2ntSNEd/HOl0I/OA=;
 b=dvjduVkhj/MOyTfIfO5weql4Uq+InDFVCHdL+cqBaysREucunwr9zK3xjH8hU0e/x2xMjA
 S9dAZHe183xiIGUrzghvv0xsIHOw6r1s+ia+G7NAUEBq6BZbF61Ofv8KzwX/PUFCgzUT6W
 MJenVpP53P39Kq/Y2veoxlz1187CFtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-3VG7Yc79OjubvI6N9lB4hg-1; Thu, 11 Mar 2021 13:38:49 -0500
X-MC-Unique: 3VG7Yc79OjubvI6N9lB4hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347B210866A3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:38:48 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D56AB5D742;
 Thu, 11 Mar 2021 18:38:47 +0000 (UTC)
Subject: Re: [PATCH 3/3] vl: allow passing JSON to -object
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-4-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1727bd5b-e065-3e1b-d8b8-9cdf4f68d4a7@redhat.com>
Date: Thu, 11 Mar 2021 12:38:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172459.990281-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 11:24 AM, Paolo Bonzini wrote:
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

Interesting note: the JSON form has no way to access help text.  But
that's not a show-stopper.

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

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


