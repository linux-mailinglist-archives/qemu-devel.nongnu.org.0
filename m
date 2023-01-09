Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8A662778
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsCW-0000aE-0E; Mon, 09 Jan 2023 08:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pEsCN-0000ZN-0a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:28:23 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pEsCK-000876-PZ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:28:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 736944414;
 Mon,  9 Jan 2023 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673270899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0FzxJXbPL1zfzz/YerwWCTRmGEkHPkMlM2jNBC9kRg=;
 b=vfsL6VpmSvXh9Cy26Ad75l2WlWltJ2FpciD4oPjL5An6xjD/3M6haJ5zqtLo2ctemly2LG
 Msb8njcH07UZbEjpfXUHgpG0L870IzFFaZ0P2rx6KMDCv9/UKzuJstTQeEn9cI66TjudJn
 kNoHJeipOEqwgqd3mc1Kqx+OPO8jmnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673270899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0FzxJXbPL1zfzz/YerwWCTRmGEkHPkMlM2jNBC9kRg=;
 b=LJmYIOd4UNeogOm2SULdhDcw9RSoQ3xWaINQlJPmJGQlX73lXRXAmbrmu0XsXM9Ep6e+tf
 +LEO0kki73HrjlCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38F90134AD;
 Mon,  9 Jan 2023 13:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6xRLDHMWvGOvDAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 09 Jan 2023 13:28:19 +0000
Message-ID: <e0e82b95-0f0a-58d2-cc22-13f2ee4acc52@suse.de>
Date: Mon, 9 Jan 2023 14:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2] qom: Extract object_try_new() from qdev_new()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230109113158.1500-1-philmd@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230109113158.1500-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,

On 1/9/23 12:31, Philippe Mathieu-Daudé wrote:
> The module resolving in qdev_new() is specific to QOM, not to
> QDev. Extract the code as a new QOM object_try_new() helper so
> it can be reused by non-QDev code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC because I'm wonder if we can't find a better name...
> 
> Also, should we refactor object_initialize() similarly,
> having object_try_initialize(..., Error *)?
> ---
>  hw/core/qdev.c       | 23 ++---------------------
>  include/qom/object.h | 12 ++++++++++++
>  qom/object.c         | 25 ++++++++++++++++++++++++-
>  3 files changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index d759c4602c..3a076dcc7f 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -147,31 +147,12 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>  
>  DeviceState *qdev_new(const char *name)
>  {
> -    ObjectClass *oc = object_class_by_name(name);
> -#ifdef CONFIG_MODULES
> -    if (!oc) {
> -        int rv = module_load_qom(name, &error_fatal);
> -        if (rv > 0) {
> -            oc = object_class_by_name(name);
> -        } else {
> -            error_report("could not find a module for type '%s'", name);
> -            exit(1);
> -        }
> -    }
> -#endif
> -    if (!oc) {
> -        error_report("unknown type '%s'", name);
> -        abort();
> -    }
> -    return DEVICE(object_new(name));
> +    return DEVICE(object_try_new(name, &error_fatal));

for clarity, why this last line change?

The new object_new() implementation does exactly this, ie: {
   return object_try_new(typename, &error_fatal);
}

and from a reader perspective, when calling qdev_new() - as opposed to qdev_try_new() - 
we want the object to be created, there is no "try".

It is not a functional thing, just something that would seem clearer to me.


>  }
>  
>  DeviceState *qdev_try_new(const char *name)
>  {
> -    if (!module_object_class_by_name(name)) {
> -        return NULL;
> -    }
> -    return DEVICE(object_new(name));
> +    return DEVICE(object_try_new(name, NULL));
>  }

Ok. Here it make sense for me to see "try_new", as we are trying to create a qdev.

>  
>  static QTAILQ_HEAD(, DeviceListener) device_listeners
> diff --git a/include/qom/object.h b/include/qom/object.h
> index ef7258a5e1..27059cafb7 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -565,6 +565,18 @@ Object *object_new_with_class(ObjectClass *klass);
>   */
>  Object *object_new(const char *typename);
>  
> +/**
> + * object_try_new: Try to create an object on the heap
> + * @typename: The name of the type of the object to instantiate.
> + * @errp: pointer to Error object.
> + *
> + * This is like object_new(), except it returns %NULL when type @typename
> + * does not exist, rather than asserting.
> + *
> + * Returns: The newly allocated and instantiated object, or %NULL.

Does it make sense to warn or document that in order to make any error fatal,
those special values can be passed? I know it is documented in include/qapi/error.h in pages of text,

but from reading this function alone, one would think that try_new is never fatal, which in some way
is true, but also isn't..

When is the actual error propagation and check for the special value error_fatal and error_abort happening?
Is it worthwhile documenting it here, especially for someone investigating the use of qdev_new() ?


> + */
> +Object *object_try_new(const char *typename, Error **errp);
> +
>  /**
>   * object_new_with_props:
>   * @typename:  The name of the type of the object to instantiate.
> diff --git a/qom/object.c b/qom/object.c
> index e25f1e96db..13070393ef 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -747,14 +747,37 @@ Object *object_new_with_class(ObjectClass *klass)
>      return object_new_with_type(klass->type);
>  }
>  
> -Object *object_new(const char *typename)
> +
> +Object *object_try_new(const char *typename, Error **errp)
>  {
>      TypeImpl *ti = type_get_by_name(typename);
>  
> +#ifdef CONFIG_MODULES
> +    if (!ti) {
> +        int rv = module_load_qom(typename, errp);
> +        if (rv) {
> +            error_prepend(errp, "could not find a module for type '%s': ",
> +                          typename);
> +            return NULL;
> +        }
> +        ti = type_get_by_name(typename);
> +    }
> +#endif
> +    if (!ti) {
> +        error_setg(errp, "unknown type '%s'", typename);
> +        return NULL;
> +    }
> +
>      return object_new_with_type(ti);
>  }
>  
>  
> +Object *object_new(const char *typename)
> +{
> +    return object_try_new(typename, &error_fatal);
> +}
> +
> +
>  Object *object_new_with_props(const char *typename,
>                                Object *parent,
>                                const char *id,


