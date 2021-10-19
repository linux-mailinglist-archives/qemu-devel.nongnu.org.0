Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA21433354
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:14:58 +0200 (CEST)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcm93-0004Pe-O2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcm7b-0002UG-WE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcm7Q-0007AJ-An
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyFzS/UsWSbhrnKX1t7oaXRicHAQQPfiXlVZ3LXkEwE=;
 b=HewD5j6mviAwhAI8fh56sw2b6B2E1cDg9LZSE2cxIGQmnw4/XBis1jcWGzgw8CVm1MDpyM
 g7wGB0zP+g8kPEPTedq7beCELWNUTk0hB7LwIsSEdDYj9M+dA8Pkf7yIgSY+YnY3yO1wif
 uta9gItBfpz2SfwrAYFWqr0VQMsdH2I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-CAYtZ9VsP--VJjtdX6wYrg-1; Tue, 19 Oct 2021 06:13:11 -0400
X-MC-Unique: CAYtZ9VsP--VJjtdX6wYrg-1
Received: by mail-ed1-f70.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so10447809edj.21
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oyFzS/UsWSbhrnKX1t7oaXRicHAQQPfiXlVZ3LXkEwE=;
 b=JSGIS7ZwLgvEss5Ddiwjxh5MhkakhjRUpebeYqGdZlfUSovpF2ZnaKcr3c4lxUndRH
 sz9r5fXx2R4wUfwrHAqIDENFA5VWdGJbyM+mTxj4SXPktsxcTqIibnZeLjo+nOs9zOhs
 7Jvh8rk2G5TBE8aquN8GUmsGB6qphTSje4uBLSy5TdaKlVBsR2f7j42UytDNyK3Ualyo
 2ymNEIuirAEGocr+MOS+S5v/HUhJi/UggxpWtaSmmdGbwcZVXOovwhi9mJ5EJ7dCCW4C
 vDI/DGZF8x/eyeZZWGw4VOmN95dYosSLYzyWE8DKyIwYYjFkmVwA3ypcvAY2O0w9vVU+
 41rg==
X-Gm-Message-State: AOAM533bVYjhaoUh2lPLB2mYtzlSKEUfoSURiZWBc5g38DUu9DDDv4Xn
 7DR8TQApS2GDOO7HUOwkCx0Sx+cjcayFq5SFwKEOXoBTEXWAgn3++ZRNikoDdsE5kkdvlP7DV13
 YI9gDYzHKbq+CKZI=
X-Received: by 2002:a17:906:f109:: with SMTP id
 gv9mr34770339ejb.184.1634638390305; 
 Tue, 19 Oct 2021 03:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFvid4Eecci9W3ogRFxQumZDLSxg53na5UmGuJfm9BN3NFXMQqNBFfkvYs7jA8ElknqDAEHQ==
X-Received: by 2002:a17:906:f109:: with SMTP id
 gv9mr34770322ejb.184.1634638390039; 
 Tue, 19 Oct 2021 03:13:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id e13sm9889571eje.95.2021.10.19.03.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 03:13:09 -0700 (PDT)
Message-ID: <367cc443-7e2a-36e0-b3fb-bf79b2d65b2d@redhat.com>
Date: Tue, 19 Oct 2021 12:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] monitor: Fix find_device_state() for IDs containing
 slashes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211019085711.86377-1-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211019085711.86377-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: damien.hedde@greensocs.com, borntraeger@de.ibm.com, berrange@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/21 10:57, Markus Armbruster wrote:
> Recent commit 6952026120 "monitor: Tidy up find_device_state()"
> assumed the function's argument is "the device's ID or QOM path" (as
> documented for device_del).  It's actually either an absolute QOM
> path, or a QOM path relative to /machine/peripheral/.  Such a relative
> path is a device ID when it doesn't contain a slash.  When it does,
> the function now always fails.  Broke iotest 200, which uses relative
> path "vda/virtio-backend".
> 
> It fails because object_resolve_path_component() resolves just one
> component, not a relative path.
> 
> The obvious function to resolve relative paths is
> object_resolve_path().  It picks a parent automatically.  Too much
> magic, we want to specify the parent.  Create new
> object_resolve_path_at() for that, and use it in find_device_state().
> 
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/qom/object.h   | 12 ++++++++++++
>   qom/object.c           | 11 +++++++++++
>   softmmu/qdev-monitor.c |  8 +-------
>   3 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index faae0d841f..fae096f51c 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1543,6 +1543,18 @@ Object *object_resolve_path(const char *path, bool *ambiguous);
>   Object *object_resolve_path_type(const char *path, const char *typename,
>                                    bool *ambiguous);
>   
> +/**
> + * object_resolve_path_at:
> + * @parent: the object in which to resolve the path
> + * @path: the path to resolve
> + *
> + * This is like object_resolve_path(), except paths not starting with
> + * a slash are relative to @parent.
> + *
> + * Returns: The resolved object or NULL on path lookup failure.
> + */
> +Object *object_resolve_path_at(Object *parent, const char *path);
> +
>   /**
>    * object_resolve_path_component:
>    * @parent: the object in which to resolve the path
> diff --git a/qom/object.c b/qom/object.c
> index 6be710bc40..4f0677cca9 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2144,6 +2144,17 @@ Object *object_resolve_path(const char *path, bool *ambiguous)
>       return object_resolve_path_type(path, TYPE_OBJECT, ambiguous);
>   }
>   
> +Object *object_resolve_path_at(Object *parent, const char *path)
> +{
> +    g_auto(GStrv) parts = g_strsplit(path, "/", 0);
> +
> +    if (*path == '/') {
> +        return object_resolve_abs_path(object_get_root(), parts + 1,
> +                                       TYPE_OBJECT);
> +    }
> +    return object_resolve_abs_path(parent, parts, TYPE_OBJECT);
> +}
> +
>   typedef struct StringProperty
>   {
>       char *(*get)(Object *, Error **);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 89c473cb22..e8a1c7e52a 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -865,15 +865,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>   
>   static DeviceState *find_device_state(const char *id, Error **errp)
>   {
> -    Object *obj;
> +    Object *obj = object_resolve_path_at(qdev_get_peripheral(), id);
>       DeviceState *dev;
>   
> -    if (id[0] == '/') {
> -        obj = object_resolve_path(id, NULL);
> -    } else {
> -        obj = object_resolve_path_component(qdev_get_peripheral(), id);
> -    }
> -
>       if (!obj) {
>           error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                     "Device '%s' not found", id);
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks for the quick fix!

Paolo


