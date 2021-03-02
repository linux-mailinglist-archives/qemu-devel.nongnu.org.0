Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3CF32AA88
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:45:40 +0100 (CET)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAxg-0003Yk-24
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHAvz-0002aY-Si
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHAvu-0006e2-Hr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614714229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6tS3NiKE6E93wq4aZMzVt1Bo76hcDTdbdD0baxrlbA=;
 b=Fe4wtkylM8vaIco3s6oPOh0QLg+8PrXjslPQ53WPHINWxk4qRS0qoJ7sksqvp2wOATZpRg
 DVYmHSCw6qKxAn+oNtzKnoTcIAnf7OEqjz/rXuuES7AIomfpM5PS2XC2sxYUGw2ZWB5YCB
 R5gv2xnqSmOsLF/nZ0Z8A2V6tv9/whs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-Y-ndIit9N4Wss29-7XJB1g-1; Tue, 02 Mar 2021 14:43:47 -0500
X-MC-Unique: Y-ndIit9N4Wss29-7XJB1g-1
Received: by mail-wm1-f70.google.com with SMTP id n17so832625wmi.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 11:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6tS3NiKE6E93wq4aZMzVt1Bo76hcDTdbdD0baxrlbA=;
 b=YWNXY9GktCGlCEPJpkpaA3V8Rny0K9hAuP9H7eP4QNm+kkyOcsIJQjz5uof/bJI+p1
 fJVrWx9RBG6q6mPQeFipk16YH+b476X3Q+hG9i1HK2uPMmpC6qYBee2KX5BVZrBMbCqr
 xzBzvGuHEwlP7dYGx2akQ0zKYulUoLSDenlyjkV1nsBA9jw+qR9fvcf5pOW7MkarPewh
 RHmkxPFtnlwMPnLIKcpQN1H2q0VqeXaCPa1Lt17qd0mBrX5DNXqxhOuwjZxIcQimSf+z
 Lmzj/0zA9FoUUbrYF+3en1390BwQSd+LUmV091ADgUKk9aLBqAAHkGmXYk7gbviB0RcD
 QTMg==
X-Gm-Message-State: AOAM530932oi4rSnR42K/iyUODmWv1Lj/GSLKKkGFdlCHRzLQaGFAmNd
 cEp77zw5JslRRKopWR7Y0B0xXxutEtnnk2nkatGqCU8PBSdRugfPaNw2DD23PxjYQ4w+AtlWJeV
 tlluTPe0OHnsBfqI=
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr5618978wmf.180.1614714226858; 
 Tue, 02 Mar 2021 11:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFn24Vo86h6UNiGfpRifGjAYQAsstZmjnR3LKpw+S+JE9KEImzmOR9YuI0YclZkjJCAvXBZw==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr5618960wmf.180.1614714226489; 
 Tue, 02 Mar 2021 11:43:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m132sm3569821wmf.45.2021.03.02.11.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 11:43:45 -0800 (PST)
Subject: Re: [PATCH] qom: Check for wellformed id in user_creatable_add_type()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210302171623.49709-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d4ef7671-4830-ff2a-5c4f-f54d692d75d4@redhat.com>
Date: Tue, 2 Mar 2021 20:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302171623.49709-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: berrange@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 18:16, Kevin Wolf wrote:
> Most code paths for creating a user creatable object go through
> QemuOpts, which ensures that the provided 'id' option is actually a
> valid identifier.
> 
> However, there are some code paths that don't go through QemuOpts:
> qemu-storage-daemon --object (since commit 8db1efd3) and QMP object-add
> (since it was first introduced in commit cff8b2c6). We need to have the
> same validity check for those, too.
> 
> This adds the check and makes it print the same error message as
> QemuOpts on failure.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> This makes sense even without the -object QAPIfication, so no reason to
> wait for v3 of that series to get this fixed.
> 
>   qom/object_interfaces.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 1e9ad6f08a..515ca4557e 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -8,6 +8,7 @@
>   #include "qapi/qobject-input-visitor.h"
>   #include "qom/object_interfaces.h"
>   #include "qemu/help_option.h"
> +#include "qemu/id.h"
>   #include "qemu/module.h"
>   #include "qemu/option.h"
>   #include "qapi/opts-visitor.h"
> @@ -41,11 +42,19 @@ Object *user_creatable_add_type(const char *type, const char *id,
>                                   const QDict *qdict,
>                                   Visitor *v, Error **errp)
>   {
> +    ERRP_GUARD();
>       Object *obj;
>       ObjectClass *klass;
>       const QDictEntry *e;
>       Error *local_err = NULL;
>   
> +    if (!id_wellformed(id)) {
> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
> +        error_append_hint(errp, "Identifiers consist of letters, digits, "
> +                          "'-', '.', '_', starting with a letter.\n");
> +        return NULL;
> +    }
> +
>       klass = object_class_by_name(type);
>       if (!klass) {
>           error_setg(errp, "invalid object type: %s", type);
> 

Queued, thanks.

Paolo


