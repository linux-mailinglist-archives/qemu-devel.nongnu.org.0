Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECC429890
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:02:47 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2Ra-0007bz-Ia
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma2Q9-0006lW-RA
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma2Q8-0001el-6f
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633986074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSLtFg4jULFS1pwaRKMHdtVtdUlqu82SJbCkOUald3Y=;
 b=OCtG7411Sw3RDE8hFjg7jn8MZ8YsOWVN65HhqSUiiUO6MtL7z+y4lK2JPCaAFwtzFzyAZk
 v7a/4J1G01kGH8LPQt7NUPUVLKQtJJXGB8SQpm/nrzltBYiNnnjoF/GYBDIPqm+bkKltNy
 cvZLeDzfXyRNuOlFaCScdFWABOn0gAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-1yaYAXEWP5Ofxx5IeAVoKg-1; Mon, 11 Oct 2021 17:01:09 -0400
X-MC-Unique: 1yaYAXEWP5Ofxx5IeAVoKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7629824FB3;
 Mon, 11 Oct 2021 21:01:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33CA260BE5;
 Mon, 11 Oct 2021 21:00:27 +0000 (UTC)
Date: Mon, 11 Oct 2021 16:00:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 09/15] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Message-ID: <20211011210025.kq4qjwn7kzfcwwl5@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-10-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-10-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 vsementsov@virtuozzo.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 03:34:36PM +0200, Kevin Wolf wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
> 
> qdev_set_id() is mostly used when the user adds a device (using
> -device cli option or device_add qmp command). This commit adds
> an error parameter to handle the case where the given id is
> already taken.
> 
> Also document the function and add a return value in order to
> be able to capture success/failure: the function now returns the
> id in case of success, or NULL in case of failure.
> 
> The commit modifies the 2 calling places (qdev-monitor and
> xen-legacy-backend) to add the error object parameter.
> 
> Note that the id is, right now, guaranteed to be unique because
> all ids came from the "device" QemuOptsList where the id is used
> as key. This addition is a preparation for a future commit which
> will relax the uniqueness.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

> +++ b/softmmu/qdev-monitor.c
> @@ -593,22 +593,34 @@ static BusState *qbus_find(const char *path, Error **errp)
>  }
>  
>  /* Takes ownership of @id, will be freed when deleting the device */
> -void qdev_set_id(DeviceState *dev, char *id)
> +const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
>  {
> -    if (id) {
> -        dev->id = id;
> -    }
> +    ObjectProperty *prop;
>  
> -    if (dev->id) {
> -        object_property_add_child(qdev_get_peripheral(), dev->id,
> -                                  OBJECT(dev));
> +    assert(!dev->id && !dev->realized);
> +
> +    /*
> +     * object_property_[try_]add_child() below will assert the device
> +     * has no parent
> +     */
> +    if (id) {
> +        prop = object_property_try_add_child(qdev_get_peripheral(), id,
> +                                             OBJECT(dev), NULL);
> +        if (prop) {
> +            dev->id = id;
> +        } else {
> +            error_setg(errp, "Duplicate device ID '%s'", id);
> +            return NULL;

id is not freed on this error path...

> +        }
>      } else {
>          static int anon_count;
>          gchar *name = g_strdup_printf("device[%d]", anon_count++);
> -        object_property_add_child(qdev_get_peripheral_anon(), name,
> -                                  OBJECT(dev));
> +        prop = object_property_add_child(qdev_get_peripheral_anon(), name,
> +                                         OBJECT(dev));
>          g_free(name);
>      }
> +
> +    return prop->name;
>  }
>  
>  DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
> @@ -691,7 +703,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>          }
>      }
>  
> -    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
> +    /*
> +     * set dev's parent and register its id.
> +     * If it fails it means the id is already taken.
> +     */
> +    if (!qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp)) {
> +        goto err_del_dev;

...nor on this, which means the g_strdup() leaks on failure.

> +    }
>  
>      /* set properties */
>      if (qemu_opt_foreach(opts, set_property, dev, errp)) {
> -- 
> 2.31.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


