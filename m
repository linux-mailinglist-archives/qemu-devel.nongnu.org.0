Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCE337CFC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:56:29 +0100 (CET)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQU0-0000HT-Kx
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQBP-0007Cr-Gp
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQBN-0008MH-Ph
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zM/9fraMj8OnaYBGOntlbrGYD8QDbcBNpdB2+s+G9zc=;
 b=BYxCzYhHv5DC865/CiLEie7l9JSjv/nOpz3UaDp9TQF65kRx7+Tpt+LgmEuMm1eRTZA5dk
 ioole2p3hTI7vkVJPoT0Z9UeuO5rzxtVLJFgr0ApbDckDqdQQke0s1X+LXchGoOpxhe9AG
 nKuN4B7pIZBmXhwysHvV7V5I9GDuFag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-TFW_PYEhPBaMil4rnfBfcw-1; Thu, 11 Mar 2021 13:37:11 -0500
X-MC-Unique: TFW_PYEhPBaMil4rnfBfcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE8A6100C66F
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 18:37:09 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DDB460853;
 Thu, 11 Mar 2021 18:37:09 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
Message-ID: <d99739a6-93e1-1d44-653a-d9ff8f3ae677@redhat.com>
Date: Thu, 11 Mar 2021 12:37:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172459.990281-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> ---
>  include/qom/object_interfaces.h | 50 ++--------------------
>  qom/object_interfaces.c         | 57 +------------------------
>  softmmu/vl.c                    | 73 +++++++++++++++++++++++++--------
>  3 files changed, 60 insertions(+), 120 deletions(-)
> 

> @@ -1684,6 +1691,48 @@ static int machine_set_property(void *opaque,
>      return object_parse_property_opt(opaque, name, value, "type", errp);
>  }
>  
> +static void object_option_foreach_add(bool (*type_opt_predicate)(const char *), Error **errp)

Should this return a bool...

> +{
> +    ObjectOption *opt, *next;
> +
> +    QTAILQ_FOREACH_SAFE(opt, &object_opts, next, next) {
> +        const char *type = ObjectType_str(opt->opts->qom_type);
> +        if (type_opt_predicate(type)) {
> +            if (!user_creatable_add_qapi(opt->opts, errp)) {
> +                return;

with return false here,

> +            }
> +            qapi_free_ObjectOptions(opt->opts);
> +            QTAILQ_REMOVE(&object_opts, opt, next);
> +        }
> +    }

and true here, to make it easier for callers to detect failure without
having to inspect errp?

> +}
> +
> +static void object_option_parse(const char *optarg)

> @@ -1815,9 +1860,7 @@ static void qemu_create_early_backends(void)
>          exit(1);
>      }
>  
> -    qemu_opts_foreach(qemu_find_opts("object"),
> -                      user_creatable_add_opts_foreach,
> -                      object_create_early, &error_fatal);
> +    object_option_foreach_add(object_create_early, &error_fatal);

Then again, since the only callers pass error_fatal, we never reach the
early return.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


