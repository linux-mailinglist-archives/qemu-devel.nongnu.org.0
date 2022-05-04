Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2DC519EB7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:59:28 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDfD-0000Oj-U5
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmCwP-0005Qq-Mk
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:13:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmCwN-0003ga-9r
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eyMPN12soflHnEnXOPwVLYlvLi7x5qC8YJIFGzfYcpI=;
 b=hnQEVH+g/kFVAN2vhfNmGTbHuSYblhnCdXCzhhBKGB+BWJpeBThxMa60lYI7KKDyMa/Cww
 re3b+4NKju2OgvgDmsJZ8P6rHJwDlvKK23Jcl0J49xqHhjZ9TJdqSuVVjW8PzBGXpOW1U9
 A+R1WsssbrP/H9xTUr772+5wl+ozx/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-INuWpOIcNMafPagYgngD-Q-1; Wed, 04 May 2022 07:13:04 -0400
X-MC-Unique: INuWpOIcNMafPagYgngD-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4A7F185A7B2;
 Wed,  4 May 2022 11:13:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A7A40314E;
 Wed,  4 May 2022 11:13:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48A7E21E68BC; Wed,  4 May 2022 13:13:02 +0200 (CEST)
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
Subject: Re: [PATCH v9 02/17] qdev: unplug blocker for devices
References: <cover.1651586203.git.jag.raman@oracle.com>
 <01e8950f954c291acd74c9caf1d2016e898cd80c.1651586203.git.jag.raman@oracle.com>
Date: Wed, 04 May 2022 13:13:02 +0200
In-Reply-To: <01e8950f954c291acd74c9caf1d2016e898cd80c.1651586203.git.jag.raman@oracle.com>
 (Jagannathan Raman's message of "Tue, 3 May 2022 10:16:43 -0400")
Message-ID: <87ilql7dq9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jagannathan Raman <jag.raman@oracle.com> writes:

> Add blocker to prevent hot-unplug of devices
>
> TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
> PCIDevice on which it depends. If the attached PCIDevice gets removed
> while the server in use, it could cause it crash. To prevent this,
> TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.

Appreciate the explanation :)

>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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

Use /** here like we do in the other function comments nearby.

In case you're curious: it's GTK-Doc format.  It's intended for
generating documentation from doc comments.  Which we don't do, and
perhaps never will.  But let's be locally consistent.

> + * qdev_add_unplug_blocker: Adds an unplug blocker to a device

Recommend imperative mood for function comments: "Add an unplug
blocker to a device".

More of the same below.

[...]


