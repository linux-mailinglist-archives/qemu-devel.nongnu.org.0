Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D032F978
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:51:56 +0100 (CET)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUXM-000588-0m
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lIUVt-0004YE-JS
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lIUVp-0005Vz-QC
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615027819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1lluMk+w88sj+0G/J4g6WQ/5AH8NSllKZ8NDlAIg4k=;
 b=FC+h2qE2bg1kui7M1AaizSvitpro4k1ncFvAHg4D12ppnJChA13wioFOWl6SGjeqMNBuUI
 kBkiTDnLPxnKQeRiUTSF17NB6kK/afl5gBkFHptxuOTYJZ42+MEhscajperPBulqkUX8lV
 kzGur3sC+ItC48fKsBbh7WLwtD2QdBc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-ZQljk5H9PZec0UeGUyUciw-1; Sat, 06 Mar 2021 05:50:18 -0500
X-MC-Unique: ZQljk5H9PZec0UeGUyUciw-1
Received: by mail-wr1-f72.google.com with SMTP id h5so2342437wrr.17
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/1lluMk+w88sj+0G/J4g6WQ/5AH8NSllKZ8NDlAIg4k=;
 b=Ko0ld0VLce0GCQPFeVO6sMM5yacAVj7LIxWRot8hj5DRJce6XABdTb955X6gp4noDP
 Xi020edk2dFOXVbUAV3C73ePOEKYuz+9QsRUO9xgT7uoU0wMavdOEDZ8EW2lUBjaWksv
 CWH3VW+LvLfcfWPCBE8grdSn+1vp54xh85QbZtTc4cnWg4EKxQsXiCzFR4Au3TTdWCtq
 sxsnXy+DxAoxmOwspPoYQp7Gaj4R+ixx8VMg+hwq8EzEP9EKHQnBkM5kPm6HOZ0l2DoE
 UJIpy9qcvGf7emReC1nFf8CYd4sc2MNVFNaSbfMYVaGYfD+/uU6AGuzvDK04zPe7TmT0
 Ji4Q==
X-Gm-Message-State: AOAM533nc7oy9a6q4+J+VY5JteJonNEue6fZOSDhDOSa4zftU3n8RFJW
 eJ8OrZ1TijuKiS/2joZgP8Pn57pOTx17fqjTuPtU1VUE09ocpQhQcStbbazG50mlocnZGPgwm/l
 c7dCLhsMdF98wdvk=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr13001064wmi.132.1615027817021; 
 Sat, 06 Mar 2021 02:50:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDqCkA0zgTxs9aG6vzJbfCI4mNhtJXzpeB88ssWfzah2BRAloiq3Ln4mZONkiSjyqVKXDaRA==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr13001043wmi.132.1615027816804; 
 Sat, 06 Mar 2021 02:50:16 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id h20sm8016461wmp.38.2021.03.06.02.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 02:50:16 -0800 (PST)
Subject: Re: [PATCH] qom: Check for wellformed id in user_creatable_add_type()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210302171623.49709-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <deeee390-7c4b-6857-8ec2-6d19ca8c03a0@redhat.com>
Date: Sat, 6 Mar 2021 11:50:14 +0100
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com
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

It needs a check for id != NULL, but no big deal so I added it.

Thanks,

Paolo

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


