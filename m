Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E848B212B94
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:51:40 +0200 (CEST)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3N6-0001WO-02
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr3F2-00039w-Sv
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:43:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39827
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr3F0-0000NH-O2
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593711797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tz+HekEY3idcB3CO8nMFKcYSvrcKTNjh//fdxg+qoRQ=;
 b=TAIrsQyB8Z2ot935XUzL8FDTj8CetfK1mJFrHAX1r0J5aUSguCqgbsFse0VoPzolnrtLL8
 WkKUhb/ujYYmgnObyxLRyFvGTKVhAfFgW7i7TUDlYll2cMRJgjF+iik6wJ7hFHNhWIG7w7
 r5GPOEmZ/sLvxVryu77sRZ9jt5B320E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-AhHgDpMLPimiPdyw1ATMOw-1; Thu, 02 Jul 2020 13:43:14 -0400
X-MC-Unique: AhHgDpMLPimiPdyw1ATMOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8344B804001;
 Thu,  2 Jul 2020 17:43:13 +0000 (UTC)
Received: from [10.3.112.202] (ovpn-112-202.phx2.redhat.com [10.3.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9A973FEA;
 Thu,  2 Jul 2020 17:43:12 +0000 (UTC)
Subject: Re: [PATCH v2 33/44] error: Avoid unnecessary error_propagate() after
 error_setg()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-34-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <78109b04-cc8f-8265-477c-f240bc16e346@redhat.com>
Date: Thu, 2 Jul 2020 12:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702155000.3455325-34-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/20 10:49 AM, Markus Armbruster wrote:
> Replace
> 
>      error_setg(&err, ...);
>      error_propagate(errp, err);
> 
> by
> 
>      error_setg(errp, ...);
> 

> 
> Candidates for conversion tracked down with this Coccinelle script:
> 
>      @@
>      identifier err, errp;
>      expression list args;
>      @@
>      -    error_setg(&err, args);
>      +    error_setg(errp, args);
> 	 ... when != err
> 	 error_propagate(errp, err);
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/backends/cryptodev.c
> @@ -158,16 +158,15 @@ cryptodev_backend_set_queues(Object *obj, Visitor *v, const char *name,
>       uint32_t value;
>   
>       if (!visit_type_uint32(v, name, &value, &local_err)) {
> -        goto out;
> +        error_propagate(errp, local_err);
> +        return;
>       }

Looks like this error_propgate is spurious if you just use
  if (!visit_type_uint32(..., errp)) {

Oh - that's not the pattern you flagged, and a later patch then 
addresses it.  It might help if the commit message for this patch 
mentions that further cleanups are still forthcoming.


> +++ b/backends/hostmem-file.c
> @@ -114,18 +114,16 @@ static void file_memory_backend_set_align(Object *o, Visitor *v,
>       uint64_t val;
>   
>       if (host_memory_backend_mr_inited(backend)) {
> -        error_setg(&local_err, "cannot change property '%s' of %s",
> -                   name, object_get_typename(o));
> -        goto out;
> +        error_setg(errp, "cannot change property '%s' of %s", name,
> +                   object_get_typename(o));
> +        return;
>       }
>   
>       if (!visit_type_size(v, name, &val, &local_err)) {
> -        goto out;
> +        error_propagate(errp, local_err);
> +        return;
>       }

Another case where the first 'if' matches the subject of this patch, and 
the second 'if' can avoid local_err but that the change will be done in 
a later patch.  And several more later on, but this is how far it took 
me to realize that you intentionally saved them for later.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


