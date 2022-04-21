Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E693A50A380
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:58:23 +0200 (CEST)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYG7-0000j5-1F
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYEN-000850-Pi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYEI-0001gc-5t
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650552975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GE03U5tgF744eJlbzPXe/r3Ozta3kh3SBwYaG39XV0Q=;
 b=g82f1RhL2083UXUzfw615pxezpK5vUWXq2d9lSZy7VoYAE8sCu6/kgHxH66OjvrO+jcP8w
 DWiB40/caDFIK7eLVNLtaVMBwjsqxLyvz0CGyOqAFm/MyTmusVZAEzT1tvcmCx8JuI8BG2
 c7UisPSuW0c8Ym6m+jWAHawitD7R0JU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-NG-DD2S1O1G_16c3jjtLWw-1; Thu, 21 Apr 2022 10:56:13 -0400
X-MC-Unique: NG-DD2S1O1G_16c3jjtLWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F3C6806627;
 Thu, 21 Apr 2022 14:55:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2E0C53B88;
 Thu, 21 Apr 2022 14:55:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E25E621E6A1F; Thu, 21 Apr 2022 16:55:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 02/17] qdev: unplug blocker for devices
References: <cover.1650379269.git.jag.raman@oracle.com>
 <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
Date: Thu, 21 Apr 2022 16:55:50 +0200
In-Reply-To: <26c36cc56c0dd0021aebc9c2b7f9e6dfa1abb67e.1650379269.git.jag.raman@oracle.com>
 (Jagannathan Raman's message of "Tue, 19 Apr 2022 16:44:07 -0400")
Message-ID: <875yn2qydl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, dgilbert@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jagannathan Raman <jag.raman@oracle.com> writes:

> Add blocker to prevent hot-unplug of devices

Why do you need this?  I'm not doubting you do, I just want to read your
reasons here :)

>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
>  hw/core/qdev.c         | 24 ++++++++++++++++++++++++
>  softmmu/qdev-monitor.c |  4 ++++
>  3 files changed, 57 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..1b9fa25e5c 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    GSList *unplug_blockers;
>  };
>  
>  struct DeviceListener {
> @@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
>  void qdev_machine_creation_done(void);
>  bool qdev_machine_modified(void);
>  
> +/*
> + * qdev_add_unplug_blocker: Adds an unplug blocker to a device
> + *
> + * @dev: Device to be blocked from unplug
> + * @reason: Reason for blocking
> + */
> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
> +
> +/*
> + * qdev_del_unplug_blocker: Removes an unplug blocker from a device
> + *
> + * @dev: Device to be unblocked
> + * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
> + *          Used as a handle to lookup the blocker for deletion.
> + */
> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
> +
> +/*
> + * qdev_unplug_blocked: Confirms if a device is blocked from unplug
> + *
> + * @dev: Device to be tested
> + * @reason: Returns one of the reasons why the device is blocked,
> + *          if any
> + *
> + * Returns: true if device is blocked from unplug, false otherwise
> + */
> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
> +
>  /**
>   * GpioPolarity: Polarity of a GPIO line
>   *
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..0806d8fcaa 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
>      return NULL;
>  }
>  
> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
> +{
> +    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
> +}
> +
> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
> +{
> +    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
> +}
> +
> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (dev->unplug_blockers) {
> +        error_propagate(errp, error_copy(dev->unplug_blockers->data));
> +        return true;
> +    }
> +
> +    return false;
> +}

This cites the most recently added blocker as reason.  Your function
comment covers it: "Returns one of the reasons".  Okay.

> +
>  static bool device_get_realized(Object *obj, Error **errp)
>  {
>      DeviceState *dev = DEVICE(obj);
> @@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
>  
>      DeviceState *dev = DEVICE(obj);
>  
> +    g_assert(!dev->unplug_blockers);
> +
>      QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
>          QLIST_REMOVE(ngl, node);
>          qemu_free_irqs(ngl->in, ngl->num_in);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 12fe60c467..9cfd59d17c 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -898,6 +898,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>      HotplugHandlerClass *hdc;
>      Error *local_err = NULL;
>  
> +    if (qdev_unplug_blocked(dev, errp)) {
> +        return;
> +    }
> +
>      if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
>          error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
>          return;


