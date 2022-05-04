Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2550519E7D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:48:50 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDUw-0004VW-1i
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDP0-0001QD-Fz
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDOy-0005YA-OO
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651664560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eWuhooiqo+OdXyRXh36mUIm/0aC33heVz+jzAbfgpIA=;
 b=C/Ux0DZSMxDgmcDdaNlqZRvvlvJk9b/gmaQObBGZPt2ugifzmIEbJsj+/ho/B/1ikwy64g
 QD07WXeFcWMctFQ93vawXbtPDnI8ijvf58P84eGUutn7X6PTVXfnM8IBV/Ju+oon3by9Fl
 Hx9sppBlwODoAOu8+kWMQRZ14qkz0BQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-Cjt_VEHJN8qSRPQQilH3QA-1; Wed, 04 May 2022 07:42:36 -0400
X-MC-Unique: Cjt_VEHJN8qSRPQQilH3QA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86AC3811E76;
 Wed,  4 May 2022 11:42:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A698413721;
 Wed,  4 May 2022 11:42:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D03DA21E68BC; Wed,  4 May 2022 13:42:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  mst@redhat.com,
 f4bug@amsat.org,  pbonzini@redhat.com,  marcandre.lureau@redhat.com,
 thuth@redhat.com,  bleal@redhat.com,  berrange@redhat.com,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,  eblake@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  imammedo@redhat.com,
 peterx@redhat.com,  john.levon@nutanix.com,  thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com,  john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 10/17] vfio-user: run vfio-user context
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
Date: Wed, 04 May 2022 13:42:33 +0200
In-Reply-To: <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 (Jagannathan Raman's message of "Tue, 3 May 2022 10:16:51 -0400")
Message-ID: <877d717cd2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jagannathan Raman <jag.raman@oracle.com> writes:

> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qapi/misc.json            |  30 +++++++++++
>  hw/remote/vfio-user-obj.c | 102 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/misc.json b/qapi/misc.json
> index b83cc39029..fa49f2876a 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -553,3 +553,33 @@
>  ##
>  { 'event': 'RTC_CHANGE',
>    'data': { 'offset': 'int', 'qom-path': 'str' } }
> +
> +##
> +# @VFU_CLIENT_HANGUP:
> +#
> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
> +# communication channel
> +#
> +# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object
> +#
> +# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM tree
> +#
> +# @dev-id: ID of attached PCI device
> +#
> +# @dev-qom-path: path to attached PCI device in the QOM tree

I'm still unsure what kind(s) of ID @vfu-id and @dev-id are.  See below.

> +#
> +# Since: 7.1
> +#
> +# Example:
> +#
> +# <- { "event": "VFU_CLIENT_HANGUP",
> +#      "data": { "vfu-id": "vfu1",
> +#                "vfu-qom-path": "/objects/vfu1",
> +#                "dev-id": "sas1",
> +#                "dev-qom-path": "/machine/peripheral/sas1" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> +#
> +##
> +{ 'event': 'VFU_CLIENT_HANGUP',
> +  'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
> +            'dev-id': 'str', 'dev-qom-path': 'str' } }
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 3ca6aa2b45..3a4c6a9fa0 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -27,6 +27,9 @@
>   *
>   * device - id of a device on the server, a required option. PCI devices
>   *          alone are supported presently.
> + *
> + * notes - x-vfio-user-server could block IO and monitor during the
> + *         initialization phase.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -40,11 +43,14 @@
>  #include "hw/remote/machine.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-sockets.h"
> +#include "qapi/qapi-events-misc.h"
>  #include "qemu/notify.h"
> +#include "qemu/thread.h"
>  #include "sysemu/sysemu.h"
>  #include "libvfio-user.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "qemu/timer.h"
>  
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -86,6 +92,8 @@ struct VfuObject {
>      PCIDevice *pci_dev;
>  
>      Error *unplug_blocker;
> +
> +    int vfu_poll_fd;
>  };
>  
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> @@ -164,6 +172,76 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
>      vfu_object_init_ctx(o, errp);
>  }
>  
> +static void vfu_object_ctx_run(void *opaque)
> +{
> +    VfuObject *o = opaque;
> +    const char *vfu_id;
> +    char *vfu_path, *pci_dev_path;
> +    int ret = -1;
> +
> +    while (ret != 0) {
> +        ret = vfu_run_ctx(o->vfu_ctx);
> +        if (ret < 0) {
> +            if (errno == EINTR) {
> +                continue;
> +            } else if (errno == ENOTCONN) {
> +                vfu_id = object_get_canonical_path_component(OBJECT(o));
> +                vfu_path = object_get_canonical_path(OBJECT(o));

Hmm.  @vfu_id is always the last component of @vfu_path.  Why do we need
to send both?

> +                g_assert(o->pci_dev);
> +                pci_dev_path = object_get_canonical_path(OBJECT(o->pci_dev));
> +                qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
> +                                                  o->device, pci_dev_path);

Where is o->device set?  I'm asking because I it must not be null here,
and that's not locally obvious.

> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> +                o->vfu_poll_fd = -1;
> +                object_unparent(OBJECT(o));
> +                g_free(vfu_path);
> +                g_free(pci_dev_path);
> +                break;
> +            } else {
> +                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
> +                                 o->device, strerror(errno));
> +                break;
> +            }
> +        }
> +    }
> +}

[...]


