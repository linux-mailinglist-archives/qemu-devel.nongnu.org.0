Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB820571A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 18:22:10 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnlgX-0006vN-9n
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 12:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnlf2-00061a-Aa
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:20:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnlf0-0001Pf-4w
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592929233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2KA4lnH6brHPMG6QNJigXiGmFwBbXaS1OhKFAk6XS4=;
 b=TbhKO9zkhhY7C0RoaY7lDTaKAj7TBazvtb+Z9VANSU4TLFSb7IpsjSvKAtwHNAQahzb0Bo
 OrmBfX8pk2uZEdrhyxvAInDRcoJaBPsrNEUhmZJwT4cf8V09uvc4aCmYk27xe/z6jr80uE
 PgjmQjVBSZoIkI9v7dgfg9/IJMoBnX0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-F9u9KJduPCeyYHhXD_nNgQ-1; Tue, 23 Jun 2020 12:20:30 -0400
X-MC-Unique: F9u9KJduPCeyYHhXD_nNgQ-1
Received: by mail-wr1-f69.google.com with SMTP id a4so16186679wrp.5
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 09:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2KA4lnH6brHPMG6QNJigXiGmFwBbXaS1OhKFAk6XS4=;
 b=DZVdDtWCy+jRb4R8QzDhNyXxFK8Y+fHocZiW0eA7INH1jizTC2ECcFUm3Kv+DuQyB+
 Od7ZUYTUb7T9dS51Tj1LYXnBHzxJRJxDwjcsVVm6wTR26j5FtJmBn/AEqZliOMT9mdRn
 gJA0P+1jguheFWN1r/mZ1qUV4rQ3vyD2kfAL4Dn5DA6e6Q5318ehib7z3qyGXNfYYMH3
 mN57djgPkE1Fnu78nZAK5hl5JvdQj0q9FmSK1tC5MQrPnw7H4ShgUnQlJ3tagEfF7mqM
 /REUuOtFl6ZJ93OTEQ3VbeU6ifA7qEpfSp8pUyeOIQp/vRQsQWAW8+KMJIN+bAt6R4fC
 JQFw==
X-Gm-Message-State: AOAM531TJvBnScfWrx3IuSoOK9XyIy6vitSkPR3EEDmxxMObGU84sYTW
 FO+M5jO9w87EQFaTKrBDHPhS2r6BJVuuQaY9kEVcpeMJ92Lz4v2s3WTJfa5+OnwTi1BfpQ7sFSc
 gK4vzzG/jeTXXDrk=
X-Received: by 2002:adf:f745:: with SMTP id z5mr27300737wrp.128.1592929228472; 
 Tue, 23 Jun 2020 09:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJAc9sh6/d+oD69IMeHG/u72SkODg51NzZFh6gx1A73VOSsvbsYJ2/uDsf48nOacYBLG+nzQ==
X-Received: by 2002:adf:f745:: with SMTP id z5mr27300710wrp.128.1592929228154; 
 Tue, 23 Jun 2020 09:20:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:24f5:23b:4085:b879?
 ([2001:b07:6468:f312:24f5:23b:4085:b879])
 by smtp.gmail.com with ESMTPSA id x7sm23677624wrr.72.2020.06.23.09.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 09:20:27 -0700 (PDT)
