Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1B40D7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:52:47 +0200 (CEST)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQp0Y-0003US-4n
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQoxR-0000Ta-Pm
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQoxJ-0005V9-Re
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631789363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ouMMcynGOI2wvmOC1sTvuktENt6xe6q92twKz+1Fd8=;
 b=CFWQ0fKF2PLu06N0dRbnoLvynTn+gAqCNRmHXAymDgxwtTiPTVD15Zjht8OalSjgDmaNuH
 fbSDIEb5l5g/KKXh85clQVWZlHH4u4JPmq6L8eBJAftiaAGaDpmaq2CPTAh5KgJUueLKzh
 INEwppdxqXEvb20aPM6cNmXB22fcOtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-LNSHbnefMN-BcD3kc3NC5A-1; Thu, 16 Sep 2021 06:49:22 -0400
X-MC-Unique: LNSHbnefMN-BcD3kc3NC5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C530D362F8;
 Thu, 16 Sep 2021 10:49:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55964196F1;
 Thu, 16 Sep 2021 10:49:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB4AE113865F; Thu, 16 Sep 2021 12:48:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 5/8] qdev: improve find_device_state() to distinguish
 simple not found case
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-6-vsementsov@virtuozzo.com>
Date: Thu, 16 Sep 2021 12:48:58 +0200
In-Reply-To: <20210802185416.50877-6-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 2 Aug 2021 21:54:13 +0300")
Message-ID: <87r1do7q3p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 dim@virtuozzo.com, igor@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We'll need this for realizing qdev_find_child() in the next commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  softmmu/qdev-monitor.c | 48 +++++++++++++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 721dec2d82..0117989009 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -819,7 +819,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>      object_unref(OBJECT(dev));
>  }
>  
> -static DeviceState *find_device_state(const char *id, Error **errp)
> +/*
> + * Returns: 1 when found, @dev set
> + *          0 not found, @dev and @errp untouched
> + *         <0 error, or id is ambiguous, @errp set
> + */
> +static int find_device_state(const char *id, DeviceState **dev, Error **errp)
>  {
>      Object *obj;
>  
> @@ -835,17 +840,16 @@ static DeviceState *find_device_state(const char *id, Error **errp)
>      }
>  
>      if (!obj) {
> -        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> -                  "Device '%s' not found", id);
> -        return NULL;
> +        return 0;
>      }
>  
>      if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
>          error_setg(errp, "%s is not a hotpluggable device", id);
> -        return NULL;
> +        return -EINVAL;
>      }
>  
> -    return DEVICE(obj);
> +    *dev = DEVICE(obj);
> +    return 1;
>  }
>  
>  void qdev_unplug(DeviceState *dev, Error **errp)
> @@ -894,16 +898,25 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>  
>  void qmp_device_del(const char *id, Error **errp)
>  {
> -    DeviceState *dev = find_device_state(id, errp);
> -    if (dev != NULL) {
> -        if (dev->pending_deleted_event) {
> -            error_setg(errp, "Device %s is already in the "
> -                             "process of unplug", id);
> -            return;
> +    int ret;
> +    DeviceState *dev;
> +
> +    ret = find_device_state(id, &dev, errp);
> +    if (ret <= 0) {
> +        if (ret == 0) {
> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> +                      "Device '%s' not found", id);
>          }
> +        return;
> +    }
>  
> -        qdev_unplug(dev, errp);
> +    if (dev->pending_deleted_event) {
> +        error_setg(errp, "Device %s is already in the "
> +                         "process of unplug", id);
> +        return;
>      }
> +
> +    qdev_unplug(dev, errp);
>  }
>  
>  void hmp_device_add(Monitor *mon, const QDict *qdict)
> @@ -925,11 +938,16 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
>  
>  BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
>  {
> +    int ret;
>      DeviceState *dev;
>      BlockBackend *blk;
>  
> -    dev = find_device_state(id, errp);
> -    if (dev == NULL) {
> +    ret = find_device_state(id, &dev, errp);
> +    if (ret <= 0) {
> +        if (ret == 0) {
> +            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> +                      "Device '%s' not found", id);
> +        }
>          return NULL;
>      }

Awkward.

Before, find_device_state() either finds something (and returns it) or
doesn't (and sets @errp).

Afterward, it can fail to find in two ways, and only one of it sets
@errp.  The existing callers laboriously fuse the two back together.
The next commit adds a caller that doesn't.

Failure modes that need to be handled differently are often the result
of a function doing too much.  Let's have a closer look at this one
before the patch:

    static DeviceState *find_device_state(const char *id, Error **errp)
    {
        Object *obj;

        if (id[0] == '/') {
            obj = object_resolve_path(id, NULL);

This interprets @id as a QOM path, and tries to resolve it.

On failure, @obj becomes NULL.  On success, it points to an object of
arbitrary type.

        } else {
            char *root_path = object_get_canonical_path(qdev_get_peripheral());
            char *path = g_strdup_printf("%s/%s", root_path, id);

            g_free(root_path);
            obj = object_resolve_path_type(path, TYPE_DEVICE, NULL);
            g_free(path);

This interprets @id as qdev ID, maps it to a QOM path, and tries to
resolve it to a TYPE_DEVICE.  Fails when the path doesn't resolve, and
when it resolves to something that isn't a TYPE_DEVICE.  The latter
can't happen as long as we put only devices under /machine/peripheral/.

On failure, @obj becomes NULL.  On success, it points to a TYPE_DEVICE
object.

        }

        if (!obj) {
            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                      "Device '%s' not found", id);
            return NULL;
        }

        if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
            error_setg(errp, "%s is not a hotpluggable device", id);
            return NULL;
        }

Unclean.

If we somehow ended up with a non-device /machine/peripheral/foo, then
find_device_state("foo", errp) would fail the first way, but
find_device_state("/machine/peripheral/foo", errp) would fail the second
way.  They should fail the exact same way instead.

        return DEVICE(obj);
    }

Better:

    static DeviceState *find_device_state(const char *id, Error **errp)
    {
        Object *obj;
        DeviceState *dev;

        if (id[0] == '/') {
            obj = object_resolve_path(id, NULL);
        } else {
            obj = object_resolve_path_component(qdev_get_peripheral(), id);
        }

        if (!obj) {
            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                      "Device '%s' not found", id);
            return NULL;
        }

        dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
        if (!dev) {
            error_setg(errp, "%s is not a hotpluggable device", id);
            return NULL;
        }

        return dev;
    }

I'll post this as a cleanup patch.

Note that this function does two things, one after the other, namely
1. resolve a "qdev ID or qom path" string, and 2. convert to
TYPE_DEVICE, with error checking.

Factor out the core of 1. into its own helper resolve_id_or_qom_path(),
and the next commit can do something like

    obj = resolve_id_or_qom_path(parent_id);
    if (!obj) {
        return 0;
    }

    dev = object_dynamic_cast(obj, TYPE_DEVICE);
    if (!dev) {
        error_setg(errp, ...);
        return -EINVAL;
    }


