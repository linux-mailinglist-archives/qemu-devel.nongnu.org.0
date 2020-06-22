Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71C2042A9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 23:28:30 +0200 (CEST)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnTzR-0008L0-5i
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 17:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1jnTyM-0007Yv-J7
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 17:27:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30015
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1jnTyK-0003T3-Ho
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 17:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592861239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=43mzmGnz3vS3tVTssZQJDYYwSd6W/XQ/GVov++ny5P4=;
 b=bLuoUtprpztmeMaUCdeXP39hefFVoMDBrsVEY3yIkFC7bR9nuJ1rfnNBgZsb+TGLuiEUiG
 h0nLOWKWOyi3KkLf2S6Oo99CLVlarpDUyPsenlxbEzgwwB4kiskOZ29EuU/SnqTML9PE33
 mDjxFkdcCS1PTtKG8PBj+4zDb93Ja+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-6YPpKHHfN3e32X9iXm-KfQ-1; Mon, 22 Jun 2020 17:26:05 -0400
X-MC-Unique: 6YPpKHHfN3e32X9iXm-KfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9E5C107ACF3;
 Mon, 22 Jun 2020 21:26:04 +0000 (UTC)
Received: from localhost (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95DEE5DA27;
 Mon, 22 Jun 2020 21:26:01 +0000 (UTC)
Date: Mon, 22 Jun 2020 23:25:59 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 01/22] net/virtio: Fix failover_replug_primary() return
 value regression
Message-ID: <20200622212559.GD18041@jenstp.localdomain>
References: <20200622104250.1404835-1-armbru@redhat.com>
 <20200622104250.1404835-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200622104250.1404835-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 22, 2020 at 12:42:29PM +0200, Markus Armbruster wrote:
>Commit 150ab54aa6 "net/virtio: fix re-plugging of primary device"
>fixed failover_replug_primary() to return false on failure.  Commit
>5a0948d36c "net/virtio: Fix failover error handling crash bugs" broke
>it again for hotplug_handler_plug() failure.  Unbreak it.
>
>Commit 5a0948d36c4cbc1c5534afac6fee99de55245d12
>
>Fixes: 5a0948d36c4cbc1c5534afac6fee99de55245d12
>Cc: Jens Freimann <jfreimann@redhat.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Cc: qemu-stable@nongnu.org
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> hw/net/virtio-net.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

Thanks!

regards,
Jens 


