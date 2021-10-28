Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D284F43DBAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 09:08:49 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfzWq-0004RB-FO
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 03:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzUm-0002lo-LN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:06:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzUg-0002Es-Cx
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635404793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4bIABG5OV7ejHSb3CKb1Fe7E0cX9w3D9zv8us/WLBY=;
 b=Tw424Z9Rs3kjNTNd5v/GheBJOOkWi18SXvfRDALJQeztyc1iUd0Gx52mHDikmhGpVsS7Zo
 NSYAUKI4RPzClkRq64P6TYH4sv8AWsGKHwpMrgflYGzeZLgEJFK7oS6AXXBHSwyFQB5wQv
 Q3MOzzs3YV7fgoTTdR8l+SX/igaO+4s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-Hn7LpguOOI2qFQmGDQT7EA-1; Thu, 28 Oct 2021 03:06:31 -0400
X-MC-Unique: Hn7LpguOOI2qFQmGDQT7EA-1
Received: by mail-wr1-f70.google.com with SMTP id
 i8-20020a5d6308000000b001742659b50eso1375057wru.23
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 00:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x4bIABG5OV7ejHSb3CKb1Fe7E0cX9w3D9zv8us/WLBY=;
 b=YtgMdkuZLg6GfiSs8H9f1Bgh0TBkziDKxALYkD8TALlhszUZFkY/dcf7T4Q0IdHoba
 HkK543n2S0w+iknqU/7jpkTgZ9SgCrv3rmsaV2yLCJVqC20xRl2fIvOuVj7J1J1jN8tB
 eilULh24rIT58SVqdy3wgaeJcPqthmA0SPDUIxL+YBD3xbNsmLHujaR8MmsGCUuSHlKX
 5fp5EanfR9LDleaKS7tdNB4Be7DBlSKeLp+PfnC+DmvqM2RcuQ7h9m7JLJrxC6emmp5o
 Q0MXn0jbcvmVWGpvjIBntZqckGy/2R15OM23I8oWpAUYwVibSjSTdBs1JjohzWuPuj11
 FQAg==
X-Gm-Message-State: AOAM530JiBEtou+w0rJrw/WZZB0ro2WJUJp+mvKvuu2tkKZnh+jncd+C
 kmtH7dOD2y50wRuuwDuWWnp5JJVavoTk7OwAqV0DM3mjzXQnRMWh++WGe7wBX/P66JpMrGuwnES
 UGYEUwfsquOein1w=
X-Received: by 2002:a1c:1941:: with SMTP id 62mr2481941wmz.131.1635404790543; 
 Thu, 28 Oct 2021 00:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgRki/OkfcPV19S2yc4doc8QsuXE6zAGooL6OM0E1nzopeVQwTUS8KIZ14mDDEyGEDsnFENg==
X-Received: by 2002:a1c:1941:: with SMTP id 62mr2481910wmz.131.1635404790364; 
 Thu, 28 Oct 2021 00:06:30 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b52.dip0.t-ipconnect.de. [79.242.59.82])
 by smtp.gmail.com with ESMTPSA id
 b18sm2429870wru.54.2021.10.28.00.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 00:06:30 -0700 (PDT)
Message-ID: <4b20e439-9329-79e2-5ff5-349198811db8@redhat.com>
Date: Thu, 28 Oct 2021 09:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 3/5] qom: object_child_foreach_recursive_type()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-4-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211028043129.38871-4-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 06:31, Peter Xu wrote:
> Add this sister helper besides object_child_foreach_recursive() to loop over
> child objects only if the object can be casted to a specific type.
> 
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/qom/object.h | 20 ++++++++++++++++++++
>  qom/object.c         | 27 +++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index faae0d841f..355277db40 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1926,6 +1926,26 @@ int object_child_foreach(Object *obj, int (*fn)(Object *child, void *opaque),
>  int object_child_foreach_recursive(Object *obj,
>                                     int (*fn)(Object *child, void *opaque),
>                                     void *opaque);
> +
> +/**
> + * object_child_foreach_recursive_type:
> + * @obj: the object whose children will be navigated
> + * @type: the typename string to scan
> + * @fn: the iterator function to be called
> + * @opaque: an opaque value that will be passed to the iterator
> + *
> + * This is a special version of object_child_foreach_recursive() so that we
> + * only call the fn() if the child can be casted to the @typename specified.
> + * Please refer to the comments above object_child_foreach_recursive() for
> + * more details.
> + *
> + * Returns: The last value returned by @fn, or 0 if there is no child.
> + */
> +int object_child_foreach_recursive_type(Object *obj,
> +                                        const char *typename,
> +                                        int (*fn)(Object *child, void *opaque),
> +                                        void *opaque);
> +
>  /**
>   * container_get:
>   * @root: root of the #path, e.g., object_get_root()
> diff --git a/qom/object.c b/qom/object.c
> index 6be710bc40..d25ca09b1d 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1134,6 +1134,33 @@ int object_child_foreach_recursive(Object *obj,
>      return do_object_child_foreach(obj, fn, opaque, true);
>  }
>  
> +typedef struct {
> +    const char *typename;
> +    int (*fn)(Object *child, void *opaque);
> +    void *opaque;
> +} ObjectTypeArgs;
> +
> +static int object_child_hook(Object *child, void *opaque)
> +{
> +    ObjectTypeArgs *args = opaque;
> +
> +    if (object_dynamic_cast(child, args->typename)) {
> +        return args->fn(child, args->opaque);
> +    }
> +
> +    return 0;
> +}
> +
> +int object_child_foreach_recursive_type(Object *obj,
> +                                        const char *typename,
> +                                        int (*fn)(Object *child, void *opaque),
> +                                        void *opaque)
> +{
> +    ObjectTypeArgs args = { .typename = typename, .fn = fn, .opaque = opaque };
> +
> +    return object_child_foreach_recursive(obj, object_child_hook, &args);
> +}
> +
>  static void object_class_get_list_tramp(ObjectClass *klass, void *opaque)
>  {
>      GSList **list = opaque;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