Subject: Re: [PATCH] qom: Allow object_property_add_child() to fail
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
References: <20200623155452.30954-1-eric.auger@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <61763615-bf19-dd46-5c19-54a4df624a4d@redhat.com>
Date: Tue, 23 Jun 2020 18:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200623155452.30954-1-eric.auger@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/20 17:54, Eric Auger wrote:
> object_property_add() does not allow object_property_try_add()
> to gracefully fail as &error_abort is passed as an error handle.
> 
> However such failure can easily be triggered from the QMP shell when,
> for instance, one attempts to create an object with an id that already
> exists:
> 
> For instance, call twice:
> object-add qom-type=memory-backend-ram id=mem1 props.size=1073741824
> and QEMU aborts.
> 
> This behavior is undesired as a user/management application mistake
> in reusing a property ID shouldn't result in loss of the VM and live
> data within.
> 
> This patch introduces two new functions, object_property_add_err() and
> object_property_add_child_err() whose prototype features an error handle.
> object_property_add_child_err() now gets called from user_creatable_add_type.
> This solution was chosen instead of changing the prototype of existing
> functions because the number of existing callers is huge.
> 
> The error now is returned gracefully to the QMP client.
> 
> (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
> {"return": {}}
> (QEMU) object-add qom-type=memory-backend-ram id=mem2  props.size=4294967296
> {"error": {"class": "GenericError", "desc": "attempt to add duplicate property
> 'mem2' to object (type 'container')"}}
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/qom/object.h    | 24 ++++++++++++++++++++++--
>  qom/object.c            | 33 ++++++++++++++++++++++++++++-----
>  qom/object_interfaces.c |  7 +++++--
>  3 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 94a61ccc3f..29652a1563 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1039,7 +1039,7 @@ Object *object_ref(Object *obj);
>  void object_unref(Object *obj);
>  
>  /**
> - * object_property_add:
> + * object_property_add_err:
>   * @obj: the object to add a property to
>   * @name: the name of the property.  This can contain any character except for
>   *  a forward slash.  In general, you should use hyphens '-' instead of
> @@ -1056,10 +1056,22 @@ void object_unref(Object *obj);
>   *   meant to allow a property to free its opaque upon object
>   *   destruction.  This may be NULL.
>   * @opaque: an opaque pointer to pass to the callbacks for the property
> + * @errp: error handle
>   *
>   * Returns: The #ObjectProperty; this can be used to set the @resolve
>   * callback for child and link properties.
>   */
> +ObjectProperty *object_property_add_err(Object *obj, const char *name,
> +                                        const char *type,
> +                                        ObjectPropertyAccessor *get,
> +                                        ObjectPropertyAccessor *set,
> +                                        ObjectPropertyRelease *release,
> +                                        void *opaque, Error **errp);
> +
> +/**
> + * object_property_add: same as object_property_add with
> + * errp hardcoded to &error_abort
> + */
>  ObjectProperty *object_property_add(Object *obj, const char *name,
>                                      const char *type,
>                                      ObjectPropertyAccessor *get,
> @@ -1495,10 +1507,11 @@ Object *object_resolve_path_type(const char *path, const char *typename,
>  Object *object_resolve_path_component(Object *parent, const char *part);
>  
>  /**
> - * object_property_add_child:
> + * object_property_add_child_err:
>   * @obj: the object to add a property to
>   * @name: the name of the property
>   * @child: the child object
> + * @errp: error handle
>   *
>   * Child properties form the composition tree.  All objects need to be a child
>   * of another object.  Objects can only be a child of one object.
> @@ -1512,6 +1525,13 @@ Object *object_resolve_path_component(Object *parent, const char *part);
>   *
>   * Returns: The newly added property on success, or %NULL on failure.
>   */
> +ObjectProperty *object_property_add_child_err(Object *obj, const char *name,
> +                                              Object *child, Error **errp);
> +
> +/**
> + * object_property_add_child: same as object_property_add_child_err with
> + * errp hardcoded to &error_abort
> + */
>  ObjectProperty *object_property_add_child(Object *obj, const char *name,
>                                            Object *child);
>  
> diff --git a/qom/object.c b/qom/object.c
> index 6ece96bc2b..2ec72fae7c 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1182,6 +1182,17 @@ object_property_try_add(Object *obj, const char *name, const char *type,
>      return prop;
>  }
>  
> +ObjectProperty *
> +object_property_add_err(Object *obj, const char *name, const char *type,
> +                        ObjectPropertyAccessor *get,
> +                        ObjectPropertyAccessor *set,
> +                        ObjectPropertyRelease *release,
> +                        void *opaque, Error **errp)
> +{
> +    return object_property_try_add(obj, name, type, get, set, release,
> +                                   opaque, errp);
> +}
> +
>  ObjectProperty *
>  object_property_add(Object *obj, const char *name, const char *type,
>                      ObjectPropertyAccessor *get,
> @@ -1189,7 +1200,7 @@ object_property_add(Object *obj, const char *name, const char *type,
>                      ObjectPropertyRelease *release,
>                      void *opaque)
>  {
> -    return object_property_try_add(obj, name, type, get, set, release,
> +    return object_property_add_err(obj, name, type, get, set, release,
>                                     opaque, &error_abort);
>  }
>  
> @@ -1651,8 +1662,8 @@ static void object_finalize_child_property(Object *obj, const char *name,
>  }
>  
>  ObjectProperty *
> -object_property_add_child(Object *obj, const char *name,
> -                          Object *child)
> +object_property_add_child_err(Object *obj, const char *name,
> +                              Object *child, Error **errp)
>  {
>      g_autofree char *type = NULL;
>      ObjectProperty *op;
> @@ -1661,14 +1672,26 @@ object_property_add_child(Object *obj, const char *name,
>  
>      type = g_strdup_printf("child<%s>", object_get_typename(child));
>  
> -    op = object_property_add(obj, name, type, object_get_child_property, NULL,
> -                             object_finalize_child_property, child);
> +    op = object_property_add_err(obj, name, type, object_get_child_property,
> +                                 NULL, object_finalize_child_property,
> +                                 child, errp);
> +    if (!op) {
> +        goto out;
> +    }
>      op->resolve = object_resolve_child_property;
> +out:
>      object_ref(child);
>      child->parent = obj;
>      return op;
>  }
>  
> +ObjectProperty *
> +object_property_add_child(Object *obj, const char *name,
> +                          Object *child)
> +{
> +    return object_property_add_child_err(obj, name, child, &error_abort);
> +}
> +
>  void object_property_allow_set_link(const Object *obj, const char *name,
>                                      Object *val, Error **errp)
>  {
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index 7e26f86fa6..c7fabda284 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -82,8 +82,11 @@ Object *user_creatable_add_type(const char *type, const char *id,
>      }
>  
>      if (id != NULL) {
> -        object_property_add_child(object_get_objects_root(),
> -                                  id, obj);
> +        object_property_add_child_err(object_get_objects_root(),
> +                                      id, obj, &local_err);
> +        if (local_err) {
> +            goto out;
> +        }
>      }
>  
>      user_creatable_complete(USER_CREATABLE(obj), &local_err);
> 

Queued, thanks.

Paolo


